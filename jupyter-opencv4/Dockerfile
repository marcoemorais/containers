FROM docker.io/library/ubuntu:20.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    libglib2.0-0 \
    libgl1-mesa-glx \
    python3 \
    python3-pip

# Upgrade pip to support newer format wheels used by some packages.
RUN pip3 install --upgrade pip

# Copy requirements file into container image.
COPY requirements.txt /

RUN pip3 install -r requirements.txt

# By convention, all development in /src.
WORKDIR /src

# Expose port for jupyter.
ENV JUPYTER_PORT 8888
EXPOSE ${JUPYTER_PORT}
