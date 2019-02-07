#!/bin/bash

# argumento1 => Fichero hdtpp
# argumento2 => Fichero hdt

rm -f /home/antonio/hdt-lib-rc1-src/tools/tiempos.txt
#Comenzamos con TDENS=128
cd /home/antonio/hdt-lib-rc1-src
make
./tools/testhdtpp $1

#TDENS=64
sed 's/#define TDENS 128/#define TDENS 64/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 128/#define TDENS 64/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/testhdtpp $1

#TDENS=32
sed 's/#define TDENS 64/#define TDENS 32/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 64/#define TDENS 32/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/testhdtpp $1

#TDENS=16
sed 's/#define TDENS 32/#define TDENS 16/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 32/#define TDENS 16/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/testhdtpp $1

#TDENS=8
sed 's/#define TDENS 16/#define TDENS 8/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 16/#define TDENS 8/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/testhdtpp $1

#TDENS=4
sed 's/#define TDENS 8/#define TDENS 4/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 8/#define TDENS 4/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/testhdtpp $1

#TDENS=2
sed 's/#define TDENS 4/#define TDENS 2/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 4/#define TDENS 2/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/testhdtpp $1; ./tools/testhdt $2

#VOLVEMOS A TDENS=128
sed 's/#define TDENS 2/#define TDENS 128/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 2/#define TDENS 128/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp
