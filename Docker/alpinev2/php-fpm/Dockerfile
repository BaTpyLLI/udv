FROM alpine:3.14
RUN apk add --no-cache php7-fpm \
&& mkdir -p /var/www/ \
&& echo "<?php echo 'Hello World'; ?>" > /var/www/index.php\
&& echo -e "[www]\nlisten = 9000" > /etc/php7/php-fpm.d/zz-docker.conf
CMD ["/usr/sbin/php-fpm7", "-F"]
