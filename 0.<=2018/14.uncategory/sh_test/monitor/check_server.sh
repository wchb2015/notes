######################################
# File Name: check_server.sh
# Author: wchb
# Email: wchb20155@gmail.com
# Create Time: 2016年01月25日 星期一 08时29分47秒
######################################
#!/bin/bash

Resettem=$(tput sgr0)
NginxServer='http://192.168.0.101'

Check_Nginx_Server()
{
  status_code=$(curl -m 5 -s -w %{http_code} ${NginxServer}  -o /dev/null)

  if [ $status_code -eq 000 -o $status_code -ge 500 ];then
    echo -e '\E[32m' "Check Http Server Error!Response status code is " $Resettem $status_code
  else
    http_content=$(curl -s ${NginxServer})
    echo -e '\E[32m' "Check Http Server OK! \n" $Resettem $http_content
  fi
}

Check_Nginx_Server
#curl -m 最大传输时间;-s 静音模式,不做额外输出;-w ${http_code} 显示返回状态码;
#curl -m 5 -s -w %{http_code} http://192.168.0.101
#curl -m 5 -s -w %{http_code} http://192.168.0.101 -o /dev/null
