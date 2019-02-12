# Foundations

This is the RDF/HDT++ source code. HDT++ uses RDF-TR (RDF Triples Reorganization)[1], an RDF triples reorganization technique mainly based on predicate-families extraction. A seminal paper was presented at the DCC (Data Compression Conference)[2] in 2015.

The datasets evaluated in [1] (as well as others) can be found at the following address: http://www.rdfhdt.org/datasets/
* [DBLP](http://gaia.infor.uva.es/hdt/dblp-2012-11-28.hdt.gz)
* [DBTune](http://www.rdfhdt.org/datasets/)
* [US Census](http://www.rdfhdt.org/datasets/)
* [LinkedGeoData](http://www.rdfhdt.org/datasets/)
* [DBPedia](http://www.rdfhdt.org/datasets/)

# HDT++

To recompress any HDT file into HDT++ just:
> [HDT++ Path]/tools/hdt2hdtpp <yourfile.hdt> <yourfile.hdtpp>

# K2-triples++

RDF-TR can be used as part of k2-triples[3]. To do so, a series of steps are required:
> [HDT++ Path]/tools/primeros2int <file>

It will create a file of the form (P-S*-O*) that k2triples will use to build the k2trees with local IDs. To generate the k2-triples++ file execute the following command: 

> [k2Triples Path]/

# References

[1] A. Hernández-Illera, M.A. Martínez-Prieto, and J.D. Fernández. RDF-TR: Exploiting Structural Redundancies to boost RDF Compression. In Information Sciences, under review. 
[2] A. Hernández-Illera, M.A. Martínez-Prieto, and J.D. Fernández. Serializing RDF in Compressed Space. In Proceedings of the Data Compression Conference (DCC), pages 363–372, 2015.
[3] S. Álvarez-García, N. Brisaboa, J.D. Fernández, M.A. Martínez-Prieto, and G. Navarro. Compressed Vertical Partitioning for Efficient RDF Management. Knowledge and Information Systems, 44(2):439– 474, 2014.
