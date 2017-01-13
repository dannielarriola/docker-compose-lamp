FROM ubuntu:trusty

MAINTAINER Dannielarriola <dannielarriola@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-key adv --recv-key --keyserver keyserver.ubuntu.com 4F4EA0AAE5267A6C
RUN apt-get update
RUN apt-get install -y language-pack-en-base
RUN locale-gen en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN export LC_ALL=en_US.UTF-8
RUN apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php5.6
