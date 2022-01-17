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

# Install google developer tools: gflags, gtest, google-benchmark.
RUN apt-get install -y \
    libgflags-dev \
    libgtest-dev \
    libbenchmark-dev

# Install catch.
RUN apt-get install -y \
    catch

# Install doctest.
RUN apt-get install -y \
    doctest-dev

# Explode manpages.
RUN yes | unminimize \
    && apt-get install -y man-db

# Use the gcc toolchain by setting CC and CXX environment variables.
ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# C++ reference.
ARG STDMAN_TAG=2021.12.21
RUN git clone -q https://github.com/jeaye/stdman.git /stdman-${STDMAN_TAG} --branch ${STDMAN_TAG} \
    && mkdir -p /stdman-${STDMAN_TAG} \
    && cd /stdman-${STDMAN_TAG} \
    && ./configure --prefix=${PREFIX_DIRECTORY} \
    && make install \
    && rm -rf /stdman-${STDMAN_TAG} \
    && mandb

# By convention, all development in /src.
WORKDIR /src
