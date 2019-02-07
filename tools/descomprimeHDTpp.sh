#!/bin/bash
# argumento1 => Fichero hdtpp
rm -f /home/antonio/hdt-lib-rc1-src/tools/tiempos.txt

###############
# TDENS_S=128 # 
###############

#Comenzamos con TDENS_S=128 y TDENS_O=128
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=64
sed 's/#define TDENS_O 128/#define TDENS_O 64/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=32
sed 's/#define TDENS_O 64/#define TDENS_O 32/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=16
sed 's/#define TDENS_O 32/#define TDENS_O 16/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=8
sed 's/#define TDENS_O 16/#define TDENS_O 8/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=4
sed 's/#define TDENS_O 8/#define TDENS_O 4/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=2
sed 's/#define TDENS_O 4/#define TDENS_O 2/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

###############
# TDENS_S=64  # 
###############

sed 's/#define TDENS 128/#define TDENS 64/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 128/#define TDENS 64/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp

#TDENS_O=128
sed 's/#define TDENS_O 2/#define TDENS_O 128/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=64
sed 's/#define TDENS_O 128/#define TDENS_O 64/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=32
sed 's/#define TDENS_O 64/#define TDENS_O 32/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=16
sed 's/#define TDENS_O 32/#define TDENS_O 16/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=8
sed 's/#define TDENS_O 16/#define TDENS_O 8/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=4
sed 's/#define TDENS_O 8/#define TDENS_O 4/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=2
sed 's/#define TDENS_O 4/#define TDENS_O 2/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1


###############
# TDENS_S=32  # 
###############

sed 's/#define TDENS 64/#define TDENS 32/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 64/#define TDENS 32/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp

#TDENS_O=128
sed 's/#define TDENS_O 2/#define TDENS_O 128/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=64
sed 's/#define TDENS_O 128/#define TDENS_O 64/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=32
sed 's/#define TDENS_O 64/#define TDENS_O 32/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=16
sed 's/#define TDENS_O 32/#define TDENS_O 16/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=8
sed 's/#define TDENS_O 16/#define TDENS_O 8/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=4
sed 's/#define TDENS_O 8/#define TDENS_O 4/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=2
sed 's/#define TDENS_O 4/#define TDENS_O 2/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1


###############
# TDENS_S=16  # 
###############

sed 's/#define TDENS 32/#define TDENS 16/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 32/#define TDENS 16/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp

#TDENS_O=128
sed 's/#define TDENS_O 2/#define TDENS_O 128/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=64
sed 's/#define TDENS_O 128/#define TDENS_O 64/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=32
sed 's/#define TDENS_O 64/#define TDENS_O 32/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=16
sed 's/#define TDENS_O 32/#define TDENS_O 16/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=8
sed 's/#define TDENS_O 16/#define TDENS_O 8/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=4
sed 's/#define TDENS_O 8/#define TDENS_O 4/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=2
sed 's/#define TDENS_O 4/#define TDENS_O 2/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

###############
# TDENS_S=8   # 
###############

sed 's/#define TDENS 16/#define TDENS 8/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 16/#define TDENS 8/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp

#TDENS_O=128
sed 's/#define TDENS_O 2/#define TDENS_O 128/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=64
sed 's/#define TDENS_O 128/#define TDENS_O 64/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=32
sed 's/#define TDENS_O 64/#define TDENS_O 32/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=16
sed 's/#define TDENS_O 32/#define TDENS_O 16/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=8
sed 's/#define TDENS_O 16/#define TDENS_O 8/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=4
sed 's/#define TDENS_O 8/#define TDENS_O 4/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=2
sed 's/#define TDENS_O 4/#define TDENS_O 2/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1


###############
# TDENS_S=4   # 
###############

sed 's/#define TDENS 8/#define TDENS 4/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 8/#define TDENS 4/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp

#TDENS_O=128
sed 's/#define TDENS_O 2/#define TDENS_O 128/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=64
sed 's/#define TDENS_O 128/#define TDENS_O 64/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=32
sed 's/#define TDENS_O 64/#define TDENS_O 32/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=16
sed 's/#define TDENS_O 32/#define TDENS_O 16/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=8
sed 's/#define TDENS_O 16/#define TDENS_O 8/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=4
sed 's/#define TDENS_O 8/#define TDENS_O 4/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=2
sed 's/#define TDENS_O 4/#define TDENS_O 2/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1


###############
# TDENS_S=2   # 
###############

sed 's/#define TDENS 4/#define TDENS 2/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 4/#define TDENS 2/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp

#TDENS_O=128
sed 's/#define TDENS_O 2/#define TDENS_O 128/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=64
sed 's/#define TDENS_O 128/#define TDENS_O 64/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=32
sed 's/#define TDENS_O 64/#define TDENS_O 32/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=16
sed 's/#define TDENS_O 32/#define TDENS_O 16/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=8
sed 's/#define TDENS_O 16/#define TDENS_O 8/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=4
sed 's/#define TDENS_O 8/#define TDENS_O 4/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#TDENS_O=2
sed 's/#define TDENS_O 4/#define TDENS_O 2/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp
cd /home/antonio/hdt-lib-rc1-src
make
./tools/leehdtpp $1

#### Lo dejamos a 128 los 2 ######

sed 's/#define TDENS 2/#define TDENS 128/g' /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp > /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/hdtpp/test.txt /home/antonio/hdt-lib-rc1-src/src/hdtpp/HDTpp.cpp
sed 's/#define TDENS 2/#define TDENS 128/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV.hpp
sed 's/#define TDENS_O 2/#define TDENS_O 128/g' /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp > /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt
mv /home/antonio/hdt-lib-rc1-src/src/adjacencylist/test.txt /home/antonio/hdt-lib-rc1-src/src/adjacencylist/PermutationCIV2.hpp

