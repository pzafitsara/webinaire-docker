FROM php:8-apache

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    libfreetype6-dev \
	libjpeg62-turbo-dev \
	libpng-dev \
    libbz2-dev \
    libpq-dev \
    libzip-dev \
    libicu-dev

RUN docker-php-ext-configure gd --with-freetype --with-jpeg ; \
	docker-php-ext-install -j$(nproc) gd

RUN set -eux ; \
    docker-php-ext-install \
        opcache \
        bcmath \
        bz2 \
        calendar \
        exif \
        gettext \
        iconv \
        pcntl \
        pdo \
        pdo_mysql \
        sockets \
        shmop \
        intl \
        zip

RUN pecl install apcu; \
    docker-php-ext-enable apcu

RUN rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    curl \
    openssl \
    wget

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs; \
    npm -v

RUN rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends git; \
    rm -rf /var/lib/apt/lists/* ; \
    git --version ; \
    git config --global core.filemode false

RUN echo "<?php phpinfo();" > /var/www/html/index.php

ENTRYPOINT ["docker-php-entrypoint"]
CMD ["apache2-foreground"]