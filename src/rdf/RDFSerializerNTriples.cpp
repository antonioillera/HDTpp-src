/*
 * RDFSerializerNTriples.cpp
 *
 *  Created on: 05/03/2011
 *      Author: mck
 */

#include "RDFSerializerNTriples.hpp"

using namespace std;

namespace hdt {

RDFSerializerNTriples::RDFSerializerNTriples(std::ostream &s, RDFNotation notation)
	: RDFSerializer(notation),
	  output(&s)
	{

}

RDFSerializerNTriples::RDFSerializerNTriples(const char *fileName, RDFNotation notation)
	: RDFSerializer(notation),
	  output(new std::ofstream(fileName, ios::binary | ios::out))
{

}

RDFSerializerNTriples::~RDFSerializerNTriples() {

}

void serializeTerm(std::string str, ostream &output) {
	if(str=="") {
		throw "Empty Value on triple!";
	}

	// FIXME: Escape non-ascii.

	if(str.at(0)=='"') {
		output << str;
	} else if(str.at(0)=='_') {
		output << str;
	} else {
		output << "<" << str << ">";
	}
}

void RDFSerializerNTriples::serialize(IteratorTripleString *it, ProgressListener *listener, unsigned int totalTriples)
{
	cout<<"serialize Ntriples"<<endl;
	unsigned int numTriple=0;
	while(it->hasNext()) {
		TripleString *ts = it->next();

		if(!ts->isEmpty()) {
			serializeTerm(ts->getSubject(), *output);
			*output << ' ';
			serializeTerm(ts->getPredicate(), *output);
			*output << ' ';
			serializeTerm(ts->getObject(), *output);
			*output << " ." << endl;
		}
		numTriple++;
		NOTIFYCOND(listener, "Exporting HDT to RDF", numTriple, totalTriples);
	}
}

void RDFSerializerNTriples::serialize(BitmapTriplespp *triples, Dictionary *dict){
    Families *families = triples->getFamilies();
    PermS *permS = triples->getPermS();
    Types *types = triples->getTypes();
    PermO *permO = triples->getPermO();
    AdjSO *adjSO = triples->getAdjSO();
    uint nFamilias = families->getNumberOfFamilies();
    //uint nPredicados = dictionary->getMaxPredicateID();

    cout<<endl<<"Saving RDF..."<<endl;

    for (size_t p=1; p<=permO->getNumberOfPredicates(); p++){
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
                            serializeTerm(dict->idToString(idSubject,SUBJECT), *output);
                            *output << ' ';
                            serializeTerm(dict->idToString(p,PREDICATE), *output);
                            *output << ' ';
                            serializeTerm(dict->idToString(type,OBJECT), *output);
                            *output << " ." << endl;

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
                        serializeTerm(dict->idToString(idSubject,SUBJECT), *output);
                        *output << ' ';
                        serializeTerm(dict->idToString(p,PREDICATE), *output);
                        *output << ' ';
                        serializeTerm(dict->idToString(idGlobalObject,OBJECT), *output);
                        *output << " ." << endl;
                        z++;
                   } while (adjSO->getBit(p, z-1)==0);
               }
           }
       }
   }
}

}
