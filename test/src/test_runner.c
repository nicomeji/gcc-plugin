#include <stdio.h>
#include "unity.h"
#include "gcc-plugin.h"

diagnostic_context *global_dc = (diagnostic_context *) NULL;

void setUp(void) {
}

void tearDown(void) {
}

void register_callback(const char *plugin_name, int event,
      plugin_callback_func callback, void *user_data) {
   printf("%s registered.", plugin_name);
}

int main(void) {
   printf("Test run!!\n");
   return 0; // because everything runs ok.
}
