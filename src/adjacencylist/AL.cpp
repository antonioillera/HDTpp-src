#include "AL.hpp"

AL::AL(int_vector<> *s, bit_vector *b):
    sequence(s),
    bits(b) {

}

AL::AL(istream & in){
    bits = new bit_vector();
    sequence = new int_vector<>();
    load(*bits, in);
    load(*sequence, in);
}

AL::~AL()
{
    util::clear(*bits);
    util::clear(*sequence);
    util::clear(b_sel1);
    delete bits;
    delete sequence;
    bits=NULL;
    sequence=NULL;

}

