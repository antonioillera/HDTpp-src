#-------------------------------------------------
#
# Project created by QtCreator 2011-06-16T15:23:01
#
#-------------------------------------------------

QT       -= core gui

QMAKE_CXXFLAGS_RELEASE -= -O2
QMAKE_CXXFLAGS_RELEASE += -O3

#macx:QMAKE_CXXFLAGS += -msse4.2

win32-g++:contains(QMAKE_HOST.arch, x86_64):{
        CONFIG += exceptions rtti
}

CONFIG += debug_and_release
macx:CONFIG += x86_64

TARGET = hdt
TEMPLATE = lib
CONFIG += staticlib

DEFINES += USE_LIBZ USE_RAPTOR RAPTOR_STATIC

win32:OutputDir = 'win32'
unix:OutputDir = 'unix'
macx:OutputDir = 'macx'

DESTDIR = $${OutputDir}
OBJECTS_DIR = $${OutputDir}
MOC_DIR = $${OutputDir}
RCC_DIR = $${OutputDir}
UI_DIR = $${OutputDir}

SOURCES += \
    ../src/hdt/HDTSpecification.cpp \
    ../src/hdt/HDTFactory.cpp \
    ../src/hdt/HDTManager.cpp \
    ../src/hdt/ControlInformation.cpp \
    ../src/hdt/BasicHDT.cpp \
    ../src/hdt/BasicModifiableHDT.hpp \
    ../src/util/StopWatch.cpp \
    ../src/util/propertyutil.cpp \
    ../src/triples/TriplesList.cpp \
    ../src/triples/TriplesComparator.cpp \
    ../src/triples/TripleOrderConvert.cpp \
    ../src/triples/TripleIterators.cpp \
    ../src/triples/PlainTriples.cpp \
    ../src/triples/CompactTriples.cpp \
    ../src/triples/BitmapTriples.cpp \
    ../src/triples/BitmapTriplesIterators.cpp \
    ../src/triples/TripleListDisk.cpp \
    ../src/triples/TriplesKyoto.cpp \
    ../src/huffman/Huffman.cpp \
    ../src/huffman/huff.cpp \
    ../src/header/PlainHeader.cpp \
    ../src/libdcs/VByte.cpp \
    ../src/libdcs/CSD.cpp \
    ../src/libdcs/CSD_PFC.cpp \
    ../src/libdcs/CSD_HTFC.cpp \
    ../src/libdcs/CSD_FMIndex.cpp \
    ../src/libdcs/CSD_Cache2.cpp \
    ../src/libdcs/CSD_Cache.cpp \
    ../src/libdcs/fmindex/SuffixArray.cpp \
    ../src/libdcs/fmindex/SSA.cpp \
    ../src/dictionary/PlainDictionary.cpp \
    ../src/dictionary/FourSectionDictionary.cpp \
    ../src/dictionary/KyotoDictionary.cpp \
    ../src/dictionary/LiteralDictionary.cpp \
    ../src/rdf/RDFParserNtriples.cpp \
    ../src/rdf/RDFParser.cpp \
    ../src/rdf/RDFSerializerNTriples.cpp \
    ../src/rdf/RDFSerializerRaptor.cpp \
    ../src/rdf/RDFSerializer.cpp \
    ../src/util/fileUtil.cpp \
    ../src/rdf/RDFParserRaptorCallback.cpp \
    ../src/sparql/TriplePatternBinding.cpp \
    ../src/sparql/MergeJoinBinding.cpp \
    ../src/sparql/JoinAlgorithms.cpp \
    ../src/sparql/IndexJoinBinding.cpp \
    ../src/sparql/CachedBinding.cpp \
    ../src/sparql/BaseJoinBinding.cpp \
    ../src/sparql/SortBinding.cpp \
    ../src/sequence/WaveletSequence.cpp \
    ../src/sequence/LogSequence2.cpp \
    ../src/sequence/LogSequence.cpp \
    ../src/sequence/IntSequence.cpp \
    ../src/sequence/HuffmanSequence.cpp \
    ../src/sequence/ArraySequence.cpp \
    ../src/sequence/AdjacencyList.cpp \
    ../src/hdt/TripleIDStringIterator.cpp \
    ../src/hdt/BasicModifiableHDT.cpp \
    ../src/sparql/QueryProcessor.cpp \
    ../src/bitsequence/BitSequence375.cpp \
    ../src/util/crc32.cpp \
    ../src/util/crc16.cpp \
    ../src/util/crc8.cpp \
    ../src/util/bitutil.cpp \
    ../src/util/filemap.cpp \
    ../third/gzstream.cpp \
    ../src/rdf/RDFParserNtriplesCallback.cpp \
    ../src/libdac/DAC_VLS.cpp \
    ../src/sequence/PlainALSequence.cpp \
    ../src/sequence/PlainAdjacencyList.cpp \
    ../src/sequence/SearchableAL.cpp \
    ../src/sequence/SearchableALSDArray.cpp \
    ../src/hdtpp/HDTpp.cpp \
    ../src/hdtpp/BitmapTriplespp.cpp \
    ../deps/libcds-v1.0.12/src/utils/BitString.cpp \
    ../src/hdtpp/util/BitString.cpp \
    ../src/adjacencylist/SerializableAdjList.cpp \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequence.cpp \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceBuilderDArray.cpp \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceBuilderRG.cpp \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceBuilderRRR.cpp \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceBuilderSDArray.cpp \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceDArray.cpp \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceRG.cpp \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceRRR.cpp \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceSDArray.cpp \
    ../deps/libcds-v1.0.12/src/static/bitsequence/sdarraySadakane.cpp \
    ../deps/libcds-v1.0.12/src/static/bitsequence/TableOffsetRRR.cpp \
    ../deps/libcds-v1.0.12/src/static/coders/huff.cpp \
    ../deps/libcds-v1.0.12/src/static/coders/HuffmanCoder.cpp \
    ../deps/libcds-v1.0.12/src/static/mapper/Mapper.cpp \
    ../deps/libcds-v1.0.12/src/static/mapper/MapperCont.cpp \
    ../deps/libcds-v1.0.12/src/static/mapper/MapperNone.cpp \
    ../deps/libcds-v1.0.12/src/static/mapper/MapperRev.cpp \
    ../deps/libcds-v1.0.12/src/static/permutation/perm.cpp \
    ../deps/libcds-v1.0.12/src/static/permutation/Permutation.cpp \
    ../deps/libcds-v1.0.12/src/static/permutation/PermutationBuilderMRRR.cpp \
    ../deps/libcds-v1.0.12/src/static/permutation/PermutationBuilderWT.cpp \
    ../deps/libcds-v1.0.12/src/static/permutation/PermutationMRRR.cpp \
    ../deps/libcds-v1.0.12/src/static/permutation/PermutationWT.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/BitmapsSequence.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/Sequence.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceAlphPart.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderAlphPart.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderGMR.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderGMRChunk.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderStr.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderWaveletMatrix.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderWaveletTree.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderWaveletTreeNoptrs.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderWaveletTreeNoptrsS.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceGMR.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceGMRChunk.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/WaveletMatrix.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/WaveletTree.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/WaveletTreeNoptrs.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/WaveletTreeNoptrsS.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_coder.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_coder_binary.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_coder_huff.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_node.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_node_internal.cpp \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_node_leaf.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/factorization.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/factorization_var.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_DAC.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_DAC_VAR.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_FMN.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_naive.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_PhiSpare.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_PT.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_Sad.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/NPR.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/NPR_CN.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/NPR_FMN.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/NSV.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/PSV.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/RMQ_succinct.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/RMQ_succinct_lcp.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/SuffixTree.cpp \
    ../deps/libcds-v1.0.12/src/static/suffixtree/SuffixTreeY.cpp \
    ../deps/libcds-v1.0.12/src/static/textindex/comparray4.cpp \
    ../deps/libcds-v1.0.12/src/static/textindex/mmap.cpp \
    ../deps/libcds-v1.0.12/src/static/textindex/qsufsort.cpp \
    ../deps/libcds-v1.0.12/src/static/textindex/suftest3.test.cpp \
    ../deps/libcds-v1.0.12/src/static/textindex/TextIndex.cpp \
    ../deps/libcds-v1.0.12/src/static/textindex/TextIndexCSA.cpp \
    ../deps/libcds-v1.0.12/src/utils/Array.cpp \
    ../deps/libcds-v1.0.12/src/utils/cppUtils.cpp \
    ../deps/libcds-v1.0.12/src/utils/timing.cpp \
    ../deps/libcds-v1.0.12/tests/testArray.cpp \
    ../deps/libcds-v1.0.12/tests/testBitSequence.cpp \
    ../deps/libcds-v1.0.12/tests/testHuffman.cpp \
    ../deps/libcds-v1.0.12/tests/testLCP.cpp \
    ../deps/libcds-v1.0.12/tests/testNPR.cpp \
    ../deps/libcds-v1.0.12/tests/testQuantile.cpp \
    ../deps/libcds-v1.0.12/tests/testSequence.cpp \
    ../deps/libcds-v1.0.12/tests/testSuffixTree.cpp \
    ../deps/libcds-v1.0.12/tests/testTextIndex.cpp \
    ../deps/libcds-v1.0.12/tests/timeSequence.cpp \
    ../deps/libcds-v1.0.12/tests/toArray.cpp \
    ../deps/libcds-v1.0.12/tests/toArray2.cpp \
    ../deps/libcds-v1.0.12/tutorial/src/ArrayExample.cpp \
    ../deps/libcds-v1.0.12/tutorial/src/ArrayExample2.cpp \
    ../deps/libcds-v1.0.12/tutorial/src/BitSequenceRGExample.cpp \
    ../deps/libcds-v1.0.12/tutorial/src/BitSequenceRRRExample.cpp \
    ../deps/libcds-v1.0.12/tutorial/src/BitSequenceSDArrayExample.cpp \
    ../deps/libcds-v1.0.12/tutorial/src/SequenceAlphPartExample.cpp \
    ../deps/libcds-v1.0.12/tutorial/src/SequenceGMRExample.cpp \
    ../deps/libcds-v1.0.12/tutorial/src/SequenceWaveletTreeExample.cpp \
    ../deps/libcds-v1.0.12/tutorial/ssa/build_index.cpp \
    ../deps/libcds-v1.0.12/tutorial/ssa/dump_bwt.cpp \
    ../deps/libcds-v1.0.12/tutorial/ssa/ssa.cpp \
    ../deps/libcds-v1.0.12/tutorial/ssa/test_count.cpp \
    ../examples/generate.cpp \
    ../examples/search.cpp \
    ../src/sequence/SearchableALDS.cpp \
    ../tools/hdt2hdtpp.cpp \
    ../tools/hdt2rdf.cpp \
    ../tools/hdtInfo.cpp \
    ../tools/hdtpp2int32.cpp \
    ../tools/hdtSearch.cpp \
    ../tools/leehdt.cpp \
    ../tools/leehdtpp.cpp \
    ../tools/rdf2hdt.cpp \
    ../tools/replaceHeader.cpp \
    ../src/util/getopt.c \
    ../tools/testhdt.cpp \
    ../tools/hdtpp2rdf.cpp \
    ../src/adjacencylist/AL.cpp \
    ../src/hdtpp/perms.cpp \
    ../src/hdtpp/PermS.cpp \
    ../src/hdtpp/PermO.cpp \
    ../src/hdtpp/Families.cpp \
    ../src/hdtpp/Types.cpp \
    ../src/hdtpp/AdjSO.cpp \
    ../tools/hdtppstatistics.cpp

HEADERS += \
    ../include/Triples.hpp \
    ../include/SingleTriple.hpp \
    ../include/RDF.hpp \
    ../include/Header.hpp \
    ../include/HDTVocabulary.hpp \
    ../include/HDTSpecification.hpp \
    ../include/HDTListener.hpp \
    ../include/HDTManager.hpp \
    ../include/HDTEnums.hpp \
    ../include/HDT.hpp \
    ../include/Iterator.hpp \
    ../include/Dictionary.hpp \
    ../include/ControlInformation.hpp \
    ../include/RDFParser.hpp \
    ../include/RDFSerializer.hpp \
    ../src/hdt/BasicHDT.hpp \
    ../src/hdt/BasicModifiableHDT.hpp \
    ../src/hdt/HDTFactory.hpp \
    ../src/dictionary/PlainDictionary.hpp \
    ../src/dictionary/KyotoDictionary.hpp \
    ../src/dictionary/FourSectionDictionary.hpp \
    ../src/dictionary/LiteralDictionary.hpp \
    ../src/triples/TriplesList.hpp \
    ../src/triples/TriplesComparator.hpp \
    ../src/triples/TripleOrderConvert.hpp \
    ../src/triples/TripleListDisk.hpp \
    ../src/triples/TripleIterators.hpp \
    ../src/triples/PlainTriples.hpp \
    ../src/triples/CompactTriples.hpp \
    ../src/triples/BitmapTriples.hpp \
    ../src/triples/TriplesKyoto.hpp \
    ../src/huffman/Huffman.h \
    ../src/huffman/huff.h \
    ../src/header/PlainHeader.hpp \
    ../src/libdcs/VByte.h \
    ../src/libdcs/CSD.h \
    ../src/libdcs/CSD_PFC.h \
    ../src/libdcs/CSD_HTFC.h \
    ../src/libdcs/CSD_FMIndex.h \
    ../src/libdcs/CSD_Cache2.h \
    ../src/libdcs/CSD_Cache.h \
    ../src/libdcs/fmindex/SuffixArray.h \
    ../src/libdcs/fmindex/SSA.h \
    ../src/rdf/RDFParserNtriples.hpp \
    ../src/rdf/RDFSerializerNTriples.hpp \
    ../src/rdf/RDFSerializerRaptor.hpp \
    ../src/rdf/RDFParserRaptorCallback.hpp \
    ../src/sparql/VarBindingInterface.hpp \
    ../src/sparql/TriplePatternBinding.hpp \
    ../src/sparql/MergeJoinBinding.hpp \
    ../src/sparql/joins.hpp \
    ../src/sparql/JoinAlgorithms.hpp \
    ../src/sparql/IndexJoinBinding.hpp \
    ../src/sparql/CachedBinding.hpp \
    ../src/sparql/BaseJoinBinding.hpp \
    ../src/sparql/VarFilterBinding.hpp \
    ../src/sparql/SortBinding.hpp \
    ../src/sequence/WaveletSequence.hpp \
    ../src/sequence/LogSequence2.hpp \
    ../src/sequence/LogSequence.hpp \
    ../src/sequence/IntSequence.hpp \
    ../src/sequence/HuffmanSequence.hpp \
    ../src/sequence/ArraySequence.hpp \
    ../src/sequence/AdjacencyList.hpp \
    ../src/hdt/TripleIDStringIterator.hpp \
    ../src/sparql/QueryProcessor.hpp \
    ../src/util/fileUtil.hpp \
    ../src/util/StopWatch.hpp \
    ../src/util/fdstream.hpp \
    ../src/util/propertyutil.h \
    ../src/util/Histogram.h \
    ../src/bitsequence/BitSequence375.h \
    ../src/bitsequence/BitSeq.h \
    ../src/util/crc32.h \
    ../src/util/crc16.h \
    ../src/util/crc8.h \
    ../src/util/bitutil.h \
    ../src/util/filemap.h \
    ../third/fdstream.hpp \
    ../third/gzstream.h \
    ../src/rdf/RDFParserNtriplesCallback.hpp \
    ../src/libdac/DAC_VLS.h \
    ../src/sequence/PlainALSequence.hpp \
    ../src/sequence/PlainAdjacencyList.hpp \
    ../src/sequence/SearchableAL.hpp \
    ../src/sequence/SearchableALSDArray.hpp \
    ../src/hdtpp/HDTpp.hpp \
    ../src/adjacencylist/AdjList.hpp \
    ../src/hdtpp/BitmapTriplespp.hpp \
    ../deps/libcds-v1.0.12/src/utils/BitString.h \
    ../src/hdtpp/util/BitString.h \
    ../deps/libcds-v1.0.12/includes/Array.h \
    ../deps/libcds-v1.0.12/includes/BitmapsSequence.h \
    ../deps/libcds-v1.0.12/includes/BitSequence.h \
    ../deps/libcds-v1.0.12/includes/BitSequenceBuilder.h \
    ../deps/libcds-v1.0.12/includes/BitSequenceBuilderDArray.h \
    ../deps/libcds-v1.0.12/includes/BitSequenceBuilderRG.h \
    ../deps/libcds-v1.0.12/includes/BitSequenceBuilderRRR.h \
    ../deps/libcds-v1.0.12/includes/BitSequenceBuilderSDArray.h \
    ../deps/libcds-v1.0.12/includes/BitSequenceDArray.h \
    ../deps/libcds-v1.0.12/includes/BitSequenceRG.h \
    ../deps/libcds-v1.0.12/includes/BitSequenceRRR.h \
    ../deps/libcds-v1.0.12/includes/BitSequenceSDArray.h \
    ../deps/libcds-v1.0.12/includes/BitString.h \
    ../deps/libcds-v1.0.12/includes/Coder.h \
    ../deps/libcds-v1.0.12/includes/comparray4.h \
    ../deps/libcds-v1.0.12/includes/cppUtils.h \
    ../deps/libcds-v1.0.12/includes/factorization.h \
    ../deps/libcds-v1.0.12/includes/factorization_var.h \
    ../deps/libcds-v1.0.12/includes/huff.h \
    ../deps/libcds-v1.0.12/includes/HuffmanCoder.h \
    ../deps/libcds-v1.0.12/includes/interface.h \
    ../deps/libcds-v1.0.12/includes/LCP.h \
    ../deps/libcds-v1.0.12/includes/LCP_DAC.h \
    ../deps/libcds-v1.0.12/includes/LCP_DAC_VAR.h \
    ../deps/libcds-v1.0.12/includes/LCP_FMN.h \
    ../deps/libcds-v1.0.12/includes/LCP_naive.h \
    ../deps/libcds-v1.0.12/includes/LCP_PhiSpare.h \
    ../deps/libcds-v1.0.12/includes/LCP_PT.h \
    ../deps/libcds-v1.0.12/includes/LCP_Sad.h \
    ../deps/libcds-v1.0.12/includes/libcdsBasics.h \
    ../deps/libcds-v1.0.12/includes/libcdsSDArray.h \
    ../deps/libcds-v1.0.12/includes/libcdsTrees.h \
    ../deps/libcds-v1.0.12/includes/Mapper.h \
    ../deps/libcds-v1.0.12/includes/MapperCont.h \
    ../deps/libcds-v1.0.12/includes/MapperNone.h \
    ../deps/libcds-v1.0.12/includes/MapperRev.h \
    ../deps/libcds-v1.0.12/includes/mmap.h \
    ../deps/libcds-v1.0.12/includes/NPR.h \
    ../deps/libcds-v1.0.12/includes/NPR_CN.h \
    ../deps/libcds-v1.0.12/includes/NPR_FMN.h \
    ../deps/libcds-v1.0.12/includes/NSV.h \
    ../deps/libcds-v1.0.12/includes/perm.h \
    ../deps/libcds-v1.0.12/includes/Permutation.h \
    ../deps/libcds-v1.0.12/includes/PermutationBuilder.h \
    ../deps/libcds-v1.0.12/includes/PermutationBuilderMRRR.h \
    ../deps/libcds-v1.0.12/includes/PermutationBuilderWT.h \
    ../deps/libcds-v1.0.12/includes/PermutationMRRR.h \
    ../deps/libcds-v1.0.12/includes/PermutationWT.h \
    ../deps/libcds-v1.0.12/includes/PSV.h \
    ../deps/libcds-v1.0.12/includes/RMQ_succinct.h \
    ../deps/libcds-v1.0.12/includes/RMQ_succinct_lcp.h \
    ../deps/libcds-v1.0.12/includes/sdarraySadakane.h \
    ../deps/libcds-v1.0.12/includes/Sequence.h \
    ../deps/libcds-v1.0.12/includes/SequenceAlphPart.h \
    ../deps/libcds-v1.0.12/includes/SequenceBuilder.h \
    ../deps/libcds-v1.0.12/includes/SequenceBuilderAlphPart.h \
    ../deps/libcds-v1.0.12/includes/SequenceBuilderGMR.h \
    ../deps/libcds-v1.0.12/includes/SequenceBuilderGMRChunk.h \
    ../deps/libcds-v1.0.12/includes/SequenceBuilderStr.h \
    ../deps/libcds-v1.0.12/includes/SequenceBuilderWaveletMatrix.h \
    ../deps/libcds-v1.0.12/includes/SequenceBuilderWaveletTree.h \
    ../deps/libcds-v1.0.12/includes/SequenceBuilderWaveletTreeNoptrs.h \
    ../deps/libcds-v1.0.12/includes/SequenceBuilderWaveletTreeNoptrsS.h \
    ../deps/libcds-v1.0.12/includes/SequenceGMR.h \
    ../deps/libcds-v1.0.12/includes/SequenceGMRChunk.h \
    ../deps/libcds-v1.0.12/includes/SuffixTree.h \
    ../deps/libcds-v1.0.12/includes/SuffixTreeY.h \
    ../deps/libcds-v1.0.12/includes/TableOffsetRRR.h \
    ../deps/libcds-v1.0.12/includes/TextIndex.h \
    ../deps/libcds-v1.0.12/includes/TextIndexCSA.h \
    ../deps/libcds-v1.0.12/includes/timing.h \
    ../deps/libcds-v1.0.12/includes/WaveletMatrix.h \
    ../deps/libcds-v1.0.12/includes/WaveletTree.h \
    ../deps/libcds-v1.0.12/includes/WaveletTreeNoptrs.h \
    ../deps/libcds-v1.0.12/includes/WaveletTreeNoptrsS.h \
    ../deps/libcds-v1.0.12/includes/wt_coder.h \
    ../deps/libcds-v1.0.12/includes/wt_coder_binary.h \
    ../deps/libcds-v1.0.12/includes/wt_coder_huff.h \
    ../deps/libcds-v1.0.12/includes/wt_node.h \
    ../deps/libcds-v1.0.12/includes/wt_node_internal.h \
    ../deps/libcds-v1.0.12/includes/wt_node_leaf.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequence.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceBuilder.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceBuilderDArray.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceBuilderRG.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceBuilderRRR.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceBuilderSDArray.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceDArray.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceRG.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceRRR.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/BitSequenceSDArray.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/sdarraySadakane.h \
    ../deps/libcds-v1.0.12/src/static/bitsequence/TableOffsetRRR.h \
    ../deps/libcds-v1.0.12/src/static/coders/Coder.h \
    ../deps/libcds-v1.0.12/src/static/coders/huff.h \
    ../deps/libcds-v1.0.12/src/static/coders/HuffmanCoder.h \
    ../deps/libcds-v1.0.12/src/static/mapper/Mapper.h \
    ../deps/libcds-v1.0.12/src/static/mapper/MapperCont.h \
    ../deps/libcds-v1.0.12/src/static/mapper/MapperNone.h \
    ../deps/libcds-v1.0.12/src/static/mapper/MapperRev.h \
    ../deps/libcds-v1.0.12/src/static/permutation/perm.h \
    ../deps/libcds-v1.0.12/src/static/permutation/Permutation.h \
    ../deps/libcds-v1.0.12/src/static/permutation/PermutationBuilder.h \
    ../deps/libcds-v1.0.12/src/static/permutation/PermutationBuilderMRRR.h \
    ../deps/libcds-v1.0.12/src/static/permutation/PermutationBuilderWT.h \
    ../deps/libcds-v1.0.12/src/static/permutation/PermutationMRRR.h \
    ../deps/libcds-v1.0.12/src/static/permutation/PermutationWT.h \
    ../deps/libcds-v1.0.12/src/static/sequence/BitmapsSequence.h \
    ../deps/libcds-v1.0.12/src/static/sequence/Sequence.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceAlphPart.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilder.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderAlphPart.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderGMR.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderGMRChunk.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderStr.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderWaveletMatrix.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderWaveletTree.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderWaveletTreeNoptrs.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceBuilderWaveletTreeNoptrsS.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceGMR.h \
    ../deps/libcds-v1.0.12/src/static/sequence/SequenceGMRChunk.h \
    ../deps/libcds-v1.0.12/src/static/sequence/WaveletMatrix.h \
    ../deps/libcds-v1.0.12/src/static/sequence/WaveletTree.h \
    ../deps/libcds-v1.0.12/src/static/sequence/WaveletTreeNoptrs.h \
    ../deps/libcds-v1.0.12/src/static/sequence/WaveletTreeNoptrsS.h \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_coder.h \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_coder_binary.h \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_coder_huff.h \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_node.h \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_node_internal.h \
    ../deps/libcds-v1.0.12/src/static/sequence/wt_node_leaf.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/factorization.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/factorization_var.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_DAC.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_DAC_VAR.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_FMN.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_naive.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_PhiSpare.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_PT.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/LCP_Sad.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/NPR.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/NPR_CN.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/NPR_FMN.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/NSV.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/PSV.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/RMQ_succinct.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/RMQ_succinct_lcp.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/SuffixTree.h \
    ../deps/libcds-v1.0.12/src/static/suffixtree/SuffixTreeY.h \
    ../deps/libcds-v1.0.12/src/static/textindex/comparray4.h \
    ../deps/libcds-v1.0.12/src/static/textindex/interface.h \
    ../deps/libcds-v1.0.12/src/static/textindex/mmap.h \
    ../deps/libcds-v1.0.12/src/static/textindex/TextIndex.h \
    ../deps/libcds-v1.0.12/src/static/textindex/TextIndexCSA.h \
    ../deps/libcds-v1.0.12/src/utils/Array.h \
    ../deps/libcds-v1.0.12/src/utils/cppUtils.h \
    ../deps/libcds-v1.0.12/src/utils/libcdsBasics.h \
    ../deps/libcds-v1.0.12/src/utils/libcdsSDArray.h \
    ../deps/libcds-v1.0.12/src/utils/libcdsTrees.h \
    ../deps/libcds-v1.0.12/src/utils/timing.h \
    ../deps/libcds-v1.0.12/tutorial/ssa/ssa.h \
    ../sdsl/include/sdsl/bit_vector_il.hpp \
    ../sdsl/include/sdsl/bit_vectors.hpp \
    ../sdsl/include/sdsl/bits.hpp \
    ../sdsl/include/sdsl/bp_support.hpp \
    ../sdsl/include/sdsl/bp_support_algorithm.hpp \
    ../sdsl/include/sdsl/bp_support_g.hpp \
    ../sdsl/include/sdsl/bp_support_gg.hpp \
    ../sdsl/include/sdsl/bp_support_sada.hpp \
    ../sdsl/include/sdsl/coder.hpp \
    ../sdsl/include/sdsl/coder_comma.hpp \
    ../sdsl/include/sdsl/coder_elias_delta.hpp \
    ../sdsl/include/sdsl/coder_elias_gamma.hpp \
    ../sdsl/include/sdsl/coder_fibonacci.hpp \
    ../sdsl/include/sdsl/config.hpp \
    ../sdsl/include/sdsl/construct.hpp \
    ../sdsl/include/sdsl/construct_bwt.hpp \
    ../sdsl/include/sdsl/construct_config.hpp \
    ../sdsl/include/sdsl/construct_isa.hpp \
    ../sdsl/include/sdsl/construct_lcp.hpp \
    ../sdsl/include/sdsl/construct_lcp_helper.hpp \
    ../sdsl/include/sdsl/construct_sa.hpp \
    ../sdsl/include/sdsl/construct_sa_se.hpp \
    ../sdsl/include/sdsl/csa_alphabet_strategy.hpp \
    ../sdsl/include/sdsl/csa_bitcompressed.hpp \
    ../sdsl/include/sdsl/csa_sada.hpp \
    ../sdsl/include/sdsl/csa_sampling_strategy.hpp \
    ../sdsl/include/sdsl/csa_wt.hpp \
    ../sdsl/include/sdsl/cst_iterators.hpp \
    ../sdsl/include/sdsl/cst_sada.hpp \
    ../sdsl/include/sdsl/cst_sct3.hpp \
    ../sdsl/include/sdsl/dac_vector.hpp \
    ../sdsl/include/sdsl/enc_vector.hpp \
    ../sdsl/include/sdsl/fast_cache.hpp \
    ../sdsl/include/sdsl/hyb_vector.hpp \
    ../sdsl/include/sdsl/int_vector.hpp \
    ../sdsl/include/sdsl/int_vector_buffer.hpp \
    ../sdsl/include/sdsl/int_vector_io_wrappers.hpp \
    ../sdsl/include/sdsl/int_vector_mapper.hpp \
    ../sdsl/include/sdsl/inv_perm_support.hpp \
    ../sdsl/include/sdsl/io.hpp \
    ../sdsl/include/sdsl/iterators.hpp \
    ../sdsl/include/sdsl/k2_treap.hpp \
    ../sdsl/include/sdsl/k2_treap_algorithm.hpp \
    ../sdsl/include/sdsl/k2_treap_helper.hpp \
    ../sdsl/include/sdsl/lcp.hpp \
    ../sdsl/include/sdsl/lcp_bitcompressed.hpp \
    ../sdsl/include/sdsl/lcp_byte.hpp \
    ../sdsl/include/sdsl/lcp_dac.hpp \
    ../sdsl/include/sdsl/lcp_support_sada.hpp \
    ../sdsl/include/sdsl/lcp_support_tree.hpp \
    ../sdsl/include/sdsl/lcp_support_tree2.hpp \
    ../sdsl/include/sdsl/lcp_vlc.hpp \
    ../sdsl/include/sdsl/lcp_wt.hpp \
    ../sdsl/include/sdsl/louds_tree.hpp \
    ../sdsl/include/sdsl/memory_management.hpp \
    ../sdsl/include/sdsl/nearest_neighbour_dictionary.hpp \
    ../sdsl/include/sdsl/nn_dict_dynamic.hpp \
    ../sdsl/include/sdsl/qsufsort.hpp \
    ../sdsl/include/sdsl/ram_filebuf.hpp \
    ../sdsl/include/sdsl/ram_fs.hpp \
    ../sdsl/include/sdsl/rank_support.hpp \
    ../sdsl/include/sdsl/rank_support_scan.hpp \
    ../sdsl/include/sdsl/rank_support_v.hpp \
    ../sdsl/include/sdsl/rank_support_v5.hpp \
    ../sdsl/include/sdsl/raster_img.hpp \
    ../sdsl/include/sdsl/rmq_succinct_sada.hpp \
    ../sdsl/include/sdsl/rmq_succinct_sct.hpp \
    ../sdsl/include/sdsl/rmq_support.hpp \
    ../sdsl/include/sdsl/rmq_support_sparse_table.hpp \
    ../sdsl/include/sdsl/rrr_helper.hpp \
    ../sdsl/include/sdsl/rrr_vector.hpp \
    ../sdsl/include/sdsl/rrr_vector_15.hpp \
    ../sdsl/include/sdsl/sd_vector.hpp \
    ../sdsl/include/sdsl/sdsl_concepts.hpp \
    ../sdsl/include/sdsl/select_support.hpp \
    ../sdsl/include/sdsl/select_support_mcl.hpp \
    ../sdsl/include/sdsl/select_support_scan.hpp \
    ../sdsl/include/sdsl/sfstream.hpp \
    ../sdsl/include/sdsl/sorted_int_stack.hpp \
    ../sdsl/include/sdsl/sorted_multi_stack_support.hpp \
    ../sdsl/include/sdsl/sorted_stack_support.hpp \
    ../sdsl/include/sdsl/structure_tree.hpp \
    ../sdsl/include/sdsl/suffix_array_algorithm.hpp \
    ../sdsl/include/sdsl/suffix_array_helper.hpp \
    ../sdsl/include/sdsl/suffix_arrays.hpp \
    ../sdsl/include/sdsl/suffix_tree_algorithm.hpp \
    ../sdsl/include/sdsl/suffix_tree_helper.hpp \
    ../sdsl/include/sdsl/suffix_trees.hpp \
    ../sdsl/include/sdsl/uint128_t.hpp \
    ../sdsl/include/sdsl/uint256_t.hpp \
    ../sdsl/include/sdsl/uintx_t.hpp \
    ../sdsl/include/sdsl/util.hpp \
    ../sdsl/include/sdsl/vectors.hpp \
    ../sdsl/include/sdsl/vlc_vector.hpp \
    ../sdsl/include/sdsl/wavelet_trees.hpp \
    ../sdsl/include/sdsl/wm_int.hpp \
    ../sdsl/include/sdsl/wt_algorithm.hpp \
    ../sdsl/include/sdsl/wt_blcd.hpp \
    ../sdsl/include/sdsl/wt_gmr.hpp \
    ../sdsl/include/sdsl/wt_helper.hpp \
    ../sdsl/include/sdsl/wt_huff.hpp \
    ../sdsl/include/sdsl/wt_hutu.hpp \
    ../sdsl/include/sdsl/wt_int.hpp \
    ../sdsl/include/sdsl/wt_pc.hpp \
    ../sdsl/include/sdsl/wt_rlmn.hpp \
    ../sdsl/include/divsufsort.h \
    ../sdsl/include/divsufsort64.h \
    ../src/libdcs/hutucker/binarynode.h \
    ../src/libdcs/hutucker/hutucker.h \
    ../src/sequence/SearchableALDS.hpp \
    ../src/util/lru.hpp \
    ../src/util/lru_cache.h \
    ../src/util/mygetopt.h \
    ../src/util/unicode.hpp \
    ../src/adjacencylist/AdjListBitvector.hpp \
    ../src/adjacencylist/PermutationCIV.hpp \
    ../src/adjacencylist/AdjListSearchable.hpp \
    ../src/adjacencylist/AL.hpp

#For hdt-lib
INCLUDEPATH += ../include

#For libcds
LIBCDSBASE = ../deps/libcds-v1.0.12/src

INCLUDEPATH += $${LIBCDSBASE}/utils \
    $${LIBCDSBASE}/static/bitsequence \
    $${LIBCDSBASE}/static/sequence \
    $${LIBCDSBASE}/static/coders \
    $${LIBCDSBASE}/static/mapper \
    $${LIBCDSBASE}/static/permutation \
    $${LIBCDSBASE}/static/textindex \
    $${LIBCDSBASE}/static/suffixtree


#For raptor
macx:INCLUDEPATH += /usr/local/include

#Windows
win32-g++:contains(QMAKE_HOST.arch, x86_64):{
    win32:INCLUDEPATH += C:/mingw64/include C:/msys/local/include
} else {
    win32:INCLUDEPATH += C:/mingw/include C:/MinGW/msys/1.0/include C:/MinGW/msys/1.0/local/include
}

OTHER_FILES += \
    ../src/libdac/DAC_VLS.o