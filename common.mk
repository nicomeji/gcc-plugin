# General description:
#    This common.mk contains usefull rules for the project compilation. It's
# design to be reused in diffetent paths, with recursive make invocations.
# 
# Variables needed:
#    To work correctly two main variables are needed:
#       -> TARGET_DIR: This variable defines the location where all the
#                      generated files should go. If this variable is not
#                      setted, then any binary won't be generated.
#       -> SOURCES: This variable contains the path, separated by spaces, of all
#                   the sources to be compiled.
# 
# Variables used:
#    There are internal variables created, available to be used in parent
# makefile to control the build process:
#       -> OBJECTS: This variable contains the name, and path, of the object
#                   files to be created. Each source file will generate an object
#                   file in the TARGET_DIR, with same relative path.
#       -> TARGET_DIRS: This variable contain the paths, separated by spaces, of
#                       all OBJECTS. It's used to create needed the directory
#                       tree in the TARGET_DIR to avoid compilation errors
#                       (caused by missing directories).
# 

ifdef TARGET_DIR
.SUFFIXES: .c .o .h .mk
#################################################################################
#################### COMPILATION FUNCTIONS:
define getObjFileNameFromSrc
$(addprefix $(TARGET_DIR)/, $(patsubst %.c, %.o, $1))
endef
ifdef SOURCES
#################################################################################
#################### COMPILATION AUTOGENERATED VARIABLES:
OBJECTS       = $(call getObjFileNameFromSrc,$(SOURCES))
TARGET_DIRS   = $(sort $(dir $(OBJECTS)))

-include $(OBJECTS:.o=.mk)
#################################################################################
#################### STATIC PATTERN RULES:
$(TARGET_DIR)/%.o: %.c | $(TARGET_DIRS)
	$(COMPILE.c) -MM "$<" -MT "$@" -MF "$(@:.o=.mk)"
	$(COMPILE.c) -o "$@" "$<"
#################################################################################
#################### DIRECTORY GENERATION RULES:
$(TARGET_DIRS): %:
	mkdir -p "$@"
endif
endif
