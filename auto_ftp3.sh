#!/bin/bash

WINIP=172.16.6.2
ftp -n "$WINIP" 21 << EOF
user user01 user01
cd test
lcd /test
bin
hash
prompt
mput linux200.txt
quit
EOF



