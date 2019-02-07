#ifndef AL_H
#define AL_H

#include <iostream>
#include <sdsl/bit_vectors.hpp>
using namespace sdsl;
using namespace std;

class AL
{
private:
    bit_vector *bits;
    bit_vector::select_1_type b_sel1;
    int_vector<> *sequence;
public:
    AL(int_vector<> *s, bit_vector *b);
    AL(istream & in);

    ~AL();
    void select1support() {b_sel1 = bit_vector::select_1_type(bits);}
    size_t select1(size_t n){return b_sel1(n);}
    size_t getValueSelect1(size_t n){return (*sequence)[b_sel1(n)];}
    unsigned int access(size_t pos) {return (*sequence)[pos];}
    unsigned int getBit(size_t pos) {return (*bits)[pos];}
    void saveSequence(ostream & out) {serialize(*sequence, out);}
    void saveBits(ostream & out) {serialize(*bits, out);}
    void save(ostream & out) {saveBits(out); saveSequence(out);}
    size_t size(){return bits->size();}
    unsigned int sizeBytes(){return size_in_bytes(*bits)+size_in_bytes(*sequence);}
    bit_vector *getBits(){return bits;}
    int_vector<> *getSequence(){return sequence;}
};

#endif // AL_H
