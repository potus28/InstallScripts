#!/bin/bash

libvori_version=220621

wget https://brehm-research.de/files/libvori-$libvori_version.tar.gz
tar -xzvf libvori-$libvori_version.tar.gz
mv libvori-$libvori_version $libvori_version
cd $libvori_version

mkdir build
cd build
cmake .. 
make 
