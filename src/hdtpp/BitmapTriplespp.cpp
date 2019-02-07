#include "BitmapTriplespp.hpp"

namespace hdt {

BitmapTriplespp::BitmapTriplespp() {
    PermS_flat = NULL;
    Families_flat = NULL;
    Types_flat = NULL;
    PermO_flat = NULL;
}

BitmapTriplespp::~BitmapTriplespp() {
    //Delete in-memory structures

    if (Families_flat){
        delete Families_flat;
        Families_flat=NULL;
    } else if (families){
        delete families;
        families=NULL;
    }
    if (PermS_flat){
        util::clear(*PermS_flat);
        delete PermS_flat;
        PermS_flat=NULL;
    } else if (permS){
        delete permS;
        permS=NULL;
    }
    if (PermO_flat){
        delete PermO_flat;
        PermO_flat=NULL;
    } else if (permO){
        delete permO;
        permO=NULL;
    } if (Types_flat){
        delete Types_flat;
        types=NULL;
        Types_flat=NULL;
    }
    if (adjSO){
        delete adjSO;
        adjSO = NULL;
    } else {
        for (size_t i=0; i<AdjSO_flat.size(); i++)
            delete AdjSO_flat[i];
        AdjSO_flat.clear();
    }

}


void BitmapTriplespp::save(std::ostream & output)
{
    this->getFamilies_flat()->save(output);
    cout<<"Families saved: "<<this->getFamilies_flat()->sizeBytes()<<" Bytes"<<endl;

    this->getTypes_flat()->save(output);
    cout<<"Types saved: "<<this->getTypes_flat()->sizeBytes()<<" Bytes"<<endl;
    this->getPermO_flat()->save(output);
    cout<<"PermO saved: "<<this->getPermO_flat()->sizeBytes()<<" Bytes"<<endl;

    serialize(*(this->getPermS_flat()),output);
    cout<<"PermS saved: "<<size_in_bytes(*this->getPermS_flat())<<" Bytes"<<endl;
    unsigned int sizeAdjSO=0;
    for (size_t i=0; i<nPredicados; i++){
        this->getAdjSO_flat()[i]->save(output);
        sizeAdjSO+=this->getAdjSO_flat()[i]->sizeBytes();
    }
    cout<<"AdjSO saved: "<<sizeAdjSO<<" Bytes"<<endl;
}

void BitmapTriplespp::load(std::istream &input)
{
    // Load flat structures from disk
    this->Families_flat = new AL(input);
    this->Types_flat = new AL(input);
    this->PermO_flat = new AL(input);;
    PermS_flat = new int_vector<>();
    sdsl::load(*PermS_flat, input);

    for (size_t i=0; i<nPredicados; i++){
        AL *a = new AL(input);
        AdjSO_flat.push_back(a);
    }
    cout<<endl<<"HDT++ loaded from disk"<<endl;
}

void BitmapTriplespp::constructMemoryStructures(){
    cout<<"Constructing HDT++ structures ..."<<endl;

    types = new Types(Types_flat);
    permO = new PermO(PermO_flat);
    permS = new PermS(PermS_flat);
    adjSO = new AdjSO(AdjSO_flat);
    families = new Families(Families_flat);

    // We dont need some flat structures
    delete Families_flat;
    Families_flat = NULL;
    delete PermS_flat;
    PermS_flat = NULL;
    delete PermO_flat;
    PermO_flat = NULL;

}

}
