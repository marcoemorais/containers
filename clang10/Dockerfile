FROM ubuntu:18.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    clang-10 \
    cmake \
    ctags \
    git \
    htop \
    less \
    lldb \
    make \
    man \
    manpages-dev \
    strace \
    sysstat \
    tcpdump \
    tree \
    valgrind

# Use the clang toolchain by setting CC and CXX environment variables.
ENV CC=/usr/bin/clang-10
ENV CXX=/usr/bin/clang++-10

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# Unit test.
ARG DOCTEST_TAG=2.4.4
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
    && rm -rf /stdman-${STDMAN_TAG}

# By convention, all development in /src.
WORKDIR /src
