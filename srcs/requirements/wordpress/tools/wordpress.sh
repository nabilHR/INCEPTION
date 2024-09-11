#!/bin/bash
# USERNAME="newuser"
# EMAIL="newuser@example.com"
# PASSWORD="securepassword"
POST_TITLE="My First Post"
POST_CONTENT="This is the content of my first post."


LISTEN_PORT=${LISTEN_PORT:-9000}
sed -i "s|^listen = .*|listen = 0.0.0.0:${LISTEN_PORT}|" /etc/php/7.4/fpm/pool.d/www.conf
echo "Current listening ports:"
netstat -tuln
sed -i 's/^;daemonize\s*=.*$/daemonize = no/'  /etc/php/7.4/fpm/php-fpm.conf
chmod +x /bin/wp
WP_DIR="/var/www/html"

# Check if WordPress files exist
# if [ -d "$WP_DIR" ] && [ "$(ls -A $WP_DIR)" ]; then
#   echo "WordPress files already exist. Skipping installation."
# else
#   echo "WordPress files not found. Installing WordPress."
    wp core download --allow-root
    wp config create  --allow-root --dbname=wp_database  --dbuser=nabil   --dbpass=nabil --dbhost=mariadb:3306
    wp core install --allow-root --url="https://nbaghoug.42.fr" --title="My WordPress Site" --admin_user="admin" --admin_password="securepassword" --admin_email="admin@example.com"

# fi

EXISTING_USER_ID=$(wp user get $USERNAME --field=ID --allow-root 2>/dev/null)

echo $EXISTING_USER_ID
if [ -n "$EXISTING_USER_ID" ]; then
    echo "user already exist"
else
    wp user create --allow-root  $USERNAME $EMAIL --user_pass=$PASSWORD --role=author --porcelain
fi

EXISTING_POST_ID=$(wp post list --allow-root  --post_type=post --post_status=publish --format=ids --title="$POST_TITLE")

if [ -n "$EXISTING_POST_ID" ]; then
    echo "A post with the title '$POST_TITLE' already exists. Post ID: $EXISTING_POST_ID"
else
    wp post create --allow-root  --post_type=post --post_title="$POST_TITLE" --post_content="$POST_CONTENT" --post_status=publish
fi

php-fpm7.4
