#!/bin/sh

openrc default
/etc/init.d/mariadb setup

rc-service mariadb start


# mysql -u root -e "CREATE USER 'root'@'%';"
mysql -u root -e "CREATE USER 'kcaraway'@'%' IDENTIFIED BY 'qwerty12345';"
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'kcaraway'@'%' IDENTIFIED BY 'qwerty12345' WITH GRANT OPTION;"
mysql -u root -e "FLUSH PRIVILEGES;"

mysql wordpress -u root < /wordpress3user.sql


rc-service mariadb stop

mysqld_safe --datadir="/var/lib/mysql"