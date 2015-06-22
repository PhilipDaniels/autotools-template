#define CATCH_CONFIG_MAIN
#include "mycatch.hpp"
#include "foo.hpp"

TEST_CASE("Testing works", "[works]")
{
    REQUIRE(2 > 3);
}


