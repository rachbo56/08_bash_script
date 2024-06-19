#!/bin/bash
#/test/*.txt -> /test/*.els

if [ $# -ne 3 ]; then
    echo "Usage: $0 <directory> <ext1> <ext2>"
    exit 1
# else
#     if [ -d $1 ]; then
#         BASEDIR=$1
#     else
#         exit 2
#     fi
fi
 [ -d "$1" ] && BASEDIR=$1 || exit 2 
# $1 (입력값)이 directory 일 때만 실행하고 아니면 강제종료
TMP1=/tmp/tmp1
SRC_EXT=$2
DST_EXT=$3

ls -1 $BASEDIR | grep ".${SRT_EXT}$" > $TMP1
for i in $(cat $TMP1)
do

    SRC=$BASEDIR/$i
    DST=$(echo "$BASEDIR/$i" | sed "s/.${SRT_EXT}$/.${DST_EXT}/")
    mv $SRC $DST
done



