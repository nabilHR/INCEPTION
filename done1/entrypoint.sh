#!/bin/bash

service mariadb start
mysql -e "CREATE DATABASE my_database;"
mysql -e "CREATE USER 'nabil'@'localhost' IDENTIFIED BY 'nabil';"
mysql -e "GRANT ALL PRIVILEGES ON my_database.* TO 'nabil'@'localhost';"
mysql -e "FLUSH PRIVILEGES;"


cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed -i "s/database_name_here/my_database/" /var/www/html/wp-config.php
sed -i "s/username_here/nabil/" /var/www/html/wp-config.php
sed -i "s/password_here/nabil/" /var/www/html/wp-config.php
sleep 1
service php8.2-fpm start
service nginx start

bash