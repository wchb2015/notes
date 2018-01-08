### Nginx

#### Nginx优点.
- IO多路复用epoll.
 1. IO多路复用:多个描述符的IO操作都能在一个线程内并发交替地顺序完成,这就叫IO多路复用,这里的'复用'指的是复用同一个线程.
 2. IO多路复用的实现方式:select,poll,epoll. 
 3. epoll模型: 1)每当FD就绪,采用系统的回调函数之前将FD放入,效率更高. 2) 最大连接无限制.

- 轻量级
  1. 功能模块少
  2. 代码模块化
  
- CPU亲和(affinity)
  1. 是一种把CPU核心和Nginx工作进程绑定的方式,把每个worker进程固定在一个CPU上执行,减少切换CPU的cache miss,获得更好的性能. 
 
- Sendfile工作机制

#### Install(Centos).

1. http://nginx.org/en/linux_packages.html#stable
2. 配置nginx.repo及安装前置软件.
	
	```
	yum -y install gcc gcc-c++ autoconf pcre pcre-devel make automake
	yum -y install wget http-tools vim	
	cd /etc/yum.repos.d
	vim nginx.repo	
		
	yum list |grep nginx
	yum -y install nginx
	nginx -v
	nginx -V
	```
	复制下面的内容
		
	```
	[nginx]
	name=nginx repo
	baseurl=http://nginx.org/packages/centos/7/$basearch/
	gpgcheck=0
	enabled=1
	```
	
3. 重启Nginx.
	
	```
	systemctl restart nginx.service
	systemctl reload nginx.service  #不关闭服务.
	```
	
4. 其它
	
	```
	rpm -ql nginx   #查看Nginx的安装目录
		
	curl -v www.imooc.com >/dev/null
	nginx -tc /etc/nginx/nginx.conf  #-t检查配置文件,-c指定配置文件路径.
	nginx -s reload -c /etc/nginx/nginx.conf
	ps -aux |grep nginx
   ```
   
#### 配置文件

| 序号 | 路径 | 类型 | 作用 | 备注 |
| :-----: |:-------:| :-----:| :-----:|:-----:|
| 1 | /etc/logrotate.d/nginx | 配置文件  | Nginx日志轮转,用于logrotate服务的日志切割 |    |
| 2 | /etc/nginx| 目录 | 主配置文件|   |
| 3 | /etc/nginx/nginx.conf | 配置文件 | 主配置文件| |
| 4 | /etc/nginx/conf.d | 目录 |主配置文件 | |
| 5 | /etc/nginx/conf.d/default.conf | 配置文件 | 主配置文件| |
| 6 | /etc/nginx/fastcgi_params <br> /etc/nginx/uwsgi_params <br> /etc/nginx/scgi_params | 配置文件 | cgi 配置相关,fastcgi配置| |
| 7 | /etc/nginx/mime.types | 配置文件 | 设置http协议的Content-Type与扩展名对应关系 | |
| 8 | /usr/lib64/nginx/modules <br> /etc/nginx/modules | 目录 | Nginx模块目录 | |
| 9 | /var/cache/nginx | 目录 | Nginx缓存 | |
| 10 | /var/log/nginx | 目录 | 日志目录 | |  

1. [Nginx官方文档](https//nginx.org/en/docs/)   


#### 默认模块
1. stub_status,显示连接数等统计信息.

	```
	location /mystatus {
	       stub_status;
	}
	 
	Active connections: 2 
    server accepts handled requests
    7 7 21 
    Reading: 0 Writing: 1 Waiting: 1     
	```