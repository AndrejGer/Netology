#!/bin/bash

sours="/home/xyden"
dest="/tmp/backup"

rsync -a --delete "$sours" "$dest" --log-file /var/log/backup.log

if [ $? -eq 0 ]; then
    echo "[$(date)] Резервное копирование выполнено успешно" >> /var/log/backup.log
else
    echo "[$(date)] В резервном копировании произошла ошибка" >> /var/log/backup.log
fi
