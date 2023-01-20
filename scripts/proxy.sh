#!/bin/bash

## install web server with php

IP=$(hostname -I | awk '{print $2}')

APT_OPT="-o Dpkg::Progress-Fancy="0" -q -y"
LOG_FILE="/vagrant/logs/install_web.log"
DEBIAN_FRONTEND="noninteractive"

echo "START - install web Server - "$IP

echo "=> [1]: Installing required packages..."
apt-get install $APT_OPT \
  apache2 \
  php \
  libapache2-mod-php \
  php-mysql \
  php-intl \
  php-curl \
  php-xmlrpc \
  php-soap \
  php-gd \
  php-json \
  php-cli \
  php-pear \
  php-xsl \
  php-zip \
  php-mbstring \
  >> $LOG_FILE 2>&1

echo "=> [2]: Apache2 configuration"
	# Add configuration of /etc/apache2
	
	sudo apt-get install libapache2-mod-proxy-html
	sudo a2enmod proxy proxy_http proxy_ajp proxy_balancer lbmethod_byrequests
	sudo systemctl restart apache2

	
	sudo echo -e " 
		<VirtualHost *:80>\n
\n
		ServerName proxy-alex-jessy.dev\n
		ServerAdmin postmaster@domaine.fr\n
\n	
		ProxyPass / http://192.168.56.80:80/\n
		ProxyPassReverse / http://192.168.56.80:80/\n
		ProxyRequests Off\n
\n
		</VirtualHost> " > /etc/apache2/sites-available/srvweb.conf

	sudo a2ensite srvweb.conf
	sudo a2dissite 000-default.conf
	sudo systemctl restart apache2

	sudo sed -i 's/localhost/proxy-alex-jessy.dev/g' /etc/hosts

echo "END - install web Server"