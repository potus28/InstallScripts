#!/bin/bash

libint_version=2.6.0-cp2k-lmax-7
wget https://github.com/cp2k/libint-cp2k/releases/download/v2.6.0/libint-v$libint_version.tgz
tar -xzvf libint-v2.6.0-cp2k-lmax-7.tgz

mv libint-v2.6.0-cp2k-lmax-7 $libint_version
cd $libint_version

mkdir build
mkdir install
prefix=$(pwd)/install

cd build

cmake .. -DCMAKE_INSTALL_PREFIX=$prefix -DENABLE_FORTRAN=ON

make && make install
