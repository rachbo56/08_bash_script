#!/bin/bash

echo -n 'Enter Your Filename : '
read FILE1

# echo $FILE1 
if [ -x $FILE1 ] ; 
 then $FILE1
fi

