pacman -Qqen > scripts/pkglist.txt
pacman -Qqem > scripts/pkglist_aur.txt
sudo rsync -aAXHP --delete \
  --info=progress2 \
  -e "ssh -i /home/maxime/.ssh/id_rsa" \
  --exclude={"/home","/dev/*","/proc/*","/data","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} \
  / root@192.168.1.4:/mnt/media/backup/root/
