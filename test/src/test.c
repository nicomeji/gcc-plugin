#include <stdio.h>
#include "unity.h"
#include "unity_fixture.h"

char *output;

TEST_SETUP(sprintf)
{
   output = malloc(100);
}

TEST_TEAR_DOWN(sprintf)
{
   free(output);
}

TEST (sprintf, NoFormatOperations)
{
   TEST_ASSERT_EQUAL(3,sprintf(output, "hey"));
   TEST_ASSERT_EQUAL_STRING("hey", output);
}

TEST (sprintf, InsertString)
{
   TEST_ASSERT_EQUAL(3,sprintf(output, "Hello %s", "world"));
   TEST_ASSERT_EQUAL_STRING("Hello world", output);
}
