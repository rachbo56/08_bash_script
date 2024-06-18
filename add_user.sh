#!/bin/bash

USERLIST=/root/script/user.list

cat $USERLIST | while read UNAME UPASS
do
    # echo "$UNAME $UPASS"
    useradd $UNAME > /dev/null 2>&1
    [ $? -eq 0 ] && echo "[  OK  ] $UNAME has been added."
    echo $UPASS | passwd --stdin $UNAME > /dev/null 2>&1
    [ $? -eq 0 ] && echo "[  OK  ] $UNAME's password has been changed."
done

