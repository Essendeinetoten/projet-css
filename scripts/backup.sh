#!/bin/bash

## install Mariadb server (ex Mysql))

IP=$(hostname -I | awk '{print $2}')
APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_bdd.log"
DEBIAN_FRONTEND="noninteractive"

#Utilisateur a créer (si un vide alors pas de création)
DBNAME="moodle"
DBUSER="moodle_user"
DBPASSWD="network"
#Fichier sql à injecter (présent dans un sous répertoire)



echo "START - install MariaDB - "$IP

echo "=> [1]: Install required packages ..."
DEBIAN_FRONTEND=noninteractive
apt-get install -o Dpkg::Progress-Fancy="0" -q -y \
	mariadb-server \
	mariadb-client \
   >> $LOG_FILE 2>&1

apt-get install cron



# MySQL/MariaDB Backup

BACKUP_DIR="/vagrant/files/"
DATE=$(date +"%Y-%m-%d")
>> $LOG_FILE 2>&1
sudo mysqldump -h 192.168.56.81 -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_DIR/$DB_NAME-$DATE.sql
>> $LOG_FILE 2>&1

# echo "Backup recurrence - all 00:00"
# guard_comment='# == my custom scheduler =='
# sudo crontab -l > /tmp/crontab.txt
# grep -qF "$guard_comment" /tmp/crontab.txt && exit 0
# echo "$guard_comment" >>/tmp/crontab.txt
# echo "0 0 * * * sudo /vagrant/script/backup.sh" >> /tmp/crontab.txt 
# sudo crontab /tmp/crontab.txt 
# rm /tmp/crontab.txt