/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 172.30.30.224:3306
 Source Schema         : tx_tbxt

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 30/11/2020 17:15:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `QRTZ_CRON_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000175F3BBBB007870707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000175F3BBBB007870707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `QRTZ_JOB_DETAILS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200094C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0007656E6454696D6571007E00094C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000175F3BBBB007870707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'liu1606724599186', 1606727754174, 15000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1606724600000, -1, 5, 'PAUSED', 'CRON', 1606724599000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1606724610000, -1, 5, 'PAUSED', 'CRON', 1606724599000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1606724600000, -1, 5, 'PAUSED', 'CRON', 1606724599000, 0, NULL, 2, '');
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (2, 'sys_zhu_data', '门店主数据递交资料', 'SysZhuData', 'crud', 'com.ruoyi.system', 'system', 'zhudata', '门店主数据递交资料', 'ruoyi', '0', '/', '{\"parentMenuId\":\"3\"}', 'admin', '2020-11-23 15:26:29', '', '2020-11-23 16:11:51', NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_dict_data', '字典数据表', 'SysDictData', 'crud', 'com.ruoyi.system', 'system', 'data', '字典数据', 'ruoyi', '0', '/', NULL, 'admin', '2020-11-24 16:59:33', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (5, 'sys_dict_type', '字典类型表', 'SysDictType', 'crud', 'com.ruoyi.system', 'system', 'type', '字典类型', 'ruoyi', '0', '/', NULL, 'admin', '2020-11-24 17:01:00', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 'sys_config', '参数配置表', 'SysConfig', 'crud', 'com.ruoyi.system', 'system', 'config', '参数配置', 'ruoyi', '0', '/', NULL, 'admin', '2020-11-24 17:05:48', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (8, 'sys_man_data', '主数据递交', 'SysManData', 'crud', 'com.ruoyi.system', 'system', 'man_fico_it', 'man_fico_it', 'liu', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55', NULL);
INSERT INTO `gen_table` VALUES (10, 'sys_man_list', 'man_list', 'SysManList', 'crud', 'com.ruoyi.system', 'system', 'list_man', 'list_man', 'ruoyi', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29', NULL);
INSERT INTO `gen_table` VALUES (11, 'sys_man_list_data', '主数据进度表1', 'SysManListData', 'crud', 'com.ruoyi.system', 'system', 'sys_man_list_data', 'sys_man_list_data', 'ruoyi', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17', NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (15, '2', 'id', 'id ', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-23 15:26:29', '', '2020-11-23 16:11:51');
INSERT INTO `gen_table_column` VALUES (16, '2', 'zhu_orid', '公司编码', 'varchar(50)', 'String', 'zhuOrid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-11-23 15:26:29', '', '2020-11-23 16:11:51');
INSERT INTO `gen_table_column` VALUES (17, '2', 'zhu_name', '公司名称', 'varchar(50)', 'String', 'zhuName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2020-11-23 15:26:29', '', '2020-11-23 16:11:51');
INSERT INTO `gen_table_column` VALUES (18, '2', 'zhu_kes', '公司核算', 'varchar(50)', 'String', 'zhuKes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-23 15:26:29', '', '2020-11-23 16:11:51');
INSERT INTO `gen_table_column` VALUES (19, '2', 'zhu_md', '门店编码', 'varchar(50)', 'String', 'zhuMd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-11-23 15:26:29', '', '2020-11-23 16:11:51');
INSERT INTO `gen_table_column` VALUES (20, '2', 'zhu_mdname', '门店名称', 'varchar(50)', 'String', 'zhuMdname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2020-11-23 15:26:29', '', '2020-11-23 16:11:51');
INSERT INTO `gen_table_column` VALUES (21, '2', 'zhu_type', '门店类型', 'varchar(50)', 'String', 'zhuType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'zhu_data', 7, 'admin', '2020-11-23 15:26:29', '', '2020-11-23 16:11:51');
INSERT INTO `gen_table_column` VALUES (22, '2', 'zhu_chen', '成本中心', 'varchar(50)', 'String', 'zhuChen', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-11-23 15:26:29', '', '2020-11-23 16:11:51');
INSERT INTO `gen_table_column` VALUES (23, '2', 'zhu_lilr', '利润中心', 'varchar(50)', 'String', 'zhuLilr', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-11-23 15:26:29', '', '2020-11-23 16:11:51');
INSERT INTO `gen_table_column` VALUES (24, '2', 'zhu_remark', '地址备注', 'varchar(50)', 'String', 'zhuRemark', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-11-23 15:26:29', '', '2020-11-23 16:11:51');
INSERT INTO `gen_table_column` VALUES (35, '4', 'dict_code', '字典编码', 'bigint(20)', 'Long', 'dictCode', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '4', 'dict_sort', '字典排序', 'int(4)', 'Integer', 'dictSort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '4', 'dict_label', '字典标签', 'varchar(100)', 'String', 'dictLabel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '4', 'dict_value', '字典键值', 'varchar(100)', 'String', 'dictValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '4', 'dict_type', '字典类型', 'varchar(100)', 'String', 'dictType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '4', 'css_class', '样式属性（其他样式扩展）', 'varchar(100)', 'String', 'cssClass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '4', 'list_class', '表格回显样式', 'varchar(100)', 'String', 'listClass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, '4', 'is_default', '是否默认（Y是 N否）', 'char(1)', 'String', 'isDefault', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, '4', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (44, '4', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (45, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (46, '4', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (47, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (48, '4', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 14, 'admin', '2020-11-24 16:59:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (49, '5', 'dict_id', '字典主键', 'bigint(20)', 'Long', 'dictId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-24 17:01:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (50, '5', 'dict_name', '字典名称', 'varchar(100)', 'String', 'dictName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-24 17:01:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (51, '5', 'dict_type', '字典类型', 'varchar(100)', 'String', 'dictType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2020-11-24 17:01:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (52, '5', 'status', '状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2020-11-24 17:01:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (53, '5', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 5, 'admin', '2020-11-24 17:01:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (54, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 6, 'admin', '2020-11-24 17:01:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (55, '5', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2020-11-24 17:01:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (56, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2020-11-24 17:01:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (57, '5', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 9, 'admin', '2020-11-24 17:01:00', '', NULL);
INSERT INTO `gen_table_column` VALUES (58, '6', 'config_id', '参数主键', 'int(5)', 'Integer', 'configId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-24 17:05:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (59, '6', 'config_name', '参数名称', 'varchar(100)', 'String', 'configName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2020-11-24 17:05:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (60, '6', 'config_key', '参数键名', 'varchar(100)', 'String', 'configKey', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-24 17:05:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (61, '6', 'config_value', '参数键值', 'varchar(500)', 'String', 'configValue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'textarea', '', 4, 'admin', '2020-11-24 17:05:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (62, '6', 'config_type', '系统内置（Y是 N否）', 'char(1)', 'String', 'configType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2020-11-24 17:05:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, '6', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2020-11-24 17:05:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2020-11-24 17:05:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, '6', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2020-11-24 17:05:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2020-11-24 17:05:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, '6', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2020-11-24 17:05:48', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, '8', 'id', '序列', 'int(11)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (82, '8', 'order_id', '创建订单', 'varchar(50)', 'String', 'orderId', '0', '0', NULL, NULL, NULL, '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (83, '8', 'off_code', '公司代码', 'varchar(100)', 'String', 'offCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (84, '8', 'off_name', '公司名称', 'varchar(100)', 'String', 'offName', '0', '0', NULL, NULL, NULL, '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (85, '8', 'off_accanting', '核算方式', 'varchar(100)', 'String', 'offAccanting', '0', '0', NULL, NULL, NULL, '1', '1', 'EQ', 'select', 'sys_accunting', 5, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (86, '8', 'shop_code', '门店信息', 'varchar(100)', 'String', 'shopCode', '0', '0', NULL, NULL, NULL, '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (87, '8', 'shop_name', '门店名称', 'varchar(100)', 'String', 'shopName', '0', '0', NULL, NULL, NULL, '1', '1', 'LIKE', 'input', '', 7, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (88, '8', 'shop_type', '门店类型', 'varchar(100)', 'String', 'shopType', '0', '0', NULL, NULL, NULL, '1', '1', 'EQ', 'select', 'zhu_data', 8, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (89, '8', 'costcenter', '成本中心', 'varchar(100)', 'String', 'costcenter', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (90, '8', 'profitcenter', '利润中心', 'varchar(100)', 'String', 'profitcenter', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (91, '8', 'shop_address', '门店地址', 'varchar(100)', 'String', 'shopAddress', '0', '0', NULL, NULL, NULL, '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (92, '8', 'off_fico', '财务确认', 'varchar(100)', 'String', 'offFico', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'fico', 12, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (93, '8', 'off_it', 'it确认', 'varchar(100)', 'String', 'offIt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'ITok', 13, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (94, '8', 'beiyong1', '门店编码', 'varchar(100)', 'String', 'beiyong1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (95, '8', 'beiyong2', '备用2', 'varchar(100)', 'String', 'beiyong2', '0', '0', NULL, NULL, NULL, '1', '1', 'EQ', 'input', '', 15, 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55');
INSERT INTO `gen_table_column` VALUES (112, '10', 'id', 'id', 'int(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (113, '10', 'order_id', '订单id', 'varchar(200)', 'String', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (114, '10', 'suer_authority', '用户权限申请', 'varchar(255)', 'String', 'suerAuthority', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (115, '10', 'fico_confi', '财务确认', 'varchar(255)', 'String', 'ficoConfi', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (116, '10', 'it_confi', 'it确认', 'varchar(255)', 'String', 'itConfi', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (117, '10', 'bill_confi', '确认', 'varchar(255)', 'String', 'billConfi', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (118, '10', 'pos_confi', 'pos确认', 'varchar(255)', 'String', 'posConfi', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (119, '10', 'supply_price', '供货价确认', 'varchar(10)', 'String', 'supplyPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (120, '10', 'retail_price', '零售价确认', 'varchar(10)', 'String', 'retailPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (121, '10', 'man_dataone', '主数据确认1', 'varchar(255)', 'String', 'manDataone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (122, '10', 'man_datatwo', '主数据确认2', 'varchar(255)', 'String', 'manDatatwo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (123, '10', 'gu1', '备用1', 'varchar(255)', 'String', 'gu1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (124, '10', 'gu2', '备用1', 'varchar(255)', 'String', 'gu2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (125, '10', 'gu3', '备用1', 'varchar(255)', 'String', 'gu3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (126, '10', 'gu4', '备用1', 'varchar(255)', 'String', 'gu4', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (127, '10', 'gu5', '备用1', 'varchar(255)', 'String', 'gu5', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29');
INSERT INTO `gen_table_column` VALUES (128, '11', 'id', 'id', 'int(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (129, '11', 'order_id', '订单id', 'varchar(200)', 'String', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (130, '11', 'suer_authority', '用户权限申请', 'varchar(255)', 'String', 'suerAuthority', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (131, '11', 'fico_confi', '财务确认', 'varchar(255)', 'String', 'ficoConfi', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (132, '11', 'it_confi', 'it确认', 'varchar(255)', 'String', 'itConfi', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (133, '11', 'bill_confi', '确认', 'varchar(255)', 'String', 'billConfi', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (134, '11', 'pos_confi', 'pos确认', 'varchar(255)', 'String', 'posConfi', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (135, '11', 'supply_price', '供货价确认', 'varchar(10)', 'String', 'supplyPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (136, '11', 'retail_price', '零售价确认', 'varchar(10)', 'String', 'retailPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (137, '11', 'man_dataone', '主数据确认1', 'varchar(255)', 'String', 'manDataone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (138, '11', 'man_datatwo', '主数据确认2', 'varchar(255)', 'String', 'manDatatwo', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (139, '11', 'gu1', '备用1', 'varchar(255)', 'String', 'gu1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (140, '11', 'gu2', '备用1', 'varchar(255)', 'String', 'gu2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (141, '11', 'gu3', '备用1', 'varchar(255)', 'String', 'gu3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (142, '11', 'gu4', '备用1', 'varchar(255)', 'String', 'gu4', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
INSERT INTO `gen_table_column` VALUES (143, '11', 'gu5', '备用1', 'varchar(255)', 'String', 'gu5', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2020-11-23 14:12:48', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2020-11-23 14:12:48', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2020-11-23 14:12:48', '', NULL, '深色主题theme-dark，浅色主题theme-light');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2020-11-23 14:12:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '城市特许', '1', 'zhu_data', NULL, NULL, 'N', '0', 'admin', '2020-11-23 16:06:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 0, '内创特许', '2', 'zhu_data', NULL, NULL, 'N', '0', 'admin', '2020-11-23 16:06:30', 'admin', '2020-11-23 16:23:04', NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '托管特许', '3', 'zhu_data', NULL, NULL, 'N', '0', 'admin', '2020-11-23 16:07:22', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, '自营特许', '4', 'zhu_data', NULL, NULL, 'N', '0', 'admin', '2020-11-23 16:23:24', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (114, 0, '一般纳税人', '1', 'sys_accunting', NULL, NULL, 'N', '0', 'admin', '2020-11-28 17:09:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (115, 0, '小规模', '2', 'sys_accunting', NULL, NULL, 'N', '0', 'admin', '2020-11-28 17:09:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (116, 1, '是', '1', 'fico', NULL, NULL, 'N', '0', 'admin', '2020-11-29 16:11:22', 'admin', '2020-11-29 16:46:59', NULL);
INSERT INTO `sys_dict_data` VALUES (117, 0, '否', '0', 'fico', NULL, NULL, 'N', '0', 'admin', '2020-11-29 16:11:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (118, 1, '是', '1', 'ITok', NULL, NULL, 'N', '0', 'admin', '2020-11-29 16:11:49', 'admin', '2020-11-29 16:47:12', NULL);
INSERT INTO `sys_dict_data` VALUES (119, 0, '否', '0', 'ITok', NULL, NULL, 'N', '0', 'admin', '2020-11-29 16:11:55', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2020-11-23 14:12:47', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '门店属性', 'zhu_data', '0', 'admin', '2020-11-23 16:05:50', '', NULL, '门店属性');
INSERT INTO `sys_dict_type` VALUES (101, '核算方式', 'sys_accunting', '0', 'admin', '2020-11-28 17:09:04', '', NULL, '核算方式');
INSERT INTO `sys_dict_type` VALUES (102, '财务确认', 'fico', '0', 'admin', '2020-11-29 16:10:41', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (103, 'IT确认', 'ITok', '0', 'admin', '2020-11-29 16:11:06', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2020-11-23 14:12:48', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2020-11-23 14:12:48', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2020-11-23 14:12:48', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-23 14:52:30');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-11-23 15:44:33');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-11-23 15:44:37');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-11-23 15:44:41');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-23 15:44:46');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-23 16:11:01');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-23 16:21:03');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-24 16:13:49');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-11-24 16:22:23');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-24 16:22:28');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-11-24 16:33:11');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-24 16:33:15');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-24 16:42:06');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-11-28 16:54:04');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-29 11:49:38');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '退出成功', '2020-11-29 11:56:53');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-29 11:56:56');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '退出成功', '2020-11-29 11:57:04');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-29 13:13:23');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-29 13:25:55');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '退出成功', '2020-11-29 13:28:05');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-29 13:28:13');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '退出成功', '2020-11-29 13:31:41');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-29 13:31:49');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-29 13:36:12');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-29 14:31:33');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-30 14:07:50');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-30 14:32:38');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-30 15:21:16');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-30 15:38:11');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '退出成功', '2020-11-30 15:45:37');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-30 15:45:41');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-11-30 16:05:44');
COMMIT;

-- ----------------------------
-- Table structure for sys_man_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_man_data`;
CREATE TABLE `sys_man_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序列',
  `order_id` varchar(50) DEFAULT NULL COMMENT '创建订单',
  `off_code` varchar(100) DEFAULT NULL COMMENT '公司代码',
  `off_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `off_accanting` varchar(100) DEFAULT NULL COMMENT '核算方式',
  `shop_code` varchar(100) DEFAULT NULL COMMENT '门店信息',
  `shop_name` varchar(100) DEFAULT NULL COMMENT '门店名称',
  `shop_type` varchar(100) DEFAULT NULL COMMENT '门店类型',
  `costcenter` varchar(100) DEFAULT NULL COMMENT '成本中心',
  `profitcenter` varchar(100) DEFAULT NULL COMMENT '利润中心',
  `shop_address` varchar(100) DEFAULT NULL COMMENT '门店地址',
  `off_fico` varchar(100) DEFAULT NULL COMMENT '财务确认',
  `off_it` varchar(100) DEFAULT NULL COMMENT 'it确认',
  `beiyong1` varchar(100) DEFAULT NULL COMMENT '备用1',
  `beiyong2` varchar(100) DEFAULT NULL COMMENT '备用2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_man_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_man_data` VALUES (2, '202011294dcee38fda9542b49ba84ed8ecf21748', '7023', '22', '1', '11', '22', '1', '70230011', '70230012', '11', '1', '1', 'WH0014', '11');
INSERT INTO `sys_man_data` VALUES (3, '202011294dcee38fda9542b49ba84ed8ecf21748', '7A001', '周黑鸭第三托管式特许', '1', '211', '22', '1', '7A00101', '7A00101', '22', '1', '1', '7A00101', NULL);
INSERT INTO `sys_man_data` VALUES (4, '20201130a2aca0d5de364015a8e0b85423baa940', '7A002', '门店1', '1', '222', '11', '1', '7A00102', '7A00102', '222', '1', '1', '7A00102', NULL);
INSERT INTO `sys_man_data` VALUES (5, '20201130a2aca0d5de364015a8e0b85423baa940', NULL, '延安分公司', '1', '信息', '门店名称', '2', NULL, NULL, '延安大街', NULL, NULL, NULL, NULL);
INSERT INTO `sys_man_data` VALUES (6, '20201130ea0c665fec1a45aba32e326aad32e352', NULL, '周黑鸭11', '1', '23111', '周黑鸭11', '1', NULL, NULL, '周黑鸭11', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_man_list
-- ----------------------------
DROP TABLE IF EXISTS `sys_man_list`;
CREATE TABLE `sys_man_list` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` varchar(200) DEFAULT NULL COMMENT '订单id',
  `suer_authority` varchar(255) DEFAULT NULL COMMENT '用户权限申请',
  `fico_confi` varchar(255) DEFAULT NULL COMMENT '财务确认',
  `it_confi` varchar(255) DEFAULT NULL COMMENT 'it确认',
  `bill_confi` varchar(255) DEFAULT NULL COMMENT '确认',
  `pos_confi` varchar(255) DEFAULT NULL COMMENT 'pos确认',
  `supply_price` varchar(10) DEFAULT NULL COMMENT '供货价确认',
  `retail_price` varchar(10) DEFAULT NULL COMMENT '零售价确认',
  `man_dataone` varchar(255) DEFAULT NULL COMMENT '主数据确认1',
  `man_datatwo` varchar(255) DEFAULT NULL COMMENT '主数据确认2',
  `gu1` varchar(255) DEFAULT NULL COMMENT '备用1',
  `gu2` varchar(255) DEFAULT NULL COMMENT '备用1',
  `gu3` varchar(255) DEFAULT NULL COMMENT '备用1',
  `gu4` varchar(255) DEFAULT NULL COMMENT '备用1',
  `gu5` varchar(255) DEFAULT NULL COMMENT '备用1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_man_list
-- ----------------------------
BEGIN;
INSERT INTO `sys_man_list` VALUES (1, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_man_list_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_man_list_data`;
CREATE TABLE `sys_man_list_data` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` varchar(200) DEFAULT NULL COMMENT '订单id',
  `suer_authority` varchar(255) DEFAULT NULL COMMENT '用户权限申请',
  `fico_confi` varchar(255) DEFAULT NULL COMMENT '财务确认',
  `it_confi` varchar(255) DEFAULT NULL COMMENT 'it确认',
  `bill_confi` varchar(255) DEFAULT NULL COMMENT '确认',
  `pos_confi` varchar(255) DEFAULT NULL COMMENT 'pos确认',
  `supply_price` varchar(10) DEFAULT NULL COMMENT '供货价确认',
  `retail_price` varchar(10) DEFAULT NULL COMMENT '零售价确认',
  `man_dataone` varchar(255) DEFAULT NULL COMMENT '主数据确认1',
  `man_datatwo` varchar(255) DEFAULT NULL COMMENT '主数据确认2',
  `gu1` varchar(255) DEFAULT NULL COMMENT '备用1',
  `gu2` varchar(255) DEFAULT NULL COMMENT '备用1',
  `gu3` varchar(255) DEFAULT NULL COMMENT '备用1',
  `gu4` varchar(255) DEFAULT NULL COMMENT '备用1',
  `gu5` varchar(255) DEFAULT NULL COMMENT '备用1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_man_list_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_man_list_data` VALUES (3, '20201130a2aca0d5de364015a8e0b85423baa940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计2数据', NULL, NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (4, '20201130ea0c665fec1a45aba32e326aad32e352', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2039 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2020-11-23 14:12:43', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2020-11-23 14:12:43', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2020-11-23 14:12:43', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2020-11-23 14:12:43', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2020-11-23 14:12:43', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2020-11-23 14:12:43', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2020-11-23 14:12:43', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2020-11-23 14:12:43', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2020-11-23 14:12:43', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2020-11-23 14:12:43', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2020-11-23 14:12:43', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2020-11-23 14:12:43', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2020-11-23 14:12:43', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2020-11-23 14:12:43', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2020-11-23 14:12:44', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2020-11-23 14:12:44', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2020-11-23 14:12:44', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2020-11-23 14:12:44', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2020-11-23 14:12:44', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2020-11-23 14:12:44', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2020-11-23 14:12:44', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2020-11-23 14:12:44', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2020-11-23 14:12:44', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2020-11-23 14:12:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2020-11-23 14:12:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '门店主数据递交资料', 3, 1, 'zhudata', 'system/zhudata/index', 1, 0, 'C', '0', '0', 'system:zhudata:list', 'chart', 'admin', '2020-11-23 15:30:46', 'admin', '2020-11-23 15:38:26', '门店主数据递交资料菜单');
INSERT INTO `sys_menu` VALUES (2001, '门店主数据递交资料查询', 2000, 1, '#', '', 1, 0, 'F', '0', '0', 'system:zhudata:query', '#', 'admin', '2020-11-23 15:30:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2002, '门店主数据递交资料新增', 2000, 2, '#', '', 1, 0, 'F', '0', '0', 'system:zhudata:add', '#', 'admin', '2020-11-23 15:30:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '门店主数据递交资料修改', 2000, 3, '#', '', 1, 0, 'F', '0', '0', 'system:zhudata:edit', '#', 'admin', '2020-11-23 15:30:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '门店主数据递交资料删除', 2000, 4, '#', '', 1, 0, 'F', '0', '0', 'system:zhudata:remove', '#', 'admin', '2020-11-23 15:30:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '门店主数据递交资料导出', 2000, 5, '#', '', 1, 0, 'F', '0', '0', 'system:zhudata:export', '#', 'admin', '2020-11-23 15:30:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '服务模块', 0, 5, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'server', 'admin', '2020-11-23 16:28:23', 'admin', '2020-11-24 16:23:34', '');
INSERT INTO `sys_menu` VALUES (2008, '递交主数据', 2006, 1, 'man_data', 'system/man_data/index', 1, 0, 'C', '0', '0', 'system:man_data:list', '#', 'admin', '2020-11-29 13:24:37', 'admin', '2020-11-29 16:49:01', 'man_data菜单');
INSERT INTO `sys_menu` VALUES (2009, 'FICO_IT赋值', 2006, 1, 'man_fico_it', 'system/man_fico_it/index', 1, 0, 'C', '0', '0', 'system:man_fico_it:list', '#', 'admin', '2020-11-29 16:22:41', 'admin', '2020-11-29 16:49:25', 'man_fico_it菜单');
INSERT INTO `sys_menu` VALUES (2010, 'man_fico_it查询', 2009, 1, '#', '', 1, 0, 'F', '0', '0', 'system:man_fico_it:query', '#', 'admin', '2020-11-29 16:22:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, 'man_fico_it新增', 2009, 2, '#', '', 1, 0, 'F', '0', '0', 'system:man_fico_it:add', '#', 'admin', '2020-11-29 16:22:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, 'man_fico_it修改', 2009, 3, '#', '', 1, 0, 'F', '0', '0', 'system:man_fico_it:edit', '#', 'admin', '2020-11-29 16:22:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, 'man_fico_it删除', 2009, 4, '#', '', 1, 0, 'F', '0', '0', 'system:man_fico_it:remove', '#', 'admin', '2020-11-29 16:22:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, 'man_fico_it导出', 2009, 5, '#', '', 1, 0, 'F', '0', '0', 'system:man_fico_it:export', '#', 'admin', '2020-11-29 16:22:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, 'list_man', 2006, 1, 'list_man', 'system/list_man/index', 1, 0, 'C', '0', '0', 'system:list_man:list', '#', 'admin', '2020-11-30 15:42:27', '', NULL, 'list_man菜单');
INSERT INTO `sys_menu` VALUES (2028, 'list_man查询', 2027, 1, '#', '', 1, 0, 'F', '0', '0', 'system:list_man:query', '#', 'admin', '2020-11-30 15:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, 'list_man新增', 2027, 2, '#', '', 1, 0, 'F', '0', '0', 'system:list_man:add', '#', 'admin', '2020-11-30 15:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, 'list_man修改', 2027, 3, '#', '', 1, 0, 'F', '0', '0', 'system:list_man:edit', '#', 'admin', '2020-11-30 15:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, 'list_man删除', 2027, 4, '#', '', 1, 0, 'F', '0', '0', 'system:list_man:remove', '#', 'admin', '2020-11-30 15:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, 'list_man导出', 2027, 5, '#', '', 1, 0, 'F', '0', '0', 'system:list_man:export', '#', 'admin', '2020-11-30 15:42:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, 'sys_man_list_data', 2006, 1, 'sys_man_list_data', 'system/sys_man_list_data/index', 1, 0, 'C', '0', '0', 'system:sys_man_list_data:list', '#', 'admin', '2020-11-30 16:02:54', '', NULL, 'sys_man_list_data菜单');
INSERT INTO `sys_menu` VALUES (2034, 'sys_man_list_data查询', 2033, 1, '#', '', 1, 0, 'F', '0', '0', 'system:sys_man_list_data:query', '#', 'admin', '2020-11-30 16:02:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, 'sys_man_list_data新增', 2033, 2, '#', '', 1, 0, 'F', '0', '0', 'system:sys_man_list_data:add', '#', 'admin', '2020-11-30 16:02:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, 'sys_man_list_data修改', 2033, 3, '#', '', 1, 0, 'F', '0', '0', 'system:sys_man_list_data:edit', '#', 'admin', '2020-11-30 16:02:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, 'sys_man_list_data删除', 2033, 4, '#', '', 1, 0, 'F', '0', '0', 'system:sys_man_list_data:remove', '#', 'admin', '2020-11-30 16:02:54', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, 'sys_man_list_data导出', 2033, 5, '#', '', 1, 0, 'F', '0', '0', 'system:sys_man_list_data:export', '#', 'admin', '2020-11-30 16:02:54', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2020-11-23 14:12:48', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2020-11-23 14:12:48', '', NULL, '管理员');
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (100, '字典类型', 9, 'com.ruoyi.web.controller.system.SysDictTypeController.clearCache()', 'DELETE', 1, 'admin', NULL, '/system/dict/type/clearCache', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 14:57:54');
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_dict_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 14:58:49');
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"dictCode\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"门店编码\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606114729000,\"tableId\":1,\"pk\":true,\"columnName\":\"dict_code\"},{\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"dictSort\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"字典排序\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606114729000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"dict_sort\"},{\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"dictLabel\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"门店关联公司\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606114729000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"dict_label\"},{\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"dictValue\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"字典键值\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606114729000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"dict_value\"},{\"usableCol', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 15:06:56');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-23 15:07:01');
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/1', '127.0.0.1', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 15:26:10');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_zhu_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 15:26:29');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id \",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606116389000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"zhuOrid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司编码\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606116389000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"zhu_orid\"},{\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"zhuName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司名称\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606116389000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"zhu_name\"},{\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"zhuKes\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司核算\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606116389000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"zhu_kes\"},{\"usableColumn\":false,\"columnId\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 15:27:22');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-23 15:28:18');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"chart\",\"orderNum\":\"1\",\"menuName\":\"门店主数据递交资料\",\"params\":{},\"parentId\":3,\"isCache\":\"0\",\"path\":\"zhudata\",\"component\":\"system/zhudata/index\",\"children\":[],\"createTime\":1606116646000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:zhudata:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 15:38:26');
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-23 15:47:10');
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_config', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 15:47:16');
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction\r\n### The error may exist in file [G:\\ruoyi-vue1123\\RuoYi-Vue\\ruoyi-generator\\target\\classes\\mapper\\generator\\GenTableMapper.xml]\r\n### The error may involve com.ruoyi.generator.mapper.GenTableMapper.deleteGenTableByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from gen_table where table_id in           (               ?          )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction\n; Lock wait timeout exceeded; try restarting transaction; nested exception is com.mysql.cj.jdbc.exceptions.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction', '2020-11-23 15:48:35');
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction\r\n### The error may exist in file [G:\\ruoyi-vue1123\\RuoYi-Vue\\ruoyi-generator\\target\\classes\\mapper\\generator\\GenTableMapper.xml]\r\n### The error may involve com.ruoyi.generator.mapper.GenTableMapper.deleteGenTableByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from gen_table where table_id in           (               ?          )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction\n; Lock wait timeout exceeded; try restarting transaction; nested exception is com.mysql.cj.jdbc.exceptions.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction', '2020-11-23 15:48:38');
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction\r\n### The error may exist in file [G:\\ruoyi-vue1123\\RuoYi-Vue\\ruoyi-generator\\target\\classes\\mapper\\generator\\GenTableMapper.xml]\r\n### The error may involve com.ruoyi.generator.mapper.GenTableMapper.deleteGenTableByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from gen_table where table_id in           (               ?          )\r\n### Cause: com.mysql.cj.jdbc.exceptions.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction\n; Lock wait timeout exceeded; try restarting transaction; nested exception is com.mysql.cj.jdbc.exceptions.MySQLTransactionRollbackException: Lock wait timeout exceeded; try restarting transaction', '2020-11-23 15:48:51');
INSERT INTO `sys_oper_log` VALUES (114, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/3', '127.0.0.1', '内网IP', '{tableIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 15:50:19');
INSERT INTO `sys_oper_log` VALUES (115, '门店主数据递交资料', 1, 'com.ruoyi.system.controller.SysZhuDataController.add()', 'POST', 1, 'admin', NULL, '/system/zhudata', '127.0.0.1', '内网IP', '{\"zhuMdname\":\"22\",\"zhuOrid\":\"周黑鸭\",\"zhuType\":\"\",\"params\":{},\"zhuKes\":\"周黑鸭\",\"zhuLilr\":\"22\",\"zhuChen\":\"22\",\"zhuMd\":\"222\",\"zhuName\":\"周黑鸭\",\"zhuRemark\":\"湖北东西湖南13支沟\",\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:01:06');
INSERT INTO `sys_oper_log` VALUES (116, '门店主数据递交资料', 5, 'com.ruoyi.system.controller.SysZhuDataController.export()', 'GET', 1, 'admin', NULL, '/system/zhudata/export', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"ff0dc8d7-43f5-41d5-a259-71cf23ffe81a_zhudata.xlsx\",\"code\":200}', 0, NULL, '2020-11-23 16:01:22');
INSERT INTO `sys_oper_log` VALUES (117, '门店主数据递交资料', 3, 'com.ruoyi.system.controller.SysZhuDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/zhudata/1', '127.0.0.1', '内网IP', '{ids=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:01:43');
INSERT INTO `sys_oper_log` VALUES (118, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"remark\":\"门店属性\",\"params\":{},\"dictType\":\"zhu_data\",\"createBy\":\"admin\",\"dictName\":\"门店属性\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:05:50');
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"城市特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:06:20');
INSERT INTO `sys_oper_log` VALUES (120, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"内床店特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:06:30');
INSERT INTO `sys_oper_log` VALUES (121, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"内床店特许\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1606118790000,\"dictCode\":101,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:06:37');
INSERT INTO `sys_oper_log` VALUES (122, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"托管特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:10:22');
INSERT INTO `sys_oper_log` VALUES (123, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"托管特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:10:22');
INSERT INTO `sys_oper_log` VALUES (124, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"托管特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:10:22');
INSERT INTO `sys_oper_log` VALUES (125, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"2\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:10:22');
INSERT INTO `sys_oper_log` VALUES (126, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"托管特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:10:22');
INSERT INTO `sys_oper_log` VALUES (127, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"托管特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:10:22');
INSERT INTO `sys_oper_log` VALUES (128, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"托管特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:10:22');
INSERT INTO `sys_oper_log` VALUES (129, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"托管特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:10:22');
INSERT INTO `sys_oper_log` VALUES (130, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"托管特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:10:22');
INSERT INTO `sys_oper_log` VALUES (131, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"托管特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:10:22');
INSERT INTO `sys_oper_log` VALUES (132, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"托管特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:10:22');
INSERT INTO `sys_oper_log` VALUES (133, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":15,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id \",\"updateTime\":1606116442000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606116389000,\"tableId\":2,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":16,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"zhuOrid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司编码\",\"isQuery\":\"1\",\"updateTime\":1606116442000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606116389000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"zhu_orid\"},{\"usableColumn\":false,\"columnId\":17,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"zhuName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司名称\",\"isQuery\":\"1\",\"updateTime\":1606116442000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606116389000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"zhu_name\"},{\"usableColumn\":false,\"columnId\":18,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"zhuKes\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司核算\",\"isQuery\":\"1\",\"updateTime\":1606116442000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:11:51');
INSERT INTO `sys_oper_log` VALUES (134, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_zhu_data', '127.0.0.1', '内网IP', '{tableName=sys_zhu_data}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:11:54');
INSERT INTO `sys_oper_log` VALUES (135, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_zhu_data', '127.0.0.1', '内网IP', '{tableName=sys_zhu_data}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:12:06');
INSERT INTO `sys_oper_log` VALUES (136, '门店主数据递交资料', 2, 'com.ruoyi.system.controller.SysZhuDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/zhudata', '127.0.0.1', '内网IP', '{\"zhuMdname\":\"22\",\"zhuOrid\":\"周黑鸭\",\"zhuType\":\"\",\"params\":{},\"zhuKes\":\"周黑鸭\",\"zhuLilr\":\"22\",\"zhuChen\":\"22\",\"zhuMd\":\"222\",\"zhuName\":\"周黑鸭\",\"zhuRemark\":\"湖北东西湖南13支沟\",\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:12:17');
INSERT INTO `sys_oper_log` VALUES (137, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_zhu_data', '127.0.0.1', '内网IP', '{tableName=sys_zhu_data}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:12:23');
INSERT INTO `sys_oper_log` VALUES (138, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/109,108,107,106,105,104,103', '127.0.0.1', '内网IP', '{dictCodes=109,108,107,106,105,104,103}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:22:42');
INSERT INTO `sys_oper_log` VALUES (139, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/dict/data/111,112,110', '127.0.0.1', '内网IP', '{dictCodes=111,112,110}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:22:53');
INSERT INTO `sys_oper_log` VALUES (140, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"内创特许\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1606118790000,\"dictCode\":101,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:23:04');
INSERT INTO `sys_oper_log` VALUES (141, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"dictSort\":0,\"params\":{},\"dictType\":\"zhu_data\",\"dictLabel\":\"自营特许\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:23:24');
INSERT INTO `sys_oper_log` VALUES (142, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"6\",\"menuName\":\"服务\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"service\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:28:23');
INSERT INTO `sys_oper_log` VALUES (143, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"5\",\"menuName\":\"服务\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"service\",\"children\":[],\"createTime\":1606120103000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:28:32');
INSERT INTO `sys_oper_log` VALUES (144, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"5\",\"menuName\":\"服务模块\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"service\",\"children\":[],\"createTime\":1606120103000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-23 16:28:50');
INSERT INTO `sys_oper_log` VALUES (145, '门店主数据递交资料', 2, 'com.ruoyi.system.controller.SysZhuDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/zhudata', '127.0.0.1', '内网IP', '{\"zhuMdname\":\"22\",\"zhuOrid\":\"周黑鸭\",\"zhuType\":\"2\",\"params\":{},\"zhuKes\":\"周黑鸭\",\"zhuLilr\":\"22\",\"zhuChen\":\"22\",\"zhuMd\":\"222\",\"zhuName\":\"周黑鸭\",\"zhuRemark\":\"湖北东西湖南13支沟\",\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:14:24');
INSERT INTO `sys_oper_log` VALUES (146, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"5\",\"menuName\":\"服务模块\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"service\",\"children\":[],\"createTime\":1606120103000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:15:45');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"5\",\"menuName\":\"服务模块\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"service\",\"children\":[],\"createTime\":1606120103000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:15:55');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"1\",\"menuName\":\"财务填写\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"caiwu\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:17:30');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"1\",\"menuName\":\"财务填写\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"caiwu\",\"component\":\"service/caiwu\",\"children\":[],\"createTime\":1606205850000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"perms\":\"service:caiwu\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:19:09');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"1\",\"menuName\":\"财务填写\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"caiwu\",\"component\":\"tool/swagger/list\",\"children\":[],\"createTime\":1606205850000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"perms\":\"tool:swagger:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:20:29');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"1\",\"menuName\":\"财务填写\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"tool\",\"component\":\"tool/swagger/list\",\"children\":[],\"createTime\":1606205850000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"perms\":\"tool:swagger:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:21:00');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"1\",\"menuName\":\"财务填写\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"swagger\",\"component\":\"tool/swagger/list\",\"children\":[],\"createTime\":1606205850000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"perms\":\"tool:swagger:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:22:05');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"checkbox\",\"orderNum\":\"1\",\"menuName\":\"财务填写\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"swagger\",\"component\":\"tool/swagger/list\",\"children\":[],\"createTime\":1606205850000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"perms\":\"tool:swagger:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:23:07');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"server\",\"orderNum\":\"5\",\"menuName\":\"服务模块\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"tool\",\"children\":[],\"createTime\":1606120103000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:23:34');
INSERT INTO `sys_oper_log` VALUES (155, '门店主数据递交资料', 2, 'com.ruoyi.system.controller.SysZhuDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/zhudata', '127.0.0.1', '内网IP', '{\"zhuMdname\":\"22\",\"zhuOrid\":\"周黑鸭\",\"zhuType\":\"2\",\"params\":{},\"zhuKes\":\"周黑鸭\",\"zhuLilr\":\"22\",\"zhuChen\":\"22\",\"zhuMd\":\"222\",\"zhuName\":\"周黑鸭\",\"zhuRemark\":\"湖北东西湖南13支沟\",\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:46:33');
INSERT INTO `sys_oper_log` VALUES (156, '门店主数据递交资料', 2, 'com.ruoyi.system.controller.SysZhuDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/zhudata', '127.0.0.1', '内网IP', '{\"zhuMdname\":\"22\",\"zhuOrid\":\"周黑鸭\",\"zhuType\":\"2\",\"params\":{},\"zhuKes\":\"周黑鸭\",\"zhuLilr\":\"22\",\"zhuChen\":\"22\",\"zhuMd\":\"222\",\"zhuName\":\"周黑鸭\",\"zhuRemark\":\"湖北东西湖南13支沟\",\"id\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:46:48');
INSERT INTO `sys_oper_log` VALUES (157, '门店主数据递交资料', 1, 'com.ruoyi.system.controller.SysZhuDataController.add()', 'POST', 1, 'admin', NULL, '/system/zhudata', '127.0.0.1', '内网IP', '{\"zhuMdname\":\"22\",\"zhuOrid\":\"112\",\"zhuType\":\"3\",\"params\":{},\"zhuKes\":\"周黑鸭\",\"zhuLilr\":\"22\",\"zhuChen\":\"33\",\"zhuMd\":\"33\",\"zhuName\":\"周黑鸭\",\"zhuRemark\":\"湖北东西湖南13支沟\",\"id\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:53:52');
INSERT INTO `sys_oper_log` VALUES (158, '门店主数据递交资料', 1, 'com.ruoyi.system.controller.SysZhuDataController.add()', 'POST', 1, 'admin', NULL, '/system/zhudata', '127.0.0.1', '内网IP', '{\"zhuMdname\":\"22\",\"zhuOrid\":\"33\",\"zhuType\":\"1\",\"params\":{},\"zhuKes\":\"112\",\"zhuLilr\":\"22\",\"zhuChen\":\"22\",\"zhuMd\":\"33\",\"zhuName\":\"22\",\"zhuRemark\":\"122\",\"id\":4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:54:05');
INSERT INTO `sys_oper_log` VALUES (159, '门店主数据递交资料', 1, 'com.ruoyi.system.controller.SysZhuDataController.add()', 'POST', 1, 'admin', NULL, '/system/zhudata', '127.0.0.1', '内网IP', '{\"zhuMdname\":\"2\",\"zhuOrid\":\"223\",\"zhuType\":\"3\",\"params\":{},\"zhuKes\":\"周黑鸭\",\"zhuLilr\":\"111\",\"zhuChen\":\"222\",\"zhuMd\":\"3\",\"zhuName\":\"3\",\"zhuRemark\":\"332\",\"id\":5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:54:22');
INSERT INTO `sys_oper_log` VALUES (160, '门店主数据递交资料', 1, 'com.ruoyi.system.controller.SysZhuDataController.add()', 'POST', 1, 'admin', NULL, '/system/zhudata', '127.0.0.1', '内网IP', '{\"zhuMdname\":\"22\",\"zhuOrid\":\"22\",\"zhuType\":\"4\",\"params\":{},\"zhuKes\":\"22\",\"zhuLilr\":\"22\",\"zhuChen\":\"22\",\"zhuMd\":\"11\",\"zhuName\":\"33\",\"zhuRemark\":\"11\",\"id\":6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:54:40');
INSERT INTO `sys_oper_log` VALUES (161, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_dict_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 16:59:33');
INSERT INTO `sys_oper_log` VALUES (162, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_dict_type', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 17:01:00');
INSERT INTO `sys_oper_log` VALUES (163, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_config', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-24 17:05:48');
INSERT INTO `sys_oper_log` VALUES (164, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_man_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 16:55:00');
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/7', '127.0.0.1', '内网IP', '{tableIds=7}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 16:55:35');
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_man_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 17:03:53');
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":81,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"序列\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":82,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"创建订单\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":83,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"offCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司代码\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"off_code\"},{\"usableColumn\":false,\"columnId\":84,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"offName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"off_name\"},{\"usableColumn\":false,\"columnId', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 17:07:09');
INSERT INTO `sys_oper_log` VALUES (168, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"remark\":\"核算方式\",\"params\":{},\"dictType\":\"sys_accunting\",\"createBy\":\"admin\",\"dictName\":\"核算方式\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 17:09:04');
INSERT INTO `sys_oper_log` VALUES (169, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_accunting\",\"dictLabel\":\"一般纳税人\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 17:09:23');
INSERT INTO `sys_oper_log` VALUES (170, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":0,\"params\":{},\"dictType\":\"sys_accunting\",\"dictLabel\":\"小规模\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 17:09:32');
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":81,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"序列\",\"updateTime\":1606554429000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":82,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"创建订单\",\"isQuery\":\"1\",\"updateTime\":1606554429000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":83,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"offCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司代码\",\"isQuery\":\"1\",\"updateTime\":1606554429000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"off_code\"},{\"usableColumn\":false,\"columnId\":84,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"offName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司名称\",\"isQuery\":\"1\",\"updateTime\":1606554429000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-28 17:10:05');
INSERT INTO `sys_oper_log` VALUES (172, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":81,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"序列\",\"updateTime\":1606554605000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":82,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"创建订单\",\"isQuery\":\"1\",\"updateTime\":1606554605000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":83,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"offCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司代码\",\"isQuery\":\"1\",\"updateTime\":1606554605000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"off_code\"},{\"usableColumn\":false,\"columnId\":84,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"offName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司名称\",\"isQuery\":\"1\",\"updateTime\":1606554605000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 13:15:06');
INSERT INTO `sys_oper_log` VALUES (173, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-29 13:15:26');
INSERT INTO `sys_oper_log` VALUES (174, 'man_data', 3, 'com.ruoyi.system.controller.SysManDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/man_data/1', '127.0.0.1', '内网IP', '{ids=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 13:36:30');
INSERT INTO `sys_oper_log` VALUES (175, 'man_data', 1, 'com.ruoyi.system.controller.SysManDataController.add()', 'POST', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"11\",\"offCode\":\"22\",\"orderId\":\"111\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"11\",\"beiyong1\":\"22\",\"beiyong2\":\"11\",\"profitcenter\":\"22\",\"offIt\":\"11\",\"id\":2,\"shopType\":\"1\",\"costcenter\":\"11\",\"offAccanting\":\"1\",\"offFico\":\"22\",\"offName\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 13:36:45');
INSERT INTO `sys_oper_log` VALUES (176, 'man_data', 1, 'com.ruoyi.system.controller.SysManDataController.add()', 'POST', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"211\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"22\",\"id\":3,\"shopType\":\"1\",\"offAccanting\":\"1\",\"offName\":\"周黑鸭第三托管式特许\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 13:45:29');
INSERT INTO `sys_oper_log` VALUES (177, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2,3', '127.0.0.1', '内网IP', '{id=2,3}', '\"街道请求，返回测试\"', 0, NULL, '2020-11-29 15:14:44');
INSERT INTO `sys_oper_log` VALUES (178, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2,3', '127.0.0.1', '内网IP', '{id=2,3}', '\"街道请求，返回测试\"', 0, NULL, '2020-11-29 15:14:55');
INSERT INTO `sys_oper_log` VALUES (179, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2,3', '127.0.0.1', '内网IP', '{id=2,3}', '\"街道请求，返回测试\"', 0, NULL, '2020-11-29 15:15:53');
INSERT INTO `sys_oper_log` VALUES (180, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2,3', '127.0.0.1', '内网IP', '{id=2,3}', '\"街道请求，返回测试\"', 0, NULL, '2020-11-29 15:20:17');
INSERT INTO `sys_oper_log` VALUES (181, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2,3', '127.0.0.1', '内网IP', '{id=2,3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 15:29:26');
INSERT INTO `sys_oper_log` VALUES (182, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2,3', '127.0.0.1', '内网IP', '{id=2,3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 15:30:57');
INSERT INTO `sys_oper_log` VALUES (183, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2,3', '127.0.0.1', '内网IP', '{id=2,3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 15:31:50');
INSERT INTO `sys_oper_log` VALUES (184, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2,3', '127.0.0.1', '内网IP', '{id=2,3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 15:34:57');
INSERT INTO `sys_oper_log` VALUES (185, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2,3', '127.0.0.1', '内网IP', '{id=2,3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 15:39:43');
INSERT INTO `sys_oper_log` VALUES (186, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2,3', '127.0.0.1', '内网IP', '{id=2,3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 15:49:48');
INSERT INTO `sys_oper_log` VALUES (187, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2,3', '127.0.0.1', '内网IP', '{id=2,3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 15:51:40');
INSERT INTO `sys_oper_log` VALUES (188, 'man_data', 1, 'com.ruoyi.system.controller.SysManDataController.add()', 'POST', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"222\",\"shopName\":\"11\",\"params\":{},\"shopAddress\":\"222\",\"id\":4,\"shopType\":\"1\",\"offAccanting\":\"1\",\"offName\":\"门店1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 15:54:47');
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":81,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"序列\",\"updateTime\":1606626905000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":82,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"创建订单\",\"isQuery\":\"1\",\"updateTime\":1606626905000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":83,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"offCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司代码\",\"isQuery\":\"1\",\"updateTime\":1606626905000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"off_code\"},{\"usableColumn\":false,\"columnId\":84,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"offName\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"公司名称\",\"isQuery\":\"1\",\"updateTime\":1606626905000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:10:06');
INSERT INTO `sys_oper_log` VALUES (190, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"params\":{},\"dictType\":\"fico\",\"createBy\":\"admin\",\"dictName\":\"财务确认\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:10:41');
INSERT INTO `sys_oper_log` VALUES (191, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"params\":{},\"dictType\":\"ITok\",\"createBy\":\"admin\",\"dictName\":\"IT确认\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:11:06');
INSERT INTO `sys_oper_log` VALUES (192, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"fico\",\"dictLabel\":\"是\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:11:22');
INSERT INTO `sys_oper_log` VALUES (193, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"fico\",\"dictLabel\":\"否\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:11:37');
INSERT INTO `sys_oper_log` VALUES (194, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"ITok\",\"dictLabel\":\"是\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:11:49');
INSERT INTO `sys_oper_log` VALUES (195, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"ITok\",\"dictLabel\":\"否\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:11:56');
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":81,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"序列\",\"updateTime\":1606637406000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":82,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"创建订单\",\"isQuery\":\"1\",\"updateTime\":1606637406000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":83,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"offCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司代码\",\"isQuery\":\"1\",\"updateTime\":1606637406000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"off_code\"},{\"usableColumn\":false,\"columnId\":84,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"offName\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"公司名称\",\"isQuery\":\"1\",\"updateTime\":1606637406000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:12:16');
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":81,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"序列\",\"updateTime\":1606637535000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":82,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"创建订单\",\"isQuery\":\"1\",\"updateTime\":1606637535000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(50)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":83,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"offCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司代码\",\"isQuery\":\"1\",\"updateTime\":1606637535000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"isEdit\":\"1\",\"tableId\":8,\"pk\":false,\"columnName\":\"off_code\"},{\"usableColumn\":false,\"columnId\":84,\"isIncrement\":\"0\",\"increment\":false,\"insert\":false,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"javaField\":\"offName\",\"htmlType\":\"input\",\"edit\":false,\"query\":true,\"columnComment\":\"公司名称\",\"isQuery\":\"1\",\"updateTime\":1606637535000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606554233000,\"tableId\":8,\"pk\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:12:55');
INSERT INTO `sys_oper_log` VALUES (198, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-29 16:13:18');
INSERT INTO `sys_oper_log` VALUES (199, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"11\",\"offCode\":\"7023\",\"orderId\":\"202011294dcee38fda9542b49ba84ed8ecf21748\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"11\",\"beiyong1\":\"WH0014\",\"beiyong2\":\"11\",\"profitcenter\":\"70230012\",\"offIt\":\"1\",\"id\":2,\"shopType\":\"1\",\"costcenter\":\"70230011\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:40:28');
INSERT INTO `sys_oper_log` VALUES (200, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"fico\",\"dictLabel\":\"是\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1606637482000,\"dictCode\":116,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:46:52');
INSERT INTO `sys_oper_log` VALUES (201, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"params\":{},\"dictType\":\"fico\",\"dictLabel\":\"是\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1606637482000,\"dictCode\":116,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:46:59');
INSERT INTO `sys_oper_log` VALUES (202, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"params\":{},\"dictType\":\"ITok\",\"dictLabel\":\"是\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1606637509000,\"dictCode\":118,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:47:12');
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"递交主数据\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"man_data\",\"component\":\"system/man_data/index\",\"children\":[],\"createTime\":1606627477000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2008,\"menuType\":\"C\",\"perms\":\"system:man_data:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:49:01');
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"FICO_IT赋值\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"man_fico_it\",\"component\":\"system/man_fico_it/index\",\"children\":[],\"createTime\":1606638161000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2009,\"menuType\":\"C\",\"perms\":\"system:man_fico_it:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 16:49:25');
INSERT INTO `sys_oper_log` VALUES (205, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"211\",\"offCode\":\"7A001\",\"orderId\":\"202011294dcee38fda9542b49ba84ed8ecf21748\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"22\",\"beiyong1\":\"\",\"profitcenter\":\"7A00101\",\"id\":3,\"shopType\":\"1\",\"costcenter\":\"7A00101\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"周黑鸭第三托管式特许\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 17:00:48');
INSERT INTO `sys_oper_log` VALUES (206, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"211\",\"offCode\":\"7A001\",\"orderId\":\"202011294dcee38fda9542b49ba84ed8ecf21748\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"22\",\"beiyong1\":\"7A00101\",\"profitcenter\":\"7A00101\",\"offIt\":\"1\",\"id\":3,\"shopType\":\"1\",\"costcenter\":\"7A00101\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"周黑鸭第三托管式特许\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 17:01:08');
INSERT INTO `sys_oper_log` VALUES (207, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"222\",\"offCode\":\"7A002\",\"shopName\":\"11\",\"params\":{},\"shopAddress\":\"222\",\"beiyong1\":\"7A00102\",\"profitcenter\":\"7A00102\",\"offIt\":\"1\",\"id\":4,\"shopType\":\"1\",\"costcenter\":\"7A00102\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"门店1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-29 17:01:51');
INSERT INTO `sys_oper_log` VALUES (208, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2007', '127.0.0.1', '内网IP', '{menuId=2007}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 15:22:00');
INSERT INTO `sys_oper_log` VALUES (209, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-11-30 15:22:58');
INSERT INTO `sys_oper_log` VALUES (210, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2020-11-30 15:23:11');
INSERT INTO `sys_oper_log` VALUES (211, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_man_list', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 15:24:02');
INSERT INTO `sys_oper_log` VALUES (212, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":96,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606721042000,\"tableId\":9,\"pk\":false,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":97,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606721042000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":98,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"suerAuthority\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户权限申请\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606721042000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"suer_authority\"},{\"usableColumn\":false,\"columnId\":99,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"ficoConfi\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"财务确认\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606721042000,\"isEdit\":\"1\",\"tableId\":9,\"pk\":false,\"columnName\":\"fico_confi\"},{\"usableColu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 15:26:54');
INSERT INTO `sys_oper_log` VALUES (213, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-30 15:27:14');
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/9', '127.0.0.1', '内网IP', '{tableIds=9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 15:38:41');
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_man_list', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 15:38:46');
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":112,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606721926000,\"tableId\":10,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":113,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606721926000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":114,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"suerAuthority\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户权限申请\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606721926000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"suer_authority\"},{\"usableColumn\":false,\"columnId\":115,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"ficoConfi\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"财务确认\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606721926000,\"isEdit\":\"1\",\"tableId\":10,\"pk\":false,\"columnName\":\"fico_confi\"},{\"us', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 15:39:29');
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-30 15:39:39');
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_man_list_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 15:58:21');
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":128,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606723101000,\"tableId\":11,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":129,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606723101000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":130,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"suerAuthority\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户权限申请\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606723101000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"suer_authority\"},{\"usableColumn\":false,\"columnId\":131,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"ficoConfi\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"财务确认\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606723101000,\"isEdit\":\"1\",\"tableId\":11,\"pk\":false,\"columnName\":\"fico_confi\"},{\"us', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 15:59:17');
INSERT INTO `sys_oper_log` VALUES (220, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-11-30 15:59:20');
INSERT INTO `sys_oper_log` VALUES (221, 'sys_man_list_data', 3, 'com.ruoyi.system.controller.SysManListDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/sys_man_list_data/1', '127.0.0.1', '内网IP', '{ids=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 16:09:14');
INSERT INTO `sys_oper_log` VALUES (222, 'man_data', 1, 'com.ruoyi.system.controller.SysManDataController.add()', 'POST', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"信息\",\"shopName\":\"门店名称\",\"params\":{},\"shopAddress\":\"延安大街\",\"id\":5,\"shopType\":\"2\",\"offAccanting\":\"1\",\"offName\":\"延安分公司\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 16:23:54');
INSERT INTO `sys_oper_log` VALUES (223, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/4,5', '127.0.0.1', '内网IP', '{id=4,5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 16:24:02');
INSERT INTO `sys_oper_log` VALUES (224, 'man_data', 1, 'com.ruoyi.system.controller.SysManDataController.add()', 'POST', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"23111\",\"shopName\":\"周黑鸭11\",\"params\":{},\"shopAddress\":\"周黑鸭11\",\"id\":6,\"shopType\":\"1\",\"offAccanting\":\"1\",\"offName\":\"周黑鸭11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 16:32:52');
INSERT INTO `sys_oper_log` VALUES (225, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/6', '127.0.0.1', '内网IP', '{id=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-11-30 16:32:59');
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2020-11-23 14:12:43', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2020-11-23 14:12:43', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2020-11-23 14:12:43', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2020-11-23 14:12:43', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2020-11-23 14:12:43', '', NULL, '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2020-11-23 14:12:43', 'admin', '2020-11-23 14:12:43', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2020-11-23 14:12:43', 'admin', '2020-11-23 14:12:43', '', NULL, '测试员');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_zhu_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_zhu_data`;
CREATE TABLE `sys_zhu_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id ',
  `zhu_orid` varchar(50) DEFAULT NULL COMMENT '公司编码',
  `zhu_name` varchar(50) DEFAULT NULL COMMENT '公司名称',
  `zhu_kes` varchar(50) DEFAULT NULL COMMENT '公司核算',
  `zhu_md` varchar(50) DEFAULT NULL COMMENT '门店编码',
  `zhu_mdname` varchar(50) DEFAULT NULL COMMENT '门店名称',
  `zhu_type` varchar(50) DEFAULT NULL COMMENT '门店类型',
  `zhu_chen` varchar(50) DEFAULT NULL COMMENT '成本中心',
  `zhu_lilr` varchar(50) DEFAULT NULL COMMENT '利润中心',
  `zhu_remark` varchar(50) DEFAULT NULL COMMENT '地址备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='门店主数据递交资料';

-- ----------------------------
-- Records of sys_zhu_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_zhu_data` VALUES (2, '周黑鸭', '周黑鸭', '周黑鸭', '222', '22', '2', '22', '22', '湖北东西湖南13支沟');
INSERT INTO `sys_zhu_data` VALUES (3, '112', '周黑鸭', '周黑鸭', '33', '22', '3', '33', '22', '湖北东西湖南13支沟');
INSERT INTO `sys_zhu_data` VALUES (4, '33', '22', '112', '33', '22', '1', '22', '22', '122');
INSERT INTO `sys_zhu_data` VALUES (5, '223', '3', '周黑鸭', '3', '2', '3', '222', '111', '332');
INSERT INTO `sys_zhu_data` VALUES (6, '22', '33', '22', '11', '22', '4', '22', '22', '11');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
