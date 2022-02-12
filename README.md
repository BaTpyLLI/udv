# Описание
- Docker_on_Ubuntu - образ на основе ubuntu:20.04, nginx и php-fpm вместе.
  - _Конечный размер образа - 210MB_

- alpine - образ на основе alpine:3.14, nginx и php-fpm вместе.
  - _Конечный размер образа - 18.4MB_

- alpinev2 - образы на основе alpine:3.14, nginx и php-fpm собираются отдельно.
  - Конечный размер образа:
    _nginx - 7.04MB_
    _php-fpm - 17MB_

- compose - аналогичен alpinev2, контейнеры поднимаются при помощи docker-compose.

start_nginx_and_php.sh - нужен для образов, где nginx и php-fpm собраны в одном образе, что несколько отходит от принципа: один контейнер - одно приложение 


# Примеры команд для запуска контейнера(ов).

docker run -d -p `*порт хостовой машины*`:80 --name `*имя контейнера*` `*имя собранного образа*`

 - Alpine/Docker_on_Ubuntu:
   - _docker build -t alpine ._
   - _docker run -d -p 1000:80 --name my-web alpine_

 - alpinev2:
   - _docker build -t nginx-alpinev2 ._
   - _docker build -t php-fpm ._
     - docker network create nginx-php-fpm
     - _docker run -d -p 2000:80 --network=nginx-php-fpm --name nginx-web nginx-alpinev2_
     - _docker run -d --network=nginx-php-fpm --name php-fpm php-fpm_

 - compose:
   - _docker-compose up -d_

Для того, чтобы можно было воспользоваться playbook, требуется установить community.docker:
 - _ansible-galaxy collection install community.docker_

# Ansible
При запуске playbook устанавливает на сервер все необходимое для работы Docker.
Для того, чтобы развернуть alpine/alpinev2/compose необходимо воспользоваться --skip-tags, где:
 - compose - разворачивает при помощи docker-compose
 - nginx-php-alpine - разворачивает alpinev2
 - nginx-php-fpm - разворачивает alpine

К примеру строка запуска ansible для того, чтобы развернуть только alpinev2 будет выглядить следующем образом:
`ansible-playbook playbook.yml --skip-tags "compose, nginx-php-fpm"`
