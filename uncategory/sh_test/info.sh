######################################
# File Name: info.sh
# Author: wchb
# Email: wchb20155@gmail.com
# Create Time: 2016年03月23日 星期三 10时16分02秒
######################################
#!/bin/bash

ClosingPrice_P1701=$(curl -s  http://hq.sinajs.cn/list=P1701|cut  -f 6 -d ,)
ClosingPrice_RB1610=`curl -s  http://hq.sinajs.cn/list=RB1610|cut  -f 6 -d ,`
ClosingPrice_SR1609=`curl -s  http://hq.sinajs.cn/list=SR1609|cut  -f 6 -d ,`

curl -s  http://hq.sinajs.cn/list=P1701 |grep --color='auto' -a "$ClosingPrice_P1701"
curl -s  http://hq.sinajs.cn/list=RB1610 |grep --color='auto' -a $ClosingPrice_RB1610
curl -s  http://hq.sinajs.cn/list=SR1609 |grep --color='auto' -a $ClosingPrice_SR1609

#echo "###############################"
#curl -s  http://hq.sinajs.cn/list=P1609 |grep --color='auto' -a 5450
#curl -s  http://hq.sinajs.cn/list=RB1610 |grep --color='auto' -a 2344
#curl -s  http://hq.sinajs.cn/list=SR1609 |grep --color='auto' -a 5561
#future_item='期货合约,交易所代码,开盘价,最高价,最低价,昨收,买价,卖价,最新价,结算价,昨结算,买量,卖量,持仓量,成交量,交易所简称,品种名简称,日期'

