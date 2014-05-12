SRC_DIR      = src
HEADERS_DIR  = inc
TARGET_DIR   = target
PROG_NM      = hello_wolrd

EXTENTION      = .cc
CXX            = g++
CPPFLAGS       = -std=c++11
COMPILE.cc    += -I $(HEADERS_DIR)

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

