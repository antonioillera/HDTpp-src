#include "BitmapTriplespp.hpp"

namespace hdt {

AdjSO::AdjSO(vector<AL*> o){
    objectsP = o;
}

size_t AdjSO::getNumberOfPredicates(){
    return objectsP.size();
}

unsigned char AdjSO::getBit(size_t idPredicate, size_t pos){
    return objectsP[idPredicate-1]->getBit(pos);
}

size_t AdjSO::access(size_t idPredicate, size_t pos){
    return objectsP[idPredicate-1]->access(pos);
}

size_t AdjSO::getMaxLocalObjectID(size_t idPredicate){
    size_t maxID = 0;
    for (size_t o = 0; o<objectsP[idPredicate-1]->size(); o++){
        size_t temp = objectsP[idPredicate-1]->access(o);
        if (temp>maxID)
            maxID = temp;
    }
    return ++maxID;
}

size_t AdjSO::getMaxLocalObjectID(){
    size_t maxID = 0;
    for (size_t p = 1; p <= objectsP.size(); p++){
        size_t temp = getMaxLocalObjectID(p);
        if (temp > maxID)
            maxID = temp;
    }
    return ++maxID;
}

AdjSO::~AdjSO(){
    for (std::vector< AL* >::iterator it = objectsP.begin() ; it != objectsP.end(); ++it)       {
        delete (*it);
     }
     objectsP.clear();
}

}
