#!/bin/bash

sudo apt install -y git-all

log_read "Git username: "
read git_username
git config --global user.name $git_username

log_read "Git email: "
read git_email
git config --global user.email $git_email
