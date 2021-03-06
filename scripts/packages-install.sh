##################################################
# This script is intented to give basics packages 
# install to Archlinux
#
# author: Maxime Lardeur
# date: 2020-01-20
##################################################

# Update package list
yay -Sy

#######################
### System packages ###
#######################
# power saving for laptop
yay -S tlp thermald

# firmware update
yay -S fwupd

############################
### Terminal Application ###
############################
# terminal
yay -S rxvt-unicode 
# neofetch
yay -S neofetch gotop nvtop
# Cli file manager
yay -S ranger

#########################
### GUI Applications ####
#########################
# Gui file manager
yay -S pcmanfm

# install firefox chromium
yay -S firefox
# Gui text editor visual studio code
yay -S code

### Install Steam ###
# uncomment multilib in /etc/pacman.conf
nano /etc/pacman.conf
# install steam package
yay -S steam

### Install Jetbrain Toolbox ###
# install JDK11
yay -S jdk11-openjdk
# install jetbrain toolbox
yay -S jetbrains-toolbox


