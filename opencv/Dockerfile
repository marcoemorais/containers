# Build container for running native tensorflow applications.

FROM ubuntu:16.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get install -y \
    build-essential \
    clang \
    cmake \
    ctags \
    curl \
    git \
    vim \
    gcc \
    gdb \
    g++ \
    htop \
    less \
    libcurl4-openssl-dev \
    libhiredis-dev \
    libjpeg-dev \
    libpng-dev \
    libpq-dev \
    libspdlog-dev \
    libssl-dev \
    libtbb2 \
    libtbb-dev \
    libtiff-dev \
    locales \
    make \
    man \
    pkg-config \
    postgresql-client \
    strace \
    sysstat \
    tcpdump \
    tmux \
    tree \
    unzip \
    wget

# Set the locale.
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# Tensorflow.
ARG TF_VERSION=1.10.0
ARG TF_TYPE="cpu"
ARG TF_OS="linux"
RUN curl -sL \
    "https://storage.googleapis.com/tensorflow/libtensorflow/libtensorflow-${TF_TYPE}-${TF_OS}-x86_64-${TF_VERSION}.tar.gz" \
    | tar -C ${PREFIX_DIRECTORY} -xz

# OpenCV.
#
# Build args based on https://github.com/janza/docker-python3-opencv/blob/master/Dockerfile
# * Python support omitted.
# * CUDA support disabled.
ARG OPENCV_VERSION=3.4.2
RUN wget --quiet https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip --output-document /opencv-${OPENCV_VERSION}.zip \
    && unzip /opencv-${OPENCV_VERSION}.zip \
    && mkdir -p /opencv-${OPENCV_VERSION}/.build \
    && cd /opencv-${OPENCV_VERSION}/.build \
    && cmake \
        -DBUILD_TIFF=ON \
        -DBUILD_opencv_java=OFF \
        -DWITH_CUDA=OFF \
        -DWITH_OPENGL=ON \
        -DWITH_OPENCL=ON \
        -DWITH_IPP=ON \
        -DWITH_TBB=ON \
        -DWITH_EIGEN=ON \
        -DWITH_V4L=ON \
        -DBUILD_TESTS=OFF \
        -DBUILD_PERF_TESTS=OFF \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        .. \
    && make install \
    && rm -rf /opencv-${OPENCV_VERSION} /opencv-${OPENCV_VERSION}.zip

# NOTE(marcoemorais): Consider building dependencies below as binaries and uploading to conan repository.

# Kafka client.
ARG LIBRDKAFKA_TAG=v0.11.5
RUN git clone -q https://github.com/edenhill/librdkafka.git /librdkafka-${LIBRDKAFKA_TAG} --branch ${LIBRDKAFKA_TAG} \
    && mkdir -p /librdkafka-${LIBRDKAFKA_TAG}/.build \
    && cd /librdkafka-${LIBRDKAFKA_TAG}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        .. \
    && make install \
    && rm -rf /librdkafka-${LIBRDKAFKA_TAG}

# PostgreSQL client.
ARG LIBPQXX_TAG=6.2.4
RUN git clone -q https://github.com/jtv/libpqxx.git /libpqxx-${LIBPQXX_TAG} \
    && cd /libpqxx-${LIBPQXX_TAG} \
    && ./configure \
        --prefix=${PREFIX_DIRECTORY} \
        --disable-documentation \
    && make install \
    && rm -rf /libpqxx-${LIBPQXX_TAG}

# AWS SDK.
#
# Build a subset of clients https://github.com/aws/aws-sdk-cpp#build_only
# * S3
ARG AWS_SDK_TAG=1.5.18
RUN git clone -q https://github.com/aws/aws-sdk-cpp.git /aws-sdk-cpp-${AWS_SDK_TAG} --branch ${AWS_SDK_TAG} \
    && mkdir -p /aws-sdk-cpp-${AWS_SDK_TAG}/.build \
    && cd /aws-sdk-cpp-${AWS_SDK_TAG}/.build \
    && cmake \
        -DBUILD_ONLY="s3" \
        -DENABLE_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        .. \
    && make install \
    && rm -rf /aws-sdk-cpp-${AWS_SDK_TAG}

# JSON.
ARG JSON_TAG=v3.1.2
RUN git clone -q https://github.com/nlohmann/json.git /json-${JSON_TAG} --branch ${JSON_TAG} \
    && mkdir -p /json-${JSON_TAG}/.build \
    && cd /json-${JSON_TAG}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        .. \
    && make install \
    && rm -rf /json-${JSON_TAG}

# YAML.
ARG YAML_TAG=yaml-cpp-0.6.2
RUN git clone -q https://github.com/jbeder/yaml-cpp.git /yaml-${YAML_TAG} --branch ${YAML_TAG} \
    && mkdir -p /yaml-${YAML_TAG}/.build \
    && cd /yaml-${YAML_TAG}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        .. \
    && make install \
    && rm -rf /yaml-${YAML_TAG}

# CLI11.
ARG CLI11_TAG=v1.6.1
RUN git clone -q https://github.com/CLIUtils/CLI11.git /CLI11-${CLI11_TAG} --branch ${CLI11_TAG} \
    && mkdir -p /CLI11-${CLI11_TAG}/.build \
    && cd /CLI11-${CLI11_TAG}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        -DCLI11_TESTING=OFF \
        -DCLI11_EXAMPLES=OFF \
        .. \
    && make install \
    && rm -rf /CLI11-${CLI11_TAG}

# Unit test.
ARG CATCH_TAG=v2.3.0
RUN git clone -q https://github.com/catchorg/Catch2.git /catch-${CATCH_TAG} --branch ${CATCH_TAG} \
    && mkdir -p /catch-${CATCH_TAG}/.build \
    && cd /catch-${CATCH_TAG}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        .. \
    && make install \
    && rm -rf /catch-${CATCH_TAG}

WORKDIR /

