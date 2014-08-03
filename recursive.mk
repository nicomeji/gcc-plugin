ifndef RECURSIVE_SUBDIRS
$(error "Missing RECURSIVE_SUBDIRS.")
endif

#################################################################################
#################### RECURSIVE RULES:
define RECURSIVE_RULES
.PHONY: $1.%
$1.%:
ifdef SUBTARGET_DIR
	$(eval export SUBTARGET_DIR=$(SUBTARGET_DIR)
else
	$(eval export SUBTARGET_DIR=$(strip $(TARGET_DIR))/$1)
endif
	$(MAKE) -C $1 -I "../$(PROJECT_ROOT)" -e PROJECT_ROOT="../$(.PROJECT_ROOT)" $$*
endef
$(foreach directory,$(RECURSIVE_SUBDIRS),$(eval $(call RECURSIVE_RULES,$(directory))))
