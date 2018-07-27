/*
Navicat MySQL Data Transfer

Source Server         : 本地数据库
Source Server Version : 50628
Source Host           : localhost:3306
Source Database       : xinyadmin

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2018-07-25 09:24:32
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
INSERT INTO `xman_admin_user` VALUES ('2', 'admin11', '$2y$10$BkNMYNYLaaF.i509BnjXEeMSJ8ltv59EZ8A.DqsQNzArx0qS33CqS', '176124388881', '123@qq.com1', 'Admin', '1990-10-10 00:00:00', '0', '1990-10-16', '1', '0', '1');
INSERT INTO `xman_admin_user` VALUES ('16', 'testdemo1', '$2y$10$4N6V9FpbLdd0kQseIj.B0eD/jcviniUcrOUjGNAsUEsZ4M9Q8eOpS', '17612312', '123123', '测试账号', '1990-10-10 00:00:00', '0', '2018-06-11', '1', '0', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_article
-- ----------------------------
INSERT INTO `xman_article` VALUES ('5', '测试文章', 'Xiny', '&lt;p&gt;&lt;img src=&quot;http://127.0.0.24/Public/static/layui/images/face/12.gif&quot; alt=&quot;[泪]&quot;&gt;&lt;img src=&quot;http://127.0.0.24/Public/static/layui/images/face/1.gif&quot; alt=&quot;[嘻嘻]&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;i&gt;sadfsafsadfsdaf&lt;/i&gt;&lt;/p&gt;&lt;p&gt;&lt;i&gt;&lt;u&gt;asdfasfsasdf&lt;/u&gt;&lt;/i&gt;&lt;/p&gt;&lt;p&gt;&lt;i&gt;&lt;u&gt;&lt;strike&gt;asdfsadfsad&lt;/strike&gt;&lt;/u&gt;&lt;/i&gt;&lt;/p&gt;&lt;p&gt;&lt;a target=&quot;_blank&quot; href=&quot;http://www.baidu.com&quot; style=&quot;&quot;&gt;http://www.baidu.com&lt;/a&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;asfsadfdsafdsd&lt;img src=&quot;/Public/Uploads/img/20180724/5b573b6f42ea9.jpg&quot; alt=&quot;sss.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;&lt;i&gt;&lt;u&gt;&lt;strike&gt;&lt;br&gt;&lt;/strike&gt;&lt;/u&gt;&lt;/i&gt;&lt;/p&gt;', '2018-07-24 22:45:10', '1', '123123', '0', '12');

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
INSERT INTO `xman_auth_group` VALUES ('1', '超级管理员', '拥有所有权限', '1', '27,16,31,20,21,28,22,23,29,11,12,63,64,65,66,67,68,13,14,17,1,2,5,6,10,18,41,42,43,32,37,38,39,40,19,44,45,46,47,48,50,30,24,25,26,79,80,81,82,112,113,114,115');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of xman_auth_menus
-- ----------------------------
INSERT INTO `xman_auth_menus` VALUES ('1', '内容管理', '0', '27', 'iconfont icon-wenzhang-copy', 'default');
INSERT INTO `xman_auth_menus` VALUES ('3', '系统设置', '0', '29', 'iconfont icon-bianji', 'default');
INSERT INTO `xman_auth_menus` VALUES ('5', '系统基本参数', '3', '11', 'iconfont icon-guanli', 'default');
INSERT INTO `xman_auth_menus` VALUES ('6', '规则管理', '19', '1', 'iconfont icon-createtask', 'default');
INSERT INTO `xman_auth_menus` VALUES ('7', '角色组管理', '19', '32', 'layui-icon layui-icon-user', 'default');
INSERT INTO `xman_auth_menus` VALUES ('8', '用户管理', '19', '18', 'iconfont icon-addressbook_fill', 'default');
INSERT INTO `xman_auth_menus` VALUES ('9', '文章列表', '1', '112', 'iconfont icon-wenzhang4', 'default');
INSERT INTO `xman_auth_menus` VALUES ('10', '图片管理', '1', '16', 'iconfont icon-tupian2', 'default');
INSERT INTO `xman_auth_menus` VALUES ('11', '其他页面', '1', '31', 'iconfont icon-menu1', '_blank');
INSERT INTO `xman_auth_menus` VALUES ('12', '登录', '11', '21', 'iconfont icon-houtai4', '_blank');
INSERT INTO `xman_auth_menus` VALUES ('13', '404页面', '11', '20', 'layui-icon layui-icon-404', 'default');
INSERT INTO `xman_auth_menus` VALUES ('18', '菜单管理', '3', '19', 'iconfont icon-menu1', 'default');
INSERT INTO `xman_auth_menus` VALUES ('19', '权限管理', '3', '32', 'iconfont icon-addressbook', 'default');
INSERT INTO `xman_auth_menus` VALUES ('20', '系统日志', '3', '12', 'layui-icon layui-icon-tabs', 'default');
INSERT INTO `xman_auth_menus` VALUES ('28', '代码生成器', '3', '48', 'iconfont icon-xiaolvdashiicon02', 'default');
INSERT INTO `xman_auth_menus` VALUES ('29', '测试控制器', '3', '79', 'iconfont icon-activity', 'default');
INSERT INTO `xman_auth_menus` VALUES ('30', '错误日志', '20', '63', 'layui-icon layui-icon-tabs', 'default');
INSERT INTO `xman_auth_menus` VALUES ('31', '登录日志', '20', '65', 'iconfont icon-clock_fill', 'default');
INSERT INTO `xman_auth_menus` VALUES ('32', '操作日志', '20', '67', 'iconfont icon-guanli', 'default');

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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8;

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
INSERT INTO `xman_auth_rule` VALUES ('79', 'admin/test/index', 'Test/index', '1', '1', '', '1', '0');
INSERT INTO `xman_auth_rule` VALUES ('80', 'admin/test/add', 'Test/add', '1', '1', '', '0', '79');
INSERT INTO `xman_auth_rule` VALUES ('81', 'admin/test/edit', 'Test/edit', '1', '1', '', '0', '79');
INSERT INTO `xman_auth_rule` VALUES ('82', 'admin/test/delete', 'Test/delete', '1', '1', '', '0', '79');
INSERT INTO `xman_auth_rule` VALUES ('112', 'admin/article/index', 'Article/index', '1', '1', '', '1', '0');
INSERT INTO `xman_auth_rule` VALUES ('113', 'admin/article/add', 'Article/add', '1', '1', '', '0', '112');
INSERT INTO `xman_auth_rule` VALUES ('114', 'admin/article/edit', 'Article/edit', '1', '1', '', '0', '112');
INSERT INTO `xman_auth_rule` VALUES ('115', 'admin/article/delete', 'Article/delete', '1', '1', '', '0', '112');

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=174 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO `xman_user` VALUES ('1', '测试用户1', '18812345678', '2018-07-18', '/Public/Uploads/img/20180718/5b4eeec4799e5.jpg', '1');
INSERT INTO `xman_user` VALUES ('2', 'www', '18812345678', '2018-07-22', '/Public/Uploads/img/20180722/5b549ac4496d4.jpg', '0');
INSERT INTO `xman_user` VALUES ('3', 'tttttt', '11234214', '2018-07-22', '/Public/Uploads/img/20180722/5b549afbb143e.jpg', '1');
INSERT INTO `xman_user` VALUES ('4', 'tttt', 'tttt', '2018-07-05', '/Public/Uploads/img/20180723/5b555b67ef59c.jpg', '1');
