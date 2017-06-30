#!/bin/bash 


# install docker-ce
sudo apt-get update 
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
sudo apt-get update
sudo apt-get install -y docker-ce

# add current user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER

# Install nvidia-docker and nvidia-docker-plugin
sudo apt-get install -y nvidia-modprobe
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb
sudo apt-get install -f
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

# Test nvidia-smi
sudo nvidia-docker run --rm nvidia/cuda nvidia-smi

