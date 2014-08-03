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

compile: | deps.download-main main.compile

package: main.package | compile

test: test.execute | compile deps.download-test
