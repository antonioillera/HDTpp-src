#ifndef PLAINALSEQUENCE_HPP
#define PLAINALSEQUENCE_HPP

#include "../sequence/LogSequence2.hpp"
#include "../bitsequence/BitSequence375.h"
#include "PlainAdjacencyList.hpp"

namespace hdt {
class PlainALSequence : public PlainAdjacencyList
{
private:
    IntSequence *elements;
    BitSequence375 *bitmap;
public:
    PlainALSequence();
    PlainALSequence(IntSequence *el, BitSequence375 *bit);
    virtual ~PlainALSequence();

    void setElements(IntSequence *_elements){delete elements; elements=_elements;}
    void setBitmap(BitSequence375 *_bitmap){delete bitmap; bitmap=_bitmap;}
    IntSequence* getElements(){return elements;}
    BitSequence375* getBitmap(){return bitmap;}

    size_t find(size_t x);
    size_t find(size_t x, size_t y);
    size_t findNext(size_t pos);
    size_t findListIndex(size_t globalpos);
    size_t last(size_t x);
    size_t countListsX();
    size_t countItemsY(size_t x);
    size_t search(unsigned int element, size_t ini, size_t fin);
    size_t binSearch(unsigned int element, size_t ini, size_t fin);
    size_t linSearch(unsigned int element, size_t ini, size_t fin);

    unsigned int getElement1(size_t pos) {return elements->get(bitmap->select1(pos));}
    size_t select1(size_t x){return bitmap->select1(x);}

    unsigned int get(size_t pos);

    size_t getSize();

    void dump();

};
}

#endif // PLAINALSEQUENCE_HPP
