FROM alpine:latest
MAINTAINER jckimble <jckimble@thorbis.com>

RUN apk update && apk upgrade && apk add apache2 apache2-utils php5 php5-apache2 php5-openssl php5-mysqli php5-xml php5-zlib php5-bz2 php5-zip php5-intl php5-opcache php5-ctype php5-mcrypt php5-json php5-gd php5-curl php5-sqlite3 php5-phar && rm -rf /var/cache/apk/* && mkdir -p /usr/share/webapps/ && wget http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-4.5.0.2-all-languages.tar.gz && tar zxvf phpMyAdmin-4.5.0.2-all-languages.tar.gz -C /usr/share/webapps && rm phpMyAdmin-4.5.0.2-all-languages.tar.gz && mv /usr/share/webapps/phpMyAdmin-4.5.0.2-all-languages /usr/share/webapps/phpmyadmin && mkdir -p /run/apache2 && mkdir -p /etc/phpmyadmin

COPY config.inc.php /app/
COPY phpmyadmin.conf /etc/apache2/conf.d/
COPY basedir.ini /etc/php7/conf.d/02_basedir.ini
ADD https://github.com/thorbis-hosting/ParseConfig/releases/download/v0.1/ParseConfig /usr/local/bin/
COPY startup.sh /startup.sh

RUN chmod +x /startup.sh
RUN sed -i 's#AllowOverride None#AllowOverride All#' /etc/apache2/httpd.conf
RUN sed -i 's#\#LoadModule rewrite_module modules/mod_rewrite.so#LoadModule rewrite_module modules/mod_rewrite.so#' /etc/apache2/httpd.conf

EXPOSE 80
VOLUME ["/var/www/localhost/htdocs"]
CMD ["/usr/sbin/httpd","-DFOREGROUND"]
