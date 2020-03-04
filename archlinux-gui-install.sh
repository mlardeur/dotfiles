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
# install icon theme
pacman -S papirus-icons-theme
# install font roboto
pacman -S community/ttf-roboto
# install GTK theme
pacman -S materia-gtk-theme

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
# install Qt kvantum theme
pacman -S kvantum-qt5

#################################
# 2- Install I3 Windows Manager #
#################################
pacman -S i3-gaps 
pacman -S i3blocks 
#pacman -S i3lock i3status dmenu

# image background
pacman -S feh 
feh pictures/alena-aenami-solar.jpg 

# status bar
yay -S polybar
mkdir ~/.config/polybar
cp /usr/share/doc/polybar/config ~/.config/polybar/config

# Color theme generator
pacman -S python-pywal
wal -i pictures/alena-aenami-solar.jpg 
# persist generated palette
echo "wal -R" >> .xinitrc

# app launcher
pacman -S rofi
mkdir ~/.config/rofi
cp config/rofi/config.rasi ~/.config/rofi/config.rasi



