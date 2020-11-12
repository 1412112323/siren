/*
MySQL Data Transfer
Source Host: localhost
Source Database: srykzsblmis_db
Target Host: localhost
Target Database: srykzsblmis_db
Date: 2016/3/23 17:48:55
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat` (
  `id` int(11) NOT NULL auto_increment,
  `msg` text,
  `hfmsg` text,
  `savetime` varchar(255) default NULL,
  `uid` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL auto_increment,
  `deptname` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ghinfo
-- ----------------------------
DROP TABLE IF EXISTS `ghinfo`;
CREATE TABLE `ghinfo` (
  `id` int(11) NOT NULL auto_increment,
  `ghno` varchar(255) default NULL,
  `tname` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `age` varchar(255) default NULL,
  `idcard` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `ghdept` varchar(255) default NULL,
  `price` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `oper` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for kcrecord
-- ----------------------------
DROP TABLE IF EXISTS `kcrecord`;
CREATE TABLE `kcrecord` (
  `id` bigint(20) NOT NULL auto_increment,
  `yno` varchar(255) default NULL,
  `num` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `oper` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `note` text,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `id` int(11) NOT NULL auto_increment,
  `uname` varchar(255) default NULL,
  `upass` varchar(255) default NULL,
  `tname` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `age` varchar(255) default NULL,
  `idcard` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for sysuser
-- ----------------------------
DROP TABLE IF EXISTS `sysuser`;
CREATE TABLE `sysuser` (
  `id` int(11) NOT NULL auto_increment,
  `uname` varchar(255) default NULL,
  `upass` varchar(255) default NULL,
  `tname` varchar(255) default NULL,
  `sex` varchar(255) default NULL,
  `birth` varchar(255) default NULL,
  `tel` varchar(255) default NULL,
  `ismarage` varchar(255) default NULL,
  `addr` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `idcard` varchar(255) default NULL,
  `byschool` varchar(255) default NULL,
  `utype` varchar(255) default NULL,
  `dept` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for ypcf
-- ----------------------------
DROP TABLE IF EXISTS `ypcf`;
CREATE TABLE `ypcf` (
  `id` bigint(20) NOT NULL auto_increment,
  `yno` varchar(255) default NULL,
  `yname` varchar(255) default NULL,
  `gg` varchar(255) default NULL,
  `price` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `delstatus` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yy
-- ----------------------------
DROP TABLE IF EXISTS `yy`;
CREATE TABLE `yy` (
  `id` int(11) NOT NULL auto_increment,
  `uid` varchar(255) default NULL,
  `dept` varchar(255) default NULL,
  `type` varchar(255) default NULL,
  `ghno` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for zd
-- ----------------------------
DROP TABLE IF EXISTS `zd`;
CREATE TABLE `zd` (
  `ghno` varchar(255) default NULL,
  `bq` text,
  `zd` text,
  `info` text,
  `numinfo` text,
  `oper` varchar(255) default NULL,
  `savetime` varchar(255) default NULL,
  `qystatus` varchar(255) default NULL,
  `fkstatus` varchar(255) default NULL,
  `totalprice` double default NULL,
  `sfoper` varchar(255) default NULL,
  `sfsavetime` varchar(255) default NULL,
  `fyoper` varchar(255) default NULL,
  `fysavetime` varchar(255) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `chat` VALUES ('1', '呵了', '好，测试成功', '2016-03-23 17:35:42', '1');
INSERT INTO `chat` VALUES ('2', '我来了', '我知道 ', '2016-03-23 17:40:44', '2');
INSERT INTO `dept` VALUES ('1', '牙科', '一楼', '0', '88888888');
INSERT INTO `ghinfo` VALUES ('1', '20160323044944', '小明', '男', '23', '428888197712122222', '13265443456', '湖北武汉光谷1路', '1', '10', '0', '已问诊', '网上预约', '2016-03-23 16:49:44');
INSERT INTO `ghinfo` VALUES ('2', '20160323044950', '小方', '女', '18', '427666198510084567', '13222222222', '湖南长沙芙蓉大道88号', '1', '5', '0', '已问诊', 'gh', '2016-03-23 16:50:11');
INSERT INTO `ghinfo` VALUES ('3', '20160323054406', '美美', '女', '23', '428888197711110099', '13666666611', '硚口宝丰一路', '1', '10', '0', '已问诊', '网上预约', '2016-03-23 17:44:06');
INSERT INTO `kcrecord` VALUES ('1', 'NO0002', '100', 'in', 'yf', '2016-03-23 17:03:13');
INSERT INTO `kcrecord` VALUES ('2', 'NO0002', '1', 'out', 'yf', '2016-03-23 17:03:17');
INSERT INTO `kcrecord` VALUES ('3', 'NO0002', '3', 'out', 'yf', '2016-03-23 17:46:28');
INSERT INTO `kcrecord` VALUES ('4', 'NO0004', '100', 'in', 'yf', '2016-03-23 17:46:42');
INSERT INTO `notice` VALUES ('2', '测试公告的啦', '呵呵', '2016-03-23 17:15:41');
INSERT INTO `notice` VALUES ('3', '测试的公告', '123123123', '2016-03-23 17:41:17');
INSERT INTO `patient` VALUES ('1', 'xm', '123', '小明', '男', '23', '428888197712122222', '13265443456', '湖北武汉光谷1路', '0');
INSERT INTO `patient` VALUES ('2', 'mm', '123', '美美', '女', '23', '428888197711110099', '13666666611', '硚口宝丰一路', '0');
INSERT INTO `sysuser` VALUES ('1', 'admin', '123', '廖杰', '男', null, null, null, null, null, null, null, '管理员', null);
INSERT INTO `sysuser` VALUES ('2', 'gh', '123', '张三', '男', '1982-03-23', '13412312312', '已婚', '人民北路10号', 'gh@163.com', '427777198810098765', '武汉医学院', '挂号人员', '');
INSERT INTO `sysuser` VALUES ('3', 'sf', '123', '李四', '男', '1992-03-23', '13099987777', '未婚', '南京路9号', 'sf@163.com', '428888197712120099', '上海交大', '收费人员', '');
INSERT INTO `sysuser` VALUES ('4', 'yf', '123', '王五', '男', '1984-03-23', '13000000000', '未婚', '解放大道9号', 'yf@163.com', '426345198810108822', '北京大学', '药房人员', '');
INSERT INTO `sysuser` VALUES ('5', 'doctor1', '123', '赵六', '男', '1973-03-23', '13412344322', '未婚', '龙王庙1号', 'doctor1@163.com', '427666195110084567', '工程大学', '医生', '1');
INSERT INTO `ypcf` VALUES ('1', 'NO0001', '消毒费', '', '5', '处置', '', '0');
INSERT INTO `ypcf` VALUES ('2', 'NO0002', '阿莫西林胶囊', '盒', '15.5', '药品', '西安杨森', '0');
INSERT INTO `ypcf` VALUES ('3', 'NO0003', '诊断费', '', '10', '处置', '', '0');
INSERT INTO `ypcf` VALUES ('6', 'NO0004', '红霉素软胶囊', '盒', '6', '药品', '白云山制药', '0');
INSERT INTO `yy` VALUES ('1', '1', '1', '10', '20160323044944', '2016-03-23 16:45:38');
INSERT INTO `yy` VALUES ('3', '2', '1', '10', '20160323054406', '2016-03-23 17:40:59');
INSERT INTO `zd` VALUES ('20160323044950', '牙齿发炎，红肿', '长智齿', 'NO0001-消毒费-5元$NO0002-阿莫西林胶囊-15.5元$', '1$1$', 'doctor1', '2016-03-23 16:57:32', '已取药', '已付款', '20.5', 'sf', '2016-03-23 17:00:31', 'yf', '2016-03-23 17:03:17');
INSERT INTO `zd` VALUES ('20160323044944', '吃东西总是夹菜', '有蛀牙，消个毒就好', 'NO0001-消毒费-5元$', '1$', 'doctor1', '2016-03-23 16:59:23', '已取药', '已付款', '5', 'sf', '2016-03-23 17:00:20', 'yf', '2016-03-23 17:03:19');
INSERT INTO `zd` VALUES ('20160323054406', '说头很痛', '牙齿发炎导致，消下毒，吃点药', 'NO0002-阿莫西林胶囊-15.5元$NO0001-消毒费-5元$', '3$1$', 'doctor1', '2016-03-23 17:45:25', '已取药', '已付款', '51.5', 'sf', '2016-03-23 17:46:00', 'yf', '2016-03-23 17:46:31');
