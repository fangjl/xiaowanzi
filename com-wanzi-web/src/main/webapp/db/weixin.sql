/*
SQLyog Community v9.0 RC
MySQL - 5.5.8 : Database - weixin
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`weixin` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `weixin`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `weixinname` varchar(20) NOT NULL,
  `weixinid` varchar(30) NOT NULL,
  `url` varchar(20) DEFAULT NULL,
  `token` varchar(20) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `appid` varchar(30) DEFAULT NULL,
  `appsecret` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `account` */

insert  into `account`(`id`,`userid`,`weixinname`,`weixinid`,`url`,`token`,`created`,`modified`,`appid`,`appsecret`,`status`) values (2,1,'喵喵','gh_uasdfk','vb_03052047102014','vb_03052047102014','2014-03-05 20:47:10','2014-03-05 20:47:10','','',0),(3,1,'偶爱是的','sdfadsfasdfasd','DI_03081926372014','DI_03081926372014','2014-03-08 19:26:37','2014-03-08 19:26:37','','',0);

/*Table structure for table `admin_reply` */

DROP TABLE IF EXISTS `admin_reply`;

CREATE TABLE `admin_reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(50) NOT NULL,
  `keyword` varchar(30) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `picUrl` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  `msgtext` varchar(1000) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  `type` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `admin_reply` */

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(20) NOT NULL COMMENT '公共账号token',
  `member_id` varchar(20) DEFAULT NULL COMMENT '会员卡卡号',
  `openId` varchar(100) DEFAULT NULL COMMENT '发送方账号',
  `balance` int(11) NOT NULL DEFAULT '0' COMMENT '余额',
  `created` date NOT NULL,
  `modified` date NOT NULL,
  `tel` varchar(20) DEFAULT NULL COMMENT '会员手机号',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '积分',
  `qq` varchar(20) DEFAULT NULL,
  `name` varchar(10) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `member` */

/*Table structure for table `message` */

DROP TABLE IF EXISTS `message`;

CREATE TABLE `message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tousername` char(32) NOT NULL,
  `fromusername` char(32) NOT NULL,
  `msgtype` enum('TEXT','IMAGE','LOCATION','LINK','EVENT') NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `msgId` char(64) NOT NULL,
  `content` varchar(128) DEFAULT NULL,
  `picurl` varchar(128) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `url` varchar(128) DEFAULT NULL,
  `locationx` char(10) DEFAULT NULL,
  `locationy` char(10) DEFAULT NULL,
  `scale` char(8) DEFAULT NULL,
  `label` varchar(32) DEFAULT NULL,
  `event` varchar(16) DEFAULT NULL,
  `eventkey` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user` (`msgtype`,`tousername`,`fromusername`,`createtime`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `message` */

insert  into `message`(`id`,`tousername`,`fromusername`,`msgtype`,`createtime`,`msgId`,`content`,`picurl`,`title`,`description`,`url`,`locationx`,`locationy`,`scale`,`label`,`event`,`eventkey`) values (1,'huan','tmaic','TEXT','2014-02-13 20:34:32','345rt345wet34','hahahha',NULL,NULL,'asdfasdfasdfasd',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'huan','tmaic','TEXT','2014-02-13 20:34:59','345rt345wet34','hahahha',NULL,NULL,'asdfasdfasdfasd',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `reply` */

DROP TABLE IF EXISTS `reply`;

CREATE TABLE `reply` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tousername` char(32) NOT NULL,
  `fromusername` char(32) NOT NULL,
  `msgtype` enum('TEXT','MUSIC','NEWS') NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `content` varchar(512) NOT NULL COMMENT '回复消息内容',
  `musicurl` varchar(128) DEFAULT NULL,
  `hqmusicurl` varchar(128) DEFAULT NULL,
  `articlecount` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user` (`msgtype`,`tousername`,`fromusername`,`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `reply` */

/*Table structure for table `reply_article` */

DROP TABLE IF EXISTS `reply_article`;

CREATE TABLE `reply_article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `replyid` int(10) unsigned NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(64) NOT NULL,
  `picurl` varchar(128) NOT NULL,
  `url` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_replyid` (`replyid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `reply_article` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(20) NOT NULL,
  `tel` varchar(20) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `modified` date DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`email`,`tel`,`created`,`modified`,`qq`) values (1,'tmaic','123','tmaic@126.com','15801046482','2014-02-16','2014-02-16','738468442');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
