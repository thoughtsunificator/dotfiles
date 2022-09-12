#!/bin/bash
inotifywait -m -r -e create --format '%w%f' "$1" | while read NEWFILE
do
        echo  "File ${NEWFILE} has been created"
done
