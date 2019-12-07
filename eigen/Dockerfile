# Use a recent clang compiler as the toolchain.
FROM clang8:local

# For Eigen BLAS support.
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    libopenblas-dev

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# Eigen.
ARG EIGEN_TAG=3.3.7
RUN git clone -q https://gitlab.com/libeigen/eigen /eigen-${EIGEN_TAG} --branch ${EIGEN_TAG} \
    && cd /eigen-${EIGEN_TAG} \
    && git submodule init && git submodule update \
    && mkdir -p /eigen-${EIGEN_TAG}/.build \
    && cd /eigen-${EIGEN_TAG}/.build \
    && cmake \
        -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=${PREFIX_DIRECTORY} \
        .. \
    && make install \
    && rm -rf /eigen-${EIGEN_TAG}
