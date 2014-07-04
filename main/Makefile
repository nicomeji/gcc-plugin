.PHONY: clean all compile dependencies package test functional

CPPFLAGS ?= -I $(GCC_PLUGIN_HEADERS)
CFLAGS   ?= -Wall -fPIC
LDFLAGS  ?= -shared

#################################################################################
#################### VARIABLES:
### SHARED_LIN_NM: Defines the name of the share library to be develop.
SHARED_LIB_NM = my_plugin
### GCC_PLUGIN_HEADERS: Defines where are located the GCC plugins header files.
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
#################################################################################
#################### BUILDING RULES:
all: compile package
	@echo "Library created."

clean:
	@rm -rf $(TARGET_DIR)
	@echo "Target directory deleted."

dependencies: $(DEPENDENCIES)
	@echo "Depencies files updated."

compile: dependencies $(OBJECTS)
	@echo "Object files updated."

package: $(TARGET_DIR)/lib$(SHARED_LIB_NM).so

$(TARGET_DIR)/lib$(SHARED_LIB_NM).so: $(OBJECTS)
	$(BASIC.c) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@
#################################################################################
include $(addprefix $(ROOT_DIR), /common.mk)
