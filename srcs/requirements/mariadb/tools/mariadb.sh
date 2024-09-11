#! /bin/bash

# DB_USER = nabil
# DATABASE_NAME = wp_database
service mariadb start

mysql -e "create database if not exists $DATABASE_NAME ;"

# USER_EXISTS=$(mysql -sse "SELECT EXISTS(SELECT 1 FROM mysql.user WHERE user = '$DB_USER' AND host = '%');")
# echo "here: $USER_EXISTS"

# if [ "$USER_EXISTS" -eq 1 ]; then
#     echo "User '$DB_USER' already exists."
# else
#     echo "User '$DB_USER' does not exist. Creating the user..."
    mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER';"
    mysql -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DB_USER'@'%';"
    mysql -e "FLUSH PRIVILEGES;"
# fi


chown -R mysql:mysql /var/lib/mysql /var/run/mysqld
chmod 700 /var/run/mysqld

service mariadb stop


mariadbd
