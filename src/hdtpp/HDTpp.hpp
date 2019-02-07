#ifndef HDTPP_H
#define HDTPP_H
#include <HDT.hpp>
#include "../sequence/LogSequence2.hpp"
#include "../triples/BitmapTriples.hpp"
#include "BitmapTriplespp.hpp"

#include <RDFSerializer.hpp>

namespace hdt {

class HDTpp
{
public:

    HDTpp(HDT* hdt);
    HDTpp(const char *file, ProgressListener *listener=NULL);
    ~HDTpp();

    Header *getHeader(){return header;}
    Dictionary *getDictionary(){return dictionary;}
    BitmapTriplespp *getTriples(){return triplespp;}

    unsigned int getIdRdfType(){return idRdfType;}

    void saveToHDTpp(const char *fileName, ProgressListener *listener = NULL);
    void saveToHDTpp(std::ostream &out, ProgressListener *listener = NULL);
    void saveHeaderToHDTpp(std::ostream &out, ProgressListener *listener = NULL);
    void saveDictionaryToHDTpp(std::ostream &out, ProgressListener *listener = NULL);
    void saveTriplesToHDTpp(std::ostream &out, ProgressListener *listener = NULL);
    void saveIndex(ProgressListener *listener = NULL);

    void saveToRDF(std::ostream &out);
    void saveToRDF(RDFSerializer &serializer);
    void decompress();

private:

    //Header and Dictionary in HDT++ are the same as HDT
    Header *header=NULL;
    Dictionary *dictionary=NULL;
    BitmapTriples *triples=NULL;
    BitmapTriplespp *triplespp=NULL;

    ofstream out;
    unsigned int idRdfType=0;

    //Family structure
    struct Family{
        unsigned int idFamily;
        vector <unsigned int> idPredicates; // Predicates belonging to the family
        vector <unsigned int> idRdfTypes;  // Types related to the family
        unsigned int nSubjects=1;           //Number of subjects pointing to the family
    };
    vector <Family*> vFamilias;

    void extractFamilies(); //Extracts predicate families from HDT
    void setTypes(); //Extracts predicate families from HDT
    void setFamilies();
    void setPermO(vector < vector <unsigned int> > *fo, vector < vector <unsigned char> > *bmfo);
    void setObjectsSequences(vector < map < unsigned int,unsigned int > > *m, vector<unsigned int> *o, bit_vector *bOF, bit_vector *bOS); //Creates sequences for HDT++

    void deleteComponents();
    void createComponents();
    void loadFromHDTpp(std::istream & input, ProgressListener *listener);


};
}

#endif // HDTPP_H
