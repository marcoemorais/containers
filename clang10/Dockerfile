FROM docker.io/library/ubuntu:18.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    clang-10 \
    clang-tidy-10 \
    clang-format-10 \
    cmake \
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

# Cleanup package cache.
RUN rm -r /var/lib/apt/lists/*

# Use the clang toolchain by setting CC and CXX environment variables.
ENV CC=/usr/bin/clang-10
ENV CXX=/usr/bin/clang++-10

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# Unit test.
ARG CATCH_TAG=v2.13.7
RUN git clone -q https://github.com/catchorg/Catch2.git /catch-${CATCH_TAG} --branch ${CATCH_TAG} \
    && mkdir -p /catch-${CATCH_TAG}/.build \
    && cd /catch-${CATCH_TAG}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        .. \
    && make install \
    && rm -rf /catch-${CATCH_TAG}

# C++ reference.
ARG STDMAN_TAG=2020.11.17
RUN git clone -q https://github.com/jeaye/stdman.git /stdman-${STDMAN_TAG} --branch ${STDMAN_TAG} \
    && mkdir -p /stdman-${STDMAN_TAG} \
    && cd /stdman-${STDMAN_TAG} \
    && ./configure --prefix=${PREFIX_DIRECTORY} \
    && make install \
    && rm -rf /stdman-${STDMAN_TAG} \
    && mandb

# By convention, all development in /src.
WORKDIR /src
