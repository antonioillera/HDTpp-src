# Foundations

This is the RDF/HDT++ source code. HDT++ uses RDF-TR (RDF Triples Reorganization)[1], an RDF triples reorganization technique mainly based on predicate-families extraction. A seminal paper was presented at the DCC (Data Compression Conference)[2] in 2015.

The datasets evaluated in [1]  can be found at the following addresses:
* [DBLP](http://gaia.infor.uva.es/hdt/dblp-2012-11-28.hdt.gz)
* [DBTune](http://gaia.infor.uva.es/hdt/dbtune.hdt)
* [US Census](http://gaia.infor.uva.es/hdt/censoUS.hdt)
* [LinkedGeoData](http://gaia.infor.uva.es/hdt/linkedgeodata.hdt.gz)
* [DBPedia](http://gaia.infor.uva.es/hdt/dbpedia2015.hdt.gz)

# HDT++

To recompress any HDT file into HDT++ just:
> [HDT++ Path]/tools/hdt2hdtpp <yourfile.hdt> <yourfile.hdtpp>

# K2-triples++

RDF-TR can be used as part of k2-triples[3]. To do so, a series of steps are required:
> [HDT++ Path]/tools/extractpso <file.hdtpp> <file.pso>

It will create a file of the form (P-S*-O*) that k2triples will use to build the k2trees with local IDs. To generate the k2-triples++ files, copy the file into the following directory:

> cp <file.pso> [k2triples Path]/rdfConstruccion/

and run

> [k2triples Path]/rdfConstruccion/construccion.sh <numberofpredicates> 

The k2triples++ are now located in [k2triples Path]/rdfConstruccion/arboles

# References

The following references provide the theoretical content on RDF-TR, HDT, K2triples and their counterparts (HDT++ and k2triples++).

[1] A. Hernández-Illera, M.A. Martínez-Prieto, and J.D. Fernández. RDF-TR: Exploiting Structural Redundancies to boost RDF Compression. In Information Sciences, under review. 

[2] A. Hernández-Illera, M.A. Martínez-Prieto, and J.D. Fernández. Serializing RDF in Compressed Space. In Proceedings of the Data Compression Conference (DCC), pages 363–372, 2015.

[3] S. Álvarez-García, N. Brisaboa, J.D. Fernández, M.A. Martínez-Prieto, and G. Navarro. Compressed Vertical Partitioning for Efficient RDF Management. Knowledge and Information Systems, 44(2):439– 474, 2014.
