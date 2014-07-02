ROOT_DIR     := $(CURDIR)
SHARED_LIB_NM = my_plugin

GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/

.PHONY: all clean
all:
	$(MAKE) -C main ROOT_DIR=$(ROOT_DIR) GCC_PLUGIN_HEADERS=$(GCC_PLUGIN_HEADERS) SHARED_LIB_NM=$(SHARED_LIB_NM)

clean:
	@rm -rf $(TARGET_DIR)
