/*
Navicat MySQL Data Transfer

Source Server         : asd
Source Server Version : 50634
Source Host           : 127.0.0.1:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-11-06 11:13:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminid` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `permissions` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`adminid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin', 'Y');

-- ----------------------------
-- Table structure for csort
-- ----------------------------
DROP TABLE IF EXISTS `csort`;
CREATE TABLE `csort` (
  `csorid` int(11) NOT NULL AUTO_INCREMENT,
  `csorimg` varchar(255) DEFAULT NULL,
  `csorname` varchar(255) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csorid`),
  KEY `FK_4vifko3iws33980lo7hk21h2t` (`sid`),
  CONSTRAINT `FK_4vifko3iws33980lo7hk21h2t` FOREIGN KEY (`sid`) REFERENCES `sort` (`sorid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csort
-- ----------------------------
INSERT INTO `csort` VALUES ('1', null, '家纺', '1');
INSERT INTO `csort` VALUES ('2', null, '生活用品', '1');
INSERT INTO `csort` VALUES ('3', null, '家具', '1');

-- ----------------------------
-- Table structure for entry
-- ----------------------------
DROP TABLE IF EXISTS `entry`;
CREATE TABLE `entry` (
  `entryid` int(11) NOT NULL AUTO_INCREMENT,
  `createtime` datetime DEFAULT NULL,
  `orderno` varchar(255) DEFAULT NULL,
  `orid` int(11) DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `paymoney` float DEFAULT NULL,
  `price` float DEFAULT NULL,
  `tag` int(11) DEFAULT NULL,
  PRIMARY KEY (`entryid`),
  KEY `FK_jlohdup9edhj1o3c39wtcoekp` (`orid`),
  CONSTRAINT `FK_jlohdup9edhj1o3c39wtcoekp` FOREIGN KEY (`orid`) REFERENCES `orders` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of entry
-- ----------------------------

-- ----------------------------
-- Table structure for grou
-- ----------------------------
DROP TABLE IF EXISTS `grou`;
CREATE TABLE `grou` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `gname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grou
-- ----------------------------
INSERT INTO `grou` VALUES ('1', '限时抢购');
INSERT INTO `grou` VALUES ('2', '精品推荐');
INSERT INTO `grou` VALUES ('3', '易易特色');
INSERT INTO `grou` VALUES ('4', '轮播图');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL AUTO_INCREMENT,
  `orderno` varchar(255) DEFAULT NULL,
  `sendaddress` varchar(255) DEFAULT NULL,
  `sendname` varchar(255) DEFAULT NULL,
  `sendphone` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `FK_ovx1a77y1wro2ypuyiicu2toe` (`userid`),
  CONSTRAINT `FK_ovx1a77y1wro2ypuyiicu2toe` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `proid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `csorid` int(11) DEFAULT NULL,
  `decript` varchar(255) DEFAULT NULL,
  `enid` int(11) DEFAULT NULL,
  `grid` int(11) DEFAULT NULL,
  `image` longtext,
  `price` float DEFAULT NULL,
  `proname` varchar(255) DEFAULT NULL,
  `salecount` int(11) DEFAULT NULL,
  PRIMARY KEY (`proid`),
  KEY `FK_mqqegagq33hjarpb035mit3o7` (`csorid`),
  KEY `FK_c8qg49cfxrfeooxj8yvfm4x9p` (`enid`),
  KEY `FK_c078y007ogacgwp17ob2eh7hn` (`grid`),
  CONSTRAINT `FK_c078y007ogacgwp17ob2eh7hn` FOREIGN KEY (`grid`) REFERENCES `grou` (`gid`),
  CONSTRAINT `FK_c8qg49cfxrfeooxj8yvfm4x9p` FOREIGN KEY (`enid`) REFERENCES `entry` (`entryid`),
  CONSTRAINT `FK_mqqegagq33hjarpb035mit3o7` FOREIGN KEY (`csorid`) REFERENCES `sort2` (`s2id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `sorid` int(11) NOT NULL AUTO_INCREMENT,
  `sorimg` varchar(255) DEFAULT NULL,
  `sorname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sorid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES ('1', 'li01', '功能产品1');
INSERT INTO `sort` VALUES ('2', 'li02', '功能产品2');
INSERT INTO `sort` VALUES ('3', 'li03', '功能产品3');
INSERT INTO `sort` VALUES ('4', 'li04', '功能产品4');
INSERT INTO `sort` VALUES ('5', 'li05', '功能产品5');
INSERT INTO `sort` VALUES ('6', 'li06', '功能产品6');
INSERT INTO `sort` VALUES ('7', 'li07', '功能产品7');
INSERT INTO `sort` VALUES ('8', 'li08', '功能产品8');
INSERT INTO `sort` VALUES ('9', 'li09', '功能产品9');
INSERT INTO `sort` VALUES ('10', 'li10', '功能产品10');

-- ----------------------------
-- Table structure for sort2
-- ----------------------------
DROP TABLE IF EXISTS `sort2`;
CREATE TABLE `sort2` (
  `s2id` int(11) NOT NULL AUTO_INCREMENT,
  `csid` int(11) DEFAULT NULL,
  `s2name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`s2id`),
  KEY `FK_ayed43imva7mxv44qjta8xhdy` (`csid`),
  CONSTRAINT `FK_ayed43imva7mxv44qjta8xhdy` FOREIGN KEY (`csid`) REFERENCES `csort` (`csorid`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sort2
-- ----------------------------
INSERT INTO `sort2` VALUES ('1', '1', '家纺（1）');
INSERT INTO `sort2` VALUES ('2', '1', '家纺（2）');
INSERT INTO `sort2` VALUES ('3', '1', '家纺（3）');
INSERT INTO `sort2` VALUES ('4', '1', '家纺（4）');
INSERT INTO `sort2` VALUES ('5', '1', '家纺（5）');
INSERT INTO `sort2` VALUES ('6', '1', '家纺（6）');
INSERT INTO `sort2` VALUES ('7', '1', '家纺（7）');
INSERT INTO `sort2` VALUES ('8', '2', '生活用品（1）');
INSERT INTO `sort2` VALUES ('9', '2', '生活用品（2）');
INSERT INTO `sort2` VALUES ('10', '2', '生活用品（3）');
INSERT INTO `sort2` VALUES ('11', '2', '生活用品（4）');
INSERT INTO `sort2` VALUES ('12', '2', '生活用品（5）');
INSERT INTO `sort2` VALUES ('13', '2', '生活用品（6）');
INSERT INTO `sort2` VALUES ('14', '2', '生活用品（7）');
INSERT INTO `sort2` VALUES ('15', '3', '家具（1）');
INSERT INTO `sort2` VALUES ('16', '3', '家具（2）');
INSERT INTO `sort2` VALUES ('17', '3', '家具（3）');
INSERT INTO `sort2` VALUES ('18', '3', '家具（4）');
INSERT INTO `sort2` VALUES ('19', '3', '家具（5）');
INSERT INTO `sort2` VALUES ('20', '3', '家具（6）');
INSERT INTO `sort2` VALUES ('21', '3', '家具（7）');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `realname` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `userlean` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
