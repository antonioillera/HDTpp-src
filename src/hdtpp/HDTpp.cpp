#include "HDTpp.hpp"
#include <HDTVocabulary.hpp>

#include "../hdt/HDTFactory.hpp"
#include "../header/PlainHeader.hpp"
#include "../dictionary/FourSectionDictionary.hpp"
#include "../util/fileUtil.hpp"
#include "../util/StopWatch.hpp"
#include "../adjacencylist/AL.hpp"

#define TDENS 128
#define CODER coder::elias_delta

namespace hdt {

HDTpp::HDTpp(HDT *hdt)
{
    string rdftypeLiteral = "http://www.w3.org/1999/02/22-rdf-syntax-ns#type";
    header = hdt->getHeader();
    dictionary = hdt->getDictionary();
    triples = dynamic_cast<BitmapTriples*>(hdt->getTriples());
    triplespp = new BitmapTriplespp();

    idRdfType = dictionary->stringToId(rdftypeLiteral, PREDICATE);
    extractFamilies();
}


HDTpp::HDTpp(const char *file, ProgressListener *listener){
    DecompressStream stream(file);
    istream *in = stream.getStream();
    if(!in->good()){
        throw "Error opening file to load HDT++.";
    }
    this->loadFromHDTpp(*in, listener);
    stream.close();
}

void HDTpp::loadFromHDTpp(std::istream & input, ProgressListener *listener){
    try {
        ControlInformation controlInformation;
        IntermediateListener iListener(listener);
        controlInformation.load(input);
        std::string hdtFormat = controlInformation.getFormat();
        if(hdtFormat!=HDTVocabulary::HDT_CONTAINER) {
            throw "This software cannot open this version of HDT++ File.";
        }

        // Load header
        cout<<"load header"<<endl;
        iListener.setRange(0,5);
        controlInformation.load(input);
        header = HDTFactory::readHeader(controlInformation);
        header->load(input, controlInformation, &iListener);

        //Load Dictionary.
        cout<<"load dictionary"<<endl;
        iListener.setRange(5, 60);
        controlInformation.load(input);
        dictionary = HDTFactory::readDictionary(controlInformation);
        dictionary->load(input, controlInformation, &iListener);

        // Load Triples
        cout<<endl<<"Load triples"<<endl;
        iListener.setRange(60,100);
        triplespp = new BitmapTriplespp();
        triplespp->setnPredicados(dictionary->getMaxPredicateID());
        triplespp->load(input);
    } catch (const char *ex) {
        cout << "Exception loading HDT++: " << ex;
        deleteComponents();
        createComponents();
        throw ex;
    }
}


void HDTpp::extractFamilies(){
    map<string, Family*> predicateFamilies;
    int_vector<> *PermS_flat = new int_vector<>(dictionary->getNsubjects());
    vector <unsigned int> seqFamilyObjects;
    vector < vector <unsigned int> > FamiliesObjects;
    vector <unsigned char> bmFamilyObjects; //Objects per family
    vector < vector <unsigned char> > bmFamiliesObjects;

    unsigned int idFamily=0;

    for (unsigned int s=1; s<=dictionary->getNsubjects(); s++){
        string familyKey = "";
        seqFamilyObjects.clear();
        bmFamilyObjects.clear();
        Family f;
        TripleID t=TripleID(s,0,0);
        IteratorTripleID *it = triples->search(t);
        unsigned int pant=0;
        while (it->hasNext()) {
            TripleID *tid = it->next();
            unsigned int p = tid->getPredicate();
            if (p!=idRdfType){
                // Predicate is not rdf:type
                unsigned int o = tid->getObject();
                seqFamilyObjects.push_back(o);
                if (p > pant){
                    f.idPredicates.push_back(p);
                    char predStr [33];
                    snprintf(predStr, sizeof(predStr), "%d", p);
                    familyKey = familyKey + predStr + "#";
                    //Cambio de lista
                    if (pant!=0) bmFamilyObjects.push_back(1);
                } else{
                    bmFamilyObjects.push_back(0);
                }
                pant=p;
            }else{
                // RDF:Types of this family
                f.idRdfTypes.push_back(tid->getObject());
            }
        }

        bmFamilyObjects.push_back(1);
        delete it;
        it=NULL;

        // Family ha no types
        size_t ntiposF = f.idRdfTypes.size();
        if (ntiposF==0) f.idRdfTypes.push_back(0);

        //Family has no predicates
        if (familyKey=="") familyKey="0";

        familyKey= familyKey+"%";
        for (size_t i=0; i<ntiposF; i++){
            //familyKey looks like P1#P2#....Pn#%T1#T2#...Tn#
           char objStr [33];
            snprintf(objStr, sizeof(objStr), "%d", f.idRdfTypes[i]);
            familyKey = familyKey + objStr + "#";
        }
        map<string,Family*>::iterator it2 = predicateFamilies.find(familyKey);
        if(it2 != predicateFamilies.end()){
           FamiliesObjects[it2->second->idFamily-1].insert(FamiliesObjects[it2->second->idFamily-1].end(), seqFamilyObjects.begin(), seqFamilyObjects.end());
           bmFamiliesObjects[it2->second->idFamily-1].insert(bmFamiliesObjects[it2->second->idFamily-1].end(), bmFamilyObjects.begin(), bmFamilyObjects.end());
           (*PermS_flat)[s-1]=it2->second->idFamily-1;
           it2->second->nSubjects++;
        } else {
            idFamily++;
            Family *ptrF = new Family();
            ptrF->idPredicates=f.idPredicates;
            ptrF->idRdfTypes=f.idRdfTypes;
            ptrF->idFamily=idFamily;
            FamiliesObjects.push_back(seqFamilyObjects);
            bmFamiliesObjects.push_back(bmFamilyObjects);
            predicateFamilies.insert(std::pair<string,Family*>(familyKey,ptrF));
            (*PermS_flat)[s-1]=idFamily-1;
        }
    }
    seqFamilyObjects.clear();
    bmFamilyObjects.clear();

    util::bit_compress(*PermS_flat);


    //Reorganizing by idFamily en el vector
    vFamilias.resize(idFamily);
    for (std::map<string,Family*>::iterator it=predicateFamilies.begin(); it!=predicateFamilies.end(); ++it){
        vFamilias[it->second->idFamily-1]=it->second;
    }
    predicateFamilies.clear();

    delete triples;
    triples=NULL;

    triplespp->setPermS_flat(PermS_flat);
    cout<<endl<<"PermS created"<<endl;
    setTypes();
    cout<<"Types created"<<endl;
    setFamilies();
    cout<<"Families created"<<endl;
    setPermO(&FamiliesObjects, &bmFamiliesObjects);
    cout<<"PermO created"<<endl;
}

void HDTpp::setTypes(){
    //ficticious element at the beginning
    bit_vector *bmTypes_flat = new bit_vector(1,1);
    int_vector<> *seqTypes_flat = new int_vector<>(1,0);
    for (size_t f=0; f<vFamilias.size(); f++){
        //RDF:Types of current family
        size_t nTypesF=vFamilias[f]->idRdfTypes.size();
        for (size_t i=0; i<nTypesF; i++){
            size_t s = seqTypes_flat->size();
            seqTypes_flat->resize(s+1);
            bmTypes_flat->resize(s+1);
            (*seqTypes_flat)[s]=vFamilias[f]->idRdfTypes[i];
            if (i==nTypesF-1) (*bmTypes_flat)[s]=1;
            else (*bmTypes_flat)[s]=0;
        }
    }
    util::bit_compress(*seqTypes_flat);
    AL *Types_flat = new AL(seqTypes_flat,bmTypes_flat);
    triplespp->setTypes_flat(Types_flat);
}

void HDTpp::setFamilies(){
    int_vector<> *seqFamilies_flat = new int_vector<>();
    bit_vector *bmFamilies_flat = new bit_vector();
    for (unsigned int f=0; f<vFamilias.size(); f++){
        // Number of predicates of the current family
        size_t nPredicatesF = vFamilias[f]->idPredicates.size();
        if (nPredicatesF==0){
            //No predicates (Only RDF:Type ones)
            size_t s = bmFamilies_flat->size();
            bmFamilies_flat->resize(s+1);
            seqFamilies_flat->resize(s+1);
            (*bmFamilies_flat)[s]=1;
            (*seqFamilies_flat)[s]=0;
        } else {
            for (size_t i=1; i<=nPredicatesF; i++){
                unsigned int idPredicado = vFamilias[f]->idPredicates[i-1];
                size_t s = bmFamilies_flat->size();
                seqFamilies_flat->resize(s+1);
                bmFamilies_flat->resize(s+1);
                (*seqFamilies_flat)[s]=idPredicado;
                if (i == nPredicatesF) (*bmFamilies_flat)[s]=1;
                else (*bmFamilies_flat)[s]=0;
            }
        }
    }
    util::bit_compress(*seqFamilies_flat);
    AL *Families_flat = new AL(seqFamilies_flat, bmFamilies_flat);
    triplespp->setFamilies_flat(Families_flat);
}

void HDTpp::setPermO(vector < vector <unsigned int> > *fo, vector < vector <unsigned char> > *bmfo){
    vector < map < unsigned int,unsigned int > > objectMapping(dictionary->getNpredicates()); //Mapping between object local and global IDs
    vector<unsigned int> So_globalIds;
    bit_vector bmOF, bmOS;

    for (unsigned int f=0; f<vFamilias.size(); f++){
        // Number of subjects, predicates and types per family
        size_t nPredicatesF = vFamilias[f]->idPredicates.size();
        bit_vector bitmapObjetosF_sdsl = bit_vector(bmfo->at(f).size());
        for (unsigned int i=0; i<bmfo->at(f).size(); i++){
            bitmapObjetosF_sdsl[i] = bmfo->at(f)[i];
        }

        select_support_mcl<1,1> b_sel1(&bitmapObjetosF_sdsl);
        size_t pant=0;
        size_t index = bmOS.size();

        for (size_t i=1; i<=nPredicatesF; i++){
            unsigned int idPredicado = vFamilias[f]->idPredicates[i-1];
            //El enéimo (n) "1" de la lista de objetos corresponde al primer sujeto, desde n hasta 2*n es el segundo asÃ­ sucesivamente
            // Siendo n el número de predicados de los que consta la familia

            //for (size_t j=0; j<fs->at(f); j++){
            for (size_t j=0; j<vFamilias[f]->nSubjects; j++){
                //Iteramos por los usjetos de la familia
                //Dentro de esa sublista cada "1" corresponderá al fin de objetos de cada predicado
                //Bitmap para objetos separados por predicados

                size_t posicionInicial = 0;
                size_t n_uno = i+(nPredicatesF*j)-1;
                if (n_uno>0) posicionInicial = b_sel1(n_uno)+1;

                size_t posicionFinal = 0;
                n_uno = i+(nPredicatesF*j);
                if (n_uno>0) posicionFinal = b_sel1(n_uno);
                bmOS.resize(bmOS.size()+posicionFinal-posicionInicial+1);
                So_globalIds.resize(So_globalIds.size()+posicionFinal-posicionInicial+1);
                for (size_t k=posicionInicial; k<=posicionFinal; k++){
                    //unsigned int idObjeto = idObjetos[f][k];
                    unsigned int idObjeto = (fo->at(f))[k];

                    So_globalIds[index]=idObjeto;
                    bmOS[index]=bitmapObjetosF_sdsl[k];
                    index++;
                    //Renombrar los objetos localmente en base a los predicados
                    objectMapping[idPredicado-1].insert(std::pair<unsigned int, unsigned int>(idObjeto,0));
                    if (i > pant) {
                        if  (pant!=0){
                            bmOF.resize(bmOF.size()+1);
                            bmOF[bmOF.size()-1]=1;
                        }
                        pant=i;
                    } else{
                         bmOF.resize(bmOF.size()+1);
                         bmOF[bmOF.size()-1]=0;
                    }
                }
            }
            pant=i;
        }

        //Si la familia no tiene predicados (Solo tiene tipo), no lo almacenamos
        if (nPredicatesF >0){
            bmOF.resize(bmOF.size()+1);
            bmOF[bmOF.size()-1]=1;
        }
        //Free memory
        bmfo->at(f).clear();
        fo->at(f).clear();
        vFamilias[f]->idPredicates.clear();
        vFamilias[f]->idRdfTypes.clear();
        vector <unsigned char>().swap(bmfo->at(f));
        vector <unsigned int>().swap(fo->at(f));
        vector <unsigned int>().swap(vFamilias[f]->idPredicates);
        vector <unsigned int>().swap(vFamilias[f]->idRdfTypes);
        delete vFamilias[f];
    }

    fo->clear();
    bmfo->clear();
    vector <Family*>().swap(vFamilias);
    triplespp->setnPredicados(dictionary->getNpredicates());
    vector < vector <unsigned int> > vObjsEnPredicados(dictionary->getNobjects());
    int_vector<> *seqPermO_flat = new int_vector<>();
    bit_vector *bmPermO_flat = new bit_vector();

    for (size_t i = 0; i < dictionary->getNpredicates(); i++){
        if (i!=idRdfType-1){
            unsigned int idObjetoLocal=0;
            for (std::map<unsigned int ,unsigned int>::iterator it=objectMapping[i].begin(); it!=objectMapping[i].end(); ++it){
                //Por eficiencia comenzamos el contador de objetos locales desde 0, no desde 1
                it->second=idObjetoLocal;
                unsigned int idObjeto=it->first;
                if (vObjsEnPredicados[idObjeto-1].size()==0){
                    vector <unsigned int> seqPredicados(1,i+1);
                    vObjsEnPredicados[idObjeto-1]=seqPredicados;
                } else {
                    vObjsEnPredicados[idObjeto-1].push_back(i+1);
                }
                idObjetoLocal++;
            }
        }
    }

    size_t pos=0;
    for (size_t i=0; i<vObjsEnPredicados.size(); i++){
        if (vObjsEnPredicados[i].size()>0){
            size_t s = vObjsEnPredicados[i].size();
            seqPermO_flat->resize(seqPermO_flat->size()+s);
            bmPermO_flat->resize(bmPermO_flat->size()+s);
            for (size_t j=0; j<s; j++){
                (*seqPermO_flat)[pos]=vObjsEnPredicados[i][j];
                if (j==s-1){
                    (*bmPermO_flat)[pos]=1;
                } else{
                    (*bmPermO_flat)[pos]=0;
                }
                pos++;
            }
        } else {
            //Objetos Tipo. Hay que tenerlos en cuenta para descomprimir
            seqPermO_flat->resize(seqPermO_flat->size()+1);
            bmPermO_flat->resize(bmPermO_flat->size()+1);
            (*seqPermO_flat)[pos]=0;
            (*bmPermO_flat)[pos]=1;
            pos++;
        }
        //Free mem
        vObjsEnPredicados[i].clear();
        vector <unsigned int>().swap(vObjsEnPredicados[i]);
    }
    vector < vector <unsigned int> >().swap(vObjsEnPredicados);
    util::bit_compress(*seqPermO_flat);
    AL *PermO_flat = new AL(seqPermO_flat, bmPermO_flat);
    triplespp->setPermO_flat(PermO_flat);

    setObjectsSequences(&objectMapping, &So_globalIds, &bmOF, &bmOS);

    cout<<"Objects sequences created"<<endl;
}

void HDTpp::setObjectsSequences(vector<map<unsigned int, unsigned int> > *m,  vector<unsigned int> *o, bit_vector *bOF, bit_vector *bOS){
    vector <AL *> AdjSO_flat(dictionary->getNpredicates());
    vector < int_vector<>* > So_flat;
    vector <bit_vector*> Bo_flat;
    //vector <bit_vector*> Bf_flat(nPred);

    for (size_t i = 0; i < dictionary->getNpredicates(); i++){
        int_vector<> *so = new int_vector<>();
        bit_vector *bo = new bit_vector();
        //bit_vector *bf = new bit_vector();
        if (i==idRdfType-1){
            so->resize(1);
            bo->resize(1);
            (*so)[0]=0;
            (*bo)[0]=1;
       }
        So_flat.push_back(so);
        Bo_flat.push_back(bo);
  }
  size_t j=0;
  for (size_t i=0; i<triplespp->getFamilies_flat()->size(); i++){
        unsigned int idPredicado = triplespp->getFamilies_flat()->access(i);
        if (idPredicado!=0){
            //if idPredicado=0 => Family with no predicates
            do{
                unsigned int idObjetoLocal = m->at(idPredicado-1).find(o->at(j))->second;
                size_t s =So_flat[idPredicado-1]->size();
                So_flat[idPredicado-1]->resize(s+1);
                (*So_flat[idPredicado-1])[s]=idObjetoLocal;
                //Bf_flat[idPredicado-1]->resize(s+1);
                //(*Bf_flat[idPredicado-1])[s]=bitmapZNew_sdsl[j];
                Bo_flat[idPredicado-1]->resize(s+1);
                (*Bo_flat[idPredicado-1])[s]=(*bOS)[j];
                j++;
            } while ((*bOF)[j-1]==0);
        }
    }
    m->clear();
    o->clear();
    util::clear(*bOF);
    util::clear(*bOS);
    for (size_t i=0; i<So_flat.size(); i++){
        util::bit_compress(*So_flat[i]);
        AdjSO_flat[i] = new AL(So_flat[i], Bo_flat[i]);
    }
    triplespp->setAdjSO_flat(AdjSO_flat);
}

void HDTpp::saveToHDTpp(const char *fileName, ProgressListener *listener)
{
    try {
        ofstream out(fileName, ios::binary | ios::out | ios::trunc);
        if(!out.good()){
            throw "Error opening file to save HDT++.";
        }
        this->saveToHDTpp(out, listener);
        out.close();
    } catch (const char *ex) {
        // Fixme: delete file if exists.
        throw ex;
    }
}

void HDTpp::saveToHDTpp(std::ostream & output, ProgressListener *listener)
{
    saveHeaderToHDTpp(output);
    saveDictionaryToHDTpp(output);
    saveTriplesToHDTpp(output);
}

void HDTpp::saveHeaderToHDTpp(std::ostream & output, ProgressListener *listener)
{
    ControlInformation controlInformation;
    IntermediateListener iListener(listener);
    controlInformation.clear();
    controlInformation.setType(GLOBAL);
    controlInformation.setFormat(HDTVocabulary::HDT_CONTAINER);
    controlInformation.save(output);
    controlInformation.clear();
    controlInformation.setType(HEADER);
    iListener.setRange(0,100);
    header->save(output, controlInformation, &iListener);
}

void HDTpp::saveDictionaryToHDTpp(std::ostream & output, ProgressListener *listener)
{
    ControlInformation controlInformation;
    IntermediateListener iListener(listener);
    controlInformation.clear();
    controlInformation.setType(DICTIONARY);
    iListener.setRange(5,70);
    dictionary->save(output, controlInformation, &iListener);

}

void HDTpp::saveTriplesToHDTpp(std::ostream & output, ProgressListener *listener)
{
    ControlInformation controlInformation;
    IntermediateListener iListener(listener);
    controlInformation.clear();
    controlInformation.setType(TRIPLES);
    iListener.setRange(70,100);
    triplespp->save(output);
}


void HDTpp::saveToRDF(RDFSerializer &serializer)
{
    try {
        serializer.serialize(triplespp, dictionary);
    } catch (const char *e) {
        throw e;
    } catch (char *e) {
        throw e;
    }

}

void HDTpp::decompress() {
        /*
         *
         *  JUST FOR TESTING PURPOSES
         *
         */

        Families *families = triplespp->getFamilies();
        PermS *permS = triplespp->getPermS();
        Types *types = triplespp->getTypes();
        PermO *permO = triplespp->getPermO();
        AdjSO *adjSO = triplespp->getAdjSO();
        uint nFamilias = families->getNumberOfFamilies();
        //uint nPredicados = dictionary->getMaxPredicateID();

        cout<<endl<<"Decompress starting..."<<endl;
        StopWatch sw;
        //cout<<*types->getTypes()<<endl;
        for (size_t p=1; p<=dictionary->getNpredicates(); p++){
           // Families where predicate "p" is
           size_t nFamiliesInPredicate = families->getNumberOfFamilies(p);
           if (nFamiliesInPredicate==0){

               // If predicate does not belong to any family -> rdf:type
               for (size_t idFamily=1; idFamily<=nFamilias; idFamily++){
                   if (types->hasTypes(idFamily)){
                       permS->getSubjects(idFamily);
                       while (permS->hasMoreSubjects()){
                           uint idSubject = permS->nextSubject();
                           types->getTypes(idFamily);
                           while (types->hasMoreTypes()){
                                unsigned int type = types->nextType();
                                /*std::stringstream ss;
                                ss<<idSubject<<"-"<<p<<"-"<<type<<endl;
                                std::string text=ss.str();
                                out<<text;*/
                           }
                       }
                   }
               }
           } else {
               size_t z = 0;
               for (uint f=1; f<=nFamiliesInPredicate; f++){
                   unsigned int idFamily = families->access(p,f-1);
                   permS->getSubjects(idFamily);
                   while (permS->hasMoreSubjects()){
                       uint idSubject = permS->nextSubject();
                       do{
                            unsigned int idLocalObject = adjSO->access(p,z)+1;
                            unsigned int idGlobalObject = permO->getDictID(p,idLocalObject);
                            z++;
                            /*std::stringstream ss;
                            ss<<idSubject<<"-"<<p<<"-"<<idGlobalObject<<endl;
                            std::string t=ss.str();
                            out<<t;*/
                       } while (adjSO->getBit(p, z-1)==0);
                   }
               }
           }
       }
       cout<<endl<<"Decompression time: "<<sw<<endl;
       out.close();
}

void HDTpp::createComponents() {
    header = new PlainHeader();
    dictionary = new FourSectionDictionary();
    triplespp = new BitmapTriplespp();
}

void HDTpp::deleteComponents() {
    if (header){
        delete header;
        header = NULL;
    }
    if (triplespp){
        delete triplespp;
        triplespp = NULL;
    }
    if (dictionary){
        delete dictionary;
        dictionary = NULL;
    }
    if (triples){
        delete triples;
        triples = NULL;
    }

}

HDTpp::~HDTpp()
{
    deleteComponents();
}

}

