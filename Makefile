.PHONY: clean-all all compile package test
.DEFAULT_GOAL := all

TARGET_DIR     = target
DEPENDENCY_DIR = dependency
RECURSIVE_SUBDIRS = main test
include common.mk

all: | compile test package
	@echo All done

clean-all: clean
	rm -rf "$(DEPENDENCY_DIR)"
	@echo "$(DEPENDENCY_DIR) deleted."

package: main.package

compile: main.compile

test: test.execute
