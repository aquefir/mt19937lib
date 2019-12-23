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

default: debug

# this defines all our usual targets
include targets.mk

clean:
	$(RM) $(TARGETS_DBG)
	$(RM) $(TARGETS_REL)
	$(RM) $(TARGETS_CHK)
	$(RM) $(TARGETS_COV)
	$(RM) $(TARGETS_ASAN)
	$(RM) $(OFILES)
	$(RM) $(GCNOFILES)
	$(RM) $(GCDAFILES)

format:
	for _file in $(CFILES) $(HFILES) $(CPPFILES) $(HPPFILES); do \
		$(FMT) -i -style=file $$_file ; \
	done
