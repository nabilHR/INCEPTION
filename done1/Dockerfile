FROM debian:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt upgrade -y  && apt install -y \
    vim \
    nginx \ 
    mariadb-server \
    php-fpm \
    php-mysql \
    curl \
    unzip 

    WORKDIR /var/www/html
    RUN curl -O https://wordpress.org/latest.tar.gz \
    && tar -xzf latest.tar.gz \
    && rm latest.tar.gz \
    && mv wordpress/* . \
    && rmdir wordpress

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 8080

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

CMD ["entrypoint.sh"]
