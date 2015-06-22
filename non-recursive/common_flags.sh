#!/bin/bash

# This is a shell script which defines common compiler flags.
# I do it this way rather than using a makefile fragment ("common.mk") because I
# only use these flags during development.
# There are no debug (-g) or optimisation flags specifed here.
COMPILER_FLAGS="-pedantic -std=c++11 -fdiagnostics-color=auto -Wall -Wextra \
-Weffc++ -Wcast-align -Wcast-qual -Wctor-dtor-privacy \
-Wdisabled-optimization -Wformat=2 -Winit-self -Wlogical-op \
-Wmissing-declarations -Wmissing-include-dirs -Wnoexcept -Wold-style-cast \
-Woverloaded-virtual -Wredundant-decls -Wsign-conversion -Wsign-promo \
-Wstrict-null-sentinel -Wstrict-overflow=5 -Wswitch-default -Wundef"
