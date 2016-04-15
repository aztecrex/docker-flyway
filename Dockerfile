FROM alpine:3.3

MAINTAINER CJ Engineering

# Basic stuff
#  jdk - flyway is a Java app
#  curl - to fetch the flyway tarball
#  bash - fly scripts use it
RUN  apk update \
  && apk upgrade \
  && apk add openjdk8 curl bash

# Flyway
RUN mkdir /working
WORKDIR /working
RUN  curl -O https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.0/flyway-commandline-4.0.tar.gz \
  && tar -xzf flyway-commandline-4.0.tar.gz

