#!/bin/bash

#WORLD="world"
#cat << EOF
#    hello world 
#    hello $(WORLD)
#    1111 2222
#EOF

for i in $(seq 10)
do
    echo $i
done


i=1 
while [ $i -le 10 ]
do
    echo $i
    i=$(expr $i + 1 )    # $(( i += 1 ))
done
