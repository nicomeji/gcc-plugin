ifndef ROOT_DIR
	$(error ROOT_DIR is not set)
endif

TARGET_DIR := $(addprefix $(ROOT_DIR),/target)

define getPathFromRoot
	$(subst $(ROOT_DIR),,$(realpath $1))
endef

define getDependsFileNameFromSrc
	$(addprefix $(TARGET_DIR), $(patsubst %.c, %.mk, $(call getPathFromRoot,$1)))
endef

define getObjFileNameFromSrc
	$(addprefix $(TARGET_DIR), $(patsubst %.c, %.o, $(call getPathFromRoot,$1)))
endef

.SUFFIXES: .c .o .h .mk

-include $(call getDependsFileNameFromSrc,$(SOURCES))

SOURCES = $(shell find "$(realpath $(SRC_DIR))" -name "*.c";)
OBJECTS = $(call getObjFileNameFromSrc,$(SOURCES))

CC      = gcc
BASIC.c = $(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH)
LINK.c  = $(BASIC.c) $(LDFLAGS)

$(TARGET_DIR)/%.o: %.c
	@mkdir -p $(dir $@)
	$(BASIC.c) -c -o $@ $<

$(TARGET_DIR)/%.mk: %.c
	@mkdir -p $(dir $@)
	$(BASIC.c) -MM $< -MT $(call getObjFileNameFromSrc, $<) -MF $@
