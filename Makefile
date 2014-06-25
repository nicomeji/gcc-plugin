SRC_DIR       = main/src
HEADERS_DIR   = main/inc
TARGET_DIR    = target
SHARED_LIB_NM = my_plugin

EXTENTION    := .c
CC            = gcc
CPPFLAGS      = -I $(HEADERS_DIR) -I $(GCC_PLUGIN_HEADERS)
CFLAGS        = -Wall -fPIC
LDFLAGS       = -shared
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/

define getObjFromSrc
$(addprefix $(TARGET_DIR)/, $(patsubst %$(EXTENTION), %.o, $1))
endef

SOURCES      = $(shell find "$(SRC_DIR)" -name "*$(EXTENTION)";)
OBJECTS      = $(foreach source,$(SOURCES),$(call getObjFromSrc,$(source)))
DEPENDENCIES = $(patsubst %.o, %.mk, $(OBJECTS))

BASIC.c  := $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH)
LINK.c    = $(BASIC.c) $(LDFLAGS)

.PHONY: all depend clean print-%
.SUFFIXES: $(EXTENTION) .o .h .mk

all: depend $(TARGET_DIR)/lib$(SHARED_LIB_NM).so
	@echo $(SHARED_LIB_NM) created.

depend: $(DEPENDENCIES)
	@echo Dependencies updated.

-include $(DEPENDENCIES)

$(TARGET_DIR)/lib$(SHARED_LIB_NM).so: $(OBJECTS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@

$(DEPENDENCIES): $(TARGET_DIR)/%.mk: %$(EXTENTION)
	mkdir -p $(dir $@)
	$(BASIC.c) -MM $^ -MT $(call getObjFromSrc,$^) -MF $@

$(OBJECTS): $(TARGET_DIR)/%.o: %$(EXTENTION) $(TARGET_DIR)/%.mk
	$(BASIC.c) -o $@ -c $<

clean:
	rm -r $(TARGET_DIR)

print-%:
	@echo '$*=$($*)'
