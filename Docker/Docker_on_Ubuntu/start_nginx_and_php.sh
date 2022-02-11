#! /bin/bash
/usr/sbin/php-fpm7.4 --fpm-config /etc/php/7.4/fpm/php-fpm.conf
/usr/sbin/nginx -c /etc/nginx/nginx.conf
