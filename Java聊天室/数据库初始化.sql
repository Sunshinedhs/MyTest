/*
SQLyog Ultimate v8.32 
MySQL - 5.7.18-log : Database - javachat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`javachat` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `javachat`;

/*Table structure for table `chat` */

DROP TABLE IF EXISTS `chat`;

CREATE TABLE `chat` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(200) DEFAULT NULL,
  `send` varchar(200) DEFAULT NULL,
  `receive` varchar(200) DEFAULT NULL,
  `time` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `chat` */

insert  into `chat`(`num`,`content`,`send`,`receive`,`time`) values (1,'dsa','dddd','aaaa','2018-07-20 22:34:29'),(2,'ddd','aaaa','dddd','2018-07-20 22:37:19'),(3,'aaaa','dddd','aaaa','2018-07-20 22:37:26');

/*Table structure for table `vip` */

DROP TABLE IF EXISTS `vip`;

CREATE TABLE `vip` (
  `nickname` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `info` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `vip` */

insert  into `vip`(`nickname`,`password`,`info`) values ('aaaa','123456','5.1.jpg'),('dddd','123456','5.1.jpg');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
