/*
 Navicat Premium Data Transfer

 Source Server         : blog
 Source Server Type    : MySQL
 Source Server Version : 50734
 Source Host           : 114.116.1.78:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50734
 File Encoding         : 65001

 Date: 04/07/2021 22:49:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for auth_menus
-- ----------------------------
DROP TABLE IF EXISTS `auth_menus`;
CREATE TABLE `auth_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单代码',
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '父节点ID',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '节点类型 1文件夹 2页面 3按钮',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'icon地址',
  `sort` int(11) NOT NULL DEFAULT 9999 COMMENT '排序号',
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面地址',
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '等级',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '树ID的路径 从根节点到当前树的父节点的路径 逗号分隔',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permits
-- ----------------------------
DROP TABLE IF EXISTS `auth_permits`;
CREATE TABLE `auth_permits`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限代码 add-添加 delete-删除 get-查询 edit-编辑 ...',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_role_menus
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_menus`;
CREATE TABLE `auth_role_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `auth_role_id` int(11) NULL DEFAULT NULL,
  `auth_menu_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `auth_role_menus_AuthMenuId_AuthRoleId_unique`(`auth_role_id`, `auth_menu_id`) USING BTREE,
  INDEX `auth_menu_id`(`auth_menu_id`) USING BTREE,
  CONSTRAINT `auth_role_menus_ibfk_1` FOREIGN KEY (`auth_role_id`) REFERENCES `auth_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_role_menus_ibfk_2` FOREIGN KEY (`auth_menu_id`) REFERENCES `auth_menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_role_permits
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_permits`;
CREATE TABLE `auth_role_permits`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL COMMENT '状态',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `auth_role_id` int(11) NULL DEFAULT NULL,
  `auth_permit_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `auth_role_permits_AuthPermitId_AuthRoleId_unique`(`auth_role_id`, `auth_permit_id`) USING BTREE,
  INDEX `auth_permit_id`(`auth_permit_id`) USING BTREE,
  CONSTRAINT `auth_role_permits_ibfk_1` FOREIGN KEY (`auth_role_id`) REFERENCES `auth_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_role_permits_ibfk_2` FOREIGN KEY (`auth_permit_id`) REFERENCES `auth_permits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_roles
-- ----------------------------
DROP TABLE IF EXISTS `auth_roles`;
CREATE TABLE `auth_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色代码',
  `sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '9999' COMMENT '排序代码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色类型',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auths
-- ----------------------------
DROP TABLE IF EXISTS `auths`;
CREATE TABLE `auths`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方登录类型 github gitlab google microsoft qq wechart weibo',
  `openid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '第三方 uid openid 等',
  `unionid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ/微信同一主体下 Unionid 相同',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `auths_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_categories
-- ----------------------------
DROP TABLE IF EXISTS `blog_categories`;
CREATE TABLE `blog_categories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类类型',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `blog_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `blog_id`(`blog_id`) USING BTREE,
  CONSTRAINT `blog_categories_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blog_comments
-- ----------------------------
DROP TABLE IF EXISTS `blog_comments`;
CREATE TABLE `blog_comments`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `fid` int(11) NOT NULL DEFAULT 0 COMMENT '被回复评论ID 0-仅为评论',
  `love` int(11) NOT NULL DEFAULT 0 COMMENT '评论点赞数',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论内容',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `blog_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `blog_id`(`blog_id`) USING BTREE,
  CONSTRAINT `blog_comments_ibfk_1` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for blogs
-- ----------------------------
DROP TABLE IF EXISTS `blogs`;
CREATE TABLE `blogs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `views` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '浏览量',
  `collection` int(11) NOT NULL DEFAULT 0 COMMENT '收藏量',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签',
  `topic` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收录专栏',
  `cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '封面URL',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '摘要',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `blogs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `fid` int(11) NOT NULL DEFAULT 0 COMMENT '被回复消息ID 0-仅为消息',
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息等级',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息类型 0-系统 1-用户 2-其他',
  `range` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息范围 0-全平台 x,x-指定用户ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '消息内容',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_api_logs
-- ----------------------------
DROP TABLE IF EXISTS `system_api_logs`;
CREATE TABLE `system_api_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `method` enum('post','get','delete','put','head','connect','options','trace','patch') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求类型',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '模块(菜单ID)',
  `controller` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '控制器',
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '方法',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '请求URL',
  `get_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'get参数',
  `post_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT 'post参数',
  `error_code` int(11) NULL DEFAULT NULL COMMENT '状态码',
  `error_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报错信息',
  `error_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '报错日志',
  `req_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '对外IP',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_dictionaries
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionaries`;
CREATE TABLE `system_dictionaries`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典编码',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典中文名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典备注',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `system_dictionary_type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `system_dictionary_type_id`(`system_dictionary_type_id`) USING BTREE,
  CONSTRAINT `system_dictionaries_ibfk_1` FOREIGN KEY (`system_dictionary_type_id`) REFERENCES `system_dictionary_types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_dictionary_types
-- ----------------------------
DROP TABLE IF EXISTS `system_dictionary_types`;
CREATE TABLE `system_dictionary_types`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型中文名称',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '字典类型备注',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_feedbacks
-- ----------------------------
DROP TABLE IF EXISTS `system_feedbacks`;
CREATE TABLE `system_feedbacks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '反馈层级',
  `fid` int(11) NOT NULL DEFAULT 0 COMMENT '被回复反馈ID 0-仅为反馈',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '反馈类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '反馈标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '反馈内容',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '反馈IP',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for system_logs
-- ----------------------------
DROP TABLE IF EXISTS `system_logs`;
CREATE TABLE `system_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `tag` enum('unknow','login','info','admin','cron','manual') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志标签',
  `level` enum('info','warning','error','critical','exception','debug') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日志等级',
  `type` int(11) NOT NULL COMMENT '日志类型 0-系统日志 1-用户日志',
  `message` int(11) NOT NULL COMMENT '日志内容',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for systems
-- ----------------------------
DROP TABLE IF EXISTS `systems`;
CREATE TABLE `systems`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '配置键',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配置值',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_behaviors
-- ----------------------------
DROP TABLE IF EXISTS `user_behaviors`;
CREATE TABLE `user_behaviors`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态 0-未启用',
  `object_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联对象类型',
  `object_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '关联对象号',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行为类型',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '行为数值',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '行为说明',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_behaviors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_educations
-- ----------------------------
DROP TABLE IF EXISTS `user_educations`;
CREATE TABLE `user_educations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `current` tinyint(1) NULL DEFAULT NULL COMMENT '当前状态',
  `school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校',
  `degree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学位',
  `field_of_study` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '研究领域',
  `from` datetime(0) NULL DEFAULT NULL COMMENT '入学时间',
  `to` datetime(0) NULL DEFAULT NULL COMMENT '毕业时间',
  `description` tinyint(1) NULL DEFAULT NULL COMMENT '工作描述',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_educations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_experiences
-- ----------------------------
DROP TABLE IF EXISTS `user_experiences`;
CREATE TABLE `user_experiences`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `current` tinyint(1) NULL DEFAULT NULL COMMENT '当前工作状态',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称',
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司地址',
  `from` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `to` datetime(0) NULL DEFAULT NULL COMMENT '离职时间',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '工作描述',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_experiences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_focus
-- ----------------------------
DROP TABLE IF EXISTS `user_focus`;
CREATE TABLE `user_focus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `focus_id` int(11) NOT NULL COMMENT '关注人ID',
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '关注类型 0-一般关注 1-特别关注',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_focus_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_histories
-- ----------------------------
DROP TABLE IF EXISTS `user_histories`;
CREATE TABLE `user_histories`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `blog_id` int(11) NOT NULL COMMENT '文章ID',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_histories_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_infos
-- ----------------------------
DROP TABLE IF EXISTS `user_infos`;
CREATE TABLE `user_infos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `birthday` datetime(0) NULL DEFAULT NULL COMMENT '生日',
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出生地址',
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公司',
  `post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '职位',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人介绍',
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人站点',
  `skills` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '技能',
  `bio` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个人签名',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_infos_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_login_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_login_logs`;
CREATE TABLE `user_login_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录浏览器',
  `resolution` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录屏幕分辨率',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录IP',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_login_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_operate_logs
-- ----------------------------
DROP TABLE IF EXISTS `user_operate_logs`;
CREATE TABLE `user_operate_logs`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作类型(如增删改查,可放到字典表)',
  `module` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作模块(关联的是菜单表编号)',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作内容(越具体越好,比如:修改前后)',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作IP',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_operate_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_permits
-- ----------------------------
DROP TABLE IF EXISTS `user_permits`;
CREATE TABLE `user_permits`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '状态 0-未启用',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  `auth_permit_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `user_permits_AuthPermitId_UserId_unique`(`user_id`, `auth_permit_id`) USING BTREE,
  INDEX `auth_permit_id`(`auth_permit_id`) USING BTREE,
  CONSTRAINT `user_permits_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_permits_ibfk_2` FOREIGN KEY (`auth_permit_id`) REFERENCES `auth_permits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_properties
-- ----------------------------
DROP TABLE IF EXISTS `user_properties`;
CREATE TABLE `user_properties`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性名',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '属性值',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `user_properties_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_roles
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `user_id` int(11) NULL DEFAULT NULL,
  `auth_role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `user_roles_AuthRoleId_UserId_unique`(`user_id`, `auth_role_id`) USING BTREE,
  INDEX `auth_role_id`(`auth_role_id`) USING BTREE,
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`auth_role_id`) REFERENCES `auth_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uuid用户唯一标识',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '状态 0-未启用',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号代号',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '账号类型 0-管理员 1-一般用户(注册但未认证) 2-会员(认证通过) 3-VIP(付费用户)',
  `level` int(11) NOT NULL DEFAULT 0 COMMENT '账号等级',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码盐值',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `last_login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0.0.0.0' COMMENT '最后登录IP',
  `is_delete` int(11) NULL DEFAULT 0 COMMENT '软删除 1-已删除 0-未删除',
  `revision` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '乐观锁',
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `uuid`(`uuid`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
