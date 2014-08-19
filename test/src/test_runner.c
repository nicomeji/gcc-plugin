#include <stdio.h>
#include "unity.h"
#include "gcc-plugin.h"
#include "unity_fixture.h"

diagnostic_context *global_dc = (diagnostic_context *) NULL;

void register_callback(const char *plugin_name, int event,
      plugin_callback_func callback, void *user_data) {
   printf("%s registered.", plugin_name);
}

TEST_GROUP_RUNNER(sprintf)
{
   RUN_TEST_CASE(sprintf, NoFormatOperations);
   RUN_TEST_CASE(sprintf, InsertString);
}

int main(void) {
   printf("Test run!!\n");
   return 0; // because everything runs ok.
}
