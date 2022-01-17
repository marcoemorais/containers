action?=docker-build

DIRS := \
	clang10 \
	clang6 \
	clang8 \
	clion-cpp \
	eigen \
	flask \
	gcc10 \
	gcc8 \
	golang \
	jupyter-numerics \
	jupyter-opencv4 \
	jupyter-python3 \
	latex \
	opencv4 \
	ubuntu20 \
	vim

.PHONY: all $(DIRS)

all:: $(DIRS)

$(DIRS):
	# e.g. make action=(-insert-your-action-here-)
	$(MAKE) -C $@ $(action)

include Makefile.defs
