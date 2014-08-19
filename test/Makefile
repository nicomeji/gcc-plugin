.PHONY: compile package execute
.DEFAULT_GOAL := package

UNITY         =$(strip $(PROJECT_ROOT))$(strip $(DEPENDENCY_DIR))/Unity-2.1.0/src
UNITY_FIXTURE =$(strip $(PROJECT_ROOT))$(strip $(DEPENDENCY_DIR))/Unity-2.1.0/extras/fixture/src/
MAIN_OBJ      =$(shell find $(strip $(PROJECT_ROOT))$(MAIN_OBJ_DIR) -name "*.o")

SOURCES           =$(shell find "src" -name "*.c";)
TEST_EXECUTER_NM  =tests
CPPFLAGS          =-I "$(GCC_PLUGIN_HEADERS)" -I "$(UNITY)" -I "$(UNITY_FIXTURE)"
CFLAGS            =-Wall -std=c99
LOADLIBES         =-L$(strip $(PROJECT_ROOT))/deps
LDLIBS            =-lunity

include common.mk

compile: $(OBJECTS)

package: $(call getTargetDir)/$(TEST_EXECUTER_NM) | compile

execute: package
	./$(call getTargetDir)/$(TEST_EXECUTER_NM)

$(call getTargetDir)/$(TEST_EXECUTER_NM): $(OBJECTS) $(MAIN_OBJ)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@
