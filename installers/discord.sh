#!/bin/bash

# source ./utils/logger.sh
# source ./utils/spinner.sh
sudo -v

start_spinner
new_job
log_info "Installing Discord..."
{
    file_path=/opt/discord.deb
    sudo wget "https://discord.com/api/download?platform=linux&format=deb" -O $file_path
    sudo apt install $file_path
    sudo rm $file_path
} &>/dev/null
log_info "Discord INSTALLED!"
stop_spinner $?
