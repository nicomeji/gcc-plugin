// http://www.codesynthesis.com/~boris/blog/2010/05/03/parsing-cxx-with-gcc-plugin-part-1/

// GCC header includes to get the parse tree
// declarations. The order is important and
// doesn't follow any kind of logic.
//
 
#include <stdlib.h>
#include <gmp.h>
 
#include <cstdlib> // Include before GCC poisons
                   // some declarations.
 
extern "C"
{
#include "gcc-plugin.h"
 
#include "config.h"
#include "system.h"
#include "coretypes.h"
#include "tree.h"
#include "intl.h"
 
#include "tm.h"
 
#include "diagnostic.h"
#include "c-common.h"
#include "c-pragma.h"
#include "cp/cp-tree.h"
}
 
#include <iostream>
 
using namespace std;
 
int plugin_is_GPL_compatible;
 
extern "C" void
gate_callback (void*, void*)
{
  // If there were errors during compilation,
  // let GCC handle the exit.
  //
  if (errorcount || sorrycount)
    return;
 
  int r (0);
 
  //
  // Process AST. Issue diagnostics and set r
  // to 1 in case of an error.
  //
  cerr << "processing " << main_input_filename << endl;
 
  exit (r);
}
 
extern "C" int
plugin_init (plugin_name_args* info,
             plugin_gcc_version* ver)
{
  int r (0);
 
  cerr << "starting " << info->base_name << endl;
 
  //
  // Parse options if any.
  //
 
  // Disable assembly output.
  //
  asm_file_name = HOST_BIT_BUCKET;
 
  // Register callbacks.
  //
  register_callback (info->base_name,
                     PLUGIN_OVERRIDE_GATE,
                     &gate_callback,
                     0);
  return r;
}

