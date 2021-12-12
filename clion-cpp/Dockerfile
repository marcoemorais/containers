FROM docker.io/library/ubuntu:20.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    autoconf \
    automake \
    clang \
    clang-format \
    cmake \
    dos2unix \
    gcc \
    g++ \
    gdb \
    git \
    less \
    locales-all \
    make \
    ninja-build \
    python \
    python-dev \
    rsync \
    tar \
    tree

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

# By convention, all development in /src.
WORKDIR /src
