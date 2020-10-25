####################################
#  ↓ To execute this script use ↓  #
#      bash install-docker.sh      #
####################################

#!/bin/bash

sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

sudo apt install curl
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

## docker as a non-root user

# MESSAGE="Configuring Docker as non-root..." ; info_echo
# {
#     groupadd docker
#     usermod -aG docker $USER
# } &> /dev/null
# MESSAGE="Docker configured as non-root!" ; success_echo

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
