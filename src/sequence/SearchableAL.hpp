#ifndef SEARCHABLEAL_HPP
#define SEARCHABLEAL_HPP

#include "../sequence/LogSequence2.hpp"
#include "../bitsequence/BitSequence375.h"
#include <vector>
#include "PlainAdjacencyList.hpp"

namespace hdt {
class SearchableAL : public PlainAdjacencyList
{
private:
    IntSequence *elements;
    BitSequence375 *bitmap;
    vector < vector <unsigned int> > sAL;
    unsigned int length;


public:
    SearchableAL(IntSequence *el, BitSequence375 *bit, unsigned int l);
    vector < vector <unsigned int> > getVector(){return sAL;}
};
}
#endif // SEARCHABLEAL_HPP
