1.**win7系统盘应该20G**,ubuntu /home分区大小应该考虑到virtualbox的win7会占用60个G.注意:**剩余的空间给/home而不是/!**  

http://blog.csdn.net/skykingf/article/details/45267517#t0   安装Ubuntu 15.10后要做的事  

http://blog.csdn.net/henren555/article/details/43406479  idea  

2.vim配置  
  vim 打开文件显示行号: vim  /etc/vim/vimrc 文件最后添加 set  nu 即可.  
  set autoindent	#开启自动缩进  

3.
   1. sudo apt-get install lrzsz  
   2. sudo apt-get install tree  
   3. sudo apt-get install sysv-rc-conf 安装完成后,直接运行sudo sysv-rc-conf命令即可打开该管理软件  
   4. sudo apt-get install memcached  
   5. sudo apt-get install nethogs  sudo nethogs enp3s0  
   6. sudo apt-get install openssh-server  /etc/init.d/ssh start  
   7. sudo apt-get install vim  (如果失败执行sudo apt-get remove vim-common)  
   8. 安装chrome(注意先执行1)sudo apt-get install libappindicator1 libindicator7  sudo dpkg -i google-chrome-stable_current_amd64.deb  
   9. sudo apt-get install git  

4.搜狗拼音  http://blog.csdn.net/david_xtd/article/details/27107009  http://www.cnblogs.com/youxia/p/linux009.html  
   http://blog.chinaunix.net/uid-10498763-id-3840176.html  

5.sudo passwd root  激活root用户  

6.sudo vim /etc/sudoers  
   添加    Defaults env_reset , timestamp_timeout=30   #30就是代表时间，你可以设置为 10 或 30 ，表示10分钟或半小时。  
    **vim ~/.bashrc    alias grep='grep -n  --color=auto'**  

7.zookeeper       wget http://mirror.bit.edu.cn/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz  
    activemq:         sudo  -E  /usr/java/activemq5.12.1/bin/activemq start  && sudo -E   /usr/java/zookeeper-3.4.6/bin/zkServer.sh start  
    memcached:    ps -ef|grep memcached  
    zookeeper:       sudo -E   /usr/java/zookeeper-3.4.6/bin/zkServer.sh start  	

8.tomcat  
```
         1)<Server port="8005" shutdown="SHUTDOWN"> 
         2)<Connector port="8080" maxHttpHeaderSize="8192"
          maxThreads="150" minSpareThreads="25" maxSpareThreads="75"
          enableLookups="false" redirectPort="8443" acceptCount="100"
          connectionTimeout="20000" disableUploadTimeout="true" /> 
          3)<Connector port="8009" enableLookups="false" redirectPort="8443" protocol="AJP/1.3" />
```
9.sqldeveloper  
    https://community.oracle.com/docs/DOC-888316   
    sudo alien -k --scripts sqldeveloper-4.1.1.19.59-1.noarch.rpm  
    sudo dpkg -i sqldeveloper_4.1.1.19.59-1_all.deb  
    sudo vim /opt/sqldeveloper/sqldeveloper/bin/sqldeveloper.conf  
    SetJavaHome /usr/java/jdk1.8  

10.字体:http://my.oschina.net/itblog/blog/278566  

11.http://jingyan.baidu.com/article/375c8e19be924725f2a22983.html  扩展包安装 win7  50个G.  

**vim /etc/profile**
```
export JAVA_HOME=/usr/java/jdk1.7  
export JRE_HOME=${JAVA_HOME}/jre  
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib  
export MAVEN_HOME=/usr/java/maven
export PATH=$MAVEN_HOME/bin:$JAVA_HOME/bin/:$PATH
```
**vim /etc/vim/vimrc**
```shell
set nu 
#set autoindent

autocmd BufNewFile *.py,*.sh, exec ":call SetTitle()"
let $author_name  = "wchb"
let $author_email = "wchb20155@gmail.com"

func SetTitle()
  if &filetype == 'sh'
  call setline(1,"\######################################")
  call append(line("."),"\# File Name: ".expand("%"))
  call append(line(".")+1,"\# Author: ".$author_name)
  call append(line(".")+2,"\# Email: ".$author_email)
  call append(line(".")+3,"\# Create Time: ".strftime("%c"))
  call append(line(".")+4,"\######################################")
  call append(line(".")+5,"\#!/bin/bash")
  call append(line(".")+6,"")
  else
  call setline(1,"\######################################")
  call append(line("."),"\# coding=utf-8")
  call append(line(".")+1,"\# File Name: ".expand("%"))
  call append(line(".")+2,"\# Author: ".$author_name)
  call append(line(".")+3,"\# Email: ".$author_email)
  call append(line(".")+4,"\# Create Time: ".strftime("%c"))
  call append(line(".")+5,"\######################################")
  call append(line(".")+6,"\#!/usr/bin/env python")
  call append(line(".")+7,"")
  endif
  autocmd BufNewFile * normal G
endfunc
```
12.Ubuntu安装完成以后,先**update**再安装软件.
```shell
sudo apt update
apt list --upgradable
sudo apt upgrade
```