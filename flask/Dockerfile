FROM alpine:3.11

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apk --no-cache --upgrade add \
    ca-certificates \
    python3

# Copy requirements file into container image.
COPY requirements.txt /

RUN pip3 install -r requirements.txt

# By convention, all development in /src.
WORKDIR /src

# Expose port for api server.
ENV FLASK_PORT 8888
EXPOSE ${FLASK_PORT}
