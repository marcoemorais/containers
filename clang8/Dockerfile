FROM ubuntu:18.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get install -y \
    ccache \
    clang-8 \
    cmake \
    ctags \
    git \
    htop \
    less \
    libstdc++-8-dev \
    libstdc++-8-doc \
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
ENV CC=/usr/bin/clang-8
ENV CXX=/usr/bin/clang++-8

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# Build and run tests for source based dependencies.
ARG BUILD_TESTING=ON

# Unit test.
ARG CATCH_TAG=v2.10.0
RUN git clone -q https://github.com/catchorg/Catch2.git /catch-${CATCH_TAG} --branch ${CATCH_TAG} \
    && mkdir -p /catch-${CATCH_TAG}/.build \
    && cd /catch-${CATCH_TAG}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        -DCATCH_BUILD_TESTING=${BUILD_TESTING} \
        -DCATCH_BUILD_EXAMPLES=OFF \
        -DCATCH_BUILD_EXTRA_TESTS=OFF \
        .. \
    && make install \
    && rm -rf /catch-${CATCH_TAG}

# By convention, all development in /src.
WORKDIR /src
