.PHONY: clean all compile package test dependency.test
.DEFAULT_GOAL := all

TARGET_DIR = target

include common.mk

all: | compile test.dependency test package
	@echo All done

package:
	$(MAKE) -C main -e TARGET_DIR=../$(TARGET_DIR)/main package

compile:
	$(MAKE) -C main -e TARGET_DIR=../$(TARGET_DIR)/main compile

test:
	$(MAKE) -C test -e TARGET_DIR=../$(TARGET_DIR)/test execute

test.dependency: dependency/test/Unity
	@echo Dependencies updated

dependency/test/Unity: %:
	mkdir -p "$@"
	git clone https://github.com/ThrowTheSwitch/Unity.git --branch v2.1.0 dependency/test/Unity
