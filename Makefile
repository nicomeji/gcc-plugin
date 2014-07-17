.PHONY: clean all compile package test
.DEFAULT_GOAL := all

TARGET_DIR = target

include common.mk

all: | compile test package
	@echo All done

package:
	$(MAKE) -C main -e TARGET_DIR=../$(TARGET_DIR)/main package

compile:
	$(MAKE) -C main -e TARGET_DIR=../$(TARGET_DIR)/main compile

test:
	$(MAKE) -C test -e TARGET_DIR=../$(TARGET_DIR)/test execute
