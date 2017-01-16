FROM ubuntu:xenial

MAINTAINER Dannielarriola <dannielarriola@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN rm /usr/sbin/policy-rc.d
RUN apt-key adv --recv-key --keyserver keyserver.ubuntu.com 4F4EA0AAE5267A6C
RUN apt-get update
RUN apt-get install -y language-pack-en-base
RUN locale-gen en_US.UTF-8

ENV LANG=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV SERVER_NAME=local.dev

RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php5.6 && echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN apt-get remove mariadb-server mariadb-client
RUN apt-get -y install mariadb-server mariadb-client

RUN a2enmod rewrite
RUN service apache2 start

EXPOSE 80 3306 443
