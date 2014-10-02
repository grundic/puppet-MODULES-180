# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.synced_folder "data/puppet", "/etc/puppet"
  config.vm.synced_folder "data/hiera", "/etc/hiera"
  config.vm.provision :shell do |shell|
    shell.path = 'install.sh'
  end
end
