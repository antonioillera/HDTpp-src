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
void split(const string& s, char c,
           vector<string>& v) {
   string::size_type i = 0;
   string::size_type j = s.find(c);

   while (j != string::npos) {
      v.push_back(s.substr(i, j-i));
      i = ++j;
      j = s.find(c, j);

      if (j == string::npos)
         v.push_back(s.substr(i, s.length()));
   }
}
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
        //HDT *hdt = HDTManager::mapHDT(inputFile.c_str());
        //HDT *hdt = HDTManager::loadIndexedHDT(inputFile.c_str());
		HDT *hdt = HDTManager::loadHDT(inputFile.c_str());

        /*IteratorTripleID *it = hdt->getTriples()->searchAll();

        StopWatch sw;
        while (it->hasNext()) {
            TripleID *tid = it->next();
        }*/
        string rdftypeLiteral = "http://www.w3.org/1999/02/22-rdf-syntax-ns#type";
        unsigned int idRDFType = hdt->getDictionary()->stringToId(rdftypeLiteral, PREDICATE);
        cout<<"idRDFType = " << idRDFType<<endl;
        cout <<"Size HDT Triples="<<hdt->getTriples()->size()<<endl;
        //cout<<hdt->getDictionary()->idToString(60230, PREDICATE)<<endl;
        cout<<hdt->getDictionary()->idToString(6, PREDICATE)<<endl;

        //Abro fichero de test
        std::ifstream infile("/home/antonio/hdt-lib-rc1-src/dataset_sVV_FULL.txt");
        //Leo líneas y formo triples
        std::string line;
        vector<string> v;
        TripleID tid;
        unsigned long long time=0;
        //ofstream out2 ("/home/antonio/hdt-lib-rc1-src/iterhdt.txt");
        ofstream out ("/home/antonio/hdt-lib-rc1-src/tools/tiempos.txt", ios::app);
        StopWatch sw;
        sw.stop();
        while (std::getline(infile, line)){
           split(line, ';', v);
           // Si es rdf:type lo saltamos
           if (std::stoul (v[1],nullptr,0)==idRDFType) continue;
           tid.setSubject(std::stoul (v[0],nullptr,0));
           tid.setPredicate(std::stoul (v[1],nullptr,0));
           tid.setObject(std::stoul (v[2],nullptr,0));

           sw.reset();
           IteratorTripleID *it=hdt->getTriples()->search(tid);
           while (it->hasNext()) {
               TripleID *t = it->next();
               /*std::stringstream ss;
               ss<<t->getSubject()<<"-"<<t->getPredicate()<<"-"<<t->getObject()<<endl;
               std::string text=ss.str();
               out2<<text;*/
               //cout <<t->getSubject()<<"-"<<t->getPredicate()<<"-"<<t->getObject()<<endl;
           }
           time +=sw.stopReal();
           v.clear();
           delete it;
        }
        out<<"---------------"<<endl<<sw.toHuman(time)<<endl;
        out.close();
        cout<<sw.toHuman(time)<<endl;
        //out2.close();

       delete hdt;
    } catch (char *exception) {
        cerr << "ERROR: " << exception << endl;
    } catch (const char *e) {
        cout << "ERROR: " << e << endl;
    }

}





