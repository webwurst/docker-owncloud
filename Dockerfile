FROM webwurst/apache-php

# dependencies
RUN apt-get update && apt-get install -y \
	anacron \
	smbclient \
	curl

# owncloud
#RUN curl -L https://download.owncloud.org/community/daily/owncloud-daily-master.tar.bz2 \
RUN curl -L --insecure https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2 \
	| tar -xj -C /var/www/html --strip-components 1

# etcdctl
RUN curl -L --insecure https://github.com/coreos/etcd/releases/download/v0.4.6/etcd-v0.4.6-linux-amd64.tar.gz \
  | tar -xz -C /usr/local/bin --strip-components 1

# config
COPY autoconfig.php /var/www/html/config/
COPY owncloud_run /usr/local/bin/

CMD ["owncloud_run"]
