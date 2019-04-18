# Official gcc container provides build toolchain.
FROM gcc:8.2

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get install -y \
    ccache \
    cmake \
    ctags \
    gdb \
    git \
    htop \
    less \
    make \
    man \
    manpages-dev \
    strace \
    sysstat \
    tcpdump \
    tree \
    valgrind

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# Unit test.
ARG CATCH_TAG=v2.7.0
RUN git clone -q https://github.com/catchorg/Catch2.git /catch-${CATCH_TAG} --branch ${CATCH_TAG} \
    && mkdir -p /catch-${CATCH_TAG}/.build \
    && cd /catch-${CATCH_TAG}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        -DCATCH_BUILD_TESTING=OFF \
        -DCATCH_BUILD_EXAMPLES=OFF \
        -DCATCH_BUILD_EXTRA_TESTS=OFF \
        .. \
    && make install \
    && rm -rf /catch-${CATCH_TAG}

# By convention, all development in /src.
WORKDIR /src
