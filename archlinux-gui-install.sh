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
yay -S xorg-server xorg-apps xorg-xinit
# find hardware video card
lspci | grep -e VGA -e 3D
# find and install drivers
yay -Ss xf86-video
# install some font
yay -S ttf-dejavu ttf-liberation
# install icon theme
yay -S papirus-icons-theme
# install font
yay -S community/ttf-roboto ttf-hack
# install GTK theme
yay -S materia-gtk-theme

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
yay -S lxqt
# install Qt kvantum theme
yay -S kvantum-qt5

#################################
# 2- Install I3 Windows Manager #
#################################
yay -S i3-gaps 
yay -S i3blocks 
#yay -S i3lock i3status dmenu

# image background
yay -S feh 
feh pictures/alena-aenami-solar.jpg 

# status bar
yay -S ttf-font-awesome
yay -S polybar
mkdir ~/.config/polybar
cp /usr/share/doc/polybar/config ~/.config/polybar/config

# GTK theme GUI manager
yay -S lxappearance

# Color theme generator
yay -S python-pywal
wal -i pictures/alena-aenami-solar.jpg 
# persist generated palette
echo "wal -R &" >> .xprofile

# app launcher
yay -S rofi
mkdir ~/.config/rofi
cp config/rofi/config.rasi ~/.config/rofi/config.rasi



