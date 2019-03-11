#!/bin/bash

#df -h |grep sda3 |awk '{print $5}' |cut -d "%" -f 1

test=$(df -h |grep sda3 |awk '{print $5}' |cut -d "%" -f 1 )
#echo $test

if [ "$test" -ge "10" ]
 then
     echo "/ if full!"
fi
