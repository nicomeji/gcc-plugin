ifndef RECURSIVE_SUBDIRS
$(error "Missing RECURSIVE_SUBDIRS.")
endif

#################################################################################
#################### RECURSIVE RULES:
define RECURSIVE_RULES
.PHONY: $1.%
$1.%:
	$(MAKE) -C $1 -I "../$(.PROJECT_ROOT)" -e .PROJECT_ROOT="../$(.PROJECT_ROOT)" $$*
endef
$(foreach directory,$(RECURSIVE_SUBDIRS),$(eval $(call RECURSIVE_RULES,$(directory))))
