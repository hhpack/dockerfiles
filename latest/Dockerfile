FROM php:7-cli as composer-env
WORKDIR /tmp
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '48e3236262b34d30969dca3c37281b3b4bbe3221bda826ac6a9a62d6444cdb0dcd0615698a5cbe587c3f0fe57a54d8f5') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php --filename=composer
RUN php -r "unlink('composer-setup.php');"

FROM hhvm/hhvm:latest
LABEL maintainer "Noritaka Horio <holy.shared.design@gmail.com>"
ARG DEBIAN_FRONTEND=noninteractive
ARG COMPILER_VERSION=4.07.0
COPY --from=composer-env /tmp/composer /usr/local/bin/composer
RUN apt -y update && \
  apt -y install m4 opam libssl-dev pkg-config php-cli && \
  rm -rf /var/lib/apt/lists/*
RUN opam init -y --root=/tmp/typesafety && opam switch --root=/tmp/typesafety ${COMPILER_VERSION}
RUN opam pin add -y --root=/tmp/typesafety typesafety https://github.com/hhpack/typesafety-cli.git
RUN cp /tmp/typesafety/${COMPILER_VERSION}/bin/typesafety /usr/local/bin && rm -rf /tmp/typesafety
