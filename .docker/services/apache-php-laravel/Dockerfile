FROM zfpoly/apache-php:8.0.0

#Suppression des vhosts présents dans l'image
RUN rm -r /etc/apache2/sites-available/* && rm -r /etc/apache2/sites-enabled/*

#Copie et activation du vhost de l'application
COPY ./configs/apache/vhost/app-laravel.conf /etc/apache2/sites-available/app-laravel.conf
RUN a2enmod rewrite && a2ensite app-laravel

COPY ./scripts/entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

WORKDIR /var/www/html

VOLUME /var/log/apache2

ENTRYPOINT ["entrypoint"]
CMD ["apache2-foreground"]
EXPOSE 80