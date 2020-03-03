pacman -Sy

# install some usefull package / apps
pacman -S rxvt-unicode 

pacman -S firefox

#################
# Install Steam #
#################
# uncomment multilib in /etc/pacman.conf
nano /etc/pacman.conf
# install steam package
pacman -S steam


############################
# Install Jetbrain Toolbox #
############################
# install JDK11
pacman -S jdk11-openjdk

# install jetbrain toolbox
yay -S jetbrains-toolbox


