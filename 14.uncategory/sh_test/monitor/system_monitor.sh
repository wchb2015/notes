#!/bin/bash
clear
if [[ $# -eq 0  ]]
then
#Define Variable reset_terminal
reset_terminal=$(tput sgr0)

# Check OS Type
os=$(uname -o)
echo -e '\E[31m' "Operating System Type :" $reset_terminal  $os

# Check OS Release Version and Name
os_name=$(cat /etc/issue)
echo -e '\E[31m' "Check OS Release Version " $reset_terminal $os_name

# Check Architecture
architecture=$(uname -m)
echo -e '\E[31m' "Check Architecture"      $reset_terminal  $architecture

# Check Kernel Release
ker_rel=$(uname -r)
echo -e '\E[31m' "Check Kernel Release"    $reset_terminal  $ker_rel

# Check hostname  $HOSTNAME

# Check Internal IP
internalIP=$(hostname -I)
echo -e '\E[31m' "Check Internal IP"	   $reset_terminal  $internalIP

# Check External IP
externalIP=$(curl -s http://ipecho.net/plain)
echo -e '\E[31m' "Check External IP"       $reset_terminal  $externalIP

# Check DNS
nameservers=$(cat /etc/resolv.conf |grep -E "\<nameserver[ ]+"|awk '{print $NF}')
echo -e '\E[31m' "Check DNS"		   $reset_terminal  $nameservers

# Check if connected to Internet or not
echo -e '\E[31m'        ping -c 2 www.baidu.com &>/dev/null && echo "Internet:Connected" || echo "Internet:Disconnected"

# Check Logged In Users
	who>/tmp/who
echo -e '\E[31m' "Logged In Users" $reset_terminal && cat /tmp/who
        rm -f /tmp/who

#################################################
sys_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}END{print (total-free)/1024}' /proc/meminfo)
apps_mem_usages=$(awk '/MemTotal/{total=$2}/MemFree/{free=$2}/^Cached/{cached=$2}/Buffers/{buffers=$2}END{print (total-free-cached-buffers)/1024}'  /proc/meminfo)
load_avg=$(top -n 1 -b |grep "load average" |awk '{print $11 $12 $13}')
disk_avg=$(df -hP|grep -vE "文件系统|tmpfs|udev|cgmfs"|awk '{print $1 " " $5 " " $6}')
echo -e '\E[31m' "System memuserages :" $reset_terminal $sys_mem_usages
echo -e '\E[31m' "Apps   memuserages :" $reset_terminal $apps_mem_usages
echo -e '\E[31m' "Load   Average     :" $reset_terminal $load_avg
echo -e '\E[31m' "Disk   Average     :" $reset_terminal $disk_avg

fi


