FROM ubuntu:20.04
RUN apt-get update \
&& apt-get install nginx php7.4-fpm -y \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/* \
&& echo 'daemon off;' >> /etc/nginx/nginx.conf \
&& rm /var/www/html/index.nginx-debian.html \
&& echo "<?php echo 'Hello World'; ?>" > /var/www/html/index.php \
&& sed -i 's/\/run\/php\/php7.4-fpm.sock/127.0.0.1:9000/' /etc/php/7.4/fpm/pool.d/www.conf
COPY default /etc/nginx/sites-available/default
COPY start_nginx_and_php.sh .
CMD ["/bin/bash", "/start_nginx_and_php.sh"]
