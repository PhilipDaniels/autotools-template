#!/bin/bash

# This is a shell script which defines common compiler flags.
# I do it this way rather than using a makefile fragment ("common.mk") because I
# only use these flags during development.
# There are no debug (-g) or optimisation flags specifed here.
# Note that Google-test will not compile using -std=c++11, we have to use
# -std=gnu+11. I have not been able to figure out what the difference is, but the manual
# implies it is just -fext-numeric-literals.
COMPILER_FLAGS="-std=gnu++11 -pedantic -pedantic-errors \
-fdiagnostics-color=auto -Wall -Wextra \
-Weffc++ -Wcast-align -Wcast-qual -Wctor-dtor-privacy \
-Wdisabled-optimization -Wformat=2 -Winit-self -Wlogical-op \
-Wmissing-declarations -Wmissing-include-dirs -Wnoexcept -Wold-style-cast \
-Woverloaded-virtual -Wredundant-decls -Wsign-conversion -Wsign-promo \
-Wstrict-null-sentinel -Wstrict-overflow=5 -Wswitch-default -Wundef"
