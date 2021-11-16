FROM docker.io/library/ubuntu:20.04

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apt-get update && apt-get upgrade -y && DEBIAN_FRONTEND="noninteractive" apt-get install -y \
    curl \
    ctags \
    git \
    man \
    manpages-dev \
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
RUN git clone https://github.com/ludovicchabant/vim-gutentags.git ~/.vim/pack/plugin/start/vim-gutentags --branch $GUTENTAGS_TAG

ARG NERDTREE_TAG=6.10.16
RUN git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/plugin/start/nerdtree --branch $NERDTREE_TAG

ARG VIM_MAN_TAG=master
RUN git clone https://github.com/vim-utils/vim-man.git ~/.vim/pack/plugin/start/vim-man --branch $VIM_MAN_TAG

ARG CTRLP_TAG=1.81
RUN git clone https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/pack/plugin/start/ctrlp --branch $CTRLP_TAG

# Copy vimrc into home directory.
ENV HOME /root
COPY vimrc $HOME/.vimrc

## By convention, all development in /src.
WORKDIR /src
