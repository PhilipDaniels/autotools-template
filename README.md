# autotools-template
A pair of templates for GNU Autotools, one recursive and one non-recursive.
(Non-recursive makes are faster). Simply copy the required folder and start
hacking. 

# Intro
Based on material from https://www.lrde.epita.fr/~adl/autotools.html, namely
"Slide nnn" refers to a slide from his presentation. The good stuff only starts
at slide 100. Another good resource is http://www.dwheeler.com/autotools/ and
he has a list of other resources on his page too.

# The Autotools Programs
Main programs you will need to run on day-to-day basis
* [autoreconf](http://www.gnu.org/software/autoconf/manual/autoconf.html#autoreconf-Invocation) - run all tools in the right order
* [autoscan](https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/autoscan-Invocation.html) - look through your source for portability problems and things missing from configure.ac

And some of the others
* [autoconf](http://www.gnu.org/software/autoconf/manual) - produces
`./configure`. `autoreconf` and `autoscan` are covered here.
* [automake](http://www.gnu.org/software/automake/manual) - creates
`Makefile.in` from `Makefile.am` and `configure.ac`
* [libtool](http://www.gnu.org/software/libtool/manual) - create libraries


# Slide Index
- 100 - good stuff starts
- 129 - the various autotools programs
- 255 - structure of configure.ac
- 269 - checking for programs, continues with other checks such as headers
- 304 - calling AM_INIT_AUTOMAKE, what the params mean
- 322 - building static libraries

# Simple setup for recursive automake
First create files, in ROOTDIR:

```
mkdir src
touch configure.ac
touch Makefile.am
touch src/Makefile.am
touch src/main.cpp
```

Then build, in ROOTDIR:

```
autoreconf -i    # reconfigure, install missing things such as NEWS
./configure
make
```

Development then proceeds simply: when you create a new source file (.cpp or
.hpp) add it to `src/Makefile.am` and type `make`.

It should not be necessary to re-run `autoreconf` unless things get really out
of whack; `make` by itself should detect if things need regenerating.

`Makefile.am` can contain supplementary rules; automake will preserve them in the
output files.

You may have one `Makefile.am` per directory because it is used to generate a
file called `Makefile` and you can only have one of them per directory too. All
subsidiary `Makefile.ams` must be declared in `configure.ac`.

# VPATH Builds (including custom DEBUG builds)
You can arrange for build output to go into any build directory: the
`configure.ac` script detects where it is run from and does a `VPATH` build
automatically. Example:

```
mkdir builddir && cd builddir
../configure
make
```

You end up with a bunch of build artifacts in `builddir` - including a src
directory, but that src directory just contains a `Makefile` and compiler output
files, your `.cpp` and `.hpp` files remain in the original `src` folder.

By creating various subdirectories, each with a small shell script to call
`../configure` with different arguments, you can arrange to create separate
builds for debug, profiling, unit tests etc. Normally during development you
will want to create a debug build using specific compiler options, but those
flags should not be embedded into `configure.ac` or `Makefile.am` because they
will not be portable. Instead, pass them on the command line using a simple
shell script.

## Debug builds
The `debug` folder contains a shell script to build the program with debugging
symbols and optimisation turned off. It is specific to g++, which is what I use
for development. You will end up with a debugging exe in `debug/src/foo.exe`.

## Release builds
There is no need to create a custom release build. Autotools will do this
automatically. Use the `install-strip` target to strip the compiled exe.

## Unit Tests
Autotools has built-in support for running test (including unit tests) via
the `make check` target, and `make recheck` which just runs the tests that
failed on the last run. It is recommended to read
[Automake - tests](http://www.gnu.org/software/automake/manual/automake.html#Tests)
before proceeding.

This template stores tests in a `tests` directory which is a sibling of `src`.

This still leaves open the question of "which unit testing framework to use?"
Of course there are several possibilities. For C++, I think he easiest to use is
[catch.hpp](https://github.com/philsquared/Catch)
which is just a single header file which you `#include` in each test program.
The downside is that it is a rather large file which slows down the compilation
of the tests, though there are workarounds -
see [catch - slow compiles](https://github.com/philsquared/Catch/blob/master/docs/slow-compiles.md)
This template contains an example of using catch.

Another alternative is [Google Test](https://code.google.com/p/googletest/)
which seems to be a well respected C++ unit testing framework. The downside is
that installation is more complicated, but because it is a library compilation
should be faster. It also has an adapter to integrate with Autotools (though
Catch seems to manage without one). You do not install Google Test globally on
your system, you just integrate it into the build system for each project.

