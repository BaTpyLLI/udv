FROM alpine:3.14
RUN apk add --no-cache php-fpm nginx \
&& echo 'daemon off;' >> /etc/nginx/nginx.conf \
&& echo "<?php echo 'Hello World'; ?>" > /var/www/index.php
COPY default /etc/nginx/http.d/default.conf
COPY start_nginx_and_php.sh .
CMD ["/bin/sh", "/start_nginx_and_php.sh"]
