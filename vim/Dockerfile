# Standard ubuntu desktop operating system.
FROM ubuntu:20.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    ctags \
    build-essential \
    fzf \
    git \
    less \
    tree \
    valgrind \
    vim

# Explode manpages.
RUN yes | unminimize && \
    apt-get install -y man-db && \
    rm -r /var/lib/apt/lists/*

# Use the gcc toolchain by setting CC and CXX environment variables.
ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# Install vim plugins.
ARG NERDTREE_TAG=6.9.11
RUN git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/plugin/start/nerdtree --branch $NERDTREE_TAG

ARG FZF_TAG=0.24.4
RUN git clone https://github.com/junegunn/fzf.git ~/.vim/pack/plugin/start/fzf --branch $FZF_TAG

ARG VIM_MAN_TAG=master
RUN git clone https://github.com/vim-utils/vim-man.git ~/.vim/pack/plugin/start/vim-man --branch $VIM_MAN_TAG

ARG GUTENTAGS_TAG=master
RUN git clone https://github.com/ludovicchabant/vim-gutentags.git ~/.vim/pack/plugin/start/vim-gutentags --branch $GUTENTAGS_TAG

# Copy vimrc into home directory.
ENV HOME /root
COPY vimrc $HOME/.vimrc

## By convention, all development in /src.
WORKDIR /src
