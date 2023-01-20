#!/bin/bash

## install PhpMyAdmin Application

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_myadmin_bdd.log"
DEBIAN_FRONTEND="noninteractive"
MYADMIN_VERSION="5.1.1"
WWW_REP="/var/www/html"

echo "START - Installation of phpMyAdmin - "$IP

echo "[1] - create database for phpmyadmin  "
mysql -e "CREATE DATABASE phpmyadmin"
mysql -e "GRANT ALL PRIVILEGES ON phpmyadmin.* TO 'pma'@'%' IDENTIFIED BY 'pmapass'" #changer % pour 192.168.56.81 plus tard
#mysql < ${WWW_REP}/myadmin/sql/create_tables.sql # le script create table n'exite pas il faut le trouver chez phpmyadmin
mysql < /vagrant/files/create_tables.sql

echo "END - Installation of phpMyAdmin - "