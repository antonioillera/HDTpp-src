
#include <HDT.hpp>
#include <HDTManager.hpp>
#include "../src/hdtpp/HDTpp.hpp"

#include <string>
#include <getopt.h>
#include <iostream>
#include <fstream>

using namespace hdt;

void help() {
    cout << "$ leehdtpp  <rdf input file> " << endl;
    cout << "\t-h\t\t\tThis help" << endl;
}


int main(int argc, char **argv) {

    string inputFile;
    inputFile = argv[optind];

    if(inputFile=="") {
        cout << "ERROR: You must supply an HDT++ input file" << endl << endl;
        help();
        return 1;
    }

    try {

        HDTpp *hdtpp = new HDTpp(inputFile.c_str());
        hdtpp->getTriples()->constructMemoryStructures();
        cout<<endl<<endl<<"HDT++ STATISTICS"<<endl;
        cout<<"-----------------"<<endl;

        cout<<"Number of Subjects = "<<hdtpp->getDictionary()->getNsubjects()<<endl;
        cout<<"Number of Predicates = "<<hdtpp->getDictionary()->getNpredicates()<<endl;
        cout<<"Number of Objects = "<<hdtpp->getDictionary()->getNobjects()<<endl;
        cout<<"Number of Types = "<<hdtpp->getTriples()->getNTypes()<<endl;
        cout<<"Number of Families = "<<hdtpp->getTriples()->getNFamilies()<<endl;
        cout<<"Number of Typed-Families = "<<hdtpp->getTriples()->getTypes()->getNTypedFamilies(hdtpp->getTriples()->getNFamilies())<<endl;
        cout<<"Max. local-object-ID = "<<hdtpp->getTriples()->getAdjSO()->getMaxLocalObjectID()<<endl;

        cout<<endl;

        delete hdtpp;

    } catch (char *exception) {
        cerr << "ERROR: " << exception << endl;
    } catch (const char *e) {
        cout << "ERROR: " << e << endl;
    }

}
