.PHONY: all compile dependencies
all: depedencies
	@echo "Library created."

GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
CPPFLAGS           ?= -I $(GCC_PLUGIN_HEADERS)
SRC_DIR             = src

dependencies: target_directories $(DEPENDENCIES)
	@echo "Depencies files updated. $(DEPENDENCIES)"

include $(COMMON_MK)
