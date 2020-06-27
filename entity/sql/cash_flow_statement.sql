/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50536
 Source Host           : localhost:3306
 Source Schema         : sh_finance

 Target Server Type    : MySQL
 Target Server Version : 50536
 File Encoding         : 65001

 Date: 14/04/2020 21:51:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cash_flow_statement
-- ----------------------------
DROP TABLE IF EXISTS `cash_flow_statement`;
CREATE TABLE `cash_flow_statement`  (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Code` int(11) DEFAULT NULL COMMENT '股票代码-数字型',
  `Code_Str` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '股票代码-字符串型',
  `Report_Period` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '报告期',
  `Indicator_Name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '财务项目指标名称',
  `Indicator_Data` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '财务项目指标数值',
  PRIMARY KEY (`Id`) USING BTREE,
  UNIQUE INDEX `uni_Id_Code`(`Id`, `Code`) USING BTREE,
  INDEX `Id`(`Code`) USING BTREE,
  INDEX `ix_cash_flow_statement_Id`(`Id`) USING BTREE,
  INDEX `ix_cash_flow_statement_Code_Str`(`Code_Str`) USING BTREE,
  INDEX `ix_cash_flow_statement_Code`(`Code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
