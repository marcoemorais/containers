FROM docker.io/library/ubuntu:20.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    build-essential \
    cmake \
    curl \
    gdb \
    git \
    less \
    man \
    manpages-dev \
    strace \
    tree \
    valgrind

# Explode manpages.
RUN yes | unminimize \
    && apt-get install -y man-db

# Use the gcc toolchain by setting CC and CXX environment variables.
ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# Unit test.
ARG DOCTEST_TAG=2.4.6
RUN git clone -q https://github.com/onqtam/doctest.git /doctest-${DOCTEST_TAG} --branch ${DOCTEST_TAG} \
    && mkdir -p /doctest-${DOCTEST_TAG}/.build \
    && cd /doctest-${DOCTEST_TAG}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        .. \
    && make install \
    && rm -rf /doctest-${DOCTEST_TAG}

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
