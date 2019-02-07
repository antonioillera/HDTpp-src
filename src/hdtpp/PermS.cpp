#include "BitmapTriplespp.hpp"

namespace hdt {

PermS::PermS(int_vector<> *perms){
    vector < int_vector<> > aux;
    for (size_t i=0; i<perms->size(); i++){
        unsigned int family = (*perms)[i]+1;
        if (aux.size() < family) aux.resize(family);
        if (aux[family-1].size() == 0)
            aux[family-1] = int_vector<>(1,i);
        else {
            size_t s = aux[family-1].size();
            aux[family-1].resize(s+1);
            aux[family-1][s]=i;
        }
    }
    for (size_t f=0; f<aux.size(); f++){
        util::bit_compress(aux[f]);
        subjectsF.push_back(enc_vector<CODER, TDENS>(aux[f]));
        util::clear(aux[f]);
    }
    vector < int_vector<> >().swap(aux);
}

void PermS::getSubjects(size_t idFamily){
    idFamilyIt=idFamily;
    it = getSubjectsArray(idFamilyIt)->begin();
}

bool PermS::hasMoreSubjects(){
    return it!=getSubjectsArray(idFamilyIt)->end();
}

size_t PermS::nextSubject(){
    size_t s = *it+1;
    it++;
    return s;
}

unsigned int PermS::sizeBytes(){
    unsigned int size=0;
    for (size_t i=0; i<subjectsF.size(); i++)
        size += size_in_bytes(subjectsF[i]);
    size += sizeof(std::vector<enc_vector<CODER, TDENS>>);
    return size;
}

}
