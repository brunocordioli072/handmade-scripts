#!/bin/bash

# source ../utils/logger.sh
# source ../utils/spinner.sh
sudo -v

start_spinner 

new_job
log_info "Installing Visual Code Studio..."
{
    file_path=/opt/code.deb
    sudo wget "https://az764295.vo.msecnd.net/stable/d2e414d9e4239a252d1ab117bd7067f125afd80a/code_1.50.1-1602600906_amd64.deb" -O $file_path
    sudo apt install $file_path
    sudo rm $file_path
} &>/dev/null
log_info "Visual Code Studio INSTALLED!"

new_job
log_info "Installing Visual Code Studio extensions..."
{
    code --install-extension shan.code-settings-sync
} &>/dev/null
log_info "Visual Code Studio extensions INSTALLED!"

stop_spinner $?
