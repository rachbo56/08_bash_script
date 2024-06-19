#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi
FILE1=$1

FILESIZE=$(wc -c < $FILE1)
# echo $FILESIZE
if [ $FILESIZE -ge 5120 ]; then
    echo "[   OK   ] $FILE1($FILESIZE) is a big file."
else
    echo "[   OK   ] $FILE1($FILESIZE) is a small file."
fi


