# #!/bin/bash

source ./utils/logger.sh
source ./utils/spinner.sh
source ./utils/install.sh

sudo -v

new_job
log_info "Installing Git..."
source ./installers/git.sh
log_info "Git INSTALLED!"
log_warn "Use 'git config -l' to check git config..."

start_spinner

new_job
log_info "Installing Visual Code Studio..."
install_deb_file "https://az764295.vo.msecnd.net/stable/d2e414d9e4239a252d1ab117bd7067f125afd80a/code_1.50.1-1602600906_amd64.deb"
code --install-extension shan.code-settings-sync
log_info "Visual Code Studio INSTALLED!"

new_job
log_info "Installing Microsoft Teams..."
install_deb_file "https://teams.microsoft.com/downloads/desktopurl?env=production&plat=linux&arch=x64&download=true&linuxArchiveType=deb"
log_info "Microsoft Teams INSTALLED!"

new_job
log_info "Installing Intellij IDEA..."
sudo snap install intellij-idea-ultimate --classic
log_info "Intellij IDEA INSTALLED!"

new_job
log_info "Installing Docker and Docker Compose..."
source ./installers/docker.sh
log_info "Docker and Docker Compose INSTALLED!"
log_warn "Please don't forget to logout for docker non-root user work!"

new_job
log_info "Installing Discord..."
install_deb_file "https://discord.com/api/download?platform=linux&format=deb"
log_info "Discord INSTALLED!"

new_job
log_info "Installing Steam..."
install_deb_file "https://steamcdn-a.akamaihd.net/client/installer/steam.deb"
log_info "Steam INSTALLED!"

new_job
log_info "Installing Lutris..."
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update
sudo apt install lutris
log_info "Lutris INSTALLED!"

stop_spinner $?
