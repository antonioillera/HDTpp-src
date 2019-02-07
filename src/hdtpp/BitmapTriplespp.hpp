#ifndef BITMAPTRIPLESPP_H
#define BITMAPTRIPLESPP_H

#define TDENS 128
#define CODER coder::elias_delta

#include <sdsl/vectors.hpp>
#include "../adjacencylist/AL.hpp"
#include "../triples/BitmapTriples.hpp"

#undef size_t

namespace hdt {

class PermS{
private:
    vector < enc_vector<CODER, TDENS> > subjectsF; //subjects in each family
    random_access_const_iterator<enc_vector<CODER, TDENS>> it = NULL;
    size_t idFamilyIt = 0;
public:
    PermS(int_vector<> *perms);
    enc_vector<CODER, TDENS> *getSubjectsArray(size_t idFamily){return &subjectsF[idFamily-1];}
    void getSubjects(size_t idFamily);
    bool hasMoreSubjects();
    size_t nextSubject();
    unsigned int sizeBytes();
};

class PermO{
private:
    vector < enc_vector<CODER, TDENS> > objectsP; //objects related to each predicate
public:
    PermO(AL *permo);
    size_t getDictID(size_t idPredicate, size_t idLocalObject);
    size_t getNumberOfPredicates();
};

class Types{
private:
     AL *altypes;
     size_t ptrF0 = 0, ptrF1 = 0; //Positions where start and end types of a given family

public:
    Types(AL *t);
    bool hasTypes(size_t idFamily);
    void getTypes(size_t idFamily);
    bool hasMoreTypes();
    size_t nextType();
    size_t getNTypes();
    size_t getNTypedFamilies(size_t nFamilies);
};

class AdjSO{
private:
     vector<AL*> objectsP; //Objects in each Predicate
public:
    AdjSO(vector<AL*> o);
    ~AdjSO();
    size_t access(size_t idPredicate, size_t pos);
    size_t getNumberOfPredicates();
    unsigned char getBit(size_t idPredicate, size_t pos);
    size_t getMaxLocalObjectID(size_t idPredicate);
    size_t getMaxLocalObjectID();
};

class Families{
private:
     vector < int_vector<> > familiesP; //families in which a predicate appears
     unsigned int families=0;
public:
    Families(AL *f);
    size_t getNumberOfFamilies(size_t idPredicate){return familiesP[idPredicate-1].size();}
    size_t getNumberOfFamilies(){return families;}
    size_t access(size_t idPredicate, size_t pos){return familiesP[idPredicate-1][pos];}
};

class BitmapTriplespp {
private:

    unsigned int nPredicados=0, idRDFType=0, nFamilias=0;
    //Estructuras de cargar/salvar de datos de disco
    int_vector<> *PermS_flat;
    AL *PermO_flat, *Types_flat, *Families_flat;
    vector <AL *> AdjSO_flat;

    //Estructuras de consulta en memoria
    Families *families = NULL;
    Types *types = NULL;
    PermO *permO = NULL;
    PermS *permS = NULL;
    AdjSO *adjSO = NULL;

public:
    BitmapTriplespp();

    void constructMemoryStructures();

    void setPermS_flat(int_vector<> *ps){delete PermS_flat; PermS_flat = ps;}
    void setAdjSO_flat(vector <AL *> a){AdjSO_flat=a;}
    void setPermO_flat(AL *a){PermO_flat=a;}
    void setTypes_flat(AL *a){Types_flat=a;}
    void setFamilies_flat(AL *a){Families_flat=a;}

    int_vector<> *getPermS_flat(){return PermS_flat;}
    vector <AL*> getAdjSO_flat(){return AdjSO_flat;}
    AL *getPermO_flat(){return PermO_flat;}
    AL *getTypes_flat(){return Types_flat;}
    AL *getFamilies_flat(){return Families_flat;}
    Families *getFamilies(){return families;}
    Types *getTypes(){return types;}
    PermO *getPermO(){return permO;}
    PermS *getPermS(){return permS;}
    AdjSO *getAdjSO(){return adjSO;}

    void setnPredicados(unsigned int np){nPredicados=np;}
    unsigned int getNFamilies(){return families->getNumberOfFamilies();}
    unsigned int getNTypes(){return types->getNTypes();}
    unsigned int getIdRDFType(){return idRDFType;}

    ~BitmapTriplespp();

    /**
     * Saves the triples
     *
     * @param output
     * @return
     */

    void save(std::ostream &output);
    /**
     * Loads triples from a file
     *
     * @param input
     * @return
     */

    void load(std::istream &input);

};

}

#endif /* BITMAPTRIPLES_HPP_ */
