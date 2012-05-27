#!/bin/bash

# This runs as root on the server

chef_binary=/var/lib/gems/1.9.1/bin/chef-solo

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
    export DEBIAN_FRONTEND=noninteractive
    # Upgrade headlessly (this is only safe-ish on vanilla systems)	
    sudo apt-get update
    
    # forces update of all installed packages
    #sudo apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade
    
	# Install Ruby and Chef
    sudo apt-get install -y ruby1.9.1 ruby1.9.1-dev make
    sudo gem1.9.1 install --no-rdoc --no-ri chef --version 0.10.0
    # Data bags
    mkdir data-bags
    # git clone our cookbooks
    mkdir cookbooks
    # git clone original cookbooks
    mkdir orig-cookbooks
    
	# clone all with submodules e.g. recursive
    git clone --recursive git://github.com/gbatalski/cookbooks.git cookbooks
    
fi

# run chef solo
#"$chef_binary" -c solo.rb -j solo.json