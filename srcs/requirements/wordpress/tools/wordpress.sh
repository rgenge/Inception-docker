#!/bin/sh

#This will check the wp-config file and set users login details from env file
if [ ! -f "wp-config.php" ]
then
        mv wp-config-sample.php wp-config.php
        sed -i "s/username_here/$MYSQL_USER/g" wp-config.php
        sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config.php
        sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config.php
        sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config.php
fi

exec "$@"

