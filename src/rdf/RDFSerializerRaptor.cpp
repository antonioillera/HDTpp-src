/*
 * RDFSerializerRaptor.cpp
 *
 *  Created on: 05/03/2011
 *      Author: mck
 */

#ifdef USE_RAPTOR
#include "RDFSerializerRaptor.hpp"

using namespace std;

namespace hdt {

RDFSerializerRaptor::RDFSerializerRaptor(const char *fileName, RDFNotation notation)
	: RDFSerializer(notation),
	  readingFromStream(false)
{
	world = raptor_new_world();

	base_uri = raptor_new_uri(world, (const unsigned char*)"http://www.rdfhdt.org/");

	rdf_serializer = raptor_new_serializer(world, getType(notation)) ;

	raptor_serializer_start_to_filename(rdf_serializer, fileName);
}

int iostream_init(void *context ){
	return 0;
}

void iostream_finish(void *context) {

}

int iostream_write_bytes (void *context, const void *ptr, size_t size, size_t nmemb) {
	std::ostream *out = reinterpret_cast<std::ostream *>(context);
	if(out->good()) {
		out->write((const char *)ptr, size*nmemb);
		return 0;
	} else {
		return 1;
	}
}

int iostream_write_byte(void *context, const int byte) {
	std::ostream *out = reinterpret_cast<std::ostream *>(context);
	if(out->good()) {
		out->write((const char *)&byte, sizeof(int));
		return 0;
	} else {
		return 1;
	}
}

int iostream_write_end(void *context ){
	return 0;
}

RDFSerializerRaptor::RDFSerializerRaptor(std::ostream &s, RDFNotation notation)
	: RDFSerializer(notation),
	  readingFromStream(true)
{
	world = raptor_new_world();

	base_uri = raptor_new_uri(world, (const unsigned char*)"http://www.rdfhdt.org/");

	memset(&handler, 0, sizeof(handler));
	handler.version = 1;
	handler.init = iostream_init;
	handler.finish = iostream_finish;
	handler.write_byte = iostream_write_byte;
	handler.write_bytes = iostream_write_bytes;
	handler.write_end = iostream_write_end;

	iostream = raptor_new_iostream_from_handler(world, (void *) &s, &handler);
	rdf_serializer = raptor_new_serializer(world, getType(notation)) ;

	raptor_serializer_start_to_iostream(rdf_serializer, base_uri, iostream);
}

RDFSerializerRaptor::~RDFSerializerRaptor() {
	raptor_serializer_serialize_end(rdf_serializer);

	raptor_free_serializer(rdf_serializer);

	if(readingFromStream) {
		raptor_free_iostream(iostream);
	}

	raptor_free_uri(base_uri);

	raptor_free_world(world);
}

raptor_term *getTerm(string &str, raptor_world *world) {

	if(str=="") {
		throw "Empty Value on triple!";
	}

	if(str.at(0)=='"') {
		size_t pos=str.find("\"^^");
		if(pos!=string::npos) {
			// Extract literal and datatype
			string datatypeStr = str.substr(pos+4, str.length()-(pos+5)).c_str();
			if(datatypeStr.at(0)=='<' && datatypeStr.at(datatypeStr.length()-1)=='>') {
				datatypeStr = datatypeStr.substr(1, datatypeStr.length()-2);
			}
			raptor_uri *datatype = raptor_new_uri(world, (unsigned char *)datatypeStr.c_str());
			return raptor_new_term_from_literal(world, (unsigned char *)str.substr(1, pos-1).c_str(), datatype, NULL);
		}
		pos=str.find("\"@");
		if(pos!=string::npos) {
			// Extract literal and language separately
			return raptor_new_term_from_literal(world, (unsigned char *)str.substr(1, pos-1).c_str(), NULL, (unsigned char *)str.substr(pos+2).c_str());
		}
		// Remove " "
		return raptor_new_term_from_literal(world, (const unsigned char *)str.substr(1, str.length()-2).c_str(), NULL, NULL);
	} else if(str.at(0)=='_') {
		return raptor_new_term_from_blank(world, (const unsigned char *)str.c_str());
	} else {
		return raptor_new_term_from_uri_string(world, (const unsigned char *)str.c_str());
	}
}

const char *RDFSerializerRaptor::getType(RDFNotation notation) {
	switch(notation) {
	case NQUAD:
		return "nquad";
	case N3:
		return "n3";
	case NTRIPLES:
		return "ntriples";
	case XML:
		return "rdfxml-abbrev";
	case TURTLE:
		return "turtle";
	}
	return "ntriples";
}

#include <stdio.h>

void RDFSerializerRaptor::serialize(IteratorTripleString *it, ProgressListener *listener, unsigned int totalTriples)
{
	unsigned int numTriple=0;
	while( it->hasNext() ) {
		TripleString *ts = it->next();

		if(!ts->isEmpty()) {
			raptor_statement* triple = raptor_new_statement(world);
			triple->subject = getTerm(ts->getSubject(), world);
			triple->predicate = getTerm(ts->getPredicate(), world);
			triple->object = getTerm(ts->getObject(), world);
			//raptor_statement_print(triple, stdout);
			raptor_serializer_serialize_statement(rdf_serializer, triple);
			raptor_free_statement(triple);

			NOTIFYCOND(listener, "Exporting HDT to RDF", numTriple, totalTriples);
		}
		numTriple++;
	}
}

void RDFSerializerRaptor::serialize(BitmapTriplespp *triples, Dictionary *dict){

    Families *families = triples->getFamilies();
    PermS *permS = triples->getPermS();
    Types *types = triples->getTypes();
    PermO *permO = triples->getPermO();
    AdjSO *adjSO = triples->getAdjSO();
    uint nFamilias = families->getNumberOfFamilies();
    //uint nPredicados = dictionary->getMaxPredicateID();

    cout<<endl<<"Saving RDF..."<<endl;

    for (size_t p=1; p<=permO->getNumberOfPredicates(); p++){
       // Families where predicate "p" is
       size_t nFamiliesInPredicate = families->getNumberOfFamilies(p);
       if (nFamiliesInPredicate==0){

           // If predicate does not belong to any family -> rdf:type
           for (size_t idFamily=1; idFamily<=nFamilias; idFamily++){
               if (types->hasTypes(idFamily)){
                   permS->getSubjects(idFamily);
                   while (permS->hasMoreSubjects()){
                       uint idSubject = permS->nextSubject();
                       types->getTypes(idFamily);
                       while (types->hasMoreTypes()){
                            unsigned int type = types->nextType();
                            raptor_statement* triple = raptor_new_statement(world);
                            string subjectStr = dict->idToString(idSubject,SUBJECT);
                            string& sStr = subjectStr;
                            triple->subject = getTerm(sStr, world);
                            string predicateStr = dict->idToString(p,PREDICATE);
                            string& pStr = predicateStr;
                            triple->predicate = getTerm(pStr, world);
                            string objectStr = dict->idToString(type,OBJECT);
                            string& oStr = objectStr;
                            triple->object = getTerm(oStr, world);
                            raptor_serializer_serialize_statement(rdf_serializer, triple);
                            raptor_free_statement(triple);
                       }
                   }
               }
           }
       } else {
           size_t z = 0;
           for (uint f=1; f<=nFamiliesInPredicate; f++){
               unsigned int idFamily = families->access(p,f-1);
               permS->getSubjects(idFamily);
               while (permS->hasMoreSubjects()){
                   uint idSubject = permS->nextSubject();
                   do{
                        unsigned int idLocalObject = adjSO->access(p,z)+1;
                        unsigned int idGlobalObject = permO->getDictID(p,idLocalObject);
                        raptor_statement* triple = raptor_new_statement(world);
                        string subjectStr = dict->idToString(idSubject,SUBJECT);
                        string& sStr = subjectStr;
                        triple->subject = getTerm(sStr, world);
                        string predicateStr = dict->idToString(p,PREDICATE);
                        string& pStr = predicateStr;
                        triple->predicate = getTerm(pStr, world);
                        string objectStr = dict->idToString(idGlobalObject,OBJECT);
                        string& oStr = objectStr;
                        triple->object = getTerm(oStr, world);
                        raptor_serializer_serialize_statement(rdf_serializer, triple);
                        raptor_free_statement(triple);
                        z++;

                   } while (adjSO->getBit(p, z-1)==0);
               }
           }
       }
   }



}


}
#endif
