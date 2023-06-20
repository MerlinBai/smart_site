/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : smart_site

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 20/06/2023 17:17:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'tb_assets_total', '工地资产统计表', NULL, NULL, 'AssetsTotal', 'crud', 'com.ruoyi.suke', 'suke', 'total', '工地资产统计', 'ruoyi', '0', '/', '{}', 'admin', '2023-05-10 11:38:03', '', '2023-05-10 11:39:54', NULL);
INSERT INTO `gen_table` VALUES (2, 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'com.ruoyi.system', 'system', 'user', '用户信息', 'ruoyi', '0', '/', NULL, 'admin', '2023-05-16 16:47:42', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (3, 'tb_inform', '通知', NULL, NULL, 'Inform', 'crud', 'com.ruoyi.infrom', 'inform', 'inform', '通知', 'ruoyi', '0', '/', '{}', 'admin', '2023-05-17 13:53:27', '', '2023-05-17 16:23:25', NULL);
INSERT INTO `gen_table` VALUES (5, 'tb_user_inform_status', '用户通知状态信息', NULL, NULL, 'UserInformStatus', 'crud', 'com.ruoyi.inform', 'inform', 'inform', '用户通知状态信息', 'ruoyi', '0', '/', '{}', 'admin', '2023-05-27 14:24:35', '', '2023-05-27 14:25:26', NULL);
INSERT INTO `gen_table` VALUES (9, 'tb_lingcheng_map', '陵城区区域', NULL, NULL, 'LingchengMap', 'crud', 'com.ruoyi.lingchengqumap', 'lingchengqumap', 'lingchengqumap', '陵城区区域', 'ruoyi', '0', '/', '{}', 'admin', '2023-06-07 13:56:02', '', '2023-06-07 13:56:59', NULL);
INSERT INTO `gen_table` VALUES (11, 'tb_survey', '满意度检查', NULL, NULL, 'Survey', 'crud', 'com.ruoyi.satisfaction', 'satisfaction', 'survey', '满意度检查', 'ruoyi', '0', '/', '{}', 'admin', '2023-06-18 18:58:15', '', '2023-06-18 18:59:37', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
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
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 87 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'id', '主键', 'int unsigned', 'String', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', NULL, '', 1, 'admin', '2023-05-10 11:38:03', '', '2023-05-10 11:39:54');
INSERT INTO `gen_table_column` VALUES (2, '1', 'total_assets', '总产值', 'decimal(15,2)', 'BigDecimal', 'totalAssets', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-05-10 11:38:03', '', '2023-05-10 11:39:54');
INSERT INTO `gen_table_column` VALUES (3, '1', 'total_investment', '总投资', 'decimal(15,2)', 'BigDecimal', 'totalInvestment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-05-10 11:38:03', '', '2023-05-10 11:39:54');
INSERT INTO `gen_table_column` VALUES (4, '1', 'total_net_profit', '总净利', 'decimal(15,2)', 'BigDecimal', 'totalNetProfit', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-05-10 11:38:03', '', '2023-05-10 11:39:54');
INSERT INTO `gen_table_column` VALUES (5, '1', 'total_revenue', '总税收', 'decimal(15,2)', 'BigDecimal', 'totalRevenue', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2023-05-10 11:38:03', '', '2023-05-10 11:39:54');
INSERT INTO `gen_table_column` VALUES (6, '1', 'site_id', '所属工地', 'int', 'Long', 'siteId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-05-10 11:38:03', '', '2023-05-10 11:39:54');
INSERT INTO `gen_table_column` VALUES (7, '2', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-05-16 16:47:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (8, '2', 'dept_id', '部门ID', 'bigint', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-05-16 16:47:42', '', NULL);
INSERT INTO `gen_table_column` VALUES (9, '2', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (10, '2', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (11, '2', 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (12, '2', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (13, '2', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (14, '2', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (15, '2', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (16, '2', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (17, '2', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (18, '2', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (19, '2', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (20, '2', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '2', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '2', 'id_number', '身份证号', 'varchar(20)', 'String', 'idNumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 20, 'admin', '2023-05-16 16:47:43', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '3', 'inform_id', '通知id', 'int', 'Long', 'informId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-05-17 13:53:27', '', '2023-05-28 11:55:17');
INSERT INTO `gen_table_column` VALUES (28, '3', 'inform_title', '通知标题', 'varchar(255)', 'String', 'informTitle', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-05-17 13:53:27', '', '2023-05-28 11:55:17');
INSERT INTO `gen_table_column` VALUES (29, '3', 'inform_type', '通知类型', 'char(1)', 'String', 'informType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_notice_type', 3, 'admin', '2023-05-17 13:53:27', '', '2023-05-28 11:55:17');
INSERT INTO `gen_table_column` VALUES (30, '3', 'status', '通知状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_notice_status', 4, 'admin', '2023-05-17 13:53:27', '', '2023-05-28 11:55:17');
INSERT INTO `gen_table_column` VALUES (31, '3', 'inform_content', '通知内容', 'text', 'String', 'informContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 5, 'admin', '2023-05-17 13:53:27', '', '2023-05-28 11:55:18');
INSERT INTO `gen_table_column` VALUES (33, '3', 'create_by', '创建者', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2023-05-17 13:53:27', '', '2023-05-28 11:55:18');
INSERT INTO `gen_table_column` VALUES (34, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2023-05-17 13:53:27', '', '2023-05-28 11:55:18');
INSERT INTO `gen_table_column` VALUES (35, '3', 'update_by', '更新者', 'varchar(255)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2023-05-17 13:53:27', '', '2023-05-28 11:55:18');
INSERT INTO `gen_table_column` VALUES (36, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2023-05-17 13:53:27', '', '2023-05-28 11:55:18');
INSERT INTO `gen_table_column` VALUES (37, '3', 'infrom_file', '通知文件', 'varchar(255)', 'String', 'infromFile', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'fileUpload', '', 6, '', '2023-05-17 14:01:20', '', '2023-05-28 11:55:18');
INSERT INTO `gen_table_column` VALUES (48, '5', 'id', '主键id', 'bigint', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-05-27 14:24:35', '', '2023-05-27 14:25:26');
INSERT INTO `gen_table_column` VALUES (49, '5', 'inform_id', '通知id', 'bigint', 'Long', 'informId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-05-27 14:24:35', '', '2023-05-27 14:25:26');
INSERT INTO `gen_table_column` VALUES (50, '5', 'inform_title', '通知标题', 'varchar(255)', 'String', 'informTitle', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-05-27 14:24:35', '', '2023-05-27 14:25:26');
INSERT INTO `gen_table_column` VALUES (51, '5', 'user_id', '用户id', 'bigint', 'Long', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2023-05-27 14:24:35', '', '2023-05-27 14:25:26');
INSERT INTO `gen_table_column` VALUES (52, '5', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2023-05-27 14:24:35', '', '2023-05-27 14:25:26');
INSERT INTO `gen_table_column` VALUES (53, '5', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2023-05-27 14:24:35', '', '2023-05-27 14:25:26');
INSERT INTO `gen_table_column` VALUES (54, '5', 'status', '已读状态', 'varchar(2)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 7, 'admin', '2023-05-27 14:24:35', '', '2023-05-27 14:25:26');
INSERT INTO `gen_table_column` VALUES (55, '5', 'time', '时间', 'datetime', 'Date', 'time', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2023-05-27 14:24:35', '', '2023-05-27 14:25:26');
INSERT INTO `gen_table_column` VALUES (69, '9', 'map_id', '主键', 'int', 'Long', 'mapId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-06-07 13:56:02', '', '2023-06-07 13:56:59');
INSERT INTO `gen_table_column` VALUES (70, '9', 'area_name', '区域名', 'varchar(255)', 'String', 'areaName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2023-06-07 13:56:02', '', '2023-06-07 13:56:59');
INSERT INTO `gen_table_column` VALUES (71, '9', 'population', '人口', 'bigint', 'Long', 'population', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-06-07 13:56:02', '', '2023-06-07 13:56:59');
INSERT INTO `gen_table_column` VALUES (81, '11', 'survey_id', '主键id', 'bigint', 'Long', 'surveyId', '1', '1', NULL, '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-06-18 18:58:15', '', '2023-06-18 18:59:37');
INSERT INTO `gen_table_column` VALUES (82, '11', 'survey_scope', '调查范围', 'varchar(255)', 'String', 'surveyScope', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'survey', 2, 'admin', '2023-06-18 18:58:15', '', '2023-06-18 18:59:37');
INSERT INTO `gen_table_column` VALUES (83, '11', 'survey_object', '调查对象', 'varchar(255)', 'String', 'surveyObject', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 3, 'admin', '2023-06-18 18:58:15', '', '2023-06-18 18:59:37');
INSERT INTO `gen_table_column` VALUES (84, '11', 'survey_by', '调查人', 'varchar(255)', 'String', 'surveyBy', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 4, 'admin', '2023-06-18 18:58:15', '', '2023-06-18 18:59:37');
INSERT INTO `gen_table_column` VALUES (85, '11', 'survey_result', '调查等级', 'varchar(255)', 'String', 'surveyResult', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'grade', 5, 'admin', '2023-06-18 18:58:15', '', '2023-06-18 18:59:37');
INSERT INTO `gen_table_column` VALUES (86, '11', 'survey_time', '调查时间', 'datetime', 'Date', 'surveyTime', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'datetime', '', 6, 'admin', '2023-06-18 18:58:15', '', '2023-06-18 18:59:37');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
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
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2023-05-07 10:41:24', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2023-05-07 10:41:24', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2023-05-07 10:41:24', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2023-05-07 10:41:24', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-14 11:25:22', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2023-05-07 10:41:24', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '陵城区住建部', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-14 11:32:07');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', 'xx公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-14 11:32:31');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', 'xxx公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-14 11:32:42');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '工地一', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-14 11:33:01');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '工地二', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-14 11:33:14');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '工地三', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-14 11:33:24');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '工地四', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-14 11:33:30');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '工地五', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-14 11:33:41');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '工地一', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-14 11:33:46');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '工地二', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-14 11:33:51');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
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
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '施工队', '1', 'survey', NULL, 'default', 'N', '0', 'admin', '2023-06-18 18:47:40', '', NULL, '调查对象是施工队');
INSERT INTO `sys_dict_data` VALUES (101, 2, '施工人员', '2', 'survey', NULL, 'default', 'N', '0', 'admin', '2023-06-18 18:48:11', '', NULL, '调查对象是施工人员');
INSERT INTO `sys_dict_data` VALUES (102, 1, '优秀', '1', 'grade', NULL, 'default', 'N', '0', 'admin', '2023-06-18 18:53:49', '', NULL, '优秀');
INSERT INTO `sys_dict_data` VALUES (103, 2, '良好', '2', 'grade', NULL, 'default', 'N', '0', 'admin', '2023-06-18 18:54:02', '', NULL, '良好');
INSERT INTO `sys_dict_data` VALUES (104, 3, '中等', '3', 'grade', NULL, 'default', 'N', '0', 'admin', '2023-06-18 18:55:05', '', NULL, '中等');
INSERT INTO `sys_dict_data` VALUES (105, 4, '及格', '4', 'grade', NULL, 'default', 'N', '0', 'admin', '2023-06-18 18:55:21', '', NULL, '及格');
INSERT INTO `sys_dict_data` VALUES (106, 5, '不及格', '5', 'grade', NULL, 'default', 'N', '0', 'admin', '2023-06-18 18:55:31', '', NULL, '不及格');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '陵城区区域', 'lingchengqumap', '0', 'admin', '2023-06-07 14:02:12', '', NULL, '陵城区区域');
INSERT INTO `sys_dict_type` VALUES (101, '调查范围', 'survey', '0', 'admin', '2023-06-18 18:46:43', '', NULL, '调查范围列表');
INSERT INTO `sys_dict_type` VALUES (102, '分数', 'grade', '0', 'admin', '2023-06-18 18:53:08', '', NULL, '分数');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2023-05-07 10:41:24', '', '2023-06-07 10:41:43', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2023-05-07 10:41:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：3毫秒', '0', '', '2023-06-07 10:39:50');
INSERT INTO `sys_job_log` VALUES (2, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2023-06-07 10:40:00');
INSERT INTO `sys_job_log` VALUES (3, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2023-06-07 10:40:10');
INSERT INTO `sys_job_log` VALUES (4, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2023-06-07 10:40:20');
INSERT INTO `sys_job_log` VALUES (5, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2023-06-07 10:40:30');
INSERT INTO `sys_job_log` VALUES (6, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2023-06-07 10:40:40');
INSERT INTO `sys_job_log` VALUES (7, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2023-06-07 10:40:50');
INSERT INTO `sys_job_log` VALUES (8, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2023-06-07 10:41:00');
INSERT INTO `sys_job_log` VALUES (9, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2023-06-07 10:41:10');
INSERT INTO `sys_job_log` VALUES (10, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：1毫秒', '0', '', '2023-06-07 10:41:20');
INSERT INTO `sys_job_log` VALUES (11, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2023-06-07 10:41:30');
INSERT INTO `sys_job_log` VALUES (12, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2023-06-07 10:41:40');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 259 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-07 10:46:51');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-07 14:57:18');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 11:32:48');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-08 11:44:54');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 11:44:59');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 15:09:23');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-08 19:50:27');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 09:46:59');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-10 11:51:34');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 11:51:41');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-10 11:52:35');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 11:52:39');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-10 18:34:15');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-12 18:58:10');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-12 18:58:19');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-14 09:45:17');
INSERT INTO `sys_logininfor` VALUES (116, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-14 10:05:32');
INSERT INTO `sys_logininfor` VALUES (117, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-14 10:21:29');
INSERT INTO `sys_logininfor` VALUES (118, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-14 10:21:44');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-14 10:41:39');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-14 11:24:39');
INSERT INTO `sys_logininfor` VALUES (121, 'xiaoc', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-05-14 11:26:05');
INSERT INTO `sys_logininfor` VALUES (122, 'xiaoc', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-14 11:26:14');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-14 18:19:55');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 15:32:34');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 19:26:13');
INSERT INTO `sys_logininfor` VALUES (126, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 19:27:22');
INSERT INTO `sys_logininfor` VALUES (127, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-16 19:28:52');
INSERT INTO `sys_logininfor` VALUES (128, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 19:28:59');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-16 20:20:51');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 20:21:02');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-16 20:21:44');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 20:21:53');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-16 20:26:53');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 20:27:01');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-16 20:27:59');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 20:28:10');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-16 20:28:30');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 20:28:47');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-16 20:59:12');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 21:03:28');
INSERT INTO `sys_logininfor` VALUES (141, 'xixixi', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-16 21:24:13');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-17 11:10:03');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-17 11:48:07');
INSERT INTO `sys_logininfor` VALUES (144, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-17 11:50:55');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-17 12:20:34');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-17 15:50:34');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-17 19:17:43');
INSERT INTO `sys_logininfor` VALUES (148, 'ry', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-17 19:37:08');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-17 20:25:22');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-21 14:51:25');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-27 11:37:57');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-27 12:05:19');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-27 12:05:23');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-27 12:53:51');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-27 13:55:27');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-27 16:20:10');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-27 17:46:00');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-27 21:12:08');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-27 21:29:01');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-05-27 21:29:08');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-27 21:29:55');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2023-05-27 21:30:11');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2023-05-27 21:30:19');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2023-05-27 21:30:21');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-28 11:18:51');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-28 11:54:15');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-28 16:32:52');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-28 16:36:39');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-28 16:36:43');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-05-28 16:41:22');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-05-28 16:41:26');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-04 11:23:39');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2023-06-04 11:25:50');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2023-06-04 11:25:56');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-04 11:32:51');
INSERT INTO `sys_logininfor` VALUES (176, 'xiaocc', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-06-04 11:33:39');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-04 15:02:55');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-04 16:22:42');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2023-06-04 16:22:52');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Unknown', 'Unknown', '1', '验证码已失效', '2023-06-04 16:23:27');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-04 16:28:10');
INSERT INTO `sys_logininfor` VALUES (182, 'xiaoc', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-04 16:28:22');
INSERT INTO `sys_logininfor` VALUES (183, 'xiaoc', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-04 16:28:32');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-04 16:28:38');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-04 19:32:44');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-05 17:30:48');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-05 18:08:30');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-05 18:09:32');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-05 18:10:23');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-05 18:13:21');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-05 18:27:37');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-05 18:37:14');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-05 18:37:19');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-05 18:37:20');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-05 18:37:20');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-05 18:37:22');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-05 18:37:43');
INSERT INTO `sys_logininfor` VALUES (198, 'xiaoxiao', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-05 18:49:57');
INSERT INTO `sys_logininfor` VALUES (199, 'xiaoxiao', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-05 18:50:25');
INSERT INTO `sys_logininfor` VALUES (200, 'xiaoxiao', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-05 18:53:00');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-05 18:53:41');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-05 18:53:43');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-05 18:53:43');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-05 18:53:43');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-05 18:53:54');
INSERT INTO `sys_logininfor` VALUES (206, 'xiaoxiao', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-05 18:54:25');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-05 20:11:56');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-05 20:12:18');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'Mac OS X (iPhone)', '0', '登录成功', '2023-06-05 20:16:19');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-06-06 09:19:21');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-06 09:19:25');
INSERT INTO `sys_logininfor` VALUES (212, 'xiaoc', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-06 09:22:16');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-06 09:22:56');
INSERT INTO `sys_logininfor` VALUES (214, 'xiao1', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-06 09:23:59');
INSERT INTO `sys_logininfor` VALUES (215, 'xiaocc', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-06 09:25:34');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-06 09:37:54');
INSERT INTO `sys_logininfor` VALUES (217, 'xiaoc', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-06 09:39:05');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-06 09:40:23');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-06 09:41:21');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-06 09:41:27');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-06 09:53:23');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-06 09:53:26');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-06 09:53:41');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-06 13:25:44');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-06 15:22:54');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-06 16:45:52');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '1', '验证码已失效', '2023-06-06 16:46:08');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-06 16:46:21');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Mobile Safari', 'iOS 11 (iPhone)', '0', '登录成功', '2023-06-06 16:53:47');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-06 17:37:14');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-06 18:24:59');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 10:38:39');
INSERT INTO `sys_logininfor` VALUES (233, 'xiaoc', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：xiaoc 不存在', '2023-06-07 10:40:16');
INSERT INTO `sys_logininfor` VALUES (234, 'xiaoxiao', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 10:40:33');
INSERT INTO `sys_logininfor` VALUES (235, 'xiaoxiao', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-06-07 11:04:10');
INSERT INTO `sys_logininfor` VALUES (236, 'xixi', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '登录用户：xixi 不存在', '2023-06-07 11:04:17');
INSERT INTO `sys_logininfor` VALUES (237, 'xixixi', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 11:04:23');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 12:56:28');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 13:09:33');
INSERT INTO `sys_logininfor` VALUES (240, 'xixixi', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 15:06:23');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 17:36:46');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 18:47:34');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-07 20:39:41');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-08 15:52:56');
INSERT INTO `sys_logininfor` VALUES (245, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-10 14:38:10');
INSERT INTO `sys_logininfor` VALUES (246, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-10 15:11:40');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-10 16:09:40');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-11 15:53:34');
INSERT INTO `sys_logininfor` VALUES (249, 'xixixi', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-11 16:09:25');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-11 17:22:44');
INSERT INTO `sys_logininfor` VALUES (251, 'xixixi', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-11 17:23:29');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-18 16:05:10');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-18 16:58:05');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-18 18:37:49');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-18 19:40:22');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 17:02:02');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 18:34:49');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 20:06:41');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-19 21:20:18');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-06-20 16:39:30');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
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
) ENGINE = InnoDB AUTO_INCREMENT = 2029 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2023-05-07 10:41:24', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2023-05-07 10:41:24', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-21 14:51:42', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2023-05-07 10:41:24', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2023-05-07 10:41:24', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2023-05-07 10:41:24', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2023-05-07 10:41:24', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2023-05-07 10:41:24', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2023-05-07 10:41:24', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2023-05-07 10:41:24', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2023-05-07 10:41:24', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2023-05-07 10:41:24', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2023-05-07 10:41:24', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2023-05-07 10:41:24', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2023-05-07 10:41:24', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2023-05-07 10:41:24', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2023-05-07 10:41:24', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2023-05-07 10:41:24', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2023-05-07 10:41:24', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2023-05-07 10:41:24', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2023-05-07 10:41:24', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2023-05-07 10:41:24', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2023-05-07 10:41:24', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, 'echarts', 0, 4, 'echarts', 'echarts/index', NULL, 1, 0, 'C', '0', '1', '', 'chart', 'admin', '2023-05-07 10:48:00', 'admin', '2023-06-19 20:19:38', '');
INSERT INTO `sys_menu` VALUES (2001, '通知管理', 0, 5, 'inform', '', NULL, 1, 0, 'M', '0', '0', '', 'cascader', 'admin', '2023-05-17 14:15:40', 'admin', '2023-05-17 14:21:26', '');
INSERT INTO `sys_menu` VALUES (2002, '通知', 2001, 1, 'inform', 'inform/inform/index', NULL, 1, 0, 'C', '0', '0', '', 'chart', 'admin', '2023-05-17 14:20:54', 'admin', '2023-05-17 14:22:04', '');
INSERT INTO `sys_menu` VALUES (2008, '新增', 2002, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'inform:inform:add', '#', 'admin', '2023-06-07 11:21:22', 'admin', '2023-06-07 11:27:24', '');
INSERT INTO `sys_menu` VALUES (2009, '修改', 2002, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'inform:inform:edit', '#', 'admin', '2023-06-07 11:29:58', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '删除', 2002, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'inform:inform:remove', '#', 'admin', '2023-06-07 11:30:16', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '导出', 2002, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'inform:inform:export', '#', 'admin', '2023-06-07 11:30:37', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '满意度评价', 0, 9, 'satisfaction', NULL, NULL, 1, 0, 'M', '0', '0', '', 'chart', 'admin', '2023-06-07 13:24:15', 'admin', '2023-06-10 16:32:47', '');
INSERT INTO `sys_menu` VALUES (2013, '满意度调查', 2012, 1, 'survey', 'satisfaction/survey/index', NULL, 1, 0, 'C', '0', '0', NULL, 'build', 'admin', '2023-06-07 13:26:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2014, '新增', 2013, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'satisfaction:survey:add', '#', 'admin', '2023-06-07 15:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '修改', 2013, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'satisfaction:survey:edit', '#', 'admin', '2023-06-07 15:08:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '删除', 2013, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'satisfaction:survey:remove', '#', 'admin', '2023-06-07 15:09:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '导出', 2013, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'satisfaction:survey:export', '#', 'admin', '2023-06-07 15:09:28', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '满意度可视化', 2012, 2, 'echartssurvey', 'satisfaction/echartssurvey/index', NULL, 1, 0, 'C', '0', '0', NULL, 'chart', 'admin', '2023-06-07 15:26:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '施工队管理', 0, 7, 'crew', NULL, NULL, 1, 0, 'M', '0', '0', '', 'component', 'admin', '2023-06-10 16:11:32', 'admin', '2023-06-10 16:32:39', '');
INSERT INTO `sys_menu` VALUES (2020, '施工队信息', 2019, 1, 'crew', 'crew/crew/index', NULL, 1, 0, 'C', '0', '0', NULL, 'clipboard', 'admin', '2023-06-10 16:12:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '项目管理', 2019, 2, 'project', 'crew/project/index', NULL, 1, 0, 'C', '0', '1', '', 'job', 'admin', '2023-06-10 16:13:09', 'admin', '2023-06-19 20:19:13', '');
INSERT INTO `sys_menu` VALUES (2022, '员工管理', 0, 8, 'worker', NULL, NULL, 1, 0, 'M', '0', '0', '', 'education', 'admin', '2023-06-10 16:13:40', 'admin', '2023-06-19 21:20:46', '');
INSERT INTO `sys_menu` VALUES (2023, '员工信息', 2022, 1, 'worker', 'worker/worker/index', NULL, 1, 0, 'C', '0', '0', '', 'people', 'admin', '2023-06-10 16:14:46', 'admin', '2023-06-19 21:21:17', '');
INSERT INTO `sys_menu` VALUES (2024, '查看通知', 2001, 2, 'informlk', 'inform/informlk/index', NULL, 1, 0, 'C', '0', '0', '', 'dashboard', 'admin', '2023-06-10 16:26:57', 'admin', '2023-06-10 16:31:21', '');
INSERT INTO `sys_menu` VALUES (2025, '培训资料', 0, 6, 'train', NULL, NULL, 1, 0, 'M', '0', '0', '', 'drag', 'admin', '2023-06-10 16:28:00', 'admin', '2023-06-10 16:32:34', '');
INSERT INTO `sys_menu` VALUES (2026, '资料发布', 2025, 1, 'train', 'train/video/index', NULL, 1, 0, 'C', '0', '0', '', 'component', 'admin', '2023-06-10 16:28:31', 'admin', '2023-06-19 20:22:10', '');
INSERT INTO `sys_menu` VALUES (2029, '项目管理', 0, 10, 'project', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'monitor', 'admin', '2023-06-19 20:14:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '项目信息', 2029, 1, 'project', 'project/project/index', NULL, 1, 0, 'C', '0', '0', '', 'clipboard', 'admin', '2023-06-19 20:16:33', 'admin', '2023-06-19 20:18:42', '');
INSERT INTO `sys_menu` VALUES (2031, '技能学习', 2025, 2, 'watch', 'train/video/watch', NULL, 1, 0, 'C', '0', '0', '', 'component', 'admin', '2023-06-19 20:22:55', 'admin', '2023-06-19 20:28:30', '');
INSERT INTO `sys_menu` VALUES (2032, '工种信息', 2022, 2, 'type', 'worker/type/index', NULL, 1, 0, 'C', '0', '0', NULL, 'list', 'admin', '2023-06-19 21:22:00', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2023-05-07 10:41:24', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2023-05-07 10:41:24', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (10, '123', '1', 0x3C703E3132333C2F703E, '0', 'admin', '2023-05-14 10:06:41', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (11, '123', '1', 0x3C703E3132333C2F703E, '0', 'admin', '2023-05-16 19:26:39', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (12, '123123', '1', 0x3C703E3C696D67207372633D222F6465762D6170692F70726F66696C652F75706C6F61642F323032332F30352F31372F5151E59BBEE7898732303231313030333137333230365F3230323330353137313134383534413030312E6A7067223E3C2F703E, '0', 'admin', '2023-05-17 11:48:58', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (13, '111', '1', 0x3C703E3C696D67207372633D222F6465762D6170692F70726F66696C652F75706C6F61642F323032332F30352F31372F757365725F74656D706C6174655F313638343234333331393936325F3230323330353137313135303135413030322E786C7378223E3C2F703E, '0', 'admin', '2023-05-17 11:50:24', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (14, '1', '1', 0x3C703E313C2F703E, '0', 'admin', '2023-05-17 11:56:35', '', NULL, NULL);
INSERT INTO `sys_notice` VALUES (15, '111111', '1', 0x3C703E31313131313C2F703E, '0', 'admin', '2023-05-17 12:54:29', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 396 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"echarts\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"echarts\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-07 10:48:00', 21);
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"echarts/index\",\"createTime\":\"2023-05-07 10:48:00\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"echarts\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"echarts\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-07 11:12:57', 15);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"echarts/index.html\",\"createTime\":\"2023-05-07 10:48:00\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"echarts\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"echarts\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-07 15:20:54', 30);
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"echarts/index\",\"createTime\":\"2023-05-07 10:48:00\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"echarts\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"echarts\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-07 15:21:24', 14);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_assets_total\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-10 11:38:03', 127);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"total\",\"className\":\"AssetsTotal\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-05-10 11:38:03\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TotalAssets\",\"columnComment\":\"总产值\",\"columnId\":2,\"columnName\":\"total_assets\",\"columnType\":\"decimal(15,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-10 11:38:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"totalAssets\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TotalInvestment\",\"columnComment\":\"总投资\",\"columnId\":3,\"columnName\":\"total_investment\",\"columnType\":\"decimal(15,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-10 11:38:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"totalInvestment\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"TotalNetProfit\",\"columnComment\":\"总净利\",\"columnId\":4,\"columnName\":\"total_net_profit\",\"columnType\":\"decimal(15,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-10 11:38:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"totalNetProfit\",\"javaTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-10 11:38:56', 35);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_assets_total\"}', NULL, 0, NULL, '2023-05-10 11:39:14', 29);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"total\",\"className\":\"AssetsTotal\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int unsigned\",\"createBy\":\"admin\",\"createTime\":\"2023-05-10 11:38:03\",\"dictType\":\"\",\"edit\":false,\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"String\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-05-10 11:38:55\",\"usableColumn\":false},{\"capJavaField\":\"TotalAssets\",\"columnComment\":\"总产值\",\"columnId\":2,\"columnName\":\"total_assets\",\"columnType\":\"decimal(15,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-10 11:38:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"totalAssets\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-05-10 11:38:55\",\"usableColumn\":false},{\"capJavaField\":\"TotalInvestment\",\"columnComment\":\"总投资\",\"columnId\":3,\"columnName\":\"total_investment\",\"columnType\":\"decimal(15,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-10 11:38:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"totalInvestment\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2023-05-10 11:38:55\",\"usableColumn\":false},{\"capJavaField\":\"TotalNetProfit\",\"columnComment\":\"总净利\",\"columnId\":4,\"columnName\":\"total_net_profit\",\"columnType\":\"decimal(15,2)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-10 11:38:03\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-10 11:39:54', 29);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_assets_total\"}', NULL, 0, NULL, '2023-05-10 11:39:56', 29);
INSERT INTO `sys_oper_log` VALUES (109, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-05-07 10:41:24\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 09:52:34', 46);
INSERT INTO `sys_oper_log` VALUES (110, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 10:05:25', 90);
INSERT INTO `sys_oper_log` VALUES (111, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>123</p>\",\"noticeTitle\":\"123\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 10:06:41', 9);
INSERT INTO `sys_oper_log` VALUES (112, '参数管理', 2, 'com.ruoyi.web.controller.system.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/system/config', '127.0.0.1', '内网IP', '{\"configId\":5,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2023-05-07 10:41:24\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 11:25:22', 24);
INSERT INTO `sys_oper_log` VALUES (113, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"陵城区住建部\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 11:32:07', 12);
INSERT INTO `sys_oper_log` VALUES (114, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"xx公司\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"陵城区住建部\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 11:32:31', 26);
INSERT INTO `sys_oper_log` VALUES (115, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"xx公司\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"陵城区住建部\",\"phone\":\"15888888888\",\"status\":\"0\"}', '{\"msg\":\"修改部门\'xx公司\'失败，部门名称已存在\",\"code\":500}', 0, NULL, '2023-05-14 11:32:39', 2);
INSERT INTO `sys_oper_log` VALUES (116, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":102,\"deptName\":\"xxx公司\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":100,\"parentName\":\"陵城区住建部\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 11:32:42', 22);
INSERT INTO `sys_oper_log` VALUES (117, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"工地一\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"xx公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 11:33:01', 15);
INSERT INTO `sys_oper_log` VALUES (118, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":104,\"deptName\":\"工地二\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":101,\"parentName\":\"xx公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 11:33:14', 16);
INSERT INTO `sys_oper_log` VALUES (119, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"工地三\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"parentName\":\"xx公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 11:33:24', 15);
INSERT INTO `sys_oper_log` VALUES (120, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"工地四\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"parentName\":\"xx公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 11:33:30', 18);
INSERT INTO `sys_oper_log` VALUES (121, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":107,\"deptName\":\"工地五\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":5,\"params\":{},\"parentId\":101,\"parentName\":\"xx公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 11:33:41', 17);
INSERT INTO `sys_oper_log` VALUES (122, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":108,\"deptName\":\"工地一\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":102,\"parentName\":\"xxx公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 11:33:46', 20);
INSERT INTO `sys_oper_log` VALUES (123, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,102\",\"children\":[],\"deptId\":109,\"deptName\":\"工地二\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":2,\"params\":{},\"parentId\":102,\"parentName\":\"xxx公司\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-14 11:33:51', 17);
INSERT INTO `sys_oper_log` VALUES (124, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000],\"params\":{},\"roleKey\":\"common\",\"roleName\":\"xiaoc\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"新增角色\'xiaoc\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2023-05-14 11:35:35', 8);
INSERT INTO `sys_oper_log` VALUES (125, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2000],\"params\":{},\"roleKey\":\"common\",\"roleName\":\"xiaoc\",\"roleSort\":3,\"status\":\"0\"}', '{\"msg\":\"新增角色\'xiaoc\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2023-05-14 11:57:19', 9);
INSERT INTO `sys_oper_log` VALUES (126, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 xixixi 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_user.PRIMARY\'\r\n### The error may exist in file [D:\\SourceCode\\smart_site\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,       dept_id,       user_name,       nick_name,       email,             phonenumber,       sex,       password,       status,       create_by,            create_time    )values(      ?,       ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_user.PRIMARY\'\n; Duplicate entry \'1\' for key \'sys_user.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_user.PRIMARY\'', '2023-05-16 15:53:21', 388);
INSERT INTO `sys_oper_log` VALUES (127, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 xixixi 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_user.PRIMARY\'\r\n### The error may exist in file [D:\\SourceCode\\smart_site\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,       dept_id,       user_name,       nick_name,       email,             phonenumber,             password,             create_by,            create_time    )values(      ?,       ?,       ?,       ?,       ?,             ?,             ?,             ?,            sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_user.PRIMARY\'\n; Duplicate entry \'1\' for key \'sys_user.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1\' for key \'sys_user.PRIMARY\'', '2023-05-16 15:53:53', 112);
INSERT INTO `sys_oper_log` VALUES (128, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 1 条，数据如下：<br/>1、账号 xixixi 导入成功\",\"code\":200}', 0, NULL, '2023-05-16 15:54:26', 122);
INSERT INTO `sys_oper_log` VALUES (129, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 xiaoxiao 导入失败：email: 邮箱格式不正确', '2023-05-16 15:56:43', 36);
INSERT INTO `sys_oper_log` VALUES (130, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 xixixi 更新成功<br/>2、账号 xiaoxiao 导入成功\",\"code\":200}', 0, NULL, '2023-05-16 15:57:05', 141);
INSERT INTO `sys_oper_log` VALUES (131, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 xixixi 更新成功<br/>2、账号 xiaoxiao 更新成功\",\"code\":200}', 0, NULL, '2023-05-16 16:01:01', 46);
INSERT INTO `sys_oper_log` VALUES (132, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"sys_user\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 16:47:43', 116);
INSERT INTO `sys_oper_log` VALUES (133, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>123</p>\",\"noticeTitle\":\"123\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 19:26:39', 7);
INSERT INTO `sys_oper_log` VALUES (134, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-05-07 10:41:24\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,1035,2000],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 19:28:11', 23);
INSERT INTO `sys_oper_log` VALUES (135, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-05-07 10:41:24\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,1035,1036,1037,1038,2000],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 19:28:36', 18);
INSERT INTO `sys_oper_log` VALUES (136, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-05-07 10:41:24\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,1035,2000],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 19:28:49', 17);
INSERT INTO `sys_oper_log` VALUES (137, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2023-05-07 10:41:24\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"工地一\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@163.com\",\"idNumber\":\"370811200210286012\",\"loginDate\":\"2023-05-16 20:28:10\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 20:34:38', 38);
INSERT INTO `sys_oper_log` VALUES (138, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2023-05-07 10:41:24\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"工地一\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@163.com\",\"idNumber\":\"370811200210286012\",\"loginDate\":\"2023-05-16 20:28:10\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 20:34:54', 21);
INSERT INTO `sys_oper_log` VALUES (139, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/system/user/profile', '127.0.0.1', '内网IP', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2023-05-07 10:41:24\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"工地一\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@163.com\",\"idNumber\":\"370811200210286013\",\"loginDate\":\"2023-05-16 20:28:10\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-16 21:05:34', 37);
INSERT INTO `sys_oper_log` VALUES (140, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', NULL, '/system/user/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-05-16 21:21:43', 905);
INSERT INTO `sys_oper_log` VALUES (141, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 xixixi 更新成功<br/>2、账号 xiaoxiao 更新成功\",\"code\":200}', 0, NULL, '2023-05-16 21:23:15', 258);
INSERT INTO `sys_oper_log` VALUES (142, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 xixixi 更新成功<br/>2、账号 xiaoxiao 更新成功\",\"code\":200}', 0, NULL, '2023-05-16 21:23:30', 48);
INSERT INTO `sys_oper_log` VALUES (143, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p><img src=\\\"/dev-api/profile/upload/2023/05/17/QQ图片20211003173206_20230517114854A001.jpg\\\"></p>\",\"noticeTitle\":\"123123\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 11:48:58', 12);
INSERT INTO `sys_oper_log` VALUES (144, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p><img src=\\\"/dev-api/profile/upload/2023/05/17/user_template_1684243319962_20230517115015A002.xlsx\\\"></p>\",\"noticeTitle\":\"111\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 11:50:24', 16);
INSERT INTO `sys_oper_log` VALUES (145, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>1</p>\",\"noticeTitle\":\"1\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 11:56:35', 9);
INSERT INTO `sys_oper_log` VALUES (146, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2023/05/17/blob_20230517125046A003.png\",\"code\":200}', 0, NULL, '2023-05-17 12:50:46', 13);
INSERT INTO `sys_oper_log` VALUES (147, '通知公告', 1, 'com.ruoyi.web.controller.system.SysNoticeController.add()', 'POST', 1, 'admin', NULL, '/system/notice', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"noticeContent\":\"<p>11111</p>\",\"noticeTitle\":\"111111\",\"noticeType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 12:54:29', 8);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_inform\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 13:53:27', 85);
INSERT INTO `sys_oper_log` VALUES (149, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inform\",\"className\":\"Inform\",\"columns\":[{\"capJavaField\":\"InformId\",\"columnComment\":\"通知id\",\"columnId\":27,\"columnName\":\"inform_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"informId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InformTitle\",\"columnComment\":\"通知标题\",\"columnId\":28,\"columnName\":\"inform_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"informTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InformType\",\"columnComment\":\"通知类型\",\"columnId\":29,\"columnName\":\"inform_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"informType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"通知状态\",\"columnId\":30,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"radio\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"status\",\"java', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 13:54:17', 43);
INSERT INTO `sys_oper_log` VALUES (150, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_inform', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:01:20', 46);
INSERT INTO `sys_oper_log` VALUES (151, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inform\",\"className\":\"Inform\",\"columns\":[{\"capJavaField\":\"InformId\",\"columnComment\":\"通知id\",\"columnId\":27,\"columnName\":\"inform_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"informId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 14:01:20\",\"usableColumn\":false},{\"capJavaField\":\"InformTitle\",\"columnComment\":\"通知标题\",\"columnId\":28,\"columnName\":\"inform_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"informTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 14:01:20\",\"usableColumn\":false},{\"capJavaField\":\"InformType\",\"columnComment\":\"通知类型\",\"columnId\":29,\"columnName\":\"inform_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"sys_notice_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"informType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 14:01:20\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"通知状态\",\"columnId\":30,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"sys_notice_status\",\"edit\":true,\"htmlType\":\"radio\",\"inc', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:03:22', 35);
INSERT INTO `sys_oper_log` VALUES (152, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inform\",\"className\":\"Inform\",\"columns\":[{\"capJavaField\":\"InformId\",\"columnComment\":\"通知id\",\"columnId\":27,\"columnName\":\"inform_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"informId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 14:03:22\",\"usableColumn\":false},{\"capJavaField\":\"InformTitle\",\"columnComment\":\"通知标题\",\"columnId\":28,\"columnName\":\"inform_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"informTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 14:03:22\",\"usableColumn\":false},{\"capJavaField\":\"InformType\",\"columnComment\":\"通知类型\",\"columnId\":29,\"columnName\":\"inform_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"sys_notice_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"informType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 14:03:22\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"通知状态\",\"columnId\":30,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"sys_notice_status\",\"edit\":true,\"htmlType\":\"radio\",\"inc', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:03:49', 37);
INSERT INTO `sys_oper_log` VALUES (153, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_inform\"}', NULL, 0, NULL, '2023-05-17 14:03:50', 26);
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通知管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"inform\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:15:40', 29);
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inform/idnex\",\"createTime\":\"2023-05-17 14:15:40\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"通知管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"inform\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:16:08', 15);
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inform/inform/idnex\",\"createTime\":\"2023-05-17 14:15:40\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"通知管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"inform\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:16:44', 11);
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inform/idnex\",\"createTime\":\"2023-05-17 14:15:40\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"通知管理\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"inform\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:18:05', 10);
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inform/idnex\",\"createTime\":\"2023-05-17 14:15:40\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"通知管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"inform\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:20:17', 10);
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inform/index\",\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通知\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"inform\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:20:54', 9);
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"\",\"createTime\":\"2023-05-17 14:15:40\",\"icon\":\"cascader\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"通知管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"inform\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:21:26', 10);
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inform/inform/index\",\"createTime\":\"2023-05-17 14:20:54\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"通知\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"inform\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:22:04', 11);
INSERT INTO `sys_oper_log` VALUES (162, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"<p>123</p>\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:26:26', 23);
INSERT INTO `sys_oper_log` VALUES (163, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"<p>123</p>\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateTime\":\"2023-05-17 14:30:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:30:11', 9);
INSERT INTO `sys_oper_log` VALUES (164, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"<h1>123</h1>\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateTime\":\"2023-05-17 14:31:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:31:15', 6);
INSERT INTO `sys_oper_log` VALUES (165, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"<p>123</p>\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateTime\":\"2023-05-17 14:31:21\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:31:21', 8);
INSERT INTO `sys_oper_log` VALUES (166, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"<pre class=\\\"ql-syntax ql-indent-1\\\" spellcheck=\\\"false\\\">123\\n</pre>\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateTime\":\"2023-05-17 14:31:37\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:31:37', 6);
INSERT INTO `sys_oper_log` VALUES (167, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"<p>1111</p>\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateTime\":\"2023-05-17 14:31:51\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 14:31:51', 7);
INSERT INTO `sys_oper_log` VALUES (168, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"<p>1111</p>\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 16:02:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:02:35', 23);
INSERT INTO `sys_oper_log` VALUES (169, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-17 16:03:48\",\"informContent\":\"<p>123123</p>\",\"informId\":2,\"informTitle\":\"123123\",\"informType\":\"2\",\"infromFile\":\"/profile/upload/2023/05/17/2.入党申请人谈话记录(1)(2)_20230517160345A001.doc\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:03:48', 37);
INSERT INTO `sys_oper_log` VALUES (170, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-17 16:03:48\",\"informContent\":\"<p>123123</p><p>123</p>\",\"informId\":2,\"informTitle\":\"123123\",\"informType\":\"2\",\"infromFile\":\"/profile/upload/2023/05/17/2.入党申请人谈话记录(1)(2)_20230517160345A001.doc\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 16:06:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:06:38', 14);
INSERT INTO `sys_oper_log` VALUES (171, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-17 16:03:48\",\"informContent\":\"<p>123123</p><p>123</p>\",\"informId\":2,\"informTitle\":\"123123\",\"informType\":\"2\",\"infromFile\":\"/profile/upload/2023/05/17/2.入党申请人谈话记录(1)(2)_20230517160345A001.doc\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 16:07:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:07:25', 12);
INSERT INTO `sys_oper_log` VALUES (172, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-17 16:10:44\",\"informContent\":\"<p>12</p>\",\"informId\":3,\"informTitle\":\"12\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/4.德州学院推荐优秀团员作为入党积极分子登记表_20230517160955A001.doc\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:12:07', 128594);
INSERT INTO `sys_oper_log` VALUES (173, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-17 16:15:01\",\"informId\":4,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/积极分子统计表_20230517161500A001.xls\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:15:01', 26);
INSERT INTO `sys_oper_log` VALUES (174, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-17 16:15:01\",\"informContent\":\"<p>1</p>\",\"informId\":4,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/积极分子统计表_20230517161500A001.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 16:15:09\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:15:09', 15);
INSERT INTO `sys_oper_log` VALUES (175, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_inform', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:20:42', 90);
INSERT INTO `sys_oper_log` VALUES (176, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inform\",\"className\":\"Inform\",\"columns\":[{\"capJavaField\":\"InformId\",\"columnComment\":\"通知id\",\"columnId\":27,\"columnName\":\"inform_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"informId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 16:20:42\",\"usableColumn\":false},{\"capJavaField\":\"InformTitle\",\"columnComment\":\"通知标题\",\"columnId\":28,\"columnName\":\"inform_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"informTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 16:20:42\",\"usableColumn\":false},{\"capJavaField\":\"InformType\",\"columnComment\":\"通知类型\",\"columnId\":29,\"columnName\":\"inform_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"sys_notice_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"informType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 16:20:42\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"通知状态\",\"columnId\":30,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"sys_notice_status\",\"edit\":true,\"htmlType\":\"radio\",\"inc', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:22:36', 48);
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inform\",\"className\":\"Inform\",\"columns\":[{\"capJavaField\":\"InformId\",\"columnComment\":\"通知id\",\"columnId\":27,\"columnName\":\"inform_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"informId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 16:22:36\",\"usableColumn\":false},{\"capJavaField\":\"InformTitle\",\"columnComment\":\"通知标题\",\"columnId\":28,\"columnName\":\"inform_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"informTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 16:22:36\",\"usableColumn\":false},{\"capJavaField\":\"InformType\",\"columnComment\":\"通知类型\",\"columnId\":29,\"columnName\":\"inform_type\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"sys_notice_type\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"informType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":3,\"updateBy\":\"\",\"updateTime\":\"2023-05-17 16:22:36\",\"usableColumn\":false},{\"capJavaField\":\"Status\",\"columnComment\":\"通知状态\",\"columnId\":30,\"columnName\":\"status\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-17 13:53:27\",\"dictType\":\"sys_notice_status\",\"edit\":true,\"htmlType\":\"radio\",\"inc', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:23:25', 49);
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_inform\"}', NULL, 0, NULL, '2023-05-17 16:23:32', 146);
INSERT INTO `sys_oper_log` VALUES (179, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"1111\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 16:24:43\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:24:43', 27);
INSERT INTO `sys_oper_log` VALUES (180, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"1111\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 16:24:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:24:49', 12);
INSERT INTO `sys_oper_log` VALUES (181, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"1111\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 16:25:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:25:06', 10);
INSERT INTO `sys_oper_log` VALUES (182, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"1111\",\"informContentStyle\":\"<p>123</p>\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 16:30:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:30:48', 23);
INSERT INTO `sys_oper_log` VALUES (183, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-17 16:15:01\",\"informContent\":\"<p>123</p>\",\"informId\":4,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/积极分子统计表_20230517161500A001.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 16:44:46\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:44:46', 25);
INSERT INTO `sys_oper_log` VALUES (184, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-17 16:10:44\",\"informContent\":\"<p>12</p><p>123</p><p>123</p><p>123</p>\",\"informId\":3,\"informTitle\":\"12\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/4.德州学院推荐优秀团员作为入党积极分子登记表_20230517160955A001.doc\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 16:46:44\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:46:44', 14);
INSERT INTO `sys_oper_log` VALUES (185, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"<h2>1111</h2>\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-17 16:47:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 16:47:25', 10);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 19:17:53', 23);
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-05-07 10:41:24\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 19:18:07', 33);
INSERT INTO `sys_oper_log` VALUES (188, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-05-07 10:41:24\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,107,1035,2000,2001,2002],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 19:36:47', 41);
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inform/inform/index\",\"createTime\":\"2023-05-17 14:20:54\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"通知\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"inform\",\"perms\":\"edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"修改菜单\'通知\'失败，上级菜单不能选择自己\",\"code\":500}', 0, NULL, '2023-05-17 19:39:36', 4);
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inform/inform/index\",\"createTime\":\"2023-05-17 14:20:54\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"inform\",\"perms\":\"edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"修改菜单\'修改\'失败，上级菜单不能选择自己\",\"code\":500}', 0, NULL, '2023-05-17 19:39:47', 3);
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 19:40:09', 11);
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-05-17 19:40:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"\",\"perms\":\"inform.inform.edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 19:40:44', 10);
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-05-17 19:40:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"\",\"perms\":\"inform:inform:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 19:40:53', 8);
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2003', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 19:41:21', 12);
INSERT INTO `sys_oper_log` VALUES (195, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-05-07 10:41:24\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 19:41:41', 9);
INSERT INTO `sys_oper_log` VALUES (196, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"通知修改\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"inform:inform:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 19:44:23', 8);
INSERT INTO `sys_oper_log` VALUES (197, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2004', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 19:47:02', 16);
INSERT INTO `sys_oper_log` VALUES (198, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-05-07 10:41:24\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-17 20:25:34', 20);
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-05-07 10:41:24\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-21 14:51:42', 18);
INSERT INTO `sys_oper_log` VALUES (200, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-21 14:54:09\",\"informContent\":\"<p>123</p>\",\"informId\":5,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/21/2.入党申请人谈话记录(1)(2)_20230521145407A001.doc\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-21 14:54:09', 15);
INSERT INTO `sys_oper_log` VALUES (201, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 11:38:59\",\"informContent\":\"<p><img src=\\\"/dev-api/profile/upload/2023/05/27/QQ图片20211003173230_20230527113816A001.jpg\\\"></p>\",\"informId\":6,\"informTitle\":\"3wer\",\"informType\":\"2\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527113850A002.doc\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 11:38:59', 19);
INSERT INTO `sys_oper_log` VALUES (202, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"<h2>1111</h2>\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-27 13:05:06\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 13:05:06', 24);
INSERT INTO `sys_oper_log` VALUES (203, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createTime\":\"2023-05-17 14:26:26\",\"informContent\":\"<h2>1111</h2>\",\"informId\":1,\"informTitle\":\"123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/17/21计外一班-德州学院疫情防控志愿者队伍名单_20230517142621A001.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-27 13:16:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 13:16:39', 26);
INSERT INTO `sys_oper_log` VALUES (204, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 13:55:41\",\"informContent\":\"<p>1</p>\",\"informId\":7,\"informTitle\":\"1\",\"informType\":\"1\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 13:55:41', 36);
INSERT INTO `sys_oper_log` VALUES (205, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 13:57:02\",\"informContent\":\"<p>1</p>\",\"informId\":8,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527135700A001.doc\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 13:57:02', 25);
INSERT INTO `sys_oper_log` VALUES (206, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"informContent\":\"<p>1</p>\",\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527141223A001.doc\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'com.ruoyi.inform.domain.UserInformStatus Not Found TableInfoCache.', '2023-05-27 14:12:25', 37);
INSERT INTO `sys_oper_log` VALUES (207, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"informContent\":\"<p>1</p>\",\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527141223A001.doc\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'com.ruoyi.inform.domain.UserInformStatus Not Found TableInfoCache.', '2023-05-27 14:12:47', 11);
INSERT INTO `sys_oper_log` VALUES (208, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"informContent\":\"<p><br></p>\",\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527141223A001.doc\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'com.ruoyi.inform.domain.UserInformStatus Not Found TableInfoCache.', '2023-05-27 14:12:51', 14);
INSERT INTO `sys_oper_log` VALUES (209, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"informContent\":\"<p><br></p>\",\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527141223A001.doc\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'com.ruoyi.inform.domain.UserInformStatus Not Found TableInfoCache.', '2023-05-27 14:13:00', 12);
INSERT INTO `sys_oper_log` VALUES (210, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"informContent\":\"<p><br></p>\",\"informTitle\":\"1\",\"informType\":\"2\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527141427A001.doc\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'com.ruoyi.inform.domain.UserInformStatus Not Found TableInfoCache.', '2023-05-27 14:14:31', 40);
INSERT INTO `sys_oper_log` VALUES (211, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"informContent\":\"<p>1</p>\",\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527141534A001.doc\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'com.ruoyi.inform.domain.UserInformStatus Not Found TableInfoCache.', '2023-05-27 14:15:36', 45);
INSERT INTO `sys_oper_log` VALUES (212, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"informContent\":\"<p>1</p>\",\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527142013A001.doc\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'com.ruoyi.inform.domain.UserInformStatus Not Found TableInfoCache.', '2023-05-27 14:20:14', 37);
INSERT INTO `sys_oper_log` VALUES (213, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"informContent\":\"<p>1</p>\",\"informTitle\":\"q\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527142312A001.doc\",\"params\":{},\"status\":\"0\"}', NULL, 1, 'com.ruoyi.inform.domain.UserInformStatus Not Found TableInfoCache.', '2023-05-27 14:23:13', 46);
INSERT INTO `sys_oper_log` VALUES (214, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_user_inform_status\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 14:24:06', 83);
INSERT INTO `sys_oper_log` VALUES (215, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 14:24:11', 17);
INSERT INTO `sys_oper_log` VALUES (216, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_user_inform_status\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 14:24:35', 53);
INSERT INTO `sys_oper_log` VALUES (217, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"status\",\"className\":\"UserInformStatus\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":48,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-27 14:24:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InformId\",\"columnComment\":\"通知id\",\"columnId\":49,\"columnName\":\"inform_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-27 14:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"informId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"InformTitle\",\"columnComment\":\"通知标题\",\"columnId\":50,\"columnName\":\"inform_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-27 14:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"informTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":51,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-27 14:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"userId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 14:25:05', 45);
INSERT INTO `sys_oper_log` VALUES (218, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"inform\",\"className\":\"UserInformStatus\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键id\",\"columnId\":48,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-27 14:24:35\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-05-27 14:25:05\",\"usableColumn\":false},{\"capJavaField\":\"InformId\",\"columnComment\":\"通知id\",\"columnId\":49,\"columnName\":\"inform_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-27 14:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"informId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-05-27 14:25:05\",\"usableColumn\":false},{\"capJavaField\":\"InformTitle\",\"columnComment\":\"通知标题\",\"columnId\":50,\"columnName\":\"inform_title\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-05-27 14:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"informTitle\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2023-05-27 14:25:05\",\"usableColumn\":false},{\"capJavaField\":\"UserId\",\"columnComment\":\"用户id\",\"columnId\":51,\"columnName\":\"user_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-05-27 14:24:35\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 14:25:26', 36);
INSERT INTO `sys_oper_log` VALUES (219, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_user_inform_status\"}', NULL, 0, NULL, '2023-05-27 14:25:28', 36);
INSERT INTO `sys_oper_log` VALUES (220, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 14:29:27\",\"informContent\":\"<p>1</p>\",\"informId\":9,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527142926A001.doc\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 14:29:27', 56);
INSERT INTO `sys_oper_log` VALUES (221, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 14:31:15\",\"informContent\":\"<p>1</p>\",\"informId\":10,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527143114A001.doc\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 14:31:15', 62);
INSERT INTO `sys_oper_log` VALUES (222, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 16:20:38\",\"informContent\":\"<p>1</p>\",\"informId\":11,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527162037A001.doc\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 16:20:38', 43);
INSERT INTO `sys_oper_log` VALUES (223, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 16:24:58\",\"informContent\":\"<p>1</p>\",\"informId\":12,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527162456A001.doc\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 16:24:58', 56);
INSERT INTO `sys_oper_log` VALUES (224, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 16:34:56\",\"informContent\":\"<p>1</p>\",\"informId\":13,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527163433A001.doc\",\"params\":{},\"status\":\"0\"} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 16:34:56', 72);
INSERT INTO `sys_oper_log` VALUES (225, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 16:39:19\",\"informId\":14,\"informTitle\":\"1\",\"informType\":\"2\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527163917A001.doc\",\"params\":{},\"status\":\"0\"} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 16:39:19', 82);
INSERT INTO `sys_oper_log` VALUES (226, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 16:40:39\",\"informId\":15,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527164037A001.doc\",\"params\":{}} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 16:40:39', 71);
INSERT INTO `sys_oper_log` VALUES (227, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 16:42:48\",\"informContent\":\"<p>111</p>\",\"informId\":16,\"informTitle\":\"111\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527164246A001.doc\",\"params\":{},\"status\":\"0\"} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 16:42:48', 73);
INSERT INTO `sys_oper_log` VALUES (228, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 16:44:20\",\"informContent\":\"<p>1</p>\",\"informId\":17,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527164419A001.doc\",\"params\":{},\"status\":\"0\"} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-27 16:44:20', 70);
INSERT INTO `sys_oper_log` VALUES (229, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-28 11:54:30\",\"informContent\":\"<p>12</p>\",\"informId\":18,\"informTitle\":\"21\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/28/UNIT网站功能API文档-20210621_20230528115427A001.pdf\",\"params\":{},\"status\":\"0\"} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-28 11:54:30', 75);
INSERT INTO `sys_oper_log` VALUES (230, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_inform', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-28 11:55:18', 110);
INSERT INTO `sys_oper_log` VALUES (231, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-28 11:54:30\",\"informContent\":\"<p>12</p>\",\"informId\":18,\"informTitle\":\"21\",\"informType\":\"1\",\"infromFile\":\"\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-05-28 11:55:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-28 11:55:49', 10);
INSERT INTO `sys_oper_log` VALUES (232, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-28 11:56:02\",\"informContent\":\"<p>1212</p>\",\"informId\":19,\"informTitle\":\"12\",\"informType\":\"1\",\"params\":{},\"status\":\"0\"} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-28 11:56:03', 40);
INSERT INTO `sys_oper_log` VALUES (233, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-28 12:00:55\",\"informContent\":\"<p>12</p>\",\"informId\":20,\"informTitle\":\"123\",\"informType\":\"1\",\"params\":{},\"status\":\"0\"} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-05-28 12:00:55', 73);
INSERT INTO `sys_oper_log` VALUES (234, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 16:44:21\",\"informContent\":\"<p><strong>1<span class=\\\"ql-cursor\\\">﻿</span></strong></p>\",\"informId\":17,\"informTitle\":\"1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/05/27/入党申请人谈话记录_20230527164419A001.doc\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-04 15:03:15\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-04 15:03:15', 16);
INSERT INTO `sys_oper_log` VALUES (235, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-06-04 16:26:19\",\"informId\":21,\"informTitle\":\"1231231\",\"informType\":\"1\",\"params\":{},\"status\":\"0\"} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-04 16:26:19', 77);
INSERT INTO `sys_oper_log` VALUES (236, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-06-05 18:18:59\",\"informId\":22,\"informTitle\":\"1212121212\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/06/05/user_template_1684243319962_20230605181858A001.xls\",\"params\":{},\"status\":\"0\"} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 18:19:00', 177);
INSERT INTO `sys_oper_log` VALUES (237, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"0\"}', NULL, 1, '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 xixixi 已存在<br/>2、账号 xiaoxiao 已存在', '2023-06-05 18:49:02', 933);
INSERT INTO `sys_oper_log` VALUES (238, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：<br/>1、账号 xixixi 更新成功<br/>2、账号 xiaoxiao 更新成功<br/>3、账号 xiao1 更新成功\",\"code\":200}', 0, NULL, '2023-06-05 18:49:11', 62);
INSERT INTO `sys_oper_log` VALUES (239, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-05-07 10:41:24\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2002],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 18:52:20', 105);
INSERT INTO `sys_oper_log` VALUES (240, '用户管理', 4, 'com.ruoyi.web.controller.system.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', NULL, '/system/user/authRole', '127.0.0.1', '内网IP', '{\"roleIds\":\"2\",\"userId\":\"4\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 18:52:34', 8);
INSERT INTO `sys_oper_log` VALUES (241, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 16:44:21\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":17,\"informTitle\":\"智慧工地\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/06/05/智慧工地_20230605185651A002.doc\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 18:57:07\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 18:57:07', 19);
INSERT INTO `sys_oper_log` VALUES (242, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-28 11:54:30\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":18,\"informTitle\":\"智慧工地通知2\",\"informType\":\"1\",\"infromFile\":\"\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 18:57:23\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 18:57:23', 8);
INSERT INTO `sys_oper_log` VALUES (243, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-27 16:44:21\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":17,\"informTitle\":\"智慧工地通知1\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/06/05/智慧工地_20230605185651A002.doc\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 18:57:30\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 18:57:30', 12);
INSERT INTO `sys_oper_log` VALUES (244, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-28 11:56:03\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":19,\"informTitle\":\"智慧工地通知3\",\"informType\":\"1\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 18:57:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 18:57:49', 9);
INSERT INTO `sys_oper_log` VALUES (245, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-28 12:00:55\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":20,\"informTitle\":\"智慧工地通知4\",\"informType\":\"1\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 18:58:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 18:58:00', 15);
INSERT INTO `sys_oper_log` VALUES (246, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-06-04 16:26:20\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":21,\"informTitle\":\"智慧工地通知5\",\"informType\":\"1\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 18:58:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 18:58:10', 9);
INSERT INTO `sys_oper_log` VALUES (247, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-06-05 18:19:00\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":22,\"informTitle\":\"智慧工地通知6\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/06/05/智慧工地人员名单_20230605185855A003.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 18:58:56\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 18:58:57', 13);
INSERT INTO `sys_oper_log` VALUES (248, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-28 12:00:55\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":20,\"informTitle\":\"智慧工地通知4\",\"informType\":\"2\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 19:00:40\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 19:00:40', 14);
INSERT INTO `sys_oper_log` VALUES (249, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-28 11:56:03\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":19,\"informTitle\":\"智慧工地通知3\",\"informType\":\"2\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 19:00:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 19:00:45', 8);
INSERT INTO `sys_oper_log` VALUES (250, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-05-28 11:54:30\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":18,\"informTitle\":\"智慧工地通知2\",\"informType\":\"2\",\"infromFile\":\"\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 19:00:49\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 19:00:49', 8);
INSERT INTO `sys_oper_log` VALUES (251, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-06-04 16:26:20\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":21,\"informTitle\":\"智慧工地通知5\",\"informType\":\"2\",\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 19:00:54\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 19:00:54', 10);
INSERT INTO `sys_oper_log` VALUES (252, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-06-04 16:26:20\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":21,\"informTitle\":\"智慧工地通知5\",\"informType\":\"2\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-05 19:01:03\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-05 19:01:03', 8);
INSERT INTO `sys_oper_log` VALUES (253, '通知', 2, 'com.ruoyi.web.controller.inform.InformController.edit()', 'PUT', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-06-05 18:19:00\",\"informContent\":\"<p>智慧工地</p>\",\"informId\":22,\"informTitle\":\"智慧工地通知6\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/06/05/智慧工地人员名单_20230605185855A003.xls\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2023-06-06 09:37:36\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 09:37:36', 29);
INSERT INTO `sys_oper_log` VALUES (254, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-06-06 09:44:16\",\"informId\":23,\"informTitle\":\"zhihui\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/06/06/智慧工地_20230606094413A002.doc\",\"params\":{},\"status\":\"0\"} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 09:44:16', 66);
INSERT INTO `sys_oper_log` VALUES (255, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-06-06 15:23:19\",\"informId\":24,\"informTitle\":\"12313\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/06/06/智慧工地_20230606152318A001.doc\",\"params\":{}} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 15:23:20', 136);
INSERT INTO `sys_oper_log` VALUES (256, '通知', 3, 'com.ruoyi.web.controller.inform.InformController.remove()', 'DELETE', 1, 'admin', NULL, '/inform/inform/24', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 15:23:42', 23);
INSERT INTO `sys_oper_log` VALUES (257, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"crew\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 17:41:11', 113);
INSERT INTO `sys_oper_log` VALUES (258, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"crew\",\"className\":\"Crew\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":56,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-06 17:41:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名字\",\"columnId\":57,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-06 17:41:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"电话\",\"columnId\":58,\"columnName\":\"phone\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-06 17:41:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"phone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"crew\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"crew\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.crew\",\"params\":{},\"sub\":false,\"tableComment\":\"crew\",\"tableId\":6,\"tableName\":\"crew\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 17:41:41', 38);
INSERT INTO `sys_oper_log` VALUES (259, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"crew\",\"className\":\"Crew\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":56,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-06 17:41:11\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-06-06 17:41:41\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"名字\",\"columnId\":57,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-06 17:41:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-06-06 17:41:41\",\"usableColumn\":false},{\"capJavaField\":\"Phone\",\"columnComment\":\"电话\",\"columnId\":58,\"columnName\":\"phone\",\"columnType\":\"varchar(15)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-06 17:41:11\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"phone\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2023-06-06 17:41:41\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"crew\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"crew\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.crew\",\"params\":{},\"sub\":false,\"tableComment\":\"crew\",\"tableId\":6,\"tableName\":\"crew\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 17:43:25', 32);
INSERT INTO `sys_oper_log` VALUES (260, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"crew\"}', NULL, 0, NULL, '2023-06-06 17:43:28', 190);
INSERT INTO `sys_oper_log` VALUES (261, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"crew\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"crew\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 17:54:19', 44);
INSERT INTO `sys_oper_log` VALUES (262, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"crew/crew/index\",\"createBy\":\"admin\",\"icon\":\"bug\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"crew\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2005,\"path\":\"crew\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 17:55:20', 12);
INSERT INTO `sys_oper_log` VALUES (263, 'crew', 1, 'com.ruoyi.web.controller.crew.CrewController.add()', 'POST', 1, 'admin', NULL, '/crew/crew', '127.0.0.1', '内网IP', '{\"name\":\"1111\",\"params\":{},\"phone\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\SourceCode\\smart_site\\RuoYi-Vue-master\\ruoyi-crew\\target\\classes\\mapper\\crew\\CrewMapper.xml]\r\n### The error may involve com.ruoyi.crew.mapper.CrewMapper.insertCrew-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crew          ( name,             phone )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-06-06 17:55:32', 58);
INSERT INTO `sys_oper_log` VALUES (264, 'crew', 1, 'com.ruoyi.web.controller.crew.CrewController.add()', 'POST', 1, 'admin', NULL, '/crew/crew', '127.0.0.1', '内网IP', '{\"name\":\"1111\",\"params\":{},\"phone\":\"1\"}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\r\n### The error may exist in file [D:\\SourceCode\\smart_site\\RuoYi-Vue-master\\ruoyi-crew\\target\\classes\\mapper\\crew\\CrewMapper.xml]\r\n### The error may involve com.ruoyi.crew.mapper.CrewMapper.insertCrew-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into crew          ( name,             phone )           values ( ?,             ? )\r\n### Cause: java.sql.SQLException: Field \'id\' doesn\'t have a default value\n; Field \'id\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'id\' doesn\'t have a default value', '2023-06-06 17:55:39', 4);
INSERT INTO `sys_oper_log` VALUES (265, 'crew', 1, 'com.ruoyi.web.controller.crew.CrewController.add()', 'POST', 1, 'admin', NULL, '/crew/crew', '127.0.0.1', '内网IP', '{\"name\":\"111\",\"params\":{},\"phone\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 17:56:05', 8);
INSERT INTO `sys_oper_log` VALUES (266, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/101', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 18:25:15', 83);
INSERT INTO `sys_oper_log` VALUES (267, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/100', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 18:25:19', 18);
INSERT INTO `sys_oper_log` VALUES (268, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'DELETE', 1, 'admin', NULL, '/system/user/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-06 18:25:20', 11);
INSERT INTO `sys_oper_log` VALUES (269, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 xiao1 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'\r\n### The error may exist in file [D:\\SourceCode\\smart_site\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,       dept_id,       user_name,       nick_name,       email,             phonenumber,       id_number,       sex,       password,       status,       create_by,            create_time    )values(      ?,       ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'\n; Duplicate entry \'5\' for key \'sys_user.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'', '2023-06-06 18:25:59', 374);
INSERT INTO `sys_oper_log` VALUES (270, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 xiao1 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'\r\n### The error may exist in file [D:\\SourceCode\\smart_site\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,       dept_id,       user_name,       nick_name,       email,             phonenumber,       id_number,       sex,       password,       status,       create_by,            create_time    )values(      ?,       ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'\n; Duplicate entry \'5\' for key \'sys_user.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'', '2023-06-06 18:26:17', 153);
INSERT INTO `sys_oper_log` VALUES (271, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 xixixi 更新成功<br/>2、账号 xiaoxiao 更新成功\",\"code\":200}', 0, NULL, '2023-06-06 18:26:38', 33);
INSERT INTO `sys_oper_log` VALUES (272, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 10:39:44', 32);
INSERT INTO `sys_oper_log` VALUES (273, '定时任务', 2, 'com.ruoyi.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":1,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 10:41:43', 16);
INSERT INTO `sys_oper_log` VALUES (274, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2005,2006],\"params\":{},\"roleId\":100,\"roleKey\":\"super\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:03:11', 84);
INSERT INTO `sys_oper_log` VALUES (275, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-05-16 15:54:26\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"工地四\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":106,\"email\":\"1231@qq.com\",\"idNumber\":\"370811200210289020\",\"loginDate\":\"2023-05-16 21:24:13\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"17367890876\",\"postIds\":[],\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"xixixi\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:03:38', 41);
INSERT INTO `sys_oper_log` VALUES (276, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"工程队信息\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"build\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:08:32', 15);
INSERT INTO `sys_oper_log` VALUES (277, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:21:22', 12);
INSERT INTO `sys_oper_log` VALUES (278, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-06-07 11:03:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2008,2005,2006],\"params\":{},\"roleId\":100,\"roleKey\":\"super\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:21:41', 30);
INSERT INTO `sys_oper_log` VALUES (279, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-06-07 11:03:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2008,2005,2006],\"params\":{},\"roleId\":100,\"roleKey\":\"admin\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\"}', '{\"msg\":\"修改角色\'总监\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2023-06-07 11:24:57', 7);
INSERT INTO `sys_oper_log` VALUES (280, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-06-07 11:03:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2008,2005,2006],\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:25:24', 42);
INSERT INTO `sys_oper_log` VALUES (281, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-06-07 11:21:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"\",\"perms\":\"system\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:26:35', 10);
INSERT INTO `sys_oper_log` VALUES (282, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-06-07 11:21:22\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2008,\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"path\":\"\",\"perms\":\"inform:inform:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:27:24', 10);
INSERT INTO `sys_oper_log` VALUES (283, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"perms\":\"inform:inform:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:29:58', 26);
INSERT INTO `sys_oper_log` VALUES (284, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"perms\":\"inform:inform:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:30:16', 8);
INSERT INTO `sys_oper_log` VALUES (285, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"perms\":\"inform:inform:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:30:37', 11);
INSERT INTO `sys_oper_log` VALUES (286, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-06-07 11:03:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2008,2009,2010,2011,2005,2006],\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 11:31:13', 42);
INSERT INTO `sys_oper_log` VALUES (287, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-06-07 12:56:54', 8);
INSERT INTO `sys_oper_log` VALUES (288, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2006', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2023-06-07 12:57:00', 11);
INSERT INTO `sys_oper_log` VALUES (289, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-06-07 11:03:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2008,2009,2010,2011],\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 12:57:10', 27);
INSERT INTO `sys_oper_log` VALUES (290, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2006', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 12:57:19', 10);
INSERT INTO `sys_oper_log` VALUES (291, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2005', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 12:57:22', 12);
INSERT INTO `sys_oper_log` VALUES (292, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_survey\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:07:29', 85);
INSERT INTO `sys_oper_log` VALUES (293, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":59,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyType\",\"columnComment\":\"调查类型\",\"columnId\":60,\"columnName\":\"survey_type\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyRegion\",\"columnComment\":\"调查区域\",\"columnId\":61,\"columnName\":\"survey_region\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyRegion\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyNum\",\"columnComment\":\"调查人数\",\"columnId\":62,\"columnName\":\"survey_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyNum\",\"javaType\":\"Long\",\"list\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:08:14', 41);
INSERT INTO `sys_oper_log` VALUES (294, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":59,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:08:14\",\"usableColumn\":false},{\"capJavaField\":\"SurveyType\",\"columnComment\":\"调查类型\",\"columnId\":60,\"columnName\":\"survey_type\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:08:14\",\"usableColumn\":false},{\"capJavaField\":\"SurveyRegion\",\"columnComment\":\"调查区域\",\"columnId\":61,\"columnName\":\"survey_region\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyRegion\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:08:14\",\"usableColumn\":false},{\"capJavaField\":\"SurveyNum\",\"columnComment\":\"调查人数\",\"columnId\":62,\"columnName\":\"survey_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:13:48', 30);
INSERT INTO `sys_oper_log` VALUES (295, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:13:57', 15);
INSERT INTO `sys_oper_log` VALUES (296, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_survey', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:14:07', 56);
INSERT INTO `sys_oper_log` VALUES (297, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":59,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:14:07\",\"usableColumn\":false},{\"capJavaField\":\"SurveyType\",\"columnComment\":\"调查类型\",\"columnId\":60,\"columnName\":\"survey_type\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:14:07\",\"usableColumn\":false},{\"capJavaField\":\"SurveyRegion\",\"columnComment\":\"调查区域\",\"columnId\":61,\"columnName\":\"survey_region\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyRegion\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:14:07\",\"usableColumn\":false},{\"capJavaField\":\"SurveyNum\",\"columnComment\":\"调查人数\",\"columnId\":62,\"columnName\":\"survey_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:16:23', 30);
INSERT INTO `sys_oper_log` VALUES (298, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_survey\"}', NULL, 0, NULL, '2023-06-07 13:16:28', 36);
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-06-07 11:08:32\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"工程队信息\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"build\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:23:24', 21);
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"满意度评价\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"satisfaction\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:24:15', 11);
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"satisfaction/survey/index\",\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"满意度调查\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2012,\"path\":\"survey\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:26:21', 12);
INSERT INTO `sys_oper_log` VALUES (302, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-06-07 11:03:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2008,2009,2010,2011,2012,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:27:03', 42);
INSERT INTO `sys_oper_log` VALUES (303, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_map\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:48:53', 47);
INSERT INTO `sys_oper_log` VALUES (304, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"map\",\"className\":\"Map\",\"columns\":[{\"capJavaField\":\"MapId\",\"columnComment\":\"主键\",\"columnId\":66,\"columnName\":\"map_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:48:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"mapId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AreaName\",\"columnComment\":\"区域名\",\"columnId\":67,\"columnName\":\"area_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:48:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"areaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Population\",\"columnComment\":\"人口\",\"columnId\":68,\"columnName\":\"population\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:48:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"population\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"陵城区区域\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"map\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.map\",\"params\":{},\"sub\":false,\"tableComment\":\"陵城区区域\",\"tableId\":8,\"tableName\":\"tb_map\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:49:29', 30);
INSERT INTO `sys_oper_log` VALUES (305, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"map\",\"className\":\"Map\",\"columns\":[{\"capJavaField\":\"MapId\",\"columnComment\":\"主键\",\"columnId\":66,\"columnName\":\"map_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:48:53\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"mapId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:49:29\",\"usableColumn\":false},{\"capJavaField\":\"AreaName\",\"columnComment\":\"区域名\",\"columnId\":67,\"columnName\":\"area_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:48:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"areaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:49:29\",\"usableColumn\":false},{\"capJavaField\":\"Population\",\"columnComment\":\"人口\",\"columnId\":68,\"columnName\":\"population\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:48:53\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":false,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"population\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":8,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:49:29\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"陵城区区域\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"map\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.map\",\"params\":{},\"sub\":false,\"tableComment\":\"陵城区区域\",\"tableId\":8,\"tableName\":\"tb_map\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:49:45', 19);
INSERT INTO `sys_oper_log` VALUES (306, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_map\"}', NULL, 0, NULL, '2023-06-07 13:49:51', 35);
INSERT INTO `sys_oper_log` VALUES (307, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_map', '127.0.0.1', '内网IP', '{}', NULL, 1, '同步数据失败，原表结构不存在', '2023-06-07 13:55:29', 58);
INSERT INTO `sys_oper_log` VALUES (308, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_map', '127.0.0.1', '内网IP', '{}', NULL, 1, '同步数据失败，原表结构不存在', '2023-06-07 13:55:35', 12);
INSERT INTO `sys_oper_log` VALUES (309, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_map', '127.0.0.1', '内网IP', '{}', NULL, 1, '同步数据失败，原表结构不存在', '2023-06-07 13:55:42', 13);
INSERT INTO `sys_oper_log` VALUES (310, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_map', '127.0.0.1', '内网IP', '{}', NULL, 1, '同步数据失败，原表结构不存在', '2023-06-07 13:55:48', 14);
INSERT INTO `sys_oper_log` VALUES (311, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/8', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:55:54', 20);
INSERT INTO `sys_oper_log` VALUES (312, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_lingcheng_map\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:56:02', 43);
INSERT INTO `sys_oper_log` VALUES (313, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"lingchengqumap\",\"className\":\"LingchengMap\",\"columns\":[{\"capJavaField\":\"MapId\",\"columnComment\":\"主键\",\"columnId\":69,\"columnName\":\"map_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:56:02\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"javaField\":\"mapId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"AreaName\",\"columnComment\":\"区域名\",\"columnId\":70,\"columnName\":\"area_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:56:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"areaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Population\",\"columnComment\":\"人口\",\"columnId\":71,\"columnName\":\"population\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:56:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"population\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"陵城区区域\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"lingchengqumap\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.lingchengqumap\",\"params\":{},\"sub\":false,\"tableComment\":\"陵城区区域\",\"tableId\":9,\"tableName\":\"tb_lingcheng_map\",\"tplCategory\":\"crud\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:56:31', 32);
INSERT INTO `sys_oper_log` VALUES (314, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"lingchengqumap\",\"className\":\"LingchengMap\",\"columns\":[{\"capJavaField\":\"MapId\",\"columnComment\":\"主键\",\"columnId\":69,\"columnName\":\"map_id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:56:02\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"mapId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:56:31\",\"usableColumn\":false},{\"capJavaField\":\"AreaName\",\"columnComment\":\"区域名\",\"columnId\":70,\"columnName\":\"area_name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:56:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"areaName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:56:31\",\"usableColumn\":false},{\"capJavaField\":\"Population\",\"columnComment\":\"人口\",\"columnId\":71,\"columnName\":\"population\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:56:02\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"population\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":9,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:56:31\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"ruoyi\",\"functionName\":\"陵城区区域\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"lingchengqumap\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.lingchengqumap\",\"params\":{},\"sub\":false,\"tableComment\":\"陵城区区域\",\"tableId\":9,\"tableName\":\"tb_lingcheng_map\",\"tplCategory\":\"crud\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 13:56:59', 18);
INSERT INTO `sys_oper_log` VALUES (315, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_lingcheng_map\"}', NULL, 0, NULL, '2023-06-07 13:57:03', 165);
INSERT INTO `sys_oper_log` VALUES (316, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"陵城区区域\",\"dictType\":\"lingchengqumap\",\"params\":{},\"remark\":\"陵城区区域\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:02:12', 38);
INSERT INTO `sys_oper_log` VALUES (317, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":59,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:16:23\",\"usableColumn\":false},{\"capJavaField\":\"SurveyType\",\"columnComment\":\"调查类型\",\"columnId\":60,\"columnName\":\"survey_type\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyType\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:16:23\",\"usableColumn\":false},{\"capJavaField\":\"SurveyRegion\",\"columnComment\":\"调查区域\",\"columnId\":61,\"columnName\":\"survey_region\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyRegion\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 13:16:23\",\"usableColumn\":false},{\"capJavaField\":\"SurveyNum\",\"columnComment\":\"调查人数\",\"columnId\":62,\"columnName\":\"survey_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 13:07:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:05:29', 65);
INSERT INTO `sys_oper_log` VALUES (318, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_survey', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:15:02', 57);
INSERT INTO `sys_oper_log` VALUES (319, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/7', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:15:41', 20);
INSERT INTO `sys_oper_log` VALUES (320, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_survey\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:15:46', 46);
INSERT INTO `sys_oper_log` VALUES (321, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":72,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyType\",\"columnComment\":\"调查类型\",\"columnId\":73,\"columnName\":\"survey_type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyRegion\",\"columnComment\":\"调查区域\",\"columnId\":74,\"columnName\":\"survey_region\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyRegion\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyNum\",\"columnComment\":\"调查人数\",\"columnId\":75,\"columnName\":\"survey_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyNum\",\"javaType\":\"Lon', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:16:54', 31);
INSERT INTO `sys_oper_log` VALUES (322, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_survey\"}', NULL, 0, NULL, '2023-06-07 14:22:46', 49);
INSERT INTO `sys_oper_log` VALUES (323, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":72,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:16:54\",\"usableColumn\":false},{\"capJavaField\":\"SurveyType\",\"columnComment\":\"调查类型\",\"columnId\":73,\"columnName\":\"survey_type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:16:54\",\"usableColumn\":false},{\"capJavaField\":\"SurveyRegion\",\"columnComment\":\"调查区域\",\"columnId\":74,\"columnName\":\"survey_region\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyRegion\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:16:54\",\"usableColumn\":false},{\"capJavaField\":\"SurveyNum\",\"columnComment\":\"调查人数\",\"columnId\":75,\"columnName\":\"survey_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIn', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:23:45', 59);
INSERT INTO `sys_oper_log` VALUES (324, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_survey\"}', NULL, 0, NULL, '2023-06-07 14:23:47', 23);
INSERT INTO `sys_oper_log` VALUES (325, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":72,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:23:44\",\"usableColumn\":false},{\"capJavaField\":\"SurveyType\",\"columnComment\":\"调查类型\",\"columnId\":73,\"columnName\":\"survey_type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:23:44\",\"usableColumn\":false},{\"capJavaField\":\"SurveyRegion\",\"columnComment\":\"调查区域\",\"columnId\":74,\"columnName\":\"survey_region\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyRegion\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:23:44\",\"usableColumn\":false},{\"capJavaField\":\"SurveyNum\",\"columnComment\":\"调查人数\",\"columnId\":75,\"columnName\":\"survey_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIn', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:29:38', 59);
INSERT INTO `sys_oper_log` VALUES (326, '满意度检查', 1, 'com.ruoyi.satisfaction.controller.SurveyController.add()', 'POST', 1, 'admin', NULL, '/satisfaction/survey', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyBy\":\"小崔\",\"surveyId\":1,\"surveyNum\":100,\"surveyRegion\":\"前孙镇\",\"surveyResult\":100,\"surveyType\":\"安全\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:30:28', 12);
INSERT INTO `sys_oper_log` VALUES (327, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":72,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:29:38\",\"usableColumn\":false},{\"capJavaField\":\"SurveyType\",\"columnComment\":\"调查类型\",\"columnId\":73,\"columnName\":\"survey_type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:29:38\",\"usableColumn\":false},{\"capJavaField\":\"SurveyRegion\",\"columnComment\":\"调查区域\",\"columnId\":74,\"columnName\":\"survey_region\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyRegion\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:29:38\",\"usableColumn\":false},{\"capJavaField\":\"SurveyNum\",\"columnComment\":\"调查人数\",\"columnId\":75,\"columnName\":\"survey_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIn', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:30:54', 30);
INSERT INTO `sys_oper_log` VALUES (328, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":72,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:30:54\",\"usableColumn\":false},{\"capJavaField\":\"SurveyType\",\"columnComment\":\"调查类型\",\"columnId\":73,\"columnName\":\"survey_type\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyType\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:30:54\",\"usableColumn\":false},{\"capJavaField\":\"SurveyRegion\",\"columnComment\":\"调查区域\",\"columnId\":74,\"columnName\":\"survey_region\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyRegion\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-07 14:30:54\",\"usableColumn\":false},{\"capJavaField\":\"SurveyNum\",\"columnComment\":\"调查人数\",\"columnId\":75,\"columnName\":\"survey_num\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIn', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:31:58', 32);
INSERT INTO `sys_oper_log` VALUES (329, '满意度检查', 2, 'com.ruoyi.satisfaction.controller.SurveyController.edit()', 'PUT', 1, 'admin', NULL, '/satisfaction/survey', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyBy\":\"小崔\",\"surveyId\":1,\"surveyNum\":100,\"surveyRegion\":\"前孙镇\",\"surveyResult\":100,\"surveyType\":\"安全\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:32:24', 4);
INSERT INTO `sys_oper_log` VALUES (330, '满意度检查', 1, 'com.ruoyi.satisfaction.controller.SurveyController.add()', 'POST', 1, 'admin', NULL, '/satisfaction/survey', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyBy\":\"小崔\",\"surveyId\":2,\"surveyNum\":99,\"surveyRegion\":\"临齐街道\",\"surveyResult\":100,\"surveyType\":\"环境\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:34:07', 19);
INSERT INTO `sys_oper_log` VALUES (331, '满意度检查', 2, 'com.ruoyi.satisfaction.controller.SurveyController.edit()', 'PUT', 1, 'admin', NULL, '/satisfaction/survey', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyBy\":\"小崔\",\"surveyId\":1,\"surveyNum\":100,\"surveyRegion\":\"前孙镇\",\"surveyResult\":90,\"surveyTime\":\"2023-06-07 14:32:52\",\"surveyType\":\"安全\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:36:42', 9);
INSERT INTO `sys_oper_log` VALUES (332, '满意度检查', 1, 'com.ruoyi.satisfaction.controller.SurveyController.add()', 'POST', 1, 'admin', NULL, '/satisfaction/survey', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyBy\":\"小崔\",\"surveyId\":3,\"surveyNum\":50,\"surveyRegion\":\"开发区\",\"surveyResult\":80,\"surveyType\":\"治理\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 14:37:12', 8);
INSERT INTO `sys_oper_log` VALUES (333, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 xiacoccc 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'\r\n### The error may exist in file [D:\\SourceCode\\smart_site\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,       dept_id,       user_name,       nick_name,       email,             phonenumber,       id_number,       sex,       password,       status,       create_by,            create_time    )values(      ?,       ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'\n; Duplicate entry \'5\' for key \'sys_user.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'', '2023-06-07 14:49:26', 786);
INSERT INTO `sys_oper_log` VALUES (334, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', NULL, 1, '很抱歉，导入失败！共 1 条数据格式不正确，错误如下：<br/>1、账号 xiacoccc 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'\r\n### The error may exist in file [D:\\SourceCode\\smart_site\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\SysUserMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.SysUserMapper.insertUser-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_user(      user_id,       dept_id,       user_name,       nick_name,       email,             phonenumber,       id_number,       sex,       password,       status,       create_by,            create_time    )values(      ?,       ?,       ?,       ?,       ?,             ?,       ?,       ?,       ?,       ?,       ?,            sysdate()    )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'\n; Duplicate entry \'5\' for key \'sys_user.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'5\' for key \'sys_user.PRIMARY\'', '2023-06-07 14:50:30', 146);
INSERT INTO `sys_oper_log` VALUES (335, '用户管理', 6, 'com.ruoyi.web.controller.system.SysUserController.importData()', 'POST', 1, 'admin', NULL, '/system/user/importData', '127.0.0.1', '内网IP', '{\"updateSupport\":\"true\"}', '{\"msg\":\"恭喜您，数据已全部导入成功！共 3 条，数据如下：<br/>1、账号 xixixi 更新成功<br/>2、账号 xiaoxiao 更新成功<br/>3、账号 xiacoccc 导入成功\",\"code\":200}', 0, NULL, '2023-06-07 14:51:03', 133);
INSERT INTO `sys_oper_log` VALUES (336, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-06-07 11:03:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2008,2009,2010,2011,2012,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 15:05:51', 68);
INSERT INTO `sys_oper_log` VALUES (337, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2007', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 15:06:01', 16);
INSERT INTO `sys_oper_log` VALUES (338, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-06-07 11:03:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2008,2009,2010,2011,2012,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 15:07:07', 31);
INSERT INTO `sys_oper_log` VALUES (339, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2013,\"perms\":\"satisfaction:survey:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 15:08:41', 34);
INSERT INTO `sys_oper_log` VALUES (340, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2013,\"perms\":\"satisfaction:survey:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 15:08:57', 8);
INSERT INTO `sys_oper_log` VALUES (341, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"删除\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2013,\"perms\":\"satisfaction:survey:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 15:09:09', 9);
INSERT INTO `sys_oper_log` VALUES (342, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"导出\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2013,\"perms\":\"satisfaction:survey:export\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 15:09:28', 8);
INSERT INTO `sys_oper_log` VALUES (343, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-06-07 11:03:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017],\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 15:09:43', 69);
INSERT INTO `sys_oper_log` VALUES (344, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"satisfaction/echartssurvey/index\",\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"满意度可视化\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2012,\"path\":\"echartssurvey\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-07 15:26:31', 14);
INSERT INTO `sys_oper_log` VALUES (345, '通知', 1, 'com.ruoyi.web.controller.inform.InformController.add()', 'POST', 1, 'admin', NULL, '/inform/inform', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2023-06-10 14:40:32\",\"informId\":25,\"informTitle\":\"321123\",\"informType\":\"1\",\"infromFile\":\"/profile/upload/2023/06/10/智慧工地_20230610144031A001.doc\",\"params\":{},\"status\":\"0\"} {\"admin\":false,\"params\":{\"dataScope\":\"\"}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 14:40:32', 72);
INSERT INTO `sys_oper_log` VALUES (346, '通知', 3, 'com.ruoyi.web.controller.inform.InformController.remove()', 'DELETE', 1, 'admin', NULL, '/inform/inform/25', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 14:40:38', 12);
INSERT INTO `sys_oper_log` VALUES (347, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"施工队管理\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"crew\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:11:32', 22);
INSERT INTO `sys_oper_log` VALUES (348, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"crew/crew/index\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"施工队信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2019,\"path\":\"crew\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:12:18', 11);
INSERT INTO `sys_oper_log` VALUES (349, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"crew/project/index\",\"createBy\":\"admin\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2019,\"path\":\"project\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:13:09', 9);
INSERT INTO `sys_oper_log` VALUES (350, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-06-07 13:24:15\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"满意度评价\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"satisfaction\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:13:19', 11);
INSERT INTO `sys_oper_log` VALUES (351, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"工匠管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"worker\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:13:40', 10);
INSERT INTO `sys_oper_log` VALUES (352, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"worker/index\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"工匠信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"worker\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:14:46', 9);
INSERT INTO `sys_oper_log` VALUES (353, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inform/informlk/index\",\"createBy\":\"admin\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"查看通知\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"inform\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:26:58', 26);
INSERT INTO `sys_oper_log` VALUES (354, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"培训资料\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"train\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:28:00', 10);
INSERT INTO `sys_oper_log` VALUES (355, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/video/index\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"发布视频\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2025,\"path\":\"train\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:28:31', 8);
INSERT INTO `sys_oper_log` VALUES (356, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"施工单位\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"unit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:29:15', 11);
INSERT INTO `sys_oper_log` VALUES (357, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"unit/unit/index\",\"createBy\":\"admin\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"施工单位\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2027,\"path\":\"unit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:29:46', 9);
INSERT INTO `sys_oper_log` VALUES (358, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-06-10 16:29:14\",\"icon\":\"date-range\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2027,\"menuName\":\"施工单位\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"unit\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:30:33', 11);
INSERT INTO `sys_oper_log` VALUES (359, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"inform/informlk/index\",\"createTime\":\"2023-06-10 16:26:57\",\"icon\":\"dashboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"查看通知\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"path\":\"informlk\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:31:21', 9);
INSERT INTO `sys_oper_log` VALUES (360, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2027', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在子菜单,不允许删除\",\"code\":601}', 0, NULL, '2023-06-10 16:32:04', 6);
INSERT INTO `sys_oper_log` VALUES (361, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2028', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:32:10', 14);
INSERT INTO `sys_oper_log` VALUES (362, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/system/menu/2027', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:32:14', 10);
INSERT INTO `sys_oper_log` VALUES (363, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-06-10 16:28:00\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"培训资料\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"train\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:32:23', 8);
INSERT INTO `sys_oper_log` VALUES (364, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-06-10 16:28:00\",\"icon\":\"drag\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2025,\"menuName\":\"培训资料\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"train\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:32:34', 8);
INSERT INTO `sys_oper_log` VALUES (365, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-06-10 16:11:32\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"施工队管理\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"crew\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:32:39', 9);
INSERT INTO `sys_oper_log` VALUES (366, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-06-10 16:13:40\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"工匠管理\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"worker\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:32:43', 7);
INSERT INTO `sys_oper_log` VALUES (367, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-06-07 13:24:15\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"满意度评价\",\"menuType\":\"M\",\"orderNum\":9,\"params\":{},\"parentId\":0,\"path\":\"satisfaction\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:32:47', 12);
INSERT INTO `sys_oper_log` VALUES (368, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-06-07 11:03:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2008,2009,2010,2011,2024,2025,2026,2019,2020,2021,2022,2023,2012,2013,2014,2015,2016,2017,2018],\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:32:59', 36);
INSERT INTO `sys_oper_log` VALUES (369, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-05-07 10:41:24\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2001,2024,2019,2020,2021,2022,2023,2012,2013,2014,2015,2016,2017,2018],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-10 16:33:20', 17);
INSERT INTO `sys_oper_log` VALUES (370, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-05-16 15:54:26\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"工地四\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":106,\"email\":\"1231@qq.com\",\"idNumber\":\"370811200210289020\",\"loginDate\":\"2023-06-11 16:09:26\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"17367890876\",\"postIds\":[],\"roleIds\":[],\"roles\":[{\"admin\":false,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"xixixi\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-11 16:31:50', 49);
INSERT INTO `sys_oper_log` VALUES (371, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2023-05-16 15:54:26\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":106,\"deptName\":\"工地四\",\"leader\":\"若依\",\"orderNum\":4,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":106,\"email\":\"1231@qq.com\",\"idNumber\":\"370811200210289020\",\"loginDate\":\"2023-06-11 16:09:26\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"张三\",\"params\":{},\"phonenumber\":\"17367890876\",\"postIds\":[],\"roleIds\":[100],\"roles\":[],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":3,\"userName\":\"xixixi\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-11 16:31:54', 25);
INSERT INTO `sys_oper_log` VALUES (372, '员工管理', 5, 'com.ruoyi.web.controller.worker.RuoyiWorkerController.export()', 'POST', 1, 'admin', NULL, '/system/worker/export', '127.0.0.1', '内网IP', '{\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2023-06-11 16:36:18', 726);
INSERT INTO `sys_oper_log` VALUES (373, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2023-06-07 11:03:11\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,2,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,2000,2001,2002,2008,2009,2010,2011,2024,2025,2026,2019,2020,2021,2022,2023,2012,2013,2014,2015,2016,2017,2018],\"params\":{},\"roleId\":100,\"roleKey\":\"system\",\"roleName\":\"总监\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-11 16:54:16', 26);
INSERT INTO `sys_oper_log` VALUES (374, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"调查范围\",\"dictType\":\"survey\",\"params\":{},\"remark\":\"调查范围列表\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:46:43', 18);
INSERT INTO `sys_oper_log` VALUES (375, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"施工队\",\"dictSort\":1,\"dictType\":\"survey\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"调查对象是施工队\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:47:40', 13);
INSERT INTO `sys_oper_log` VALUES (376, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"施工人员\",\"dictSort\":2,\"dictType\":\"survey\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"调查对象是施工人员\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:48:11', 10);
INSERT INTO `sys_oper_log` VALUES (377, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_survey', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:50:36', 89);
INSERT INTO `sys_oper_log` VALUES (378, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":72,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-18 18:50:36\",\"usableColumn\":false},{\"capJavaField\":\"SurveyScope\",\"columnComment\":\"调查范围\",\"columnId\":79,\"columnName\":\"survey_scope\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2023-06-18 18:50:36\",\"dictType\":\"survey\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyScope\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyObject\",\"columnComment\":\"调查对象\",\"columnId\":80,\"columnName\":\"survey_object\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2023-06-18 18:50:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"javaField\":\"surveyObject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyBy\",\"columnComment\":\"调查人\",\"columnId\":76,\"columnName\":\"survey_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:51:58', 32);
INSERT INTO `sys_oper_log` VALUES (379, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"分数\",\"dictType\":\"grade\",\"params\":{},\"remark\":\"分数\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:53:08', 11);
INSERT INTO `sys_oper_log` VALUES (380, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"优秀\",\"dictSort\":1,\"dictType\":\"grade\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"remark\":\"优秀\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:53:49', 9);
INSERT INTO `sys_oper_log` VALUES (381, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"良好\",\"dictSort\":2,\"dictType\":\"grade\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"remark\":\"良好\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:54:02', 9);
INSERT INTO `sys_oper_log` VALUES (382, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"中等\",\"dictSort\":3,\"dictType\":\"grade\",\"dictValue\":\"3\",\"listClass\":\"default\",\"params\":{},\"remark\":\"中等\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:55:05', 11);
INSERT INTO `sys_oper_log` VALUES (383, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"及格\",\"dictSort\":4,\"dictType\":\"grade\",\"dictValue\":\"4\",\"listClass\":\"default\",\"params\":{},\"remark\":\"及格\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:55:21', 10);
INSERT INTO `sys_oper_log` VALUES (384, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"不及格\",\"dictSort\":5,\"dictType\":\"grade\",\"dictValue\":\"5\",\"listClass\":\"default\",\"params\":{},\"remark\":\"不及格\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:55:31', 12);
INSERT INTO `sys_oper_log` VALUES (385, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_survey', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:56:05', 32);
INSERT INTO `sys_oper_log` VALUES (386, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":72,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-18 18:56:05\",\"usableColumn\":false},{\"capJavaField\":\"SurveyScope\",\"columnComment\":\"调查范围\",\"columnId\":79,\"columnName\":\"survey_scope\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2023-06-18 18:50:36\",\"dictType\":\"survey\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyScope\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-18 18:56:05\",\"usableColumn\":false},{\"capJavaField\":\"SurveyObject\",\"columnComment\":\"调查对象\",\"columnId\":80,\"columnName\":\"survey_object\",\"columnType\":\"varchar(255)\",\"createBy\":\"\",\"createTime\":\"2023-06-18 18:50:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"surveyObject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":10,\"updateBy\":\"\",\"updateTime\":\"2023-06-18 18:56:05\",\"usableColumn\":false},{\"capJavaField\":\"SurveyBy\",\"columnComment\":\"调查人\",\"columnId\":76,\"columnName\":\"survey_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-07 14:15:46\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":fa', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:58:01', 30);
INSERT INTO `sys_oper_log` VALUES (387, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/tool/gen/synchDb/tb_survey', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:58:05', 30);
INSERT INTO `sys_oper_log` VALUES (388, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/tool/gen/10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:58:11', 11);
INSERT INTO `sys_oper_log` VALUES (389, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"tb_survey\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:58:15', 26);
INSERT INTO `sys_oper_log` VALUES (390, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"survey\",\"className\":\"Survey\",\"columns\":[{\"capJavaField\":\"SurveyId\",\"columnComment\":\"主键id\",\"columnId\":81,\"columnName\":\"survey_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2023-06-18 18:58:15\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"javaField\":\"surveyId\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyScope\",\"columnComment\":\"调查范围\",\"columnId\":82,\"columnName\":\"survey_scope\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-18 18:58:15\",\"dictType\":\"survey\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"surveyScope\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyObject\",\"columnComment\":\"调查对象\",\"columnId\":83,\"columnName\":\"survey_object\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-18 18:58:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"1\",\"javaField\":\"surveyObject\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":11,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"SurveyBy\",\"columnComment\":\"调查人\",\"columnId\":84,\"columnName\":\"survey_by\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2023-06-18 18:58:15\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQue', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 18:59:37', 22);
INSERT INTO `sys_oper_log` VALUES (391, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"tb_survey\"}', NULL, 0, NULL, '2023-06-18 18:59:41', 135);
INSERT INTO `sys_oper_log` VALUES (392, '满意度检查', 1, 'com.ruoyi.web.controller.satisfaction.SurveyController.add()', 'POST', 1, 'admin', NULL, '/satisfaction/survey', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyBy\":\"鲁斯\",\"surveyId\":4,\"surveyObject\":\"强盛集团\",\"surveyResult\":\"1\",\"surveyScope\":\"1\",\"surveyTime\":\"2023-06-12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 19:04:20', 27);
INSERT INTO `sys_oper_log` VALUES (393, '满意度检查', 1, 'com.ruoyi.web.controller.satisfaction.SurveyController.add()', 'POST', 1, 'admin', NULL, '/satisfaction/survey', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyBy\":\"鲁斯\",\"surveyId\":5,\"surveyObject\":\"里斯\",\"surveyResult\":\"2\",\"surveyScope\":\"2\",\"surveyTime\":\"2023-06-12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 19:06:00', 9);
INSERT INTO `sys_oper_log` VALUES (394, '满意度检查', 1, 'com.ruoyi.web.controller.satisfaction.SurveyController.add()', 'POST', 1, 'admin', NULL, '/satisfaction/survey', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyBy\":\"鲁斯\",\"surveyId\":6,\"surveyObject\":\"四方集团\",\"surveyResult\":\"1\",\"surveyScope\":\"1\",\"surveyTime\":\"2023-06-18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 19:40:50', 6);
INSERT INTO `sys_oper_log` VALUES (395, '满意度检查', 1, 'com.ruoyi.web.controller.satisfaction.SurveyController.add()', 'POST', 1, 'admin', NULL, '/satisfaction/survey', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyBy\":\"鲁斯\",\"surveyId\":7,\"surveyObject\":\"阿瓦集团\",\"surveyResult\":\"2\",\"surveyScope\":\"1\",\"surveyTime\":\"2023-06-14\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 19:41:30', 24);
INSERT INTO `sys_oper_log` VALUES (396, '满意度检查', 1, 'com.ruoyi.web.controller.satisfaction.SurveyController.add()', 'POST', 1, 'admin', NULL, '/satisfaction/survey', '127.0.0.1', '内网IP', '{\"params\":{},\"surveyBy\":\"鲁斯\",\"surveyId\":8,\"surveyObject\":\"王戈\",\"surveyResult\":\"4\",\"surveyScope\":\"2\",\"surveyTime\":\"2023-06-18\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-18 19:41:57', 7);
INSERT INTO `sys_oper_log` VALUES (397, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"项目管理\",\"menuType\":\"M\",\"orderNum\":10,\"params\":{},\"parentId\":0,\"path\":\"project\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:14:57', 25);
INSERT INTO `sys_oper_log` VALUES (398, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/project/index\",\"createBy\":\"admin\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2029,\"path\":\"project\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:16:33', 9);
INSERT INTO `sys_oper_log` VALUES (399, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/project/index\",\"createTime\":\"2023-06-19 20:16:33\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2029,\"path\":\"project\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:18:25', 12);
INSERT INTO `sys_oper_log` VALUES (400, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/project/index\",\"createTime\":\"2023-06-19 20:16:33\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2029,\"path\":\"project\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:18:33', 8);
INSERT INTO `sys_oper_log` VALUES (401, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"project/project/index\",\"createTime\":\"2023-06-19 20:16:33\",\"icon\":\"clipboard\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2030,\"menuName\":\"项目信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2029,\"path\":\"project\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:18:42', 10);
INSERT INTO `sys_oper_log` VALUES (402, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"crew/project/index\",\"createTime\":\"2023-06-10 16:13:09\",\"icon\":\"job\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2021,\"menuName\":\"项目管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2019,\"path\":\"project\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:19:13', 10);
INSERT INTO `sys_oper_log` VALUES (403, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"echarts/index\",\"createTime\":\"2023-05-07 10:48:00\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"echarts\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"echarts\",\"perms\":\"\",\"status\":\"1\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:19:38', 11);
INSERT INTO `sys_oper_log` VALUES (404, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/video/index\",\"createTime\":\"2023-06-10 16:28:31\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2026,\"menuName\":\"资料发布\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2025,\"path\":\"train\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:22:10', 8);
INSERT INTO `sys_oper_log` VALUES (405, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/video/watch\",\"createBy\":\"admin\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"技能学习\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2025,\"path\":\"train\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:22:55', 9);
INSERT INTO `sys_oper_log` VALUES (406, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/video/watch.vue\",\"createTime\":\"2023-06-19 20:22:55\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"技能学习\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2025,\"path\":\"train\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:23:18', 8);
INSERT INTO `sys_oper_log` VALUES (407, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/video/watch\",\"createTime\":\"2023-06-19 20:22:55\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"技能学习\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2025,\"path\":\"train\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:24:24', 9);
INSERT INTO `sys_oper_log` VALUES (408, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"train/video/watch\",\"createTime\":\"2023-06-19 20:22:55\",\"icon\":\"component\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"技能学习\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2025,\"path\":\"watch\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 20:28:30', 22);
INSERT INTO `sys_oper_log` VALUES (409, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2023-06-10 16:13:40\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2022,\"menuName\":\"员工管理\",\"menuType\":\"M\",\"orderNum\":8,\"params\":{},\"parentId\":0,\"path\":\"worker\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 21:20:46', 19);
INSERT INTO `sys_oper_log` VALUES (410, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"worker/worker/index\",\"createTime\":\"2023-06-10 16:14:46\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2023,\"menuName\":\"员工信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2022,\"path\":\"worker\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 21:21:17', 8);
INSERT INTO `sys_oper_log` VALUES (411, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"worker/type/index\",\"createBy\":\"admin\",\"icon\":\"list\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"工种信息\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2022,\"path\":\"type\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-06-19 21:22:00', 10);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2023-05-07 10:41:24', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2023-05-07 10:41:24', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
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
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2023-05-07 10:41:24', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2023-05-07 10:41:24', 'admin', '2023-06-10 16:33:20', '普通角色');
INSERT INTO `sys_role` VALUES (100, '总监', 'system', 2, '1', 1, 1, '0', '0', 'admin', '2023-06-07 11:03:11', 'admin', '2023-06-11 16:54:16', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
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
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2012);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2022);
INSERT INTO `sys_role_menu` VALUES (2, 2023);
INSERT INTO `sys_role_menu` VALUES (2, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 1);
INSERT INTO `sys_role_menu` VALUES (100, 2);
INSERT INTO `sys_role_menu` VALUES (100, 100);
INSERT INTO `sys_role_menu` VALUES (100, 101);
INSERT INTO `sys_role_menu` VALUES (100, 102);
INSERT INTO `sys_role_menu` VALUES (100, 103);
INSERT INTO `sys_role_menu` VALUES (100, 104);
INSERT INTO `sys_role_menu` VALUES (100, 109);
INSERT INTO `sys_role_menu` VALUES (100, 110);
INSERT INTO `sys_role_menu` VALUES (100, 1000);
INSERT INTO `sys_role_menu` VALUES (100, 1001);
INSERT INTO `sys_role_menu` VALUES (100, 1002);
INSERT INTO `sys_role_menu` VALUES (100, 1003);
INSERT INTO `sys_role_menu` VALUES (100, 1004);
INSERT INTO `sys_role_menu` VALUES (100, 1005);
INSERT INTO `sys_role_menu` VALUES (100, 1006);
INSERT INTO `sys_role_menu` VALUES (100, 1007);
INSERT INTO `sys_role_menu` VALUES (100, 1008);
INSERT INTO `sys_role_menu` VALUES (100, 1009);
INSERT INTO `sys_role_menu` VALUES (100, 1010);
INSERT INTO `sys_role_menu` VALUES (100, 1011);
INSERT INTO `sys_role_menu` VALUES (100, 1012);
INSERT INTO `sys_role_menu` VALUES (100, 1013);
INSERT INTO `sys_role_menu` VALUES (100, 1014);
INSERT INTO `sys_role_menu` VALUES (100, 1015);
INSERT INTO `sys_role_menu` VALUES (100, 1016);
INSERT INTO `sys_role_menu` VALUES (100, 1017);
INSERT INTO `sys_role_menu` VALUES (100, 1018);
INSERT INTO `sys_role_menu` VALUES (100, 1019);
INSERT INTO `sys_role_menu` VALUES (100, 1020);
INSERT INTO `sys_role_menu` VALUES (100, 1021);
INSERT INTO `sys_role_menu` VALUES (100, 1022);
INSERT INTO `sys_role_menu` VALUES (100, 1023);
INSERT INTO `sys_role_menu` VALUES (100, 1024);
INSERT INTO `sys_role_menu` VALUES (100, 1046);
INSERT INTO `sys_role_menu` VALUES (100, 1047);
INSERT INTO `sys_role_menu` VALUES (100, 1048);
INSERT INTO `sys_role_menu` VALUES (100, 1049);
INSERT INTO `sys_role_menu` VALUES (100, 1050);
INSERT INTO `sys_role_menu` VALUES (100, 1051);
INSERT INTO `sys_role_menu` VALUES (100, 1052);
INSERT INTO `sys_role_menu` VALUES (100, 1053);
INSERT INTO `sys_role_menu` VALUES (100, 1054);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2001);
INSERT INTO `sys_role_menu` VALUES (100, 2002);
INSERT INTO `sys_role_menu` VALUES (100, 2008);
INSERT INTO `sys_role_menu` VALUES (100, 2009);
INSERT INTO `sys_role_menu` VALUES (100, 2010);
INSERT INTO `sys_role_menu` VALUES (100, 2011);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2014);
INSERT INTO `sys_role_menu` VALUES (100, 2015);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2017);
INSERT INTO `sys_role_menu` VALUES (100, 2018);
INSERT INTO `sys_role_menu` VALUES (100, 2019);
INSERT INTO `sys_role_menu` VALUES (100, 2020);
INSERT INTO `sys_role_menu` VALUES (100, 2021);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2024);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2026);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
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
  `id_number` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '/profile/avatar/2023/05/17/blob_20230517125046A003.png', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2023-06-20 16:39:30', 'admin', '2023-05-07 10:41:24', '', '2023-06-20 16:39:30', '管理员', '370811200210286013');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$npQBtNRViJvAsCFtzj83D.ZsjSHPORKtC8m9bzlzwFYsPo.PgtiWu', '0', '0', '127.0.0.1', '2023-05-17 19:37:09', 'admin', '2023-05-07 10:41:24', 'admin', '2023-05-17 19:37:08', '测试员', '');
INSERT INTO `sys_user` VALUES (3, 106, 'xixixi', '张三', '00', '1231@qq.com', '17367890876', '0', '', '$2a$10$CWKNoz8/1syxteHNvJcbweabP/rlDi8O3b7rowLyNJ8CVOs2SGWWe', '0', '0', '127.0.0.1', '2023-06-11 17:23:30', 'admin', '2023-05-16 15:54:26', 'admin', '2023-06-11 17:23:29', NULL, '370811200210289020');
INSERT INTO `sys_user` VALUES (4, 107, 'xiaoxiao', '里斯', '00', '1231@qq.com', '213', '1', '', '$2a$10$IpeFk8XMZ.pckULRyk3cdO31LmJOn5GKpJgj8fwOmAE6zmuSCNgTa', '0', '0', '127.0.0.1', '2023-06-07 10:40:33', 'admin', '2023-05-16 15:57:05', 'admin', '2023-06-07 14:51:03', NULL, '370811200210289020');
INSERT INTO `sys_user` VALUES (5, 108, 'xiao1', '王五', '00', '1231@qq.com', '12312334534', '1', '', '$2a$10$UNYmDlgIIX0Wt/U5ZrjTruEALYGgylaKy.EpyGHiIdFjElhTBSI3G', '0', '2', '127.0.0.1', '2023-06-06 09:23:59', 'admin', '2023-06-05 18:49:01', 'admin', '2023-06-06 09:23:59', NULL, '370811200210289020');
INSERT INTO `sys_user` VALUES (10, 107, 'xiacoccc', '王五', '00', '1231@qq.com', '17367890876', '1', '', '$2a$10$Qt5vEzjJ3BCzEWA8Wbs3eulLCY24tmyPN1x0npDvpAI5vt/Egql56', '0', '0', '', NULL, 'admin', '2023-06-07 14:51:03', '', NULL, NULL, '370811200210289020');
INSERT INTO `sys_user` VALUES (100, 106, 'xiaoc', 'xiaoc', '00', '', '', '0', '', '$2a$10$ffmEwyTopgMlhxii2f0eWuSf13TNFbL84PE4SiYjutvdBs0q6U1P.', '0', '2', '127.0.0.1', '2023-06-06 09:39:06', '', '2023-05-14 11:26:05', '', '2023-06-06 09:39:05', NULL, '');
INSERT INTO `sys_user` VALUES (101, NULL, 'xiaocc', 'xiaocc', '00', '', '', '0', '', '$2a$10$3QU.lpayCdPDhbN1NKk83ui8JgTS/OeGd1sQ1eJ7UA/qxNYg.1AbS', '0', '2', '127.0.0.1', '2023-06-06 09:25:35', '', '2023-06-04 11:33:39', '', '2023-06-06 09:25:34', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
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
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 100);
INSERT INTO `sys_user_role` VALUES (4, 2);

-- ----------------------------
-- Table structure for tb_assets_total
-- ----------------------------
DROP TABLE IF EXISTS `tb_assets_total`;
CREATE TABLE `tb_assets_total`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `total_assets` decimal(15, 2) NULL DEFAULT NULL COMMENT '总产值',
  `total_investment` decimal(15, 2) NULL DEFAULT NULL COMMENT '总投资',
  `total_net_profit` decimal(15, 2) NULL DEFAULT NULL COMMENT '总净利',
  `total_revenue` decimal(15, 2) NULL DEFAULT NULL COMMENT '总税收',
  `site_id` int NULL DEFAULT NULL COMMENT '所属工地',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工地资产统计表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_assets_total
-- ----------------------------
INSERT INTO `tb_assets_total` VALUES (1, 543.00, 600.00, 340.00, 140.00, 1);

-- ----------------------------
-- Table structure for tb_check_point
-- ----------------------------
DROP TABLE IF EXISTS `tb_check_point`;
CREATE TABLE `tb_check_point`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '检测点名称',
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '检测点位置',
  `status` tinyint NULL DEFAULT NULL COMMENT '检测点状态 0:正常 1:未启用  2:维修中',
  `site_id` int NULL DEFAULT NULL COMMENT '所属工地',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '监测点信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_check_point
-- ----------------------------
INSERT INTO `tb_check_point` VALUES (1, '监测点1', '1栋西门', 0, 1);
INSERT INTO `tb_check_point` VALUES (2, '检测点2', '5栋南门', 0, 1);
INSERT INTO `tb_check_point` VALUES (3, '监测点3', '12栋南门', 0, 1);
INSERT INTO `tb_check_point` VALUES (4, '监测点4', '37栋东门', 0, 1);

-- ----------------------------
-- Table structure for tb_company
-- ----------------------------
DROP TABLE IF EXISTS `tb_company`;
CREATE TABLE `tb_company`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `company_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '公司名称',
  `type` int NULL DEFAULT NULL COMMENT '公司类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '公司信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_company
-- ----------------------------
INSERT INTO `tb_company` VALUES (1, '公司1', 1);
INSERT INTO `tb_company` VALUES (2, '公司2', 1);
INSERT INTO `tb_company` VALUES (3, '公司3', 1);
INSERT INTO `tb_company` VALUES (4, '公司4', 2);
INSERT INTO `tb_company` VALUES (5, '公司5', 3);
INSERT INTO `tb_company` VALUES (6, '公司6', 4);
INSERT INTO `tb_company` VALUES (7, '公司7', 2);
INSERT INTO `tb_company` VALUES (8, '公司8', 1);
INSERT INTO `tb_company` VALUES (9, '公司9', 4);
INSERT INTO `tb_company` VALUES (10, '公司10', 2);
INSERT INTO `tb_company` VALUES (11, '公司11', 2);
INSERT INTO `tb_company` VALUES (12, '公司12', 3);
INSERT INTO `tb_company` VALUES (13, '公司13', 1);
INSERT INTO `tb_company` VALUES (14, '公司14', 2);
INSERT INTO `tb_company` VALUES (15, '公司15', 2);
INSERT INTO `tb_company` VALUES (16, '公司16', 1);
INSERT INTO `tb_company` VALUES (17, '公司17', 2);
INSERT INTO `tb_company` VALUES (18, '公司18', 2);
INSERT INTO `tb_company` VALUES (19, '公司19', 3);
INSERT INTO `tb_company` VALUES (20, '公司20', 3);

-- ----------------------------
-- Table structure for tb_company_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_company_type`;
CREATE TABLE `tb_company_type`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '公司类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_company_type
-- ----------------------------
INSERT INTO `tb_company_type` VALUES (1, '有限责任公司');
INSERT INTO `tb_company_type` VALUES (2, '股份有限公司');
INSERT INTO `tb_company_type` VALUES (3, '个人独资企业');
INSERT INTO `tb_company_type` VALUES (4, '合资企业');

-- ----------------------------
-- Table structure for tb_environment_detection
-- ----------------------------
DROP TABLE IF EXISTS `tb_environment_detection`;
CREATE TABLE `tb_environment_detection`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `cid` int NULL DEFAULT NULL COMMENT '所属检测点',
  `temperature` double(3, 1) NULL DEFAULT NULL COMMENT '温度(℃)',
  `pm25` double NULL DEFAULT NULL COMMENT 'pm2.5',
  `humidity` double NULL DEFAULT NULL COMMENT '湿度(%)',
  `noise` double NULL DEFAULT NULL COMMENT '噪音(db)',
  `wind_speed` double NULL DEFAULT NULL COMMENT '风速(m/s)',
  `check_time` datetime NULL DEFAULT NULL COMMENT '检测时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '环境监测' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_environment_detection
-- ----------------------------
INSERT INTO `tb_environment_detection` VALUES (1, 1, 28.0, 40, 30, 87, 10, '2022-06-01 09:15:39');
INSERT INTO `tb_environment_detection` VALUES (2, 2, 28.7, 40, 31, 90, 11, '2022-06-02 09:15:39');
INSERT INTO `tb_environment_detection` VALUES (3, 3, 27.6, 41, 30, 76, 10, '2022-06-03 09:15:39');
INSERT INTO `tb_environment_detection` VALUES (4, 4, 25.7, 40, 29, 56, 10, '2022-06-04 09:15:39');
INSERT INTO `tb_environment_detection` VALUES (5, 1, 31.2, 39, 40, 76, 12, '2022-06-05 09:18:08');
INSERT INTO `tb_environment_detection` VALUES (6, 2, 29.4, 38, 40, 80, 12, '2022-06-06 09:15:39');
INSERT INTO `tb_environment_detection` VALUES (7, 3, 29.4, 39, 40, 77, 11, '2022-06-07 09:15:39');
INSERT INTO `tb_environment_detection` VALUES (8, 4, 30.1, 39, 41, 67, 18, '2022-06-08 09:15:39');
INSERT INTO `tb_environment_detection` VALUES (9, 1, 32.0, 45, 44, 77, 16, '2022-07-01 23:36:17');
INSERT INTO `tb_environment_detection` VALUES (10, 1, 26.0, 44, 42, 65, 16, '2022-07-08 23:42:02');
INSERT INTO `tb_environment_detection` VALUES (11, 1, 35.0, 45, 44, 66, 17, '2022-08-10 23:42:44');
INSERT INTO `tb_environment_detection` VALUES (12, 1, 29.0, 36, 27, 7, 14, '2022-08-18 23:43:15');

-- ----------------------------
-- Table structure for tb_inform
-- ----------------------------
DROP TABLE IF EXISTS `tb_inform`;
CREATE TABLE `tb_inform`  (
  `inform_id` bigint NOT NULL AUTO_INCREMENT COMMENT '通知id',
  `inform_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知标题',
  `inform_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知状态',
  `inform_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '通知内容',
  `infrom_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知文件',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`inform_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_inform
-- ----------------------------
INSERT INTO `tb_inform` VALUES (17, '智慧工地通知1', '1', '0', '<p>智慧工地</p>', '/profile/upload/2023/06/05/智慧工地_20230605185651A002.doc', 'admin', '2023-05-27 16:44:21', 'admin', '2023-06-05 18:57:30');
INSERT INTO `tb_inform` VALUES (18, '智慧工地通知2', '2', '0', '<p>智慧工地</p>', '', 'admin', '2023-05-28 11:54:30', 'admin', '2023-06-05 19:00:50');
INSERT INTO `tb_inform` VALUES (19, '智慧工地通知3', '2', '0', '<p>智慧工地</p>', NULL, 'admin', '2023-05-28 11:56:03', 'admin', '2023-06-05 19:00:45');
INSERT INTO `tb_inform` VALUES (20, '智慧工地通知4', '2', '0', '<p>智慧工地</p>', NULL, 'admin', '2023-05-28 12:00:55', 'admin', '2023-06-05 19:00:41');
INSERT INTO `tb_inform` VALUES (21, '智慧工地通知5', '2', '0', '<p>智慧工地</p>', NULL, 'admin', '2023-06-04 16:26:20', 'admin', '2023-06-05 19:01:04');
INSERT INTO `tb_inform` VALUES (22, '智慧工地通知6', '1', '0', '<p>智慧工地</p>', '/profile/upload/2023/06/05/智慧工地人员名单_20230605185855A003.xls', 'admin', '2023-06-05 18:19:00', 'admin', '2023-06-06 09:37:36');
INSERT INTO `tb_inform` VALUES (23, 'zhihui', '1', '0', NULL, '/profile/upload/2023/06/06/智慧工地_20230606094413A002.doc', 'admin', '2023-06-06 09:44:16', NULL, NULL);

-- ----------------------------
-- Table structure for tb_introduce
-- ----------------------------
DROP TABLE IF EXISTS `tb_introduce`;
CREATE TABLE `tb_introduce`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '商家介绍信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商家介绍' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_introduce
-- ----------------------------

-- ----------------------------
-- Table structure for tb_lingcheng_map
-- ----------------------------
DROP TABLE IF EXISTS `tb_lingcheng_map`;
CREATE TABLE `tb_lingcheng_map`  (
  `map_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `area_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域名',
  `population` bigint NULL DEFAULT NULL COMMENT '人口',
  PRIMARY KEY (`map_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '陵城区区域' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_lingcheng_map
-- ----------------------------
INSERT INTO `tb_lingcheng_map` VALUES (1, '前孙镇', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (2, '郑家寨镇', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (3, '徽王庄镇', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (4, '丁庄镇', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (5, '临齐街道', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (6, '边临镇', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (7, '于集乡', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (8, '神头镇', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (9, '开发区', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (10, '义渡口镇', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (11, '糜镇', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (12, '宋家镇', NULL);
INSERT INTO `tb_lingcheng_map` VALUES (13, '滋镇', NULL);

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu`  (
  `menu_id` int NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单名',
  `menu_content` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单简介',
  `menu_price` double(5, 2) NOT NULL DEFAULT 0.00 COMMENT '菜单单价',
  `menu_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图片名称',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_menu
-- ----------------------------

-- ----------------------------
-- Table structure for tb_menu_top
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu_top`;
CREATE TABLE `tb_menu_top`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NOT NULL DEFAULT 0 COMMENT '菜单ID，参考菜单表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '推荐的菜品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_menu_top
-- ----------------------------

-- ----------------------------
-- Table structure for tb_message
-- ----------------------------
DROP TABLE IF EXISTS `tb_message`;
CREATE TABLE `tb_message`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '留言ID',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户ID，参照用户表',
  `menu_id` int NOT NULL DEFAULT 0 COMMENT '菜品ID，参照菜单表',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '内容',
  `mg_date` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `foreign_key_msg_userId`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '留言信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_message
-- ----------------------------

-- ----------------------------
-- Table structure for tb_news
-- ----------------------------
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '新闻标题',
  `create_date` date NULL DEFAULT NULL COMMENT '新闻日期',
  `create_time` time NULL DEFAULT NULL COMMENT '新闻时间',
  `status` tinyint NULL DEFAULT NULL COMMENT '新闻状态: 0未处理 1已处理',
  `type` tinyint NULL DEFAULT NULL COMMENT '新闻类型: 1:安防新闻 2:其他新闻',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL COMMENT '新闻内容',
  `deal_time` datetime NULL DEFAULT NULL COMMENT '处理时间',
  `mask` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '备注',
  `site_id` int NULL DEFAULT NULL COMMENT '所属工地',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_news
-- ----------------------------
INSERT INTO `tb_news` VALUES (1, '安防信息1', '2022-03-01', '17:24:35', 1, 1, '内容1内容1内容11', '2022-03-02 11:47:55', '问题解决', 1);
INSERT INTO `tb_news` VALUES (2, '安防信息2', '2022-03-09', '12:23:34', 1, 1, '内容22222', '2022-03-03 11:03:57', '问题已排除', 1);
INSERT INTO `tb_news` VALUES (3, '安防信息3', '2022-04-01', '18:12:11', 1, 1, '内容12312', '2022-04-05 11:49:57', '设备已更换', 1);
INSERT INTO `tb_news` VALUES (4, '安防信息4', '2022-05-01', '21:21:12', 1, 1, '内容21212', '2022-05-03 11:50:47', '设备已更换', 1);
INSERT INTO `tb_news` VALUES (5, '安防信息5', '2022-06-29', '11:21:21', 1, 1, '内容333', '2022-06-30 11:51:33', '误报,已排除', 1);
INSERT INTO `tb_news` VALUES (6, '安防信息6', '2022-07-05', '11:21:11', 0, 1, '内容12123', NULL, NULL, 1);
INSERT INTO `tb_news` VALUES (7, '培训信息', '2022-06-01', '15:12:12', 1, 2, '全体人员进行安全培训', '2022-06-02 11:53:19', '已培训完成', 1);
INSERT INTO `tb_news` VALUES (8, '卫生检查', '2022-06-23', '10:12:21', 1, 2, '工地环境靠大家, 下午3点进行工地卫生大检查', '2022-06-23 16:54:57', '已完成检查', 1);
INSERT INTO `tb_news` VALUES (9, '安全检查', '2022-07-01', '09:12:22', 1, 2, '对工地的各个角落进行安全隐患的排除', '2022-07-02 11:56:18', '已排查完成', 1);

-- ----------------------------
-- Table structure for tb_orders
-- ----------------------------
DROP TABLE IF EXISTS `tb_orders`;
CREATE TABLE `tb_orders`  (
  `order_id` int NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `user_id` int NOT NULL DEFAULT 0 COMMENT '用户ID，参照用户表',
  `menu_id` int NOT NULL DEFAULT 0 COMMENT '菜单ID，参照菜单表',
  `order_num` int NOT NULL DEFAULT 0 COMMENT '订购菜品数量',
  `order_notice` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '口味要求',
  `other_notice` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他要求',
  `states` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单付款状态',
  PRIMARY KEY (`order_id`) USING BTREE,
  INDEX `foreign_key_userId`(`user_id` ASC) USING BTREE,
  INDEX `foreign_key_menuId`(`menu_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_orders
-- ----------------------------

-- ----------------------------
-- Table structure for tb_parking
-- ----------------------------
DROP TABLE IF EXISTS `tb_parking`;
CREATE TABLE `tb_parking`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '车位Id',
  `parking_number` int NULL DEFAULT NULL COMMENT '车场数',
  `gates_number` int NULL DEFAULT NULL COMMENT '道闸数',
  `parking_space` int NULL DEFAULT NULL COMMENT '车位数',
  `site_id` int NULL DEFAULT NULL COMMENT '所属工地',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '停车场表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_parking
-- ----------------------------
INSERT INTO `tb_parking` VALUES (1, 67, 212, 14210, 1);

-- ----------------------------
-- Table structure for tb_parking_real_time
-- ----------------------------
DROP TABLE IF EXISTS `tb_parking_real_time`;
CREATE TABLE `tb_parking_real_time`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `remaining_number` int NULL DEFAULT NULL COMMENT '剩余车位数',
  `entry_number` int NULL DEFAULT NULL COMMENT '当日进场数',
  `out_number` int NULL DEFAULT NULL COMMENT '当日出场数',
  `vehicles_number` int NULL DEFAULT NULL COMMENT '场内车辆数',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `parkId` int NULL DEFAULT NULL COMMENT '所属停车场',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '停车场实时数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_parking_real_time
-- ----------------------------
INSERT INTO `tb_parking_real_time` VALUES (1, 5321, 20123, 19862, 9132, '2022-07-04 00:08:54', '2022-07-05 09:09:24', 1);

-- ----------------------------
-- Table structure for tb_project
-- ----------------------------
DROP TABLE IF EXISTS `tb_project`;
CREATE TABLE `tb_project`  (
  `project_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `project_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `project_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '项目简介',
  `project_population` int NULL DEFAULT NULL COMMENT '项目人数',
  `projetc_begin_time` datetime NULL DEFAULT NULL COMMENT '开始时间',
  `project_end_time` datetime NULL DEFAULT NULL COMMENT '结束时间',
  `crew_id` int NULL DEFAULT NULL COMMENT '施工队id',
  `project_fund` double NULL DEFAULT NULL COMMENT '项目资金',
  `crew_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '施工队名字',
  `authentication` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否完成',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_project
-- ----------------------------
INSERT INTO `tb_project` VALUES (1, '度假村', '11111', 2, '2023-06-07 00:00:00', '2023-06-17 00:00:00', 2, 111.21, '建军集团', '是');
INSERT INTO `tb_project` VALUES (2, '光明小学', NULL, 1000, '2022-06-07 00:00:00', '2023-06-21 00:00:00', 1, 2222.12, '强盛集团', '否');
INSERT INTO `tb_project` VALUES (3, '只因大厦', NULL, 2500, '2023-05-10 00:00:00', '2023-06-08 00:00:00', 3, 333.33, '圣天集团', '是');
INSERT INTO `tb_project` VALUES (5, '美团外卖', NULL, 217, '2023-06-05 00:00:00', NULL, 2, 333.22, '建军集团', '是');
INSERT INTO `tb_project` VALUES (6, '学校', NULL, 121, '2023-06-13 00:00:00', NULL, 4, 312.3, '华兴集团', '是');
INSERT INTO `tb_project` VALUES (7, '实验室', NULL, 2222, '2023-06-14 00:00:00', '2023-06-22 00:00:00', 5, 3131.33, '上天集团', '是');
INSERT INTO `tb_project` VALUES (8, '新商场', NULL, 1112, '2023-06-13 00:00:00', '2023-06-28 00:00:00', 2, 31231.3, '建军集团', '否');
INSERT INTO `tb_project` VALUES (21, '新世界', NULL, 11, '2023-06-14 00:00:00', '2023-06-15 00:00:00', 2, 111.3, '建军集团', '是');

-- ----------------------------
-- Table structure for tb_recruitment
-- ----------------------------
DROP TABLE IF EXISTS `tb_recruitment`;
CREATE TABLE `tb_recruitment`  (
  `item_id` bigint NOT NULL COMMENT '项目id',
  `item_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目名称',
  `item_content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目内容',
  `item_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目所在地',
  `worker_require` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工种需求',
  `require_num` int NOT NULL COMMENT '招聘人数',
  `item_finish_time` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '预计完成时间',
  `contact_phone` int NOT NULL COMMENT '联系电话',
  `item_status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目招聘状态',
  `release_time` datetime NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '招聘公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_recruitment
-- ----------------------------

-- ----------------------------
-- Table structure for tb_ruoyi_crew
-- ----------------------------
DROP TABLE IF EXISTS `tb_ruoyi_crew`;
CREATE TABLE `tb_ruoyi_crew`  (
  `crew_id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '施工单位名称',
  `res_person` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `qualification` int NULL DEFAULT NULL COMMENT '资质（特级，1，2，3级对应0，1，2，3）',
  `finish_project` int NULL DEFAULT NULL COMMENT '已完成项目',
  `unfinish_project` int NULL DEFAULT NULL COMMENT '未完成项目',
  `popualtion` int NULL DEFAULT NULL COMMENT '员工数量',
  `build_time` datetime NULL DEFAULT NULL COMMENT '成立时间',
  PRIMARY KEY (`crew_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_ruoyi_crew
-- ----------------------------
INSERT INTO `tb_ruoyi_crew` VALUES (1, '强盛集团', '高启强', '18239425875', '江苏省南通市启东市北新镇', 0, 1, 2, 111, '2023-06-07 00:00:00');
INSERT INTO `tb_ruoyi_crew` VALUES (2, '建军集团', 'mark', '15510907681', '甘肃省兰州市西固区西柳沟街道', 1, 1, 1, 223, '2021-02-25 00:00:00');
INSERT INTO `tb_ruoyi_crew` VALUES (3, '圣天集团', '陆雄霖  ', '02400164308', '山东省德州市德州运河经济开发区新区', 2, 1, 2, 112, '2023-06-13 00:00:00');
INSERT INTO `tb_ruoyi_crew` VALUES (4, '华兴集团', ' 贾美欣   ', '02449899102', '上海市市辖区宝山区淞南镇', 2, 0, 1, 321, '2023-06-29 00:00:00');
INSERT INTO `tb_ruoyi_crew` VALUES (5, '上天集团', '孔益帆', '08649464843', ' 河南省驻马店市遂平县凤鸣谷风景区', 2, 1, 2, 1112, '2023-06-27 00:00:00');
INSERT INTO `tb_ruoyi_crew` VALUES (6, '御园集团', '鱼皮', '06798770143', '四川省巴中市巴中经济开发区时新街道', 2, 1, 2, 1231, '2023-06-26 00:00:00');
INSERT INTO `tb_ruoyi_crew` VALUES (7, '建工集团', '胡润丽', '01784636828', '新疆维吾尔自治区乌鲁木齐市头屯河区兵团十二师三坪农场', 2, 1, 2, 1678, '2023-06-28 00:00:00');
INSERT INTO `tb_ruoyi_crew` VALUES (8, '海天集团', ' 袁文昊', '08525666205', '青海省西宁市湟中区甘河工业园 ', 2, 1, 2, 1211, '2023-06-11 00:00:00');
INSERT INTO `tb_ruoyi_crew` VALUES (9, '天海集团', '雷芳 ', '02542444789', '河南省驻马店市遂平县凤鸣谷风景区', 2, 1, 2, 1212, '2023-06-01 00:00:00');
INSERT INTO `tb_ruoyi_crew` VALUES (10, '东方集团', '雷芳   ', '18766542424', '西藏自治区昌都市洛隆县硕督镇', 1, 2, 1, 2222, '2023-06-28 00:00:00');

-- ----------------------------
-- Table structure for tb_ruoyi_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_ruoyi_type`;
CREATE TABLE `tb_ruoyi_type`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '工种id',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工种名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_ruoyi_type
-- ----------------------------
INSERT INTO `tb_ruoyi_type` VALUES (1, '钢筋工');
INSERT INTO `tb_ruoyi_type` VALUES (2, '水泥工');
INSERT INTO `tb_ruoyi_type` VALUES (3, '瓦工');
INSERT INTO `tb_ruoyi_type` VALUES (4, '水电工');
INSERT INTO `tb_ruoyi_type` VALUES (5, '壮工');

-- ----------------------------
-- Table structure for tb_ruoyi_worker
-- ----------------------------
DROP TABLE IF EXISTS `tb_ruoyi_worker`;
CREATE TABLE `tb_ruoyi_worker`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` int NULL DEFAULT NULL COMMENT '性别',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号',
  `address_now` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '现住址',
  `address_reg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '户籍住址',
  `pol_status` int NULL DEFAULT NULL COMMENT '政治面貌',
  `crew_id` int NULL DEFAULT NULL COMMENT '属于哪一个施工队',
  `project_now` int NULL DEFAULT NULL COMMENT '正在进行的项目',
  `authentication` int NULL DEFAULT NULL COMMENT '是否认证',
  `id_number` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11217 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_ruoyi_worker
-- ----------------------------
INSERT INTO `tb_ruoyi_worker` VALUES (3, '方伟洋', 0, 42, '19010996062', '江西省九江市德安县爱民乡', '', 1, 5, NULL, 1, '');
INSERT INTO `tb_ruoyi_worker` VALUES (4, '郭文轩', 0, 11, '17676611492', '四川省广元市昭化区太公镇', '', 1, 4, NULL, 1, '');
INSERT INTO `tb_ruoyi_worker` VALUES (5, '范昕蕊', 1, 33, '13851033537', '湖南省怀化市辰溪县船溪乡', '你好', 1, 2, NULL, 0, '111111111111');
INSERT INTO `tb_ruoyi_worker` VALUES (7, '沈文杰', 1, 25, '15087627145', '广东省云浮市云安区都杨镇', '你好', 0, 3, NULL, 1, '');
INSERT INTO `tb_ruoyi_worker` VALUES (1123, 'qs', 0, 2, '1231231231', '山东', '', 1, 2, NULL, 1, '');
INSERT INTO `tb_ruoyi_worker` VALUES (3572, '露西', 1, 23, '15253451111', '山东省', '', 1, 2, NULL, 1, '');
INSERT INTO `tb_ruoyi_worker` VALUES (3573, '刘延旭', 0, 12, '221312213', '1qsdsdf', '', 0, 2, NULL, 1, '');
INSERT INTO `tb_ruoyi_worker` VALUES (3578, '张宇', 0, 88, '1231231231', '山东', '', 1, 2, NULL, 1, '');
INSERT INTO `tb_ruoyi_worker` VALUES (3579, 'ads', 0, 123, '1241241241', '山东', '', 0, 2, NULL, 1, '');
INSERT INTO `tb_ruoyi_worker` VALUES (11213, 'qs', 0, 2, '1231231231', '山东', '', 1, 2, NULL, 1, '');
INSERT INTO `tb_ruoyi_worker` VALUES (11214, 'lis', 0, 23, '123152121', '阿萨德', '', 1, 2, NULL, 1, '');
INSERT INTO `tb_ruoyi_worker` VALUES (11216, '武兵', 0, 12, '1231231231', '山东省', '', 0, 2, NULL, 1, '');

-- ----------------------------
-- Table structure for tb_ruoyi_worker_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_ruoyi_worker_type`;
CREATE TABLE `tb_ruoyi_worker_type`  (
  `worker_id` int NULL DEFAULT NULL COMMENT '用户id',
  `type_id` int NULL DEFAULT NULL COMMENT '工种id'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_ruoyi_worker_type
-- ----------------------------
INSERT INTO `tb_ruoyi_worker_type` VALUES (3575, 3);
INSERT INTO `tb_ruoyi_worker_type` VALUES (6, 3);
INSERT INTO `tb_ruoyi_worker_type` VALUES (2, 3);
INSERT INTO `tb_ruoyi_worker_type` VALUES (2, 2);
INSERT INTO `tb_ruoyi_worker_type` VALUES (5, 5);
INSERT INTO `tb_ruoyi_worker_type` VALUES (1123, 2);
INSERT INTO `tb_ruoyi_worker_type` VALUES (3572, 4);
INSERT INTO `tb_ruoyi_worker_type` VALUES (3573, 2);
INSERT INTO `tb_ruoyi_worker_type` VALUES (3578, 3);
INSERT INTO `tb_ruoyi_worker_type` VALUES (3579, 3);
INSERT INTO `tb_ruoyi_worker_type` VALUES (3579, 2);
INSERT INTO `tb_ruoyi_worker_type` VALUES (11213, 2);
INSERT INTO `tb_ruoyi_worker_type` VALUES (11214, 3);
INSERT INTO `tb_ruoyi_worker_type` VALUES (11216, 3);
INSERT INTO `tb_ruoyi_worker_type` VALUES (7, 2);
INSERT INTO `tb_ruoyi_worker_type` VALUES (4, 1);
INSERT INTO `tb_ruoyi_worker_type` VALUES (3, 2);

-- ----------------------------
-- Table structure for tb_site_info
-- ----------------------------
DROP TABLE IF EXISTS `tb_site_info`;
CREATE TABLE `tb_site_info`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '工地id',
  `company_number` int NOT NULL COMMENT '企业数量',
  `dettled_company_number` int NULL DEFAULT NULL COMMENT '入驻企业数量',
  `engaged_people_number` int NULL DEFAULT NULL COMMENT '从业人数',
  `covered_area` double(7, 2) NULL DEFAULT NULL COMMENT '占地面积',
  `Construction_erea` double(7, 2) NULL DEFAULT NULL COMMENT '建筑面积',
  `Construction_land_erea` double(7, 2) NULL DEFAULT NULL COMMENT '建设用地面积',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '工地概览表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_site_info
-- ----------------------------
INSERT INTO `tb_site_info` VALUES (1, 1789, 1639, 26431, 3200.00, 1700.00, 2430.00);

-- ----------------------------
-- Table structure for tb_survey
-- ----------------------------
DROP TABLE IF EXISTS `tb_survey`;
CREATE TABLE `tb_survey`  (
  `survey_id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `survey_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调查范围',
  `survey_object` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调查对象',
  `survey_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调查人',
  `survey_result` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '调查等级',
  `survey_time` datetime NULL DEFAULT NULL COMMENT '调查时间',
  PRIMARY KEY (`survey_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '满意度检查' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_survey
-- ----------------------------
INSERT INTO `tb_survey` VALUES (4, '1', '强盛集团', '鲁斯', '1', '2023-06-12 00:00:00');
INSERT INTO `tb_survey` VALUES (5, '2', '里斯', '鲁斯', '2', '2023-06-12 00:00:00');
INSERT INTO `tb_survey` VALUES (6, '1', '四方集团', '鲁斯', '1', '2023-06-18 00:00:00');
INSERT INTO `tb_survey` VALUES (7, '1', '阿瓦集团', '鲁斯', '2', '2023-06-14 00:00:00');
INSERT INTO `tb_survey` VALUES (8, '2', '王戈', '鲁斯', '4', '2023-06-18 00:00:00');
INSERT INTO `tb_survey` VALUES (9, '1', '强盛集团', '鲁斯', '1', '2023-06-01 00:00:00');
INSERT INTO `tb_survey` VALUES (10, '2', '里斯', '鲁斯', '2', '2023-06-02 00:00:00');
INSERT INTO `tb_survey` VALUES (11, '1', '四方集团', '鲁斯', '1', '2023-06-03 00:00:00');
INSERT INTO `tb_survey` VALUES (12, '1', '阿瓦集团', '鲁斯', '2', '2023-06-04 00:00:00');
INSERT INTO `tb_survey` VALUES (13, '2', '王戈', '鲁斯', '4', '2023-06-05 00:00:00');

-- ----------------------------
-- Table structure for tb_user_inform_status
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_inform_status`;
CREATE TABLE `tb_user_inform_status`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `inform_id` bigint NULL DEFAULT NULL COMMENT '通知id',
  `inform_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通知标题',
  `user_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `status` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已读状态',
  `time` datetime NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 76 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户通知状态信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_user_inform_status
-- ----------------------------
INSERT INTO `tb_user_inform_status` VALUES (26, 17, '1', 1, 'admin', '若依', '0', '2023-06-11 16:54:59');
INSERT INTO `tb_user_inform_status` VALUES (27, 17, '1', 2, 'ry', '若依', '1', '2023-05-27 16:44:21');
INSERT INTO `tb_user_inform_status` VALUES (28, 17, '1', 3, 'xixixi', '张三', '0', '2023-06-07 11:31:21');
INSERT INTO `tb_user_inform_status` VALUES (29, 17, '1', 4, 'xiaoxiao', '里斯', '1', '2023-05-27 16:44:21');
INSERT INTO `tb_user_inform_status` VALUES (30, 17, '1', 100, 'xiaoc', 'xiaoc', '0', '2023-06-06 09:22:35');
INSERT INTO `tb_user_inform_status` VALUES (31, 18, '21', 1, 'admin', '若依', '0', '2023-06-05 20:17:07');
INSERT INTO `tb_user_inform_status` VALUES (32, 18, '21', 2, 'ry', '若依', '1', '2023-05-28 11:54:30');
INSERT INTO `tb_user_inform_status` VALUES (33, 18, '21', 3, 'xixixi', '张三', '1', '2023-05-28 11:54:30');
INSERT INTO `tb_user_inform_status` VALUES (34, 18, '21', 4, 'xiaoxiao', '里斯', '1', '2023-05-28 11:54:30');
INSERT INTO `tb_user_inform_status` VALUES (35, 18, '21', 100, 'xiaoc', 'xiaoc', '0', '2023-06-06 09:22:24');
INSERT INTO `tb_user_inform_status` VALUES (36, 19, '12', 1, 'admin', '若依', '0', '2023-06-05 20:16:37');
INSERT INTO `tb_user_inform_status` VALUES (37, 19, '12', 2, 'ry', '若依', '1', '2023-05-28 11:56:03');
INSERT INTO `tb_user_inform_status` VALUES (38, 19, '12', 3, 'xixixi', '张三', '1', '2023-05-28 11:56:03');
INSERT INTO `tb_user_inform_status` VALUES (39, 19, '12', 4, 'xiaoxiao', '里斯', '1', '2023-05-28 11:56:03');
INSERT INTO `tb_user_inform_status` VALUES (40, 19, '12', 100, 'xiaoc', 'xiaoc', '1', '2023-05-28 11:56:03');
INSERT INTO `tb_user_inform_status` VALUES (41, 20, '123', 1, 'admin', '若依', '0', '2023-06-06 09:26:38');
INSERT INTO `tb_user_inform_status` VALUES (42, 20, '123', 2, 'ry', '若依', '1', '2023-05-28 12:00:55');
INSERT INTO `tb_user_inform_status` VALUES (43, 20, '123', 3, 'xixixi', '张三', '1', '2023-05-28 12:00:55');
INSERT INTO `tb_user_inform_status` VALUES (44, 20, '123', 4, 'xiaoxiao', '里斯', '1', '2023-05-28 12:00:55');
INSERT INTO `tb_user_inform_status` VALUES (45, 20, '123', 100, 'xiaoc', 'xiaoc', '1', '2023-05-28 12:00:55');
INSERT INTO `tb_user_inform_status` VALUES (46, 21, '1231231', 1, 'admin', '若依', '0', '2023-06-05 20:16:54');
INSERT INTO `tb_user_inform_status` VALUES (47, 21, '1231231', 2, 'ry', '若依', '1', '2023-06-04 16:26:20');
INSERT INTO `tb_user_inform_status` VALUES (48, 21, '1231231', 3, 'xixixi', '张三', '1', '2023-06-04 16:26:20');
INSERT INTO `tb_user_inform_status` VALUES (49, 21, '1231231', 4, 'xiaoxiao', '里斯', '1', '2023-06-04 16:26:20');
INSERT INTO `tb_user_inform_status` VALUES (50, 21, '1231231', 100, 'xiaoc', 'xiaoc', '0', '2023-06-06 09:22:31');
INSERT INTO `tb_user_inform_status` VALUES (51, 21, '1231231', 101, 'xiaocc', 'xiaocc', '1', '2023-06-04 16:26:20');
INSERT INTO `tb_user_inform_status` VALUES (52, 22, '1212121212', 1, 'admin', '若依', '0', '2023-06-06 09:40:35');
INSERT INTO `tb_user_inform_status` VALUES (53, 22, '1212121212', 2, 'ry', '若依', '1', '2023-06-05 18:19:00');
INSERT INTO `tb_user_inform_status` VALUES (54, 22, '1212121212', 3, 'xixixi', '张三', '1', '2023-06-05 18:19:00');
INSERT INTO `tb_user_inform_status` VALUES (55, 22, '1212121212', 4, 'xiaoxiao', '里斯', '1', '2023-06-05 18:19:00');
INSERT INTO `tb_user_inform_status` VALUES (56, 22, '1212121212', 100, 'xiaoc', 'xiaoc', '0', '2023-06-06 09:22:33');
INSERT INTO `tb_user_inform_status` VALUES (57, 22, '1212121212', 101, 'xiaocc', 'xiaocc', '1', '2023-06-05 18:19:00');
INSERT INTO `tb_user_inform_status` VALUES (58, 23, 'zhihui', 1, 'admin', '若依', '0', '2023-06-10 15:37:57');
INSERT INTO `tb_user_inform_status` VALUES (59, 23, 'zhihui', 2, 'ry', '若依', '1', '2023-06-06 09:44:16');
INSERT INTO `tb_user_inform_status` VALUES (60, 23, 'zhihui', 3, 'xixixi', '张三', '1', '2023-06-06 09:44:16');
INSERT INTO `tb_user_inform_status` VALUES (61, 23, 'zhihui', 4, 'xiaoxiao', '里斯', '1', '2023-06-06 09:44:16');
INSERT INTO `tb_user_inform_status` VALUES (62, 23, 'zhihui', 5, 'xiao1', '王五', '1', '2023-06-06 09:44:16');
INSERT INTO `tb_user_inform_status` VALUES (63, 23, 'zhihui', 100, 'xiaoc', 'xiaoc', '1', '2023-06-06 09:44:16');
INSERT INTO `tb_user_inform_status` VALUES (64, 23, 'zhihui', 101, 'xiaocc', 'xiaocc', '1', '2023-06-06 09:44:16');
INSERT INTO `tb_user_inform_status` VALUES (65, 24, '12313', 1, 'admin', '若依', '1', '2023-06-06 15:23:20');
INSERT INTO `tb_user_inform_status` VALUES (66, 24, '12313', 2, 'ry', '若依', '1', '2023-06-06 15:23:20');
INSERT INTO `tb_user_inform_status` VALUES (67, 24, '12313', 3, 'xixixi', '张三', '1', '2023-06-06 15:23:20');
INSERT INTO `tb_user_inform_status` VALUES (68, 24, '12313', 4, 'xiaoxiao', '里斯', '1', '2023-06-06 15:23:20');
INSERT INTO `tb_user_inform_status` VALUES (69, 24, '12313', 5, 'xiao1', '王五', '1', '2023-06-06 15:23:20');
INSERT INTO `tb_user_inform_status` VALUES (70, 24, '12313', 100, 'xiaoc', 'xiaoc', '1', '2023-06-06 15:23:20');
INSERT INTO `tb_user_inform_status` VALUES (71, 24, '12313', 101, 'xiaocc', 'xiaocc', '1', '2023-06-06 15:23:20');
INSERT INTO `tb_user_inform_status` VALUES (72, 25, '321123', 1, 'admin', '若依', '1', '2023-06-10 14:40:33');
INSERT INTO `tb_user_inform_status` VALUES (73, 25, '321123', 2, 'ry', '若依', '1', '2023-06-10 14:40:33');
INSERT INTO `tb_user_inform_status` VALUES (74, 25, '321123', 3, 'xixixi', '张三', '1', '2023-06-10 14:40:33');
INSERT INTO `tb_user_inform_status` VALUES (75, 25, '321123', 4, 'xiaoxiao', '里斯', '1', '2023-06-10 14:40:33');
INSERT INTO `tb_user_inform_status` VALUES (76, 25, '321123', 10, 'xiacoccc', '王五', '1', '2023-06-10 14:40:33');

-- ----------------------------
-- Table structure for tb_video_detail
-- ----------------------------
DROP TABLE IF EXISTS `tb_video_detail`;
CREATE TABLE `tb_video_detail`  (
  `video_id` int NOT NULL AUTO_INCREMENT COMMENT '视频id',
  `video_view_time` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '观看视频时间',
  `progress_bar` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '进度条时间',
  `video_link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '视频链接',
  `done` int UNSIGNED NULL DEFAULT 0 COMMENT '视频看没看完0未看1看完',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `img` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `createTime` datetime NULL DEFAULT NULL,
  `createBy` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`video_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_video_detail
-- ----------------------------
INSERT INTO `tb_video_detail` VALUES (1, '0', '12', 'http://vjs.zencdn.net/v/oceans.mp4', 1, 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.987f582c510be58755c4933cda68d525?rik=C0D21hJDYvXosw&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fwallpaper%2f1305%2f16%2fc4%2f20990657_1368686545122.jpg&ehk=netN2qzcCVS4ALUQfDOwxAwFcy41oxC%2b0xTFvOYy5ds%3d&risl=&pid=ImgRaw&r=0', '技能学习视频1', '2023-06-12 00:00:00', 'admin');
INSERT INTO `tb_video_detail` VALUES (2, '110', '110', 'http://vjs.zencdn.net/v/oceans.mp4', 1, 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.987f582c510be58755c4933cda68d525?rik=C0D21hJDYvXosw&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fwallpaper%2f1305%2f16%2fc4%2f20990657_1368686545122.jpg&ehk=netN2qzcCVS4ALUQfDOwxAwFcy41oxC%2b0xTFvOYy5ds%3d&risl=&pid=ImgRaw&r=0', '技能学习视频2', '2023-06-12 00:00:00', 'admin');
INSERT INTO `tb_video_detail` VALUES (5, NULL, NULL, 'http://vjs.zencdn.net/v/oceans.mp4', 0, 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.987f582c510be58755c4933cda68d525?rik=C0D21hJDYvXosw&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fwallpaper%2f1305%2f16%2fc4%2f20990657_1368686545122.jpg&ehk=netN2qzcCVS4ALUQfDOwxAwFcy41oxC%2b0xTFvOYy5ds%3d&risl=&pid=ImgRaw&r=0', '技能学习视频3', '2023-06-12 00:00:00', 'admin');
INSERT INTO `tb_video_detail` VALUES (6, '80', '80', 'http://vjs.zencdn.net/v/oceans.mp4', 1, 1, 'https://ts1.cn.mm.bing.net/th/id/R-C.987f582c510be58755c4933cda68d525?rik=C0D21hJDYvXosw&riu=http%3a%2f%2fimg.pconline.com.cn%2fimages%2fupload%2fupc%2ftx%2fwallpaper%2f1305%2f16%2fc4%2f20990657_1368686545122.jpg&ehk=netN2qzcCVS4ALUQfDOwxAwFcy41oxC%2b0xTFvOYy5ds%3d&risl=&pid=ImgRaw&r=0', '技能学习视频4', '2023-06-12 00:00:00', 'admin');
INSERT INTO `tb_video_detail` VALUES (9, NULL, NULL, 'https://webtlias.oss-cn-hangzhou.aliyuncs.com/d7e9b90d-e7f0-4a1a-90fd-705e8b7b7065.mp4', 0, 1, 'https://webtlias.oss-cn-hangzhou.aliyuncs.com/e2333936-0f64-4e2f-8c93-d9f98a2dfa7a.jpg', '教学视频1', '2023-06-13 14:45:23', 'admin');

-- ----------------------------
-- Table structure for tb_work_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_work_type`;
CREATE TABLE `tb_work_type`  (
  `work_type_id` int NOT NULL,
  `work_type_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工种名称',
  `work_type_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工种简介',
  PRIMARY KEY (`work_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tb_work_type
-- ----------------------------
INSERT INTO `tb_work_type` VALUES (1, '钢筋工', NULL);
INSERT INTO `tb_work_type` VALUES (2, '水泥工', NULL);
INSERT INTO `tb_work_type` VALUES (3, '瓦工', NULL);
INSERT INTO `tb_work_type` VALUES (4, '壮工', NULL);
INSERT INTO `tb_work_type` VALUES (5, '水电工', NULL);

-- ----------------------------
-- Table structure for user_video_log
-- ----------------------------
DROP TABLE IF EXISTS `user_video_log`;
CREATE TABLE `user_video_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int NOT NULL,
  `videoId` int NOT NULL,
  `lastTime` decimal(8, 5) NULL DEFAULT NULL,
  `allTime` decimal(8, 5) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_video_log
-- ----------------------------
INSERT INTO `user_video_log` VALUES (1, 1, 1, 46.61333, NULL);
INSERT INTO `user_video_log` VALUES (2, 1, 5, 4.44512, NULL);
INSERT INTO `user_video_log` VALUES (3, 10, 9, 12.39467, NULL);

SET FOREIGN_KEY_CHECKS = 1;
