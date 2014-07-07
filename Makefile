.PHONY: clean all compile dependencies package

#################################################################################
#################### VARIABLES:
TARGET_DIR          = target
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

$(TARGET_DIR):
	mkdir $(TARGET_DIR)

dependencies: $(TARGET_DIR)
	$(MAKE) -C main -e ROOT_DIR='$(CURDIR)' -e CPPFLAGS='$(CPPFLAGS)' -e CFLAGS='$(CFLAGS)' dependencies

compile: dependencies $(OBJECTS)
	$(MAKE) -C main -e ROOT_DIR='$(CURDIR)' -e CPPFLAGS='$(CPPFLAGS)' -e CFLAGS='$(CFLAGS)' compile

package: $(TARGET_DIR)/lib$(SHARED_LIB_NM).so

$(TARGET_DIR)/lib$(SHARED_LIB_NM).so: $(OBJECTS)
	$(BASIC.c) $(LDFLAGS) $^ $(LOADLIBES) $(LDLIBS) -o $@
#################################################################################
