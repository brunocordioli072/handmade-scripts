#!/bin/bash

# source ../utils/logger.sh
# source ../utils/spinner.sh
sudo -v

start_spinner
new_job
log_info "Installing Microsft Teams..."
{
    file_path=/opt/teams.deb
    sudo wget "https://teams.microsoft.com/downloads/desktopurl?env=production&plat=linux&arch=x64&download=true&linuxArchiveType=deb" -O $file_path
    sudo apt install $file_path
    sudo rm $file_path
} &>/dev/null
log_info "Microsft Teams INSTALLED!"
stop_spinner $?
