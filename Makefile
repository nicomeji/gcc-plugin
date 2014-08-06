.PHONY: clean-all all compile package test
.DEFAULT_GOAL := all
MAKEFLAGS      = CC=gcc
MAKEFLAGS     += GCC_PLUGIN_HEADERS=/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
MAKEFLAGS     += DEPENDENCY_DIR=deps
#################################################################################
#################### COMMON RULES:
TARGET_DIR         = target
RECURSIVE_SUBDIRS  = main test deps
include common.mk
#################################################################################
#################### CUSTOM VARIABLES:
main.%: MAKEFLAGS += TARGET_DIR=$(strip $(TARGET_DIR))/main
test.%: MAKEFLAGS += TARGET_DIR=$(strip $(TARGET_DIR))/test
test.%: MAKEFLAGS += MAIN_OBJ_DIR=$(strip $(TARGET_DIR))/main)
#################################################################################
#################### DEPENDENCIES:
main.compile: deps.download-main
test.execute: deps.download-test
#################################################################################
#################### BUILD RULES:
clean-all: clean deps.clean
all: compile test package
compile: main.compile 
test: compile test.execute
package: main.package
