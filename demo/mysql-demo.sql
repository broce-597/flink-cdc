CREATE DATABASE brocedb;
USE brocedb;

CREATE TABLE `order`  (
  `id` bigint(20) ,
  `order_sn` varchar(64) ,
  `order_from` varchar(64),
  `order_pay_account` bigint(20) ,
  `order_pay_amount`,
  `customer_id`,
  PRIMARY KEY (`id`) USING BTREE
)

INSERT INTO `order` VALUES (1381479320000000001, '20210517163701', 'alipay', 1380483276901, 993.04, 693852741);
INSERT INTO `order` VALUES (1381479320000000002, '20210517163702', 'wxpay', 1380483276902, 10000.00, 693852742);
INSERT INTO `order` VALUES (1381479320000000003, '20210517163703', 'alipay', 1380483276903, 9996.08, 693852743);
INSERT INTO `order` VALUES (1381479320000000004, '20210517163704', 'wxpay', 1380483276904, 1000.00, 693852744);
INSERT INTO `order` VALUES (1381479320000000005, '20210517163705', 'alipay', 1380483276905, 9995.92, 693852745);

CREATE TABLE `customer`  (
  `id` bigint(20),
  `username` varchar(64),
  `phone` varchar(64),
  `sex` int(1),
  `city` varchar(64)
  PRIMARY KEY (`id`) USING BTREE
)


INSERT INTO `customer` VALUES (693852741,'broce',12345678900,1,'fuzhou')
INSERT INTO `customer` VALUES (693852742,'zhangsan',12345678901,2,'hangzhou')
INSERT INTO `customer` VALUES (693852743,'lisi',12345678902,1,'alashan')
INSERT INTO `customer` VALUES (693852744,'wangwu',12345678903,2,'shenzheng')
INSERT INTO `customer` VALUES (693852745,'zhuliu',12345678904,1,'guangxi')



CREATE TABLE `customer_account`  (
  `id` bigint(20),
  `customer_id` bigint(20),
  `available_amount` decimal(20, 2),
  PRIMARY KEY (`id`) USING BTREE
)


INSERT INTO `customer_account` VALUES (1368867526276026370, 693852741, 3.06);
INSERT INTO `customer_account` VALUES (1368869325909266434, 693852741, 0.02);
INSERT INTO `customer_account` VALUES (1368869410663567362, 693852741, 4.01);
INSERT INTO `customer_account` VALUES (1368878313979777026, 693852741, 0.99);
INSERT INTO `customer_account` VALUES (1368883120085929986, 693852741, 0.56);