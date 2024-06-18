#!/bin/bash

echo -n "Enter value A: "
read A

echo -n "Enter value B: "
read B

cat << EOF
==============================================
 (1). +    (2). -    (3). *    (4). /
==============================================
EOF

echo -n "Which operator will you choose? : "
read OP

case $OP in 
    1) echo "$A + $B = $(expr $A + $B )" ;;
    2) echo "$A - $B = $(expr $A - $B )" ;;
    3) echo "$A X $B = $(expr $A \* $B)" ;;
    4) echo "$A / $B = $(expr $A / $B)" ;;
    *) echo "[ FAIL ] Operation failed."
        exit 1 ;;
esac
echo


