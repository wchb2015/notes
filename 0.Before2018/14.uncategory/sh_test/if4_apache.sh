#!/bin/bash
#$() 里面执行系统命令
test=$( ps -axu|grep httpd|grep -v grep )
if [ -n "$test" ]
   then echo "Apache if OK!"
   else
     echo "Apache has problems!"
     /etc/init.d/apache2 start
fi


