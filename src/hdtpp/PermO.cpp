#include "BitmapTriplespp.hpp"

namespace hdt {

PermO::PermO(AL *permo){
    vector < int_vector<> > aux;
    size_t pos = 0;
    for (size_t i=0; i<permo->size(); i++){
        unsigned int predicate = permo->access(i);
        if (predicate!=0){
            if (aux.size() < predicate) aux.resize(predicate);
            if (aux[predicate-1].size() == 0)
                aux[predicate-1] = int_vector<>(1,pos);
            else {
                size_t s = aux[predicate-1].size();
                aux[predicate-1].resize(s+1);
                aux[predicate-1][s]=pos;
            }
            if (permo->getBit(i)==1) pos++;
        } else pos++;
    }
    for (size_t i=0; i<aux.size(); i++){
        util::bit_compress(aux[i]);
        objectsP.push_back(enc_vector<CODER, TDENS>(aux[i]));
        util::clear(aux[i]);
    }
    vector < int_vector<> >().swap(aux);
}

size_t PermO::getDictID(size_t idPredicate, size_t idLocalObject){
    return objectsP[idPredicate-1][idLocalObject-1]+1;
}

size_t PermO::getNumberOfPredicates(){
    return objectsP.size();
}
}
