# Configure Lava Server (V2 or "pipeline" jobs only)

# QEMU
# Copy latest qemu.jinja file to /etc/lava-server/dispatcher-config/device-types/
sudo DEBIAN_FRONTEND=noninteractive cp -v /vagrant/device-types/qemu.jinja2 /etc/lava-server/dispatcher-config/device-types/

# Add a Device Type qemu and Device qemu01 for the QEMU VM
cd /etc/lava-server/dispatcher-config/device-types/
sudo DEBIAN_FRONTEND=noninteractive lava-server manage add-device-type qemu
sudo DEBIAN_FRONTEND=noninteractive lava-server manage add-device --device-type qemu qemu01

# Create the Device Dictionary file for a QEMU VM and store it in ~/myqemu.dat
cd ~
echo "{% extends 'qemu.jinja2' %}" > myqemu.dat 
echo "{% set no_kvm = True %}" >> myqemu.dat
echo "{% set mac_addr = '52:54:00:12:34:59' %}" >> myqemu.dat
echo "{% set memory = '1024' %}" >> myqemu.dat

# Import the QEMU Device Dictionary file into the LAVA2 Server
sudo DEBIAN_FRONTEND=noninteractive lava-server manage device-dictionary --hostname qemu01 --import myqemu.dat 

# Beaglebone Black
# Add a Device Type beaglebone-black and Device bbb01 for the Beaglebone Black
cd /etc/lava-server/dispatcher-config/device-types/
sudo DEBIAN_FRONTEND=noninteractive lava-server manage add-device-type beaglebone-black
sudo DEBIAN_FRONTEND=noninteractive lava-server manage add-device --device-type beaglebone-black bbb01

# Create the Device Dictionary file for the Beaglebone Black and store it in ~/mybbb.dat
cd ~
echo "{% extends 'beaglebone-black.jinja2' %}" > mybbb.dat
echo "{% set ssh_host = '10.0.0.50' %}" >> mybbb.dat
echo "{% set connection_command = 'telnet localhost 6000' %}" >> mybbb.dat

# Import the Beaglebone Black Device Dictionary file into the LAVA2 Server
sudo DEBIAN_FRONTEND=noninteractive lava-server manage device-dictionary --hostname bbb01 --import mybbb.dat


