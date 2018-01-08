######################################
# File Name: man.sh
# Author: wchb
# Email: wchb20155@gmail.com
# Create Time: 2016年01月02日 星期六 18时24分23秒
######################################
#!/bin/bash

resettem=$(tput sgr0)
#定义个一个关联数组，key:文件号码；value：被执行的文件的名字
declare -A ssharray
i=0
#把每个文件号码存入numbers中，供用户选择用
numbers=""

#`...`,里面放入指令
#-I, --ignore=PATTERN  do not list implied entries matching shell PATTERN
for script_file in `ls -I "man.sh" ./`
do
    echo -e '\e[1;35m' "The Script:" ${i} '==>' ${resettem} ${script_file}
    ssharray[$i]=${script_file}
#echo ${ssharray[$i]}
    numbers="${numbers} | ${i}"
    i=$((i+1))
done

while true
do
    read -p "Please input a number [ ${numbers} ]: " execshell
    #echo ${execshell}
    #双括号因为用到了shell的模式匹配
    if [[ ! ${execshell} =~ ^[0-9]+ ]];then
       exit 0
    fi
    echo ${ssharray[$execshell]}
    #/bin/sh ./${shharray[$execshell]}
    ./${shharray[$execshell]}
done
