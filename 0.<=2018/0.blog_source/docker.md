#### Docker3大核心概念.

- Image:镜像,可以理解为一个只读的模板.
- Container:容器,进程,镜像的运行实例.
- Respository:仓库.注意Registry区分开,Registry(仓库注册服务器,仓库地址)是存储仓库的地方.


#### Image

```
docker pull ubuntu:14.04  等价于下面
docker pull registry.hub.docker.com/ubuntu:14.04
#从从默认的Registry(Docker Hub Registry)中的Ubuntu仓库来下载标记为14.04的镜像.
```

> 推镜像到docker hub

```
docker tag  alpine:latest wchb2017/my_alpine:v20171125
docker push wchb2017/my_alpine:v20171125
```

1. 创建镜像的3种方式
 - 基于已有容器的镜像创建(docker commit)
 - 基于本地模板导入(docker import)
 - 基于Dockerfile创建(推荐)

#### 基本命令

```
docker version                                              #查看并判断docker是否正确安装
docker run ubuntu echo hello docker                         # 用Ubuntu的镜像输出hello docker
docker run  -p 8089:80 -d    nginx
docker run  -d -p 8089:80  127e   #127e image id

docker cp index.html 6b333522f250://usr/share/nginx/html    #6b333522f250 是CONTAINER ID
docker commit -m 'wchb hello docker' 6b333522f250 nginx-fun #6b333522f250 是CONTAINER ID 产生一个新的image
docker rm  + container id
docker rmi + image id
	
docker ps -a
docker cp     #在host 和container之间拷贝文件
docker commit #保存改动为新的image
	
docker build -t hello_docer_t .
	
docker system df
docker images -a   #带显示中层镜像
docker images -q   $只显示image ID
docker rmi $(docker images -q)
docker image ls
docker rm $(docker ps -aq)
	
docker run --name mywebserver -p 9000:80 nginx
	
docker diff f2bb # f2bb containerId
docker history nginx       #Show the history of an image
	
	
docker start  CONTAINER #将一个已经终止的容器启动运行
docker logs  CONTAINER #获取容器的输出信息
	
docker exec --help

docker port CONTAINER
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
	RUN sed -i 's/archive.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y nginx
	COPY index.html /var/www/html
	ENTRYPOINT ["/usr/sbin/nginx","-g","daemon off;"]
	EXPOSE 80
	```

#### Dockerfile语法

![alt](https://images.wchb7.com/20171126/2yh1KM87hh1ANp9MC0yvEiAu.jpg)

1. Dockerfile一般分4个部分.
  - 基础镜像信息
  - 维护者信息
  - 镜像操作命令
  - 容器启动时执行命令


| 命令 | 用途 | 备注 |
| :-----: |:-------:| :-----:|
| FROM | base image | |
| RUN |执行命令 |  |
| ADD | 添加文件 |  |
| COPY     | 拷贝文件 |  |
| CMD     | 执行命令 | 指定默认的容器主进程的启动命令 |
| EXPOSE      | 暴露端口 | 声明运行时容器提供服务的端口,仅仅声明容器打算使用什么端口,并不会再宿主进行端口映射|
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
                "dockeriver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }
        ]

将宿主机内的Source这个路径挂载到了容器内的Destination路径
```

Mac

```
screen ~/Library/Containers/com.docker.docker/Data/com.docker.dockeriver.amd64-linux/tty
docker exec -it nginx /bin/bash

docker run -p 8090:80 -d -v $PWD/html:/usr/share/nginx/html nginx
```


#### Registry

```
docker search whalesay
docker pull docker/whalesay
```


#### Compose

```
docker-compose --version
docker-compose up -d
docker-compose stop
docker-compose rm
docker-compose build
```

#### docker-compose.yml 常用命令

![alt](http://images.wchb7.com/20171127/RBkr11ACXs98S0tN3b0AMI0K.jpg)

| 命令 | 用途 | 备注 |
| :-----: |:-------:| :-----:|
| build | 本地创建镜像 | |
| command | 覆盖缺省命令 |  |
| depends_on | 连接容器 |  |
| ports     | 暴露端口 |  |
| volumes     | 卷 |  |
| image     | pull镜像 |  |

#### docker-compose命令

| 命令 | 用途 | 备注 |
| :-----: |:-------:| :-----:|
| up | 启动服务 | |
| stop | 停止服务 |  |
| rm | 删除服务中的各个容器 |  |
| logs     | View output from containers |  |
| ps     | 列出服务相关的容器 |  |

#### build image

```
docker build -t myghost:v1 .

Sending build context to Docker daemon  3.584kB
Step 1/4 : FROM ghost
latest: Pulling from library/ghost
Digest: sha256:543a9704d2afee4d20d487c22ce2ef3556a887f08bfd532c5d9a7e2896755b9c
Status: Downloaded newer image for ghost:latest
 ---> a863ff4d5918
Step 2/4 : COPY ./config.js /var/lib/ghost/config.js
 ---> 4e94e1466166
Step 3/4 : EXPOSE 2368
 ---> Running in 1750d82ebf8a
 ---> f6e429dfdafc
Removing intermediate container 1750d82ebf8a
Step 4/4 : CMD npm start --production
 ---> Running in 68ed5807b61e
 ---> 30806fea4568
Removing intermediate container 68ed5807b61e
Successfully built 30806fea4568
Successfully tagged myghost:v1
```

#### Docker Mysql

```
docker run --name some-mysql -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mysql:tag

docker run -it --rm mysql:tag --verbose --help

```

#### Docker数据管理

1. docker在容器内做的改动都是暂时的.
2. 容器管理数据主要两种方式.
 - Data Volumes(数据卷):容器内数据直接映射到本地主机环境.
 - Data Volume Containers(数据卷容器):使用特定容器维护数据卷.

3. Data Volumes

```
#在容器内创建一个数据卷
docker run -d -P --name web7 -v /d_data  training/webapp python app.py

#挂载一个主机目录作为数据卷
docker run -d -P --name web -v /Users/wchb/Music/test/d_data:/opt/webapp training/webapp python app.py
```
