# Official gcc container provides build toolchain.
FROM gcc:8.3

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    ccache \
    cmake \
    ctags \
    gdb \
    git \
    htop \
    less \
    libstdc++-8-doc \
    make \
    man \
    manpages-dev \
    strace \
    sysstat \
    tcpdump \
    tree \
    valgrind

# Setup symlinks to toolchain through ccache.
RUN /usr/sbin/update-ccache-symlinks

# Use the gcc toolchain by setting CC and CXX environment variables.
ENV CC=/usr/bin/gcc-8
ENV CXX=/usr/bin/g++-8

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# Unit test.
ARG CATCH_TAG=v2.10.0
RUN git clone -q https://github.com/catchorg/Catch2.git /catch-${CATCH_TAG} --branch ${CATCH_TAG} \
    && mkdir -p /catch-${CATCH_TAG}/.build \
    && cd /catch-${CATCH_TAG}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        .. \
    && make install \
    && rm -rf /catch-${CATCH_TAG}

# By convention, all development in /src.
WORKDIR /src
