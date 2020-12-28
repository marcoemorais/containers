FROM texlive/texlive:latest

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Minimum docker image for running: pdflatex my-pdf-file.tex
RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    ghostscript \
    imagemagick

# By convention, container runs from /data.
WORKDIR /data
