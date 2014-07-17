.PHONY: clean all compile
.DEFAULT_GOAL := all

TARGET_DIR = target

include common.mk

all: compile
	$(MAKE) -C main -e TARGET_DIR=../$(TARGET_DIR)/main package
	@echo "Library created."

compile:
	$(MAKE) -C main -e TARGET_DIR=../$(TARGET_DIR)/main compile
