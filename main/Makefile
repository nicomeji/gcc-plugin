.PHONY: compile package
.DEFAULT_GOAL := package

#################################################################################
#################### COMPILATION CONSTANTS:
SOURCES             = $(shell find "src" -name "*.c";)
SHARED_LIB_NM       = mylib
CFLAGS              = -Wall -fPIC
LDFLAGS             = -shared
CPPFLAGS            = -I "$(GCC_PLUGIN_HEADERS)"
include common.mk
#################################################################################

compile: $(OBJECTS)

package: $(TARGET_DIR)/lib$(SHARED_LIB_NM).so | compile

$(TARGET_DIR)/lib$(SHARED_LIB_NM).so: $(OBJECTS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@
