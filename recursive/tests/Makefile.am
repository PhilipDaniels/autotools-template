# Always set this so that we can just '#include "foo.hpp"' from anywhere,
# including our tests directory.
AM_CPPFLAGS = -I$(top_srcdir)/src

# Testing setup. Type 'make check' or 'make recheck' to run the tests.
# TESTS defines a list of tests to run. Define their sources in the usual way.
TESTS = passing failing

passing_SOURCES = passing_test.cpp
failing_SOURCES = failing_test.cpp

# This is needed to get ./configure to run.
noinst_PROGRAMS = passing failing

