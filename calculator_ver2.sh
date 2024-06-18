#!/bin/bash

echo -n "Enter value A : "
read A

echo -n "Enter the Operator : "
read OP

echo -n "Enter value B : "
read B

case $OP in
    '+') echo $A + $B = $(expr $A + $B) ;;
    '-') echo $A - $B = $(expr $A - $B) ;;
    '*') echo $A * $B = $(expr $A \* $B) ;;
    '/') echo $A / $B = $(expr $A / $B) ;;
    *) echo "[ FAIL ] Operation failed."
        exit 1 ;;
esac
echo
