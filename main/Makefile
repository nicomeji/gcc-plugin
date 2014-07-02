SRC_DIR       = src

CPPFLAGS      = -I $(GCC_PLUGIN_HEADERS)
CFLAGS        = -Wall -fPIC
LDFLAGS       = -shared
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/

-include $(ROOT_DIR)/common.mk

.PHONY: all
#all: $(TARGET_DIR)/lib$(SHARED_LIB_NM).so
all:
	@echo TRG: $(TARGET_DIR)
	@echo SRC: $(SOURCES)
	@echo OBJ: $(OBJECTS)

$(TARGET_DIR)/lib$(SHARED_LIB_NM).so: $(OBJECTS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@
