// http://www.codesynthesis.com/~boris/blog/2010/05/03/parsing-cxx-with-gcc-plugin-part-1/
// GCC header includes to get the parse tree declarations.
// The order is important and doesn't follow any kind of logic.
//

#include <stdio.h>
#include "gcc-plugin.h"
#include "diagnostic.h"

int plugin_is_GPL_compatible;

void gate_callback(void *gcc_data, void *user_data) {
   // If there were errors during compilation, let GCC handle the exit.
   if (errorcount|| sorrycount)
   return;

   // Process AST. Issue diagnostics and set r to 1 in case of an error.
   fprintf (stderr, "Acá entra el callback.\n");

   exit (0);
}

int plugin_init(struct plugin_name_args* info, struct plugin_gcc_version* ver) {
   fprintf(stderr, "Inicializo plugin: %s\n", info->base_name);

   // Register callbacks.
   register_callback(info->base_name,
   PLUGIN_OVERRIDE_GATE, &gate_callback, 0);
   return 0;
}
