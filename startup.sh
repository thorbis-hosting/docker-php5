#!/bin/sh

/usr/local/bin/ParseConfig /app/config.inc.php /etc/phpmyadmin/config.inc.php

/usr/sbin/httpd -DFOREGROUND
