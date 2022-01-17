FROM docker.io/library/ubuntu:20.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    curl \
    ctags \
    git \
    make \
    man \
    manpages-dev \
    ripgrep \
    tree \
    vim

# Explode manpages.
RUN yes | unminimize \
    && apt-get install -y man-db

# Install pathogen.
RUN mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install vim plugins.
ARG GUTENTAGS_TAG=master
RUN git clone https://github.com/ludovicchabant/vim-gutentags.git ~/.vim/bundle/vim-gutentags --branch $GUTENTAGS_TAG

ARG NERDTREE_TAG=6.10.16
RUN git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree --branch $NERDTREE_TAG

ARG VIM_MAN_TAG=master
RUN git clone https://github.com/vim-utils/vim-man.git ~/.vim/bundle/vim-man --branch $VIM_MAN_TAG

ARG CTRLP_TAG=1.81
RUN git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp --branch $CTRLP_TAG

ARG VIM_RIPGREP_TAG=v1.0.3
RUN git clone https://github.com/jremmen/vim-ripgrep.git ~/.vim/bundle/vim-ripgrep --branch $VIM_RIPGREP_TAG

# Copy vimrc into home directory.
ENV HOME /root
COPY vimrc $HOME/.vimrc

# Installation prefix for third party libraries.
ARG PREFIX_DIRECTORY=/usr/local

# C++ reference.
ARG STDMAN_TAG=2021.12.21
RUN git clone -q https://github.com/jeaye/stdman.git /stdman-${STDMAN_TAG} --branch ${STDMAN_TAG} \
    && mkdir -p /stdman-${STDMAN_TAG} \
    && cd /stdman-${STDMAN_TAG} \
    && ./configure --prefix=${PREFIX_DIRECTORY} \
    && make install \
    && rm -rf /stdman-${STDMAN_TAG} \
    && mandb

## By convention, all development in /src.
WORKDIR /src
