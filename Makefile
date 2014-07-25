.PHONY: clean-all all dependency compile package test
.DEFAULT_GOAL := all

TARGET_DIR     = target
DEPENDENCY_DIR = deps
RECURSIVE_SUBDIRS = main test deps
include common.mk

all: | dependency compile test package
	@echo All done

clean-all: clean $(DEPENDENCY_DIR).clean

dependency: $(DEPENDENCY_DIR).dowload-all

compile: main.compile | dependency

package: main.package | compile

test: test.execute | compile
