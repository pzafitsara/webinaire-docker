FROM docker:20.10-git

RUN apk update && apk upgrade

RUN set -eux; \
    apk add \
    php7 \
    php7-intl php7-openssl php7-pdo php7-sqlite3 php7-pdo_sqlite php7-pear \
    php7-tokenizer php7-sodium php7-pdo_mysql php7-mysqli php7-soap \
    php7-mbstring php7-session php7-zip php7-shmop php7-iconv php7-gettext \
    php7-calendar php7-opcache php7-bcmath php7-bz2 php7-pcntl php7-exif \
    php7-iconv php7-zip php7-phar php7-json php7-gd php7-mysqli php7-zlib php7-curl \
    php7-sockets php7-gd php7-xml php7-xmlwriter php7-mbstring php7-fileinfo

RUN set -eux; \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" ; \
    php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" ; \
    php composer-setup.php ; \
    php -r "unlink('composer-setup.php');" ; \
    mv composer.phar /usr/bin/composer

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["sh"]