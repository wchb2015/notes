#!/bin/bash

read -p "please input your name:" -t 10   name

echo "Hello! " $name

read -p "please input your password:" -s passwd

#换行符
echo -e "\n"
echo $passwd

read -p "please input your sex[M/F]: " -n 1 sex
echo -e "\n"

echo $sex
