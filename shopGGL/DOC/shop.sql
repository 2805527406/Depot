/*
Navicat MySQL Data Transfer

Source Server         : asd
Source Server Version : 50634
Source Host           : 127.0.0.1:3306
Source Database       : shop

Target Server Type    : MYSQL
Target Server Version : 50634
File Encoding         : 65001

Date: 2017-10-20 09:28:13
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
  `enid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`csorid`),
  KEY `FK_kh1hfir11gtkbw0nkpwygawui` (`enid`),
  KEY `FK_4vifko3iws33980lo7hk21h2t` (`sid`),
  CONSTRAINT `FK_4vifko3iws33980lo7hk21h2t` FOREIGN KEY (`sid`) REFERENCES `sort` (`sorid`),
  CONSTRAINT `FK_kh1hfir11gtkbw0nkpwygawui` FOREIGN KEY (`enid`) REFERENCES `entry` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of csort
-- ----------------------------

-- ----------------------------
-- Table structure for entry
-- ----------------------------
DROP TABLE IF EXISTS `entry`;
CREATE TABLE `entry` (
  `entryid` int(11) NOT NULL AUTO_INCREMENT,
  `count` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `orid` int(11) DEFAULT NULL,
  `price` float DEFAULT NULL,
  PRIMARY KEY (`entryid`)
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grou
-- ----------------------------
INSERT INTO `grou` VALUES ('1', '限时抢购');
INSERT INTO `grou` VALUES ('2', '特色品牌');
INSERT INTO `grou` VALUES ('3', '新品上市');
INSERT INTO `grou` VALUES ('4', '热销产品');
INSERT INTO `grou` VALUES ('5', '精品推荐');

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
  PRIMARY KEY (`proid`),
  KEY `FK_mqqegagq33hjarpb035mit3o7` (`csorid`),
  KEY `FK_c078y007ogacgwp17ob2eh7hn` (`grid`),
  CONSTRAINT `FK_c078y007ogacgwp17ob2eh7hn` FOREIGN KEY (`grid`) REFERENCES `grou` (`gid`),
  CONSTRAINT `FK_mqqegagq33hjarpb035mit3o7` FOREIGN KEY (`csorid`) REFERENCES `csort` (`csorid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', null, 'happy baby 儿童安全座椅', '1', '../images/img/img.jpg', '1320', '保护儿童行车安全', null);
INSERT INTO `product` VALUES ('2', null, '买一送一   鲜活直达', '1', '../images/img/img3.jpg', '196', '阳澄湖大闸蟹', null);
INSERT INTO `product` VALUES ('4', null, '最IN进口面膜敷起来', '1', '../images/img/img2.jpg', '1320', '韩后919爱购节', null);
INSERT INTO `product` VALUES ('5', null, '智能穿戴 智能手表Apple Watch', '2', '../images/img/img4.jpg', '2658', '苹果WATCH手表', null);
INSERT INTO `product` VALUES ('6', null, '智能穿戴 智能手表Apple Watch', '2', '../images/img/img4.jpg', '2658', '苹果WATCH手表1', null);
INSERT INTO `product` VALUES ('7', null, '智能穿戴 智能手表Apple Watch', '2', '../images/img/img4.jpg', '2658', '苹果WATCH手表2', null);
INSERT INTO `product` VALUES ('8', null, '智能穿戴 智能手表Apple Watch', '2', '../images/img/img4.jpg', '2658', '苹果WATCH手表3', null);
INSERT INTO `product` VALUES ('9', null, '智能穿戴 智能手表Apple Watch', '2', '../images/img/img4.jpg', '2658', '苹果WATCH手表4', null);
INSERT INTO `product` VALUES ('10', null, '智能穿戴 智能手表Apple Watch', '2', '../images/img/img4.jpg', '2658', '苹果WATCH手表5', null);
INSERT INTO `product` VALUES ('11', null, '智能穿戴 智能手表Apple Watch', '2', '../images/img/img4.jpg', '2658', '苹果WATCH手表', null);

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
