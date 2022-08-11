#!/bin/bash

libxc_version=5.2.3
wget http://www.tddft.org/programs/libxc/down.php?file=$libxc_version/libxc-$libxc_version.tar.gz

tar -xzvf down.php?file=$libxc_version%2Flibxc-$libxc_version.tar.gz
mv libxc-$libxc_version $libxc_version

cd $libxc_version
mv INSTALL INSTALL.md

mkdir -p install
mkdir -p build

prefix=$(pwd)/install
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=$prefix -DENABLE_FORTRAN=ON

`make && make install
