#include "SearchableAL.hpp"
namespace hdt {

SearchableAL::SearchableAL(IntSequence *el, BitSequence375 *bit, unsigned int l) :
    elements(el),
    bitmap(bit),
    length(l){
    sAL =  vector < vector <unsigned int> > (l);
    uint idF=1;
    for (size_t i=0; i<el->getNumberOfElements(); i++){
        uint idP = el->get(i);
        if(idP>0){
            if (sAL[idP-1].size()>0){
                if (sAL[idP-1][sAL[idP-1].size()-1]<idF)
                        sAL[idP-1].push_back(idF);
            } else{
                sAL[idP-1].push_back(idF);
            }
            if (bit->access(i)==1) idF++;
        } else idF++;
    }
}

}
