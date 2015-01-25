FROM php:5.6-apache

# See https://wiki.archlinux.org/index.php/OwnCloud#Installation
# and https://registry.hub.docker.com/u/library/php/

RUN apt-get update && apt-get install -y \
  libmcrypt-dev libpng12-dev libfreetype6-dev libjpeg62-turbo-dev libicu-dev zlib1g-dev re2c file g++ anacron smbclient curl bzip2

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ \
  && docker-php-ext-install gd iconv intl mbstring mcrypt mysql pdo_mysql zip
 
# owncloud
RUN curl -L --insecure https://download.owncloud.org/community/owncloud-7.0.4.tar.bz2 \
  | tar -xj -C /var/www/html --strip-components 1

# config
#COPY config/php.ini /usr/local/lib/
COPY autoconfig.php /var/www/html/config/
COPY owncloud_run /usr/local/bin/

CMD ["owncloud_run"]
