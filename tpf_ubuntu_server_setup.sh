#!/bin/bash
# Ubuntu server 16.04.1 LTS setup script - Basic packages + LAMP/MEAN setup

echo "Run as ROOT"
sleep 2
echo "Installing essentials..."
sleep 2
apt-get update
apt-get install nano -y
apt-get install lynx -y
apt-get install curl -y
echo "Do you want a LAMP Server? (Apache 2, PHP 7.0, MySQL)"
read -n1 -p "Y/N" lamp
case $lamp in
  y|Y) echo "Ok, LAMP Server setup starting..."
    sleep 3
    # LAMP setup stuff here
    apt-get install apache2 -y
    apt-get install mysql-server -y
    apt-get install php7.0 php7.0-fpm php7.0-mysql -y ;;

  n|N) echo "Ok, skipping LAMP install" ;;
  *) echo "Oh well, you tried" ;;
esac
echo "Do you want a MEAN Server? (MongoDB, Express.js, Angular.js, Node.js)"
read -n1 -p "Y/N" mean
case $mean in
  y|Y) echo "Ok, MEAN server setup starting..."
    sleep 3
    echo "Adding repository for Node..."
    sleep 2
    curl -sL https://deb.nodesource.com/setup_6.x -o nodesource_setup.sh
    bash nodesource_setup.sh
    apt-get install nodejs -y
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
    echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
    apt-get update
    apt-get install mongodb-org -y ;;
    # MEAN Setup here

  n|N) echo "Ok, skipping MEAN install" ;;
  *) echo "Oh well, you tried" ;;
esac
