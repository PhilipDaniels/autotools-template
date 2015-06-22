This project uses [Google Test](https://code.google.com/p/googletest/) for
testing. The source code for Google Test is included (it is only about 4Mb) but
it is not compiled. So your first step is to compile it. There are instructions
on the website, but for POSIXy systems the following should suffice:

```
  cd ${GTEST_DIR}/make
  make
  ./sample1_unittest
```

Once the library is compiled, the examples in the top-level Makefile.am show
how to add tests.

The style for C++ testing seems to be to have many sources files, for example
one source file to test each class, but to build several sets of tests into
one test executable - this speeds up both compilation and test run time.

It is advised that you only build the tests from the debug folder using the
debugconfigure script - this will avoid polluting git and compile them with the
correct compiler flags.

