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

# Use the gcc toolchain by setting CC and CXX environment variables.
ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++

# By convention, all development in /src.
WORKDIR /src
