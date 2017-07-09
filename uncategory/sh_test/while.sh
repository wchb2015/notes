#!/bin/bash
#从1加到100


i=1
s=0

while [ $i -le 100 ]
#如果变量i的值小于100就执行循环
do
    s=$(( $s+$i ))
    i=$(( $i+1  ))
done

echo "The sum is :$s"
