
| future_daily_price | CREATE TABLE `future_daily_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contract_name` varchar(50) NOT NULL COMMENT '合约名称',
  `date` datetime NOT NULL COMMENT '日期yyyy-mm-dd',
  `opening_price` smallint(6) NOT NULL COMMENT '开盘价',
  `closing_price` smallint(6) NOT NULL COMMENT '收盘价',
  `the_highest_price` smallint(6) NOT NULL COMMENT '最高价',
  `the_lowest_price` smallint(6) NOT NULL COMMENT '最低价',
  `average_price` smallint(6) NOT NULL COMMENT '结算价(日成交均价)',
  `open_interest` int(11) NOT NULL COMMENT '持仓量',
  `volume` int(11) NOT NULL COMMENT '成交量',
  `oc_spread` smallint(6) NOT NULL COMMENT '价差(开盘收盘)',
  `hl_spread` smallint(6) NOT NULL COMMENT '价差(最高最低)',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_key_date_contract` (`date`,`contract_name`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='期货每日价格表'
