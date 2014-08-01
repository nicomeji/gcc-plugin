ifndef RECURSIVE_SUBDIRS
$(error "Missing RECURSIVE_SUBDIRS.")
endif

#################################################################################
#################### RECURSIVE RULES:
define RECURSIVE_RULES
.PHONY: $1.%
$1.%:
ifdef TARGET_DIR
	$(MAKE) -C $1 -e TARGET_DIR=../$(TARGET_DIR)/$1 $(foreach var,$(EXPORT_VARS), -e $(var)) $$*
else
	$(MAKE) -C $1 $(foreach var,$(EXPORT_VARS), -e $(var)) $$*
endif
endef
$(foreach directory,$(RECURSIVE_SUBDIRS),$(eval $(call RECURSIVE_RULES,$(directory))))
