#### 2017-12-01
1. 在 logback 的世界中，日志信息不仅仅可以打印至 console，也可以打印至文件，甚至输出到网络流中，日志打印的目的地由 Appender 来决定，不同的 Appender 能将日志信息打印到不同的目的地去。


#### 2017-11-30
1. 饿了么主打本地生活平台，业务形态具有天然的地域性，一笔交易从下单到履单，都在同一个城市内完成，所以我们以地域为维度将流量和数据进行切分，使得任何一笔交易都完整的在一个机房内完成，从而保证交易数据的实时一致性。
2. 多活让一个机房在故障时，可以将流量切到另一个机房，这样提升了整体的可用性。饿了么机房切换可以在决定切换后10分钟内完成，时间主要用在等待机房间数据同步完成，流量分配策略的更新完成等.


#### 2017-11-15
1. 当网络由于发生异常情况,导致分布式系统中部分节点之间的网络延时不断增大,最终导致组成分布式系统的所有节点中,只有部分节点之间能够进行正常通信,而另一些节点则不能---我们将这个现象称为网络分区,就是俗称"脑裂".
2. 2PC(2阶段提交协议)解决了分布式事务的原子性问题,保证了分布式事务的多个参与者要么都执行成功,要么都执行失败.但2PC解决部分分布式事务问题的同时,依然存在一些难以解决的如同步阻塞,无限等待和脑裂等问题. 3PC在2PC的基础上,添加了PreCommit过程,从而避免了2PC中的无限等待问题.
3. Paxos算法引入了"过半"的理念,通俗讲就是少数服从多数,同时,执行分布式节点角色之间的轮换,这极大地避免了分布式单点的出现,因此Paxos算法即解决了无限等待问题,也解决了脑裂问题.

#### 2017-11-14
1. exFat格式,mac win通用,且支持大于4G的文件.


#### 2017-11-13
1. Java线程池中submit() 和 execute()方法有什么区别？两个方法都可以向线程池提交任务，execute()方法的返回类型是void，它定义在Executor接口中, 而submit()方法可以返回持有计算结果的Future对象，它定义在ExecutorService接口中，它扩展了Executor接口，其它线程池类像ThreadPoolExecutor和ScheduledThreadPoolExecutor都有这些方法。

#### 2017-11-10
1. 执行 apt update 后执行 sudo apt upgrade .
2. ubuntu dns 问题

```
systemd-resolve www.google.com
cat /etc/systemd/resolved.conf
DNSSEC=allow-downgrade

vim /etc/systemd/resolved.conf set
DNSSEC=off

https://askubuntu.com/questions/798644/unstable-wifi-with-intel-8260-808624f3-rev-3a-on-ubuntu-16-04-running-on-le/798697#798697
https://askubuntu.com/questions/762198/16-04-lts-wifi-connection-issues/768268#768268
https://grenangen.se/node/86
http://www.sunzhongwei.com/solve-dns-lookup-failure-frequently-in-ubuntu-1610
```


#### 2017-11-07
1. To comment out blocks in vim:
 
	```
	press Esc (to leave editing or other mode)
	hit ctrl+v (visual block mode)
	use the up/down arrow keys to select lines you want (it won't highlight everything - it's OK!)
	Shift+i (capital I)
	insert the text you want, i.e. '% '
	press Esc
	```
2. To uncomment blocks in vim:

	```
	press Esc (to leave editing or other mode)
	hit ctrl+v (visual block mode)
	use the up/down arrow keys to select the lines to uncomment.
	If you want to select multiple characters, use one or combine these methods:
	use the left/right arrow keys to select more text
	to select chunks of text use shift + left/right arrow key
	you can repeatedly push the delete keys below, like a regular delete button
	press d or x to delete characters, repeatedly if necessary
	press Esc
	```

#### 2017-11-06
1. 实例变量存储在堆中,局部变量存储在栈上.
2. wait,notify,notifyAll的调用必须在对象的synchronized块中.
3. 在实践中,对wait的使用一般是嵌在一个循环中,并且会判断相关的数据状态是否达到预期,如果没有则会继续等待,这么做主要是为了防止虚假唤醒.
4. CyclicBarrier和CountDownLatch都是用于多个线程间协调的.二者的一个很大的差别在于,CountDownLatch是在多个线程都进行了latch.countDown后才会触发事件,唤醒await在latch上的线程,而执行countDown的线程,执行完countDown后会继续自己线程的工作.
5. CyclicBarrier是一个栅栏,用于同步所有调用await方法的线程,并且等所有线程都到了await方法时,这些线程才一起返回继续各自的工作.此外,CountDownLatch和CyclicBarrier还有一个差别,那就是CountDownLatch不能循环使用,CyclicBarrier可以循环使用.


#### 2017-11-04
1. 通过getenforce 命令查看 SELinux 状态.
2. 通过 setenforce 0  关闭selinux.
3. MainLine Version 开发版.
4. Legacy Version 历史版本.

#### 2017-11-03
```
You should test your configuration at:
https://www.ssllabs.com/ssltest/analyze.html?d=wchb7.com
-------------------------------------------------------------------------------

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/wchb7.com/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/wchb7.com/privkey.pem
   Your cert will expire on 2018-02-01. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot again
   with the "certonly" option. To non-interactively renew *all* of
   your certificates, run "certbot renew"
 - Your account credentials have been saved in your Certbot
   configuration directory at /etc/letsencrypt. You should make a
   secure backup of this folder now. This configuration directory will
   also contain certificates and private keys obtained by Certbot so
   making regular backups of this folder is ideal.
 - If you like Certbot, please consider supporting our work by:

   Donating to ISRG / Let's Encrypt:   https://letsencrypt.org/donate
   Donating to EFF:                    https://eff.org/donate-le
```

#### 2017-11-01
- 普通队列:先进先出,后进后出.
- 优先队列:出队顺序和入队顺序无关;和优先级相关.

#### 2017-10-25
- 【强制】泛型通配符<? extends T>来接收返回的数据，此写法的泛型集合不能使用add方 法，而<? super T>不能使用get方法，做为接口调用赋值时易出错。 
- 说明:扩展说一下PECS(Producer Extends Consumer Super)原则:
- 第一、频繁往外读取内 容的，适合用<? extends T>。第二、经常往里插入的，适合用<? super T>。

#### 2017-10-21
```
线程池的线程数=N(CPU)*U(CPU)*(1+W/C)

N(CPU):CPU的核数
U(CPU):0~1,期望的CPU的使用率
W/C:等待时间与计算时间的比例
```

1. 编码的原因:
	-  在计算机中存储信息的最小单元是1个字节,即8个bit,所以能表示的字符范围是0-255个.
	-  人类要表示的符号太多,无法用1个字节来表示.
	-  要解决这个问题必须要有一个新的数据结构char,而从char到byte必须编码.

2. ASCII编码.共128个,用一个字节的低7位表示.

3.
  
```
@RequestMapping(value="/permission_group",method=RequestMethod.POST,consumes={"text/*","application/*"})
consumes:指定处理请求的提交内容类型(Content-Type),例如application/json,text/html;
produces:指定返回的内容类型,仅当request请求头中的(Accept)类型中包含该指定类型才返回;
```

#### RabbitMQ
 
- A direct exchange delivers messages to queues based on amessage routingkey.
- The routingkey is amessage attribute added into the message header by the producer.
- The routingkey can be  seen as an "address" that the exchange use to decide how to route the message.
- A message goes to the queue(s) whose bindingkey exactly matches the routing key of the message.
- DefaultExchange:这种是特殊的DirectExchange,是rabbitmq内部默认的一个交换机。该交换机的name是空字符串,所有queue都默认binding到该交换机上。
- 所有binding到该交换机上的queue，routing-key都和queue的name一样。

```
chrome://net-internals/#dns
```

1. 配置相关:

	```
	vim .bashrc
	alias jps='jps -mlvV'
	source .bashrc
	```

2. Mac快捷键整理:

	- 显示Finder:Option+command+空格;
	- Mac系统下浏览器的刷新快捷键command+R,强制刷新快捷键为command+shift+R.
	- ctrl+UP:command+tab(等效,切换应用).
	- Alt键代替Option键;Windows标志键代替Command键.
	- command+UiTerm2切换是否透明.
	- Home键=Fn+左方向
	-  End键=Fn+右方向
	-  PageUP=Fn+上方向
	-  PageDOWN=Fn+下方向
	-  向前Delete=Fn+delete键

3. IDEA快捷键整理:

	- 生成单元测试:shift+command+T.
	- BasicCompletion:control+;(DIY)
	- Structurepopup:Cmd+F12
	- SuperMethod:Cmd+U

4. Linux快捷键整理:

	- ctrl+shift+t打开一个新的终端标签.
	- firefox&#后台执行
	- ctrl alt f1 #到达第一个工作台ctrl alt f7#回到图形化工作台
	- Super+1：打开主文件夹
	- 在长段的命令中,使用Ctrl+←和Ctrl+→可快速将光标定位到命令中单词的首字母或末尾,实现在各单词之间的快速跳动定位.
	- 使用Ctrl+K快捷键可以将当前光标位置之后的所有部分快速清除,Ctrl+W可以清除当前光标位置之前的一个单词,而Ctrl+U则可以直接刚整行命令直接清除.

5. Ubuntu:

	- ctrl+;最近复制的内容
	- sudo apt-get install *** 之后,包的临时储存路径是/var/cache/apt/archives


#### Maven
```
<includeBaseDirectory></includeBaseDirectory>,设置为true的话,会把指定打包的内容外在嵌套一个文件夹.
<fileSets></fileSets>用来设置所要打包的文件夹
<appendAssemblyId></appendAssemblyId>来设置打出的包是否带有AssemblyId(也就是assembly.xml中设置的id)
三套生命周期:
mvn versions:set -DnewVersion=1.9.5.0-RELEASE
mvn clean deploy -Dmaven.test.skip=true

mvn dependency:tree打印整个依赖树
mvn dependency:resolve打印出已解决依赖的列表
mvn install -X想要查看完整的依赖踪迹,包含那些因为冲突或者其它原因而被拒绝引入的构件,打开Maven的调试标记运行
mvn
-D,--define<arg>Defineasystemproperty
-U,--update -snapshots Forces a check for missing releases and updated snapshots on remote repositories
```

- clean:pre-clean/clean/post-clean
- default:validate/initialize/generate-sources/process-sources/generate-resources/process-resources/compile/process-classes/generate-test-sources/process-test-sources/generate-test-resources/process-test-resources/test-compile/process-test-classes/test/prepare-package/package/pre-integration-test/integration-test/post-integration-test/verify/install/deploy
- site:pre-site/site/post-site/site-deploy

1.  列出这个plugin所有的goal
	- mvn help:describe-Dplugin=assembly
	- mvn help:describe-Dplugin=archetype-Ddetail
	- mvn assembly:help-Ddetail=true-Dgoal=single

2. To use the AssemblyPlugininMaven,you simply need to:
	- choose or write the assembly descriptor to use,
	- configure the AssemblyPlugininyourproject'spom.xml,and
	- run "mvnassembly:single" on your project.

#### DB

- DML:data manipulation language,SELECT,UPDATE,INSERT,DELETE等
- DDL:data definition language,CREATE,ALTER,DROP等
- DCL:Data Control Language,grant,deny,revoke等

#### Java
1. 如果当多个线程访问同一个可变的状态变量时没有使用合适的同步,那么程序就会出现错误.有三种方式可以修复这个问题.
	- 不在线程之间共享该状态变量.
	- 将状态变量修改为不可变的变量.
	- 在访问状态变量时使用同步.
2. 无状态对象一定是线程安全的.
3. 每个Java对象可以用作一个实现同步的锁,称为内置锁(Intrinsic Lock)或Monitor Lock.
4. 获得内置锁的唯一途径就是进入这锁保护的同步代码块或方法.
5. 内置锁是可重入的.

6.

- DO(DataObject):与数据库表结构一一对应,通过DAO层向上传输数据源对象.Model.
- DTO(DataTransferObject):数据传输对象,Service和Manager向外传输的对象.
- BO(BusinessObject):业务对象,可以由Service层输出的封装业务逻辑的对象.
- QUERY,数据查询对象,各层接收上层的查询请求。
- VO(ViewObject):显示各层对象,通常是web向模板渲染引擎层传输的对象.

1. 线程处于Sleep或者Blocked状态时,即程序不执行,没有分配CPU时间.
3. HotSpot并不区分虚拟机栈和本地方法栈.
4. 栈容量只由-Xss参数设定.
5. https://visualvm.github.io/plugins.html插件
6. 打印GC日志:-XX:+PrintGCDetails-XX:+PrintGCDateStamps-Xloggc:./gc.log

#### Linux

1. sz命令发送文件到本地;rz命令本地上传文件到服务器.
2. $0当前Shell程序的文件名
3. dirname$0，获取当前Shell程序的路径
4. cd `dirname$0` ，进入当前Shell程序的目录



#### MySQL
1. 连接池通常实现在Client端,是指应用(客户端)创建预先创建一定的连接
2. 线程池实现在server端,通过创建一定数量的线程服务DB请求

```
实现RejectedExecutionHandler的java.util.concurrent中的类:
ThreadPoolExecutor.AbortPolicy:用于被拒绝任务的处理程序,它将抛出RejectedExecutionException.
ThreadPoolExecutor.CallerRunsPolicy:用于被拒绝任务的处理程序,它直接在execute方法的调用线程中运行被拒绝的任务；如果执行程序已关闭，则会丢弃该任务。
ThreadPoolExecutor.DiscardOldestPolicy:用于被拒绝任务的处理程序,它放弃最旧的未处理请求，然后重试execute；如果执行程序已关闭，则会丢弃该任务。
ThreadPoolExecutor.DiscardPolicy:用于被拒绝任务的处理程序,默认情况下它将丢弃被拒绝的任务。

~vim.zshrc
source ~/.bash_profile 解决MacMaven命令找不到的问题.

字节,字符,比特位.
字符:"abc"
字节：
97
98
99
比特位:01100001
字节是用来保存的,比特位是用来传输的.
UTF-8是变长编码,一个汉字占3个字节一个数字或者字母占1个字节

在server.xml中配置了四个监听端口,分别是：
1)ServerPort:该端口用于监听关闭tomcat的shutdown命令,默认为8005
2)ConnectorPort:该端口用于监听HTTP的请求,默认为8080
3)AJPPort:该端口用于监听AJP(ApacheJServProtocol)协议上的请求,通常用于整合ApacheServer等其他HTTP服务器,默认为8009
4)RedirectPort:重定向端口,出现在Connector配置中,如果该Connector仅支持非SSL的普通http请求,那么该端口会把https的请求转发到这个RedirectPort指定的端口,默认为8443．
可见,如果不是使用AJP协议连接tomcat,只需要保证多实例中的ServerPort和ConnectPort不同即可.

JVM主要包括3各方面:
1)内存划分.
2)class加载机制.
3)GC策略.

JVM内存设置为多大好?
这个没有一个固定值的。需要根据具体的业务来确定。
内存不是越大越好,也不是越小越好。
JVM的默认值已经适应大多数情况。
如果你的业务生成的对象很多会进入老年代,生命周期非常长,建议内存稍大一点，同时将FullGC频率适当调小一点。这样可以节约频繁的GC的开销,这个性能提升还是很大的。
如果你的业务生成的对象很多都是朝生夕灭,生命周期短暂,建议新生代和老年代内存比例可以适当调整,老年代小一点。MinGC会相对来说稍微频繁一点。但是尽量避免FullGC。因为这个对JVM性能影响比MinGC大很多。
如果你们的业务对内存很敏感,上线前一半要做很多实验和测试来确定合适的内存大小。

jvm参数配置：
堆的最小值:Xms
堆的最大值:Xmx
新生代大小:Xmn
永久代大小:XX:PermSize
永久代最大大小:XX:MaxPermSize：
栈大小:-Xss或-XX:ThreadStackSize

具体用哪些二进制数字表示哪个符号当然每个人都可以约定自己的一套（这就叫编码）
char--->byte编码,或byte--->char解码,使用的字符集不一致导致乱码.

classpath*:的出现是为了从多个jar文件中加载相同的文件.
classpath:只能加载找到的第一个文件.
classpath*:的使用是为了多个component(最终发布成不同的jar包)并行开发,各自的bean定义文件按照一定的规则:package+filename,
而使用这些component的调用者可以把这些文件都加载进来.

主机记录就是域名前缀，常见用法有：
www：解析后的域名为www.wchb7.com
@：直接解析主域名wchb7.com
*：泛解析，匹配其他所有域名*.wchb7.com

A记录：地址记录，用来指定域名的IPv4地址（如：8.8.8.8），如果需要将域名指向一个IP地址，就需要添加A记录。
AAAA：用来指定主机名（或域名）对应的IPv6地址（例如：ff06:0:0:0:0:0:0:c3）记录。
CNAME：如果需要将域名指向另一个域名，再由另一个域名提供ip地址，就需要添加CNAME记录。
NS：域名服务器记录，如果需要把子域名交给其他DNS服务商解析，就需要添加NS记录。
TXT：在这里可以填写任何东西，长度限制255。绝大多数的TXT记录是用来做SPF记录（反垃圾邮件）。
MX：如果需要设置邮箱，让邮箱能收到邮件，就需要添加MX记录
显性URL：从一个地址301重定向到另一个地址的时候，就需要添加显性URL记录（注：DNSPod目前只支持301重定向）。
隐性URL：类似于显性URL，区别在于隐性URL不会改变地址栏中的域名。
SRV：记录了哪台计算机提供了哪个服务。格式为：服务的名字、点、协议的类型，例如：_xmpp-server._tcp。
同步就是:如果有多个任务或者事件要发生,这些任务或者事件必须逐个地进行,一个事件或者任务的执行会导致整个流程的暂时等待,这些事件没有办法并发地执行;
异步就是:如果有多个任务或者事件发生,这些事件可以并发地执行,一个事件或者任务的执行不会导致整个流程的暂时等待.
不要将多线程和异步画上等号,异步只是宏观上的一个模式,采用多线程来实现异步只是一种手段,并且通过多进程的方式也可以实现异步.
阻塞和非阻塞是从CPU的消耗上来说的,阻塞就是CPU停下来等待一个慢的操作完成以后,CPU才接着完成其他的工作.
非阻塞就是在这个慢的操作执行时,CPU去做其它的工作,等这个慢的操作完成时,CPU再接着完成后续的操作.
阻塞就是:当某个事件或者任务在执行过程中,它发出一个请求操作,但是由于该请求操作需要的条件不满足,那么就会一直在那等待,直至条件满足;
非阻塞就是:当某个事件或者任务在执行过程中,它发出一个请求操作,如果该请求操作需要的条件不满足,会立即返回一个标志信息告知条件不满足,不会一直在那等待.
阻塞和非阻塞的区别关键在于当发出请求一个操作时,如果条件不满足,是会一直等待还是返回一个标志信息.
同步和异步着重点在于多个任务的执行过程中,一个任务的执行是否会导致整个流程的暂时等待;
而阻塞和非阻塞着重点在于发出一个请求操作时,如果进行操作的条件不满足是否会返会一个标志信息告知条件不满足.
通常来说,IO操作包括:对硬盘的读写,对socket的读写以及外设的读写.
阻塞IO:blockingIO,非阻塞:non-blockingIO,synchronousI/O,asynchronousI/O.
AsynchronousI/OoperationcausestherequestingprocesstobeblockeduntilthatI/Ooperationcompletes.
AnasynchronousI/Ooperationdoesnotcausetherequestingprocesstobeblocked.
在Java中,提供了四种访问权限控制:默认访问权限(包访问权限),public,private以及protected.
只有默认访问权限和public能够用来修饰类.修饰类的变量和方法四种权限都可以.(本处所说的类针对的是外部类,不包括内部类)
1.修饰类.默认访问权限(包访问权限):用来修饰类的话,表示该类只对同一个包中的其他类可见.public:用来修饰类的话,表示该类对其他所有的类都可见.
2.修饰类的方法和变量.
默认访问权限(包访问权限):如果一个类的方法或变量被包访问权限修饰,也就意味着只能在同一个包中的其他类中显示地调用该类的方法或者变量,在不同包中的类中不能显示地调用该类的方法或变量.
private:如果一个类的方法或者变量被private修饰,那么这个类的方法或者变量只能在该类本身中被访问,在类外以及其他类中都不能显示地进行访问.
protected:如果一个类的方法或者变量被protected修饰,对于同一个包的类,这个类的方法或变量是可以被访问的.
对于不同包的类,只有继承于该类的类才可以访问到该类的方法或者变量.
public:被public修饰的方法或者变量,在任何地方都是可见的.
Java中,被final修饰的类是不允许被继承的.
不要搞混css和js标签
<linkhref="/css/screen.css"rel="stylesheet">
<scriptsrc="/js/jquery.min.js"></script>
<scriptsrc="/js/main.js"></script>
所谓线程安全无非是要控制多个线程对某个资源的有序访问或修改.
认识java线程安全,必须了解两个主要的点:java的内存模型,java的线程同步机制.
总结java的内存模型,要解决两个主要的问题:可见性和有序性.
何谓可见性?多个线程之间是不能互相传递数据通信的,它们之间的沟通只能通过共享变量来进行.

重载和重写的关键点:
重载的目的是使得我们能够用用一个统一的接口名称来调用一系列方法.这些方法的目的也许是一样的,但是它们的实现方式会根据传入的参数不同而不同.
重载是在编译期就已经确定了的,并不需要等到运行时才能确定.这也是为什么说它不是多态的一个原因.
重写涉及到继承这个概念中的问题.子类继承了父类的方法,但是它可能需要有不同的操作行为,这时候就需要在子类中重写这个父类方法.
private:一个私有的java方法是不能被重写的,因为它对子类压根就不可见
final:重载一个final的方法是可以的,但是不能重写它,因此父类如果将方法声明为final的就可保证所有子类的调用此方法时调用的都是父类的方法.
final:如果两个方法有同样的参数列表,而其中一个的参数被声明为final的这种情况下这两个方法完全一样,因此不可重载.编译都通不过,因为这两个方法被视为.
static:可以重载一个静态的Java方法但是不能重写静态的Java方法,因为静态方法在方法区中只有一个.
static:重载是关于对象(实例）和继承而言的.一个声明为静态的方法属于整个类(对于这个的所有对象都是一样的).因此重写它没有任何意义.
static:对于重载,两个静态方法的重载没有什么特别的,只不过是修饰符多了个static修饰符.参数列表依然必须不同.
static作用于成员变量用来表示只保存一份副本,而final的作用是用来保证变量不可变。

Socket是某种类型文件的抽象.Socket就是一种特殊的文件.它是一个连接了两个用户的文件,任何一个用户向Socket里写数据,
另一个用户都能看得到,不管这两个用户分布在世界上相距多么遥远的角落,感觉就像坐在一起传纸条一样.怎么理解这句话呢？
想象一下,假设你要开发一个网络应用,需要在两个客户端之间发消息.整个过程可能包含以下步骤:
1. 客户端组装数据
2. 客户端之间约定好数据格式
3. 客户端向指定地址发送请求
4. DNS服务器解析请求地址
5. DNS没有找到地址,然后跳转到另一个DNS,一直到找到为止
6. 返回客户端真实的IP
7. 客户端向对应IP建立连接请求（三次握手）
8. 开始发送数据,窗口以2的k次幂大小滑动
所以有了Socket的概念之后,我们在两个客户端之间发送消息可能就是这样的：
1. 指定对方的地址
2. 打开一个和对方连接的Socket
3. 把Socket当成普通的文件,往里写数据
4. 要是发现Socket里有数据,就读出来,那必然是对方发过来的
```
