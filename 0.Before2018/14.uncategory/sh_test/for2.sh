#!/bin/bash
#从1加到100

s=0
for ((i=1;i<=100;i=i+1))
    do
       s=$(($s+$i))
    done
echo "The sum of 1+2+.....+100 is:$s"
