.EXPORT_ALL_VARIABLES: CC GCC_PLUGIN_HEADERS SHARED_LIB_NM
.PHONY: clean all compile

TARGET_DIR          = target
COMMON_MK           = common.mk
CC                  = gcc
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
SHARED_LIB_NM       = myplugin

all: compile
	@echo "Library created."

clean:
	rm -rf "$(TARGET_DIR)"
	@echo "Target directory deleted."

compile:
	$(MAKE) -C main -e COMMON_MK=../$(COMMON_MK) -e TARGET_DIR=../$(TARGET_DIR)/main compile

$(shell mkdir -p "$(TARGET_DIR)")
