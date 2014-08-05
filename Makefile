.PHONY: clean-all all compile package test
.DEFAULT_GOAL := all
MAKEFLAGS     += CC=gcc
MAKEFLAGS     += GCC_PLUGIN_HEADERS=/usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/
MAKEFLAGS     += DEPENDENCY_DIR=deps
#################################################################################
#################### COMMON RULES:
TARGET_DIR         = target
RECURSIVE_SUBDIRS  = main test deps
include common.mk
#################################################################################
#################### CUSTOM VARIABLES:
main.package main.compile: $(eval export SUBTARGET_DIR=$(strip $(TARGET_DIR))/main)
test.execute: $(eval export SUBTARGET_DIR=$(strip $(TARGET_DIR))/test)
test.execute: $(eval export MAIN_OBJ_DIR=$(strip $(TARGET_DIR))/main)
#################################################################################
#################### BUILD RULES:
clean-all: clean deps.clean
all: | compile test package
compile: | deps.download-main main.compile
test: test.execute | compile deps.download-test
package: main.package | compile
