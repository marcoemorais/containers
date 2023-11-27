FROM docker.io/library/alpine:3.18

LABEL maintainer="Marco Morais <marcoemorais@yahoo.com>"

# Base system including toolchain and dependencies.
RUN apk --no-cache --upgrade add \
    ca-certificates \
    python3 \
    py3-pip \
    uwsgi \
    uwsgi-python

# Copy requirements file into container image.
COPY requirements.txt /

RUN pip install -r requirements.txt

# By convention, all development in /src.
WORKDIR /src

# Set flask app filename..
ENV FLASK_APP=hello

CMD ["flask","run","--host=0.0.0.0"]
