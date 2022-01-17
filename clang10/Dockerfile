FROM docker.io/library/ubuntu:20.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

ARG CLANG_VERSION=10

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    clang-${CLANG_VERSION} \
    clang-tidy-${CLANG_VERSION} \
    clang-format-${CLANG_VERSION} \
    cmake \
    curl \
    git \
    less \
    lldb \
    make \
    man \
    manpages-dev \
    tree \
    valgrind

# Explode manpages.
RUN yes | unminimize \
    && apt-get install -y man-db

# Use the clang toolchain by setting CC and CXX environment variables.
ENV CC=/usr/bin/clang-${CLANG_VERSION}
ENV CXX=/usr/bin/clang++-${CLANG_VERSION}

# By convention, all development in /src.
WORKDIR /src
