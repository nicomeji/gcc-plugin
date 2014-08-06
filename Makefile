.PHONY: clean-all all compile package test maindeps testdeps
.DEFAULT_GOAL := all

#################################################################################
#################### COMMON VARIABLES:
SHARED_LIB_NM  = my_plugin
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
main.%: MAKEFLAGS += SHARED_LIB_NM=$(strip $(SHARED_LIB_NM))
test.%: MAKEFLAGS += TARGET_DIR=$(strip $(TARGET_DIR))/test
test.%: MAKEFLAGS += MAIN_OBJ_DIR=$(strip $(TARGET_DIR))/main
#################################################################################
#################### DEPENDENCIES:
main.package: compile
main.compile: maindeps
test.execute: testdeps
#################################################################################
#################### BUILD RULES:
clean-all: clean deps.clean
all: compile test package
	$(call print,"All done.")

compile: main.compile
	$(call print,"Compilation done.")

test: compile test.execute
	$(call print,"Test executed.")

package: main.package
	cp -f "$(strip $(TARGET_DIR))/main/lib$(strip $(SHARED_LIB_NM)).so" "$(strip $(TARGET_DIR))"
	$(call print,"Shared Library created.")

maindeps: deps.download-main
	$(call print,"Main dependencies updated.")

testdeps: deps.download-test
	$(call print,"Test dependencies updated.")
