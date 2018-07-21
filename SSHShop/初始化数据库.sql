/*
SQLyog Ultimate v8.32 
MySQL - 5.7.18-log : Database - shopsys
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`shopsys` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `shopsys`;

/*Table structure for table `adminuser` */

DROP TABLE IF EXISTS `adminuser`;

CREATE TABLE `adminuser` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `adminuser` */

insert  into `adminuser`(`uid`,`username`,`password`) values (1,'123','123');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`cid`,`cname`) values (1,'服装'),(2,'食品'),(3,'百货'),(4,'美妆洗护'),(5,'电子数码');

/*Table structure for table `categorysecond` */

DROP TABLE IF EXISTS `categorysecond`;

CREATE TABLE `categorysecond` (
  `csid` int(11) NOT NULL AUTO_INCREMENT,
  `csname` varchar(255) DEFAULT NULL,
  `cid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csid`),
  KEY `FK936FCAF28979250A` (`cid`),
  CONSTRAINT `FK936FCAF28979250A` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `categorysecond` */

insert  into `categorysecond`(`csid`,`csname`,`cid`) values (1,'帽子',1),(2,'上衣',1),(3,'裤子',1),(4,'鞋',1),(5,'水果',2),(6,'蔬菜',2),(7,'零食',2),(8,'居家日常',3),(9,'餐饮用具',3),(10,'厨房烹饪',3),(11,'收纳必备',3),(12,'柴米油盐',2),(13,'节日用品',3),(14,'个人洗护',4),(15,'美容护肤',4),(16,'彩妆',4),(17,'手机',5),(18,'电脑',5),(19,'外设',5),(20,'3C数码',5);

/*Table structure for table `ddmessage` */

DROP TABLE IF EXISTS `ddmessage`;

CREATE TABLE `ddmessage` (
  `dmid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `subtotal` double DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `did` int(11) DEFAULT NULL,
  PRIMARY KEY (`dmid`),
  KEY `FKB79BE387C059756C` (`pid`),
  KEY `FKB79BE3878E233595` (`did`),
  CONSTRAINT `FKB79BE3878E233595` FOREIGN KEY (`did`) REFERENCES `dindan` (`did`),
  CONSTRAINT `FKB79BE387C059756C` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `ddmessage` */

/*Table structure for table `dindan` */

DROP TABLE IF EXISTS `dindan`;

CREATE TABLE `dindan` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `total` double DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`),
  KEY `FKB09FC66828F16E69` (`uid`),
  CONSTRAINT `FKB09FC66828F16E69` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `dindan` */

/*Table structure for table `morepic` */

DROP TABLE IF EXISTS `morepic`;

CREATE TABLE `morepic` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `path1` varchar(200) DEFAULT NULL,
  `path2` varchar(200) DEFAULT NULL,
  `path3` varchar(200) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `FK49E73A15C059756C` (`pid`),
  CONSTRAINT `FK49E73A15C059756C` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `morepic` */

insert  into `morepic`(`mid`,`path1`,`path2`,`path3`,`pid`) values (1,'products/1530514781376夏装韩版休上衣女2.jpeg','products/1530514781376夏装韩版休上衣女3.jpeg','products/1530514781375夏装韩版休上衣女1.jpeg',1),(2,'products/1530515345267男士小西装休闲上衣2.jpeg','products/1530515345269男士小西装休闲上衣3.jpeg','products/1530515345265男士小西装休闲上衣1.jpeg',2),(3,'products/1530515472307板鞋白色透气男火热促销2.jpeg','products/1530515472308板鞋白色透气男火热促销3.jpeg','products/1530515472306板鞋白色透气男火热促销1.jpeg',3),(4,'products/1530515624898海南香蕉新鲜美味2.jpeg','products/1530515624899海南香蕉新鲜美味3.jpeg','products/1530515624898海南香蕉新鲜美味1.jpeg',4),(5,'products/1530515854961水蜜桃美味香甜2.jpeg','products/1530515854963水蜜桃美味香甜3.jpeg','products/1530515854960水蜜桃美味香甜1.jpeg',5),(6,'products/1530515951960电脑游戏专用吃鸡必备2.jpeg','products/1530515951961电脑游戏专用吃鸡必备3.jpeg','products/1530515951959电脑游戏专用吃鸡必备1.jpeg',6),(7,'products/1530516096236游戏主机性价比超高学生专用2.jpeg','products/1530516096237游戏主机性价比超高学生专用3.jpeg','products/1530516096236游戏主机性价比超高学生专用1.jpeg',7),(8,'products/1530667337890男士衬衫网格纯棉2.jpeg','products/1530667337891男士衬衫网格纯棉3.jpeg','products/1530667337890男士衬衫网格纯棉1.jpeg',8),(9,'products/1530667566573休闲黑白宽松街舞裤子2.jpeg','products/1530667566574休闲黑白宽松街舞裤子3.jpeg','products/1530667566572休闲黑白宽松街舞裤子1.jpeg',9),(10,'products/1530668763737山东新土豆2.jpeg','products/1530668763737山东新土豆3.jpeg','products/1530668763736山东新土豆1.jpeg',10),(11,'products/1530668918600农肥栽培无添加黄瓜2.jpeg','products/1530668918601农肥栽培无添加黄瓜3.jpeg','products/1530668918599农肥栽培无添加黄瓜1.jpeg',11),(12,'products/1530669122045高保真蓝牙耳麦超长待机2.jpeg','products/1530669122046高保真蓝牙耳麦超长待机3.jpeg','products/1530669122045高保真蓝牙耳麦超长待机1.jpeg',12),(13,'products/1530669260461机械手感键鼠套装2.jpeg','products/1530669260462机械手感键鼠套装3.jpeg','products/1530669260461机械手感键鼠套装1.jpeg',13),(14,'products/1530669467482古龙专业去屑洗发露2.jpeg','products/1530669467482古龙专业去屑洗发露3.jpeg','products/1530669467481古龙专业去屑洗发露1.jpeg',14);

/*Table structure for table `product` */

DROP TABLE IF EXISTS `product`;

CREATE TABLE `product` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `pic` varchar(200) DEFAULT NULL,
  `info` varchar(45) DEFAULT NULL,
  `pdate` datetime DEFAULT NULL,
  `hot` int(11) DEFAULT NULL,
  `csid` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `FKED8DCCEF1A15296B` (`csid`),
  CONSTRAINT `FKED8DCCEF1A15296B` FOREIGN KEY (`csid`) REFERENCES `categorysecond` (`csid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `product` */

insert  into `product`(`pid`,`name`,`price`,`quantity`,`pic`,`info`,`pdate`,`hot`,`csid`) values (1,'夏装韩版休上衣女',129,960,'products/1530514781368夏装韩版休上衣女0.jpeg','夏装韩版休上衣女','2018-07-02 14:59:41',1,2),(2,'男士小西装休闲上衣',199,999,'products/1530515345264男士小西装休闲上衣0.jpeg','男士小西装休闲上衣','2018-07-02 15:09:05',1,2),(3,'板鞋白色透气男火热促销',99,999,'products/1530515472304板鞋白色透气男火热促销0.jpeg','板鞋白色透气男火热促销','2018-07-02 15:11:12',1,4),(4,'海南香蕉新鲜美味',12.69,900,'products/1530515624896海南香蕉新鲜美味0.jpeg','海南香蕉新鲜美味','2018-07-02 15:13:45',1,5),(5,'水蜜桃美味香甜',21.23,999,'products/1530515854959水蜜桃美味香甜0.jpeg','水蜜桃美味香甜','2018-07-02 15:17:34',1,5),(6,'电脑游戏专用吃鸡必备',4299,5000,'products/1530515951957电脑游戏专用吃鸡必备0.jpeg','电脑游戏专用吃鸡必备','2018-07-02 15:19:12',0,18),(7,'游戏主机性价比超高学生专用',3500,94,'products/1530516096235游戏主机性价比超高学生专用0.jpeg','游戏主机性价比超高学生专用','2018-07-02 15:21:36',1,18),(8,'男士衬衫网格纯棉',122,999,'products/1530667337883男士衬衫网格纯棉0.jpeg','男士衬衫网格纯棉','2018-07-04 09:22:17',1,2),(9,'休闲黑白宽松街舞裤子',123,50,'products/1530667566571休闲黑白宽松街舞裤子0.jpeg','休闲黑白宽松街舞裤子','2018-07-04 09:26:06',1,3),(10,'山东新土豆',12.23,999,'products/1530668763735山东新土豆0.jpeg','山东新土豆 价格优惠 当日达','2018-07-04 09:46:03',1,6),(11,'农肥栽培无添加黄瓜',9.9,999,'products/1530668918598农肥栽培无添加黄瓜0.jpeg','农肥栽培无添加黄瓜','2018-07-04 09:48:38',1,6),(12,'高保真蓝牙耳麦超长待机',39.9,999,'products/1530669122044高保真蓝牙耳麦超长待机0.jpeg','高保真蓝牙耳麦超长待机','2018-07-04 09:52:02',1,19),(13,'机械手感键鼠套装',299,500,'products/1530669260445机械手感键鼠套装0.jpeg','机械手感键鼠套装','2018-07-04 09:54:20',1,19),(14,'古龙专业去屑洗发露',88.8,999,'products/1530669467481古龙专业去屑洗发露0.jpeg','古龙专业去屑洗发露，护发','2018-07-04 09:57:47',1,14);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`password`,`name`,`email`,`phone`,`addr`,`state`,`code`) values (2,'小呆','123456d','代红帅','1479803204@qq.com','13754545454','天津',1,'1530600780477小呆code');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
