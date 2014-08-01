.PHONY: clean-all all dependency compile package test
.DEFAULT_GOAL := all

#################################################################################
#################### COMPILATION CONSTANTS:
CC                 ?= gcc
GCC_PLUGIN_HEADERS ?= /usr/lib/gcc/x86_64-linux-gnu/4.8/plugin/include/

#################################################################################
#################### RECURSIVE CONSTANTS:
RECURSIVE_SUBDIRS  = main test deps
EXPORT_VARS        = GCC_PLUGIN_HEADERS=$(GCC_PLUGIN_HEADERS)
EXPORT_VARS       += DEPENDENCY_DIR=../deps
EXPORT_VARS       += CC=$(CC)
# EXPORT_VARS       += 

include common.mk
include recursive.mk

all: | dependency compile test package

clean-all: clean deps.clean

dependency: deps.download-all

compile: main.compile | dependency
	@echo $(EXPORT_VARS)

package: main.package | compile

test: test.execute | compile
