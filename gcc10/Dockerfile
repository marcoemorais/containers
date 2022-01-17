FROM docker.io/library/ubuntu:20.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

ARG GCC_VERSION=10

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    ccache \
    cmake \
    curl \
    gcc-${GCC_VERSION} \
    g++-${GCC_VERSION} \
    gdb \
    git \
    less \
    make \
    man \
    manpages-dev \
    tree \
    valgrind

# Explode manpages.
RUN yes | unminimize \
    && apt-get install -y man-db

# Setup symlinks to toolchain through ccache.
RUN /usr/sbin/update-ccache-symlinks

# Use the gcc toolchain by setting CC and CXX environment variables.
ENV CC=/usr/bin/gcc-${GCC_VERSION}
ENV CXX=/usr/bin/g++-${GCC_VERSION}

# By convention, all development in /src.
WORKDIR /src
