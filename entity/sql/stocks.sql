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

 Date: 14/04/2020 21:51:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for stocks
-- ----------------------------
DROP TABLE IF EXISTS `stocks`;
CREATE TABLE `stocks`  (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` int(11) DEFAULT NULL,
  `codeStr` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `market` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `market_type` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uni_id_code`(`id`, `code`) USING BTREE,
  INDEX `ix_stocks_id`(`id`) USING BTREE,
  INDEX `id`(`code`) USING BTREE,
  INDEX `ix_stocks_code`(`code`) USING BTREE,
  INDEX `ix_stocks_codeStr`(`codeStr`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
