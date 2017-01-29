FROM php:5.6-apache
RUN apt-get update \
  && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev libxml2-dev libicu-dev \
  && docker-php-ext-install pdo_mysql mysqli mbstring gd iconv mcrypt zip \
  && docker-php-ext-install xmlrpc \
  && docker-php-ext-install soap \
  && docker-php-ext-install intl \
  && docker-php-ext-enable opcache
RUN mkdir /var/data
RUN chmod +x /var/data
