SRC_DIR       = src
HEADERS_DIR   = inc
TARGET_DIR    = target
SHARED_LIB_NM = my_plugin

EXTENTION     = .c
CC            = g++
CPPFLAGS      = -I $(HEADERS_DIR) -I $(GCC_PLUGIN_HEADERS)
CFLAGS        = -Wall -fPIC
LDFLAGS       = -shared
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/

SOURCES      = $(shell find "$(SRC_DIR)" -name "*$(EXTENTION)";)
OBJECTS      = $(addprefix $(TARGET_DIR)/, $(patsubst %$(EXTENTION), %.o, $(SOURCES)))
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
	$(BASIC.c) -MM $^ > $@

$(OBJECTS): $(TARGET_DIR)/%.o: %$(EXTENTION) $(TARGET_DIR)/%.mk
	$(BASIC.c) -o $@ -c $<

clean:
	rm -r $(TARGET_DIR)

print-%:
	@echo '$*=$($*)'

