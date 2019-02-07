#include "BitmapTriplespp.hpp"

namespace hdt {

Families::Families(AL *f){
    size_t idF=1;
    for (size_t i=0; i < f->size(); i++){
        unsigned int idP = f->access(i);
        if(idP!=0){
            if (familiesP.size() < idP) familiesP.resize(idP);
            if (familiesP[idP-1].size() == 0)
                familiesP[idP-1] = int_vector<>(1,idF);
            else {
                size_t s = familiesP[idP-1].size();
                familiesP[idP-1].resize(s+1);
                familiesP[idP-1][s]=idF;
            }
            if (f->getBit(i)==1) idF++;
        } else idF++;
    }
    for (unsigned int i=0; i<familiesP.size(); i++){
        if (familiesP[i].size() > 0)
            util::bit_compress(familiesP[i]);
    }
    families = idF-1;
}
}
