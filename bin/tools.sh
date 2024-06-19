#! /bin/bash

cat << EOF
    ################
    # 1) who
    # 2) date
    # 3) pwd
    ################
EOF
echo -n "Enter your choice? (1/2/3) : "
read CHOICE

# echo $CHOICE

case $CHOICE in
    1) who | boxes -d boy ;;
    2) date | boxes -d stone ;;
    3) pwd | boxes -d stone ;;
esac

