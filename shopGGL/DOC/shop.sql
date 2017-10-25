/*
Navicat MySQL Data Transfer

Source Server         : asd
Source Server Version : 50634
Source Host           : 127.0.0.1:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-10-25 08:47:30
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

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
  `count` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grou
-- ----------------------------

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
  `csorid` int(11) DEFAULT NULL,
  `decript` varchar(255) DEFAULT NULL,
  `grid` int(11) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `proname` varchar(255) DEFAULT NULL,
  `salecount` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`proid`),
  KEY `FK_mqqegagq33hjarpb035mit3o7` (`csorid`),
  CONSTRAINT `FK_mqqegagq33hjarpb035mit3o7` FOREIGN KEY (`csorid`) REFERENCES `csort` (`csorid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', null, 'happy baby 儿童安全座椅', '1', '../images/img/img.jpg', '1320', '保护儿童行车安全', '0', '999999');
INSERT INTO `product` VALUES ('2', null, '买一送一   鲜活直达', '1', '../images/img/img3.jpg', '196', '阳澄湖大闸蟹', '0', '999999');
INSERT INTO `product` VALUES ('4', null, '最IN进口面膜敷起来', '1', '../images/img/img2.jpg', '1320', '韩后919爱购节', '0', '999999');
INSERT INTO `product` VALUES ('5', '1', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', null, '/shopGGL/images/img/img39.jpg', '222', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', '0', '999999');
INSERT INTO `product` VALUES ('6', '1', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', null, '/shopGGL/images/img/img39.jpg', '222', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', '0', '999999');
INSERT INTO `product` VALUES ('7', '2', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', null, '/shopGGL/images/img/img39.jpg', '222', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', '0', '999999');
INSERT INTO `product` VALUES ('8', '2', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', null, '/shopGGL/images/img/img39.jpg', '222', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', '0', '999999');
INSERT INTO `product` VALUES ('9', '2', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', null, '/shopGGL/images/img/img39.jpg', '222', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', '0', '999999');
INSERT INTO `product` VALUES ('10', '3', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', null, '/shopGGL/images/img/img39.jpg', '222', '进口天然乳胶床垫弹簧1.51.8米双人软硬席梦思 椰梦维棕垫', '0', '999999');

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `sorid` int(11) NOT NULL AUTO_INCREMENT,
  `sorimg` varchar(255) DEFAULT NULL,
  `sorname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`sorid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES ('1', 'li01', '功能产品1');
INSERT INTO `sort` VALUES ('2', 'li02', '功能产品2');
INSERT INTO `sort` VALUES ('3', 'li03', '功能产品3');
INSERT INTO `sort` VALUES ('10', 'li04', '功能产品4');
INSERT INTO `sort` VALUES ('11', 'li05', '功能产品5');
INSERT INTO `sort` VALUES ('12', 'li06', '功能产品6');
INSERT INTO `sort` VALUES ('13', 'li07', '功能产品7');
INSERT INTO `sort` VALUES ('14', 'li08', '功能产品8');
INSERT INTO `sort` VALUES ('15', 'li09', '功能产品9');
INSERT INTO `sort` VALUES ('16', 'li10', '功能产品10');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sort2
-- ----------------------------
INSERT INTO `sort2` VALUES ('1', '1', '家纺（1）');
INSERT INTO `sort2` VALUES ('2', '1', '家纺（2）');
INSERT INTO `sort2` VALUES ('3', '1', '家纺（3）');
INSERT INTO `sort2` VALUES ('4', '1', '家纺（4）');
INSERT INTO `sort2` VALUES ('5', '2', '生活用品（2）');
INSERT INTO `sort2` VALUES ('6', '2', '生活用品（2）');
INSERT INTO `sort2` VALUES ('7', '2', '生活用品（2）');
INSERT INTO `sort2` VALUES ('8', '2', '生活用品（2）');
INSERT INTO `sort2` VALUES ('9', '3', '家具（3）');
INSERT INTO `sort2` VALUES ('10', '3', '家具（3）');
INSERT INTO `sort2` VALUES ('11', '3', '家具（3）');
INSERT INTO `sort2` VALUES ('12', '3', '家具（3）');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '广东省深圳市xxxxxxxxxxx', '/shopGGL/images/1.png', '123456', '123456', '钦差大臣', '新官人', 'Y', 'admin', '441716');
