#!/bin/sh
set -eux; \
	{ \
		echo 'Package: php*'; \
		echo 'Pin: release *'; \
		echo 'Pin-Priority: -1'; \
	} > /etc/apt/preferences.d/no-debian-php

apt-get update && apt-get upgrade -y

if [ ! -d "${PHP_INI_DIR}/conf.d" ]; then
  mkdir -p "${PHP_INI_DIR}/conf.d"
fi

# allow running as an arbitrary user (https://github.com/docker-library/php/issues/743)
if [ ! -d /var/www/html ]; then
  mkdir -p /var/www/html; \
	chown www-data:www-data /var/www/html
	chmod 777 /var/www/html
fi
