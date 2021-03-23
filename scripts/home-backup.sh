sudo rsync -aAXHP --delete \
  --info=progress2 \
  -e "ssh -i /home/maxime/.ssh/id_rsa" \
  --exclude={"/home/*/.thumbnails/*","/home/*/.cache/mozilla/*","/home/*/.cache/spotify/*","/home/*/.cache/chromium/*","/home/*/.local/share/Trash/*"} \
  /home/ root@192.168.1.4:/mnt/media/backup/home/
