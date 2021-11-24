#!/bin/sh
set -eux
ls -alF
cd ./app/laravel; \
  php composer.phar require --dev phpunit/phpunit ; \
  php -r "file_exists('.env') || (copy('.env.example', '.env') && exec('php artisan key:generate --ansi'));" ; \
  ./vendor/bin/phpunit tests/Unit/