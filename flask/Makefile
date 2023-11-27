PWD=$(shell pwd)
NAME=$(shell basename $(PWD))
IMAGE=$(NAME)
TAG=local

docker-run-api-server:
	docker run --name $(NAME) --rm -it -p 5000:5000 -v $(PWD):/src $(IMAGE):$(TAG)

include ../Makefile.defs
