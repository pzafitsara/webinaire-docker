#!/bin/sh
set -eux
#wget https://museum.php.net/php5/php-"${PHP_VERSION}".tar.bz2
cd /usr/src

tar jxvf php.tar.bz2
rm php.tar.bz2
ln -s /usr/lib/x86_64-linux-gnu/libldap.so /usr/lib/libldap.so
ln -s /usr/lib/x86_64-linux-gnu/liblber.so /usr/lib/liblber.so
ln -s /usr/local/ssl/include/openssl /usr/local/include/openssl
ln -s /usr/local/curl/include/curl /usr/local/include/curl
ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h ;\
#    ln -s /usr/lib/libc-client.a /lib/x86_64-linux-gnu/ ;\
#    ln -s /usr/lib/libc-client.so.2007e.0 /lib/x86_64-linux-gnu/
#  \
mv /usr/src/php-5.3.29 /usr/src/php

cd /usr/src/php; \
    export \
        CFLAGS="$PHP_CFLAGS" \
        CPPFLAGS="$PHP_CPPFLAGS" \
        LDFLAGS="$PHP_LDFLAGS"; \
    ./configure \
        --enable-option-checking=fatal \
        --with-config-file-path="${PHP_INI_DIR}" \
        --with-config-file-scan-dir="${PHP_INI_DIR}/conf.d" \
        --with-apxs2 \
        --disable-rpath \
        --enable-inline-optimization \
        --with-zlib \
        --with-zlib-dir \
        --enable-mbstring \
        --enable-mysqlnd \
        --enable-ftp \
        --enable-exif \
        --enable-shmop \
        --enable-soap \
        --enable-sockets \
        --enable-bcmath \
        --enable-pcntl \
        --enable-zip \
        --with-mysql=mysqlnd \
        --with-mysqli=mysqlnd \
        --enable-pdo \
        --with-pdo-mysql=mysqlnd \
        --with-pdo-sqlite \
        --with-sqlite3 \
        --with-mcrypt \
        --with-mhash \
        --with-xmlrpc \
        --with-xsl \
        --enable-debug \
        --with-curl=/usr/local/curl \
        --with-openssl=/usr/local/ssl \
        --with-kerberos \
        --with-gettext \
        --with-bz2 \
        --enable-calendar \
        --with-libxml-dir \
        --enable-xml \
        --with-zlib-dir \
        --enable-gd-native-ttf \
        --with-tidy \
        --with-pspell \
        --with-ldap \
        --with-pcre-regex \
        --enable-sysvsem \
        --enable-sysvshm \
        --with-gmp \
        --with-iconv \
        --enable-json \
        --enable-mbregex \
        --with-enchant \
        --enable-dom \
        --without-sqlite \
        --enable-ucd-snmp-hack \
        --enable-dba \
        --enable-xmlwriter \
        --enable-xmlreader \
        --without-gdbm \
        --enable-fileinfo \
        --with-readline \
        --enable-fastcgi \
        --enable-force-cgi-redirect \
        --enable-wddx \
        --with-recode \
        --enable-posix \
        --without-pear \
        --enable-phar \
        --with-libedit; \
	make -j "$(nproc)"; \
	find -type f -name '*.a' -delete; \
	make install; \
	find \
		/usr/local \
		-type f \
		-perm '/0111' \
		-exec sh -euxc ' \
			strip --strip-all "$@" || : \
		' -- '{}' + \
	; \
	make clean; \
	\
# https://github.com/docker-library/php/issues/692 (copy default example "php.ini" files somewhere easily discoverable)
	cp -v php.ini-* "${PHP_INI_DIR}/"; \
	cp "${PHP_INI_DIR}/php.ini-development" "${PHP_INI_DIR}/php.ini"; \
  echo "<?php phpinfo();" > /var/www/index.php; \
	\
	cd

apt-get clean autoclean autoremove
php --version