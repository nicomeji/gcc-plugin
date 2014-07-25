.PHONY: compile package execute
.DEFAULT_GOAL := package

SOURCES           = $(shell find "src" -name "*.c";)
SOURCES          += $(shell find "$(DEPENDENCY_DIR)/Unity/src" -name "*.c";)
TEST_EXECUTER_NM ?= mylib

include common.mk

compile: $(OBJECTS)

package: $(TARGET_DIR)/$(TEST_EXECUTER_NM) | compile

execute: package
	./$(TARGET_DIR)/$(TEST_EXECUTER_NM)

$(TARGET_DIR)/$(TEST_EXECUTER_NM): $(OBJECTS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@
