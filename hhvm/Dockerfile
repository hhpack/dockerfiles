FROM ubuntu:16.04
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER Noritaka Horio <holy.shared.design@gmail.com>
RUN apt-get -y update
RUN apt-get -y install software-properties-common
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main"
RUN apt-get -y update
RUN apt-get -y install sudo curl hhvm
RUN adduser --disabled-password --gecos "" develop
RUN passwd -l develop
ADD developsudo /etc/sudoers.d/develop
RUN chmod 440 /etc/sudoers.d/develop
RUN chown root:root /etc/sudoers.d/develop
RUN chown -R develop:develop /home/develop
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
USER develop
ENV HOME /home/develop
WORKDIR /home/develop
USER develop
