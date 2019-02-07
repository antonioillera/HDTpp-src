#ifndef ADJACENCYLIST2_H
#define ADJACENCYLIST2_H

#include <stdlib.h>
#include "IntSequence.hpp"
#include "../bitsequence/BitSeq.h"
//class PlainALSequence;

namespace hdt {
    #define PLAIN_AL_VECTOR 1
    #define PLAIN_AL_SEQUENCE 2
    #define PLAIN_AL_DAC 3
    #define SEARCHABLE_AL_VECTOR 4
    #define SEARCHABLE_AL_WT 5
    #define SEARCHABLE_AL_GMR 6
    #define SEARCHABLE_AL_AP 7
    #define SEARCHABLE_AL_WM 8

class PlainAdjacencyList
{
public:
    /** Builds and sets the length */
    //PlainAdjacencyList(size_t _length);
    //virtual PlainAdjacencyList (IntSequence *el, BitSeq *bit)const;
    //virtual ~PlainAdjacencyList() {}

    /** Retrieve the symbol at position i.*/
    //virtual uint access(size_t i) const;

    /** Length of the Adjacency List.*/
    virtual size_t getLength() const { return length; }
    //virtual size_t load(const unsigned char *ptr, const unsigned char *ptrMax, ProgressListener *listener=NULL)=0;
protected:
    size_t length;
};

}
#endif // ADJACENCYLIST2_HPP

