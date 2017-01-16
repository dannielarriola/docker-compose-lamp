FROM php:5.6.29-apache

MAINTAINER Dannielarriola <dannielarriola@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV MYSQL_PASS=123456
ENV DB_NAME=local

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
RUN add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://mirror.edatel.net.co/mariadb/repo/10.1/debian jessie main'
RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client

COPY create-mysql-admin-user.sh /
RUN chmod 755 /*.sh
RUN create-mysql-admin-user.sh

VOLUME /var/www/html