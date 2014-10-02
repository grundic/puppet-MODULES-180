#!/bin/bash

write_done() {
  touch ~/provisioner_complete
}

first_run() {
  if [ ! -f ~/provisioner_complete ]; then
    wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb
    sudo dpkg -i puppetlabs-release-precise.deb
    sudo apt-get update
    sudo apt-get install -y puppet
    sed -i '/templatedir/c\' /etc/puppet/puppet.conf

    sudo rm /etc/hiera.yaml
    sudo ln -s /etc/puppet/hiera.yaml/etc/hiera.yaml

    sudo puppet module install puppetlabs-postgresql
    write_done
  fi
}

first_run
sudo puppet apply /etc/puppet/manifests/site.pp
