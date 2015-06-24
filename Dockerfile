FROM php:5.6-apache

RUN a2enmod rewrite headers

RUN apt-get update && apt-get install -y \
  libmcrypt-dev libpng12-dev libfreetype6-dev libjpeg-dev libjpeg62-turbo-dev \
  libicu-dev zlib1g-dev re2c file g++ anacron smbclient curl bzip2

RUN docker-php-ext-install iconv intl mbstring mcrypt mysql pdo_mysql zip exif fileinfo

# see http://php.net/manual/en/image.installation.php
RUN docker-php-ext-configure gd --with-png-dir=/usr/include/ --with-freetype-dir=/usr/include/ --with-gd-dir=/usr/include/ \
  && docker-php-ext-install gd

ENV OWNCLOUD_VERSION 8.0.4

# owncloud
RUN curl -SL https://download.owncloud.org/community/owncloud-$OWNCLOUD_VERSION.tar.bz2 \
  | tar -xj -C /var/www/html --strip-components 1

## calendar
#RUN mkdir -p /var/www/html/apps/calendar \
#  && curl -L --insecure https://github.com/owncloud/calendar/archive/v8.0.0beta2.tar.gz \
#    | tar -xz -C /var/www/html/apps/calendar --strip-components 1
#
## contacts
#RUN mkdir -p /var/www/html/apps/contacts \
#  && curl -L --insecure https://github.com/owncloud/contacts/archive/v8.0.0beta2.tar.gz \
#    | tar -xz -C /var/www/html/apps/contacts --strip-components 1

# config
COPY php.ini /usr/local/lib/
COPY autoconfig.php /var/www/html/config/
COPY owncloud_run /usr/local/bin/

CMD ["owncloud_run"]
