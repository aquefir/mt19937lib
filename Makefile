##############################################################################
##                 Mersenne-Twister Algorithm 19937, 64-bit                 ##
##                                                                          ##
##                      Copyright © 2019-2020 Aquefir.                      ##
##                       Released under BSD-2-Clause.                       ##
##############################################################################

include etc/base.mk

PROJECT := mt19937

# put a ‘1’ for the desired target types to compile
SOFILE :=
AFILE  := 1

# space-separated path list for #includes
# <system> includes
INCLUDES := include
# "local" includes
INCLUDEL :=

# space-separated library name list
LIBS      :=
LIBDIRS   :=

# frameworks (macOS target only)
FWORKS :=

# ‘3P’ are in-tree 3rd-party dependencies
# 3PLIBDIR is the base directory
# 3PLIBS is the folder names in the base directory for each library
3PLIBDIR := 3rdparty
3PLIBS   :=

# sources
CFILES   :=
HFILES   := \
	include/mt19937/random.h
CPPFILES := \
	src/random.cpp
HPPFILES :=

# test suite sources
TES_CFILES   :=
TES_HFILES   :=
TES_CPPFILES :=
TES_HPPFILES :=

NO_TES := 1

# this defines all our usual targets
include etc/targets.mk
