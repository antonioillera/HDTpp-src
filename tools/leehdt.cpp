#include <HDT.hpp>
#include <HDTManager.hpp>

#include <string>
#include <getopt.h>
#include <iostream>
#include <fstream>

#include "../src/triples/BitmapTriples.hpp"
#include "../src/util/StopWatch.hpp"


using namespace hdt;
using namespace std;

void help() {
	cout << "$ rdf2hdt [options] <rdf input file> <hdt output file> " << endl;
	cout << "\t-h\t\t\tThis help" << endl;
	cout << "\t-i\t\tAlso generate index to solve all triple patterns." << endl;
	cout << "\t-c\t<configfile>\tHDT Config options file" << endl;
	cout << "\t-o\t<options>\tHDT Additional options (option1=value1;option2=value2;...)" << endl;
	cout << "\t-f\t<format>\tFormat of the RDF input (ntriples, nquad, n3, turtle, rdfxml)" << endl;
	cout << "\t-B\t\"<base URI>\"\tBase URI of the dataset." << endl;
	//cout << "\t-v\tVerbose output" << endl;
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
		case 'f':
			rdfFormat = optarg;
			cout << "Format: " << rdfFormat << endl;
			break;
		default:
			cout << "ERROR: Unknown option" << endl;
			help();
			return 1;
		}
	}

    if(rdfFormat!="") {
		if(rdfFormat=="ntriples") {
			notation = NTRIPLES;
		} else if(rdfFormat=="n3") {
			notation = N3;
		} else if(rdfFormat=="turtle") {
			notation = TURTLE;
		} else if(rdfFormat=="rdfxml") {
			notation = XML;
		} else {
			cout << "ERROR: The RDF output format must be one of: (ntriples, n3, turtle, rdfxml)" << endl;
			help();
			return 1;
		}
	}

	inputFile = argv[optind];

	if(inputFile=="") {
		cout << "ERROR: You must supply an HDT input file" << endl << endl;
		help();
		return 1;
	}

	try {
        HDT *hdt = HDTManager::loadHDT(inputFile.c_str());
        ofstream out ("/home/antonio/triples_hdt.txt");
        StopWatch sw;
		IteratorTripleID *it = hdt->getTriples()->searchAll();
		while(it->hasNext()) {
			TripleID *t = it->next();

            /*std::stringstream ss;
            ss<<t->getSubject()<<"-"<<t->getPredicate()<<"-"<<t->getObject()<<endl;
            std::string text=ss.str();
            out<<text;*/

		}
        out.close();
		cout<<endl<<"Tiempo de descompresión "<<sw<<endl;

		delete hdt;
	} catch (char *exception) {
		cerr << "ERROR: " << exception << endl;
	} catch (const char *e) {
		cout << "ERROR: " << e << endl;
	}

}



