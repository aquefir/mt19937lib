##############################################################################
##                 Mersenne-Twister Algorithm 19937, 64-bit                 ##
##                                                                          ##
##                      Copyright © 2019 ARQADIUM, LLC                      ##
##                           All rights reserved.                           ##
##############################################################################

include base.mk

PROJECT := mt19937
EXEFILE :=
SOFILE  :=
AFILE   := 1

# <system> includes
INCLUDES := include
# "local" includes
INCLUDEL :=

# libraries
LIBS    :=
LIBDIRS :=

# frameworks (macOS only)
FWORKS :=

ifeq ($(UNAME),Windows)
	LIBS     += mingw32
	LIBDIRS  += $(USERPROFILE)/sysroot/lib
	INCLUDES += $(USERPROFILE)/sysroot/include
endif
ifeq ($(UNAME),Linux)
	LIBS     += m pthread
endif

CFILES    :=
HFILES    := include/mt19937/random.h
CPPFILES  := src/random.cpp
HPPFILES  :=
OFILES    := $(CFILES:.c=.c.o) $(CPPFILES:.cpp=.cpp.o)
# address-sanitisation metadata
GCNOFILES := $(CFILES:.c=.c.gcno) $(CPPFILES:.cpp=.cpp.gcno)
GCDAFILES := $(CFILES:.c=.c.gcda) $(CPPFILES:.cpp=.cpp.gcda)

.PHONY: default

default: debug

NO_TES := 1

# this defines all our usual targets
include targets.mk
