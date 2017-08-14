#!/bin/bash
set -e
set -x

sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT

sudo sed -i -e 's/iptables -P INPUT DROP/iptables -P INPUT ACCEPT/' /etc/systemd/scripts/iptables
sudo sed -i -e 's/iptables -P OUTPUT DROP/iptables -P OUTPUT ACCEPT/' /etc/systemd/scripts/iptables
sudo sed -i -e 's/iptables -P FORWARD DROP/iptables -P FORWARD ACCEPT/' /etc/systemd/scripts/iptables

echo 'DOCKER_OPTS="-H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock"' | sudo tee -a /etc/default/docker > /dev/null
sudo tdnf install bridge-utils
sudo systemctl restart docker
sudo systemctl enable docker
sudo systemctl status docker
