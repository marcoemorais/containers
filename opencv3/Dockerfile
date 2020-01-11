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

# For OpenCV video support.
RUN apt-get install -y \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libavresample-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev

# For OpenCV gui.
RUN apt-get install -y \
    libgtk-3-dev

# For OpenCV with python3 bindings.
RUN apt-get install -y \
    python3-dev \
    python3-numpy

# Setup symlinks to toolchain through ccache.
RUN /usr/sbin/update-ccache-symlinks

# Use the gcc toolchain by setting CC and CXX environment variables.
ENV CC=/usr/bin/gcc-8
ENV CXX=/usr/bin/g++-8

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# OpenCV.
ARG OPENCV_VERSION=3.4.8
RUN wget --quiet https://github.com/opencv/opencv/archive/${OPENCV_VERSION}.zip --output-document /opencv-${OPENCV_VERSION}.zip \
    && unzip /opencv-${OPENCV_VERSION}.zip \
    && mkdir -p /opencv-${OPENCV_VERSION}/.build \
    && cd /opencv-${OPENCV_VERSION}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        .. \
    && make install \
    && rm -rf /opencv-${OPENCV_VERSION} /opencv-${OPENCV_VERSION}.zip

# Unit test.
ARG CATCH_TAG=v2.10.2
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
