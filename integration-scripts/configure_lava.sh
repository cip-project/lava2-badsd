# Configure Lava Server (V2 or "pipeline" jobs only)

# Add Lava Server Superuser
sudo DEBIAN_FRONTEND=noninteractive lava-server manage createsuperuser --username lavauser --email=lavauser@codethink.co.uk

# Add all existing Device Types to Lava Server
cd /etc/lava-server/dispatcher-config/device-types/
sudo DEBIAN_FRONTEND=noninteractive lava-server manage add-device-type '*'

#Return back to home directory
cd ~


