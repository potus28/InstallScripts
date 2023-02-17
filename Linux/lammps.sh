rm -r install
rm -r build

mkdir -p install
installdir=$(pwd)/install
mkdir -p build

cd build

cmake ../cmake \
-D CMAKE_INSTALL_PREFIX=$installdir \
-D BUILD_MPI=yes   \
-D BUILD_OMP=yes \
-D LAMMPS_MACHINE=cori \
-D CMAKE_C_COMPILER=cc -D CMAKE_CXX_COMPILER=CC -D CMAKE_Fortran_COMPILER=ftn \
-D CMAKE_C_FLAGS="-O3" -D CMAKE_CXX_FLAGS="-O3 -std=c++11" -D CMAKE_Fortran_FLAGS="-O3" \
-D BUILD_TOOLS=yes -D DOWNLOAD_EIGEN3=yes -D PKG_MACHDYN=yes -D PKG_PYTHON=yes -D LAMMPS_EXCEPTIONS=yes -D BUILD_SHARED_LIBS=yes \
-D PKG_MANYBODY=yes -D PKG_KSPACE=yes -D PKG_MOLECULE=yes -D PKG_SHOCK=yes -D PKG_MC=yes -D PKG_CLASS2=yes \
-D PKG_COLLOID=yes -D PKG_COLVARS=yes -D PKG_EXTRA-COMPUTE=yes -D PKG_EXTRA-DUMP=yes -D PKG_EXTRA-FIX=yes \
-D PKG_EXTRA-MOLECULE=yes -D PKG_MEAM=yes -D PKG_MOFFF=yes -D PKG_MOLFILE=yes -D PKG_REAXFF=yes -D PKG_REACTION=yes \
-D PKG_REPLICA=yes

make -j 4 && make install
