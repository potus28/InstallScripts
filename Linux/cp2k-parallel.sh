#!/bin/bash

cp2k_version=2022.1
git clone --recursive -b support/v2022.1 https://github.com/cp2k/cp2k.git $cp2k_version
cd $cp2k_version

cd arch
mkdir original && mv * original







cat < EOF >>  Linux-gnu-x86_64.psmp
CC          = mpicc
FC          = mpif90
LD          = mpif90
AR          = ar -r

#include       $(MPI_PATH)/plumed2/2.6.2/lib/plumed/src/lib/Plumed.inc.static

#COSMA_INC   = $(GNU_PATH)/COSMA/2.4.0/include
#COSMA_LIB   = $(GNU_PATH)/COSMA/2.4.0/lib

#ELPA_VER    = 2020.11.001
#ELPA_INC    = $(MPI_PATH)/elpa/$(ELPA_VER)/include/elpa_openmp-$(ELPA_VER)
#ELPA_LIB    = $(MPI_PATH)/elpa/$(ELPA_VER)/lib

#FFTW_INC    = $(GNU_PATH)/fftw/3.3.9/include
#FFTW_LIB    = $(GNU_PATH)/fftw/3.3.9/lib

#LIBINT_INC  = $(GNU_PATH)/libint/2.6.0-lmax-6/include
#LIBINT_LIB  = $(GNU_PATH)/libint/2.6.0-lmax-6/lib

#LIBVORI_LIB = $(GNU_PATH)/libvori/210412/lib

#LIBXC_INC   = $(GNU_PATH)/libxc/5.1.4/include
#LIBXC_LIB   = $(GNU_PATH)/libxc/5.1.4/lib

#LIBXSMM_INC = $(GNU_PATH)/libxsmm/1.16.1/include
#LIBXSMM_LIB = $(GNU_PATH)/libxsmm/1.16.1/lib

#SIRIUS_INC  = $(GNU_PATH)/sirius/7.0.2/include
#SIRIUS_LIB  = $(GNU_PATH)/sirius/7.0.2/lib

#SPGLIB_INC  = $(GNU_PATH)/spglib/1.16.0/include
#SPGLIB_LIB  = $(GNU_PATH)/spglib/1.16.0/lib

CFLAGS = -O2 -fopenmp -fopenmp-simd -ftree-vectorize -funroll-loops -g -march=native -mtune=native

DFLAGS     = -D__MPI_VERSION=3
#DFLAGS      = -D__ELPA
#DFLAGS     += -D__FFTW3
#DFLAGS     += -D__GSL
#DFLAGS     += -D__LIBINT
#DFLAGS     += -D__LIBVORI
#DFLAGS     += -D__LIBXC
#DFLAGS     += -D__LIBXSMM

#DFLAGS     += -D__PLUMED2
#DFLAGS     += -D__SPGLIB
DFLAGS     += -D__parallel
DFLAGS     += -D__SCALAPACK
#DFLAGS     += -D__SIRIUS
#DFLAGS     += -D__CHECK_DIAG

FCFLAGS     = $(CFLAGS) $(DFLAGS)
FCFLAGS    += -fbacktrace
FCFLAGS    += -ffree-form
FCFLAGS    += -ffree-line-length-none
FCFLAGS    += -fno-omit-frame-pointer
FCFLAGS    += -std=f2008
#FCFLAGS    += -I$(COSMA_INC)
#FCFLAGS    += -I$(ELPA_INC)/elpa -I$(ELPA_INC)/modules
#FCFLAGS    += -I$(FFTW_INC)
#FCFLAGS    += -I$(LIBINT_INC)
#FCFLAGS    += -I$(LIBXC_INC)
#FCFLAGS    += -I$(LIBXSMM_INC)
#FCFLAGS    += -I$(SIRIUS_INC)
#FCFLAGS    += -I$(SPGLIB_INC)

LDFLAGS     = $(FCFLAGS) -static-libgfortran

LIBS        = $(PLUMED_DEPENDENCIES)
LIBS       += $(ELPA_LIB)/libelpa_openmp.a
LIBS       += $(LIBVORI_LIB)/libvori.a
LIBS       += $(LIBXC_LIB)/libxcf03.a
LIBS       += $(LIBXC_LIB)/libxc.a
LIBS       += $(LIBINT_LIB)/libint2.a
LIBS       += $(SPGLIB_LIB)/libsymspg.a
LIBS       += $(FFTW_LIB)/libfftw3.a
LIBS       += $(FFTW_LIB)/libfftw3_threads.a
LIBS       += $(LIBXSMM_LIB)/libxsmmf.a
LIBS       += $(LIBXSMM_LIB)/libxsmm.a
# Only needed for SIRIUS
#LIBS       += ${SIRIUS_LIB}/libsirius.a
#LIBS       += $(GNU_PATH)/SpFFT/0.9.13/lib/libspfft.a
#LIBS       += $(GNU_PATH)/SpLA/1.2.1/lib/libspla.a
#LIBS       += $(GNU_PATH)/hdf5/1.12.0/lib/libhdf5.a
#
#LIBS       += -L$(COSMA_LIB) lcosma_pxgemm -lcosma -lcosta_scalapack -lcosta
LIBS       += $(MPI_LIBRARY_PATH)/libscalapack.a
LIBS       += $(LIBPATH)/liblapack.a
LIBS       += $(GNU_PATH)/OpenBLAS/0.3.15/lib/libopenblas.a
#LIBS       += $(GSL_LIBRARY_DIR)/libgsl.a $(GSL_LIBRARY_DIR)/libgslcblas.a
LIBS       += -lz
LIBS       += -ldl
LIBS       += -lpthread
LIBS       += -lstdc++

EOF

cd ..
make ARCH= VERSION=psmp
