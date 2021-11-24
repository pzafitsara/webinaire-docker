#!/bin/sh
set -eux
#https://github.com/hrak/docker-php-5.3/blob/master/Dockerfile
apt-get update; \
    apt-get install -y --no-install-recommends \
      autoconf \
      autoconf2.13 \
      ca-certificates \
      curl \
      file \
      g++ \
      gcc \
      gnupg \
      make \
      pkg-config \
      re2c \
      xz-utils \
      zlib1g-dev \
      libbz2-dev \
      libc-dev \
      libedit-dev \
      libidn2-dev \
      libmcrypt-dev \
      libnghttp2-dev \
      libpsl-dev \
      libreadline6-dev \
      librecode-dev \
      libsqlite3-dev \
      libssl-dev \
      libxml2-dev \
      apache2-dev \
      libonig-dev \
      libsodium-dev \
      libfreetype6-dev \
      libjpeg62-turbo-dev \
      libpng-dev \
      libgmp-dev \
      libc-client-dev \
      libkrb5-dev \
      libicu-dev \
      libsasl2-dev \
      libpspell-dev \
      aspell-en \
      libtidy-dev \
      gettext \
      libxslt1-dev \
      libmhash-dev \
      libmhash2 \
      libvpx-dev \
      libxpm-dev \
      libmagic-dev \
      libpcre3-dev \
      libenchant-dev \
      bison \
      librecode-dev \
      libdb-dev \
      libldap2-dev \
    ; \
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*
