#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <CMD>"
    exit 1
fi

CMD="$*"
# 인자 전체라는 뜻

NET=192.168.10
#SERVERLIST="$NET.200 $NET.201 $NET.202"

#for i in $SERVERLIST
for i in $(seq 200 202)
do
    ping -c 1 -W 1.5 $NET.$i >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "----- [  OK  ] $NET.$i -----"
        ssh "$NET.$i" "$CMD"
        echo
    else
        echo "----- [ FAIL ] $NET.$i -----"
        echo
    fi
done

