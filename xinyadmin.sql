/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : xinyadmin

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2018-08-28 13:52:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for xman_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `xman_admin_user`;
CREATE TABLE `xman_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户账号',
  `password` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `nickname` varchar(255) NOT NULL DEFAULT '' COMMENT '昵称',
  `register_time` datetime NOT NULL DEFAULT '1990-10-10 00:00:00',
  `age` tinyint(3) NOT NULL DEFAULT '0',
  `birthday` date NOT NULL DEFAULT '1990-10-10',
  `sex` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1:男,0:女',
  `isdel` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:被删除 1 未被删除',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '预留字段',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_admin_user
-- ----------------------------
INSERT INTO `xman_admin_user` VALUES ('2', 'admin11', '$2y$10$/keh96G2clMxlNIOvPKaFOHxRSOORu8kEw.Tb81sld6oZtAlXDhvG', '176124388881', '123@qq.com1', 'Admin', '1990-10-10 00:00:00', '0', '1990-10-16', '1', '0', '1');
INSERT INTO `xman_admin_user` VALUES ('16', 'testdemo1', '$2y$10$/keh96G2clMxlNIOvPKaFOHxRSOORu8kEw.Tb81sld6oZtAlXDhvG', '17612312', '123123', '测试账号', '1990-10-10 00:00:00', '0', '2018-06-11', '1', '0', '1');
INSERT INTO `xman_admin_user` VALUES ('17', 'testdemo', '$2y$10$/keh96G2clMxlNIOvPKaFOHxRSOORu8kEw.Tb81sld6oZtAlXDhvG', '18812345678', 'i@xiny9.com', 'TestUser', '1990-10-10 00:00:00', '0', '2018-07-10', '1', '0', '1');

-- ----------------------------
-- Table structure for xman_article
-- ----------------------------
DROP TABLE IF EXISTS `xman_article`;
CREATE TABLE `xman_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT '文章名',
  `author` varchar(255) NOT NULL COMMENT '作者',
  `content` text NOT NULL COMMENT '内容',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  `show_switch` tinyint(1) NOT NULL DEFAULT '1' COMMENT '展示:1=展示,0=隐藏',
  `like` int(11) DEFAULT '0' COMMENT '点赞数量',
  `category` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0' COMMENT '分类:0=娱乐,1=政治,2=新闻,3=历史,4=野史,5=杂谈',
  `description` text NOT NULL COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_article
-- ----------------------------
INSERT INTO `xman_article` VALUES ('5', '测试文章', 'Xiny', '&lt;p&gt;&lt;img src=&quot;http://127.0.0.24/Public/static/layui/images/face/12.gif&quot; alt=&quot;[泪]&quot;&gt;&lt;img src=&quot;http://127.0.0.24/Public/static/layui/images/face/1.gif&quot; alt=&quot;[嘻嘻]&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;i&gt;sadfsafsadfsdaf&lt;/i&gt;&lt;/p&gt;&lt;p&gt;&lt;i&gt;&lt;u&gt;asdfasfsasdf&lt;/u&gt;&lt;/i&gt;&lt;/p&gt;&lt;p&gt;&lt;i&gt;&lt;u&gt;&lt;strike&gt;asdfsadfsad&lt;/strike&gt;&lt;/u&gt;&lt;/i&gt;&lt;/p&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.baidu.com&quot; style=&quot;&quot;&gt;http://www.baidu.com&lt;/a&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;asfsadfdsafdsd&lt;img src=&quot;/Public/Uploads/img/20180724/5b573b6f42ea9.jpg&quot; alt=&quot;sss.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;i&gt;&lt;u&gt;&lt;strike&gt;&lt;br&gt;&lt;/strike&gt;&lt;/u&gt;&lt;/i&gt;&lt;/p&gt;', '2018-07-24 22:45:10', '1', '123123', '0', '12');
INSERT INTO `xman_article` VALUES ('6', '12312', '123123', '123123', '2018-07-21 00:00:00', '1', '123', '2', '12312313');

-- ----------------------------
-- Table structure for xman_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `xman_auth_group`;
CREATE TABLE `xman_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `description` varchar(500) NOT NULL DEFAULT '' COMMENT '角色描述',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(2048) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xman_auth_group
-- ----------------------------
INSERT INTO `xman_auth_group` VALUES ('1', '超级管理员', '拥有所有权限', '1', '16,29,11,12,63,64,65,66,67,68,17,1,2,5,6,10,18,41,42,43,32,37,38,39,40,19,44,45,46,47,48,50,31,20,21,124,125,126,127,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151');
INSERT INTO `xman_auth_group` VALUES ('4', '测试用组', '测试组织', '1', '27,15,16,31,20,21,28,22,23,29,11,12,13,14');
INSERT INTO `xman_auth_group` VALUES ('5', 'testdemo', '展示所用角色组', '1', '27,16,31,20,21,28,22,23,29,11,12,63,64,65,66,67,68,13,14,17,1,18,32,19,47,48,30,24,25,26,79,80,81,82,87,88,89,90');

-- ----------------------------
-- Table structure for xman_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `xman_auth_group_access`;
CREATE TABLE `xman_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xman_auth_group_access
-- ----------------------------
INSERT INTO `xman_auth_group_access` VALUES ('1', '1');
INSERT INTO `xman_auth_group_access` VALUES ('2', '1');
INSERT INTO `xman_auth_group_access` VALUES ('15', '1');
INSERT INTO `xman_auth_group_access` VALUES ('16', '4');
INSERT INTO `xman_auth_group_access` VALUES ('17', '5');
INSERT INTO `xman_auth_group_access` VALUES ('18', '1');
INSERT INTO `xman_auth_group_access` VALUES ('19', '1');

-- ----------------------------
-- Table structure for xman_auth_menus
-- ----------------------------
DROP TABLE IF EXISTS `xman_auth_menus`;
CREATE TABLE `xman_auth_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '菜单名字',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '0父级菜单',
  `rule_id` int(11) NOT NULL DEFAULT '0' COMMENT '绑定的规则id url',
  `icon` varchar(255) NOT NULL DEFAULT 'iconfont icon-menu1' COMMENT '菜单图标',
  `target` varchar(255) NOT NULL DEFAULT '' COMMENT '打开位置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_auth_menus
-- ----------------------------
INSERT INTO `xman_auth_menus` VALUES ('1', '系统设置', '0', '29', 'iconfont xman-setting', 'default');
INSERT INTO `xman_auth_menus` VALUES ('3', '内容管理', '0', '27', 'iconfont xman-menu', 'default');
INSERT INTO `xman_auth_menus` VALUES ('5', '系统基本参数', '1', '11', 'iconfont xman-setting-fill', 'default');
INSERT INTO `xman_auth_menus` VALUES ('6', '规则管理', '19', '1', 'layui-icon layui-icon-align-center', 'default');
INSERT INTO `xman_auth_menus` VALUES ('7', '角色组管理', '19', '32', 'layui-icon layui-icon-user', 'default');
INSERT INTO `xman_auth_menus` VALUES ('8', '后台用户管理', '19', '18', 'layui-icon layui-icon-username', 'default');
INSERT INTO `xman_auth_menus` VALUES ('9', '文章列表', '3', '124', 'iconfont xman-file-text', 'default');
INSERT INTO `xman_auth_menus` VALUES ('10', '图片管理', '3', '16', 'iconfont xman-image-fill', 'default');
INSERT INTO `xman_auth_menus` VALUES ('11', '用户管理', '3', '132', 'iconfont xman-user', 'default');
INSERT INTO `xman_auth_menus` VALUES ('12', '登录', '33', '21', 'iconfont xman-login', '_blank');
INSERT INTO `xman_auth_menus` VALUES ('13', '404页面', '33', '20', 'layui-icon layui-icon-404', 'default');
INSERT INTO `xman_auth_menus` VALUES ('18', '菜单管理', '1', '19', 'iconfont xman-menu', 'default');
INSERT INTO `xman_auth_menus` VALUES ('19', '权限管理', '1', '32', 'layui-icon layui-icon-password', 'default');
INSERT INTO `xman_auth_menus` VALUES ('20', '系统日志', '1', '12', 'layui-icon layui-icon-tabs', 'default');
INSERT INTO `xman_auth_menus` VALUES ('28', '测试控制器', '1', '140', 'iconfont xman-menu', 'default');
INSERT INTO `xman_auth_menus` VALUES ('29', '代码生成器', '1', '48', 'iconfont xman-android', 'default');
INSERT INTO `xman_auth_menus` VALUES ('30', '错误日志', '20', '63', 'layui-icon layui-icon-tabs', 'default');
INSERT INTO `xman_auth_menus` VALUES ('31', '登录日志', '20', '65', 'layui-icon layui-icon-log', 'default');
INSERT INTO `xman_auth_menus` VALUES ('32', '操作日志', '20', '67', 'iconfont xman-folder-open', 'default');
INSERT INTO `xman_auth_menus` VALUES ('33', '其他页面', '3', '31', 'layui-icon layui-icon-template-1', '_blank');
INSERT INTO `xman_auth_menus` VALUES ('34', '更新日志', '1', '136', 'iconfont xman-menu', 'default');
INSERT INTO `xman_auth_menus` VALUES ('35', '皮肤管理', '1', '144', 'iconfont xman-skin', 'default');
INSERT INTO `xman_auth_menus` VALUES ('36', '分类管理', '1', '148', 'layui-icon layui-icon-camera', 'default');
INSERT INTO `xman_auth_menus` VALUES ('37', '点赞', '1', '151', 'iconfont xman-like', '_blank');
INSERT INTO `xman_auth_menus` VALUES ('38', '点赞', '3', '151', 'iconfont xman-like-fill', 'default');

-- ----------------------------
-- Table structure for xman_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `xman_auth_rule`;
CREATE TABLE `xman_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否支持表达式 1支持',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '表达式',
  `is_url` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0：不是url 1：url',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '父级权限',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xman_auth_rule
-- ----------------------------
INSERT INTO `xman_auth_rule` VALUES ('1', 'admin/auth/rule', '规则管理', '1', '1', '', '1', '17');
INSERT INTO `xman_auth_rule` VALUES ('2', 'admin/auth/add_rule', '添加规则', '1', '1', '', '0', '1');
INSERT INTO `xman_auth_rule` VALUES ('5', 'admin/auth/fast_change_rule', '快速更改规则状态', '1', '1', '', '0', '1');
INSERT INTO `xman_auth_rule` VALUES ('6', 'admin/auth/edit_rule', '修改规则', '1', '1', '', '0', '1');
INSERT INTO `xman_auth_rule` VALUES ('10', 'admin/auth/del_rule', '删除规则', '1', '1', '', '0', '1');
INSERT INTO `xman_auth_rule` VALUES ('11', 'public/static/page/systemsetting/basicparameter.html', '系统参数', '1', '1', '', '1', '29');
INSERT INTO `xman_auth_rule` VALUES ('12', 'system_log', '系统日志', '1', '1', '', '0', '29');
INSERT INTO `xman_auth_rule` VALUES ('16', 'public/static/page/img/images.html', '图片管理', '1', '1', '', '1', '27');
INSERT INTO `xman_auth_rule` VALUES ('17', 'auth', '权限管理', '1', '1', '', '0', '29');
INSERT INTO `xman_auth_rule` VALUES ('18', 'admin/auth/admin_user', '用户管理', '1', '1', '', '1', '17');
INSERT INTO `xman_auth_rule` VALUES ('19', 'admin/auth/menus', '菜单管理', '1', '1', '', '1', '29');
INSERT INTO `xman_auth_rule` VALUES ('20', 'public/static/page/404.html', '404页面', '1', '1', '', '1', '31');
INSERT INTO `xman_auth_rule` VALUES ('21', 'admin/login/index', '登录页面', '1', '1', '', '1', '31');
INSERT INTO `xman_auth_rule` VALUES ('27', 'content', '内容管理', '1', '1', '', '0', '0');
INSERT INTO `xman_auth_rule` VALUES ('29', 'system', '系统设置', '1', '1', '', '0', '0');
INSERT INTO `xman_auth_rule` VALUES ('31', 'otherpages', '其他页面', '1', '1', '', '0', '27');
INSERT INTO `xman_auth_rule` VALUES ('32', 'admin/auth/group', '角色组管理', '1', '1', '', '1', '17');
INSERT INTO `xman_auth_rule` VALUES ('37', 'admin/auth/add_group', '添加角色组', '1', '1', '', '0', '32');
INSERT INTO `xman_auth_rule` VALUES ('38', 'admin/auth/edit_group', '修改角色组', '1', '1', '', '0', '32');
INSERT INTO `xman_auth_rule` VALUES ('39', 'admin/auth/del_group', '删除角色组', '1', '1', '', '0', '32');
INSERT INTO `xman_auth_rule` VALUES ('40', 'admin/auth/fast_change_group', '快速修改角色组', '1', '1', '', '0', '32');
INSERT INTO `xman_auth_rule` VALUES ('41', 'admin/auth/add_admin', '添加后台用户', '1', '1', '', '0', '18');
INSERT INTO `xman_auth_rule` VALUES ('42', 'admin/auth/edit_admin', '修改后台用户', '1', '1', '', '0', '18');
INSERT INTO `xman_auth_rule` VALUES ('43', 'admin/auth/del_admin', '删除后台用户', '1', '1', '', '0', '18');
INSERT INTO `xman_auth_rule` VALUES ('44', 'admin/auth/add_menu', '添加菜单', '1', '1', '', '0', '19');
INSERT INTO `xman_auth_rule` VALUES ('45', 'admin/auth/edit_menu', '修改菜单', '1', '1', '', '0', '19');
INSERT INTO `xman_auth_rule` VALUES ('46', 'admin/auth/del_menu', '删除菜单', '1', '1', '', '0', '19');
INSERT INTO `xman_auth_rule` VALUES ('47', 'admin/auth/change_menu_sort', '菜单排序', '1', '1', '', '0', '19');
INSERT INTO `xman_auth_rule` VALUES ('48', 'admin/makecode/index', '代码生成器', '1', '1', '', '1', '29');
INSERT INTO `xman_auth_rule` VALUES ('50', 'admin/makecode/make', '生成代码', '1', '1', '', '1', '48');
INSERT INTO `xman_auth_rule` VALUES ('63', 'admin/systemerrorlog/index', '错误日志', '1', '1', '', '1', '12');
INSERT INTO `xman_auth_rule` VALUES ('64', 'admin/systemerrorlog/delete', '删除错误日志', '1', '1', '', '0', '63');
INSERT INTO `xman_auth_rule` VALUES ('65', 'admin/systemloginlog/index', '登录日志', '1', '1', '', '1', '12');
INSERT INTO `xman_auth_rule` VALUES ('66', 'admin/systemloginlog/delete', '删除登录日志', '1', '1', '', '0', '65');
INSERT INTO `xman_auth_rule` VALUES ('67', 'admin/systemoperationlog/index', '操作日志', '1', '1', '', '1', '12');
INSERT INTO `xman_auth_rule` VALUES ('68', 'admin/systemoperationlog/delete', '删除操作日志', '1', '1', '', '0', '67');
INSERT INTO `xman_auth_rule` VALUES ('124', 'admin/article/index', 'Article/index', '1', '1', '', '0', '0');
INSERT INTO `xman_auth_rule` VALUES ('125', 'admin/article/add', 'Article/add', '1', '1', '', '0', '124');
INSERT INTO `xman_auth_rule` VALUES ('126', 'admin/article/edit', 'Article/edit', '1', '1', '', '0', '124');
INSERT INTO `xman_auth_rule` VALUES ('127', 'admin/article/delete', 'Article/delete', '1', '1', '', '0', '124');
INSERT INTO `xman_auth_rule` VALUES ('132', 'admin/user/index', 'User/index', '1', '1', '', '1', '0');
INSERT INTO `xman_auth_rule` VALUES ('133', 'admin/user/add', 'User/add', '1', '1', '', '0', '132');
INSERT INTO `xman_auth_rule` VALUES ('134', 'admin/user/edit', 'User/edit', '1', '1', '', '0', '132');
INSERT INTO `xman_auth_rule` VALUES ('135', 'admin/user/delete', 'User/delete', '1', '1', '', '0', '132');
INSERT INTO `xman_auth_rule` VALUES ('136', 'admin/updatelog/index', 'Updatelog/index', '1', '1', '', '1', '0');
INSERT INTO `xman_auth_rule` VALUES ('137', 'admin/updatelog/add', 'Updatelog/add', '1', '1', '', '0', '136');
INSERT INTO `xman_auth_rule` VALUES ('138', 'admin/updatelog/edit', 'Updatelog/edit', '1', '1', '', '0', '136');
INSERT INTO `xman_auth_rule` VALUES ('139', 'admin/updatelog/delete', 'Updatelog/delete', '1', '1', '', '0', '136');
INSERT INTO `xman_auth_rule` VALUES ('140', 'admin/test/index', 'Test/index', '1', '1', '', '1', '0');
INSERT INTO `xman_auth_rule` VALUES ('141', 'admin/test/add', 'Test/add', '1', '1', '', '0', '140');
INSERT INTO `xman_auth_rule` VALUES ('142', 'admin/test/edit', 'Test/edit', '1', '1', '', '0', '140');
INSERT INTO `xman_auth_rule` VALUES ('143', 'admin/test/delete', 'Test/delete', '1', '1', '', '0', '140');
INSERT INTO `xman_auth_rule` VALUES ('144', 'admin/systemskin/index', 'Systemskin/index', '1', '1', '', '1', '0');
INSERT INTO `xman_auth_rule` VALUES ('145', 'admin/systemskin/add', 'Systemskin/add', '1', '1', '', '0', '144');
INSERT INTO `xman_auth_rule` VALUES ('146', 'admin/systemskin/edit', 'Systemskin/edit', '1', '1', '', '0', '144');
INSERT INTO `xman_auth_rule` VALUES ('147', 'admin/systemskin/delete', 'Systemskin/delete', '1', '1', '', '0', '144');
INSERT INTO `xman_auth_rule` VALUES ('148', 'admin/catetest/index', 'Catetest/index', '1', '1', '', '1', '0');
INSERT INTO `xman_auth_rule` VALUES ('149', 'admin/catetest/add', 'Catetest/add', '1', '1', '', '0', '148');
INSERT INTO `xman_auth_rule` VALUES ('150', 'admin/catetest/edit', 'Catetest/edit1', '1', '1', '', '0', '148');
INSERT INTO `xman_auth_rule` VALUES ('151', 'https://fly.layui.com/case/u/8917272', '点赞', '1', '1', '', '1', '0');

-- ----------------------------
-- Table structure for xman_catetest
-- ----------------------------
DROP TABLE IF EXISTS `xman_catetest`;
CREATE TABLE `xman_catetest` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '分类名字',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `content` text NOT NULL COMMENT '描述',
  `state` enum('0','1') DEFAULT '0' COMMENT '状态:0=停用,1=可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_catetest
-- ----------------------------
INSERT INTO `xman_catetest` VALUES ('1', '123', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180820/5b7a2bfb13baa.jpg', '123123', '1');

-- ----------------------------
-- Table structure for xman_system_error_log
-- ----------------------------
DROP TABLE IF EXISTS `xman_system_error_log`;
CREATE TABLE `xman_system_error_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `file` varchar(255) NOT NULL COMMENT '所在文件',
  `line` varchar(255) NOT NULL COMMENT '所在行',
  `code` varchar(255) NOT NULL COMMENT '错误码',
  `message` varchar(1024) NOT NULL COMMENT '错误信息',
  `trace` text NOT NULL COMMENT 'trace信息',
  `createtime` datetime NOT NULL COMMENT '发生时间',
  `admin_user_id` int(11) DEFAULT NULL COMMENT '管理员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_system_error_log
-- ----------------------------
INSERT INTO `xman_system_error_log` VALUES ('1', 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rr\' for key \'test\'\n [ SQL语句 ] : INSERT INTO `xman_test` (`week`,`genderdata`,`content`,`image`,`attachfile`,`keywords`,`price`,`startdate`,`activitytime`,`year`,`times`,`ttswitch`,`teststate`) VALUES (\'monday\',\'male\',\'4rr\',\'/Public/Uploads/img/20180722/5b5362a369b95.png\',\'/Public/Uploads/file/20180722/5b5362a915268.png\',\'4rr\',\'0\',\'2018-07-22\',\'2018-07-22 00:43:27\',\'2018\',\'00:43:30\',\'1\',\'1,2\')', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(824): Think\\Db\\Driver->execute(\'INSERT INTO `xm...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(320): Think\\Db\\Driver->insert(Array, Array, false)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Admin\\Controller\\TestController.class.php(58): Think\\Model->add(Array)\n#5 [internal function]: Admin\\Controller\\TestController->add()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'add\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-22 01:10:13', '2');
INSERT INTO `xman_system_error_log` VALUES ('2', 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rr\' for key \'test\'\n [ SQL语句 ] : INSERT INTO `xman_test` (`week`,`genderdata`,`content`,`image`,`attachfile`,`keywords`,`price`,`startdate`,`activitytime`,`year`,`times`,`ttswitch`,`teststate`) VALUES (\'monday\',\'male\',\'4rr\',\'/Public/Uploads/img/20180722/5b5362a369b95.png\',\'/Public/Uploads/file/20180722/5b5362a915268.png\',\'4rr\',\'0\',\'2018-07-22\',\'2018-07-22 00:43:27\',\'2018\',\'00:43:30\',\'1\',\'1,2\')', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(824): Think\\Db\\Driver->execute(\'INSERT INTO `xm...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(320): Think\\Db\\Driver->insert(Array, Array, false)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Admin\\Controller\\TestController.class.php(58): Think\\Model->add(Array)\n#5 [internal function]: Admin\\Controller\\TestController->add()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'add\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-22 01:10:46', '2');
INSERT INTO `xman_system_error_log` VALUES ('3', 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rr\' for key \'test\'\n [ SQL语句 ] : UPDATE `xman_test` SET `week`=\'tuesday\',`genderdata`=\'female\',`content`=\'ttr\',`image`=\'/Public/Uploads/img/20180722/5b536cc910311.png\',`attachfile`=\'/Public/Uploads/file/20180722/5b536ccd6ecf0.sql\',`keywords`=\'4rr\',`price`=\'0\',`startdate`=\'2018-07-22\',`activitytime`=\'2018-07-22 01:26:43\',`year`=\'2018\',`times`=\'01:26:47\',`ttswitch`=\'1\',`teststate`=\'2,3\' WHERE `id` = 29', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(906): Think\\Db\\Driver->execute(\'UPDATE `xman_te...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(451): Think\\Db\\Driver->update(Array, Array)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Admin\\Controller\\TestController.class.php(84): Think\\Model->save(Array)\n#5 [internal function]: Admin\\Controller\\TestController->edit()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'edit\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-22 01:27:02', '2');
INSERT INTO `xman_system_error_log` VALUES ('4', 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1292:Incorrect date value: \'\' for column \'startdate\' at row 1\n [ SQL语句 ] : INSERT INTO `xman_test` (`week`,`genderdata`,`content`,`image`,`attachfile`,`keywords`,`price`,`startdate`,`activitytime`,`year`,`times`,`ttswitch`,`teststate`) VALUES (\'monday\',\'male\',\'rr\',\'/Public/Uploads/img/20180722/5b536d520602f.png\',\'/Public/Uploads/file/20180722/5b536d56cfd7e.png\',\'rr\',\'0\',\'\',\'\',\'\',\'\',\'0\',\'1\')', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1292:Incorrect ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(824): Think\\Db\\Driver->execute(\'INSERT INTO `xm...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(320): Think\\Db\\Driver->insert(Array, Array, false)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Admin\\Controller\\TestController.class.php(59): Think\\Model->add(Array)\n#5 [internal function]: Admin\\Controller\\TestController->add()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'add\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-22 01:28:58', '2');
INSERT INTO `xman_system_error_log` VALUES ('5', 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rr\' for key \'test\'\n [ SQL语句 ] : UPDATE `xman_test` SET `week`=\'monday\',`genderdata`=\'male\',`content`=\'4rr\',`image`=\'/Public/Uploads/img/20180722/5b547b4ce5e7f.jpg\',`attachfile`=\'/Public/Uploads/file/20180722/5b547b4fc23ab.jpg\',`keywords`=\'4rr\',`price`=\'0\',`startdate`=\'2018-07-22\',`activitytime`=\'2018-07-22 20:40:52\',`year`=\'2018\',`times`=\'20:40:55\',`switch`=\'1\',`ttswitch`=\'1\',`teststate`=\'1,2,3\',`test2state`=\'0,1,2\' WHERE `id` = 35', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(906): Think\\Db\\Driver->execute(\'UPDATE `xman_te...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(451): Think\\Db\\Driver->update(Array, Array)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Admin\\Controller\\TestController.class.php(84): Think\\Model->save(Array)\n#5 [internal function]: Admin\\Controller\\TestController->edit()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'edit\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-22 20:41:51', '2');
INSERT INTO `xman_system_error_log` VALUES ('6', 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rr\' for key \'test\'\n [ SQL语句 ] : UPDATE `xman_test` SET `week`=\'monday\',`genderdata`=\'female\',`content`=\'testss\',`image`=\'/Public/Uploads/img/20180723/5b55321666936.jpg\',`attachfile`=\'/Public/Uploads/file/20180723/5b5532197d9ea.jpg\',`keywords`=\'4rr\',`price`=\'0\',`startdate`=\'2018-07-23\',`activitytime`=\'2018-07-23 09:40:47\',`year`=\'2018\',`times`=\'09:40:50\',`switch`=\'0\',`ttswitch`=\'1\',`teststate`=\'1,2\',`test2state`=\'0,1\' WHERE `id` = 33', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(906): Think\\Db\\Driver->execute(\'UPDATE `xman_te...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(451): Think\\Db\\Driver->update(Array, Array)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Common\\Controller\\MakeController.class.php(110): Think\\Model->save(Array)\n#5 [internal function]: Admin\\Controller\\TestController->edit()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'edit\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-23 09:41:17', '2');
INSERT INTO `xman_system_error_log` VALUES ('7', 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rrs\' for key \'test\'\n [ SQL语句 ] : UPDATE `xman_test` SET `week`=\'monday\',`genderdata`=\'female\',`content`=\'testss\',`image`=\'/Public/Uploads/img/20180723/5b55321666936.jpg\',`attachfile`=\'/Public/Uploads/file/20180723/5b5532197d9ea.jpg\',`keywords`=\'4rrs\',`price`=\'0\',`startdate`=\'2018-07-23\',`activitytime`=\'2018-07-23 09:40:47\',`year`=\'2018\',`times`=\'09:40:50\',`switch`=\'0\',`ttswitch`=\'1\',`teststate`=\'1,2\',`test2state`=\'0,1\' WHERE `id` = 33', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(906): Think\\Db\\Driver->execute(\'UPDATE `xman_te...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(451): Think\\Db\\Driver->update(Array, Array)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Common\\Controller\\MakeController.class.php(110): Think\\Model->save(Array)\n#5 [internal function]: Admin\\Controller\\TestController->edit()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'edit\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-23 09:41:21', '2');

-- ----------------------------
-- Table structure for xman_system_login_log
-- ----------------------------
DROP TABLE IF EXISTS `xman_system_login_log`;
CREATE TABLE `xman_system_login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_user_id` int(11) NOT NULL COMMENT '管理员账号',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) NOT NULL COMMENT '浏览器型号',
  `logtime` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_system_login_log
-- ----------------------------
INSERT INTO `xman_system_login_log` VALUES ('1', '2', '127.0.0.1', '', '谷歌浏览器', '2018-07-22 12:34:43');
INSERT INTO `xman_system_login_log` VALUES ('2', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-22 15:04:58');
INSERT INTO `xman_system_login_log` VALUES ('3', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-22 19:35:58');
INSERT INTO `xman_system_login_log` VALUES ('4', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-22 19:36:05');
INSERT INTO `xman_system_login_log` VALUES ('5', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-22 19:37:34');
INSERT INTO `xman_system_login_log` VALUES ('6', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-23 09:35:30');
INSERT INTO `xman_system_login_log` VALUES ('7', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-23 12:43:30');
INSERT INTO `xman_system_login_log` VALUES ('8', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-23 17:29:39');
INSERT INTO `xman_system_login_log` VALUES ('9', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-23 23:04:48');
INSERT INTO `xman_system_login_log` VALUES ('10', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-24 18:33:21');
INSERT INTO `xman_system_login_log` VALUES ('11', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-24 20:21:58');
INSERT INTO `xman_system_login_log` VALUES ('12', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-25 09:09:22');
INSERT INTO `xman_system_login_log` VALUES ('13', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-25 20:47:05');
INSERT INTO `xman_system_login_log` VALUES ('14', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-25 21:03:07');
INSERT INTO `xman_system_login_log` VALUES ('15', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-25 22:41:56');
INSERT INTO `xman_system_login_log` VALUES ('16', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-25 22:43:51');
INSERT INTO `xman_system_login_log` VALUES ('17', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/67.0.3396.99', '2018-07-26 12:28:43');
INSERT INTO `xman_system_login_log` VALUES ('18', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/68.0.3440.106', '2018-08-15 20:45:27');
INSERT INTO `xman_system_login_log` VALUES ('19', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/68.0.3440.106', '2018-08-16 15:47:29');
INSERT INTO `xman_system_login_log` VALUES ('20', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/68.0.3440.106', '2018-08-17 08:59:21');
INSERT INTO `xman_system_login_log` VALUES ('21', '17', '127.0.0.1', 'Windows NT 10.0', 'Firefox/62.0', '2018-08-17 13:21:51');
INSERT INTO `xman_system_login_log` VALUES ('22', '17', '127.0.0.1', 'Windows NT 10.0', 'MSIE 7.0', '2018-08-17 13:33:32');
INSERT INTO `xman_system_login_log` VALUES ('23', '17', '127.0.0.1', 'Windows NT 10.0', 'Firefox/62.0', '2018-08-17 13:42:32');
INSERT INTO `xman_system_login_log` VALUES ('24', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/68.0.3440.106', '2018-08-17 21:25:34');
INSERT INTO `xman_system_login_log` VALUES ('25', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/68.0.3440.106', '2018-08-18 09:38:13');
INSERT INTO `xman_system_login_log` VALUES ('26', '2', '127.0.0.1', 'Windows NT 10.0', 'Firefox/62.0', '2018-08-18 12:39:08');
INSERT INTO `xman_system_login_log` VALUES ('27', '2', '127.0.0.1', 'Windows NT 10.0', 'MSIE 7.0', '2018-08-18 13:33:59');
INSERT INTO `xman_system_login_log` VALUES ('28', '17', '127.0.0.1', 'Windows NT 10.0', 'Chrome/68.0.3440.106', '2018-08-18 16:23:53');
INSERT INTO `xman_system_login_log` VALUES ('29', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/68.0.3440.106', '2018-08-20 10:47:03');
INSERT INTO `xman_system_login_log` VALUES ('30', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/68.0.3440.106', '2018-08-21 13:23:27');
INSERT INTO `xman_system_login_log` VALUES ('31', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/68.0.3440.106', '2018-08-22 10:34:04');
INSERT INTO `xman_system_login_log` VALUES ('32', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/68.0.3440.106', '2018-08-22 14:52:40');
INSERT INTO `xman_system_login_log` VALUES ('33', '2', '127.0.0.1', 'Windows NT 10.0', 'Chrome/68.0.3440.106', '2018-08-23 10:23:01');

-- ----------------------------
-- Table structure for xman_system_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `xman_system_operation_log`;
CREATE TABLE `xman_system_operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) NOT NULL COMMENT '操作名称',
  `url` varchar(255) NOT NULL COMMENT '访问地址',
  `way_state` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '访问方式:0=GET,1=POST,2=AJAX',
  `usetime` float(12,6) NOT NULL DEFAULT '0.000000' COMMENT '耗时(s)',
  `usemem` float(18,6) NOT NULL DEFAULT '0.000000' COMMENT '使用内存(kb)',
  `result` enum('0','1') NOT NULL DEFAULT '1' COMMENT '操作结果:0=失败,1=成功',
  `message` text NOT NULL COMMENT '提示信息',
  `admin_user_id` int(11) NOT NULL COMMENT '管理员',
  `createtime` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=294 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_system_operation_log
-- ----------------------------
INSERT INTO `xman_system_operation_log` VALUES ('70', '删除操作日志', 'http://127.0.0.24/admin/Systemoperationlog/delete', '1', '1.000000', '1.000000', '0', '权限不足', '2', '2018-07-23 11:52:36');
INSERT INTO `xman_system_operation_log` VALUES ('71', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.017210', '5.000000', '1', '操作成功', '2', '2018-07-23 11:52:45');
INSERT INTO `xman_system_operation_log` VALUES ('72', '删除操作日志', 'http://127.0.0.24/admin/Systemoperationlog/delete', '1', '0.017731', '5.000000', '1', '删除成功', '2', '2018-07-23 11:52:54');
INSERT INTO `xman_system_operation_log` VALUES ('73', '菜单排序', 'http://127.0.0.24/admin/auth/change_menu_sort', '1', '0.033559', '10.000000', '1', '更新成功', '2', '2018-07-23 11:54:51');
INSERT INTO `xman_system_operation_log` VALUES ('74', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.062255', '23.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/TestController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/index.html <br>规则：<br>admin/test/index<br>admin/test/add<br>admin/test/edit<br>admin/test/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-23 12:06:49');
INSERT INTO `xman_system_operation_log` VALUES ('75', 'Test/index', 'http://127.0.0.24/admin/test/index', '0', '1.000000', '1.000000', '0', '权限不足', '2', '2018-07-23 12:06:53');
INSERT INTO `xman_system_operation_log` VALUES ('76', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.029014', '20.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/SystemerrorlogController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Systemerrorlog/index.html <br>规则：<br>admin/systemerrorlog/index<br>admin/systemerrorlog/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-23 12:32:33');
INSERT INTO `xman_system_operation_log` VALUES ('77', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.003857', '-1.000000', '0', '该控制器以开启误触锁定，请手动删除以下文件:<br><span class=\"layui-blue\">C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/User/User.lock</span>', '2', '2018-07-23 12:34:29');
INSERT INTO `xman_system_operation_log` VALUES ('78', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.062542', '23.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/UserController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/User/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/User/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/User/index.html <br>规则：<br>admin/user/index<br>admin/user/add<br>admin/user/edit<br>admin/user/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-23 12:34:42');
INSERT INTO `xman_system_operation_log` VALUES ('79', 'Test/index', 'http://127.0.0.24/admin/test/index', '0', '1.000000', '1.000000', '0', '权限不足', '2', '2018-07-23 12:34:48');
INSERT INTO `xman_system_operation_log` VALUES ('80', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.064511', '23.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/TestController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/index.html <br>规则：<br>admin/test/index<br>admin/test/add<br>admin/test/edit<br>admin/test/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-23 12:35:16');
INSERT INTO `xman_system_operation_log` VALUES ('81', 'Test/index', 'http://127.0.0.24/admin/test/index', '0', '1.000000', '1.000000', '0', '权限不足', '2', '2018-07-23 12:35:22');
INSERT INTO `xman_system_operation_log` VALUES ('82', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.010147', '5.000000', '1', '操作成功', '2', '2018-07-23 12:35:52');
INSERT INTO `xman_system_operation_log` VALUES ('83', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.007232', '4.000000', '1', '操作成功', '2', '2018-07-23 12:36:25');
INSERT INTO `xman_system_operation_log` VALUES ('84', 'Test/add', 'http://127.0.0.24/admin/Test/add', '1', '0.006961', '4.000000', '1', '添加成功', '2', '2018-07-23 12:36:58');
INSERT INTO `xman_system_operation_log` VALUES ('85', 'Test/edit', 'http://127.0.0.24/admin/Test/edit', '1', '0.009137', '5.000000', '1', '操作成功', '2', '2018-07-23 12:44:26');
INSERT INTO `xman_system_operation_log` VALUES ('86', 'Test/edit', 'http://127.0.0.24/admin/Test/edit', '1', '0.009328', '5.000000', '1', '操作成功', '2', '2018-07-23 12:44:33');
INSERT INTO `xman_system_operation_log` VALUES ('87', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.032669', '4.000000', '1', '删除成功', '2', '2018-07-23 23:37:20');
INSERT INTO `xman_system_operation_log` VALUES ('88', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.066203', '27.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-23 23:43:10');
INSERT INTO `xman_system_operation_log` VALUES ('89', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.008798', '5.000000', '1', '操作成功', '2', '2018-07-23 23:44:01');
INSERT INTO `xman_system_operation_log` VALUES ('90', '修改规则', 'http://127.0.0.24/admin/auth/edit_rule', '1', '0.007706', '1.000000', '1', '操作成功', '2', '2018-07-23 23:44:16');
INSERT INTO `xman_system_operation_log` VALUES ('91', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.011109', '5.000000', '1', '操作成功', '2', '2018-07-23 23:44:27');
INSERT INTO `xman_system_operation_log` VALUES ('92', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.060727', '27.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-23 23:46:05');
INSERT INTO `xman_system_operation_log` VALUES ('93', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.008634', '5.000000', '1', '操作成功', '2', '2018-07-23 23:46:16');
INSERT INTO `xman_system_operation_log` VALUES ('94', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.010717', '5.000000', '1', '操作成功', '2', '2018-07-23 23:46:25');
INSERT INTO `xman_system_operation_log` VALUES ('95', 'Article/add', 'http://127.0.0.24/admin/Article/add', '1', '0.007981', '7.000000', '1', '添加成功', '2', '2018-07-23 23:47:13');
INSERT INTO `xman_system_operation_log` VALUES ('96', 'Article/delete', 'http://127.0.0.24/admin/Article/delete', '1', '0.015108', '3.000000', '1', '删除成功', '2', '2018-07-23 23:48:49');
INSERT INTO `xman_system_operation_log` VALUES ('97', '添加规则', 'http://127.0.0.24/admin/auth/add_rule', '1', '0.008931', '0.000000', '1', '添加成功', '2', '2018-07-24 19:00:47');
INSERT INTO `xman_system_operation_log` VALUES ('98', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.010043', '3.000000', '1', '删除成功', '2', '2018-07-24 19:00:53');
INSERT INTO `xman_system_operation_log` VALUES ('99', '修改规则', 'http://127.0.0.24/admin/auth/edit_rule', '1', '0.006942', '0.000000', '1', '操作成功', '2', '2018-07-24 19:22:41');
INSERT INTO `xman_system_operation_log` VALUES ('100', '快速更改规则状态', 'http://127.0.0.24/admin/auth/fast_change_rule', '1', '0.007821', '-2.000000', '1', '', '2', '2018-07-24 19:22:49');
INSERT INTO `xman_system_operation_log` VALUES ('101', '修改规则', 'http://127.0.0.24/admin/auth/edit_rule', '1', '0.009047', '0.000000', '1', '操作成功', '2', '2018-07-24 19:26:54');
INSERT INTO `xman_system_operation_log` VALUES ('102', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.010394', '4.000000', '1', '操作成功', '2', '2018-07-24 19:28:05');
INSERT INTO `xman_system_operation_log` VALUES ('103', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.007933', '5.000000', '1', '操作成功', '2', '2018-07-24 19:28:23');
INSERT INTO `xman_system_operation_log` VALUES ('104', '修改规则', 'http://127.0.0.24/admin/auth/edit_rule', '1', '0.011076', '0.000000', '1', '操作成功', '2', '2018-07-24 19:28:38');
INSERT INTO `xman_system_operation_log` VALUES ('105', '修改规则', 'http://127.0.0.24/admin/auth/edit_rule', '1', '0.008781', '1.000000', '1', '操作成功', '2', '2018-07-24 19:31:46');
INSERT INTO `xman_system_operation_log` VALUES ('106', '修改规则', 'http://127.0.0.24/admin/auth/edit_rule', '1', '0.013448', '1.000000', '1', '操作成功', '2', '2018-07-24 19:32:12');
INSERT INTO `xman_system_operation_log` VALUES ('107', '添加角色组', 'http://127.0.0.24/admin/auth/add_group', '1', '0.009717', '4.000000', '1', '添加成功', '2', '2018-07-24 19:40:55');
INSERT INTO `xman_system_operation_log` VALUES ('108', '添加角色组', 'http://127.0.0.24/admin/auth/add_group', '1', '0.009770', '4.000000', '1', '添加成功', '2', '2018-07-24 19:41:06');
INSERT INTO `xman_system_operation_log` VALUES ('109', '删除角色组', 'http://127.0.0.24/admin/auth/del_group', '1', '0.026588', '7.000000', '1', '删除成功', '2', '2018-07-24 19:41:09');
INSERT INTO `xman_system_operation_log` VALUES ('110', '添加后台用户', 'http://127.0.0.24/admin/auth/add_admin', '1', '0.088286', '5.000000', '0', '登陆账号已存在', '2', '2018-07-24 19:44:51');
INSERT INTO `xman_system_operation_log` VALUES ('111', '添加后台用户', 'http://127.0.0.24/admin/auth/add_admin', '1', '0.095307', '11.000000', '1', '添加成功', '2', '2018-07-24 19:45:07');
INSERT INTO `xman_system_operation_log` VALUES ('112', '修改后台用户', 'http://127.0.0.24/admin/auth/edit_admin', '1', '0.017509', '12.000000', '1', '更新成功', '2', '2018-07-24 19:46:49');
INSERT INTO `xman_system_operation_log` VALUES ('113', '修改后台用户', 'http://127.0.0.24/admin/auth/edit_admin', '1', '0.015867', '12.000000', '1', '更新成功', '2', '2018-07-24 19:47:01');
INSERT INTO `xman_system_operation_log` VALUES ('114', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.001700', '-2.000000', '0', '该控制器以开启误触锁定，请手动删除以下文件:<br><span class=\"layui-blue\">C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/Article.lock</span>', '2', '2018-07-24 20:57:00');
INSERT INTO `xman_system_operation_log` VALUES ('115', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.088298', '27.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 20:57:21');
INSERT INTO `xman_system_operation_log` VALUES ('116', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.007781', '5.000000', '1', '操作成功', '2', '2018-07-24 20:57:33');
INSERT INTO `xman_system_operation_log` VALUES ('117', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.006950', '4.000000', '1', '操作成功', '2', '2018-07-24 20:58:09');
INSERT INTO `xman_system_operation_log` VALUES ('118', 'Article/add', 'http://127.0.0.24/admin/Article/add', '1', '0.009093', '5.000000', '1', '添加成功', '2', '2018-07-24 21:14:11');
INSERT INTO `xman_system_operation_log` VALUES ('119', 'Article/delete', 'http://127.0.0.24/admin/Article/delete', '1', '0.010862', '3.000000', '1', '删除成功', '2', '2018-07-24 21:14:22');
INSERT INTO `xman_system_operation_log` VALUES ('120', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.055031', '27.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 21:14:33');
INSERT INTO `xman_system_operation_log` VALUES ('121', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.010440', '5.000000', '1', '操作成功', '2', '2018-07-24 21:14:45');
INSERT INTO `xman_system_operation_log` VALUES ('122', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.009549', '4.000000', '1', '操作成功', '2', '2018-07-24 21:15:01');
INSERT INTO `xman_system_operation_log` VALUES ('123', 'Article/add', 'http://127.0.0.24/admin/Article/add', '1', '0.008451', '5.000000', '1', '添加成功', '2', '2018-07-24 21:15:52');
INSERT INTO `xman_system_operation_log` VALUES ('124', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.072367', '27.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 21:17:43');
INSERT INTO `xman_system_operation_log` VALUES ('125', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.011458', '5.000000', '1', '操作成功', '2', '2018-07-24 21:17:50');
INSERT INTO `xman_system_operation_log` VALUES ('126', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.007300', '4.000000', '1', '操作成功', '2', '2018-07-24 21:18:02');
INSERT INTO `xman_system_operation_log` VALUES ('127', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.078499', '27.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 21:22:15');
INSERT INTO `xman_system_operation_log` VALUES ('128', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.011898', '5.000000', '1', '操作成功', '2', '2018-07-24 21:22:25');
INSERT INTO `xman_system_operation_log` VALUES ('129', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.007205', '4.000000', '1', '操作成功', '2', '2018-07-24 21:22:39');
INSERT INTO `xman_system_operation_log` VALUES ('130', 'Article/edit', 'http://127.0.0.24/admin/Article/edit', '1', '0.010548', '6.000000', '1', '操作成功', '2', '2018-07-24 21:22:57');
INSERT INTO `xman_system_operation_log` VALUES ('131', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.093305', '27.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 21:23:25');
INSERT INTO `xman_system_operation_log` VALUES ('132', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.008475', '5.000000', '1', '操作成功', '2', '2018-07-24 21:23:31');
INSERT INTO `xman_system_operation_log` VALUES ('133', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.007336', '4.000000', '1', '操作成功', '2', '2018-07-24 21:23:44');
INSERT INTO `xman_system_operation_log` VALUES ('134', 'Article/add', 'http://127.0.0.24/admin/Article/add', '1', '0.008072', '6.000000', '1', '添加成功', '2', '2018-07-24 21:25:33');
INSERT INTO `xman_system_operation_log` VALUES ('135', 'Article/edit', 'http://127.0.0.24/admin/Article/edit', '1', '0.014536', '6.000000', '1', '操作成功', '2', '2018-07-24 21:26:06');
INSERT INTO `xman_system_operation_log` VALUES ('136', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.076304', '27.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 21:58:12');
INSERT INTO `xman_system_operation_log` VALUES ('137', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.014085', '5.000000', '1', '操作成功', '2', '2018-07-24 21:58:23');
INSERT INTO `xman_system_operation_log` VALUES ('138', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.006723', '4.000000', '1', '操作成功', '2', '2018-07-24 21:58:38');
INSERT INTO `xman_system_operation_log` VALUES ('139', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.022314', '21.000000', '0', 'description 字段没有注释', '2', '2018-07-24 22:09:59');
INSERT INTO `xman_system_operation_log` VALUES ('140', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.044615', '24.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 22:10:08');
INSERT INTO `xman_system_operation_log` VALUES ('141', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.039931', '24.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 22:33:14');
INSERT INTO `xman_system_operation_log` VALUES ('142', 'Article/add', 'http://127.0.0.24/admin/Article/add', '1', '0.008236', '6.000000', '1', '添加成功', '2', '2018-07-24 22:34:06');
INSERT INTO `xman_system_operation_log` VALUES ('143', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.041856', '24.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 22:39:36');
INSERT INTO `xman_system_operation_log` VALUES ('144', 'Article/delete', 'http://127.0.0.24/admin/Article/delete', '1', '0.012312', '4.000000', '1', '删除成功', '2', '2018-07-24 22:43:25');
INSERT INTO `xman_system_operation_log` VALUES ('145', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.046352', '24.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 22:43:39');
INSERT INTO `xman_system_operation_log` VALUES ('146', 'Article/add', 'http://127.0.0.24/admin/Article/add', '1', '0.010177', '9.000000', '1', '添加成功', '2', '2018-07-24 22:45:19');
INSERT INTO `xman_system_operation_log` VALUES ('147', 'Article/edit', 'http://127.0.0.24/admin/Article/edit', '1', '0.010486', '9.000000', '1', '操作成功', '2', '2018-07-24 22:46:25');
INSERT INTO `xman_system_operation_log` VALUES ('148', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.051249', '43.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/TestController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/index.html <br>规则：<br>admin/test/index<br>admin/test/add<br>admin/test/edit<br>admin/test/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 22:53:01');
INSERT INTO `xman_system_operation_log` VALUES ('149', 'Test/edit', 'http://127.0.0.24/admin/Test/edit', '1', '0.008338', '11.000000', '1', '操作成功', '2', '2018-07-24 22:53:18');
INSERT INTO `xman_system_operation_log` VALUES ('150', 'Test/add', 'http://127.0.0.24/admin/Test/add', '1', '0.010139', '11.000000', '1', '添加成功', '2', '2018-07-24 22:54:15');
INSERT INTO `xman_system_operation_log` VALUES ('151', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.048362', '43.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/TestController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Test/index.html <br>规则：<br>admin/test/index<br>admin/test/add<br>admin/test/edit<br>admin/test/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-24 23:08:38');
INSERT INTO `xman_system_operation_log` VALUES ('152', 'Test/add', 'http://127.0.0.24/admin/Test/add', '1', '0.014147', '11.000000', '1', '添加成功', '2', '2018-07-24 23:10:16');
INSERT INTO `xman_system_operation_log` VALUES ('153', '菜单排序', 'http://127.0.0.24/admin/auth/change_menu_sort', '1', '0.014289', '9.000000', '1', '更新成功', '2', '2018-07-24 23:18:41');
INSERT INTO `xman_system_operation_log` VALUES ('154', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.003702', '2.000000', '0', '该菜单下存在子项', '2', '2018-07-24 23:19:03');
INSERT INTO `xman_system_operation_log` VALUES ('155', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.007750', '3.000000', '1', '删除成功', '2', '2018-07-24 23:19:08');
INSERT INTO `xman_system_operation_log` VALUES ('156', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.001608', '-3.000000', '0', '存在子权限，请删除子权限', '2', '2018-07-24 23:19:44');
INSERT INTO `xman_system_operation_log` VALUES ('157', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.012607', '3.000000', '1', '删除成功', '2', '2018-07-24 23:19:48');
INSERT INTO `xman_system_operation_log` VALUES ('158', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.001737', '-3.000000', '0', '存在子权限，请删除子权限', '2', '2018-07-24 23:19:55');
INSERT INTO `xman_system_operation_log` VALUES ('159', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.009871', '3.000000', '1', '删除成功', '2', '2018-07-24 23:19:59');
INSERT INTO `xman_system_operation_log` VALUES ('160', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.013336', '3.000000', '1', '删除成功', '2', '2018-07-24 23:20:03');
INSERT INTO `xman_system_operation_log` VALUES ('161', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.013297', '4.000000', '1', '删除成功', '2', '2018-07-24 23:20:18');
INSERT INTO `xman_system_operation_log` VALUES ('162', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.012205', '4.000000', '1', '删除成功', '2', '2018-07-24 23:20:26');
INSERT INTO `xman_system_operation_log` VALUES ('163', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.002915', '2.000000', '0', '该菜单下存在子项', '2', '2018-07-24 23:20:44');
INSERT INTO `xman_system_operation_log` VALUES ('164', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.008656', '3.000000', '1', '删除成功', '2', '2018-07-24 23:20:48');
INSERT INTO `xman_system_operation_log` VALUES ('165', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.009917', '3.000000', '1', '删除成功', '2', '2018-07-24 23:20:51');
INSERT INTO `xman_system_operation_log` VALUES ('166', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.019306', '3.000000', '1', '删除成功', '2', '2018-07-24 23:20:56');
INSERT INTO `xman_system_operation_log` VALUES ('167', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.011414', '3.000000', '1', '删除成功', '2', '2018-07-24 23:20:59');
INSERT INTO `xman_system_operation_log` VALUES ('168', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.008103', '3.000000', '1', '删除成功', '2', '2018-07-24 23:21:02');
INSERT INTO `xman_system_operation_log` VALUES ('169', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.013339', '3.000000', '1', '删除成功', '2', '2018-07-24 23:21:05');
INSERT INTO `xman_system_operation_log` VALUES ('170', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.023692', '4.000000', '1', '删除成功', '2', '2018-07-24 23:22:03');
INSERT INTO `xman_system_operation_log` VALUES ('171', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.009568', '3.000000', '1', '删除成功', '2', '2018-07-25 09:21:30');
INSERT INTO `xman_system_operation_log` VALUES ('172', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.007633', '3.000000', '1', '删除成功', '2', '2018-07-25 09:21:35');
INSERT INTO `xman_system_operation_log` VALUES ('173', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.010449', '4.000000', '1', '删除成功', '2', '2018-07-25 09:21:47');
INSERT INTO `xman_system_operation_log` VALUES ('174', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.070243', '30.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-26 12:29:08');
INSERT INTO `xman_system_operation_log` VALUES ('175', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.014794', '5.000000', '1', '操作成功', '2', '2018-07-26 12:29:18');
INSERT INTO `xman_system_operation_log` VALUES ('176', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.007611', '5.000000', '1', '操作成功', '2', '2018-07-26 12:29:48');
INSERT INTO `xman_system_operation_log` VALUES ('177', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.059270', '30.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-26 12:35:48');
INSERT INTO `xman_system_operation_log` VALUES ('178', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.008083', '5.000000', '1', '操作成功', '2', '2018-07-26 12:35:56');
INSERT INTO `xman_system_operation_log` VALUES ('179', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.010392', '5.000000', '1', '操作成功', '2', '2018-07-26 12:36:07');
INSERT INTO `xman_system_operation_log` VALUES ('180', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.064529', '30.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/ArticleController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/Article/index.html <br>规则：<br>admin/article/index<br>admin/article/add<br>admin/article/edit<br>admin/article/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-26 12:36:48');
INSERT INTO `xman_system_operation_log` VALUES ('181', 'Article/index', 'http://127.0.0.24/admin/article/index', '0', '1.000000', '1.000000', '0', '权限不足', '2', '2018-07-26 12:37:13');
INSERT INTO `xman_system_operation_log` VALUES ('182', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.012025', '5.000000', '1', '操作成功', '2', '2018-07-26 12:37:26');
INSERT INTO `xman_system_operation_log` VALUES ('183', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.007492', '5.000000', '1', '操作成功', '2', '2018-07-26 12:37:38');
INSERT INTO `xman_system_operation_log` VALUES ('184', 'Article/add', 'http://127.0.0.24/admin/Article/add', '1', '0.007093', '7.000000', '1', '添加成功', '2', '2018-07-26 12:38:14');
INSERT INTO `xman_system_operation_log` VALUES ('185', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.064982', '23.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/UserController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/User/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/User/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/User/index.html <br>规则：<br>admin/user/index<br>admin/user/add<br>admin/user/edit<br>admin/user/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-26 12:38:44');
INSERT INTO `xman_system_operation_log` VALUES ('186', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.010185', '5.000000', '1', '操作成功', '2', '2018-07-26 12:38:52');
INSERT INTO `xman_system_operation_log` VALUES ('187', '添加菜单', 'http://127.0.0.24/admin/auth/add_menu', '1', '0.028902', '5.000000', '1', '操作成功', '2', '2018-07-26 12:39:19');
INSERT INTO `xman_system_operation_log` VALUES ('188', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.105490', '22.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/Controller/UserController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/User/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/User/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/xinyadmin/Application/Admin/View/User/index.html <br>规则：<br>admin/user/index<br>admin/user/add<br>admin/user/edit<br>admin/user/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-07-26 12:41:35');
INSERT INTO `xman_system_operation_log` VALUES ('189', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.007743', '5.000000', '1', '操作成功', '2', '2018-07-26 12:41:42');
INSERT INTO `xman_system_operation_log` VALUES ('190', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.007314', '5.000000', '1', '操作成功', '2', '2018-07-26 12:41:53');
INSERT INTO `xman_system_operation_log` VALUES ('191', 'User/edit', 'http://127.0.0.24/admin/User/edit', '1', '0.012508', '5.000000', '1', '操作成功', '2', '2018-07-26 12:42:25');
INSERT INTO `xman_system_operation_log` VALUES ('192', 'User/edit', 'http://127.0.0.24/admin/User/edit', '1', '0.013765', '5.000000', '1', '操作成功', '2', '2018-07-26 12:42:51');
INSERT INTO `xman_system_operation_log` VALUES ('193', '添加菜单', 'http://127.0.0.24/admin/auth/add_menu', '1', '0.011966', '4.000000', '1', '操作成功', '2', '2018-08-15 21:15:47');
INSERT INTO `xman_system_operation_log` VALUES ('194', '删除菜单', 'http://127.0.0.24/admin/auth/del_menu', '1', '0.013744', '3.000000', '1', '删除成功', '2', '2018-08-15 21:15:57');
INSERT INTO `xman_system_operation_log` VALUES ('195', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.012879', '5.000000', '1', '操作成功', '2', '2018-08-15 21:34:50');
INSERT INTO `xman_system_operation_log` VALUES ('196', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.008066', '5.000000', '1', '操作成功', '2', '2018-08-15 21:35:10');
INSERT INTO `xman_system_operation_log` VALUES ('197', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.042844', '17.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/Controller/UpdatelogController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Updatelog/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Updatelog/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Updatelog/index.html <br>规则：<br>admin/updatelog/index<br>admin/updatelog/add<br>admin/updatelog/edit<br>admin/updatelog/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-16 15:51:26');
INSERT INTO `xman_system_operation_log` VALUES ('198', '添加菜单', 'http://127.0.0.24/admin/auth/add_menu', '1', '0.009067', '4.000000', '1', '操作成功', '2', '2018-08-16 15:52:22');
INSERT INTO `xman_system_operation_log` VALUES ('199', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.012637', '5.000000', '1', '操作成功', '2', '2018-08-16 15:52:35');
INSERT INTO `xman_system_operation_log` VALUES ('200', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.009261', '4.000000', '1', '操作成功', '2', '2018-08-16 15:52:52');
INSERT INTO `xman_system_operation_log` VALUES ('201', 'Updatelog/add', 'http://127.0.0.24/admin/Updatelog/add', '1', '0.009171', '3.000000', '1', '添加成功', '2', '2018-08-16 15:54:00');
INSERT INTO `xman_system_operation_log` VALUES ('202', 'Updatelog/add', 'http://127.0.0.24/admin/Updatelog/add', '1', '0.007595', '3.000000', '1', '添加成功', '2', '2018-08-16 16:59:17');
INSERT INTO `xman_system_operation_log` VALUES ('203', 'Updatelog/delete', 'http://127.0.0.24/admin/Updatelog/delete', '1', '0.007733', '2.000000', '1', '删除成功', '2', '2018-08-16 16:59:44');
INSERT INTO `xman_system_operation_log` VALUES ('204', 'Updatelog/add', 'http://127.0.0.24/admin/Updatelog/add', '1', '0.010543', '3.000000', '1', '添加成功', '2', '2018-08-16 22:13:52');
INSERT INTO `xman_system_operation_log` VALUES ('205', 'Updatelog/edit', 'http://127.0.0.24/admin/Updatelog/edit', '1', '0.012915', '4.000000', '1', '操作成功', '2', '2018-08-16 22:15:33');
INSERT INTO `xman_system_operation_log` VALUES ('206', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.006970', '4.000000', '0', '数据无改动', '2', '2018-08-16 23:06:02');
INSERT INTO `xman_system_operation_log` VALUES ('207', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.012962', '4.000000', '1', '操作成功', '2', '2018-08-16 23:07:06');
INSERT INTO `xman_system_operation_log` VALUES ('208', 'Updatelog/add', 'http://127.0.0.24/admin/Updatelog/add', '1', '0.008629', '3.000000', '1', '添加成功', '2', '2018-08-16 23:10:42');
INSERT INTO `xman_system_operation_log` VALUES ('209', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.081963', '48.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/Controller/TestController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Test/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Test/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Test/index.html <br>规则：<br>admin/test/index<br>admin/test/add<br>admin/test/edit<br>admin/test/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-17 21:39:49');
INSERT INTO `xman_system_operation_log` VALUES ('210', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.014437', '5.000000', '1', '操作成功', '2', '2018-08-17 21:40:09');
INSERT INTO `xman_system_operation_log` VALUES ('211', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.011621', '4.000000', '1', '操作成功', '2', '2018-08-17 21:40:26');
INSERT INTO `xman_system_operation_log` VALUES ('212', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.012791', '4.000000', '1', '操作成功', '2', '2018-08-18 00:27:42');
INSERT INTO `xman_system_operation_log` VALUES ('213', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.011066', '4.000000', '1', '操作成功', '2', '2018-08-18 00:28:41');
INSERT INTO `xman_system_operation_log` VALUES ('214', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.014724', '4.000000', '1', '操作成功', '2', '2018-08-18 00:30:35');
INSERT INTO `xman_system_operation_log` VALUES ('215', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.009980', '4.000000', '1', '操作成功', '2', '2018-08-18 00:30:47');
INSERT INTO `xman_system_operation_log` VALUES ('216', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.009476', '4.000000', '1', '操作成功', '2', '2018-08-18 00:30:55');
INSERT INTO `xman_system_operation_log` VALUES ('217', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.010576', '4.000000', '1', '操作成功', '2', '2018-08-18 00:31:12');
INSERT INTO `xman_system_operation_log` VALUES ('218', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.008491', '4.000000', '1', '操作成功', '2', '2018-08-18 00:31:58');
INSERT INTO `xman_system_operation_log` VALUES ('219', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.008297', '4.000000', '1', '操作成功', '2', '2018-08-18 00:32:14');
INSERT INTO `xman_system_operation_log` VALUES ('220', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.010429', '4.000000', '1', '操作成功', '2', '2018-08-18 00:32:30');
INSERT INTO `xman_system_operation_log` VALUES ('221', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.009330', '4.000000', '1', '操作成功', '2', '2018-08-18 00:32:39');
INSERT INTO `xman_system_operation_log` VALUES ('222', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.006914', '4.000000', '1', '操作成功', '2', '2018-08-18 00:32:52');
INSERT INTO `xman_system_operation_log` VALUES ('223', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.011850', '4.000000', '1', '操作成功', '2', '2018-08-18 00:33:04');
INSERT INTO `xman_system_operation_log` VALUES ('224', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.009210', '4.000000', '1', '操作成功', '2', '2018-08-18 00:33:17');
INSERT INTO `xman_system_operation_log` VALUES ('225', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.011438', '4.000000', '1', '操作成功', '2', '2018-08-18 00:33:36');
INSERT INTO `xman_system_operation_log` VALUES ('226', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.008376', '4.000000', '1', '操作成功', '2', '2018-08-18 00:34:42');
INSERT INTO `xman_system_operation_log` VALUES ('227', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.012049', '4.000000', '1', '操作成功', '2', '2018-08-18 00:35:00');
INSERT INTO `xman_system_operation_log` VALUES ('228', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.009216', '4.000000', '1', '操作成功', '2', '2018-08-18 00:35:14');
INSERT INTO `xman_system_operation_log` VALUES ('229', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.091837', '29.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/Controller/SystemskinController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Systemskin/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Systemskin/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Systemskin/index.html <br>规则：<br>admin/systemskin/index<br>admin/systemskin/add<br>admin/systemskin/edit<br>admin/systemskin/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-18 13:14:53');
INSERT INTO `xman_system_operation_log` VALUES ('230', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.011579', '5.000000', '1', '操作成功', '2', '2018-08-18 13:15:02');
INSERT INTO `xman_system_operation_log` VALUES ('231', '添加菜单', 'http://127.0.0.24/admin/auth/add_menu', '1', '0.009602', '4.000000', '1', '操作成功', '2', '2018-08-18 13:15:36');
INSERT INTO `xman_system_operation_log` VALUES ('232', 'Systemskin/add', 'http://127.0.0.24/admin/Systemskin/add', '1', '0.010013', '5.000000', '1', '添加成功', '2', '2018-08-18 13:16:03');
INSERT INTO `xman_system_operation_log` VALUES ('233', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.011693', '6.000000', '1', '操作成功', '2', '2018-08-18 13:19:18');
INSERT INTO `xman_system_operation_log` VALUES ('234', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.040065', '23.000000', '1', '规则：<br>admin/systemskin/index<br>admin/systemskin/add<br>admin/systemskin/edit<br>admin/systemskin/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-18 13:31:44');
INSERT INTO `xman_system_operation_log` VALUES ('235', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.036402', '23.000000', '1', '规则：<br>admin/systemskin/index<br>admin/systemskin/add<br>admin/systemskin/edit<br>admin/systemskin/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-18 13:33:09');
INSERT INTO `xman_system_operation_log` VALUES ('236', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.041366', '23.000000', '1', '规则：<br>admin/systemskin/index<br>admin/systemskin/add<br>admin/systemskin/edit<br>admin/systemskin/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-18 13:35:55');
INSERT INTO `xman_system_operation_log` VALUES ('237', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.010238', '6.000000', '1', '操作成功', '2', '2018-08-18 13:36:09');
INSERT INTO `xman_system_operation_log` VALUES ('238', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.008511', '6.000000', '1', '操作成功', '2', '2018-08-18 13:36:18');
INSERT INTO `xman_system_operation_log` VALUES ('239', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.045261', '23.000000', '1', '规则：<br>admin/systemskin/index<br>admin/systemskin/add<br>admin/systemskin/edit<br>admin/systemskin/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-18 13:39:23');
INSERT INTO `xman_system_operation_log` VALUES ('240', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.040981', '23.000000', '1', '规则：<br>admin/systemskin/index<br>admin/systemskin/add<br>admin/systemskin/edit<br>admin/systemskin/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-18 13:40:38');
INSERT INTO `xman_system_operation_log` VALUES ('241', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.036266', '23.000000', '1', '规则：<br>admin/systemskin/index<br>admin/systemskin/add<br>admin/systemskin/edit<br>admin/systemskin/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-18 13:41:23');
INSERT INTO `xman_system_operation_log` VALUES ('242', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.037701', '23.000000', '1', '规则：<br>admin/systemskin/index<br>admin/systemskin/add<br>admin/systemskin/edit<br>admin/systemskin/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-18 13:41:49');
INSERT INTO `xman_system_operation_log` VALUES ('243', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.008662', '6.000000', '1', '操作成功', '2', '2018-08-18 13:42:56');
INSERT INTO `xman_system_operation_log` VALUES ('244', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.034392', '23.000000', '1', '规则：<br>admin/systemskin/index<br>admin/systemskin/add<br>admin/systemskin/edit<br>admin/systemskin/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-18 13:43:57');
INSERT INTO `xman_system_operation_log` VALUES ('245', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.038858', '23.000000', '1', '规则：<br>admin/systemskin/index<br>admin/systemskin/add<br>admin/systemskin/edit<br>admin/systemskin/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-18 13:44:56');
INSERT INTO `xman_system_operation_log` VALUES ('246', 'Systemskin/add', 'http://127.0.0.24/admin/Systemskin/add', '1', '0.007823', '5.000000', '1', '添加成功', '2', '2018-08-18 14:33:36');
INSERT INTO `xman_system_operation_log` VALUES ('247', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.046711', '23.000000', '1', '规则：<br>admin/systemskin/index<br>admin/systemskin/add<br>admin/systemskin/edit<br>admin/systemskin/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-18 15:10:22');
INSERT INTO `xman_system_operation_log` VALUES ('248', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.010151', '6.000000', '1', '操作成功', '2', '2018-08-18 15:10:41');
INSERT INTO `xman_system_operation_log` VALUES ('249', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.010825', '6.000000', '1', '操作成功', '2', '2018-08-18 15:11:19');
INSERT INTO `xman_system_operation_log` VALUES ('250', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.007613', '6.000000', '1', '操作成功', '2', '2018-08-18 15:17:18');
INSERT INTO `xman_system_operation_log` VALUES ('251', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.008286', '6.000000', '1', '操作成功', '2', '2018-08-18 15:19:32');
INSERT INTO `xman_system_operation_log` VALUES ('252', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.010124', '6.000000', '1', '操作成功', '2', '2018-08-18 15:19:41');
INSERT INTO `xman_system_operation_log` VALUES ('253', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.012432', '6.000000', '1', '操作成功', '2', '2018-08-18 15:28:29');
INSERT INTO `xman_system_operation_log` VALUES ('254', 'Systemskin/add', 'http://127.0.0.24/admin/Systemskin/add', '1', '0.009615', '5.000000', '1', '添加成功', '2', '2018-08-18 15:30:14');
INSERT INTO `xman_system_operation_log` VALUES ('255', 'Systemskin/delete', 'http://127.0.0.24/admin/Systemskin/delete', '1', '0.011472', '3.000000', '1', '删除成功', '2', '2018-08-18 15:32:37');
INSERT INTO `xman_system_operation_log` VALUES ('256', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.008406', '6.000000', '1', '操作成功', '2', '2018-08-18 15:32:49');
INSERT INTO `xman_system_operation_log` VALUES ('257', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.010059', '6.000000', '1', '操作成功', '2', '2018-08-18 15:33:11');
INSERT INTO `xman_system_operation_log` VALUES ('258', 'Systemskin/edit', 'http://127.0.0.24/admin/Systemskin/edit', '1', '0.009593', '6.000000', '1', '操作成功', '2', '2018-08-18 15:33:48');
INSERT INTO `xman_system_operation_log` VALUES ('259', 'Systemskin/delete', 'http://127.0.0.24/admin/Systemskin/delete', '1', '0.013536', '3.000000', '1', '删除成功', '2', '2018-08-18 15:34:07');
INSERT INTO `xman_system_operation_log` VALUES ('260', 'Article/index', 'http://127.0.0.24/admin/article/index', '0', '1.000000', '1.000000', '0', '权限不足', '17', '2018-08-18 16:23:55');
INSERT INTO `xman_system_operation_log` VALUES ('261', 'Systemskin/index', 'http://127.0.0.24/admin/systemskin/index', '0', '1.000000', '1.000000', '0', '权限不足', '17', '2018-08-18 16:23:55');
INSERT INTO `xman_system_operation_log` VALUES ('262', 'User/index', 'http://127.0.0.24/admin/user/index', '0', '1.000000', '1.000000', '0', '权限不足', '17', '2018-08-18 16:24:02');
INSERT INTO `xman_system_operation_log` VALUES ('263', '生成代码', 'http://127.0.0.24/admin/Makecode/make', '1', '0.049089', '19.000000', '1', '<span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/Controller/CatetestController.class.php <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Catetest/add.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Catetest/edit.html <br><span style=\'color:green\'>成功</span> C:/E/PHPIDE/VertrigoServ/www/x-man/Application/Admin/View/Catetest/index.html <br>规则：<br>admin/catetest/index<br>admin/catetest/add<br>admin/catetest/edit<br>admin/catetest/delete<br>规则创建<span class=\'layui-blue\'>成功</span><br>请自行创建菜单、绑定规则，以及角色组授权', '2', '2018-08-20 10:47:23');
INSERT INTO `xman_system_operation_log` VALUES ('264', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.008063', '4.000000', '1', '操作成功', '2', '2018-08-20 10:47:31');
INSERT INTO `xman_system_operation_log` VALUES ('265', '添加菜单', 'http://127.0.0.24/admin/auth/add_menu', '1', '0.008519', '3.000000', '1', '操作成功', '2', '2018-08-20 10:47:49');
INSERT INTO `xman_system_operation_log` VALUES ('266', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.008058', '4.000000', '1', '操作成功', '2', '2018-08-20 10:48:10');
INSERT INTO `xman_system_operation_log` VALUES ('267', 'Catetest/add', 'http://127.0.0.24/admin/Catetest/add', '1', '0.008720', '3.000000', '1', '添加成功', '2', '2018-08-20 10:48:35');
INSERT INTO `xman_system_operation_log` VALUES ('268', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.004640', '-3.000000', '0', '存在子权限，请删除子权限', '2', '2018-08-22 15:58:45');
INSERT INTO `xman_system_operation_log` VALUES ('269', '修改规则', 'http://127.0.0.24/admin/auth/edit_rule', '1', '0.019924', '0.000000', '1', '操作成功', '2', '2018-08-22 16:01:58');
INSERT INTO `xman_system_operation_log` VALUES ('270', '快速更改规则状态', 'http://127.0.0.24/admin/auth/fast_change_rule', '1', '0.012835', '-2.000000', '1', '', '2', '2018-08-22 16:38:55');
INSERT INTO `xman_system_operation_log` VALUES ('271', '快速更改规则状态', 'http://127.0.0.24/admin/auth/fast_change_rule', '1', '0.006835', '-2.000000', '1', '', '2', '2018-08-22 16:39:03');
INSERT INTO `xman_system_operation_log` VALUES ('272', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.006818', '-3.000000', '0', '存在子权限，请删除子权限', '2', '2018-08-22 16:47:00');
INSERT INTO `xman_system_operation_log` VALUES ('273', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.013129', '3.000000', '1', '删除成功', '2', '2018-08-22 16:49:18');
INSERT INTO `xman_system_operation_log` VALUES ('274', '修改规则', 'http://127.0.0.24/admin/auth/edit_rule', '1', '0.010562', '0.000000', '1', '操作成功', '2', '2018-08-22 16:49:28');
INSERT INTO `xman_system_operation_log` VALUES ('275', '添加规则', 'http://127.0.0.24/admin/auth/add_rule', '1', '0.009748', '-1.000000', '1', '添加成功', '2', '2018-08-22 16:49:39');
INSERT INTO `xman_system_operation_log` VALUES ('276', '删除规则', 'http://127.0.0.24/admin/auth/del_rule', '1', '0.008656', '3.000000', '1', '删除成功', '2', '2018-08-22 16:49:45');
INSERT INTO `xman_system_operation_log` VALUES ('277', '菜单排序', 'http://127.0.0.24/admin/auth/change_menu_sort', '1', '0.015985', '8.000000', '1', '更新成功', '2', '2018-08-22 16:53:20');
INSERT INTO `xman_system_operation_log` VALUES ('278', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.009588', '4.000000', '1', '操作成功', '2', '2018-08-22 17:04:46');
INSERT INTO `xman_system_operation_log` VALUES ('279', '菜单排序', 'http://127.0.0.24/admin/auth/change_menu_sort', '1', '0.026604', '9.000000', '1', '更新成功', '2', '2018-08-22 17:15:49');
INSERT INTO `xman_system_operation_log` VALUES ('280', '菜单排序', 'http://127.0.0.24/admin/auth/change_menu_sort', '1', '0.021628', '9.000000', '1', '更新成功', '2', '2018-08-22 17:18:39');
INSERT INTO `xman_system_operation_log` VALUES ('281', '添加规则', 'http://127.0.0.24/admin/auth/add_rule', '1', '0.010059', '-1.000000', '1', '添加成功', '2', '2018-08-22 21:26:16');
INSERT INTO `xman_system_operation_log` VALUES ('282', '添加菜单', 'http://127.0.0.24/admin/auth/add_menu', '1', '0.006808', '3.000000', '1', '操作成功', '2', '2018-08-22 21:27:00');
INSERT INTO `xman_system_operation_log` VALUES ('283', '添加菜单', 'http://127.0.0.24/admin/auth/add_menu', '1', '0.009175', '3.000000', '1', '操作成功', '2', '2018-08-22 21:27:28');
INSERT INTO `xman_system_operation_log` VALUES ('284', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.008161', '4.000000', '1', '操作成功', '2', '2018-08-22 23:07:02');
INSERT INTO `xman_system_operation_log` VALUES ('285', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.011153', '4.000000', '1', '操作成功', '2', '2018-08-22 23:07:09');
INSERT INTO `xman_system_operation_log` VALUES ('286', '修改菜单', 'http://127.0.0.24/admin/auth/edit_menu', '1', '0.010616', '4.000000', '1', '操作成功', '2', '2018-08-22 23:10:46');
INSERT INTO `xman_system_operation_log` VALUES ('287', '快速更改规则状态', 'http://127.0.0.24/admin/auth/fast_change_rule', '1', '0.013473', '-2.000000', '1', '', '2', '2018-08-23 11:23:40');
INSERT INTO `xman_system_operation_log` VALUES ('288', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.013997', '4.000000', '1', '操作成功', '2', '2018-08-23 11:24:00');
INSERT INTO `xman_system_operation_log` VALUES ('289', '快速更改规则状态', 'http://127.0.0.24/admin/auth/fast_change_rule', '1', '1.000000', '2.000000', '0', '权限不足', '2', '2018-08-23 11:24:05');
INSERT INTO `xman_system_operation_log` VALUES ('290', '快速更改规则状态', 'http://127.0.0.24/admin/auth/fast_change_rule', '1', '1.000000', '2.000000', '0', '权限不足', '2', '2018-08-23 11:24:08');
INSERT INTO `xman_system_operation_log` VALUES ('291', '快速更改规则状态', 'http://127.0.0.24/admin/auth/fast_change_rule', '1', '1.000000', '2.000000', '0', '权限不足', '2', '2018-08-23 11:24:47');
INSERT INTO `xman_system_operation_log` VALUES ('292', '修改角色组', 'http://127.0.0.24/admin/auth/edit_group', '1', '0.010229', '4.000000', '1', '操作成功', '2', '2018-08-23 11:25:07');
INSERT INTO `xman_system_operation_log` VALUES ('293', '快速更改规则状态', 'http://127.0.0.24/admin/auth/fast_change_rule', '1', '0.007051', '-2.000000', '1', '', '2', '2018-08-23 11:25:12');

-- ----------------------------
-- Table structure for xman_system_skin
-- ----------------------------
DROP TABLE IF EXISTS `xman_system_skin`;
CREATE TABLE `xman_system_skin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `framecolor` varchar(255) NOT NULL DEFAULT '' COMMENT '框架颜色',
  `topcolor` varchar(255) NOT NULL COMMENT '顶部背景',
  `leftcolor` varchar(255) NOT NULL COMMENT '左侧背景',
  `topbottomcolor` varchar(255) NOT NULL COMMENT '顶部底边',
  `menucolor` varchar(255) NOT NULL COMMENT '三级菜单',
  `user_id` int(11) DEFAULT '0' COMMENT '用户ID',
  `state` enum('1','2') NOT NULL DEFAULT '2' COMMENT '皮肤类型:1=系统主题,2=用户主题',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '皮肤名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_system_skin
-- ----------------------------
INSERT INTO `xman_system_skin` VALUES ('7', '#019688', '#23262e', '#393d49', '#5fb878', '#2b2e37', '0', '1', 'layui风格');
INSERT INTO `xman_system_skin` VALUES ('10', '#409eff', '#23262e', '#393d49', '#c9c9c9', '#2b2e37', '0', '1', 'element风格');
INSERT INTO `xman_system_skin` VALUES ('12', '#d25757', '#23262e', '#393d49', '#f79b40', '#2b2e37', '0', '1', '活力少女');
INSERT INTO `xman_system_skin` VALUES ('16', '#cc3366', '#23262e', '#393d49', '#e36467', '#2b2e37', '0', '1', '玫红');
INSERT INTO `xman_system_skin` VALUES ('20', '#eeca00', '#23262e', '#393d49', '#505050', '#2b2e37', '0', '1', '土豪金');
INSERT INTO `xman_system_skin` VALUES ('25', '#d25757', '#23262e', '#393d49', '#f79b40', '#2b2e37', '17', '2', '');
INSERT INTO `xman_system_skin` VALUES ('27', '#019688', '#23262e', '#393d49', '#5fb878', '#2b2e37', '2', '2', '');

-- ----------------------------
-- Table structure for xman_test
-- ----------------------------
DROP TABLE IF EXISTS `xman_test`;
CREATE TABLE `xman_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `week` enum('monday','tuesday','wednesday') NOT NULL DEFAULT 'monday' COMMENT '星期:monday=星期一,tuesday=星期二,wednesday=星期三',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别:male=男,female=女',
  `textarea` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `startdate` date NOT NULL COMMENT '开始日期',
  `activitytime` datetime NOT NULL COMMENT '活动时间(datetime)',
  `year` year(4) NOT NULL COMMENT '年',
  `times` time NOT NULL COMMENT '时间',
  `switch` tinyint(1) NOT NULL DEFAULT '1' COMMENT '上架状态:0=下架,1=正常',
  `ttswitch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关:0=OFF,1=ON',
  `teststate` set('1','2','3') NOT NULL DEFAULT '1' COMMENT '测试复选:1=选项1,2=选项2,3=选项3,',
  `test2state` set('0','1','2') DEFAULT '2' COMMENT '爱好:0=唱歌,1=跳舞,2=嫖娼',
  `editor_content` text COMMENT '富文本',
  PRIMARY KEY (`id`),
  UNIQUE KEY `test` (`keywords`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';

-- ----------------------------
-- Records of xman_test
-- ----------------------------
INSERT INTO `xman_test` VALUES ('20', 'tuesday', 'male', 'ttyyyyyyttt', '/Public/Uploads/img/20180721/5b5341112a8e1.png', '/Public/Uploads/file/20180721/5b534117f187a.txt', '4rr', '0.09', '2018-07-21', '2018-07-21 22:20:19', '2018', '22:20:25', '0', '0', '2', '1,2', null);
INSERT INTO `xman_test` VALUES ('29', 'tuesday', 'female', 'ttr', '/Public/Uploads/img/20180722/5b536cc910311.png', '/Public/Uploads/file/20180722/5b536ccd6ecf0.sql', '4rrs', '0.00', '2018-07-23', '2018-07-22 01:26:43', '2018', '01:26:47', '1', '0', '2,3', '2', 'qrwewqr');
INSERT INTO `xman_test` VALUES ('30', 'monday', 'male', '444', '/Public/Uploads/img/20180722/5b53f6faaba8a.jpg', '/Public/Uploads/file/20180722/5b53f6ff423b0.jpg', 'ttrr', '0.00', '2018-07-22', '2018-07-22 11:16:22', '2018', '11:16:26', '0', '1', '1,3', '2', null);
INSERT INTO `xman_test` VALUES ('31', 'tuesday', 'female', 'rrrrrr', '/Public/Uploads/img/20180722/5b53f80686f48.jpg', '/Public/Uploads/file/20180722/5b53f80b8bd7f.jpg', 'yyyytttt', '0.00', '2018-07-22', '2018-07-22 11:20:52', '2018', '11:20:55', '1', '1', '1,2,3', '2', null);
INSERT INTO `xman_test` VALUES ('32', 'monday', 'male', '1234214', '/Public/Uploads/img/20180724/5b573d714ea7f.jpg', '/Public/Uploads/file/20180724/5b573d7498833.jpg', 'qwre', '0.00', '2018-07-24', '2018-07-24 22:53:46', '2018', '22:53:50', '1', '0', '1', '2', '&lt;img src=&quot;/Public/Uploads/img/20180724/5b573d96c1726.jpg&quot; alt=&quot;xph.jpg&quot;&gt;');
INSERT INTO `xman_test` VALUES ('33', 'monday', 'male', '123123', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180724/5b57413ec6844.jpg', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180724/5b57414e7ca4b.jpg', '123213', '0.00', '2018-07-24', '2018-07-24 23:10:11', '2018', '23:10:14', '1', '0', '1', '2', '&lt;img src=&quot;https://testyao.oss-cn-beijing.aliyuncs.com/images/20180724/5b574145c458e.jpg&quot; alt=&quot;xph.jpg&quot;&gt;');

-- ----------------------------
-- Table structure for xman_update_log
-- ----------------------------
DROP TABLE IF EXISTS `xman_update_log`;
CREATE TABLE `xman_update_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(1024) NOT NULL COMMENT '更新内容',
  `image` varchar(255) NOT NULL COMMENT '图片',
  `addtime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_update_log
-- ----------------------------
INSERT INTO `xman_update_log` VALUES ('1', '修改菜单管理图标选择样式', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180816/5b752d8ac9f48.png', '2018-08-15 19:04:04');
INSERT INTO `xman_update_log` VALUES ('3', '顶部标签栏添加右键菜单包含刷新、关闭等功能', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180816/5b7587027d35e.png', '2018-08-16 22:13:51');
INSERT INTO `xman_update_log` VALUES ('4', '左侧导航栏 搜索功能', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180816/5b7593efc4fd3.png', '2018-08-16 23:10:41');

-- ----------------------------
-- Table structure for xman_user
-- ----------------------------
DROP TABLE IF EXISTS `xman_user`;
CREATE TABLE `xman_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '用户名',
  `phone` varchar(32) NOT NULL COMMENT '移动电话',
  `birdate` date NOT NULL COMMENT '生日',
  `headimage` varchar(255) NOT NULL COMMENT '头像',
  `state` enum('0','1') DEFAULT '1' COMMENT '可用状态:0=禁用,1=可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_user
-- ----------------------------
INSERT INTO `xman_user` VALUES ('1', '测试用户1', '18812345678', '2018-07-18', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180726/5b59512f2e229.jpg', '1');
INSERT INTO `xman_user` VALUES ('2', 'www', '18812345678', '2018-07-22', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180726/5b59514a3ffe9.jpg', '0');
INSERT INTO `xman_user` VALUES ('3', 'tttttt', '11234214', '2018-07-22', '/Public/Uploads/img/20180722/5b549afbb143e.jpg', '1');
INSERT INTO `xman_user` VALUES ('4', 'tttt', 'tttt', '2018-07-05', '/Public/Uploads/img/20180723/5b555b67ef59c.jpg', '1');
