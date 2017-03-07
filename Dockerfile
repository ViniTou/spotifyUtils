FROM php:7.1.2-apache

COPY Docker/Apache/000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
EXPOSE 443
WORKDIR /var/www

RUN rm -f /var/run/apache2/apache2.pid
