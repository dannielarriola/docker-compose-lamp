FROM php:5.6.29-apache

MAINTAINER Dannielarriola <dannielarriola@gmail.com>

RUN groupadd -r mysql && useradd -r -g mysql mysql

ENV DEBIAN_FRONTEND=noninteractive
ENV MYSQL_PASS=123456
ENV DB_NAME=local
ENV RET=1

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
RUN add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://mirror.edatel.net.co/mariadb/repo/10.1/debian jessie main'
RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client

RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/my.cnf \
	&& echo 'skip-host-cache\nskip-name-resolve' | awk '{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/mysql/my.cnf > /tmp/my.cnf \
	&& mv /tmp/my.cnf /etc/mysql/my.cnf

VOLUME /var/www/html

EXPOSE 3306
RUN service mysql start \
&& while (( ${RET} -ne 0 )); do ${RET}=$?;done \
&& mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '${MYSQL_PASS}'" \
&& mysqladmin -uroot shutdown

#RUN /usr/bin/mysqld_safe > /dev/null 2>&1
#RUN  mysql -uroot -e "CREATE USER 'admin'@'%' IDENTIFIED BY '${MYSQL_PASS}'"
#RUN  mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"
#RUN  mysql -uroot -e "CREATE DATABASE ${DB_NAME} CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci"
#RUN mysqladmin -uroot shutdown