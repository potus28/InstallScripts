#!/bin/bash

mkdir -p install
mkdir -p build

prefix=$(pwd)/install
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$prefix -DENABLE_FORTRAN=ON

make -j 12 && make install
