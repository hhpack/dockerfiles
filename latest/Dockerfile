FROM holyshared/hhvm:latest
MAINTAINER Noritaka Horio <holy.shared.design@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive
ARG COMPILER_VERSION=4.06.0
RUN sudo apt-get update && \
  sudo apt-get -y install sudo m4 opam libssl-dev pkg-config && \
  sudo rm -rf /var/lib/apt/lists/*
RUN opam init -y --root=/tmp/typesafety && opam switch --root=/tmp/typesafety ${COMPILER_VERSION}
RUN opam pin add -y --root=/tmp/typesafety typesafety https://github.com/hhpack/typesafety-cli.git
RUN cp /tmp/typesafety/${COMPILER_VERSION}/bin/typesafety /usr/local/bin && rm -rf /tmp/typesafety
