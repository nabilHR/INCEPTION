FROM  debian:bullseye

RUN apt update && apt upgrade -y  && apt install curl net-tools  php-mysql  mariadb-client   iputils-ping php-fpm  vim -y

RUN mkdir -p /var/www/html /run/php

WORKDIR  /var/www/html

RUN chown www-data:www-data /var/www/html
RUN  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    &&  mv wp-cli.phar /bin/wp 


COPY ./tools/wordpress.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["entrypoint.sh"]