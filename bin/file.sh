#!/bin/bash

for NAME in $(cat /etc/vsfptd/ftpusers | egrep -v '^$|^#')
do
    echo "$NAME"
done


