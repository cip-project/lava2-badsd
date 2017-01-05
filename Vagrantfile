# -*- mode: ruby -*-
# vi: set ft=ruby :
# Copyright (C) 2016, Siemens AG, Wolfgang Mauerer <wolfgang.mauerer@siemens.com>
# SPDX-License-Identifier:	Apache-2.0

$build = <<SCRIPT
cd /vagrant
integration-scripts/install_lava.sh
SCRIPT

Vagrant.configure(2) do |config|
 config.vm.provider :virtualbox do |vbox, override|
   config.vm.box = "debian/jessie64"

    vbox.customize ["modifyvm", :id, "--memory", "8192"]
    vbox.customize ["modifyvm", :id, "--cpus", "2"]
 end

 # Forward ports for internal REST server (8888) and frontend webserver (5000)
 #config.vm.network :forwarded_port, guest: 80, host: 80
 #config.vm.network :forwarded_port, guest: 443, host: 443
 config.vm.network "public_network"

 config.vm.provision "build", type: "shell" do |s|
   s.privileged = false
   s.inline = $build
 end
end
