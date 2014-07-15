.PHONY: all compile
.DEFAULT_GOAL := all
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
CPPFLAGS           += -I "$(GCC_PLUGIN_HEADERS)"
SOURCES       = $(shell find "src" -name "*.c";)
ifndef TARGET_DIR
TARGET_DIR = target
$(shell mkdir -p "$(TARGET_DIR)")
endif

include $(COMMON_MK)

all: compile

compile: post_build

post_build: $(OBJECTS)
