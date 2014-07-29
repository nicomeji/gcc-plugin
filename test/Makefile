.PHONY: compile package execute
.DEFAULT_GOAL := package

SOURCES           = $(shell find "src" -name "*.c";)
SOURCES          += $(shell find "$(DEPENDENCY_DIR)/Unity-2.1.0/src" -name "*.c";)
TEST_EXECUTER_NM ?= mylib
#################################################################################
#################### COMPILATION CONSTANTS:
CC                 ?= gcc
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
CPPFLAGS           += -I "$(GCC_PLUGIN_HEADERS)" -I "$(DEPENDENCY_DIR)/Unity-2.1.0/src"

include common.mk

compile: $(OBJECTS)

package: $(TARGET_DIR)/$(TEST_EXECUTER_NM) | compile

execute: package
	./$(TARGET_DIR)/$(TEST_EXECUTER_NM)

$(TARGET_DIR)/$(TEST_EXECUTER_NM): $(OBJECTS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@
