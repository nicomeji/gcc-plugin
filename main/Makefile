.PHONY: compile package
.DEFAULT_GOAL := package

SOURCES             = $(shell find "src" -name "*.c";)
TARGET_DIR         ?= target
SHARED_LIB_NM      ?= mylib
CFLAGS              = -Wall -fPIC
LDFLAGS             = -shared

include common.mk

compile: $(OBJECTS)

package: $(TARGET_DIR)/lib$(SHARED_LIB_NM).so

$(TARGET_DIR)/lib$(SHARED_LIB_NM).so: $(OBJECTS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@
