.EXPORT_ALL_VARIABLES: CC TARGET_DIR COMMON_MK CPPFLAGS CFLAGS SHARED_LIB_NM
.PHONY: clean all compile dependencies package

TARGET_DIR          = $(abspath target)
COMMON_MK           = $(abspath common.mk)
CC                  = gcc
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
CPPFLAGS           += -I $(GCC_PLUGIN_HEADERS)
all: dependencies #compile package
	@echo "Library created."

clean:
	@rm -rf $(TARGET_DIR)
	@echo "Target directory deleted."

dependencies:
	$(MAKE) -C main

$(shell mkdir -p $(TARGET_DIR))
