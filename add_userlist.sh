#!/bin/bash
# to write user.list file
# user 1 - user100

USERLIST=/root/script/user.list
> $USERLIST

for i in $(seq 1 50)
do
    echo "user$i  user$i" >> $USERLIST
done
