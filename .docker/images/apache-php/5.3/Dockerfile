FROM debian:10

ENV DEBIAN_FRONTEND=noninteractive
# Apply stack smash protection to functions using local buffers and alloca()
# Make PHP's main executable position-independent (improves ASLR security mechanism, and has no performance impact on x86_64)
# Enable optimization (-O2)
# Enable linker optimization (this sorts the hash buckets to improve cache locality, and is non-default)
# https://github.com/docker-library/php/issues/272
# -D_LARGEFILE_SOURCE and -D_FILE_OFFSET_BITS=64 (https://www.php.net/manual/en/intro.filesystem.php)
ENV PHP_CFLAGS="-fstack-protector-strong -fpic -fpie -O2 -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
ENV PHP_CPPFLAGS="$PHP_CFLAGS"
ENV PHP_LDFLAGS="-Wl,-O1 -pie"
ENV PHP_DIR /usr/local/etc
ENV PHP_INI_DIR "${PHP_DIR}"/php
ENV PHP_VERSION 5.3.29

ENV APACHE_CONFDIR /etc/apache2
ENV APACHE_ENVVARS $APACHE_CONFDIR/envvars

#Préparation des dossiers d'installation
COPY scripts/configure-debian.sh /usr/local/bin/configure-debian.sh
RUN chmod +x /usr/local/bin/configure-debian.sh
RUN configure-debian.sh

#Installation openssl
COPY scripts/install-openssl-dependencies.sh /usr/local/bin/install-openssl-dependencies.sh
RUN chmod +x /usr/local/bin/install-openssl-dependencies.sh
RUN install-openssl-dependencies.sh
COPY packages/openssl-1.0.2u.tar.gz /tmp/openssl.tar.gz
COPY scripts/compile-openssl.sh /usr/local/bin/compile-openssl.sh
RUN chmod +x /usr/local/bin/compile-openssl.sh
RUN compile-openssl.sh

#Installation curl
COPY scripts/install-curl-dependencies.sh /usr/local/bin/install-curl-dependencies.sh
RUN chmod +x /usr/local/bin/install-curl-dependencies.sh
RUN install-curl-dependencies.sh
COPY packages/curl-7.71.1.tar.gz /tmp/curl.tar.gz
COPY scripts/compile-curl.sh /usr/local/bin/compile-curl.sh
RUN chmod +x /usr/local/bin/compile-curl.sh
RUN compile-curl.sh

#Installation apache
COPY scripts/install-apache.sh /usr/local/bin/install-apache.sh
RUN chmod +x /usr/local/bin/install-apache.sh
COPY configs/apache/docker-php.conf /docker-php.conf
RUN install-apache.sh

#Installation de php
COPY scripts/install-php-dependencies.sh /usr/local/bin/install-php-dependencies.sh
RUN chmod +x /usr/local/bin/install-php-dependencies.sh
RUN install-php-dependencies.sh
COPY packages/php-5.3.29.tar.bz2 /usr/src/php.tar.bz2
COPY scripts/compile-php.sh /usr/local/bin/compile-php.sh
RUN chmod +x /usr/local/bin/compile-php.sh
RUN compile-php.sh

# https://httpd.apache.org/docs/2.4/stopping.html#gracefulstop
STOPSIGNAL SIGWINCH

COPY scripts/run-apache.sh /usr/local/bin/run-apache
RUN chmod +x /usr/local/bin/run-apache
RUN echo "<?php phpinfo();" > /var/www/html/index.php

CMD ["run-apache"]

EXPOSE 80