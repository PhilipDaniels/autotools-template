# This Makefile.am specifies the programs and libraries to build. Several
# different targets can be specified in this single file.

# bin means install in bindir, PROGRAMS means building a program
# You can have multiple programs. See slide 307 for different types of target.
# Header files are not compiled, but should be listed as dependencies so that
# they get distributed.
bin_PROGRAMS = foo
foo_SOURCES = main.cpp foo.hpp

# To specify extra flags for each target you can do this.
# But it is better to pass them on the command line (using a custom script to
# make the process easier; see the example in the debug folder). Doing it that
# way ensures the core build system stays free of cruft that may not port to
# other machines or compilers.
#foo_CXXFLAGS = -pedantic

