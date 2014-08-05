.PHONY: compile package execute
.DEFAULT_GOAL := package

UNITY = $(strip $(PROJECT_ROOT))$(strip $(DEPENDENCY_DIR))/Unity-2.1.0/src
MAIN_OBJ=$(shell find $(strip $(PROJECT_ROOT))$(MAIN_OBJ_DIR) -name "*.o")

SOURCES           = $(shell find "src" -name "*.c";)
SOURCES          += $(shell find "$(UNITY)" -name "*.c";)
TEST_EXECUTER_NM ?= mylib
#################################################################################
#################### COMPILATION CONSTANTS:
CPPFLAGS = -I "$(GCC_PLUGIN_HEADERS)" -I "$(UNITY)"

include common.mk

compile: $(OBJECTS)

package: $(TARGET_DIR)/$(TEST_EXECUTER_NM) | compile

execute: package
	./$(TARGET_DIR)/$(TEST_EXECUTER_NM)

$(TARGET_DIR)/$(TEST_EXECUTER_NM): $(OBJECTS) $(MAIN_OBJ)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@
