.PHONY: compile package execute
.DEFAULT_GOAL := package

SOURCES           = $(shell find "src" -name "*.c";)
TARGET_DIR       ?= target
DEPENDENCY_DIR   ?= dependency
TEST_EXECUTER_NM ?= mylib

include common.mk

compile: $(OBJECTS) | dependency

package: $(TARGET_DIR)/$(TEST_EXECUTER_NM) | compile

dependency: $(DEPENDENCY_DIR)/Unity
	@echo Dependencies updated

$(DEPENDENCY_DIR)/Unity: %:
	mkdir -p "$@"
	git clone https://github.com/ThrowTheSwitch/Unity.git --branch v2.1.0 "$@"
	# git archive --format=tar --remote=origin HEAD:path/to/directory -- filename | tar -O -xf -

execute: package
	./$(TARGET_DIR)/$(TEST_EXECUTER_NM)

$(TARGET_DIR)/$(TEST_EXECUTER_NM): $(OBJECTS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@
