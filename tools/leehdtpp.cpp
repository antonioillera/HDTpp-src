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
        hdtpp->decompress();
        delete hdtpp;

	} catch (char *exception) {
		cerr << "ERROR: " << exception << endl;
	} catch (const char *e) {
		cout << "ERROR: " << e << endl;
	}

}



