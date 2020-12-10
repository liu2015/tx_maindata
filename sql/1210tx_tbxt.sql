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

 Date: 10/12/2020 17:07:53
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
INSERT INTO `QRTZ_SCHEDULER_STATE` VALUES ('RuoyiScheduler', 'liu1607590887435', 1607591265678, 15000);
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
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1607590890000, -1, 5, 'PAUSED', 'CRON', 1607590887000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1607590890000, -1, 5, 'PAUSED', 'CRON', 1607590887000, 0, NULL, 2, '');
INSERT INTO `QRTZ_TRIGGERS` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1607590900000, -1, 5, 'PAUSED', 'CRON', 1607590887000, 0, NULL, 2, '');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (8, 'sys_man_data', '主数据递交', 'SysManData', 'crud', 'com.ruoyi.system', 'system', 'man_fico_it', 'man_fico_it', 'liu', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2020-11-28 17:03:53', '', '2020-11-29 16:12:55', NULL);
INSERT INTO `gen_table` VALUES (10, 'sys_man_list', 'man_list', 'SysManList', 'crud', 'com.ruoyi.system', 'system', 'list_man', 'list_man', 'ruoyi', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2020-11-30 15:38:46', '', '2020-11-30 15:39:29', NULL);
INSERT INTO `gen_table` VALUES (11, 'sys_man_list_data', '主数据进度表1', 'SysManListData', 'crud', 'com.ruoyi.system', 'system', 'sys_man_list_data', 'sys_man_list_data', 'ruoyi', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2020-11-30 15:58:21', '', '2020-11-30 15:59:17', NULL);
INSERT INTO `gen_table` VALUES (15, 'sys_author_user_data', '申请权限', 'SysAuthorUserData', 'crud', 'com.ruoyi.system', 'system', 'sys_author_user_data', 'sys_author_user_data', 'liu', '0', '/', '{}', 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09', NULL);
INSERT INTO `gen_table` VALUES (17, 'sys_author_user', '权限', 'SysAuthorUser', 'crud', 'com.ruoyi.system', 'system', 'SysAuthorUser', 'SysAuthorUser', 'ruoyi', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:25', NULL);
INSERT INTO `gen_table` VALUES (19, 'sys_appmanid', '请求申请token的操作', 'SysAppmanid', 'crud', 'com.ruoyi.system', 'system', 'appmanid', 'SysAppmanid', 'liu', '0', '/', '{\"parentMenuId\":2130}', 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03', NULL);
INSERT INTO `gen_table` VALUES (22, 'sys_msg_text', '消息管理', 'SysMsgText', 'crud', 'com.ruoyi.system', 'system', 'msg_text', '消息管理', 'liu', '0', '/', '{\"parentMenuId\":2130}', 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20', NULL);
INSERT INTO `gen_table` VALUES (23, 'sys_matter_data', '物料主数据递交', 'SysMatterData', 'crud', 'com.ruoyi.system', 'system', 'sys_matter_data', 'sys_matter_data', 'liu', '0', '/', '{\"parentMenuId\":\"2006\"}', 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14', NULL);
INSERT INTO `gen_table` VALUES (25, 'sys_master_tx_data', 'sd主数据', 'SysMasterTxData', 'crud', 'com.ruoyi.system', 'system', 'sys_master_tx_data', 'sd主数据', 'liu', '0', '/', '{\"parentMenuId\":\"2006\"}', 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:46', NULL);
INSERT INTO `gen_table` VALUES (26, 'sys_come_table', '外来人员登记', 'SysComeTable', 'crud', 'com.ruoyi.system', 'system', 'sys_come_table_text', '外来人员登记', 'liu', '0', '/', '{\"parentMenuId\":2006}', 'admin', '2020-12-10 14:59:56', '', '2020-12-10 15:01:10', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=502 DEFAULT CHARSET=utf8mb4 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
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
INSERT INTO `gen_table_column` VALUES (204, '15', 'id', 'id', 'int(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (205, '15', 'orderid', '单号id', 'varchar(45)', 'String', 'orderid', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (206, '15', 'region', '大区', 'varchar(45)', 'String', 'region', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (207, '15', 'pstname', '岗位名称', 'varchar(45)', 'String', 'pstname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (208, '15', 'name', '人员名称', 'varchar(45)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (209, '15', 'namecode', '人员编码', 'varchar(45)', 'String', 'namecode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (210, '15', 'offcode', '分公司编码', 'varchar(45)', 'String', 'offcode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (211, '15', 'offaccess', 'ap分公司权限', 'varchar(45)', 'String', 'offaccess', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'off_code_author', 8, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (212, '15', 'posname', 'pos名称', 'varchar(45)', 'String', 'posname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 9, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (213, '15', 'posnames', 'pos岗位', 'varchar(45)', 'String', 'posnames', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'pos_names', 10, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (214, '15', 'posshop', 'pos门店编号', 'varchar(45)', 'String', 'posshop', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (215, '15', 'ztauthor', '中台权限组名称', 'varchar(45)', 'String', 'ztauthor', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'tz_author', 12, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (216, '15', 'beizhu', '备注', 'varchar(45)', 'String', 'beizhu', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (217, '15', 'group', '组', 'varchar(45)', 'String', 'group', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (218, '15', 'groupname', '用户组名称', 'varchar(45)', 'String', 'groupname', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 15, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (219, '15', 'gp1', '备用1', 'varchar(45)', 'String', 'gp1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2020-12-01 15:08:48', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (220, '15', 'gp2', '备用2', 'varchar(45)', 'String', 'gp2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2020-12-01 15:08:49', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (221, '15', 'gp3', '备用3', 'varchar(45)', 'String', 'gp3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2020-12-01 15:08:49', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (222, '15', 'gp4', '备用4', 'varchar(45)', 'String', 'gp4', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2020-12-01 15:08:49', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (223, '15', 'gp5', '备用5', 'varchar(45)', 'String', 'gp5', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2020-12-01 15:08:49', '', '2020-12-01 15:10:09');
INSERT INTO `gen_table_column` VALUES (244, '17', 'id', 'id', 'int(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:25');
INSERT INTO `gen_table_column` VALUES (245, '17', 'orderid', '单号id', 'varchar(45)', 'String', 'orderid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:25');
INSERT INTO `gen_table_column` VALUES (246, '17', 'region', '大区', 'varchar(45)', 'String', 'region', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:25');
INSERT INTO `gen_table_column` VALUES (247, '17', 'pst_name', '岗位名称', 'varchar(45)', 'String', 'pstName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:25');
INSERT INTO `gen_table_column` VALUES (248, '17', 'name_user', '人员名称', 'varchar(45)', 'String', 'nameUser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:25');
INSERT INTO `gen_table_column` VALUES (249, '17', 'name_code', '人员编码', 'varchar(45)', 'String', 'nameCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:25');
INSERT INTO `gen_table_column` VALUES (250, '17', 'off_code', '分公司编码', 'varchar(45)', 'String', 'offCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (251, '17', 'off_access', 'ap分公司权限', 'varchar(45)', 'String', 'offAccess', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'off_code_author', 8, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (252, '17', 'pos_text', 'pos名称', 'varchar(45)', 'String', 'posText', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (253, '17', 'pos_names', 'pos岗位', 'varchar(45)', 'String', 'posNames', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'pos_names', 10, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (254, '17', 'pos_shop', 'pos门店编号', 'varchar(45)', 'String', 'posShop', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (255, '17', 'zt_author', '中台权限组名称', 'varchar(45)', 'String', 'ztAuthor', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'tz_author', 12, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (256, '17', 'beizhu', '备注', 'varchar(45)', 'String', 'beizhu', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (257, '17', 'group_text', '组', 'varchar(45)', 'String', 'groupText', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (258, '17', 'group_name', '用户组名称', 'varchar(45)', 'String', 'groupName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 15, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (259, '17', 'gp1', '备用1', 'varchar(45)', 'String', 'gp1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (260, '17', 'gp2', '备用2', 'varchar(45)', 'String', 'gp2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (261, '17', 'gp3', '备用3', 'varchar(45)', 'String', 'gp3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (262, '17', 'gp4', '备用4', 'varchar(45)', 'String', 'gp4', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (263, '17', 'gp5', '备用5', 'varchar(45)', 'String', 'gp5', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2020-12-01 15:31:56', '', '2020-12-01 15:33:26');
INSERT INTO `gen_table_column` VALUES (277, '19', 'id', 'id', 'int(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (278, '19', 'type_scene', '业务场景', 'varchar(100)', 'String', 'typeScene', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (279, '19', 'corpid', '公司id', 'varchar(100)', 'String', 'corpid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (280, '19', 'suerid', '用户id', 'varchar(100)', 'String', 'suerid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (281, '19', 'dept', '部门id', 'varchar(100)', 'String', 'dept', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (282, '19', 'tagid', '标签id', 'varchar(100)', 'String', 'tagid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (283, '19', 'agentid', '应用程序id', 'varchar(100)', 'String', 'agentid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (284, '19', 'secret', '应用秘钥', 'varchar(100)', 'String', 'secret', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (285, '19', 'access_token', 'token', 'varchar(100)', 'String', 'accessToken', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (286, '19', 'url', 'rurl', 'varchar(255)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (287, '19', 'guard1', '备用1', 'varchar(255)', 'String', 'guard1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (288, '19', 'guard2', '备用2', 'varchar(255)', 'String', 'guard2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (289, '19', 'guard3', '备用2', 'varchar(255)', 'String', 'guard3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-12-01 22:00:46', '', '2020-12-01 22:05:03');
INSERT INTO `gen_table_column` VALUES (313, '22', 'id', 'id', 'int(100)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (314, '22', 'yeuw_type', '业务类型', 'varchar(255)', 'String', 'yeuwType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'examine_msg', 2, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (315, '22', 'touser', '指定接收消息的成员', 'varchar(255)', 'String', 'touser', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (316, '22', 'toparty', '指定接收消息的部门', 'varchar(255)', 'String', 'toparty', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (317, '22', 'totag', '指定接收消息的标签', 'varchar(255)', 'String', 'totag', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (318, '22', 'msgtype', '消息类型，此时固定为：text', 'varchar(255)', 'String', 'msgtype', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (319, '22', 'agentid', '企业应用的id，整型', 'int(100)', 'Long', 'agentid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (320, '22', 'text', '消息内容text_content', 'varchar(255)', 'String', 'text', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (321, '22', 'safe', '表示是否是保密消息', 'varchar(255)', 'String', 'safe', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (322, '22', 'enable_id_trans', '表示是否开启id转译', 'varchar(255)', 'String', 'enableIdTrans', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (323, '22', 'enable_duplicate_check', '表示是否开启重复消息检查', 'varchar(255)', 'String', 'enableDuplicateCheck', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (324, '22', 'duplicate_check_interval', '表示是否重复消息检查的时间间隔', 'varchar(255)', 'String', 'duplicateCheckInterval', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (325, '22', 'url', '请求url地址', 'varchar(255)', 'String', 'url', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (326, '22', 'spare1', '备用', 'varchar(255)', 'String', 'spare1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2020-12-02 13:31:37', '', '2020-12-02 13:33:20');
INSERT INTO `gen_table_column` VALUES (327, '23', 'id', 'id', 'int(100)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (328, '23', 'order_id', '订单id', 'varchar(255)', 'String', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (329, '23', 'region', '大区', 'varchar(255)', 'String', 'region', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (330, '23', 'organ_level', '组织级别', 'varchar(255)', 'String', 'organLevel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (331, '23', 'sell_drgan', '销售组织', 'varchar(255)', 'String', 'sellDrgan', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (332, '23', 'matter', '料号', 'varchar(255)', 'String', 'matter', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (333, '23', 'matter_describe', '物料描述', 'varchar(255)', 'String', 'matterDescribe', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (334, '23', 'matter_group', '物料组', 'varchar(255)', 'String', 'matterGroup', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (335, '23', 'status', '状态', 'varchar(255)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (336, '23', 'guard1', '备用1', 'varchar(255)', 'String', 'guard1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (337, '23', 'guard2', '备用2', 'varchar(255)', 'String', 'guard2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (338, '23', 'guard3', '备用3', 'varchar(255)', 'String', 'guard3', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2020-12-03 09:39:53', '', '2020-12-03 10:14:14');
INSERT INTO `gen_table_column` VALUES (416, '25', 'id', 'id', 'int(100)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:46');
INSERT INTO `gen_table_column` VALUES (417, '25', 'order_id', '订单id', 'varchar(200)', 'String', 'orderId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:46');
INSERT INTO `gen_table_column` VALUES (418, '25', 'customer_code', 'sap客户编码', 'varchar(200)', 'String', 'customerCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:46');
INSERT INTO `gen_table_column` VALUES (419, '25', 'custome_name', 'sap客户名称', 'varchar(200)', 'String', 'customeName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:46');
INSERT INTO `gen_table_column` VALUES (420, '25', 'business', '营业执照名称', 'varchar(200)', 'String', 'business', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:46');
INSERT INTO `gen_table_column` VALUES (421, '25', 'sap_abb', 'sap简称', 'varchar(200)', 'String', 'sapAbb', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:46');
INSERT INTO `gen_table_column` VALUES (422, '25', 'stat_e', '国家', 'varchar(200)', 'String', 'statE', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:46');
INSERT INTO `gen_table_column` VALUES (423, '25', 'province', '省份', 'varchar(200)', 'String', 'province', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (424, '25', 'county', '城市县', 'varchar(200)', 'String', 'county', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (425, '25', 'address', '合同签订地址', 'varchar(200)', 'String', 'address', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (426, '25', 'store_contact', '门店联系人', 'varchar(200)', 'String', 'storeContact', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (427, '25', 'store_contelephone', ' 门店联系人电话', 'varchar(200)', 'String', 'storeContelephone', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (428, '25', 'lan_guae', ' 语言', 'varchar(200)', 'String', 'lanGuae', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (429, '25', 'client_classify', ' 客户分类', 'varchar(200)', 'String', 'clientClassify', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (430, '25', 'av6', ' 属性6', 'varchar(200)', 'String', 'av6', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (431, '25', 'open_shop', '开店时间', 'varchar(200)', 'String', 'openShop', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (432, '25', 'setshop', ' 建设店时间', 'varchar(200)', 'String', 'setshop', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (433, '25', 'do_busiress', ' 营业面积展示宽度', 'varchar(200)', 'String', 'doBusiress', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (434, '25', 'mont_hrent', ' 月租金', 'varchar(200)', 'String', 'montHrent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (435, '25', 'long_itude', ' 经度', 'varchar(200)', 'String', 'longItude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (436, '25', 'lati_fude', ' 纬度', 'varchar(200)', 'String', 'latiFude', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 21, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (437, '25', 'contr_acttenany', '合同租期', 'varchar(200)', 'String', 'contrActtenany', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 22, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (438, '25', 'rent_advice', ' 租金付款', 'varchar(200)', 'String', 'rentAdvice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 23, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (439, '25', 'rent_one', ' 租金扣点', 'varchar(200)', 'String', 'rentOne', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 24, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (440, '25', 'pints1', '租金扣点1', 'varchar(200)', 'String', 'pints1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 25, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (441, '25', 'deposit', ' 保证金', 'varchar(200)', 'String', 'deposit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 26, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (442, '25', ' conve_yancefee', '转让费', 'varchar(200)', 'String', ' conveYancefee', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 27, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (443, '25', 'pre_dict', '预估月销售', 'varchar(200)', 'String', 'preDict', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 28, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (444, '25', 'pre_dictpr', ' 预估月销售占比', 'varchar(200)', 'String', 'preDictpr', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 29, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (445, '25', 'pbp', ' 投资回收周期', 'varchar(200)', 'String', 'pbp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 30, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (446, '25', 'dere_name', '开发人员', 'varchar(200)', 'String', 'dereName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 31, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (447, '25', 'pred_ictstore', ' 预估进店率', 'varchar(200)', 'String', 'predIctstore', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 32, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (448, '25', 'pred_ictsales', '预估保本销售额', 'varchar(200)', 'String', 'predIctsales', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 33, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (449, '25', 'pred_ictflow', ' 预估平均客流量', 'varchar(200)', 'String', 'predIctflow', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 34, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (450, '25', 'add_confract', '合同地址1', 'varchar(200)', 'String', 'addConfract', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 35, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (451, '25', 'shop_class', '门店类型', 'varchar(200)', 'String', 'shopClass', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 36, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (452, '25', 'tax5', '税收5', 'varchar(200)', 'String', 'tax5', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 37, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (453, '25', 'brnk_code', '银行代码', 'varchar(200)', 'String', 'brnkCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 38, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (454, '25', ' bank_natio', '银行国家', 'varchar(200)', 'String', ' bankNatio', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 39, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (455, '25', 'banka_ccount', '银行账户号码', 'varchar(200)', 'String', 'bankaCcount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 40, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (456, '25', 'baok_name', '账户持有人姓名', 'varchar(200)', 'String', 'baokName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 41, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (457, '25', 'off_code', ' 公司代码', 'varchar(200)', 'String', 'offCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 42, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (458, '25', 'num_ber', ' 总账中的统驭科目', 'varchar(200)', 'String', 'numBer', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 43, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (459, '25', 'num_bersort', ' 排序码', 'varchar(100)', 'String', 'numBersort', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 44, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (460, '25', 'type_paymnt', '付款方式', 'varchar(200)', 'String', 'typePaymnt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 45, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (461, '25', 'remarks', ' 备注', 'varchar(200)', 'String', 'remarks', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 46, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (462, '25', 'mar_keting', '销售组织必填', 'varchar(200)', 'String', 'marKeting', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 47, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (463, '25', 'ret_ail', '分销渠道', 'varchar(200)', 'String', 'retAil', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 48, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (464, '25', 'div_sion', ' 产品组', 'varchar(200)', 'String', 'divSion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 49, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (465, '25', 'sales_region', ' 销售大区', 'varchar(200)', 'String', 'salesRegion', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 50, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (466, '25', 'sales_depart', '销售部门', 'varchar(200)', 'String', 'salesDepart', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 51, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (467, '25', 'sales_group', ' 销售组', 'varchar(200)', 'String', 'salesGroup', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 52, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (468, '25', 'cust_group', '客户组', 'varchar(200)', 'String', 'custGroup', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 53, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (469, '25', 'mone_y', ' 货币', 'varchar(200)', 'String', 'moneY', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 54, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (470, '25', 'pricet_ariff', ' 价格组', 'varchar(200)', 'String', 'pricetAriff', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 55, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (471, '25', 'pricing_procedure', ' 定价过程分配到客户', 'varchar(200)', 'String', 'pricingProcedure', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 56, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (472, '25', 'operat_ing', ' 装运条件', 'varchar(200)', 'String', 'operatIng', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 57, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (473, '25', 'deliveryp_lant', ' 交货工厂', 'varchar(200)', 'String', 'deliverypLant', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 58, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (474, '25', 'orididide', ' 订单组和标识', 'varchar(200)', 'String', 'orididide', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 59, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (475, '25', 'trade1', ' 国际贸易条款', 'varchar(200)', 'String', 'trade1', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 60, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (476, '25', 'trade2', ' 国际贸易条款2', 'varchar(200)', 'String', 'trade2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 61, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (477, '25', 'paycode', '付款条件码', 'varchar(200)', 'String', 'paycode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 62, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (478, '25', 'cust_groupaccount', ' 客户组账户分配1', 'varchar(200)', 'String', 'custGroupaccount', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 63, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (479, '25', 'custtax', '客户税1', 'varchar(200)', 'String', 'custtax', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 64, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (480, '25', 'rtd', ' 运输区域', 'varchar(200)', 'String', 'rtd', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 65, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (481, '25', 'region_manager', ' 区域经理', 'varchar(200)', 'String', 'regionManager', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 66, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (482, '25', 'servicel', ' 营运主管', 'varchar(200)', 'String', 'servicel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 67, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (483, '25', 'codesocill', '统一社会信用代码', 'varchar(200)', 'String', 'codesocill', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 68, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (484, '25', 'taxcode', ' 纳税人识别号', 'varchar(200)', 'String', 'taxcode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 69, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (485, '25', 'food_license', ' 食品经营许可证', 'varchar(200)', 'String', 'foodLicense', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 70, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (486, '25', 'food_licensel', ' 餐饮许可证', 'varchar(200)', 'String', 'foodLicensel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 71, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (487, '25', 'food_licensetime', ' 食品经营许可证有效期', 'varchar(200)', 'String', 'foodLicensetime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 72, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (488, '25', 'food_licensetimeto', '食品许可证有效期开始', 'varchar(200)', 'String', 'foodLicensetimeto', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 73, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (489, '25', 'food_licensetimeon', '食品许可或者能有效期至', 'varchar(200)', 'String', 'foodLicensetimeon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 74, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (490, '25', 'pos_code', ' pos公司代码', 'varchar(200)', 'String', 'posCode', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 75, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (491, '25', 'stor_etype', ' 门店状态1', 'varchar(200)', 'String', 'storEtype', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 76, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (492, '25', 'spe_cialid', ' 特许商id', 'varchar(200)', 'String', 'speCialid', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 77, 'admin', '2020-12-04 14:34:36', '', '2020-12-04 14:36:47');
INSERT INTO `gen_table_column` VALUES (493, '26', 'id', 'id', 'int(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-12-10 14:59:56', '', '2020-12-10 15:01:10');
INSERT INTO `gen_table_column` VALUES (494, '26', 'come_name', '来访姓名', 'varchar(100)', 'String', 'comeName', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-12-10 14:59:56', '', '2020-12-10 15:01:10');
INSERT INTO `gen_table_column` VALUES (495, '26', 'sex', '性别', 'varchar(100)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 3, 'admin', '2020-12-10 14:59:56', '', '2020-12-10 15:01:10');
INSERT INTO `gen_table_column` VALUES (496, '26', 'ide_ntity', '身份证id', 'varchar(100)', 'String', 'ideNtity', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-12-10 14:59:56', '', '2020-12-10 15:01:10');
INSERT INTO `gen_table_column` VALUES (497, '26', 'wor_kunit', ' 工作单位', 'varchar(100)', 'String', 'worKunit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-12-10 14:59:56', '', '2020-12-10 15:01:10');
INSERT INTO `gen_table_column` VALUES (498, '26', 'call_link', ' 联系电话', 'varchar(100)', 'String', 'callLink', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-12-10 14:59:56', '', '2020-12-10 15:01:10');
INSERT INTO `gen_table_column` VALUES (499, '26', 'come_time', '来访时间', 'datetime(6)', 'Date', 'comeTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2020-12-10 14:59:56', '', '2020-12-10 15:01:10');
INSERT INTO `gen_table_column` VALUES (500, '26', 'leawe_time', '离开时间', 'datetime(6)', 'Date', 'leaweTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2020-12-10 14:59:56', '', '2020-12-10 15:01:10');
INSERT INTO `gen_table_column` VALUES (501, '26', 'rea_marks', '备注', 'varchar(100)', 'String', 'reaMarks', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2020-12-10 14:59:56', '', '2020-12-10 15:01:10');
COMMIT;

-- ----------------------------
-- Table structure for sys_appmanid
-- ----------------------------
DROP TABLE IF EXISTS `sys_appmanid`;
CREATE TABLE `sys_appmanid` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `type_scene` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '业务场景',
  `corpid` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '公司id',
  `suerid` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '用户id',
  `dept` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '部门id',
  `tagid` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '标签id',
  `agentid` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用程序id',
  `secret` varchar(100) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '应用秘钥',
  `access_token` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'token',
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'rurl',
  `guard1` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用1',
  `guard2` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用2',
  `guard3` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_appmanid
-- ----------------------------
BEGIN;
INSERT INTO `sys_appmanid` VALUES (1, 'token', 'wwaa46bcce7b1f388a', NULL, NULL, NULL, NULL, 'q7OgmArKfeOKO_m6zFZX1FIDa-jCopS0MXaVMzrVhNM', 'miHLydiCYSFBaXi0yUXnTvLm7SnJ1kXqaHlPH9RQ-hG7HGRBu9BBvMIdOIK4dZe79oFyGm6OCMWjRBSas02sWR2QnxktkXEyIfChZF1IxWwVii8_Y_pfm3v5_uvNytYLYkyuxHAg6hSzrZ6Bj2U9K3wd8-sxEAnTgBxARTRHFLZtnbHM2VxHxJZFMR27fsgGh-Q48fOTM41WsMTwX6XjrA', 'https://qyapi.weixin.qq.com/cgi-bin/gettoken', 'wwaa46bcce7b1f388a', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_author_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_author_user`;
CREATE TABLE `sys_author_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `orderid` varchar(45) DEFAULT NULL COMMENT '单号id',
  `region` varchar(45) DEFAULT NULL COMMENT '大区',
  `pst_name` varchar(45) DEFAULT NULL COMMENT '岗位名称',
  `name_user` varchar(45) DEFAULT NULL COMMENT '人员名称',
  `name_code` varchar(45) DEFAULT NULL COMMENT '人员编码',
  `off_code` varchar(45) DEFAULT NULL COMMENT '分公司编码',
  `off_access` varchar(45) DEFAULT NULL COMMENT 'ap分公司权限',
  `pos_text` varchar(45) DEFAULT NULL COMMENT 'pos名称',
  `pos_names` varchar(45) DEFAULT NULL COMMENT 'pos岗位',
  `pos_shop` varchar(45) DEFAULT NULL COMMENT 'pos门店编号',
  `zt_author` varchar(45) DEFAULT NULL COMMENT '中台权限组名称',
  `beizhu` varchar(45) DEFAULT NULL COMMENT '备注',
  `group_text` varchar(45) DEFAULT NULL COMMENT '组',
  `group_name` varchar(45) DEFAULT NULL COMMENT '用户组名称',
  `gp1` varchar(45) DEFAULT NULL COMMENT '备用1',
  `gp2` varchar(45) DEFAULT NULL COMMENT '备用2',
  `gp3` varchar(45) DEFAULT NULL COMMENT '备用3',
  `gp4` varchar(45) DEFAULT NULL COMMENT '备用4',
  `gp5` varchar(45) DEFAULT NULL COMMENT '备用5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_author_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_author_user` VALUES (5, '22', '华东大区', '管理员', '丰富的', '0177412', '70114', '0', NULL, '1', '门店', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_author_user` VALUES (6, '2223', '222', '332', '22', '870114', '22', '0', '22', '3', '22', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '22');
COMMIT;

-- ----------------------------
-- Table structure for sys_come_table
-- ----------------------------
DROP TABLE IF EXISTS `sys_come_table`;
CREATE TABLE `sys_come_table` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `come_name` varchar(100) DEFAULT NULL COMMENT '来访姓名',
  `sex` varchar(100) DEFAULT NULL COMMENT '性别',
  `ide_ntity` varchar(100) DEFAULT NULL COMMENT '身份证id',
  `wor_kunit` varchar(100) DEFAULT NULL COMMENT ' 工作单位',
  `call_link` varchar(100) DEFAULT NULL COMMENT ' 联系电话',
  `come_time` datetime(6) DEFAULT NULL COMMENT '来访时间',
  `leawe_time` datetime(6) DEFAULT NULL COMMENT '离开时间',
  `rea_marks` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_come_table
-- ----------------------------
BEGIN;
INSERT INTO `sys_come_table` VALUES (1, 'fuling liu', '0', '32211', '周黑鸭', '15927529577', '2020-12-10 00:00:00.000000', '2020-12-10 00:00:00.000000', '221');
INSERT INTO `sys_come_table` VALUES (2, 'fuling liu23', '0', '321123', '周黑鸭', '15927529577', '2020-12-10 00:00:00.000000', '2020-12-10 00:00:00.000000', NULL);
INSERT INTO `sys_come_table` VALUES (3, '223', '0', '332', '2', '15927529577', '2020-12-10 11:45:00.000000', '2020-12-10 11:45:02.000000', '332');
INSERT INTO `sys_come_table` VALUES (5, '2222', '0', '2222', '22222', '2222', '2020-12-10 15:35:42.000000', NULL, NULL);
INSERT INTO `sys_come_table` VALUES (6, '修改', '0', '2332', '222', '222', '2020-12-10 15:40:30.000000', '2020-12-10 17:04:15.000000', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COMMENT='字典数据表';

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
INSERT INTO `sys_dict_data` VALUES (120, 1, '是的我需要获得分公司sap权限', '1', 'off_code_author', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:44:23', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 0, '我没有sap账号或不需要授权', '0', 'off_code_author', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:44:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 0, '收银员/店务管理', '0', 'pos_names', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:47:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 1, '文员', '1', 'pos_names', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:47:34', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (124, 2, '主管', '2', 'pos_names', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:47:44', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (125, 3, '经理', '3', 'pos_names', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:47:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 4, '管理员', '4', 'pos_names', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:48:09', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (127, 0, '营运', '0', 'tz_author', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:50:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 1, '营运/信息', '1', 'tz_author', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:50:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 2, '信息', '2', 'tz_author', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:50:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 3, '信息/财务', '3', 'tz_author', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:51:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 4, '财务组', '4', 'tz_author', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:51:28', 'admin', '2020-12-01 13:51:46', NULL);
INSERT INTO `sys_dict_data` VALUES (132, 5, '总经理', '5', 'tz_author', NULL, NULL, 'N', '0', 'admin', '2020-12-01 13:51:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (133, 0, 'one', '1', 'examine_msg', NULL, NULL, 'N', '0', 'admin', '2020-12-02 13:01:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (134, 0, 'two', '2', 'examine_msg', NULL, NULL, 'N', '0', 'admin', '2020-12-02 13:01:14', 'admin', '2020-12-02 13:01:23', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COMMENT='字典类型表';

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
INSERT INTO `sys_dict_type` VALUES (104, '是授权分公司sap权限', 'off_code_author', '0', 'admin', '2020-12-01 13:43:47', '', NULL, '是授权分公司sap权限');
INSERT INTO `sys_dict_type` VALUES (105, ' 岗位名称', 'pos_names', '0', 'admin', '2020-12-01 13:46:05', 'admin', '2020-12-01 13:46:19', ' 岗位名称');
INSERT INTO `sys_dict_type` VALUES (106, '中台权限', 'tz_author', '0', 'admin', '2020-12-01 13:48:55', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, '审核步骤', 'examine_msg', '0', 'admin', '2020-12-02 13:00:46', '', NULL, '审核步骤选项');
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
) ENGINE=InnoDB AUTO_INCREMENT=166 DEFAULT CHARSET=utf8mb4 COMMENT='系统访问记录';

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
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '1', '验证码错误', '2020-12-01 12:32:38');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-01 12:32:41');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-01 13:20:43');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-01 14:24:32');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-01 14:54:06');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-01 15:02:31');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-01 15:07:53');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-01 15:13:48');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-01 15:16:57');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-01 15:21:46');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-01 15:36:10');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-01 21:57:05');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-02 09:16:25');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-02 09:21:14');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-02 09:29:33');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-02 11:31:19');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-02 11:34:11');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-02 11:52:23');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-02 11:59:02');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-02 13:06:46');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-02 14:23:35');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-02 14:56:18');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-03 09:18:09');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '退出成功', '2020-12-03 09:39:32');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-03 09:39:35');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-03 10:13:20');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-03 12:31:42');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-04 13:46:20');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '1', '验证码错误', '2020-12-04 14:06:41');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-04 14:06:44');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-04 14:11:35');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-04 14:43:06');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Linux', '0', '登录成功', '2020-12-10 17:00:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_man_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_man_data` VALUES (2, '20201202992af409a2ac4fd9a93587b8e0fcd7d5', '7023', '22', '1', '11', '22', '1', '70230011', '70230012', '11', '1', '1', 'WH0014', '11');
INSERT INTO `sys_man_data` VALUES (3, '202011294dcee38fda9542b49ba84ed8ecf21748', '7A001', '周黑鸭第三托管式特许', '1', '211', '22', '1', '7A00101', '7A00101', '22', '1', '1', '7A00101', NULL);
INSERT INTO `sys_man_data` VALUES (4, '20201202c48642f7dd544616ae57460dde310cd2', '7A002', '门店1', '1', '222', '11', '1', '7A00102', '7A00102', '222', '1', '1', '7A00102', NULL);
INSERT INTO `sys_man_data` VALUES (5, '20201202225c3b241ce743efbc8d8f69fc7a4340', '电风扇', '延安分公司', '1', '信息', '门店名称', '2', '东方时尚', '成各种新', '延安大街', '1', '1', '21', NULL);
INSERT INTO `sys_man_data` VALUES (6, '20201130ea0c665fec1a45aba32e326aad32e352', '342', '周黑鸭11', '1', '23111', '周黑鸭11', '1', '343', '223', '周黑鸭11', '1', '1', '3212', NULL);
INSERT INTO `sys_man_data` VALUES (7, '20201202bb88acf751724fe09bbf5b18b95d77aa', '111', '周黑鸭2020', '1', '222', '221', '2', '222', '321', '221', '1', '1', '12323', NULL);
INSERT INTO `sys_man_data` VALUES (8, '202012024f80b932e967424197506fa2d6402cd1', NULL, 'H欧皇的', '1', '23231', '232', '2', NULL, NULL, '1223', NULL, NULL, NULL, NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_man_list_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_man_list_data` VALUES (3, '20201130a2aca0d5de364015a8e0b85423baa940', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计2数据', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (4, '20201130ea0c665fec1a45aba32e326aad32e352', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', '2', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (5, '2234', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '9', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (7, '20201202044ef8a748574bbba13f31cedef09ad9', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (8, '20201202c1a94c8b87b84ef9bda39e3297ba8bb2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (9, '20201202d0162d5b85b0436283c9a912614199e7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (10, '2020120236f19a528f3c450487e6e05ba7158e1d', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (11, '20201202725ff24955b944bb823fa1c2f117418a', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (12, '20201202552c5b95f2354f058d9fe2500746daeb', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (13, '2020120209f2f8ce46ae4bacb52281bb604b506e', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (14, '20201202f54f58c074b34eee9923978e08d48e58', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (15, '20201202fb0e480b7dab46469acb5d800fd34464', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (16, '20201202992af409a2ac4fd9a93587b8e0fcd7d5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '申请人确认总计1数据', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (17, '20201130ea0c665fec1a45aba32e326aad32e352', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '两部门都同意', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (18, '20201202225c3b241ce743efbc8d8f69fc7a4340', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '两部门都同意', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (19, '20201202bb88acf751724fe09bbf5b18b95d77aa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '两部门都同意', '3', NULL, NULL, NULL);
INSERT INTO `sys_man_list_data` VALUES (20, '20201202992af409a2ac4fd9a93587b8e0fcd7d5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '两部门都同意', '3', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_master_tx_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_master_tx_data`;
CREATE TABLE `sys_master_tx_data` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` varchar(200) DEFAULT NULL COMMENT '订单id',
  `customer_code` varchar(200) DEFAULT NULL COMMENT 'sap客户编码',
  `custome_name` varchar(200) DEFAULT NULL COMMENT 'sap客户名称',
  `business` varchar(200) DEFAULT NULL COMMENT '营业执照名称',
  `sap_abb` varchar(200) DEFAULT NULL COMMENT 'sap简称',
  `stat_e` varchar(200) DEFAULT NULL COMMENT '国家',
  `province` varchar(200) DEFAULT NULL COMMENT '省份',
  `county` varchar(200) DEFAULT NULL COMMENT '城市县',
  `address` varchar(200) DEFAULT NULL COMMENT '合同签订地址',
  `store_contact` varchar(200) DEFAULT NULL COMMENT '门店联系人',
  `store_contelephone` varchar(200) DEFAULT NULL COMMENT ' 门店联系人电话',
  `lan_guae` varchar(200) DEFAULT NULL COMMENT ' 语言',
  `client_classify` varchar(200) DEFAULT NULL COMMENT ' 客户分类',
  `av6` varchar(200) DEFAULT NULL COMMENT ' 属性6',
  `open_shop` varchar(200) DEFAULT NULL COMMENT '开店时间',
  `setshop` varchar(200) DEFAULT NULL COMMENT ' 建设店时间',
  `do_busiress` varchar(200) DEFAULT NULL COMMENT ' 营业面积展示宽度',
  `mont_hrent` varchar(200) DEFAULT NULL COMMENT ' 月租金',
  `long_itude` varchar(200) DEFAULT NULL COMMENT ' 经度',
  `lati_fude` varchar(200) DEFAULT NULL COMMENT ' 纬度',
  `contr_acttenany` varchar(200) DEFAULT NULL COMMENT '合同租期',
  `rent_advice` varchar(200) DEFAULT NULL COMMENT ' 租金付款',
  `rent_one` varchar(200) DEFAULT NULL COMMENT ' 租金扣点',
  `pints1` varchar(200) DEFAULT NULL COMMENT '租金扣点1',
  `deposit` varchar(200) DEFAULT NULL COMMENT ' 保证金',
  `conve_yancefee` varchar(200) DEFAULT NULL COMMENT '转让费',
  `pre_dict` varchar(200) DEFAULT NULL COMMENT '预估月销售',
  `pre_dictpr` varchar(200) DEFAULT NULL COMMENT ' 预估月销售占比',
  `pbp` varchar(200) DEFAULT NULL COMMENT ' 投资回收周期',
  `dere_name` varchar(200) DEFAULT NULL COMMENT '开发人员',
  `pred_ictstore` varchar(200) DEFAULT NULL COMMENT ' 预估进店率',
  `pred_ictsales` varchar(200) DEFAULT NULL COMMENT '预估保本销售额',
  `pred_ictflow` varchar(200) DEFAULT NULL COMMENT ' 预估平均客流量',
  `add_confract` varchar(200) DEFAULT NULL COMMENT '合同地址1',
  `shop_class` varchar(200) DEFAULT NULL COMMENT '门店类型',
  `tax5` varchar(200) DEFAULT NULL COMMENT '税收5',
  `brnk_code` varchar(200) DEFAULT NULL COMMENT '银行代码',
  `bank_natio` varchar(200) DEFAULT NULL COMMENT '银行国家',
  `banka_ccount` varchar(200) DEFAULT NULL COMMENT '银行账户号码',
  `baok_name` varchar(200) DEFAULT NULL COMMENT '账户持有人姓名',
  `off_code` varchar(200) DEFAULT NULL COMMENT ' 公司代码',
  `num_ber` varchar(200) DEFAULT NULL COMMENT ' 总账中的统驭科目',
  `num_bersort` varchar(100) DEFAULT NULL COMMENT ' 排序码',
  `type_paymnt` varchar(200) DEFAULT NULL COMMENT '付款方式',
  `remarks` varchar(200) DEFAULT NULL COMMENT ' 备注',
  `mar_keting` varchar(200) DEFAULT NULL COMMENT '销售组织必填',
  `ret_ail` varchar(200) DEFAULT NULL COMMENT '分销渠道',
  `div_sion` varchar(200) DEFAULT NULL COMMENT ' 产品组',
  `sales_region` varchar(200) DEFAULT NULL COMMENT ' 销售大区',
  `sales_depart` varchar(200) DEFAULT NULL COMMENT '销售部门',
  `sales_group` varchar(200) DEFAULT NULL COMMENT ' 销售组',
  `cust_group` varchar(200) DEFAULT NULL COMMENT '客户组',
  `mone_y` varchar(200) DEFAULT NULL COMMENT ' 货币',
  `pricet_ariff` varchar(200) DEFAULT NULL COMMENT ' 价格组',
  `pricing_procedure` varchar(200) DEFAULT NULL COMMENT ' 定价过程分配到客户',
  `operat_ing` varchar(200) DEFAULT NULL COMMENT ' 装运条件',
  `deliveryp_lant` varchar(200) DEFAULT NULL COMMENT ' 交货工厂',
  `orididide` varchar(200) DEFAULT NULL COMMENT ' 订单组和标识',
  `trade1` varchar(200) DEFAULT NULL COMMENT ' 国际贸易条款',
  `trade2` varchar(200) DEFAULT NULL COMMENT ' 国际贸易条款2',
  `paycode` varchar(200) DEFAULT NULL COMMENT '付款条件码',
  `cust_groupaccount` varchar(200) DEFAULT NULL COMMENT ' 客户组账户分配1',
  `custtax` varchar(200) DEFAULT NULL COMMENT '客户税1',
  `rtd` varchar(200) DEFAULT NULL COMMENT ' 运输区域',
  `region_manager` varchar(200) DEFAULT NULL COMMENT ' 区域经理',
  `servicel` varchar(200) DEFAULT NULL COMMENT ' 营运主管',
  `codesocill` varchar(200) DEFAULT NULL COMMENT '统一社会信用代码',
  `taxcode` varchar(200) DEFAULT NULL COMMENT ' 纳税人识别号',
  `food_license` varchar(200) DEFAULT NULL COMMENT ' 食品经营许可证',
  `food_licensel` varchar(200) DEFAULT NULL COMMENT ' 餐饮许可证',
  `food_licensetime` varchar(200) DEFAULT NULL COMMENT ' 食品经营许可证有效期',
  `food_licensetimeto` varchar(200) DEFAULT NULL COMMENT '食品许可证有效期开始',
  `food_licensetimeon` varchar(200) DEFAULT NULL COMMENT '食品许可或者能有效期至',
  `pos_code` varchar(200) DEFAULT NULL COMMENT ' pos公司代码',
  `stor_etype` varchar(200) DEFAULT NULL COMMENT ' 门店状态1',
  `spe_cialid` varchar(200) DEFAULT NULL COMMENT ' 特许商id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_master_tx_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_master_tx_data` VALUES (3, '221', '22', '223', '222', '22', '222', '2332', '武汉', '武汉', NULL, '15927529577', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `sys_master_tx_data` VALUES (4, NULL, 'NN00001', '南宁东站一店', NULL, '南宁东站一店', '中国', '210', '南宁', '南宁', '55433', '2223', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_matter_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_matter_data`;
CREATE TABLE `sys_matter_data` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` varchar(255) DEFAULT NULL COMMENT '订单id',
  `region` varchar(255) DEFAULT NULL COMMENT '大区',
  `organ_level` varchar(255) DEFAULT NULL COMMENT '组织级别',
  `sell_drgan` varchar(255) DEFAULT NULL COMMENT '销售组织',
  `matter` varchar(255) DEFAULT NULL COMMENT '料号',
  `matter_describe` varchar(255) DEFAULT NULL COMMENT '物料描述',
  `matter_group` varchar(255) DEFAULT NULL COMMENT '物料组',
  `status` varchar(255) DEFAULT NULL COMMENT '状态',
  `guard1` varchar(255) DEFAULT NULL COMMENT '备用1',
  `guard2` varchar(255) DEFAULT NULL COMMENT '备用2',
  `guard3` varchar(255) DEFAULT NULL COMMENT '备用3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of sys_matter_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_matter_data` VALUES (2, '2322', '233', '11', '22', '33', '232', '23', '23', '232', '232', '23');
INSERT INTO `sys_matter_data` VALUES (3, '112', '22', '22', '22', '22', '22', '22', '22', '22', '22', '22');
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
) ENGINE=InnoDB AUTO_INCREMENT=2174 DEFAULT CHARSET=utf8mb4 COMMENT='菜单权限表';

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
INSERT INTO `sys_menu` VALUES (2006, '服务模块', 0, 5, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'server', 'admin', '2020-11-23 16:28:23', 'admin', '2020-11-24 16:23:34', '');
INSERT INTO `sys_menu` VALUES (2008, '递交主数据', 2006, 1, 'man_data', 'system/man_data/index', 1, 0, 'C', '0', '0', 'system:man_data:list', '#', 'admin', '2020-11-29 13:24:37', 'admin', '2020-11-29 16:49:01', 'man_data菜单');
INSERT INTO `sys_menu` VALUES (2009, 'FICO_IT赋值', 2006, 1, 'man_fico_it', 'system/man_fico_it/index', 1, 0, 'C', '0', '0', 'system:man_fico_it:list', '#', 'admin', '2020-11-29 16:22:41', 'admin', '2020-11-29 16:49:25', 'man_fico_it菜单');
INSERT INTO `sys_menu` VALUES (2010, 'man_fico_it查询', 2009, 1, '#', '', 1, 0, 'F', '0', '0', 'system:man_fico_it:query', '#', 'admin', '2020-11-29 16:22:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, 'man_fico_it新增', 2009, 2, '#', '', 1, 0, 'F', '0', '0', 'system:man_fico_it:add', '#', 'admin', '2020-11-29 16:22:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, 'man_fico_it修改', 2009, 3, '#', '', 1, 0, 'F', '0', '0', 'system:man_fico_it:edit', '#', 'admin', '2020-11-29 16:22:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, 'man_fico_it删除', 2009, 4, '#', '', 1, 0, 'F', '0', '0', 'system:man_fico_it:remove', '#', 'admin', '2020-11-29 16:22:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, 'man_fico_it导出', 2009, 5, '#', '', 1, 0, 'F', '0', '0', 'system:man_fico_it:export', '#', 'admin', '2020-11-29 16:22:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, 'sys_man_list_data', 2006, 1, 'sys_man_list_data', 'system/sys_man_list_data/index', 1, 0, 'C', '0', '0', 'system:sys_man_list_data:list', '#', 'admin', '2020-11-30 16:02:54', '', NULL, 'sys_man_list_data菜单');
INSERT INTO `sys_menu` VALUES (2124, '申请用户和权限', 2006, 1, 'SysAuthorUser', 'system/SysAuthorUser/index', 1, 0, 'C', '0', '0', 'system:SysAuthorUser:list', '#', 'admin', '2020-12-01 15:39:39', 'admin', '2020-12-01 16:34:28', 'SysAuthorUser菜单');
INSERT INTO `sys_menu` VALUES (2125, 'SysAuthorUser查询', 2124, 1, '#', '', 1, 0, 'F', '0', '0', 'system:SysAuthorUser:query', '#', 'admin', '2020-12-01 15:39:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2126, 'SysAuthorUser新增', 2124, 2, '#', '', 1, 0, 'F', '0', '0', 'system:SysAuthorUser:add', '#', 'admin', '2020-12-01 15:39:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2127, 'SysAuthorUser修改', 2124, 3, '#', '', 1, 0, 'F', '0', '0', 'system:SysAuthorUser:edit', '#', 'admin', '2020-12-01 15:39:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2128, 'SysAuthorUser删除', 2124, 4, '#', '', 1, 0, 'F', '0', '0', 'system:SysAuthorUser:remove', '#', 'admin', '2020-12-01 15:39:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2129, 'SysAuthorUser导出', 2124, 5, '#', '', 1, 0, 'F', '0', '0', 'system:SysAuthorUser:export', '#', 'admin', '2020-12-01 15:39:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2130, '微信服务', 0, 6, 'weixin', NULL, 1, 0, 'M', '0', '0', NULL, 'github', 'admin', '2020-12-01 22:04:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2131, 'SysAppmanid', 2130, 1, 'appmanid', 'system/appmanid/index', 1, 0, 'C', '0', '0', 'system:appmanid:list', '#', 'admin', '2020-12-01 22:07:15', '', NULL, 'SysAppmanid菜单');
INSERT INTO `sys_menu` VALUES (2132, 'SysAppmanid查询', 2131, 1, '#', '', 1, 0, 'F', '0', '0', 'system:appmanid:query', '#', 'admin', '2020-12-01 22:07:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2133, 'SysAppmanid新增', 2131, 2, '#', '', 1, 0, 'F', '0', '0', 'system:appmanid:add', '#', 'admin', '2020-12-01 22:07:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2134, 'SysAppmanid修改', 2131, 3, '#', '', 1, 0, 'F', '0', '0', 'system:appmanid:edit', '#', 'admin', '2020-12-01 22:07:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2135, 'SysAppmanid删除', 2131, 4, '#', '', 1, 0, 'F', '0', '0', 'system:appmanid:remove', '#', 'admin', '2020-12-01 22:07:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2136, 'SysAppmanid导出', 2131, 5, '#', '', 1, 0, 'F', '0', '0', 'system:appmanid:export', '#', 'admin', '2020-12-01 22:07:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2137, '消息管理', 2130, 1, 'msg_text', 'system/msg_text/index', 1, 0, 'C', '0', '0', 'system:msg_text:list', '#', 'admin', '2020-12-02 13:05:44', '', NULL, '消息管理菜单');
INSERT INTO `sys_menu` VALUES (2138, '消息管理查询', 2137, 1, '#', '', 1, 0, 'F', '0', '0', 'system:msg_text:query', '#', 'admin', '2020-12-02 13:05:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2139, '消息管理新增', 2137, 2, '#', '', 1, 0, 'F', '0', '0', 'system:msg_text:add', '#', 'admin', '2020-12-02 13:05:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2140, '消息管理修改', 2137, 3, '#', '', 1, 0, 'F', '0', '0', 'system:msg_text:edit', '#', 'admin', '2020-12-02 13:05:44', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2141, '消息管理删除', 2137, 4, '#', '', 1, 0, 'F', '0', '0', 'system:msg_text:remove', '#', 'admin', '2020-12-02 13:05:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2142, '消息管理导出', 2137, 5, '#', '', 1, 0, 'F', '0', '0', 'system:msg_text:export', '#', 'admin', '2020-12-02 13:05:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2143, 'sys_matter_data', 2006, 1, 'sys_matter_data', 'system/sys_matter_data/index', 1, 0, 'C', '0', '0', 'system:sys_matter_data:list', '#', 'admin', '2020-12-03 10:15:02', '', NULL, 'sys_matter_data菜单');
INSERT INTO `sys_menu` VALUES (2144, 'sys_matter_data查询', 2143, 1, '#', '', 1, 0, 'F', '0', '0', 'system:sys_matter_data:query', '#', 'admin', '2020-12-03 10:15:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2145, 'sys_matter_data新增', 2143, 2, '#', '', 1, 0, 'F', '0', '0', 'system:sys_matter_data:add', '#', 'admin', '2020-12-03 10:15:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2146, 'sys_matter_data修改', 2143, 3, '#', '', 1, 0, 'F', '0', '0', 'system:sys_matter_data:edit', '#', 'admin', '2020-12-03 10:15:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2147, 'sys_matter_data删除', 2143, 4, '#', '', 1, 0, 'F', '0', '0', 'system:sys_matter_data:remove', '#', 'admin', '2020-12-03 10:15:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2148, 'sys_matter_data导出', 2143, 5, '#', '', 1, 0, 'F', '0', '0', 'system:sys_matter_data:export', '#', 'admin', '2020-12-03 10:15:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2155, 'sd主数据', 2006, 1, 'sys_master_tx_data', 'system/sys_master_tx_data/index', 1, 0, 'C', '0', '0', 'system:sys_master_tx_data:list', '#', 'admin', '2020-12-04 14:37:31', '', NULL, 'sd主数据菜单');
INSERT INTO `sys_menu` VALUES (2156, 'sd主数据查询', 2155, 1, '#', '', 1, 0, 'F', '0', '0', 'system:sys_master_tx_data:query', '#', 'admin', '2020-12-04 14:37:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2157, 'sd主数据新增', 2155, 2, '#', '', 1, 0, 'F', '0', '0', 'system:sys_master_tx_data:add', '#', 'admin', '2020-12-04 14:37:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2158, 'sd主数据修改', 2155, 3, '#', '', 1, 0, 'F', '0', '0', 'system:sys_master_tx_data:edit', '#', 'admin', '2020-12-04 14:37:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2159, 'sd主数据删除', 2155, 4, '#', '', 1, 0, 'F', '0', '0', 'system:sys_master_tx_data:remove', '#', 'admin', '2020-12-04 14:37:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2160, 'sd主数据导出', 2155, 5, '#', '', 1, 0, 'F', '0', '0', 'system:sys_master_tx_data:export', '#', 'admin', '2020-12-04 14:37:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2161, '出入登记', 2006, 1, 'sys_come_table', 'system/sys_come_table/index', 1, 0, 'C', '0', '0', 'system:sys_come_table:list', '#', 'admin', '2020-12-10 14:14:02', 'admin', '2020-12-10 14:32:07', '出入登记菜单');
INSERT INTO `sys_menu` VALUES (2162, '出入登记查询', 2161, 1, '#', '', 1, 0, 'F', '0', '0', 'system:sys_come_table:query', '#', 'admin', '2020-12-10 14:14:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2163, '出入登记新增', 2161, 2, '#', '', 1, 0, 'F', '0', '0', 'system:sys_come_table:add', '#', 'admin', '2020-12-10 14:14:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2164, '出入登记修改', 2161, 3, '#', '', 1, 0, 'F', '0', '0', 'system:sys_come_table:edit', '#', 'admin', '2020-12-10 14:14:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2165, '出入登记删除', 2161, 4, '#', '', 1, 0, 'F', '0', '0', 'system:sys_come_table:remove', '#', 'admin', '2020-12-10 14:14:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2166, '出入登记导出', 2161, 5, '#', '', 1, 0, 'F', '0', '0', 'system:sys_come_table:export', '#', 'admin', '2020-12-10 14:14:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2168, '外来人员登记', 2006, 1, 'sys_come_table_text', 'system/sys_come_table_text/index', 1, 0, 'C', '0', '0', 'system:sys_come_table_text:list', '#', 'admin', '2020-12-10 15:01:35', '', NULL, '外来人员登记菜单');
INSERT INTO `sys_menu` VALUES (2169, '外来人员登记查询', 2168, 1, '#', '', 1, 0, 'F', '0', '0', 'system:sys_come_table_text:query', '#', 'admin', '2020-12-10 15:01:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2170, '外来人员登记新增', 2168, 2, '#', '', 1, 0, 'F', '0', '0', 'system:sys_come_table_text:add', '#', 'admin', '2020-12-10 15:01:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2171, '外来人员登记修改', 2168, 3, '#', '', 1, 0, 'F', '0', '0', 'system:sys_come_table_text:edit', '#', 'admin', '2020-12-10 15:01:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2172, '外来人员登记删除', 2168, 4, '#', '', 1, 0, 'F', '0', '0', 'system:sys_come_table_text:remove', '#', 'admin', '2020-12-10 15:01:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2173, '外来人员登记导出', 2168, 5, '#', '', 1, 0, 'F', '0', '0', 'system:sys_come_table_text:export', '#', 'admin', '2020-12-10 15:01:35', '', NULL, '');
COMMIT;

-- ----------------------------
-- Table structure for sys_msg_text
-- ----------------------------
DROP TABLE IF EXISTS `sys_msg_text`;
CREATE TABLE `sys_msg_text` (
  `id` int(100) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `yeuw_type` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '业务类型',
  `touser` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '指定接收消息的成员',
  `toparty` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '指定接收消息的部门',
  `totag` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '指定接收消息的标签',
  `msgtype` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '消息类型，此时固定为：text',
  `agentid` int(100) DEFAULT NULL COMMENT '企业应用的id，整型',
  `text` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '消息内容text_content',
  `safe` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表示是否是保密消息',
  `enable_id_trans` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表示是否开启id转译',
  `enable_duplicate_check` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表示是否开启重复消息检查',
  `duplicate_check_interval` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '表示是否重复消息检查的时间间隔',
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '请求url地址',
  `spare1` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '备用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of sys_msg_text
-- ----------------------------
BEGIN;
INSERT INTO `sys_msg_text` VALUES (1, '1', 'LiuFuLing', NULL, NULL, 'text', 1000002, '这是一个测试请登录测试网站 https://172.30.90.53:9002/backoffice/login.zul', '0', '0', '0', '1800', 'https://qyapi.weixin.qq.com/cgi-bin/message/send?', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=utf8mb4 COMMENT='操作日志记录';

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
INSERT INTO `sys_oper_log` VALUES (226, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"remark\":\"是授权分公司sap权限\",\"params\":{},\"dictType\":\"off_code_author\",\"createBy\":\"admin\",\"dictName\":\"是授权分公司sap权限\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:43:47');
INSERT INTO `sys_oper_log` VALUES (227, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"params\":{},\"dictType\":\"off_code_author\",\"dictLabel\":\"是的我需要获得分公司sap权限\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:44:23');
INSERT INTO `sys_oper_log` VALUES (228, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"off_code_author\",\"dictLabel\":\"我没有sap账号或不需要授权\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:44:52');
INSERT INTO `sys_oper_log` VALUES (229, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"remark\":\" 岗位名称\",\"params\":{},\"dictType\":\"pos_names\",\"createBy\":\"admin\",\"dictName\":\"pos_names\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:46:05');
INSERT INTO `sys_oper_log` VALUES (230, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"remark\":\" 岗位名称\",\"dictId\":105,\"params\":{},\"dictType\":\"pos_names\",\"createBy\":\"admin\",\"createTime\":1606801565000,\"updateBy\":\"admin\",\"dictName\":\" 岗位名称\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:46:19');
INSERT INTO `sys_oper_log` VALUES (231, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"pos_names\",\"dictLabel\":\"收银员/店务管理\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:47:18');
INSERT INTO `sys_oper_log` VALUES (232, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"params\":{},\"dictType\":\"pos_names\",\"dictLabel\":\"文员\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:47:35');
INSERT INTO `sys_oper_log` VALUES (233, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":2,\"params\":{},\"dictType\":\"pos_names\",\"dictLabel\":\"主管\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:47:44');
INSERT INTO `sys_oper_log` VALUES (234, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":3,\"params\":{},\"dictType\":\"pos_names\",\"dictLabel\":\"经理\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:47:53');
INSERT INTO `sys_oper_log` VALUES (235, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"dictSort\":4,\"params\":{},\"dictType\":\"pos_names\",\"dictLabel\":\"管理员\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:48:09');
INSERT INTO `sys_oper_log` VALUES (236, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"params\":{},\"dictType\":\"tz_author\",\"createBy\":\"admin\",\"dictName\":\"中台权限\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:48:55');
INSERT INTO `sys_oper_log` VALUES (237, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"0\",\"dictSort\":0,\"params\":{},\"dictType\":\"tz_author\",\"dictLabel\":\"营运\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:50:12');
INSERT INTO `sys_oper_log` VALUES (238, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":1,\"params\":{},\"dictType\":\"tz_author\",\"dictLabel\":\"营运/信息\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:50:39');
INSERT INTO `sys_oper_log` VALUES (239, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":2,\"params\":{},\"dictType\":\"tz_author\",\"dictLabel\":\"信息\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:50:49');
INSERT INTO `sys_oper_log` VALUES (240, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"dictSort\":3,\"params\":{},\"dictType\":\"tz_author\",\"dictLabel\":\"信息/财务\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:51:11');
INSERT INTO `sys_oper_log` VALUES (241, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"dictSort\":4,\"params\":{},\"dictType\":\"tz_author\",\"dictLabel\":\"财务\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:51:28');
INSERT INTO `sys_oper_log` VALUES (242, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"5\",\"dictSort\":5,\"params\":{},\"dictType\":\"tz_author\",\"dictLabel\":\"总经理\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:51:36');
INSERT INTO `sys_oper_log` VALUES (243, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"dictSort\":4,\"params\":{},\"dictType\":\"tz_author\",\"dictLabel\":\"财务组\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1606801888000,\"dictCode\":131,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:51:46');
INSERT INTO `sys_oper_log` VALUES (244, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_author_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 13:52:37');
INSERT INTO `sys_oper_log` VALUES (245, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":144,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"it\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606801957000,\"tableId\":12,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":145,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单编号\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606801957000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":146,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"大区\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606801957000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":147,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pstname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"岗位名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606801957000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"pstname\"},{\"usableColumn\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:07:00');
INSERT INTO `sys_oper_log` VALUES (246, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-01 14:07:11');
INSERT INTO `sys_oper_log` VALUES (247, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":144,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"it\",\"updateTime\":1606802820000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606801957000,\"tableId\":12,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":145,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单编号\",\"isQuery\":\"1\",\"updateTime\":1606802820000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606801957000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":146,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"大区\",\"isQuery\":\"1\",\"updateTime\":1606802820000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606801957000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":147,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pstname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"岗位名称\",\"isQuery\":\"1\",\"updateTime\":1606802820000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:11:53');
INSERT INTO `sys_oper_log` VALUES (248, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":144,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"it\",\"updateTime\":1606803112000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606801957000,\"tableId\":12,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":145,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单编号\",\"isQuery\":\"1\",\"updateTime\":1606803112000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606801957000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":146,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"大区\",\"isQuery\":\"1\",\"updateTime\":1606803112000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606801957000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":147,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pstname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"岗位名称\",\"isQuery\":\"1\",\"updateTime\":1606803112000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:15:37');
INSERT INTO `sys_oper_log` VALUES (249, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-01 14:15:41');
INSERT INTO `sys_oper_log` VALUES (250, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2045', '127.0.0.1', '内网IP', '{menuId=2045}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:20:09');
INSERT INTO `sys_oper_log` VALUES (251, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2032', '127.0.0.1', '内网IP', '{menuId=2032}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:21:18');
INSERT INTO `sys_oper_log` VALUES (252, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2031', '127.0.0.1', '内网IP', '{menuId=2031}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:21:21');
INSERT INTO `sys_oper_log` VALUES (253, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2030', '127.0.0.1', '内网IP', '{menuId=2030}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:21:25');
INSERT INTO `sys_oper_log` VALUES (254, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2029', '127.0.0.1', '内网IP', '{menuId=2029}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:21:28');
INSERT INTO `sys_oper_log` VALUES (255, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2028', '127.0.0.1', '内网IP', '{menuId=2028}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:21:31');
INSERT INTO `sys_oper_log` VALUES (256, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2027', '127.0.0.1', '内网IP', '{menuId=2027}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:21:34');
INSERT INTO `sys_oper_log` VALUES (257, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2051', '127.0.0.1', '内网IP', '{menuId=2051}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:22:01');
INSERT INTO `sys_oper_log` VALUES (258, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2050', '127.0.0.1', '内网IP', '{menuId=2050}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:22:04');
INSERT INTO `sys_oper_log` VALUES (259, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2049', '127.0.0.1', '内网IP', '{menuId=2049}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:22:05');
INSERT INTO `sys_oper_log` VALUES (260, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2048', '127.0.0.1', '内网IP', '{menuId=2048}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:22:07');
INSERT INTO `sys_oper_log` VALUES (261, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2047', '127.0.0.1', '内网IP', '{menuId=2047}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:22:09');
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2046', '127.0.0.1', '内网IP', '{menuId=2046}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:22:14');
INSERT INTO `sys_oper_log` VALUES (263, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":144,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"it\",\"updateTime\":1606803337000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606801957000,\"tableId\":12,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":145,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单编号\",\"isQuery\":\"1\",\"updateTime\":1606803337000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606801957000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":146,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"大区\",\"isQuery\":\"1\",\"updateTime\":1606803337000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606801957000,\"isEdit\":\"1\",\"tableId\":12,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":147,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pstname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"岗位名称\",\"isQuery\":\"1\",\"updateTime\":1606803337000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:26:36');
INSERT INTO `sys_oper_log` VALUES (264, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-01 14:26:38');
INSERT INTO `sys_oper_log` VALUES (265, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/12', '127.0.0.1', '内网IP', '{tableIds=12}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:37:23');
INSERT INTO `sys_oper_log` VALUES (266, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_author_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:37:29');
INSERT INTO `sys_oper_log` VALUES (267, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":164,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606804649000,\"tableId\":13,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":165,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"\'单号id\'\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606804649000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":166,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"\'大区\'\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606804649000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":167,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pstname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"\'岗位名称\'\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606804649000,\"isEdit\":\"1\",\"tableId\":13,\"pk\":false,\"columnName\":\"pstname\"},{\"usableColumn\":false,\"col', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:39:11');
INSERT INTO `sys_oper_log` VALUES (268, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2038', '127.0.0.1', '内网IP', '{menuId=2038}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:39:58');
INSERT INTO `sys_oper_log` VALUES (269, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2037', '127.0.0.1', '内网IP', '{menuId=2037}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:40:00');
INSERT INTO `sys_oper_log` VALUES (270, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2036', '127.0.0.1', '内网IP', '{menuId=2036}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:40:02');
INSERT INTO `sys_oper_log` VALUES (271, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2035', '127.0.0.1', '内网IP', '{menuId=2035}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:40:04');
INSERT INTO `sys_oper_log` VALUES (272, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2034', '127.0.0.1', '内网IP', '{menuId=2034}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:40:08');
INSERT INTO `sys_oper_log` VALUES (273, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2057', '127.0.0.1', '内网IP', '{menuId=2057}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:41:22');
INSERT INTO `sys_oper_log` VALUES (274, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2056', '127.0.0.1', '内网IP', '{menuId=2056}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:41:25');
INSERT INTO `sys_oper_log` VALUES (275, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2055', '127.0.0.1', '内网IP', '{menuId=2055}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:41:27');
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2053', '127.0.0.1', '内网IP', '{menuId=2053}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:41:30');
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2054', '127.0.0.1', '内网IP', '{menuId=2054}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:41:33');
INSERT INTO `sys_oper_log` VALUES (278, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2052', '127.0.0.1', '内网IP', '{menuId=2052}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:41:36');
INSERT INTO `sys_oper_log` VALUES (279, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_author_user', '127.0.0.1', '内网IP', '{tableName=sys_author_user}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:43:32');
INSERT INTO `sys_oper_log` VALUES (280, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-01 14:43:34');
INSERT INTO `sys_oper_log` VALUES (281, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/13', '127.0.0.1', '内网IP', '{tableIds=13}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:54:19');
INSERT INTO `sys_oper_log` VALUES (282, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_author_user_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:54:25');
INSERT INTO `sys_oper_log` VALUES (283, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":184,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606805665000,\"tableId\":14,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":185,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"单号id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606805665000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":186,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"大区\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606805665000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":187,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pstname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"岗位名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606805665000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"pstname\"},{\"usableColumn\":false,\"columnId\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:57:00');
INSERT INTO `sys_oper_log` VALUES (284, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":184,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1606805820000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606805665000,\"tableId\":14,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":185,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"单号id\",\"isQuery\":\"1\",\"updateTime\":1606805820000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606805665000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":186,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"大区\",\"isQuery\":\"1\",\"updateTime\":1606805820000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606805665000,\"isEdit\":\"1\",\"tableId\":14,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":187,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pstname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"岗位名称\",\"isQuery\":\"1\",\"updateTime\":1606805820000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 14:57:14');
INSERT INTO `sys_oper_log` VALUES (285, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-01 14:57:18');
INSERT INTO `sys_oper_log` VALUES (286, 'sys_author_user_data', 1, 'com.ruoyi.system.controller.SysAuthorUserDataController.add()', 'POST', 1, 'admin', NULL, '/system/sys_author_user_data', '127.0.0.1', '内网IP', '{\"id\":3,\"orderid\":\"1\",\"params\":{},\"region\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:02:55');
INSERT INTO `sys_oper_log` VALUES (287, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/14', '127.0.0.1', '内网IP', '{tableIds=14}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:08:42');
INSERT INTO `sys_oper_log` VALUES (288, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_author_user_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:08:49');
INSERT INTO `sys_oper_log` VALUES (289, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":204,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606806528000,\"tableId\":15,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":205,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"单号id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606806528000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":206,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"大区\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606806528000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":207,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pstname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"岗位名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606806528000,\"isEdit\":\"1\",\"tableId\":15,\"pk\":false,\"columnName\":\"pstname\"},{\"usableColumn\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:10:09');
INSERT INTO `sys_oper_log` VALUES (290, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/sys_author_user_data', '127.0.0.1', '内网IP', '{tableName=sys_author_user_data}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:10:45');
INSERT INTO `sys_oper_log` VALUES (291, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-01 15:10:47');
INSERT INTO `sys_oper_log` VALUES (292, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2063', '127.0.0.1', '内网IP', '{menuId=2063}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:28');
INSERT INTO `sys_oper_log` VALUES (293, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2062', '127.0.0.1', '内网IP', '{menuId=2062}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:31');
INSERT INTO `sys_oper_log` VALUES (294, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2061', '127.0.0.1', '内网IP', '{menuId=2061}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:34');
INSERT INTO `sys_oper_log` VALUES (295, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2060', '127.0.0.1', '内网IP', '{menuId=2060}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:36');
INSERT INTO `sys_oper_log` VALUES (296, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2059', '127.0.0.1', '内网IP', '{menuId=2059}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:38');
INSERT INTO `sys_oper_log` VALUES (297, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2058', '127.0.0.1', '内网IP', '{menuId=2058}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:41');
INSERT INTO `sys_oper_log` VALUES (298, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2069', '127.0.0.1', '内网IP', '{menuId=2069}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:48');
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2068', '127.0.0.1', '内网IP', '{menuId=2068}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:51');
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2067', '127.0.0.1', '内网IP', '{menuId=2067}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:53');
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2066', '127.0.0.1', '内网IP', '{menuId=2066}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:55');
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2065', '127.0.0.1', '内网IP', '{menuId=2065}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:57');
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2064', '127.0.0.1', '内网IP', '{menuId=2064}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:14:59');
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{menuId=2005}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:10');
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{menuId=2004}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:13');
INSERT INTO `sys_oper_log` VALUES (306, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{menuId=2003}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:15');
INSERT INTO `sys_oper_log` VALUES (307, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2002', '127.0.0.1', '内网IP', '{menuId=2002}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:17');
INSERT INTO `sys_oper_log` VALUES (308, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2001', '127.0.0.1', '内网IP', '{menuId=2001}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:20');
INSERT INTO `sys_oper_log` VALUES (309, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2000', '127.0.0.1', '内网IP', '{menuId=2000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:25');
INSERT INTO `sys_oper_log` VALUES (310, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2044', '127.0.0.1', '内网IP', '{menuId=2044}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:30');
INSERT INTO `sys_oper_log` VALUES (311, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2043', '127.0.0.1', '内网IP', '{menuId=2043}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:33');
INSERT INTO `sys_oper_log` VALUES (312, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2042', '127.0.0.1', '内网IP', '{menuId=2042}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:36');
INSERT INTO `sys_oper_log` VALUES (313, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2041', '127.0.0.1', '内网IP', '{menuId=2041}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:39');
INSERT INTO `sys_oper_log` VALUES (314, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2040', '127.0.0.1', '内网IP', '{menuId=2040}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:42');
INSERT INTO `sys_oper_log` VALUES (315, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2039', '127.0.0.1', '内网IP', '{menuId=2039}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:15:47');
INSERT INTO `sys_oper_log` VALUES (316, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_author_user_data_copy1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:17:15');
INSERT INTO `sys_oper_log` VALUES (317, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":224,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606807035000,\"tableId\":16,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":225,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"单号id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606807035000,\"isEdit\":\"1\",\"tableId\":16,\"pk\":false,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":226,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"大区\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606807035000,\"isEdit\":\"1\",\"tableId\":16,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":227,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pstname\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"岗位名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606807035000,\"isEdit\":\"1\",\"tableId\":16,\"pk\":false,\"columnName\":\"pstname\"},{\"usableColumn\":false,\"columnId\":2', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:18:47');
INSERT INTO `sys_oper_log` VALUES (318, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-01 15:18:51');
INSERT INTO `sys_oper_log` VALUES (319, 'sys_author', 1, 'com.ruoyi.system.controller.SysAuthorUserDataCopy1Controller.add()', 'POST', 1, 'admin', NULL, '/system/sys_author', '127.0.0.1', '内网IP', '{\"pstname\":\"22\",\"id\":4,\"orderid\":\"11\",\"params\":{},\"region\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:22:25');
INSERT INTO `sys_oper_log` VALUES (320, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_author_user', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:31:56');
INSERT INTO `sys_oper_log` VALUES (321, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/16', '127.0.0.1', '内网IP', '{tableIds=16}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:32:05');
INSERT INTO `sys_oper_log` VALUES (322, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"ruoyi\",\"columns\":[{\"usableColumn\":false,\"columnId\":244,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606807916000,\"tableId\":17,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":245,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"单号id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606807916000,\"isEdit\":\"1\",\"tableId\":17,\"pk\":false,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":246,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"大区\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606807916000,\"isEdit\":\"1\",\"tableId\":17,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":247,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"pstName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"岗位名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(45)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606807916000,\"isEdit\":\"1\",\"tableId\":17,\"pk\":false,\"columnName\":\"pst_name\"},{\"usableColumn\":false,\"column', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 15:33:26');
INSERT INTO `sys_oper_log` VALUES (323, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-01 15:33:29');
INSERT INTO `sys_oper_log` VALUES (324, 'SysAuthorUser', 2, 'com.ruoyi.system.controller.SysAuthorUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/SysAuthorUser', '127.0.0.1', '内网IP', '{\"pstName\":\"管理员\",\"nameUser\":\"丰富的\",\"ztAuthor\":\"2\",\"posNames\":\"1\",\"id\":5,\"offAccess\":\"0\",\"offCode\":\"70114\",\"orderid\":\"22\",\"params\":{},\"nameCode\":\"0177412\",\"posShop\":\"门店\",\"region\":\"华东大区\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 16:18:18');
INSERT INTO `sys_oper_log` VALUES (325, 'SysAuthorUser', 1, 'com.ruoyi.system.controller.SysAuthorUserController.add()', 'POST', 1, 'admin', NULL, '/system/SysAuthorUser', '127.0.0.1', '内网IP', '{\"posText\":\"22\",\"pstName\":\"332\",\"nameUser\":\"22\",\"ztAuthor\":\"4\",\"posNames\":\"3\",\"id\":6,\"offAccess\":\"0\",\"offCode\":\"22\",\"orderid\":\"2223\",\"params\":{},\"gp5\":\"22\",\"nameCode\":\"22\",\"posShop\":\"22\",\"region\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 16:18:40');
INSERT INTO `sys_oper_log` VALUES (326, 'SysAuthorUser', 2, 'com.ruoyi.system.controller.SysAuthorUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/SysAuthorUser', '127.0.0.1', '内网IP', '{\"posText\":\"22\",\"pstName\":\"332\",\"nameUser\":\"22\",\"ztAuthor\":\"4\",\"posNames\":\"3\",\"id\":6,\"offAccess\":\"0\",\"offCode\":\"22\",\"orderid\":\"2223\",\"params\":{},\"gp5\":\"22\",\"nameCode\":\"870114\",\"posShop\":\"22\",\"region\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 16:29:11');
INSERT INTO `sys_oper_log` VALUES (327, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"申请用户和权限\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"SysAuthorUser\",\"component\":\"system/SysAuthorUser/index\",\"children\":[],\"createTime\":1606808379000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2124,\"menuType\":\"C\",\"perms\":\"system:SysAuthorUser:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 16:34:28');
INSERT INTO `sys_oper_log` VALUES (328, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_appmanid', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 21:57:44');
INSERT INTO `sys_oper_log` VALUES (329, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/18', '127.0.0.1', '内网IP', '{tableIds=18}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 22:00:42');
INSERT INTO `sys_oper_log` VALUES (330, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_appmanid', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 22:00:46');
INSERT INTO `sys_oper_log` VALUES (331, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":277,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606831246000,\"tableId\":19,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":278,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"typeScene\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"业务场景\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606831246000,\"isEdit\":\"1\",\"tableId\":19,\"pk\":false,\"columnName\":\"type_scene\"},{\"usableColumn\":false,\"columnId\":279,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"corpid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司id\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606831246000,\"isEdit\":\"1\",\"tableId\":19,\"pk\":false,\"columnName\":\"corpid\"},{\"usableColumn\":false,\"columnId\":280,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"suerid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606831246000,\"isEdit\":\"1\",\"tableId\":19,\"pk\":false,\"columnName\":\"suerid\"},{\"usableColumn\":false,\"col', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 22:02:56');
INSERT INTO `sys_oper_log` VALUES (332, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"github\",\"orderNum\":\"6\",\"menuName\":\"微信服务\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"weixin\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 22:04:16');
INSERT INTO `sys_oper_log` VALUES (333, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":277,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1606831376000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606831246000,\"tableId\":19,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":278,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"typeScene\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"业务场景\",\"isQuery\":\"1\",\"updateTime\":1606831376000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606831246000,\"isEdit\":\"1\",\"tableId\":19,\"pk\":false,\"columnName\":\"type_scene\"},{\"usableColumn\":false,\"columnId\":279,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"corpid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"公司id\",\"isQuery\":\"1\",\"updateTime\":1606831376000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606831246000,\"isEdit\":\"1\",\"tableId\":19,\"pk\":false,\"columnName\":\"corpid\"},{\"usableColumn\":false,\"columnId\":280,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"suerid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"用户id\",\"isQuery\":\"1\",\"updateTime\":1606831376000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"crea', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 22:05:03');
INSERT INTO `sys_oper_log` VALUES (334, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-01 22:05:06');
INSERT INTO `sys_oper_log` VALUES (335, 'SysAppmanid', 1, 'com.ruoyi.system.controller.SysAppmanidController.add()', 'POST', 1, 'admin', NULL, '/system/appmanid', '127.0.0.1', '内网IP', '{\"corpid\":\"wwaa46bcce7b1f388a\",\"secret\":\"q7OgmArKfeOKO_m6zFZX1FIDa-jCopS0MXaVMzrVhNM\",\"params\":{},\"typeScene\":\"token\",\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 22:10:37');
INSERT INTO `sys_oper_log` VALUES (336, 'SysAppmanid', 2, 'com.ruoyi.system.controller.SysAppmanidController.edit()', 'PUT', 1, 'admin', NULL, '/system/appmanid', '127.0.0.1', '内网IP', '{\"corpid\":\"wwaa46bcce7b1f388a\",\"secret\":\"q7OgmArKfeOKO_m6zFZX1FIDa-jCopS0MXaVMzrVhNM\",\"params\":{},\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/gettoken?\",\"typeScene\":\"token\",\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-01 22:15:08');
INSERT INTO `sys_oper_log` VALUES (337, 'man_data', 1, 'com.ruoyi.system.controller.SysManDataController.add()', 'POST', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"222\",\"shopName\":\"221\",\"params\":{},\"shopAddress\":\"221\",\"id\":7,\"shopType\":\"2\",\"offAccanting\":\"1\",\"offName\":\"周黑鸭2020\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 09:21:37');
INSERT INTO `sys_oper_log` VALUES (338, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/7', '127.0.0.1', '内网IP', '{id=7}', 'null', 1, '', '2020-12-02 09:21:46');
INSERT INTO `sys_oper_log` VALUES (339, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/7', '127.0.0.1', '内网IP', '{id=7}', 'null', 1, '', '2020-12-02 09:22:01');
INSERT INTO `sys_oper_log` VALUES (340, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/7', '127.0.0.1', '内网IP', '{id=7}', 'null', 1, '', '2020-12-02 09:24:48');
INSERT INTO `sys_oper_log` VALUES (341, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/7', '127.0.0.1', '内网IP', '{id=7}', 'null', 1, '', '2020-12-02 09:25:00');
INSERT INTO `sys_oper_log` VALUES (342, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/7', '127.0.0.1', '内网IP', '{id=7}', 'null', 1, '', '2020-12-02 09:26:51');
INSERT INTO `sys_oper_log` VALUES (343, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 09:29:45');
INSERT INTO `sys_oper_log` VALUES (344, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 09:30:46');
INSERT INTO `sys_oper_log` VALUES (345, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/7', '127.0.0.1', '内网IP', '{id=7}', 'null', 1, '', '2020-12-02 09:33:29');
INSERT INTO `sys_oper_log` VALUES (346, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/7,4', '127.0.0.1', '内网IP', '{id=7,4}', 'null', 1, '', '2020-12-02 09:45:01');
INSERT INTO `sys_oper_log` VALUES (347, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/7,4', '127.0.0.1', '内网IP', '{id=7,4}', 'null', 1, '', '2020-12-02 09:47:44');
INSERT INTO `sys_oper_log` VALUES (348, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/7', '127.0.0.1', '内网IP', '{id=7}', 'null', 1, '', '2020-12-02 09:49:00');
INSERT INTO `sys_oper_log` VALUES (349, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 10:03:08');
INSERT INTO `sys_oper_log` VALUES (350, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/5', '127.0.0.1', '内网IP', '{id=5}', 'null', 1, '', '2020-12-02 10:18:03');
INSERT INTO `sys_oper_log` VALUES (351, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/5,2', '127.0.0.1', '内网IP', '{id=5,2}', 'null', 1, '', '2020-12-02 10:19:04');
INSERT INTO `sys_oper_log` VALUES (352, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/5,2', '127.0.0.1', '内网IP', '{id=5,2}', 'null', 1, '', '2020-12-02 10:22:06');
INSERT INTO `sys_oper_log` VALUES (353, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/5,2', '127.0.0.1', '内网IP', '{id=5,2}', 'null', 1, '', '2020-12-02 10:28:16');
INSERT INTO `sys_oper_log` VALUES (354, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 10:30:39');
INSERT INTO `sys_oper_log` VALUES (355, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 10:40:47');
INSERT INTO `sys_oper_log` VALUES (356, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 10:42:04');
INSERT INTO `sys_oper_log` VALUES (357, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 10:47:43');
INSERT INTO `sys_oper_log` VALUES (358, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 10:48:40');
INSERT INTO `sys_oper_log` VALUES (359, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 10:49:40');
INSERT INTO `sys_oper_log` VALUES (360, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 10:52:03');
INSERT INTO `sys_oper_log` VALUES (361, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 11:15:30');
INSERT INTO `sys_oper_log` VALUES (362, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 11:16:30');
INSERT INTO `sys_oper_log` VALUES (363, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 11:25:20');
INSERT INTO `sys_oper_log` VALUES (364, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 11:34:43');
INSERT INTO `sys_oper_log` VALUES (365, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 11:50:56');
INSERT INTO `sys_oper_log` VALUES (366, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 11:52:42');
INSERT INTO `sys_oper_log` VALUES (367, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 11:59:23');
INSERT INTO `sys_oper_log` VALUES (368, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 12:05:29');
INSERT INTO `sys_oper_log` VALUES (369, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '', '2020-12-02 12:09:03');
INSERT INTO `sys_oper_log` VALUES (370, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'access_token\' at row 1\n### The error may exist in file [/home/liu/tx_maindata/ruoyi-system/target/classes/mapper/system/SysAppmanidMapper.xml]\n### The error may involve com.ruoyi.system.mapper.SysAppmanidMapper.updateSysAppmanid-Inline\n### The error occurred while setting parameters\n### SQL: update sys_appmanid          SET access_token = ?          where id = ?\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'access_token\' at row 1\n; Data truncation: Data too long for column \'access_token\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'access_token\' at row 1', '2020-12-02 12:11:52');
INSERT INTO `sys_oper_log` VALUES (371, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'access_token\' at row 1\n### The error may exist in file [/home/liu/tx_maindata/ruoyi-system/target/classes/mapper/system/SysAppmanidMapper.xml]\n### The error may involve com.ruoyi.system.mapper.SysAppmanidMapper.updateSysAppmanid-Inline\n### The error occurred while setting parameters\n### SQL: update sys_appmanid          SET access_token = ?          where id = ?\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'access_token\' at row 1\n; Data truncation: Data too long for column \'access_token\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'access_token\' at row 1', '2020-12-02 12:12:02');
INSERT INTO `sys_oper_log` VALUES (372, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:15:54');
INSERT INTO `sys_oper_log` VALUES (373, 'SysAppmanid', 2, 'com.ruoyi.system.controller.SysAppmanidController.edit()', 'PUT', 1, 'admin', NULL, '/system/appmanid', '127.0.0.1', '内网IP', '{\"corpid\":\"wwaa46bcce7b1f388\",\"secret\":\"q7OgmArKfeOKO_m6zFZX1FIDa-jCopS0MXaVMzrVhNM\",\"accessToken\":\"EQPKzS1w7NfJJ0EXog5321kVx2JcqqGdYP0Ly0W_ccBhjhYJQK6KINt92rOd6RccUfitCXGut1eYC4u0plWlrgO5n2OH0zXO2QHm1SjROFGofcDg7x1jDSpsClmaZuL-7vlBrV9SDwWTQVQhQUpwVpUlUaiC-tkVSfYDZyNGCY2mSHEDF_OqKPjoS0w6YZQzHwFR2N_uXyCfB0wKdjOXAA\",\"params\":{},\"guard1\":\"wwaa46bcce7b1f388a\",\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/gettoken\",\"typeScene\":\"token\",\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:31:28');
INSERT INTO `sys_oper_log` VALUES (374, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\n### The error may exist in file [/home/liu/tx_maindata/ruoyi-system/target/classes/mapper/system/SysAppmanidMapper.xml]\n### The error may involve com.ruoyi.system.mapper.SysAppmanidMapper.updateSysAppmanid-Inline\n### The error occurred while setting parameters\n### SQL: update sys_appmanid                    where id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3', '2020-12-02 12:31:41');
INSERT INTO `sys_oper_log` VALUES (375, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', 'null', 1, '\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\n### The error may exist in file [/home/liu/tx_maindata/ruoyi-system/target/classes/mapper/system/SysAppmanidMapper.xml]\n### The error may involve com.ruoyi.system.mapper.SysAppmanidMapper.updateSysAppmanid-Inline\n### The error occurred while setting parameters\n### SQL: update sys_appmanid                    where id = ?\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'where id = 1\' at line 3', '2020-12-02 12:33:30');
INSERT INTO `sys_oper_log` VALUES (376, 'SysAppmanid', 2, 'com.ruoyi.system.controller.SysAppmanidController.edit()', 'PUT', 1, 'admin', NULL, '/system/appmanid', '127.0.0.1', '内网IP', '{\"corpid\":\"wwaa46bcce7b1f388a\",\"secret\":\"q7OgmArKfeOKO_m6zFZX1FIDa-jCopS0MXaVMzrVhNM\",\"accessToken\":\"EQPKzS1w7NfJJ0EXog5321kVx2JcqqGdYP0Ly0W_ccBhjhYJQK6KINt92rOd6RccUfitCXGut1eYC4u0plWlrgO5n2OH0zXO2QHm1SjROFGofcDg7x1jDSpsClmaZuL-7vlBrV9SDwWTQVQhQUpwVpUlUaiC-tkVSfYDZyNGCY2mSHEDF_OqKPjoS0w6YZQzHwFR2N_uXyCfB0wKdjOXAA\",\"params\":{},\"guard1\":\"wwaa46bcce7b1f388a\",\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/gettoken\",\"typeScene\":\"token\",\"id\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:42:10');
INSERT INTO `sys_oper_log` VALUES (377, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:42:35');
INSERT INTO `sys_oper_log` VALUES (378, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_msg_text', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:44:56');
INSERT INTO `sys_oper_log` VALUES (379, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/4', '127.0.0.1', '内网IP', '{tableIds=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:45:02');
INSERT INTO `sys_oper_log` VALUES (380, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/6', '127.0.0.1', '内网IP', '{tableIds=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:45:06');
INSERT INTO `sys_oper_log` VALUES (381, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/5', '127.0.0.1', '内网IP', '{tableIds=5}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:45:11');
INSERT INTO `sys_oper_log` VALUES (382, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":290,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606884296000,\"tableId\":20,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":291,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"touser\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指定接收消息的成员\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606884296000,\"isEdit\":\"1\",\"tableId\":20,\"pk\":false,\"columnName\":\"touser\"},{\"usableColumn\":false,\"columnId\":292,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"toparty\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指定接收消息的部门\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606884296000,\"isEdit\":\"1\",\"tableId\":20,\"pk\":false,\"columnName\":\"toparty\"},{\"usableColumn\":false,\"columnId\":293,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"totag\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指定接收消息的标签\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606884296000,\"isEdit\":\"1\",\"tableId\":20,\"pk\":false,\"columnName\":\"totag\"},{', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:49:22');
INSERT INTO `sys_oper_log` VALUES (383, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-02 12:49:26');
INSERT INTO `sys_oper_log` VALUES (384, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/20', '127.0.0.1', '内网IP', '{tableIds=20}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:52:19');
INSERT INTO `sys_oper_log` VALUES (385, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_msg_text', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:52:26');
INSERT INTO `sys_oper_log` VALUES (386, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":301,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606884746000,\"tableId\":21,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":302,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"yeuwType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"业务类型\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606884746000,\"isEdit\":\"1\",\"tableId\":21,\"pk\":false,\"columnName\":\"yeuw_type\"},{\"usableColumn\":false,\"columnId\":303,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"touser\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指定接收消息的成员\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606884746000,\"isEdit\":\"1\",\"tableId\":21,\"pk\":false,\"columnName\":\"touser\"},{\"usableColumn\":false,\"columnId\":304,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"toparty\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指定接收消息的部门\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606884746000,\"isEdit\":\"1\",\"tableId\":21,\"pk\":false,\"columnName\":\"toparty\"},{\"usableColumn', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 12:58:40');
INSERT INTO `sys_oper_log` VALUES (387, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"remark\":\"审核步骤选项\",\"params\":{},\"dictType\":\"examine_msg\",\"createBy\":\"admin\",\"dictName\":\"审核步骤\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:00:46');
INSERT INTO `sys_oper_log` VALUES (388, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"examine_msg\",\"dictLabel\":\"one\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:01:04');
INSERT INTO `sys_oper_log` VALUES (389, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"dictSort\":0,\"params\":{},\"dictType\":\"examine_msg\",\"dictLabel\":\"two\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:01:14');
INSERT INTO `sys_oper_log` VALUES (390, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"dictSort\":0,\"params\":{},\"dictType\":\"examine_msg\",\"dictLabel\":\"two\",\"createBy\":\"admin\",\"default\":false,\"isDefault\":\"N\",\"createTime\":1606885274000,\"dictCode\":134,\"updateBy\":\"admin\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:01:23');
INSERT INTO `sys_oper_log` VALUES (391, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":301,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1606885120000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606884746000,\"tableId\":21,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":302,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"examine_msg\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"yeuwType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"业务类型\",\"isQuery\":\"1\",\"updateTime\":1606885120000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606884746000,\"isEdit\":\"1\",\"tableId\":21,\"pk\":false,\"columnName\":\"yeuw_type\"},{\"usableColumn\":false,\"columnId\":303,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"touser\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指定接收消息的成员\",\"isQuery\":\"1\",\"updateTime\":1606885120000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606884746000,\"isEdit\":\"1\",\"tableId\":21,\"pk\":false,\"columnName\":\"touser\"},{\"usableColumn\":false,\"columnId\":304,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"toparty\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指定接收消息的部门\",\"isQuery\":\"1\",\"updateTime\":1606885120000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"a', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:01:54');
INSERT INTO `sys_oper_log` VALUES (392, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-02 13:02:02');
INSERT INTO `sys_oper_log` VALUES (393, '消息管理', 1, 'com.ruoyi.system.controller.SysMsgTextController.add()', 'POST', 1, 'admin', NULL, '/system/msg_text', '127.0.0.1', '内网IP', '{\"touser\":\"LiuFuLing\",\"params\":{},\"yeuwType\":\"1\",\"id\":1,\"msgtype\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:09:12');
INSERT INTO `sys_oper_log` VALUES (394, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":301,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1606885314000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606884746000,\"tableId\":21,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":302,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"examine_msg\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"yeuwType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"业务类型\",\"isQuery\":\"1\",\"updateTime\":1606885314000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606884746000,\"isEdit\":\"1\",\"tableId\":21,\"pk\":false,\"columnName\":\"yeuw_type\"},{\"usableColumn\":false,\"columnId\":303,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"touser\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指定接收消息的成员\",\"isQuery\":\"1\",\"updateTime\":1606885314000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606884746000,\"isEdit\":\"1\",\"tableId\":21,\"pk\":false,\"columnName\":\"touser\"},{\"usableColumn\":false,\"columnId\":304,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"toparty\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指定接收消息的部门\",\"isQuery\":\"1\",\"updateTime\":1606885314000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"a', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:22:58');
INSERT INTO `sys_oper_log` VALUES (395, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-02 13:23:04');
INSERT INTO `sys_oper_log` VALUES (396, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/21', '127.0.0.1', '内网IP', '{tableIds=21}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:31:30');
INSERT INTO `sys_oper_log` VALUES (397, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_msg_text', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:31:37');
INSERT INTO `sys_oper_log` VALUES (398, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":313,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606887097000,\"tableId\":22,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":314,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"examine_msg\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"yeuwType\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"业务类型\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606887097000,\"isEdit\":\"1\",\"tableId\":22,\"pk\":false,\"columnName\":\"yeuw_type\"},{\"usableColumn\":false,\"columnId\":315,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"touser\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指定接收消息的成员\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606887097000,\"isEdit\":\"1\",\"tableId\":22,\"pk\":false,\"columnName\":\"touser\"},{\"usableColumn\":false,\"columnId\":316,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"toparty\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"指定接收消息的部门\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606887097000,\"isEdit\":\"1\",\"tableId\":22,\"pk\":false,\"columnName\":\"toparty\"},{\"u', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:33:20');
INSERT INTO `sys_oper_log` VALUES (399, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-02 13:33:23');
INSERT INTO `sys_oper_log` VALUES (400, '消息管理', 2, 'com.ruoyi.system.controller.SysMsgTextController.edit()', 'PUT', 1, 'admin', NULL, '/system/msg_text', '127.0.0.1', '内网IP', '{\"touser\":\"LiuFuLing\",\"params\":{},\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/message/send\",\"yeuwType\":\"1\",\"id\":1,\"msgtype\":\"\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:35:49');
INSERT INTO `sys_oper_log` VALUES (401, '消息管理', 2, 'com.ruoyi.system.controller.SysMsgTextController.edit()', 'PUT', 1, 'admin', NULL, '/system/msg_text', '127.0.0.1', '内网IP', '{\"touser\":\"LiuFuLing\",\"params\":{},\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/message/send\",\"yeuwType\":\"1\",\"id\":1,\"msgtype\":\"text\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:36:34');
INSERT INTO `sys_oper_log` VALUES (402, '消息管理', 2, 'com.ruoyi.system.controller.SysMsgTextController.edit()', 'PUT', 1, 'admin', NULL, '/system/msg_text', '127.0.0.1', '内网IP', '{\"agentid\":1000002,\"touser\":\"LiuFuLing\",\"params\":{},\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/message/send\",\"yeuwType\":\"1\",\"id\":1,\"msgtype\":\"text\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:37:25');
INSERT INTO `sys_oper_log` VALUES (403, '消息管理', 2, 'com.ruoyi.system.controller.SysMsgTextController.edit()', 'PUT', 1, 'admin', NULL, '/system/msg_text', '127.0.0.1', '内网IP', '{\"agentid\":1000002,\"touser\":\"LiuFuLing\",\"params\":{},\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/message/send\",\"yeuwType\":\"1\",\"id\":1,\"text\":\"这是一个测试请登录测试网站\",\"msgtype\":\"text\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:39:32');
INSERT INTO `sys_oper_log` VALUES (404, '消息管理', 2, 'com.ruoyi.system.controller.SysMsgTextController.edit()', 'PUT', 1, 'admin', NULL, '/system/msg_text', '127.0.0.1', '内网IP', '{\"agentid\":1000002,\"touser\":\"LiuFuLing\",\"params\":{},\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/message/send\",\"yeuwType\":\"1\",\"id\":1,\"text\":\"这是一个测试请登录测试网站 http://localhost:1024/weixin/msg_text\",\"msgtype\":\"text\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:39:41');
INSERT INTO `sys_oper_log` VALUES (405, '消息管理', 2, 'com.ruoyi.system.controller.SysMsgTextController.edit()', 'PUT', 1, 'admin', NULL, '/system/msg_text', '127.0.0.1', '内网IP', '{\"agentid\":1000002,\"touser\":\"LiuFuLing\",\"enableIdTrans\":\"0\",\"enableDuplicateCheck\":\"0\",\"params\":{},\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/message/send\",\"yeuwType\":\"1\",\"safe\":\"0\",\"duplicateCheckInterval\":\"1800\",\"id\":1,\"text\":\"这是一个测试请登录测试网站 http://localhost:1024/weixin/msg_text\",\"msgtype\":\"text\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 13:39:58');
INSERT INTO `sys_oper_log` VALUES (406, '消息管理', 2, 'com.ruoyi.system.controller.SysMsgTextController.edit()', 'PUT', 1, 'admin', NULL, '/system/msg_text', '127.0.0.1', '内网IP', '{\"agentid\":1000002,\"touser\":\"LiuFuLing\",\"enableIdTrans\":\"0\",\"enableDuplicateCheck\":\"0\",\"params\":{},\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/message/send?\",\"yeuwType\":\"1\",\"safe\":\"0\",\"duplicateCheckInterval\":\"1800\",\"id\":1,\"text\":\"这是一个测试请登录测试网站 http://localhost:1024/weixin/msg_text\",\"msgtype\":\"text\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 14:23:58');
INSERT INTO `sys_oper_log` VALUES (407, 'man_data', 1, 'com.ruoyi.system.controller.SysManDataController.add()', 'POST', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"23231\",\"shopName\":\"232\",\"params\":{},\"shopAddress\":\"1223\",\"id\":8,\"shopType\":\"2\",\"offAccanting\":\"1\",\"offName\":\"H欧皇的\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 14:31:16');
INSERT INTO `sys_oper_log` VALUES (408, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/8', '127.0.0.1', '内网IP', '{id=8}', 'null', 1, 'com.ruoyi.system.domain.SysMsgText cannot be cast to java.util.Map', '2020-12-02 14:31:21');
INSERT INTO `sys_oper_log` VALUES (409, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/8', '127.0.0.1', '内网IP', '{id=8}', 'null', 1, 'com.ruoyi.system.domain.SysMsgText cannot be cast to java.util.Map', '2020-12-02 14:37:18');
INSERT INTO `sys_oper_log` VALUES (410, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/8', '127.0.0.1', '内网IP', '{id=8}', 'null', 1, '', '2020-12-02 14:51:52');
INSERT INTO `sys_oper_log` VALUES (411, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 14:54:43');
INSERT INTO `sys_oper_log` VALUES (412, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 14:56:29');
INSERT INTO `sys_oper_log` VALUES (413, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 15:01:03');
INSERT INTO `sys_oper_log` VALUES (414, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 15:04:20');
INSERT INTO `sys_oper_log` VALUES (415, '消息管理', 2, 'com.ruoyi.system.controller.SysMsgTextController.edit()', 'PUT', 1, 'admin', NULL, '/system/msg_text', '127.0.0.1', '内网IP', '{\"agentid\":1000002,\"touser\":\"LiuFuLing\",\"enableIdTrans\":\"0\",\"enableDuplicateCheck\":\"0\",\"params\":{},\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/message/send?\",\"yeuwType\":\"1\",\"safe\":\"0\",\"duplicateCheckInterval\":\"1800\",\"id\":1,\"text\":\"这是一个测试请登录测试网站\",\"msgtype\":\"text\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 15:05:41');
INSERT INTO `sys_oper_log` VALUES (416, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 15:06:39');
INSERT INTO `sys_oper_log` VALUES (417, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 15:13:55');
INSERT INTO `sys_oper_log` VALUES (418, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 15:16:54');
INSERT INTO `sys_oper_log` VALUES (419, '消息管理', 2, 'com.ruoyi.system.controller.SysMsgTextController.edit()', 'PUT', 1, 'admin', NULL, '/system/msg_text', '127.0.0.1', '内网IP', '{\"agentid\":1000002,\"touser\":\"LiuFuLing\",\"enableIdTrans\":\"0\",\"enableDuplicateCheck\":\"0\",\"params\":{},\"url\":\"https://qyapi.weixin.qq.com/cgi-bin/message/send?\",\"yeuwType\":\"1\",\"safe\":\"0\",\"duplicateCheckInterval\":\"1800\",\"id\":1,\"text\":\"这是一个测试请登录测试网站 https://172.30.90.53:9002/backoffice/login.zul\",\"msgtype\":\"text\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 15:17:26');
INSERT INTO `sys_oper_log` VALUES (420, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.updateuuid()', 'GET', 1, 'admin', NULL, '/system/man_data/updateuuid/2', '127.0.0.1', '内网IP', '{id=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 15:17:40');
INSERT INTO `sys_oper_log` VALUES (421, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"211\",\"offCode\":\"7A001\",\"orderId\":\"202011294dcee38fda9542b49ba84ed8ecf21748\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"22\",\"beiyong1\":\"7A00101\",\"profitcenter\":\"7A00101\",\"offIt\":\"1\",\"id\":3,\"shopType\":\"1\",\"costcenter\":\"7A00101\",\"offAccanting\":\"1\",\"offFico\":\"0\",\"offName\":\"周黑鸭第三托管式特许\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 16:40:54');
INSERT INTO `sys_oper_log` VALUES (422, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"211\",\"offCode\":\"7A001\",\"orderId\":\"202011294dcee38fda9542b49ba84ed8ecf21748\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"22\",\"beiyong1\":\"7A00101\",\"profitcenter\":\"7A00101\",\"offIt\":\"1\",\"id\":3,\"shopType\":\"1\",\"costcenter\":\"7A00101\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"周黑鸭第三托管式特许\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 16:41:00');
INSERT INTO `sys_oper_log` VALUES (423, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"11\",\"offCode\":\"7023\",\"orderId\":\"20201202992af409a2ac4fd9a93587b8e0fcd7d5\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"11\",\"beiyong1\":\"WH0014\",\"beiyong2\":\"11\",\"profitcenter\":\"70230012\",\"offIt\":\"1\",\"id\":2,\"shopType\":\"1\",\"costcenter\":\"70230011\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 16:42:47');
INSERT INTO `sys_oper_log` VALUES (424, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"11\",\"offCode\":\"7023\",\"orderId\":\"20201202992af409a2ac4fd9a93587b8e0fcd7d5\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"11\",\"beiyong1\":\"WH0014\",\"beiyong2\":\"11\",\"profitcenter\":\"70230012\",\"offIt\":\"1\",\"id\":2,\"shopType\":\"1\",\"costcenter\":\"70230011\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 16:46:14');
INSERT INTO `sys_oper_log` VALUES (425, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"11\",\"offCode\":\"7023\",\"orderId\":\"20201202992af409a2ac4fd9a93587b8e0fcd7d5\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"11\",\"beiyong1\":\"WH0014\",\"beiyong2\":\"11\",\"profitcenter\":\"70230012\",\"offIt\":\"1\",\"id\":2,\"shopType\":\"1\",\"costcenter\":\"70230011\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 16:47:15');
INSERT INTO `sys_oper_log` VALUES (426, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"信息\",\"offCode\":\"电风扇\",\"orderId\":\"20201202225c3b241ce743efbc8d8f69fc7a4340\",\"shopName\":\"门店名称\",\"params\":{},\"shopAddress\":\"延安大街\",\"profitcenter\":\"成各种新\",\"id\":5,\"shopType\":\"2\",\"costcenter\":\"东方时尚\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"延安分公司\"}', 'null', 1, '', '2020-12-02 16:54:27');
INSERT INTO `sys_oper_log` VALUES (427, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"信息\",\"offCode\":\"电风扇\",\"orderId\":\"20201202225c3b241ce743efbc8d8f69fc7a4340\",\"shopName\":\"门店名称\",\"params\":{},\"shopAddress\":\"延安大街\",\"profitcenter\":\"成各种新\",\"id\":5,\"shopType\":\"2\",\"costcenter\":\"东方时尚\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"延安分公司\"}', 'null', 1, '', '2020-12-02 16:54:31');
INSERT INTO `sys_oper_log` VALUES (428, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"信息\",\"offCode\":\"电风扇\",\"orderId\":\"20201202225c3b241ce743efbc8d8f69fc7a4340\",\"shopName\":\"门店名称\",\"params\":{},\"shopAddress\":\"延安大街\",\"profitcenter\":\"成各种新\",\"id\":5,\"shopType\":\"2\",\"costcenter\":\"东方时尚\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"延安分公司\"}', 'null', 1, '', '2020-12-02 16:54:39');
INSERT INTO `sys_oper_log` VALUES (429, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"信息\",\"offCode\":\"电风扇\",\"orderId\":\"20201202225c3b241ce743efbc8d8f69fc7a4340\",\"shopName\":\"门店名称\",\"params\":{},\"shopAddress\":\"延安大街\",\"profitcenter\":\"成各种新\",\"id\":5,\"shopType\":\"2\",\"costcenter\":\"东方时尚\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"延安分公司\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 16:57:18');
INSERT INTO `sys_oper_log` VALUES (430, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"11\",\"offCode\":\"7023\",\"orderId\":\"20201202992af409a2ac4fd9a93587b8e0fcd7d5\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"11\",\"beiyong1\":\"WH0014\",\"beiyong2\":\"11\",\"profitcenter\":\"70230012\",\"offIt\":\"1\",\"id\":2,\"shopType\":\"1\",\"costcenter\":\"70230011\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 16:57:25');
INSERT INTO `sys_oper_log` VALUES (431, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"11\",\"offCode\":\"7023\",\"orderId\":\"20201202992af409a2ac4fd9a93587b8e0fcd7d5\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"11\",\"beiyong1\":\"WH0014\",\"beiyong2\":\"11\",\"profitcenter\":\"70230012\",\"offIt\":\"1\",\"id\":2,\"shopType\":\"1\",\"costcenter\":\"70230011\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 16:57:56');
INSERT INTO `sys_oper_log` VALUES (432, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"23111\",\"offCode\":\"342\",\"orderId\":\"20201130ea0c665fec1a45aba32e326aad32e352\",\"shopName\":\"周黑鸭11\",\"params\":{},\"shopAddress\":\"周黑鸭11\",\"profitcenter\":\"223\",\"id\":6,\"shopType\":\"1\",\"costcenter\":\"343\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"周黑鸭11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 16:59:01');
INSERT INTO `sys_oper_log` VALUES (433, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"23111\",\"offCode\":\"342\",\"orderId\":\"20201130ea0c665fec1a45aba32e326aad32e352\",\"shopName\":\"周黑鸭11\",\"params\":{},\"shopAddress\":\"周黑鸭11\",\"beiyong1\":\"3212\",\"profitcenter\":\"223\",\"offIt\":\"1\",\"id\":6,\"shopType\":\"1\",\"costcenter\":\"343\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"周黑鸭11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 16:59:18');
INSERT INTO `sys_oper_log` VALUES (434, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"信息\",\"offCode\":\"电风扇\",\"orderId\":\"20201202225c3b241ce743efbc8d8f69fc7a4340\",\"shopName\":\"门店名称\",\"params\":{},\"shopAddress\":\"延安大街\",\"beiyong1\":\"21\",\"profitcenter\":\"成各种新\",\"offIt\":\"1\",\"id\":5,\"shopType\":\"2\",\"costcenter\":\"东方时尚\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"延安分公司\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 17:00:22');
INSERT INTO `sys_oper_log` VALUES (435, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"222\",\"orderId\":\"20201202bb88acf751724fe09bbf5b18b95d77aa\",\"shopName\":\"221\",\"params\":{},\"shopAddress\":\"221\",\"beiyong1\":\"12323\",\"offIt\":\"1\",\"id\":7,\"shopType\":\"2\",\"offAccanting\":\"1\",\"offName\":\"周黑鸭2020\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 17:00:49');
INSERT INTO `sys_oper_log` VALUES (436, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"222\",\"offCode\":\"111\",\"orderId\":\"20201202bb88acf751724fe09bbf5b18b95d77aa\",\"shopName\":\"221\",\"params\":{},\"shopAddress\":\"221\",\"beiyong1\":\"12323\",\"profitcenter\":\"321\",\"offIt\":\"1\",\"id\":7,\"shopType\":\"2\",\"costcenter\":\"222\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"周黑鸭2020\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 17:01:02');
INSERT INTO `sys_oper_log` VALUES (437, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"11\",\"offCode\":\"7023\",\"orderId\":\"20201202992af409a2ac4fd9a93587b8e0fcd7d5\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"11\",\"beiyong1\":\"WH0014\",\"beiyong2\":\"11\",\"profitcenter\":\"70230012\",\"offIt\":\"1\",\"id\":2,\"shopType\":\"1\",\"costcenter\":\"70230011\",\"offAccanting\":\"1\",\"offFico\":\"0\",\"offName\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 17:03:06');
INSERT INTO `sys_oper_log` VALUES (438, 'man_data', 2, 'com.ruoyi.system.controller.SysManDataController.edit()', 'PUT', 1, 'admin', NULL, '/system/man_data', '127.0.0.1', '内网IP', '{\"shopCode\":\"11\",\"offCode\":\"7023\",\"orderId\":\"20201202992af409a2ac4fd9a93587b8e0fcd7d5\",\"shopName\":\"22\",\"params\":{},\"shopAddress\":\"11\",\"beiyong1\":\"WH0014\",\"beiyong2\":\"11\",\"profitcenter\":\"70230012\",\"offIt\":\"1\",\"id\":2,\"shopType\":\"1\",\"costcenter\":\"70230011\",\"offAccanting\":\"1\",\"offFico\":\"1\",\"offName\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-02 17:03:24');
INSERT INTO `sys_oper_log` VALUES (439, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_matter_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-03 09:39:53');
INSERT INTO `sys_oper_log` VALUES (440, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":327,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606959593000,\"tableId\":23,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":328,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606959593000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":329,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"大区\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606959593000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":330,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"organLevel\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"组织级别\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606959593000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnName\":\"organ_level\"},{\"usableColumn\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-03 09:45:36');
INSERT INTO `sys_oper_log` VALUES (441, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":327,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1606959936000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1606959593000,\"tableId\":23,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":328,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单id\",\"isQuery\":\"1\",\"updateTime\":1606959936000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606959593000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":329,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"region\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"大区\",\"isQuery\":\"1\",\"updateTime\":1606959936000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1606959593000,\"isEdit\":\"1\",\"tableId\":23,\"pk\":false,\"columnName\":\"region\"},{\"usableColumn\":false,\"columnId\":330,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"organLevel\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"组织级别\",\"isQuery\":\"1\",\"updateTime\":1606959936000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"creat', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-03 10:14:14');
INSERT INTO `sys_oper_log` VALUES (442, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-03 10:14:17');
INSERT INTO `sys_oper_log` VALUES (443, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', 'false', 'null', 1, '', '2020-12-03 12:32:50');
INSERT INTO `sys_oper_log` VALUES (444, '用户管理', 6, 'com.ruoyi.system.controller.SysMatterDataController.importData()', 'POST', 1, 'admin', NULL, '/system/sys_matter_data/importData', '127.0.0.1', '内网IP', 'false', 'null', 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、订单账号~~ 33 已存在', '2020-12-03 12:37:03');
INSERT INTO `sys_oper_log` VALUES (445, '用户管理', 6, 'com.ruoyi.system.controller.SysMatterDataController.importData()', 'POST', 1, 'admin', NULL, '/system/sys_matter_data/importData', '127.0.0.1', '内网IP', 'false', 'null', 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、订单账号~~ 2322 已存在', '2020-12-03 12:43:07');
INSERT INTO `sys_oper_log` VALUES (446, '用户管理', 6, 'com.ruoyi.system.controller.SysMatterDataController.importData()', 'POST', 1, 'admin', NULL, '/system/sys_matter_data/importData', '127.0.0.1', '内网IP', 'false', 'null', 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、订单账号~~ 2322 已存在', '2020-12-03 12:44:59');
INSERT INTO `sys_oper_log` VALUES (447, '用户管理', 6, 'com.ruoyi.system.controller.SysMatterDataController.importData()', 'POST', 1, 'admin', NULL, '/system/sys_matter_data/importData', '127.0.0.1', '内网IP', 'false', 'null', 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、订单账号~~ 2322 已存在', '2020-12-03 12:46:28');
INSERT INTO `sys_oper_log` VALUES (448, '用户管理', 6, 'com.ruoyi.system.controller.SysMatterDataController.importData()', 'POST', 1, 'admin', NULL, '/system/sys_matter_data/importData', '127.0.0.1', '内网IP', 'false', 'null', 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、订单账号~~ 2322 已存在', '2020-12-03 12:47:31');
INSERT INTO `sys_oper_log` VALUES (449, '用户管理', 6, 'com.ruoyi.system.controller.SysMatterDataController.importData()', 'POST', 1, 'admin', NULL, '/system/sys_matter_data/importData', '127.0.0.1', '内网IP', 'false', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1物料2322导入成功\",\"code\":200}', 0, NULL, '2020-12-03 12:48:40');
INSERT INTO `sys_oper_log` VALUES (450, 'sys_matter_data', 3, 'com.ruoyi.system.controller.SysMatterDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/sys_matter_data/1', '127.0.0.1', '内网IP', '{ids=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-03 12:48:55');
INSERT INTO `sys_oper_log` VALUES (451, '用户管理', 6, 'com.ruoyi.system.controller.SysMatterDataController.importData()', 'POST', 1, 'admin', NULL, '/system/sys_matter_data/importData', '127.0.0.1', '内网IP', 'false', 'null', 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、订单账号~~ 2322 已存在', '2020-12-03 12:49:01');
INSERT INTO `sys_oper_log` VALUES (452, 'sys_matter_data', 1, 'com.ruoyi.system.controller.SysMatterDataController.add()', 'POST', 1, 'admin', NULL, '/system/sys_matter_data', '127.0.0.1', '内网IP', '{\"sellDrgan\":\"22\",\"matterGroup\":\"22\",\"orderId\":\"112\",\"organLevel\":\"22\",\"guard2\":\"22\",\"matter\":\"22\",\"params\":{},\"guard1\":\"22\",\"guard3\":\"22\",\"id\":3,\"region\":\"22\",\"matterDescribe\":\"22\",\"status\":\"22\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-03 12:52:32');
INSERT INTO `sys_oper_log` VALUES (453, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{tableIds=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 13:49:44');
INSERT INTO `sys_oper_log` VALUES (454, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_master_tx_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 13:49:53');
INSERT INTO `sys_oper_log` VALUES (455, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":339,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1607060992000,\"tableId\":24,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":340,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"订单id\",\"sort\":2,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1607060992000,\"tableId\":24,\"pk\":true,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":341,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"customercode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"sap客户编码\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607060992000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":false,\"columnName\":\"customercode\"},{\"usableColumn\":false,\"columnId\":342,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"customename\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"sap客户名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607060992000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":false,\"columnName\":\"customename\"},{\"usableColumn\":false,\"columnId\":343,\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 13:51:47');
INSERT INTO `sys_oper_log` VALUES (456, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":339,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1607061107000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1607060992000,\"tableId\":24,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":340,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单id\",\"isQuery\":\"1\",\"updateTime\":1607061107000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1607060992000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":true,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":341,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"customercode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"sap客户编码\",\"isQuery\":\"1\",\"updateTime\":1607061107000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607060992000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":false,\"columnName\":\"customercode\"},{\"usableColumn\":false,\"columnId\":342,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"customename\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"sap客户名称\",\"isQuery\":\"1\",\"updateTime\":1607061107000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"adm', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 13:55:40');
INSERT INTO `sys_oper_log` VALUES (457, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-04 14:00:29');
INSERT INTO `sys_oper_log` VALUES (458, '主数据填报', 1, 'com.ruoyi.system.controller.SysMasterTxDataController.add()', 'POST', 1, 'admin', NULL, '/system/sys_master_tx_data', '127.0.0.1', '内网IP', '{\"county\":\"221\",\"province\":\"22\",\"state\":\"22\",\"params\":{},\"storecontelephone\":\"22\",\"customename\":\"223\",\"storecontact\":\"221\",\"address\":\"222\",\"business\":\"222\",\"sapabb\":\"332\",\"customercode\":\"221\"}', 'null', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'orderid\' doesn\'t have a default value\n### The error may exist in file [/home/liu/tx_maindata/ruoyi-system/target/classes/mapper/system/SysMasterTxDataMapper.xml]\n### The error may involve com.ruoyi.system.mapper.SysMasterTxDataMapper.insertSysMasterTxData-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_master_tx_data          ( customercode,             customename,             business,             sapabb,             state,             province,             county,             address,             storecontact,             storecontelephone )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'orderid\' doesn\'t have a default value\n; Field \'orderid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'orderid\' doesn\'t have a default value', '2020-12-04 14:07:35');
INSERT INTO `sys_oper_log` VALUES (459, '主数据填报', 1, 'com.ruoyi.system.controller.SysMasterTxDataController.add()', 'POST', 1, 'admin', NULL, '/system/sys_master_tx_data', '127.0.0.1', '内网IP', '{\"county\":\"221\",\"province\":\"22\",\"state\":\"22\",\"params\":{},\"storecontelephone\":\"22\",\"customename\":\"223\",\"storecontact\":\"221\",\"address\":\"222\",\"business\":\"222\",\"sapabb\":\"332\",\"customercode\":\"221\"}', 'null', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'orderid\' doesn\'t have a default value\n### The error may exist in file [/home/liu/tx_maindata/ruoyi-system/target/classes/mapper/system/SysMasterTxDataMapper.xml]\n### The error may involve com.ruoyi.system.mapper.SysMasterTxDataMapper.insertSysMasterTxData-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_master_tx_data          ( customercode,             customename,             business,             sapabb,             state,             province,             county,             address,             storecontact,             storecontelephone )           values ( ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'orderid\' doesn\'t have a default value\n; Field \'orderid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'orderid\' doesn\'t have a default value', '2020-12-04 14:07:39');
INSERT INTO `sys_oper_log` VALUES (460, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":339,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1607061339000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1607060992000,\"tableId\":24,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":340,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderid\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单id\",\"isQuery\":\"1\",\"updateTime\":1607061339000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1607060992000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":true,\"columnName\":\"orderid\"},{\"usableColumn\":false,\"columnId\":341,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"customercode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"sap客户编码\",\"isQuery\":\"1\",\"updateTime\":1607061339000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607060992000,\"isEdit\":\"1\",\"tableId\":24,\"pk\":false,\"columnName\":\"customercode\"},{\"usableColumn\":false,\"columnId\":342,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"customename\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"sap客户名称\",\"isQuery\":\"1\",\"updateTime\":1607061339000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"adm', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 14:12:06');
INSERT INTO `sys_oper_log` VALUES (461, '主数据填报', 1, 'com.ruoyi.system.controller.SysMasterTxDataController.add()', 'POST', 1, 'admin', NULL, '/system/sys_master_tx_data', '127.0.0.1', '内网IP', '{\"params\":{},\"customename\":\"222\",\"business\":\"222\",\"customercode\":\"222\"}', 'null', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'orderid\' doesn\'t have a default value\n### The error may exist in file [/home/liu/tx_maindata/ruoyi-system/target/classes/mapper/system/SysMasterTxDataMapper.xml]\n### The error may involve com.ruoyi.system.mapper.SysMasterTxDataMapper.insertSysMasterTxData-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_master_tx_data          ( customercode,             customename,             business )           values ( ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'orderid\' doesn\'t have a default value\n; Field \'orderid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'orderid\' doesn\'t have a default value', '2020-12-04 14:18:05');
INSERT INTO `sys_oper_log` VALUES (462, '主数据填报', 1, 'com.ruoyi.system.controller.SysMasterTxDataController.add()', 'POST', 1, 'admin', NULL, '/system/sys_master_tx_data', '127.0.0.1', '内网IP', '{\"params\":{},\"customename\":\"222\",\"business\":\"222\",\"customercode\":\"222\"}', 'null', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'orderid\' doesn\'t have a default value\n### The error may exist in file [/home/liu/tx_maindata/ruoyi-system/target/classes/mapper/system/SysMasterTxDataMapper.xml]\n### The error may involve com.ruoyi.system.mapper.SysMasterTxDataMapper.insertSysMasterTxData-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_master_tx_data          ( customercode,             customename,             business )           values ( ?,             ?,             ? )\n### Cause: java.sql.SQLException: Field \'orderid\' doesn\'t have a default value\n; Field \'orderid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'orderid\' doesn\'t have a default value', '2020-12-04 14:20:28');
INSERT INTO `sys_oper_log` VALUES (463, '主数据填报', 1, 'com.ruoyi.system.controller.SysMasterTxDataController.add()', 'POST', 1, 'admin', NULL, '/system/sys_master_tx_data', '127.0.0.1', '内网IP', '{\"params\":{},\"customename\":\"222\",\"customercode\":\"11\"}', 'null', 1, '\n### Error updating database.  Cause: java.sql.SQLException: Field \'orderid\' doesn\'t have a default value\n### The error may exist in file [/home/liu/tx_maindata/ruoyi-system/target/classes/mapper/system/SysMasterTxDataMapper.xml]\n### The error may involve com.ruoyi.system.mapper.SysMasterTxDataMapper.insertSysMasterTxData-Inline\n### The error occurred while setting parameters\n### SQL: insert into sys_master_tx_data          ( customercode,             customename )           values ( ?,             ? )\n### Cause: java.sql.SQLException: Field \'orderid\' doesn\'t have a default value\n; Field \'orderid\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'orderid\' doesn\'t have a default value', '2020-12-04 14:21:31');
INSERT INTO `sys_oper_log` VALUES (464, '主数据填报', 1, 'com.ruoyi.system.controller.SysMasterTxDataController.add()', 'POST', 1, 'admin', NULL, '/system/sys_master_tx_data', '127.0.0.1', '内网IP', '{\"id\":1,\"params\":{},\"customename\":\"332221\",\"customercode\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 14:26:38');
INSERT INTO `sys_oper_log` VALUES (465, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/24', '127.0.0.1', '内网IP', '{tableIds=24}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 14:34:28');
INSERT INTO `sys_oper_log` VALUES (466, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_master_tx_data', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 14:34:36');
INSERT INTO `sys_oper_log` VALUES (467, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":416,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1607063676000,\"tableId\":25,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":417,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单id\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607063676000,\"isEdit\":\"1\",\"tableId\":25,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":418,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"customerCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"sap客户编码\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607063676000,\"isEdit\":\"1\",\"tableId\":25,\"pk\":false,\"columnName\":\"customer_code\"},{\"usableColumn\":false,\"columnId\":419,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"customeName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"sap客户名称\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607063676000,\"isEdit\":\"1\",\"tableId\":25,\"pk\":false,\"columnName\":\"custome_name', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 14:35:39');
INSERT INTO `sys_oper_log` VALUES (468, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":416,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"updateTime\":1607063737000,\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(100)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1607063676000,\"tableId\":25,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":417,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"orderId\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"订单id\",\"isQuery\":\"1\",\"updateTime\":1607063737000,\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607063676000,\"isEdit\":\"1\",\"tableId\":25,\"pk\":false,\"columnName\":\"order_id\"},{\"usableColumn\":false,\"columnId\":418,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"customerCode\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"sap客户编码\",\"isQuery\":\"1\",\"updateTime\":1607063737000,\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607063676000,\"isEdit\":\"1\",\"tableId\":25,\"pk\":false,\"columnName\":\"customer_code\"},{\"usableColumn\":false,\"columnId\":419,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"customeName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"sap客户名称\",\"isQuery\":\"1\",\"updateTime\":1607063737000,\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(200)\",\"createBy\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 14:36:47');
INSERT INTO `sys_oper_log` VALUES (469, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{}', 'null', 0, NULL, '2020-12-04 14:36:50');
INSERT INTO `sys_oper_log` VALUES (470, 'sd主数据', 1, 'com.ruoyi.system.controller.SysMasterTxDataController.add()', 'POST', 1, 'admin', NULL, '/system/sys_master_tx_data', '127.0.0.1', '内网IP', '{\"orderId\":\"11\",\"id\":2,\"params\":{},\"customerCode\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 14:52:17');
INSERT INTO `sys_oper_log` VALUES (471, 'sd主数据', 3, 'com.ruoyi.system.controller.SysMasterTxDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/sys_master_tx_data/2', '127.0.0.1', '内网IP', '{ids=2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 14:54:07');
INSERT INTO `sys_oper_log` VALUES (472, 'sd主数据', 1, 'com.ruoyi.system.controller.SysMasterTxDataController.add()', 'POST', 1, 'admin', NULL, '/system/sys_master_tx_data', '127.0.0.1', '内网IP', '{\"orderId\":\"221\",\"county\":\"武汉\",\"province\":\"2332\",\"id\":3,\"storeContelephone\":\"15927529577\",\"params\":{},\"customerCode\":\"22\",\"sapAbb\":\"22\",\"address\":\"武汉\",\"business\":\"222\",\"customeName\":\"223\",\"statE\":\"222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 14:54:21');
INSERT INTO `sys_oper_log` VALUES (473, 'sd主数据', 3, 'com.ruoyi.system.controller.SysMasterTxDataController.remove()', 'DELETE', 1, 'admin', NULL, '/system/sys_master_tx_data/1', '127.0.0.1', '内网IP', '{ids=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 14:54:25');
INSERT INTO `sys_oper_log` VALUES (474, 'sd主数据', 1, 'com.ruoyi.system.controller.SysMasterTxDataController.add()', 'POST', 1, 'admin', NULL, '/system/sys_master_tx_data', '127.0.0.1', '内网IP', '{\"county\":\"南宁\",\"province\":\"210\",\"id\":4,\"storeContelephone\":\"2223\",\"params\":{},\"customerCode\":\"NN00001\",\"sapAbb\":\"南宁东站一店\",\"address\":\"南宁\",\"customeName\":\"南宁东站一店\",\"storeContact\":\"55433\",\"statE\":\"中国\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-04 14:58:20');
INSERT INTO `sys_oper_log` VALUES (475, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"sys_come_table\",\"component\":\"src/views/system/sys_come_table/indexdialog.vue\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"perms\":\"system:sys_come_table:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:19:30');
INSERT INTO `sys_oper_log` VALUES (476, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"indexdialog\",\"component\":\"src/views/system/sys_come_table/indexdialog.vue\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:22:29');
INSERT INTO `sys_oper_log` VALUES (477, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"sys_come_table/indexdialog\",\"component\":\"src/views/system/sys_come_table/indexdialog.vue\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:22:53');
INSERT INTO `sys_oper_log` VALUES (478, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"indexdialog\",\"component\":\"src/views/system/indexdialog/index\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:listvue\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:26:30');
INSERT INTO `sys_oper_log` VALUES (479, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"indexdialog\",\"component\":\"src/views/system/indexdialog/\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:listvue\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:26:42');
INSERT INTO `sys_oper_log` VALUES (480, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"indexdialog\",\"component\":\"src/views/system/indexdialog/index\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:listvue\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:26:57');
INSERT INTO `sys_oper_log` VALUES (481, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"indexdialog\",\"component\":\"/system/indexdialog/index\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:listvue\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:29:26');
INSERT INTO `sys_oper_log` VALUES (482, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"indexdialog\",\"component\":\"/system/indexdialog/index\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:listvue\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:30:15');
INSERT INTO `sys_oper_log` VALUES (483, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"1\",\"menuName\":\"出入登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"sys_come_table\",\"component\":\"system/sys_come_table/index\",\"children\":[],\"createTime\":1607580842000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2161,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:32:07');
INSERT INTO `sys_oper_log` VALUES (484, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"sys_come_table\",\"component\":\"/system/indexdialog/index\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:listvue\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:32:12');
INSERT INTO `sys_oper_log` VALUES (485, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"sys_come_table\",\"component\":\"/system/sys_come_table/indextest\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:listvue\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:34:31');
INSERT INTO `sys_oper_log` VALUES (486, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"sys_come_table\",\"component\":\"/system/sys_come_table/indextest\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:55:00');
INSERT INTO `sys_oper_log` VALUES (487, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"indexdialog\",\"component\":\"src/views/system/indexdialog/index\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:55:52');
INSERT INTO `sys_oper_log` VALUES (488, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"button\",\"orderNum\":\"7\",\"menuName\":\"外来人员登记\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"indexdialog\",\"component\":\"/system/indexdialog/index\",\"children\":[],\"createTime\":1607581170000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2167,\"menuType\":\"C\",\"perms\":\"system:sys_come_table:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:56:16');
INSERT INTO `sys_oper_log` VALUES (489, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_come_table', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 14:59:56');
INSERT INTO `sys_oper_log` VALUES (490, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"functionAuthor\":\"liu\",\"columns\":[{\"usableColumn\":false,\"columnId\":493,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"id\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"id\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"int(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1607583596000,\"tableId\":26,\"pk\":true,\"columnName\":\"id\"},{\"usableColumn\":false,\"columnId\":494,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"comeName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"来访姓名\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607583596000,\"isEdit\":\"1\",\"tableId\":26,\"pk\":false,\"columnName\":\"come_name\"},{\"usableColumn\":false,\"columnId\":495,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_user_sex\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"sex\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"性别\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607583596000,\"isEdit\":\"1\",\"tableId\":26,\"pk\":false,\"columnName\":\"sex\"},{\"usableColumn\":false,\"columnId\":496,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"ideNtity\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"身份证id\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1607583596000,\"isEdit\":\"1\",\"tableId\":26,\"pk\":false,\"columnName\":\"ide_ntity\"},{\"usableColumn\":f', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 15:01:10');
INSERT INTO `sys_oper_log` VALUES (491, '出入登记', 1, 'com.ruoyi.system.controller.SysComeTableController.add()', 'POST', 1, 'admin', NULL, '/system/sys_come_table', '127.0.0.1', '内网IP', '{\"sex\":\"0\",\"callLink\":\"122\",\"worKunit\":\"22\",\"params\":{},\"comeTime\":1607584922000,\"comeName\":\"六福\",\"reaMarks\":\"321\",\"ideNtity\":\"233\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 15:21:20');
INSERT INTO `sys_oper_log` VALUES (492, '出入登记', 3, 'com.ruoyi.system.controller.SysComeTableController.remove()', 'DELETE', 1, 'admin', NULL, '/system/sys_come_table/4', '127.0.0.1', '内网IP', '{ids=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 15:23:20');
INSERT INTO `sys_oper_log` VALUES (493, '出入登记', 1, 'com.ruoyi.system.controller.SysComeTableController.add()', 'POST', 1, 'admin', NULL, '/system/sys_come_table', '127.0.0.1', '内网IP', '{\"sex\":\"0\",\"callLink\":\"2222\",\"worKunit\":\"22222\",\"params\":{},\"comeTime\":1607585742000,\"comeName\":\"2222\",\"ideNtity\":\"2222\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 15:35:00');
INSERT INTO `sys_oper_log` VALUES (494, '出入登记', 1, 'com.ruoyi.system.controller.SysComeTableController.add()', 'POST', 1, 'admin', NULL, '/system/sys_come_table', '127.0.0.1', '内网IP', '{\"sex\":\"0\",\"callLink\":\"222\",\"worKunit\":\"222\",\"params\":{},\"comeTime\":1607586030000,\"comeName\":\"修改\",\"ideNtity\":\"2332\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 15:39:50');
INSERT INTO `sys_oper_log` VALUES (495, '出入登记', 2, 'com.ruoyi.system.controller.SysComeTableController.edit()', 'PUT', 1, 'admin', NULL, '/system/sys_come_table', '127.0.0.1', '内网IP', '{\"sex\":\"0\",\"callLink\":\"222\",\"worKunit\":\"222\",\"params\":{},\"comeTime\":1607586030000,\"comeName\":\"修改\",\"id\":6,\"ideNtity\":\"2332\"}', 'null', 1, 'Cannot format given Object as a Date', '2020-12-10 16:06:55');
INSERT INTO `sys_oper_log` VALUES (496, '出入登记', 2, 'com.ruoyi.system.controller.SysComeTableController.edit()', 'PUT', 1, 'admin', NULL, '/system/sys_come_table', '127.0.0.1', '内网IP', '{\"sex\":\"0\",\"callLink\":\"222\",\"worKunit\":\"222\",\"params\":{},\"comeTime\":1607586030000,\"comeName\":\"修改\",\"id\":6,\"ideNtity\":\"2332\"}', 'null', 1, 'Cannot format given Object as a Date', '2020-12-10 16:07:20');
INSERT INTO `sys_oper_log` VALUES (497, '出入登记', 2, 'com.ruoyi.system.controller.SysComeTableController.delSys_come_table_text()', 'GET', 1, 'admin', NULL, '/system/sys_come_table/test/6', '127.0.0.1', '内网IP', '{ids=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 17:01:08');
INSERT INTO `sys_oper_log` VALUES (498, '出入登记', 2, 'com.ruoyi.system.controller.SysComeTableController.delSys_come_table_text()', 'GET', 1, 'admin', NULL, '/system/sys_come_table/test/6', '127.0.0.1', '内网IP', '{ids=6}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2020-12-10 17:03:31');
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
