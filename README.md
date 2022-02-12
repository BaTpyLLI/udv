# Описание
Docker_on_Ubuntu - образ на основе ubuntu:20.04, nginx и php-fpm вместе.
Конечный размер образа - 210MB

alpine - образ на основе alpine:3.14, nginx и php-fpm вместе.
Конечный размер образа - 18.4MB

alpinev2 - образы на основе alpine:3.14, nginx и php-fpm собираются отдельно
Конечный размер образа:
nginx - 7.04MB
php-fpm - 17MB

compose - аналогичен alpinev2, контейнеры поднимаются при помощи docker-compose.

start_nginx_and_php.sh - нужен для образов, где nginx и php-fpm собраны в одном образе, что несколько отходит от принципа: один контейнер - одно приложение 


# Примеры команд для запуска контейнера(ов).

docker run -d -p *порт хостовой машины*:80 --name *имя контейнера* *имя собранного образа*

Alpine/Docker_on_Ubuntu:
docker build -t alpine .
docker run -d -p 1000:80 --name my-web alpine

alpinev2:
docker build -t nginx-alpinev2 .
docker build -t php-fpm .

docker network create nginx-php-fpm
docker run -d -p 2000:80 --network=nginx-php-fpm --name nginx-web nginx-alpinev2
docker run -d --network=nginx-php-fpm --name php-fpm php-fpm

compose:
docker-compose up -d

Для того, чтобы можно было воспользоваться playbook, требуется установить community.docker:
ansible-galaxy collection install community.docker
