SRC_DIR       = src
HEADERS_DIR   = inc
TARGET_DIR    = target
SHARED_LIB_NM = my_plugin

EXTENTION     = .cc
CXX           = g++
CPPFLAGS      = -I $(HEADERS_DIR) -I $(GCC_PLUGIN_HEADERS)
CXXFLAGS      = -std=c++11 -Wall -fPIC
LDFLAGS       = -shared
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/

SOURCES      = $(shell find "$(SRC_DIR)" -name "*$(EXTENTION)";)
OBJECTS      = $(addprefix $(TARGET_DIR)/, $(patsubst %$(EXTENTION), %.o, $(SOURCES)))
DEPENDENCIES = $(patsubst %.o, %.mk, $(OBJECTS))

BASIC.cc  := $(CXX) $(CXXFLAGS) $(CPPFLAGS) $(TARGET_ARCH)
LINK.cc    = $(BASIC.cc) $(LDFLAGS)

.PHONY: all depend clean print-%
.SUFFIXES: $(EXTENTION) .o .h .mk

all: depend $(TARGET_DIR)/lib$(SHARED_LIB_NM).so
	@echo $(SHARED_LIB_NM) created.

depend: $(DEPENDENCIES)
	@echo Dependencies updated.

-include $(DEPENDENCIES)

$(TARGET_DIR)/lib$(SHARED_LIB_NM).so: $(OBJECTS)
	$(LINK.cc) $^ $(LOADLIBES) $(LDLIBS) -o $@

$(DEPENDENCIES): $(TARGET_DIR)/%.mk: %$(EXTENTION)
	mkdir -p $(dir $@)
	$(BASIC.cc) -MM $^ > $@

$(OBJECTS): $(TARGET_DIR)/%.o: %$(EXTENTION) $(TARGET_DIR)/%.mk
	$(BASIC.cc) -o $@ -c $<

clean:
	rm -r $(TARGET_DIR)

print-%:
	@echo '$*=$($*)'

