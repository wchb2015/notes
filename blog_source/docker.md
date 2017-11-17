#### 基本命令(dr=docker)
	```
	dr run ubuntu echo hello docker                         # 用Ubuntu的镜像输出hello docker
	dr run  -p 8089:80 -d    nginx
	dr cp index.html 6b333522f250://usr/share/nginx/html    #6b333522f250 是CONTAINER ID
	docker在容器内做的改动都是暂时的.
	dr commit -m 'wchb hello docker' 6b333522f250 nginx-fun #6b333522f250 是CONTAINER ID 产生一个新的image
	dr rm  + container id
	dr rmi + image id
	
	dr ps -a
	dr cp     #在host 和container之间拷贝文件
	dr commit #保存改动为新的image
	
	dr build -t hello_docer_t .
	dr run -d -p 8089:80  127e   #127e image id
	```

#### Dockerfile Examples
1. File1:

	```
	FROM alpine:latest
	
	MAINTAINER wchb
	CMD echo 'hello docker'
	```

2. File2

	```
	FROM ubuntu
	MAINTAINER wchb
	RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
	RUN apt-get update
	RUN apt-get install -y nginx
	COPY index.html /var/www/html
	ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]
	EXPOSE 80
	```

#### Dockerfile语法
| 命令 | 用途 | 备注 |
| :-----: |:-------:| :-----:|
| FROM | base image | |
| RUN |执行命令 |  |
| ADD | 添加文件 |  |
| COPY     | 拷贝文件 |  |
| CMD     | 执行命令 | |
| EXPOSE      | 暴露端口 | |
| WORKDIR      | 指定路径 | |
| MAINTAINER     | 维护者| |
| ENV      | 设定环境变量 | |
| ENTRYPOINT      | 容器入口 | 如果没有指定ENTRYPOINT时用CMD启动,如果指定了ENTRYPOINT,CMD就变成了ENTRYPOINT的参数 |
| VOLUME      | mount point | |
| USER      | 指定用户 | |

#### Volume

```
docker run -p 8089:80  -d --name nginx -v /usr/share/nginx/html nginx
docker inspect nginx

"Mounts": [
            {
                "Type": "volume",
                "Name": "cccaee6e687f19d7966a030d59e1f283a8ceb47415cc0037f780476108cddaf9",
                "Source": "/var/lib/docker/volumes/cccaee6e687f19d7966a030d59e1f283a8ceb47415cc0037f780476108cddaf9/_data",
                "Destination": "/usr/share/nginx/html",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }
        ]

将宿主机内的Source这个路径挂载到了容器内的Destination路径        
```

Mac

```
screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty
docker exec -it nginx /bin/bash

dr run -p 8090:80 -d -v $PWD/html:/usr/share/nginx/html nginx
```


#### Registry

```
docker search whalesay
docker pull docker/whalesay
```