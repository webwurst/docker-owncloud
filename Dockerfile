from apache-php

# dependencies
run apt-get update && apt-get install -y \
	anacron \
	smbclient \
	curl

# owncloud

run curl -L --insecure https://download.owncloud.org/community/owncloud-7.0.2.tar.bz2 \
#run curl -L https://download.owncloud.org/community/daily/owncloud-daily-master.tar.bz2 \
	| tar -xj -C /var/www/html --strip-components 1

# config
add autoconfig.php /var/www/html/config/
add owncloud_run /usr/local/bin/

cmd ["owncloud_run"]
