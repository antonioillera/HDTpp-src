#ifndef SEARCHABLEALSDARRAY_HPP
#define SEARCHABLEALSDARRAY_HPP

#include "../sequence/LogSequence2.hpp"
#include "../bitsequence/BitSequence375.h"
#include "BitSequenceSDArray.h"
#include <vector>
#include "PlainAdjacencyList.hpp"

using namespace cds_static;

namespace hdt {
class SearchableALSDArray : public PlainAdjacencyList
{
private:
    IntSequence *elements;
    BitSequence375 *bitmap;
    vector < vector <BitSequenceSDArray*> > sAL;

public:
    SearchableALSDArray(IntSequence *el, BitSequence375 *bit);
    vector < vector <BitSequenceSDArray*> > getVector(){return sAL;}
};
}

#endif // SEARCHABLEALSDARRAY_HPP
