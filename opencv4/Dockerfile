FROM docker.io/library/ubuntu:20.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    build-essential \
    cmake \
    gdb \
    git \
    less \
    man \
    manpages-dev \
    tree \
    valgrind

# Use the gcc toolchain by setting CC and CXX environment variables.
ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# OpenCV.
ARG OPENCV_VERSION=4.5.4
RUN git clone -q https://github.com/opencv/opencv.git /opencv-${OPENCV_VERSION} --branch ${OPENCV_VERSION} \
    && mkdir -p /opencv-${OPENCV_VERSION}/.build \
    && cd /opencv-${OPENCV_VERSION}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        -DOPENCV_GENERATE_PKGCONFIG=ON \
        -DBUILD_TESTS=OFF \
        .. \
    && make install

# By convention, all development in /src.
WORKDIR /src
