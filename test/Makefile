.PHONY: compile package execute
.DEFAULT_GOAL := package

SOURCES           = $(shell find "src" -name "*.c";)
TARGET_DIR       ?= target
TEST_EXECUTER_NM ?= mylib

include common.mk

compile: $(OBJECTS)

package: $(TARGET_DIR)/$(TEST_EXECUTER_NM) | compile

execute: package
	./$(TARGET_DIR)/$(TEST_EXECUTER_NM)

$(TARGET_DIR)/$(TEST_EXECUTER_NM): $(OBJECTS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@
