#!/bin/bash

cat << EOF > file1
user01 pass1
user02 pass2
user03 pass3
EOF

:<<EOF
for i in $(cat file1)
do
    echo "$i"
done
EOF

echo " -----"


cat file1 | while read USER1 PASS1
do
#    echo "$USER1"
    echo "$USER1:$PASS1"
done 


# 차이점은 만약 file1에 user01 pass1 이렇게 되어있으면 달라짐
# for구문은 한 줄을 읽어들이면
# for i in user01, pass1이 갂각 하나의 변수로 읽힘.

# while은 user01 pass1이 하나의 변수에 전부 들어감. 
# while은 쪼개서 받을 수도 있음
