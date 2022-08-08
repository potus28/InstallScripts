#!/bin/bash

cd master

rm -rf autom4te.cache
mkdir m4
aclocal
autoreconf -i
automake --add-missing
autoconf

./configure --prefix=${RASPA_DIR}
# or ./scripts/CompileScript/make-gcc-local

make
make install
