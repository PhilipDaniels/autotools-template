#include "config.h"
#include "foo.hpp"
#include <iostream>

int main()
{
    std::cout << "Hello world from " << PACKAGE_STRING << std::endl;
    foo();
#ifdef DEBUG
    std::cout << "I was compiled with DEBUG defined." << std::endl;
#else
    std::cout << "It does not look like DEBUG was defined when I was compiled." << std::endl;
#endif
}
