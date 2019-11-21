# Official golang container.
FROM golang:1.13

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    git \
    less \
    make \
    man \
    manpages-dev \
    tree

# By convention, all development in /src.
WORKDIR /src
