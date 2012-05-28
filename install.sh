#!/bin/bash

# This runs as root on the server

chef_binary=`which chef-solo`
knife_binary=`which knife`

# Are we on a vanilla system?
if [ "$chef_binary" != ""] ; then
    export DEBIAN_FRONTEND=noninteractive
	# replace old mirrors with new s3 based for ubuntu
    sudo sed -i.dist 's,archive.ubuntu.com,archive.ubuntu.com.s3.amazonaws.com,g' /etc/apt/sources.list    
	
	# Upgrade headlessly (this is only safe-ish on vanilla systems)	
    sudo apt-get update
    
    # forces update of all installed packages
    #sudo apt-get -o Dpkg::Options::="--force-confnew" --force-yes -fuy dist-upgrade
    
	# Install git
	sudo apt-get install -y git
		
	# Install Ruby and Chef
    sudo apt-get install -y ruby1.9.1 ruby1.9.1-dev make
    sudo gem1.9.1 install --no-rdoc --no-ri chef --version 0.10.0 # 0.10.10 got problems with python vitualenv
    # Data bags
    mkdir data-bags
	# cache
	mkdir cache     
	# git clone our cookbooks
    mkdir cookbooks
    # git clone original cookbooks
    mkdir orig-cookbooks && cd orig-cookbooks && git init && touch .gitignore \
    && git add && git commit -am"Download cookbook repository created" && cd ..
    
	# clone all with submodules e.g. recursive
    #git clone --recursive git://github.com/gbatalski/cookbooks.git cookbooks
    
fi




# run chef solo
# cd ~/chef-solo
#"$chef_binary" -c solo.rb -j solo.json

# run knife solo z.B.
# cd ~/chef-solo
#"$knife_binary" cookbook site install COOKBOOK -c solo.rb