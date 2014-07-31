.PHONY: compile package
.DEFAULT_GOAL := package

SOURCES             = $(shell find "src" -name "*.c";)
SHARED_LIB_NM      ?= mylib
CFLAGS              = -Wall -fPIC
LDFLAGS             = -shared

TARGET_DIR          = .target
$(shell if ! [ -L ".target" ]; then ln -s "$(MAIN_OBJ_DIR)" ".target"; fi;)

#################################################################################
#################### COMPILATION CONSTANTS:
CC                 ?= gcc
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
CPPFLAGS           += -I "$(GCC_PLUGIN_HEADERS)"

include common.mk

compile: $(OBJECTS)

package: $(TARGET_DIR)/lib$(SHARED_LIB_NM).so | compile

$(TARGET_DIR)/lib$(SHARED_LIB_NM).so: $(OBJECTS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@
