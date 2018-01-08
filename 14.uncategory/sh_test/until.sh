#!/bin/bash
#从1加到100

i=1
s=0

until [ $i -gt 100 ]
#循环直到变量i的值大于100，就停止循环
do
      s=$(($s + $i))
      i=$(($i + 1))
done

echo "The sum is : $s"
