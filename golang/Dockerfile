FROM docker.io/library/golang:1.17

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    git \
    less \
    make \
    man \
    manpages-dev \
    tree

# Go debugger.
ARG DELVE_VERSION=v1.7.3
RUN go install github.com/go-delve/delve/cmd/dlv@$DELVE_VERSION

# By convention, all development in /src.
WORKDIR /src
