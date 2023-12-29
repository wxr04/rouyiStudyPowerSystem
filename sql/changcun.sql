/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : localhost:3306
 Source Schema         : changcun

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 29/12/2023 15:58:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alarm
-- ----------------------------
DROP TABLE IF EXISTS `alarm`;
CREATE TABLE `alarm`  (
  `IOServerName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `MachineName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `TagName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `TagComment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `GroupName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `AlarmValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `AlarmValueDataType` int(11) NULL DEFAULT NULL,
  `LimitValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `LimitValueDataType` int(11) NULL DEFAULT NULL,
  `AlarmType` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Pri` int(11) NULL DEFAULT NULL,
  `Quality` int(11) NULL DEFAULT NULL,
  `AlarmTime` datetime NULL DEFAULT NULL,
  `AlarmTimeMs` int(11) NULL DEFAULT NULL,
  `EventTime` datetime NULL DEFAULT NULL,
  `EventTimeMs` int(11) NULL DEFAULT NULL,
  `OperatorName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `OperatorDomain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ResumeValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ResumeValueDataType` int(11) NULL DEFAULT NULL,
  `EventType` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `AlarmText` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ExtendField1` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ExtendField2` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alarm
-- ----------------------------
INSERT INTO `alarm` VALUES ('local', 'local', 'testAlarm1_1', NULL, 'RootNode', '93.000000', 11, '90.000000', 11, '高', 1, 192, '2023-12-26 04:44:33', 690, '1601-01-01 00:00:00', 0, NULL, NULL, NULL, 11, '报警', '高', NULL, NULL);
INSERT INTO `alarm` VALUES ('local', 'local', 'testAlarm1_1', NULL, 'RootNode', '96.000000', 11, '90.000000', 11, '高', 1, 192, '2023-12-26 04:47:12', 230, '1601-01-01 00:00:00', 0, NULL, NULL, NULL, 11, '报警', '高', NULL, NULL);

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device`  (
  `dev_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '设备号',
  `dev_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '设备名称',
  `dev_GNum` char(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '柜号',
  `status` int(4) NULL DEFAULT 0 COMMENT '设备状态，如果是0不在线1为在线',
  `update_time` datetime NULL DEFAULT NULL COMMENT '设备最后一次更新的实际',
  `dept_id` bigint(10) NOT NULL DEFAULT 0 COMMENT '设备所在的区域',
  `dev_com` int(10) NOT NULL COMMENT 'com口号',
  `dev_addr` int(10) NOT NULL COMMENT '设备地址',
  `Pt` int(10) NULL DEFAULT 1 COMMENT '电压变比',
  `Ct` int(10) NULL DEFAULT 1 COMMENT '电流变比',
  `Epp` bigint(20) NULL DEFAULT NULL COMMENT '二次测电能',
  `Ua` float NULL DEFAULT NULL COMMENT '电压a',
  `Ub` float NULL DEFAULT NULL COMMENT '电压b',
  `Uc` float NULL DEFAULT NULL COMMENT '电压c',
  `Ia` float NULL DEFAULT NULL COMMENT '电流a',
  `Ib` float NULL DEFAULT NULL COMMENT '电流b',
  `Ic` float NULL DEFAULT NULL COMMENT '电流c',
  `P` float NULL DEFAULT NULL COMMENT '总功率',
  `cosQ` float NULL DEFAULT NULL COMMENT '功率因数',
  `F` float NULL DEFAULT NULL COMMENT '频率',
  `dev_k` int(10) NULL DEFAULT 1000 COMMENT '比例',
  PRIMARY KEY (`dev_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 402 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES (322, '线路名称1', '柜号1', 0, NULL, 100, 1, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (323, '线路名称2', '柜号2', 0, NULL, 100, 1, 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (324, '线路名称3', '柜号3', 0, NULL, 100, 1, 3, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (325, '线路名称4', '柜号4', 0, NULL, 100, 1, 4, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (326, '线路名称5', '柜号5', 0, NULL, 100, 1, 5, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (327, '线路名称6', '柜号6', 0, NULL, 100, 1, 6, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (328, '线路名称7', '柜号7', 0, NULL, 100, 1, 7, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (329, '线路名称8', '柜号8', 0, NULL, 100, 1, 8, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (330, '线路名称9', '柜号9', 0, NULL, 100, 1, 9, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (331, '线路名称10', '柜号10', 0, NULL, 100, 1, 10, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (332, '线路名称11', '柜号11', 0, NULL, 100, 1, 11, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (333, '线路名称12', '柜号12', 0, NULL, 100, 1, 12, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (334, '线路名称13', '柜号13', 0, NULL, 100, 1, 13, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (335, '线路名称14', '柜号14', 0, NULL, 100, 1, 14, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (336, '线路名称15', '柜号15', 0, NULL, 100, 1, 15, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (337, '线路名称16', '柜号16', 0, NULL, 100, 1, 16, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (338, '线路名称17', '柜号17', 0, NULL, 100, 1, 17, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (339, '线路名称18', '柜号18', 0, NULL, 100, 1, 18, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (340, '线路名称19', '柜号19', 0, NULL, 100, 1, 19, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (341, '线路名称20', '柜号20', 0, NULL, 100, 1, 20, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (342, '线路名称22', '柜号22', 0, NULL, 101, 2, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (343, '线路名称23', '柜号23', 0, NULL, 101, 2, 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (344, '线路名称24', '柜号24', 0, NULL, 101, 2, 3, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (345, '线路名称25', '柜号25', 0, NULL, 101, 2, 4, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (346, '线路名称26', '柜号26', 0, NULL, 101, 2, 5, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (347, '线路名称27', '柜号27', 0, NULL, 101, 2, 6, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (348, '线路名称28', '柜号28', 0, NULL, 101, 2, 7, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (349, '线路名称29', '柜号29', 0, NULL, 101, 2, 8, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (350, '线路名称30', '柜号30', 0, NULL, 101, 2, 9, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (351, '线路名称31', '柜号31', 0, NULL, 101, 2, 10, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (352, '线路名称32', '柜号32', 0, NULL, 101, 2, 11, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (353, '线路名称33', '柜号33', 0, NULL, 101, 2, 12, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (354, '线路名称34', '柜号34', 0, NULL, 101, 2, 13, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (355, '线路名称35', '柜号35', 0, NULL, 101, 2, 14, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (356, '线路名称36', '柜号36', 0, NULL, 101, 2, 15, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (357, '线路名称37', '柜号37', 0, NULL, 101, 2, 16, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (358, '线路名称38', '柜号38', 0, NULL, 101, 2, 17, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (359, '线路名称39', '柜号39', 0, NULL, 101, 2, 18, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (360, '线路名称40', '柜号40', 0, NULL, 101, 2, 19, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (361, '线路名称41', '柜号41', 0, NULL, 101, 2, 20, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (362, '线路名称43', '柜号43', 0, NULL, 102, 3, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (363, '线路名称44', '柜号44', 0, NULL, 102, 3, 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (364, '线路名称45', '柜号45', 0, NULL, 102, 3, 3, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (365, '线路名称46', '柜号46', 0, NULL, 102, 3, 4, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (366, '线路名称47', '柜号47', 0, NULL, 102, 3, 5, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (367, '线路名称48', '柜号48', 0, NULL, 102, 3, 6, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (368, '线路名称49', '柜号49', 0, NULL, 102, 3, 7, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (369, '线路名称50', '柜号50', 0, NULL, 102, 3, 8, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (370, '线路名称51', '柜号51', 0, NULL, 102, 3, 9, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (371, '线路名称52', '柜号52', 0, NULL, 102, 3, 10, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (372, '线路名称53', '柜号53', 0, NULL, 102, 3, 11, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (373, '线路名称54', '柜号54', 0, NULL, 102, 3, 12, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (374, '线路名称55', '柜号55', 0, NULL, 102, 3, 13, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (375, '线路名称56', '柜号56', 0, NULL, 102, 3, 14, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (376, '线路名称57', '柜号57', 0, NULL, 102, 3, 15, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (377, '线路名称58', '柜号58', 0, NULL, 102, 3, 16, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (378, '线路名称59', '柜号59', 0, NULL, 102, 3, 17, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (379, '线路名称60', '柜号60', 0, NULL, 102, 3, 18, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (380, '线路名称61', '柜号61', 0, NULL, 102, 3, 19, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (381, '线路名称62', '柜号62', 0, NULL, 102, 3, 20, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (382, '线路名称64', '柜号64', 0, NULL, 103, 4, 1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (383, '线路名称65', '柜号65', 0, NULL, 103, 4, 2, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (384, '线路名称66', '柜号66', 0, NULL, 103, 4, 3, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (385, '线路名称67', '柜号67', 0, NULL, 103, 4, 4, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (386, '线路名称68', '柜号68', 0, NULL, 103, 4, 5, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (387, '线路名称69', '柜号69', 0, NULL, 103, 4, 6, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (388, '线路名称70', '柜号70', 0, NULL, 103, 4, 7, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (389, '线路名称71', '柜号71', 0, NULL, 103, 4, 8, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (390, '线路名称72', '柜号72', 0, NULL, 103, 4, 9, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (391, '线路名称73', '柜号73', 0, NULL, 103, 4, 10, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (392, '线路名称74', '柜号74', 0, NULL, 103, 4, 11, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (393, '线路名称75', '柜号75', 0, NULL, 103, 4, 12, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (394, '线路名称76', '柜号76', 0, NULL, 103, 4, 13, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (395, '线路名称77', '柜号77', 0, NULL, 103, 4, 14, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (396, '线路名称78', '柜号78', 0, NULL, 103, 4, 15, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (397, '线路名称79', '柜号79', 0, NULL, 103, 4, 16, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (398, '线路名称80', '柜号80', 0, NULL, 103, 4, 17, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (399, '线路名称81', '柜号81', 0, NULL, 103, 4, 18, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (400, '线路名称82', '柜号82', 0, NULL, 103, 4, 19, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);
INSERT INTO `device` VALUES (401, '线路名称83', '柜号83', 0, NULL, 103, 4, 20, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1000);

-- ----------------------------
-- Table structure for energy_month
-- ----------------------------
DROP TABLE IF EXISTS `energy_month`;
CREATE TABLE `energy_month`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dev_id` bigint(20) NOT NULL COMMENT '设备id',
  `epp2` int(11) NULL DEFAULT NULL COMMENT '电能',
  `collect_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of energy_month
-- ----------------------------
INSERT INTO `energy_month` VALUES (1, 322, 100, '2023-10-07 00:00:01');
INSERT INTO `energy_month` VALUES (2, 322, 101, '2023-10-08 00:10:01');
INSERT INTO `energy_month` VALUES (3, 322, 102, '2023-10-09 00:00:01');
INSERT INTO `energy_month` VALUES (4, 322, 103, '2023-10-10 00:00:01');
INSERT INTO `energy_month` VALUES (5, 322, 104, '2023-10-11 00:00:01');
INSERT INTO `energy_month` VALUES (6, 322, 105, '2023-10-12 00:00:01');
INSERT INTO `energy_month` VALUES (7, 322, 106, '2023-10-13 00:00:01');
INSERT INTO `energy_month` VALUES (8, 322, 107, '2023-10-14 00:00:01');
INSERT INTO `energy_month` VALUES (9, 322, 108, '2023-10-15 00:00:01');
INSERT INTO `energy_month` VALUES (10, 322, 109, '2023-10-16 00:00:01');
INSERT INTO `energy_month` VALUES (11, 322, 110, '2023-10-17 00:00:01');
INSERT INTO `energy_month` VALUES (12, 322, 111, '2023-10-18 00:00:01');
INSERT INTO `energy_month` VALUES (13, 322, 112, '2023-10-19 00:00:01');
INSERT INTO `energy_month` VALUES (14, 322, 113, '2023-10-20 00:00:01');
INSERT INTO `energy_month` VALUES (15, 322, 114, '2023-10-21 00:00:01');
INSERT INTO `energy_month` VALUES (16, 322, 115, '2023-10-22 00:00:01');
INSERT INTO `energy_month` VALUES (17, 322, 116, '2023-10-23 00:00:01');
INSERT INTO `energy_month` VALUES (18, 322, 117, '2023-10-24 00:00:01');
INSERT INTO `energy_month` VALUES (19, 322, 118, '2023-10-25 00:00:01');
INSERT INTO `energy_month` VALUES (20, 322, 119, '2023-10-26 00:00:00');
INSERT INTO `energy_month` VALUES (21, 322, 120, '2023-10-27 00:00:00');
INSERT INTO `energy_month` VALUES (22, 322, 121, '2023-10-28 00:00:00');
INSERT INTO `energy_month` VALUES (23, 322, 122, '2023-10-29 00:00:00');
INSERT INTO `energy_month` VALUES (24, 322, 123, '2023-10-30 00:00:00');
INSERT INTO `energy_month` VALUES (25, 322, 124, '2023-10-30 00:01:00');
INSERT INTO `energy_month` VALUES (26, 322, 126, '2023-11-01 00:00:00');

-- ----------------------------
-- Table structure for energy_year
-- ----------------------------
DROP TABLE IF EXISTS `energy_year`;
CREATE TABLE `energy_year`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dev_id` bigint(20) NOT NULL COMMENT '设备id',
  `epp2` int(11) NULL DEFAULT NULL COMMENT '电能',
  `collect_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of energy_year
-- ----------------------------
INSERT INTO `energy_year` VALUES (1, 322, 10, '2023-02-07 00:00:00');
INSERT INTO `energy_year` VALUES (2, 322, 52, '2023-02-08 00:10:00');
INSERT INTO `energy_year` VALUES (3, 322, 78, '2023-03-09 00:00:00');
INSERT INTO `energy_year` VALUES (4, 322, 96, '2023-04-10 00:00:00');
INSERT INTO `energy_year` VALUES (5, 322, 100, '2023-06-11 00:00:00');
INSERT INTO `energy_year` VALUES (6, 322, 120, '2023-07-12 00:00:00');
INSERT INTO `energy_year` VALUES (7, 322, 135, '2023-07-13 00:00:00');
INSERT INTO `energy_year` VALUES (8, 322, 146, '2023-08-14 00:00:00');
INSERT INTO `energy_year` VALUES (9, 322, 156, '2023-09-15 00:00:00');
INSERT INTO `energy_year` VALUES (10, 322, 178, '2023-10-16 00:00:00');
INSERT INTO `energy_year` VALUES (11, 322, 198, '2023-11-17 00:00:00');
INSERT INTO `energy_year` VALUES (12, 322, 210, '2023-12-18 00:00:00');

-- ----------------------------
-- Table structure for enter
-- ----------------------------
DROP TABLE IF EXISTS `enter`;
CREATE TABLE `enter`  (
  `MachineName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `OperatorName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `OperatorDomain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `SuccessEnter` bit(1) NULL DEFAULT NULL,
  `EventType` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `EventTime` datetime NULL DEFAULT NULL,
  `EventTimeMs` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of enter
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'device', 'device realdata', NULL, NULL, 'Device', 'crud', 'com.ruoyi.powerMonitor', 'powerMonitor', 'powerMonitor', '电力监控', '微笑', '0', '/', '{\"parentMenuId\":1061}', 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23', NULL);
INSERT INTO `gen_table` VALUES (3, 'energy_month', '月分析表', NULL, NULL, 'EnergyMonth', 'crud', 'com.ruoyi.analysis', 'analysis', 'energyMonth', 'powerEnergy analysis in month', '微笑', '0', '/', '{\"parentMenuId\":1064}', 'admin', '2023-10-28 14:16:13', '', '2023-10-28 14:24:29', NULL);
INSERT INTO `gen_table` VALUES (4, 'energy_year', '', NULL, NULL, 'EnergyYear', 'crud', 'com.ruoyi.system', 'system', 'year', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2023-12-19 14:18:22', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'dev_id', '设备号', 'bigint(20)', 'Long', 'devId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (2, '1', 'dev_name', '设备名称', 'varchar(64)', 'String', 'devName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (3, '1', 'dev_GNum', '柜号', 'char(64)', 'String', 'devGnum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (4, '1', 'status', '设备状态，如果是0不在线1为在线', 'int(4)', 'Integer', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 4, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (5, '1', 'update_time', '设备最后一次更新的实际', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (6, '1', 'area', '设备所在的区域', 'int(10)', 'Integer', 'area', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (7, '1', 'dev_com', 'com口号', 'int(10)', 'Integer', 'devCom', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (8, '1', 'dev_addr', '设备地址', 'int(10)', 'Integer', 'devAddr', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (9, '1', 'Pt', '电压变比', 'int(10)', 'Integer', 'Pt', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (10, '1', 'Ct', '电流变比', 'int(10)', 'Integer', 'Ct', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (11, '1', 'Epp', '二次测电能', 'bigint(20)', 'Long', 'Epp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (12, '1', 'Ua', '电压a', 'float', 'Long', 'Ua', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (13, '1', 'Ub', '电压b', 'float', 'Long', 'Ub', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (14, '1', 'Uc', '电压c', 'float', 'Long', 'Uc', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (15, '1', 'Ia', '电流a', 'float', 'Long', 'Ia', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (16, '1', 'Ib', '电流b', 'float', 'Long', 'Ib', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (17, '1', 'Ic', '电流c', 'float', 'Long', 'Ic', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 17, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (18, '1', 'P', '总功率', 'float', 'Long', 'P', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 18, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (19, '1', 'cosQ', '功率因数', 'float', 'Long', 'cosQ', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (20, '1', 'F', '频率', 'float', 'Long', 'F', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2023-10-19 13:01:21', '', '2023-10-19 14:59:23');
INSERT INTO `gen_table_column` VALUES (25, '3', 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-10-28 14:16:13', '', '2023-10-28 14:24:29');
INSERT INTO `gen_table_column` VALUES (26, '3', 'dev_id', '设备id', 'bigint(20)', 'Long', 'devId', '0', '0', '1', '0', '0', '0', '1', 'EQ', 'input', '', 2, 'admin', '2023-10-28 14:16:13', '', '2023-10-28 14:24:29');
INSERT INTO `gen_table_column` VALUES (27, '3', 'epp2', '电能', 'int(11)', 'Long', 'epp2', '0', '0', NULL, '0', '0', '0', '1', 'EQ', 'input', '', 3, 'admin', '2023-10-28 14:16:13', '', '2023-10-28 14:24:29');
INSERT INTO `gen_table_column` VALUES (28, '3', 'collect_time', NULL, 'datetime', 'Date', 'collectTime', '0', '0', NULL, '0', '0', '0', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-10-28 14:16:13', '', '2023-10-28 14:24:29');
INSERT INTO `gen_table_column` VALUES (29, '4', 'id', NULL, 'bigint(20)', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-12-19 14:18:22', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, '4', 'dev_id', '设备id', 'bigint(20)', 'Long', 'devId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-12-19 14:18:22', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, '4', 'epp2', '电能', 'int(11)', 'Long', 'epp2', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-12-19 14:18:22', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, '4', 'collect_time', NULL, 'datetime', 'Date', 'collectTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2023-12-19 14:18:22', '', NULL);

-- ----------------------------
-- Table structure for operate
-- ----------------------------
DROP TABLE IF EXISTS `operate`;
CREATE TABLE `operate`  (
  `IOServerName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `MachineName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `TagName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `TagComment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `OldValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `OldValueDataType` int(11) NULL DEFAULT NULL,
  `NewValue` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `NewValueDataType` int(11) NULL DEFAULT NULL,
  `EventTime` datetime NULL DEFAULT NULL,
  `EventTimeMs` int(11) NULL DEFAULT NULL,
  `SuccessOa` bit(1) NULL DEFAULT NULL,
  `EventType` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `FieldName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `OperatorName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `OperatorDomain` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `OperateText` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operate
-- ----------------------------

-- ----------------------------
-- Table structure for station
-- ----------------------------
DROP TABLE IF EXISTS `station`;
CREATE TABLE `station`  (
  `MachineName` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `EventType` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `EventTime` datetime NULL DEFAULT NULL,
  `EventTimeMs` int(11) NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of station
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-10-07 15:01:23', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-10-07 15:01:23', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-10-07 15:01:23', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-10-07 15:01:23', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2023-10-07 15:01:23', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-10-07 15:01:23', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '长春总厂', 0, 'weixiao', '13888888888', '249941610@qq.com', '0', '0', 'admin', '2023-10-07 14:30:10', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '南京分厂', 1, 'weixiao', '13888888888', '249941610@qq.com', '0', '0', 'admin', '2023-10-07 14:30:10', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '辽宁分厂', 2, 'weixiao', '13888888888', '249941610@qq.com', '0', '0', 'admin', '2023-10-07 14:30:10', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100', '山东分厂', 1, 'weixiao', '13888888888', '249941610@qq.com', '0', '0', 'admin', '2023-10-07 14:30:10', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-10-07 14:54:05', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-10-07 14:54:05', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-10-07 14:54:05', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-10-07 14:54:05', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-10-07 14:54:05', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-10-07 14:54:05', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-07 14:54:06', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-10-07 14:54:07', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-07 14:54:07', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-10-07 14:54:07', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-07 14:54:07', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-07 14:54:07', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-07 14:54:07', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-10-07 14:54:07', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-10-07 14:54:07', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-10-07 14:54:07', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-10-07 14:54:07', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (30, 0, '离线', '0', 'device_status', NULL, 'warning', 'N', '0', 'admin', '2023-10-24 11:01:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 0, '在新', '1', 'device_status', NULL, 'primary', 'N', '0', 'admin', '2023-10-24 11:01:37', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-10-07 14:53:04', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-10-07 14:53:04', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-10-07 14:53:04', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-10-07 14:53:04', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-10-07 14:53:04', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-10-07 14:53:04', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-10-07 14:53:04', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-10-07 14:53:04', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-10-07 14:53:04', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-10-07 14:53:04', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '设备状态', 'device_status', '0', 'admin', '2023-10-24 10:57:15', 'admin', '2023-10-24 11:00:13', '设备的状态0是离线1在线');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status`) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-18 11:01:06');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-18 12:44:07');
INSERT INTO `sys_logininfor` VALUES (3, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-18 12:45:33');
INSERT INTO `sys_logininfor` VALUES (4, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '退出成功', '2023-10-18 13:08:01');
INSERT INTO `sys_logininfor` VALUES (5, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-18 13:08:24');
INSERT INTO `sys_logininfor` VALUES (6, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-18 13:08:46');
INSERT INTO `sys_logininfor` VALUES (7, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '退出成功', '2023-10-18 13:19:18');
INSERT INTO `sys_logininfor` VALUES (8, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-18 13:19:35');
INSERT INTO `sys_logininfor` VALUES (9, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '退出成功', '2023-10-18 15:45:54');
INSERT INTO `sys_logininfor` VALUES (10, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-18 15:46:01');
INSERT INTO `sys_logininfor` VALUES (11, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '退出成功', '2023-10-18 15:47:19');
INSERT INTO `sys_logininfor` VALUES (12, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-18 15:47:26');
INSERT INTO `sys_logininfor` VALUES (13, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-18 16:01:54');
INSERT INTO `sys_logininfor` VALUES (14, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-18 16:03:06');
INSERT INTO `sys_logininfor` VALUES (15, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-19 09:27:37');
INSERT INTO `sys_logininfor` VALUES (16, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-19 09:27:52');
INSERT INTO `sys_logininfor` VALUES (17, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-19 10:23:32');
INSERT INTO `sys_logininfor` VALUES (18, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-19 10:23:46');
INSERT INTO `sys_logininfor` VALUES (19, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '退出成功', '2023-10-19 10:50:49');
INSERT INTO `sys_logininfor` VALUES (20, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-19 10:51:41');
INSERT INTO `sys_logininfor` VALUES (21, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '退出成功', '2023-10-19 10:56:07');
INSERT INTO `sys_logininfor` VALUES (22, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-19 10:59:06');
INSERT INTO `sys_logininfor` VALUES (23, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-19 10:59:34');
INSERT INTO `sys_logininfor` VALUES (24, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-19 12:51:04');
INSERT INTO `sys_logininfor` VALUES (25, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-19 12:54:24');
INSERT INTO `sys_logininfor` VALUES (26, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-19 13:00:25');
INSERT INTO `sys_logininfor` VALUES (27, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-19 15:37:06');
INSERT INTO `sys_logininfor` VALUES (28, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-19 15:52:45');
INSERT INTO `sys_logininfor` VALUES (29, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-20 09:25:42');
INSERT INTO `sys_logininfor` VALUES (30, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-20 09:59:17');
INSERT INTO `sys_logininfor` VALUES (31, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-20 10:53:25');
INSERT INTO `sys_logininfor` VALUES (32, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-20 13:22:13');
INSERT INTO `sys_logininfor` VALUES (33, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-20 13:54:18');
INSERT INTO `sys_logininfor` VALUES (34, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-20 15:39:05');
INSERT INTO `sys_logininfor` VALUES (35, 'admin', '192.168.1.197', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-23 11:14:57');
INSERT INTO `sys_logininfor` VALUES (36, 'admin', '192.168.1.197', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-23 11:15:21');
INSERT INTO `sys_logininfor` VALUES (37, 'admin', '192.168.1.197', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-23 12:56:32');
INSERT INTO `sys_logininfor` VALUES (38, 'admin', '192.168.1.197', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-23 15:42:02');
INSERT INTO `sys_logininfor` VALUES (39, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '验证码已失效', '2023-10-24 09:50:45');
INSERT INTO `sys_logininfor` VALUES (40, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-24 09:50:50');
INSERT INTO `sys_logininfor` VALUES (41, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-24 09:53:12');
INSERT INTO `sys_logininfor` VALUES (42, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-24 10:52:18');
INSERT INTO `sys_logininfor` VALUES (43, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '用户不存在/密码错误', '2023-10-24 14:16:49');
INSERT INTO `sys_logininfor` VALUES (44, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '密码输入错误1次', '2023-10-24 14:16:49');
INSERT INTO `sys_logininfor` VALUES (45, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '用户不存在/密码错误', '2023-10-24 14:17:00');
INSERT INTO `sys_logininfor` VALUES (46, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '密码输入错误2次', '2023-10-24 14:17:00');
INSERT INTO `sys_logininfor` VALUES (47, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '验证码错误', '2023-10-24 14:17:02');
INSERT INTO `sys_logininfor` VALUES (48, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '密码输入错误3次', '2023-10-24 14:17:09');
INSERT INTO `sys_logininfor` VALUES (49, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '用户不存在/密码错误', '2023-10-24 14:17:09');
INSERT INTO `sys_logininfor` VALUES (50, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '密码输入错误4次', '2023-10-24 14:17:40');
INSERT INTO `sys_logininfor` VALUES (51, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '用户不存在/密码错误', '2023-10-24 14:17:40');
INSERT INTO `sys_logininfor` VALUES (52, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-24 14:17:57');
INSERT INTO `sys_logininfor` VALUES (53, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '退出成功', '2023-10-24 14:18:28');
INSERT INTO `sys_logininfor` VALUES (54, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-24 14:18:34');
INSERT INTO `sys_logininfor` VALUES (55, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '退出成功', '2023-10-24 14:19:06');
INSERT INTO `sys_logininfor` VALUES (56, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-24 14:19:16');
INSERT INTO `sys_logininfor` VALUES (57, 'ry', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-24 14:20:03');
INSERT INTO `sys_logininfor` VALUES (58, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '退出成功', '2023-10-24 14:22:02');
INSERT INTO `sys_logininfor` VALUES (59, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-24 14:22:07');
INSERT INTO `sys_logininfor` VALUES (60, 'ry', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '退出成功', '2023-10-24 15:02:26');
INSERT INTO `sys_logininfor` VALUES (61, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-24 15:03:14');
INSERT INTO `sys_logininfor` VALUES (62, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '退出成功', '2023-10-24 15:35:41');
INSERT INTO `sys_logininfor` VALUES (63, 'ry', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-24 15:35:51');
INSERT INTO `sys_logininfor` VALUES (64, 'ry', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '退出成功', '2023-10-24 15:54:28');
INSERT INTO `sys_logininfor` VALUES (65, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-24 16:09:46');
INSERT INTO `sys_logininfor` VALUES (66, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-25 09:42:29');
INSERT INTO `sys_logininfor` VALUES (67, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-25 09:50:30');
INSERT INTO `sys_logininfor` VALUES (68, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-25 13:38:58');
INSERT INTO `sys_logininfor` VALUES (69, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '1', '验证码错误', '2023-10-25 14:45:13');
INSERT INTO `sys_logininfor` VALUES (70, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-25 14:45:19');
INSERT INTO `sys_logininfor` VALUES (71, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-28 10:51:12');
INSERT INTO `sys_logininfor` VALUES (72, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-28 13:10:58');
INSERT INTO `sys_logininfor` VALUES (73, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-28 14:15:50');
INSERT INTO `sys_logininfor` VALUES (74, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-28 15:12:32');
INSERT INTO `sys_logininfor` VALUES (75, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-28 15:37:06');
INSERT INTO `sys_logininfor` VALUES (76, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-30 15:38:24');
INSERT INTO `sys_logininfor` VALUES (77, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-31 10:29:58');
INSERT INTO `sys_logininfor` VALUES (78, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-10-31 13:10:06');
INSERT INTO `sys_logininfor` VALUES (79, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-31 13:20:16');
INSERT INTO `sys_logininfor` VALUES (80, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-10-31 15:06:07');
INSERT INTO `sys_logininfor` VALUES (81, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-11-01 13:25:40');
INSERT INTO `sys_logininfor` VALUES (82, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-11-01 15:36:51');
INSERT INTO `sys_logininfor` VALUES (83, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-11-02 16:14:49');
INSERT INTO `sys_logininfor` VALUES (84, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-02 16:15:20');
INSERT INTO `sys_logininfor` VALUES (85, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-03 08:49:29');
INSERT INTO `sys_logininfor` VALUES (86, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '1', '验证码已失效', '2023-11-03 09:39:26');
INSERT INTO `sys_logininfor` VALUES (87, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-03 09:39:26');
INSERT INTO `sys_logininfor` VALUES (88, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-03 09:39:35');
INSERT INTO `sys_logininfor` VALUES (89, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-03 11:14:16');
INSERT INTO `sys_logininfor` VALUES (90, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-03 12:41:13');
INSERT INTO `sys_logininfor` VALUES (91, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-03 13:25:57');
INSERT INTO `sys_logininfor` VALUES (92, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '退出成功', '2023-11-03 13:44:51');
INSERT INTO `sys_logininfor` VALUES (93, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-03 13:45:01');
INSERT INTO `sys_logininfor` VALUES (94, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-03 15:06:04');
INSERT INTO `sys_logininfor` VALUES (95, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-03 15:50:31');
INSERT INTO `sys_logininfor` VALUES (96, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-06 09:05:45');
INSERT INTO `sys_logininfor` VALUES (97, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-06 16:01:19');
INSERT INTO `sys_logininfor` VALUES (98, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-07 09:41:00');
INSERT INTO `sys_logininfor` VALUES (99, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '1', '验证码错误', '2023-11-07 10:35:49');
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-07 10:36:00');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-07 13:39:26');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-07 15:38:35');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '1', '验证码已失效', '2023-11-08 10:21:46');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-08 10:21:51');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-08 10:58:11');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-08 15:20:37');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '验证码已失效', '2023-11-10 10:48:33');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-11-10 10:48:38');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-10 10:49:19');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-10 12:53:59');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-10 13:38:12');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-10 15:22:18');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-13 10:54:01');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '退出成功', '2023-11-13 11:13:12');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-13 11:13:20');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-13 12:43:30');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-13 14:17:28');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-13 15:47:08');
INSERT INTO `sys_logininfor` VALUES (119, 'ry', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-14 09:57:44');
INSERT INTO `sys_logininfor` VALUES (120, 'ry', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '退出成功', '2023-11-14 09:58:55');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-14 09:59:00');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-15 15:41:21');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-16 09:58:19');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-16 11:15:14');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-16 12:51:43');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-16 15:46:34');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-17 10:14:53');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-17 12:56:28');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-20 11:08:20');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '1', '验证码错误', '2023-11-20 15:47:21');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-20 15:47:26');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-21 08:55:32');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-21 13:31:58');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-11-23 15:59:04');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-27 13:46:08');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-27 16:00:38');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-28 09:35:28');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-11-28 09:36:46');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-11-28 11:09:41');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-28 14:55:09');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '密码输入错误1次', '2023-11-28 15:54:38');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '用户不存在/密码错误', '2023-11-28 15:54:38');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '密码输入错误2次', '2023-11-28 15:55:10');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '用户不存在/密码错误', '2023-11-28 15:55:10');
INSERT INTO `sys_logininfor` VALUES (145, 'wumei', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '登录用户：wumei 不存在', '2023-11-28 15:55:40');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '用户不存在/密码错误', '2023-11-28 15:55:54');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '密码输入错误3次', '2023-11-28 15:55:54');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '验证码错误', '2023-11-28 15:56:04');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '用户不存在/密码错误', '2023-11-28 15:56:10');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '密码输入错误4次', '2023-11-28 15:56:10');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '验证码已失效', '2023-11-28 15:58:43');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '密码输入错误5次', '2023-11-28 15:58:48');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '用户不存在/密码错误', '2023-11-28 15:58:48');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '密码输入错误5次，帐户锁定10分钟', '2023-11-28 15:59:03');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '1', '密码输入错误5次，帐户锁定10分钟', '2023-11-28 15:59:03');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-11-28 16:14:50');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-29 10:31:22');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-29 12:53:06');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-29 14:54:15');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-29 15:25:47');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-29 16:16:55');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-30 10:00:35');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-11-30 13:35:06');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-01 14:53:25');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-05 10:53:31');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-05 13:12:15');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-05 15:16:15');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 7', '0', '登录成功', '2023-12-06 11:05:04');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-07 14:30:15');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-07 16:04:18');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-08 11:04:23');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-08 12:43:02');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '1', '验证码错误', '2023-12-08 13:13:14');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '1', '验证码错误', '2023-12-08 13:13:15');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-08 13:13:20');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '1', '验证码错误', '2023-12-08 13:33:32');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-08 13:33:37');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-08 14:40:16');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-13 15:58:06');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-14 16:13:12');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-18 15:32:24');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-19 11:16:33');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-19 13:06:16');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-19 16:00:58');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-20 11:23:43');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-20 13:41:20');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '1', '验证码错误', '2023-12-20 14:45:41');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-20 14:45:46');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '1', '验证码已失效', '2023-12-21 11:00:07');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-21 11:00:17');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-21 16:07:02');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-22 09:25:08');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-22 10:34:48');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-22 13:49:28');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-22 15:07:25');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-22 15:59:44');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-25 12:56:13');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-25 14:24:41');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-25 14:56:36');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Firefox 11', 'Windows 7', '0', '登录成功', '2023-12-25 15:34:49');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1066 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-10-07 14:46:38', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-10-07 14:46:38', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-10-07 14:46:38', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2023-10-07 14:46:38', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-10-07 14:46:38', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-10-07 14:46:38', 'admin', '2023-10-28 11:19:54', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-10-07 14:46:38', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-10-07 14:46:38', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-10-07 14:46:38', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-10-07 14:46:38', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-10-07 14:46:38', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-10-07 14:46:39', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-10-07 14:46:39', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-10-07 14:46:39', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-10-07 14:46:39', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-10-07 14:46:39', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-10-07 14:46:39', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-10-07 14:46:39', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-10-07 14:46:39', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-10-07 14:46:39', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-10-07 14:46:39', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-10-07 14:46:39', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-10-07 14:46:39', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-10-07 14:46:39', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-10-07 14:46:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-10-07 14:46:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-10-07 14:46:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-10-18 14:09:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-10-18 14:09:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-10-18 14:09:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-10-18 14:09:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-10-18 14:09:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-10-18 14:09:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1061, '电力监控', 0, 5, 'device', NULL, NULL, 1, 0, 'M', '0', '0', '', 'server', 'admin', '2023-10-19 13:52:18', 'admin', '2023-10-19 14:15:21', '');
INSERT INTO `sys_menu` VALUES (1062, '实时数据', 1061, 1, 'realdata', 'powermonitor/realdata/index', NULL, 1, 0, 'C', '0', '0', 'device:realtime:list', 'eye-open', 'admin', '2023-10-19 14:19:41', 'admin', '2023-10-19 14:21:10', '');
INSERT INTO `sys_menu` VALUES (1063, '能耗分析', 0, 1, 'analysis', NULL, NULL, 1, 0, 'M', '0', '0', '', 'chart', 'admin', '2023-10-28 11:13:18', 'admin', '2023-10-28 11:13:31', '');
INSERT INTO `sys_menu` VALUES (1064, '电能月报表', 1063, 1, 'powerEnergy', 'analysis/energyMonth/index', NULL, 1, 0, 'C', '0', '0', 'analysis:energyMonth:list', 'build', 'admin', '2023-10-28 11:19:17', 'admin', '2023-12-05 13:48:37', '');
INSERT INTO `sys_menu` VALUES (1065, '电能月分析', 1063, 2, 'energyMonthAnalysis', 'analysis/energyMonth/energyAnalysis', NULL, 1, 0, 'C', '0', '0', 'analysis:energyMonth:energyMonthAnalysis', 'druid', 'admin', '2023-12-05 13:30:19', 'admin', '2023-12-05 14:05:18', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 能耗管理系统新版本web发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-10-07 14:56:38', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 能耗管理系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-10-07 14:56:38', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint(20) NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type`) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status`) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 96 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-07 14:43:23\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,107,1002,1005,1006,1035],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-10 11:08:53', 186);
INSERT INTO `sys_oper_log` VALUES (2, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,109,100,1000,1001,1002,1003,1004,1005,1006,103,1016,1017,1018,1019,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,1046],\"params\":{},\"remark\":\"管理员\",\"roleId\":3,\"roleKey\":\"manager\",\"roleName\":\"manager\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-10 11:18:24', 134);
INSERT INTO `sys_oper_log` VALUES (3, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"249941610@qq.com\",\"nickName\":\"weixiao\",\"params\":{},\"phonenumber\":\"13841510353\",\"postIds\":[],\"remark\":\"总厂管理\",\"roleIds\":[3],\"sex\":\"1\",\"status\":\"0\",\"userId\":3,\"userName\":\"weixiao\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-10 13:21:53', 141);
INSERT INTO `sys_oper_log` VALUES (4, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-10 13:30:20', 71);
INSERT INTO `sys_oper_log` VALUES (5, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.add()', 'POST', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":100,\"email\":\"249941610@qq.com\",\"nickName\":\"weixiao\",\"params\":{},\"phonenumber\":\"13841510353\",\"postIds\":[],\"roleIds\":[3],\"sex\":\"1\",\"status\":\"0\",\"userId\":4,\"userName\":\"weixiao\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-10 13:31:12', 158);
INSERT INTO `sys_oper_log` VALUES (6, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-07 14:43:23\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,107,1006,1035],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-11 16:19:58', 186);
INSERT INTO `sys_oper_log` VALUES (7, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-07 14:43:23\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,1035],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 09:20:55', 182);
INSERT INTO `sys_oper_log` VALUES (8, '登录日志', 9, 'com.ruoyi.web.controller.monitor.SysLogininforController.clean()', 'DELETE', 1, 'weixiao', NULL, '/monitor/logininfor/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-12 11:17:02', 192);
INSERT INTO `sys_oper_log` VALUES (9, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"device\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 13:01:21', 411);
INSERT INTO `sys_oper_log` VALUES (10, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"device\"}', NULL, 0, NULL, '2023-10-19 13:01:39', 330);
INSERT INTO `sys_oper_log` VALUES (11, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"电力监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"devicecontrol\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 13:52:18', 46);
INSERT INTO `sys_oper_log` VALUES (12, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-19 13:52:18\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"电力监控\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"devicecontrol\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 13:52:56', 33);
INSERT INTO `sys_oper_log` VALUES (13, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-19 13:52:18\",\"icon\":\"server\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"电力监控\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"device\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 14:15:21', 65);
INSERT INTO `sys_oper_log` VALUES (14, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"eye-open\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"实时数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"realdata\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 14:19:41', 46);
INSERT INTO `sys_oper_log` VALUES (15, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"device/realtime/index\",\"createTime\":\"2023-10-19 14:19:41\",\"icon\":\"eye-open\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1062,\"menuName\":\"实时数据\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1061,\"path\":\"realdata\",\"perms\":\"device:realtime:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 14:21:10', 50);
INSERT INTO `sys_oper_log` VALUES (16, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"powerMonitor\",\"className\":\"Device\",\"columns\":[{\"capJavaField\":\"DevId\",\"columnComment\":\"设备号\",\"columnId\":1,\"columnName\":\"dev_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-19 13:01:21\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"devId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DevName\",\"columnComment\":\"设备名称\",\"columnId\":2,\"columnName\":\"dev_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-19 13:01:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"devName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DevGnum\",\"columnComment\":\"柜号\",\"columnId\":3,\"columnName\":\"dev_GNum\",\"columnType\":\"char(64)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-19 13:01:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"devGnum\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"设备状态，如果是0不在线1为在线\",\"columnId\":4,\"columnName\":\"status\",\"columnType\":\"int(4)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-19 13:01:21\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"status\",\"javaType\":\"Integ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-19 14:59:23', 213);
INSERT INTO `sys_oper_log` VALUES (17, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"device\"}', NULL, 0, NULL, '2023-10-19 14:59:38', 51);
INSERT INTO `sys_oper_log` VALUES (18, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"设备状态\",\"dictType\":\"device_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 10:57:15', 44);
INSERT INTO `sys_oper_log` VALUES (19, '字典类型', 2, 'com.ruoyi.web.controller.system.SysDictTypeController.edit()', 'PUT', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-10-24 10:57:15\",\"dictId\":11,\"dictName\":\"设备状态\",\"dictType\":\"device_status\",\"params\":{},\"remark\":\"设备的状态0是离线1在线\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 11:00:13', 63);
INSERT INTO `sys_oper_log` VALUES (20, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"离线\",\"dictSort\":0,\"dictType\":\"device_status\",\"dictValue\":\"0\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 11:01:14', 44);
INSERT INTO `sys_oper_log` VALUES (21, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"在新\",\"dictSort\":0,\"dictType\":\"device_status\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 11:01:37', 40);
INSERT INTO `sys_oper_log` VALUES (22, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-10-07 14:43:23\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,1035,1061,1062],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-24 14:19:01', 130);
INSERT INTO `sys_oper_log` VALUES (23, '电力监控', 5, 'com.ruoyi.powerMonitor.controller.DeviceController.export()', 'POST', 1, 'admin', NULL, '/powerMonitor/powerMonitor/export', '127.0.0.1', '内网IP', '{\"deptId\":\"101\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-10-25 10:05:24', 1369);
INSERT INTO `sys_oper_log` VALUES (24, '电力监控', 5, 'com.ruoyi.powerMonitor.controller.DeviceController.export()', 'POST', 1, 'admin', NULL, '/powerMonitor/powerMonitor/export', '127.0.0.1', '内网IP', '{\"deptId\":\"100\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-10-25 10:20:47', 616);
INSERT INTO `sys_oper_log` VALUES (25, '电力监控', 5, 'com.ruoyi.powerMonitor.controller.DeviceController.export()', 'POST', 1, 'admin', NULL, '/powerMonitor/powerMonitor/export', '127.0.0.1', '内网IP', '{\"deptId\":\"102\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-10-25 13:46:50', 661);
INSERT INTO `sys_oper_log` VALUES (26, '电力监控', 5, 'com.ruoyi.powerMonitor.controller.DeviceController.export()', 'POST', 1, 'admin', NULL, '/powerMonitor/powerMonitor/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-10-25 14:01:13', 645);
INSERT INTO `sys_oper_log` VALUES (27, '电力监控', 5, 'com.ruoyi.powerMonitor.controller.DeviceController.export()', 'POST', 1, 'admin', NULL, '/powerMonitor/powerMonitor/export', '127.0.0.1', '内网IP', '{\"deptId\":\"103\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-10-25 14:45:36', 629);
INSERT INTO `sys_oper_log` VALUES (28, '电力监控', 5, 'com.ruoyi.powerMonitor.controller.DeviceController.export()', 'POST', 1, 'admin', NULL, '/powerMonitor/powerMonitor/export', '127.0.0.1', '内网IP', '{\"deptId\":\"102\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-10-25 14:47:55', 604);
INSERT INTO `sys_oper_log` VALUES (29, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"analysis\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"analysis\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 11:13:18', 67);
INSERT INTO `sys_oper_log` VALUES (30, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-10-28 11:13:18\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1063,\"menuName\":\"能耗分析\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"analysis\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 11:13:31', 42);
INSERT INTO `sys_oper_log` VALUES (31, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/power/index\",\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用电分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1063,\"path\":\"analysis\",\"perms\":\"analgysis:power:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 11:19:17', 48);
INSERT INTO `sys_oper_log` VALUES (32, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/role/index\",\"createTime\":\"2023-10-07 14:46:38\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":101,\"menuName\":\"角色管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1,\"path\":\"role\",\"perms\":\"system:role:list\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 11:19:54', 47);
INSERT INTO `sys_oper_log` VALUES (33, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"energy_day\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 11:20:30', 149);
INSERT INTO `sys_oper_log` VALUES (34, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"day\",\"className\":\"EnergyDay\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DevId\",\"columnComment\":\"设备id\",\"columnId\":22,\"columnName\":\"dev_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"devId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Epp2\",\"columnComment\":\"电能\",\"columnId\":23,\"columnName\":\"epp2\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"epp2\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CollectTime\",\"columnId\":24,\"columnName\":\"collect_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"collectTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":fals', NULL, 1, '树编码字段不能为空', '2023-10-28 11:25:41', 10);
INSERT INTO `sys_oper_log` VALUES (35, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"day\",\"className\":\"EnergyDay\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DevId\",\"columnComment\":\"设备id\",\"columnId\":22,\"columnName\":\"dev_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"devId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Epp2\",\"columnComment\":\"电能\",\"columnId\":23,\"columnName\":\"epp2\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"epp2\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CollectTime\",\"columnId\":24,\"columnName\":\"collect_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"collectTime\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":fals', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 11:36:17', 65);
INSERT INTO `sys_oper_log` VALUES (36, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"energy_day\"}', NULL, 0, NULL, '2023-10-28 13:11:08', 81);
INSERT INTO `sys_oper_log` VALUES (37, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"energy\",\"className\":\"EnergyDay\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 11:36:17\",\"usableColumn\":false},{\"capJavaField\":\"DevId\",\"columnComment\":\"设备id\",\"columnId\":22,\"columnName\":\"dev_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"devId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 11:36:17\",\"usableColumn\":false},{\"capJavaField\":\"Epp2\",\"columnComment\":\"电能\",\"columnId\":23,\"columnName\":\"epp2\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"epp2\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 11:36:17\",\"usableColumn\":false},{\"capJavaField\":\"CollectTime\",\"columnId\":24,\"columnName\":\"collect_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"col', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:15:22', 65);
INSERT INTO `sys_oper_log` VALUES (38, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"energy_day\"}', NULL, 0, NULL, '2023-10-28 13:15:47', 41);
INSERT INTO `sys_oper_log` VALUES (39, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"energy_day\"}', NULL, 0, NULL, '2023-10-28 13:35:42', 78);
INSERT INTO `sys_oper_log` VALUES (40, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"energy_day\",\"className\":\"EnergyDay\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:15:22\",\"usableColumn\":false},{\"capJavaField\":\"DevId\",\"columnComment\":\"设备id\",\"columnId\":22,\"columnName\":\"dev_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"devId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:15:22\",\"usableColumn\":false},{\"capJavaField\":\"Epp2\",\"columnComment\":\"电能\",\"columnId\":23,\"columnName\":\"epp2\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"epp2\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:15:22\",\"usableColumn\":false},{\"capJavaField\":\"CollectTime\",\"columnId\":24,\"columnName\":\"collect_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:40:21', 59);
INSERT INTO `sys_oper_log` VALUES (41, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"energy_day\"}', NULL, 0, NULL, '2023-10-28 13:40:28', 43);
INSERT INTO `sys_oper_log` VALUES (42, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"energyDay\",\"className\":\"EnergyDay\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":21,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:40:21\",\"usableColumn\":false},{\"capJavaField\":\"DevId\",\"columnComment\":\"设备id\",\"columnId\":22,\"columnName\":\"dev_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"devId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:40:21\",\"usableColumn\":false},{\"capJavaField\":\"Epp2\",\"columnComment\":\"电能\",\"columnId\":23,\"columnName\":\"epp2\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"epp2\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2023-10-28 13:40:21\",\"usableColumn\":false},{\"capJavaField\":\"CollectTime\",\"columnId\":24,\"columnName\":\"collect_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 11:20:30\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 13:43:16', 62);
INSERT INTO `sys_oper_log` VALUES (43, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"energy_day\"}', NULL, 0, NULL, '2023-10-28 13:43:42', 45);
INSERT INTO `sys_oper_log` VALUES (44, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:16:02', 113);
INSERT INTO `sys_oper_log` VALUES (45, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"energy_month\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:16:13', 117);
INSERT INTO `sys_oper_log` VALUES (46, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"energy_month\"}', NULL, 0, NULL, '2023-10-28 14:20:03', 169);
INSERT INTO `sys_oper_log` VALUES (47, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"energyMonth\",\"className\":\"EnergyMonth\",\"columns\":[{\"capJavaField\":\"Id\",\"columnId\":25,\"columnName\":\"id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 14:16:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"DevId\",\"columnComment\":\"设备id\",\"columnId\":26,\"columnName\":\"dev_id\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 14:16:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"devId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Epp2\",\"columnComment\":\"电能\",\"columnId\":27,\"columnName\":\"epp2\",\"columnType\":\"int(11)\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 14:16:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"epp2\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CollectTime\",\"columnId\":28,\"columnName\":\"collect_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2023-10-28 14:16:13\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isEdit\":\"0\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"0\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"collectTime\",\"javaType\":\"Date\",\"list\":false,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"r', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:24:29', 61);
INSERT INTO `sys_oper_log` VALUES (48, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"energy_month\"}', NULL, 0, NULL, '2023-10-28 14:24:31', 51);
INSERT INTO `sys_oper_log` VALUES (49, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/energyMonth/index\",\"createTime\":\"2023-10-28 11:19:17\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"用电分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1063,\"path\":\"analysis\",\"perms\":\"analysis:energyMonth:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:40:58', 80);
INSERT INTO `sys_oper_log` VALUES (50, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/energyMonth/index\",\"createTime\":\"2023-10-28 11:19:17\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"用电分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1063,\"path\":\"analysis/powerEnergy\",\"perms\":\"analysis:energyMonth:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:45:50', 59);
INSERT INTO `sys_oper_log` VALUES (51, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/energyMonth/index\",\"createTime\":\"2023-10-28 11:19:17\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"用电分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1063,\"path\":\"powerEnergy\",\"perms\":\"analysis:energyMonth:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-10-28 14:47:37', 49);
INSERT INTO `sys_oper_log` VALUES (52, '电力监控', 5, 'com.ruoyi.powerMonitor.controller.DeviceController.export()', 'POST', 1, 'admin', NULL, '/powerMonitor/powerMonitor/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-23 16:05:50', 384402);
INSERT INTO `sys_oper_log` VALUES (53, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-27 13:46:25', 1576);
INSERT INTO `sys_oper_log` VALUES (54, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-27 13:52:21', 104561);
INSERT INTO `sys_oper_log` VALUES (55, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 1, 'Can not close IO.', '2023-11-27 13:57:27', 150927);
INSERT INTO `sys_oper_log` VALUES (56, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-27 14:04:45', 46078);
INSERT INTO `sys_oper_log` VALUES (57, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-27 14:05:09', 4862);
INSERT INTO `sys_oper_log` VALUES (58, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 1, 'Can not close IO.', '2023-11-27 14:09:59', 144099);
INSERT INTO `sys_oper_log` VALUES (59, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-27 14:16:59', 22470);
INSERT INTO `sys_oper_log` VALUES (60, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-27 14:17:04', 77);
INSERT INTO `sys_oper_log` VALUES (61, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-27 14:22:34', 813);
INSERT INTO `sys_oper_log` VALUES (62, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 1, '', '2023-11-27 16:06:35', 8);
INSERT INTO `sys_oper_log` VALUES (63, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 1, '', '2023-11-27 16:09:02', 0);
INSERT INTO `sys_oper_log` VALUES (64, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 1, '', '2023-11-27 16:09:24', 1);
INSERT INTO `sys_oper_log` VALUES (65, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 1, '', '2023-11-27 16:09:36', 1);
INSERT INTO `sys_oper_log` VALUES (66, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-27 16:10:01', 11388);
INSERT INTO `sys_oper_log` VALUES (67, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-27 16:10:07', 62);
INSERT INTO `sys_oper_log` VALUES (68, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-27 16:21:27', 50);
INSERT INTO `sys_oper_log` VALUES (69, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-28 09:35:49', 1803);
INSERT INTO `sys_oper_log` VALUES (70, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 1, '', '2023-11-28 09:36:57', 1);
INSERT INTO `sys_oper_log` VALUES (71, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-28 09:37:05', 50);
INSERT INTO `sys_oper_log` VALUES (72, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-28 09:39:01', 70);
INSERT INTO `sys_oper_log` VALUES (73, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-28 09:40:23', 71);
INSERT INTO `sys_oper_log` VALUES (74, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-28 10:18:26', 62);
INSERT INTO `sys_oper_log` VALUES (75, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-28 10:20:08', 627);
INSERT INTO `sys_oper_log` VALUES (76, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"pageSize\":\"10\",\"params[devIds]\":\"[322]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-28 10:31:51', 640);
INSERT INTO `sys_oper_log` VALUES (77, '电力监控', 5, 'com.ruoyi.powerMonitor.controller.DeviceController.export()', 'POST', 1, 'admin', NULL, '/powerMonitor/powerMonitor/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-28 15:42:16', 16260);
INSERT INTO `sys_oper_log` VALUES (78, '电力监控', 5, 'com.ruoyi.powerMonitor.controller.DeviceController.export()', 'POST', 1, 'admin', NULL, '/powerMonitor/powerMonitor/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-28 15:42:20', 69);
INSERT INTO `sys_oper_log` VALUES (79, '字典类型', 5, 'com.ruoyi.web.controller.system.SysDictTypeController.export()', 'POST', 1, 'admin', NULL, '/system/dict/type/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-28 15:48:49', 640);
INSERT INTO `sys_oper_log` VALUES (80, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/energyMonth/index\",\"createTime\":\"2023-10-28 11:19:17\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"用电月分析\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1063,\"path\":\"powerEnergy\",\"perms\":\"analysis:energyMonth:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-11-29 15:45:21', 56);
INSERT INTO `sys_oper_log` VALUES (81, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 1, '', '2023-11-29 15:46:03', 3);
INSERT INTO `sys_oper_log` VALUES (82, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-11-30 15:36:43\",\"params[time]\":\"2023-11-30 15:36:43\",\"deptId\":\"100\",\"pageSize\":\"10\",\"params[devIds]\":\"[]\",\"pageNum\":\"1\"}', NULL, 1, '无数据可导出！', '2023-11-30 15:37:12', 13);
INSERT INTO `sys_oper_log` VALUES (83, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"params[time]\":\"2023-10-01\",\"deptId\":\"100\",\"pageSize\":\"10\",\"params[devIds]\":\"[]\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-11-30 15:58:23', 1656);
INSERT INTO `sys_oper_log` VALUES (84, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/energyMonth/index\",\"createTime\":\"2023-10-28 11:19:17\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"电能月报表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1063,\"path\":\"powerEnergy\",\"perms\":\"analysis:energyMonth:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 11:07:52', 68);
INSERT INTO `sys_oper_log` VALUES (85, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/energyMonth/index\",\"createTime\":\"2023-10-28 11:19:17\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"电能月报表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1063,\"path\":\"powerEnergy\",\"perms\":\"analysis:energyMonth:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 11:11:27', 44);
INSERT INTO `sys_oper_log` VALUES (86, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/energyMonthAnalysis/index\",\"createBy\":\"admin\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"电能月分析\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1063,\"path\":\"energyMonthAnalysis\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 13:30:19', 47);
INSERT INTO `sys_oper_log` VALUES (87, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/energyMonth/energyAnalysis\",\"createTime\":\"2023-12-05 13:30:19\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"电能月分析\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1063,\"path\":\"energyMonthAnalysis\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 13:48:25', 51);
INSERT INTO `sys_oper_log` VALUES (88, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/energyMonth/index\",\"createTime\":\"2023-10-28 11:19:17\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1064,\"menuName\":\"电能月报表\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":1063,\"path\":\"powerEnergy\",\"perms\":\"analysis:energyMonth:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 13:48:37', 46);
INSERT INTO `sys_oper_log` VALUES (89, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/energyMonth/energyAnalysis\",\"createTime\":\"2023-12-05 13:30:19\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"电能月分析\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1063,\"path\":\"energyMonthAnalysis\",\"perms\":\"analysis:energyMonth:energyMonthAnalysis\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 13:49:01', 45);
INSERT INTO `sys_oper_log` VALUES (90, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"analysis/energyMonth/energyAnalysis\",\"createTime\":\"2023-12-05 13:30:19\",\"icon\":\"druid\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1065,\"menuName\":\"电能月分析\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":1063,\"path\":\"energyMonthAnalysis\",\"perms\":\"analysis:energyMonth:energyMonthAnalysis\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-05 14:05:19', 112);
INSERT INTO `sys_oper_log` VALUES (91, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"energy_year\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-12-19 14:18:22', 285);
INSERT INTO `sys_oper_log` VALUES (92, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"energy_year\"}', NULL, 0, NULL, '2023-12-19 14:40:32', 114);
INSERT INTO `sys_oper_log` VALUES (93, 'powerEnergy analysis in month', 5, 'com.ruoyi.analysis.controller.EnergyMonthController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyMonth/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-10-01\",\"deptId\":\"100\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-12-22 13:52:43', 2523);
INSERT INTO `sys_oper_log` VALUES (94, '【请填写功能名称】', 5, 'com.ruoyi.analysis.controller.EnergyYearController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyYear/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-12-22 14:12:38\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-12-22 14:13:47', 457);
INSERT INTO `sys_oper_log` VALUES (95, '【请填写功能名称】', 5, 'com.ruoyi.analysis.controller.EnergyYearController.export()', 'POST', 1, 'admin', NULL, '/analysis/energyYear/export', '127.0.0.1', '内网IP', '{\"collectTime\":\"2023-12-22 14:12:38\",\"deptId\":\"100\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-12-22 14:14:04', 141);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-10-10 13:13:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-10-10 13:13:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-10-10 13:13:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-10-10 13:13:48', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-10-07 14:43:23', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-10-07 14:43:23', 'admin', '2023-10-24 14:19:01', '普通角色');
INSERT INTO `sys_role` VALUES (3, 'manager', 'manager', 2, '1', 1, 1, '0', '0', 'admin', '2023-10-10 11:18:23', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1061);
INSERT INTO `sys_role_menu` VALUES (2, 1062);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 100);
INSERT INTO `sys_role_menu` VALUES (3, 103);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 108);
INSERT INTO `sys_role_menu` VALUES (3, 109);
INSERT INTO `sys_role_menu` VALUES (3, 500);
INSERT INTO `sys_role_menu` VALUES (3, 501);
INSERT INTO `sys_role_menu` VALUES (3, 1000);
INSERT INTO `sys_role_menu` VALUES (3, 1001);
INSERT INTO `sys_role_menu` VALUES (3, 1002);
INSERT INTO `sys_role_menu` VALUES (3, 1003);
INSERT INTO `sys_role_menu` VALUES (3, 1004);
INSERT INTO `sys_role_menu` VALUES (3, 1005);
INSERT INTO `sys_role_menu` VALUES (3, 1006);
INSERT INTO `sys_role_menu` VALUES (3, 1016);
INSERT INTO `sys_role_menu` VALUES (3, 1017);
INSERT INTO `sys_role_menu` VALUES (3, 1018);
INSERT INTO `sys_role_menu` VALUES (3, 1019);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 1036);
INSERT INTO `sys_role_menu` VALUES (3, 1037);
INSERT INTO `sys_role_menu` VALUES (3, 1038);
INSERT INTO `sys_role_menu` VALUES (3, 1039);
INSERT INTO `sys_role_menu` VALUES (3, 1040);
INSERT INTO `sys_role_menu` VALUES (3, 1041);
INSERT INTO `sys_role_menu` VALUES (3, 1042);
INSERT INTO `sys_role_menu` VALUES (3, 1043);
INSERT INTO `sys_role_menu` VALUES (3, 1044);
INSERT INTO `sys_role_menu` VALUES (3, 1045);
INSERT INTO `sys_role_menu` VALUES (3, 1046);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 100, 'admin', 'weixiao', '00', 'weixiao@163.com', '13888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-12-25 15:34:49', 'admin', '2023-10-07 14:41:40', '', '2023-12-25 15:34:49', '管理员');
INSERT INTO `sys_user` VALUES (2, 101, 'ry', 'weixiao', '00', 'weixiao@qq.com', '13666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-11-14 09:57:45', 'admin', '2023-10-07 14:41:41', '', '2023-11-14 09:57:44', '测试员');
INSERT INTO `sys_user` VALUES (3, 100, 'weixiao', 'weixiao', '00', '249941610@qq.com', '13841510353', '1', '', '$2a$10$nv3S3YqaPeMJ1vG7/KgU8eXwooMJ.NkAi.quEkJ9SuY/ohBLLCvS.', '0', '2', '', NULL, 'admin', '2023-10-10 13:21:53', '', NULL, '总厂管理');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 3);

SET FOREIGN_KEY_CHECKS = 1;
