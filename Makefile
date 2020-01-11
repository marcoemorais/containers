action?=docker-build

DIRS := \
	clang6 \
	clang8 \
	eigen \
	gcc8 \
	golang \
	opencv3

.PHONY: all $(DIRS)

all:: $(DIRS)

$(DIRS):
	# e.g. make action=(-insert-your-action-here-)
	$(MAKE) -C $@ $(action)

include Makefile.defs
