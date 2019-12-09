```
stat
Zookeeper version: 3.4.11-37e277162d567b55a07d1755f0b31c32e93c01a0, built on 11/01/2017 18:06 GMT
Clients:
 /127.0.0.1:53124[0](queued=0,recved=1,sent=0)

Latency min/avg/max: 0/0/0
Received: 3
Sent: 2
Connections: 1
Outstanding: 0
Zxid: 0x0
Mode: follower
Node count: 4
```

```
./zkCli.sh -server ip:port

create [-s] [-e]  path data acl # -s,-e分别指定节点特性:顺序或临时节点.默认情况即不加-s,-e创建的是持久节点.

ls  path [watch]   #列出zookeeper指定节点下的所有子节点,只能看到指定节点下第一级的所有子节点.
get path [watch]   #获取zk指定节点的数据内容和属性信息.
set path data [version] # 更新指定节点的数据内容,在zk中,节点的数据是有版本概念的,version用户指定本次更新操作时基于ZNode的哪一个数据版本进行的.
delete path [version] #删除zk上的指定节点,version作用同set命令. 注意:要像删除某一个指定节点,该节点必须没有子节点存在.
```

```
[zk: 127.0.0.1:2181(CONNECTED) 3] get /zk-book
123
cZxid = 0x10000000a
ctime = Wed Nov 29 22:40:44 CST 2017
mZxid = 0x10000000a
mtime = Wed Nov 29 22:40:44 CST 2017
pZxid = 0x10000000a
cversion = 0
dataVersion = 0
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 3
numChildren = 0
```

```
[zk: arch-zk-1.alta.elenet.me:2181(CONNECTED) 6] addauth digest userName:password
```