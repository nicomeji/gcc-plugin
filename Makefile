.PHONY: clean all compile dependencies package test functional

#################################################################################
#################### VARIABLES:
SHARED_LIB_NM       = my_plugin
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
CPPFLAGS           += -I $(GCC_PLUGIN_HEADERS)
CFLAGS              = -Wall -fPIC
LDFLAGS             = -shared
#################################################################################
#################### BUILDING RULES:
all: compile package
	@echo "Library created."

clean:
	@rm -rf $(TARGET_DIR)
	@echo "Target directory deleted."

dependencies:
	$(MAKE) -C main -e ROOT_DIR='$(ROOT_DIR)' -e CPPFLAGS='$(CPPFLAGS)' -e CFLAGS='$(CFLAGS)' dependencies

compile: dependencies $(OBJECTS)
	@echo "Object files updated."

package: $(TARGET_DIR)/lib$(SHARED_LIB_NM).so

$(TARGET_DIR)/lib$(SHARED_LIB_NM).so: $(OBJECTS)
	$(BASIC.c) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@
#################################################################################
include common.mk
