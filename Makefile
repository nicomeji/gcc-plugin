SRC_DIR       = main/src
HEADERS_DIR   = main/inc
TARGET_DIR    = target
SHARED_LIB_NM = my_plugin

CC            = gcc
CPPFLAGS      = -I $(HEADERS_DIR) -I $(GCC_PLUGIN_HEADERS)
CFLAGS        = -Wall -fPIC
LDFLAGS       = -shared
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/

SOURCES      = $(shell find "$(SRC_DIR)" -name "*.c";)
OBJECTS      = $(addprefix $(TARGET_DIR)/, $(patsubst %.c, %.o, $(SOURCES)))
OBJECTS_DIR  = $(sort $(dir $(OBJECTS)))

BASIC.c  = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH)
LINK.c   = $(BASIC.c) $(LDFLAGS)

.PHONY: clean
.SUFFIXES: .c .o .h .mk

-include $(patsubst %.o, %.mk, $(OBJECTS))
$(TARGET_DIR)/lib$(SHARED_LIB_NM).so: $(OBJECTS)
	$(LINK.c) $^ $(LOADLIBES) $(LDLIBS) -o $@

$(TARGET_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(BASIC.c) -c -o $@ $<
	$(BASIC.c) -MM $< -MT $@ -MF $(patsubst %.o, %.mk, $@)

clean:
	@rm -rf $(TARGET_DIR)

print:
	@echo $(SRC_DIR)
	