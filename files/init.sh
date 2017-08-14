#!/bin/sh

#set -e
set -x
umask 022
sudo sed -i -e 's/umask 027/umask 022/' /etc/profile
echo "`date`: photon-setup-start" >> /tmp/vagrant-times.txt
sudo tdnf makecache
sudo tdnf update -y
sudo tdnf install git -y
