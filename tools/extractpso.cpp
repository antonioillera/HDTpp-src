
#include <HDT.hpp>
#include <HDTManager.hpp>
#include "../src/hdtpp/HDTpp.hpp"
#include <string>
#include <getopt.h>
#include <iostream>
#include <fstream>

#include "../src/triples/BitmapTriples.hpp"


using namespace hdt;
using namespace std;

void help() {
        cout <<endl<< "$ hdt2hdtpp <hdt input file> <hdt++ output file> " << endl;


}

class ConvertProgress : public ProgressListener {
private:
public:
        virtual ~ConvertProgress() { }

    void notifyProgress(float level, const char *section) {
        cout << section << ": " << level << " %";
        cout << "\r " << section << ": " << level << " %                      \r";
                cout.flush();
        }

};


int main(int argc, char **argv) {
        int c;
        string rdfFormat, inputFile, outputFile;
        RDFNotation notation = NTRIPLES;

        while( (c = getopt(argc,argv,"f:"))!=-1) {
                switch(c) {

                default:
                        cout << "ERROR: Unknown option" << endl;
                        help();
                        return 1;
                }
        }

        if(argc-optind<2) {
                cout << "ERROR: You must supply an input and output" << endl << endl;
                help();
                return 1;
        }


        inputFile = argv[optind];
        outputFile = argv[optind+1];

        if(inputFile=="") {
                cout << "ERROR: You must supply an HDT++ input file" << endl << endl;
                help();
                return 1;
        }

        if(outputFile=="") {
                cout << "ERROR: You must supply an  output file" << endl << endl;
                help();
                return 1;
        }

        try {
            HDTpp *hdtpp = new HDTpp(inputFile.c_str());
            hdtpp->getTriples()->constructMemoryStructures();
            hdtpp->extractPSO(outputFile.c_str());
            delete hdtpp;

        } catch (char *exception) {
                cerr << "ERROR: " << exception << endl;
        } catch (const char *e) {
                cout << "ERROR: " << e << endl;
        }

}
