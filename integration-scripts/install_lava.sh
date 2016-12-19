
# Add jessie-backports repository
sudo DEBIAN_FRONTEND=noninteractive cat "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list

# Update the system
sudo DEBIAN_FRONTEND=noninteractive apt-get -qqy update


# LAVA is currently packaged for Debian unstable using Django1.8 and Postgresql. 
# LAVA packages are now available from official Debian mirrors for Debian 
# unstable. e.g. to install the master, use:
sudo DEBIAN_FRONTEND=noninteractive apt install postgresql
sudo DEBIAN_FRONTEND=noninteractive apt -t jessie-backports install lava-server
sudo DEBIAN_FRONTEND=noninteractive a2dissite 000-default
sudo DEBIAN_FRONTEND=noninteractive a2enmod proxy
sudo DEBIAN_FRONTEND=noninteractive a2enmod proxy_http
sudo DEBIAN_FRONTEND=noninteractive a2ensite lava-server.conf
sudo DEBIAN_FRONTEND=noninteractive service apache2 restart




