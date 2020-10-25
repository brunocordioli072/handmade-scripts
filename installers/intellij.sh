#!/bin/bash

# source ../utils/logger.sh
# source ../utils/spinner.sh
sudo -v

start_spinner
new_job
log_info "Installing Intellij..."
{
    sudo snap install intellij-idea-ultimate --classic
} &>/dev/null
log_info "Intellij INSTALLED!"
stop_spinner $?
