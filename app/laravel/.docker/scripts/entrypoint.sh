#!/bin/sh
set -eux
# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- apache2-foreground "$@"
fi

if [ "$1" = 'apache2-foreground' ]; then
    # php composer.phar install --prefer-dist --no-interaction --optimize-autoloader
    php -r "file_exists('.env') || (copy('.env.example', '.env') && exec('php artisan key:generate --ansi'));"
    chmod -R 777 /var/www/html/storage/logs/
    chmod -R 777 /var/www/html/storage/framework/
fi

exec "$@"