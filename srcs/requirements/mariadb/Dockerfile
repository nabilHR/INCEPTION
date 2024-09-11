FROM debian:bullseye

RUN apt  update &&  apt upgrade -y && apt install -y   net-tools iputils-ping vim mariadb-server

WORKDIR  /mariadb/

COPY ./tools/conf/mariadb.conf  /etc/mysql/mariadb.conf.d/50-server.cnf

COPY  mariadb.sh .

RUN chmod 777 /var/lib/mysql

RUN chmod +x mariadb.sh

CMD [ "./mariadb.sh" ]