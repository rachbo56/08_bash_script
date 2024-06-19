#!/bin/bash

echo -n 'Enter Your Filename : '
read FILE1
# since it is a declaration, no dollar sign is required
# echo $FILE1

if [ -f $FILE1 ]; then
    echo "[   OK   ] $FILE1 is a regular file."
elif [ -d $FILE1 ]; then
    echo "[   OK   ] $FILE1 is a directory file."
else
    echo "[   WARNING   ] $FILE1 is different type of files."
fi

