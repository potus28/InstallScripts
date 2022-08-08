#!/bin/bash

rm -r install
rm -r build

mkdir -p install
installdir=$(pwd)/install
mkdir -p build

cd build

cmake ../cmake \
-D CMAKE_INSTALL_PREFIX=$installdir \
-D BUILD_MPI=no   \
-D BUILD_OMP=yes \
-D LAMMPS_MACHINE=onyx \
-D CMAKE_C_COMPILER=gcc -D CMAKE_CXX_COMPILER=g++ -D CMAKE_Fortran_COMPILER=gfortran\
-D CMAKE_C_FLAGS=-O3 -D CMAKE_CXX_FLAGS="-O3 -std=c++11" -D CMAKE_Fortran_FLAGS=-O3 \
-D BUILD_TOOLS=yes -D BUILD_LAMMPS_SHELL=yes \
-D PKG_MANYBODY=yes -D PKG_KSPACE=yes -D PKG_MOLECULE=yes -D PKG_SHOCK=yes -D PKG_MC=yes -D PKG_CLASS2=yes \
-D PKG_COLLOID=yes -D PKG_COLVARS=yes -D PKG_EXTRA-COMPUTE=yes -D PKG_EXTRA-DUMP=yes -D PKG_EXTRA-FIX=yes \
-D PKG_EXTRA-MOLECULE=yes -D PKG_MEAM=yes -D PKG_MOFFF=yes -D PKG_MOLFILE=yes -D PKG_REAXFF=yes -D PKG_REACTION=yes \
-D PKG_REPLICA=yes
