############################
#  To execute this script  #
#  bash install-docker.sh  #
############################

#!/bin/bash

success_echo() {
    echo -e "\x1b[1;32m[SUCCESS] - $MESSAGE\e[0m"
}

info_echo() {
    echo -e "\x1b[1;34m[INFO] - $MESSAGE\e[0m"
}

MESSAGE="Docker installing..." ; info_echo
{
    apt-get remove docker docker-engine docker.io containerd runc
    apt-get update
    apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
    apt-get update
    apt-get install docker-ce docker-ce-cli containerd.io
} &> /dev/null
MESSAGE="Docker INSTALLED!" ; success_echo

## docker as a non-root user

# MESSAGE="Configuring Docker as non-root..." ; info_echo
# {
#     groupadd docker
#     usermod -aG docker $USER
# } &> /dev/null
# MESSAGE="Docker configured as non-root!" ; success_echo

## docker-compose installation

MESSAGE="Installing Docker-compose..." ; info_echo
{
    curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}&> /dev/null
MESSAGE="Docker-compose INSTALLED!" ; success_echo

MESSAGE="Please don't forget to logout for non-root user work!" ; info_echo
