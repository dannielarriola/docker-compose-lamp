FROM php:5.6.29-apache
RUN apt-get update \
  && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev \
  && docker-php-ext-install pdo_mysql mysqli mbstring gd iconv mcrypt zip intl soap xmlrpc opcache \
  && docker-php-ext-enable zip zip intl soap xmlrpc opcache
