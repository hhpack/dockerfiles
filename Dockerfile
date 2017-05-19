FROM holyshared/hhvm:latest
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Noritaka Horio <holy.shared.design@gmail.com>
RUN sudo apt-get update && \
  sudo apt-get -y install sudo m4 opam libssl-dev pkg-config && \
  sudo rm -rf /var/lib/apt/lists/*
RUN opam init -y --root=/tmp/typesafety && opam switch --root=/tmp/typesafety 4.04.1
RUN opam pin add -y --root=/tmp/typesafety typesafety https://github.com/hhpack/typesafety-cli.git
RUN cp /tmp/typesafety/4.04.1/bin/typesafety /usr/local/bin && rm -rf /tmp/typesafety
