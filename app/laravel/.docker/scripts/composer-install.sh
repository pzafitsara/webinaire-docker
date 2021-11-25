#!/bin/bash

set -eux;

cd /var/www/html ; \
    php composer.phar install --prefer-dist --no-interaction --optimize-autoloader ; \
    php -r "file_exists('.env') || (copy('.env.example', '.env') && exec('php artisan key:generate --ansi'));" ; \
    php artisan optimize:clear ; \
    chmod -R 777 /var/www/html/storage/logs/ ; \
    chmod -R 777 /var/www/html/storage/framework/ ; \
    chmod -R 777 /var/www/html/bootstrap/cache/