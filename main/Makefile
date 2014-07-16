.PHONY: compile package
.DEFAULT_GOAL := compile

GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
CPPFLAGS           += -I "$(GCC_PLUGIN_HEADERS)"
SOURCES             = $(shell find "src" -name "*.c";)
SHARED_LIB_NM      ?= myplugin

ifndef TARGET_DIR
TARGET_DIR = target
$(shell mkdir -p "$(TARGET_DIR)")
endif

include common.mk

compile: $(OBJECTS)
