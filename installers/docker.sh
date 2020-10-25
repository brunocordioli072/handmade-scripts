####################################
#  ↓ To execute this script use ↓  #
#      bash install-docker.sh      #
####################################

#!/bin/bash

# source ../utils/logger.sh
# source ../utils/spinner.sh
sudo -v

start_spinner

new_job
log_info "Docker installing..."
{
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
} &> /dev/null
log_info "Docker INSTALLED!"

## docker as a non-root user

# MESSAGE="Configuring Docker as non-root..." ; info_echo
# {
#     groupadd docker
#     usermod -aG docker $USER
# } &> /dev/null
# MESSAGE="Docker configured as non-root!" ; success_echo


## docker-compose installation
new_job
log_info "Installing Docker-compose..."
{
    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}&> /dev/null
log_info "Docker-compose INSTALLED!" ;

log_warn "Please don't forget to logout for docker non-root user work!"

stop_spinner $?