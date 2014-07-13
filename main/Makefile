.PHONY: .remove_link

GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
CPPFLAGS           ?= -I $(GCC_PLUGIN_HEADERS)
SRC_DIR             = src

include $(COMMON_MK)

.remove_link: $(OBJECTS)
