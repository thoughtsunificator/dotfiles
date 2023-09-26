#!/bin/bash
sudo -u romain DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "Backup started"
echo "backup started at `date`"
sudo rsync -aAXv --delete --exclude=/backup/* --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/run/* --exclude=/mnt/* --exclude=/media/* --exclude="swapfile" --exclude="lost+found" --exclude=".cache" --exclude=".npm" --exclude="/home/romain/Videos/*" --exclude="/home/romain/Downloads/*" --exclude="/var/cache/*" --exclude="/var/tmp/*" --exclude="/tmp/*" --exclude=".ecryptfs" --exclude="/home/romain/Games" --exclude "/home/romain/.local/share/Steam" --exclude "/home/romain/.local/share/Trash" --exclude "/home/romain/.wine" --max-size=1G / /backup/rsync>>/home/romain/backup.log
sudo -u romain DISPLAY=:0 DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus notify-send "Backup finished"
echo "backup finished at `date`">>/home/romain/backup.log
