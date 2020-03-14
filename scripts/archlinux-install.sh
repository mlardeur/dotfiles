##################################################
# This script is intented to give basics 
# when install Archlinux
#
# author: Maxime Lardeur
# date: 2020-01-20
##################################################

########################
# Global system setup  #
########################

# update package database
pacman -Sy

# show network config
#ip address show
#ping archlinux.org
#ip link

# check sysclock to let pacman install some packages
timedatectl

##########################
# Update Mirror List     #
##########################
# install pacman-contrib
pacman -S pacman-contrib

# backup all mirror
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

# get the 6 first fastest
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

#######################################################
# OPTION 1: Guided install with archfi.sf.net/archfi  #
#######################################################
wget archfi.sf.net/archfi
chmod 755 archfi
./archfi

#############################
# OPTION 2: Manual install  #
#############################

##########################
# Partition disk section #
##########################

# check disk are recognized
lsblk

# partition disk fdisk or parted
parted /dev/sdX

# OPTIONNAL create a new disk label (MBR or GPT partition table) if not exists
mklabel gpt

# OPTIONNAL create EFI partition
mkpart primary fat32 1MiB 261MiB
set 1 esp on

# create root partition
mkpart primary ext4 261MiB 100%

# format the partitions
mkfs.ext4 /dev/sdxx
mkfs.vfat -F32 /dev/sdxx
mkswap /dev/sdxx

# mount needed partitions
mount /dev/sda2 /mnt
mkdir -p /mnt/efi && mount -t vfat /dev/sda1 /mnt/efi
mkdir /mnt/home && mount /dev/sda3 /mnt/home

#############################
# Base package installation #
#############################
pacstrap /mnt base base-devel linux linux-firmware

########################
# Configure the system #
########################
# generate fstab file
genfstab -U /mnt >> /mnt/etc/fstab

# change root
arch-chroot /mnt

# install nano
pacman -S nano

# set network
echo maxime-dell > /etc/hostname
echo '127.0.1.1 maxime-dell.localdomain maxime-dell' >> /etc/hosts

# set timezone
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

# generate localization - un uncomment then gen - set default 
nano /etc/locale.gen
locale-gen
echo LANG="fr_FR.UTF-8" > /etc/locale.conf
# set keyboard layout
echo KEYMAP=us > /etc/vconsole.conf

# create RAMdisks
mkinitcpio -p linux

# set root password
passwd

############################
# Install some usefull packages #
############################
#pacman -S netctl dhclient wireless_tools 
pacman -S networkmanager network-manager-applet networkmanager-openvpn
systemctl enable NetworkManager
pacman -S htop parted sudo 
pacman -S man-db man-pages texinfo
pacman -S git go

#############################
# Install yay for AUR build #
#############################
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

###########################
# Install GRUB BootLoader #
###########################
# Install grub packages
pacman -S grub efibootmgr
# Install grub
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB --removable
# Generate grub files
grub-mkconfig -o /boot/grub/grub.cfg

##########
# Reboot #
##########
exit
reboot

###############
# create user #
###############
useradd -m maxime
passwd maxime
gpasswd -a maxime wheel
# uncomment wheel group to have sudo access
EDITOR=nano visudo


















