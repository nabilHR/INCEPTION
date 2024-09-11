FROM  debian:bullseye

RUN apt update && apt upgrade -y && apt install -y nginx iputils-ping && apt install openssl -y

WORKDIR  /ssl
COPY ./tools/openssl.conf ./openssl.cnf


# EXPOSE 443
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=US/ST=California/L=San Francisco/O=MyCompany/OU=IT Department/CN=jj" \
-keyout private.key -out certificate.crt

COPY ./conf/nginx.conf  /etc/nginx/conf.d/default.conf

CMD ["nginx","-g","daemon off;"]