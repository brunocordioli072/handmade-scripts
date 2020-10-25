#!/bin/bash

# source ../utils/logger.sh

#Git installation
log_info "Installing git..."
{
    sudo apt install -y git-all
} &>/dev/null
log_info "Git INSTALLED!"

#Git configuration
log_read "Git username: "
read git_username
git config --global user.name $git_username

log_read "Git email: "
read git_email
git config --global user.email $git_email

log_warn "Use 'git config -l' to check git config..."