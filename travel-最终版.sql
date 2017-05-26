/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.28.253
 Source Server Type    : MySQL
 Source Server Version : 50022
 Source Host           : 192.168.28.253
 Source Database       : travel

 Target Server Type    : MySQL
 Target Server Version : 50022
 File Encoding         : utf-8

 Date: 05/26/2017 14:20:44 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `action`
-- ----------------------------
DROP TABLE IF EXISTS `action`;
CREATE TABLE `action` (
  `actid` varchar(50) NOT NULL default '',
  `rid` varchar(50) default NULL,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`actid`),
  KEY `fk_rid5` (`rid`),
  CONSTRAINT `fk_rid5` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `action`
-- ----------------------------
BEGIN;
INSERT INTO `action` VALUES ('dept:edit', 'emp', '部门编辑'), ('dept:list', 'emp', '部门列表'), ('deptshow:list', 'empshow', '部门列表'), ('emp:add', 'emp', '雇员增加'), ('emp:delete', 'emp', '雇员删除'), ('emp:edit', 'emp', '雇员编辑'), ('emp:get', 'emp', '雇员查看'), ('emp:list', 'emp', '雇员列表'), ('empshow:get', 'empshow', '雇员查看'), ('empshow:list', 'empshow', '雇员列表'), ('travel:add', 'travel', '出差申请'), ('travel:delete', 'travel', '删除申请'), ('travel:edit', 'travel', '出差申请修改'), ('travel:self', 'travel', '我的申请'), ('travel:submit', 'travel', '提交申请'), ('travelaudit:handle', 'travelaudit', '申请处理'), ('travelaudit:list', 'travelaudit', '差旅申请列表'), ('travelaudit:prepare', 'travelaudit', '待审核申请列表');
COMMIT;

-- ----------------------------
--  Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `did` bigint(20) NOT NULL auto_increment,
  `dname` varchar(50) default NULL,
  `eid` varchar(50) default NULL,
  PRIMARY KEY  (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `dept`
-- ----------------------------
BEGIN;
INSERT INTO `dept` VALUES ('1', '管理部', 'mldn-chief'), ('2', '人事部', 'mldn-human'), ('3', '财务部', 'mldn-finance'), ('4', '市场部', 'mldn-market'), ('5', '开发一部', 'mldn-dev1'), ('6', '开发二部', 'mldn-dev2'), ('7', '开发三部', 'mldn-dev3');
COMMIT;

-- ----------------------------
--  Table structure for `dept_role`
-- ----------------------------
DROP TABLE IF EXISTS `dept_role`;
CREATE TABLE `dept_role` (
  `did` bigint(20) default NULL,
  `rid` varchar(50) default NULL,
  KEY `fk_did6` (`did`),
  KEY `fk_rid6` (`rid`),
  CONSTRAINT `fk_did6` FOREIGN KEY (`did`) REFERENCES `dept` (`did`),
  CONSTRAINT `fk_rid6` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `dept_role`
-- ----------------------------
BEGIN;
INSERT INTO `dept_role` VALUES ('1', 'travel'), ('2', 'travel'), ('3', 'travel'), ('4', 'travel'), ('5', 'travel'), ('6', 'travel'), ('7', 'travel'), ('1', 'empshow'), ('2', 'emp'), ('2', 'travelaudit');
COMMIT;

-- ----------------------------
--  Table structure for `emp`
-- ----------------------------
DROP TABLE IF EXISTS `emp`;
CREATE TABLE `emp` (
  `eid` varchar(50) NOT NULL,
  `lid` varchar(50) default NULL,
  `did` bigint(20) default NULL,
  `ename` varchar(50) default NULL,
  `sal` double default NULL,
  `phone` varchar(20) default NULL,
  `password` varchar(32) default NULL,
  `photo` varchar(200) default NULL,
  `note` text,
  `hiredate` date default NULL,
  `ineid` varchar(50) default NULL,
  `locked` int(11) default '0',
  PRIMARY KEY  (`eid`),
  KEY `fk_lid3` (`lid`),
  KEY `fk_did3` (`did`),
  CONSTRAINT `fk_did3` FOREIGN KEY (`did`) REFERENCES `dept` (`did`),
  CONSTRAINT `fk_lid3` FOREIGN KEY (`lid`) REFERENCES `level` (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `emp`
-- ----------------------------
BEGIN;
INSERT INTO `emp` VALUES ('mldn-chief', 'chief', '1', '老李', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-10-10', null, '0'), ('mldn-dev1', 'manager', '5', '老赵', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-10-14', 'mldn-human', '0'), ('mldn-dev2', 'manager', '6', '老孙', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-10-15', 'mldn-human', '0'), ('mldn-dev3', 'manager', '7', '老孙', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-10-16', 'mldn-human', '0'), ('mldn-finance', 'manager', '3', '老王', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-10-12', 'mldn-human', '0'), ('mldn-human', 'manager', '2', '老张', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-10-11', null, '0'), ('mldn-market', 'manager', '4', '老林', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-10-13', 'mldn-human', '0'), ('mldn1', 'staff', '2', '魔乐科技-1', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-11', 'mldn-human', '0'), ('mldn10', 'staff', '4', '魔乐科技-10', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn1', '0'), ('mldn11', 'staff', '4', '魔乐科技-11', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn1', '0'), ('mldn12', 'staff', '4', '魔乐科技-12', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn1', '0'), ('mldn13', 'staff', '5', '魔乐科技-13', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn14', 'staff', '5', '魔乐科技-14', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn15', 'staff', '5', '魔乐科技-15', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn16', 'staff', '5', '魔乐科技-16', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn17', 'staff', '5', '魔乐科技-17', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn18', 'staff', '6', '魔乐科技-18', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn19', 'staff', '6', '魔乐科技-19', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn2', 'staff', '2', '魔乐科技-2', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-11', 'mldn1', '0'), ('mldn20', 'staff', '6', '魔乐科技-20', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn21', 'staff', '6', '魔乐科技-21', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn22', 'staff', '6', '魔乐科技-22', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn23', 'staff', '6', '魔乐科技-23', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn24', 'staff', '6', '魔乐科技-24', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn25', 'staff', '6', '魔乐科技-25', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn2', '0'), ('mldn26', 'staff', '7', '魔乐科技-26', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn27', 'staff', '7', '魔乐科技-27', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn28', 'staff', '7', '魔乐科技-28', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn29', 'staff', '7', '魔乐科技-29', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn3', 'staff', '3', '魔乐科技-3', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-12', 'mldn1', '0'), ('mldn30', 'staff', '7', '魔乐科技-30', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn31', 'staff', '7', '魔乐科技-31', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn32', 'staff', '7', '魔乐科技-32', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn33', 'staff', '7', '魔乐科技-33', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn34', 'staff', '7', '魔乐科技-34', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn35', 'staff', '7', '魔乐科技-35', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn36', 'staff', '7', '魔乐科技-36', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn37', 'staff', '7', '魔乐科技-37', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn38', 'staff', '7', '魔乐科技-38', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn39', 'staff', '7', '魔乐科技-39', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn4', 'staff', '3', '魔乐科技-4', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-12', 'mldn1', '0'), ('mldn40', 'staff', '7', '魔乐科技-40', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-12-16', 'mldn2', '0'), ('mldn5', 'staff', '3', '魔乐科技-5', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-12', 'mldn1', '0'), ('mldn6', 'staff', '4', '魔乐科技-6', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-13', 'mldn1', '0'), ('mldn7', 'staff', '4', '魔乐科技-7', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-13', 'mldn1', '0'), ('mldn8', 'staff', '4', '魔乐科技-8', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn1', '0'), ('mldn9', 'staff', '4', '魔乐科技-9', '888.99', '01051283346', '2E866BF58289E01583AD418F486A69DF', 'nophoto.png', '很好的员工', '2010-11-15', 'mldn1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `iid` bigint(20) NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `item`
-- ----------------------------
BEGIN;
INSERT INTO `item` VALUES ('1', '扩展新客户'), ('2', '驻外开发'), ('3', '项目维护'), ('4', '系统升级'), ('5', '项目部署');
COMMIT;

-- ----------------------------
--  Table structure for `level`
-- ----------------------------
DROP TABLE IF EXISTS `level`;
CREATE TABLE `level` (
  `lid` varchar(50) NOT NULL default '',
  `title` varchar(50) default NULL,
  `level` int(11) default NULL,
  PRIMARY KEY  (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `level`
-- ----------------------------
BEGIN;
INSERT INTO `level` VALUES ('chief', '总监', '1'), ('manager', '部门经理', '2'), ('staff', '普通员工', '3');
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `rid` varchar(50) NOT NULL default '',
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('emp', '【人事部】雇员信息管理'), ('empshow', '【管理部】雇员信息浏览'), ('travel', '【所有部门】差旅安排'), ('travelaudit', '【人事部】差旅安排');
COMMIT;

-- ----------------------------
--  Table structure for `travel`
-- ----------------------------
DROP TABLE IF EXISTS `travel`;
CREATE TABLE `travel` (
  `tid` bigint(20) NOT NULL auto_increment,
  `seid` varchar(50) default NULL,
  `aeid` varchar(50) default NULL,
  `iid` bigint(20) default NULL,
  `title` varchar(50) default NULL,
  `sdate` date default NULL,
  `edate` date default NULL,
  `subdate` date default NULL,
  `dest` varchar(200) default NULL,
  `audit` int(11) default NULL,
  `note` text,
  `auddate` date default NULL,
  `anote` text,
  `ecount` int(11) default NULL,
  `total` double default NULL,
  PRIMARY KEY  (`tid`),
  KEY `fk_seid9` (`seid`),
  KEY `fk_aeid9` (`aeid`),
  KEY `fk_iid9` (`iid`),
  CONSTRAINT `fk_aeid9` FOREIGN KEY (`aeid`) REFERENCES `emp` (`eid`),
  CONSTRAINT `fk_iid9` FOREIGN KEY (`iid`) REFERENCES `item` (`iid`),
  CONSTRAINT `fk_seid9` FOREIGN KEY (`seid`) REFERENCES `emp` (`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `travel`
-- ----------------------------
BEGIN;
INSERT INTO `travel` VALUES ('2', 'mldn-dev1', 'mldn1', '1', '好好出差吧', '2017-05-25', '2017-05-27', '2017-05-25', '没办法。我也不想辛苦啊。', '1', '真的很重要，有经验的项目经理，一看就知道你们的技术有多少本事（这种项目经理很少，而且处于新旧交替）。', '2017-05-26', '真的通过', '9', '17230'), ('3', 'mldn-dev2', 'mldn1', '1', '北京', '2017-05-25', '2017-05-30', '2017-05-26', 'sadsasd', '1', 'yw', '2017-05-26', '发生的', '4', '234'), ('4', 'mldn-dev2', null, '4', 'sdsads', '2017-05-26', '2017-05-29', null, 'qweqwe', '9', 'qewdasasd', null, null, null, null), ('5', 'mldn-dev1', 'mldn1', '3', '申请信息', '2017-06-01', '2017-06-28', '2017-05-26', '天津', '1', '时间比较长。', '2017-05-26', '可以开始', '4', '9000');
COMMIT;

-- ----------------------------
--  Table structure for `travel_cost`
-- ----------------------------
DROP TABLE IF EXISTS `travel_cost`;
CREATE TABLE `travel_cost` (
  `tcid` bigint(20) NOT NULL auto_increment,
  `tpid` bigint(20) default NULL,
  `tid` bigint(20) default NULL,
  `price` double default NULL,
  `title` varchar(200) default NULL,
  PRIMARY KEY  (`tcid`),
  KEY `fk_tpid10` (`tpid`),
  KEY `fk_tid` (`tid`),
  CONSTRAINT `fk_tid` FOREIGN KEY (`tid`) REFERENCES `travel` (`tid`) ON DELETE CASCADE,
  CONSTRAINT `fk_tpid10` FOREIGN KEY (`tpid`) REFERENCES `type` (`tpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `travel_cost`
-- ----------------------------
BEGIN;
INSERT INTO `travel_cost` VALUES ('1', '1', '2', '9000', '房间服务'), ('2', '3', '2', '8000', '火车'), ('3', '2', '2', '80', '午餐'), ('4', '2', '2', '150', '晚餐'), ('5', '3', '3', '234', 'fasdfsda'), ('6', '2', '5', '9000', '午餐');
COMMIT;

-- ----------------------------
--  Table structure for `travel_emp`
-- ----------------------------
DROP TABLE IF EXISTS `travel_emp`;
CREATE TABLE `travel_emp` (
  `teid` bigint(20) NOT NULL auto_increment,
  `tid` bigint(20) default NULL,
  `eid` varchar(50) default NULL,
  PRIMARY KEY  (`teid`),
  KEY `fk_tid11` (`tid`),
  KEY `fk_eid` (`eid`),
  CONSTRAINT `fk_eid` FOREIGN KEY (`eid`) REFERENCES `emp` (`eid`),
  CONSTRAINT `fk_tid11` FOREIGN KEY (`tid`) REFERENCES `travel` (`tid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `travel_emp`
-- ----------------------------
BEGIN;
INSERT INTO `travel_emp` VALUES ('13', '2', 'mldn16'), ('14', '2', 'mldn13'), ('15', '2', 'mldn14'), ('16', '2', 'mldn15'), ('17', '2', 'mldn3'), ('18', '2', 'mldn4'), ('19', '3', 'mldn22'), ('20', '3', 'mldn21'), ('21', '4', 'mldn6'), ('22', '4', 'mldn7'), ('23', '3', 'mldn-dev1'), ('24', '2', 'mldn18'), ('25', '2', 'mldn19'), ('26', '2', 'mldn20'), ('27', '3', 'mldn24'), ('28', '5', 'mldn13'), ('29', '5', 'mldn15'), ('30', '5', 'mldn26'), ('31', '5', 'mldn28');
COMMIT;

-- ----------------------------
--  Table structure for `type`
-- ----------------------------
DROP TABLE IF EXISTS `type`;
CREATE TABLE `type` (
  `tpid` bigint(20) NOT NULL auto_increment,
  `title` varchar(50) default NULL,
  PRIMARY KEY  (`tpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `type`
-- ----------------------------
BEGIN;
INSERT INTO `type` VALUES ('1', '住宿费'), ('2', '餐费'), ('3', '交通费'), ('4', '油费'), ('5', '其它');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
