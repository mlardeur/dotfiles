##################################################
# This script is intented to give basics 
# when install graphics environment to Archlinux
#
# author: Maxime Lardeur
# date: 2020-01-20
##################################################

#######################
# Install Xorg server #
#######################
pacman -S xorg-server xorg-apps xorg-xinit
# find hardware video card
lspci | grep -e VGA -e 3D
# find and install drivers
pacman -Ss xf86-video
# install some font
pacman -S ttf-dejavu ttf-liberation

#############################
# Install a Display Manager #
# lightdm                   #
#############################
yay -S lightdm lightdm-slick-greater lightdm-settings 
# enable 
systemctl enable lightdm.service

#######################################
# 1- Install LXQt Desktop Environment #
#######################################
pacman -S lxqt
# install icon theme
pacman -S papirus-icons-theme
# install font roboto
pacman -S community/ttf-roboto

#################################
# 2- Install I3 Windows Manager #
#################################
pacman -S i3-wm i3blocks i3lock i3status dmenu

# install some usefull package / apps
pacman -S rxvt-unicode archey

