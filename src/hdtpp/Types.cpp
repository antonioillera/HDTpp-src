#include "BitmapTriplespp.hpp"

namespace hdt {

Types::Types(AL *t){
    altypes = t;
    altypes->select1support();
}

bool Types::hasTypes(size_t idFamily){
    return altypes->getValueSelect1(idFamily+1)!=0;
}

void Types::getTypes(size_t idFamily){
    ptrF0 = altypes->select1(idFamily)+1;
    ptrF1 = altypes->select1(idFamily+1);
}

bool Types::hasMoreTypes(){
    return ptrF0<=ptrF1;
}

size_t Types::nextType(){
    return altypes->access(ptrF0++);
}
size_t Types::getNTypes(){
    return altypes->getBits()->size();
}
size_t Types::getNTypedFamilies(size_t nFamilies){
    size_t typedFamilies = 0;
    for (size_t f=1; f<=nFamilies; f++)
        if (hasTypes(f)) typedFamilies++;
    return typedFamilies;
}


}
