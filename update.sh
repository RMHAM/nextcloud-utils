#!/bin/sh
sudo -u www-data php /var/www/nextcloud/occ maintenance:mode --on
sudo apt update
sudo apt -yf dist-upgrade
sudo apt-get -y --purge autoremove
sudo apt-get autoclean
sudo -u www-data php /var/www/nextcloud/occ maintenance:mode --off
