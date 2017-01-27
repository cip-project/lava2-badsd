
# Add jessie-backports repository
echo "deb http://http.debian.net/debian jessie-backports main" | sudo DEBIAN_FRONTEND=noninteractive tee -a /etc/apt/sources.list

# Update the system
sudo DEBIAN_FRONTEND=noninteractive apt-get -y update
sudo DEBIAN_FRONTEND=noninteractive apt-get -y upgrade

# LAVA is currently packaged for Debian unstable using Django1.8 and Postgresql. 
# LAVA packages are now available from official Debian mirrors for Debian 
# unstable. e.g. to install the master, use:

# Install postgresql & tftp
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install postgresql tftp

# Install qemu & KVM
sudo DEBIAN_FRONTEND=noninteractive apt-get -y install qemu-kvm libvirt-bin

# Add teh vagrant user to the libvirtd and kvm groups
sudo DEBIAN_FRONTEND=noninteractive usermod -a -G libvirtd,kvm vagrant

# Install Lava Server
sudo DEBIAN_FRONTEND=noninteractive apt-get -t jessie-backports -y install lava-server

# Configure Apache web server & restart the apache2 service
sudo DEBIAN_FRONTEND=noninteractive a2dissite 000-default
sudo DEBIAN_FRONTEND=noninteractive a2enmod proxy
sudo DEBIAN_FRONTEND=noninteractive a2enmod proxy_http
sudo DEBIAN_FRONTEND=noninteractive a2ensite lava-server.conf
sudo DEBIAN_FRONTEND=noninteractive service apache2 restart




