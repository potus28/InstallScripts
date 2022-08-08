#!/bin/bash

mkdir -p install
prefix=$(pwd)/install

./configure --prefix=$prefix \
	--enable-float=yes \
	--enable-sse2=yes \
	--enable-avx=yes \
	--enable-avx2=yes \
	--enable-fma=yes \
	--enable-mpi=yes \
	--enable-fortran=yes \
	--enable-openmp=yes \
	--enable-threads=yes\
	--enable-shared=yes
	
make -j $(nproc) && make install
