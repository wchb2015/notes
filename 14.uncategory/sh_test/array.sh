######################################
# File Name: array.sh
# Author: wchb
# Email: wchb20155@gmail.com
# Create Time: 2016年01月03日 星期日 18时07分50秒
######################################
#!/bin/bash

array=(a b c d e)
for arr in ${array[@]}
do
echo $arr
done
