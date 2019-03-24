PWD=$(shell pwd)
NAME=$(shell basename $(PWD))
IMAGE=gcc8
TAG=local

.PHONY: docker-build docker-run docker-exec docker-commit

docker-build:
	docker build -t $(IMAGE):$(TAG) -f Dockerfile .

docker-run:
	docker run --name $(NAME) --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --rm -it -v $(PWD):/src $(IMAGE):$(TAG)

docker-exec:
	docker exec -it $(NAME) /bin/bash

docker-commit:
	docker commit $(shell docker ps --quiet) $(IMAGE):$(TAG)

