#!/bin/bash
echo "Updating Apt-Get"
sudo apt-get --yes update
sudo apt-get --yes upgrade
echo "installing puppet"
sudo apt-get --yes install puppet 
echo "ensure puppet service is running"
sudo puppet resource service puppet ensure=running enable=true

