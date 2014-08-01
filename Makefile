.PHONY: clean-all all compile package test
.DEFAULT_GOAL := all

#################################################################################
#################### RECURSIVE RULES:
RECURSIVE_SUBDIRS  = main test deps
include recursive.mk

#################################################################################
#################### COMMON RULES:
TARGET_DIR         = target
include common.mk

#################################################################################
#################### BUILD RULES:
all: | compile test package

clean-all: clean deps.clean

compile: main.compile | deps.download-all

package: main.package | compile

test: test.execute | compile
