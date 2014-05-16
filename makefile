SRC_DIR      = src
HEADERS_DIR  = inc
TARGET_DIR   = target
PROG_NM      = hello_wolrd

EXTENTION          = .cc
CXX                = g++
# Unfortunatly gcc version 4.6 doesn't recognize this option.
# CPPFLAGS         = -std=c++11
CPPFLAGS           = -std=c++0x
GCC_PLUGIN_HEADERS = /usr/lib/gcc/x86_64-linux-gnu/4.6/plugin/include/
COMPILE.cc        += -I $(HEADERS_DIR) -I $(GCC_PLUGIN_HEADERS)

SOURCES      = $(shell find "$(SRC_DIR)" -name "*$(EXTENTION)";)
OBJECTS      = $(addprefix $(TARGET_DIR)/, $(patsubst %$(EXTENTION), %.o, $(SOURCES)))
DEPENDENCIES = $(patsubst %.o, %.mk, $(OBJECTS))

.PHONY: all depend clean print-%
.SUFFIXES: $(EXTENTION) .o .h .mk

all: depend $(TARGET_DIR)/$(PROG_NM)
	@echo $(PROG_NM) created.

depend: $(DEPENDENCIES)
	@echo Dependencies updated.

-include $(DEPENDENCIES)

$(TARGET_DIR)/$(PROG_NM): $(OBJECTS)
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@

$(DEPENDENCIES): $(TARGET_DIR)/%.mk: %$(EXTENTION)
	mkdir -p $(dir $@)
	$(COMPILE.cc) -MM $^ > $@

$(OBJECTS): $(TARGET_DIR)/%.o: %$(EXTENTION) $(TARGET_DIR)/%.mk
	$(COMPILE.cc) -o $@ $<

clean:
	rm -r $(TARGET_DIR)

print-%:
	@echo '$*=$($*)'

