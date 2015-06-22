# Always set this so that we can just '#include "foo.hpp"' from anywhere,
# including our tests directory.
AM_CPPFLAGS = -I$(top_srcdir)/src

# This is the top-level Makefile.am for a non-recursive Autotools setup. In
# fact, in non-recursive structures, this is the only Makefile.am that is
# needed. The programs (just foo.exe in this case) will be left in the top-level
# directory.
bin_PROGRAMS = foo

foo_SOURCES = \
  src/main.cpp \
  src/foo.hpp

# To specify extra flags for each target you can do this.
# But it is better to pass them on the command line (using a custom script to
# make the process easier; see the example in the debug folder). Doing it that
# way ensures the core build system stays free of cruft that may not port to
# other machines or compilers.
#foo_CXXFLAGS = -pedantic



# Testing setup. Type 'make check' or 'make recheck' to run the tests.
# TESTS defines a list of tests to run. Define their sources in the usual way.
TEST_FLAGS = -I$(top_srcdir)/src -I$(top_srcdir)/google-test/include \
-DGTEST_OS_CYGWIN=1 -DGTEST_HAS_PTHREAD=1
TEST_LIBS = $(top_srcdir)/google-test/make/gtest_main.a
THE_TESTS = tests/passing tests/failing
TESTS = $(THE_TESTS)
check_PROGRAMS = $(THE_TESTS)

tests_passing_SOURCES = tests/passing_test.cpp
tests_passing_CPPFLAGS = $(TEST_FLAGS)
tests_passing_LDADD =  $(TEST_LIBS)

tests_failing_SOURCES = tests/failing_test.cpp
tests_failing_CPPFLAGS = $(TEST_FLAGS)
tests_failing_LDADD = $(TEST_LIBS)


