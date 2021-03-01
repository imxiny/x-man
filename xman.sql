/*
 Navicat Premium Data Transfer

 Source Server         : phpstudy-数据库
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : 127.0.0.1:3306
 Source Schema         : xman

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 01/03/2021 11:26:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xman_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `xman_admin_user`;
CREATE TABLE `xman_admin_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户账号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `register_time` datetime NOT NULL DEFAULT '1990-10-10 00:00:00',
  `age` tinyint(3) NOT NULL DEFAULT 0,
  `birthday` date NOT NULL DEFAULT '1990-10-10',
  `sex` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1:男,0:女',
  `isdel` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0:被删除 1 未被删除',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '预留字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_admin_user
-- ----------------------------
INSERT INTO `xman_admin_user` VALUES (2, 'admin11', '$2y$10$sUo9d.WTUwzlMwn/kzEtM.Z5drArRtcV2kda.qzAkTsZQqhEhJpTO', '176124388881', '123@qq.com1', 'Admin', '1990-10-10 00:00:00', 0, '1990-10-16', 1, 0, 1);
INSERT INTO `xman_admin_user` VALUES (16, 'testdemo1', '$2y$10$4N6V9FpbLdd0kQseIj.B0eD/jcviniUcrOUjGNAsUEsZ4M9Q8eOpS', '17612312', '123123', '测试账号', '1990-10-10 00:00:00', 0, '2018-06-11', 1, 0, 1);
INSERT INTO `xman_admin_user` VALUES (17, 'testdemo', '$2y$10$sUo9d.WTUwzlMwn/kzEtM.Z5drArRtcV2kda.qzAkTsZQqhEhJpTO', '18812345678', 'i@xiny9.com', 'TestUser', '1990-10-10 00:00:00', 0, '2018-07-10', 1, 0, 1);

-- ----------------------------
-- Table structure for xman_article
-- ----------------------------
DROP TABLE IF EXISTS `xman_article`;
CREATE TABLE `xman_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章名',
  `category_id` int(11) NOT NULL COMMENT '分类:id:title',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '作者:id:name',
  `show_switch` tinyint(1) NOT NULL DEFAULT 1 COMMENT '展示:1=展示,0=隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_article
-- ----------------------------
INSERT INTO `xman_article` VALUES (11, 'test', 2, '1231231', 1, 1);
INSERT INTO `xman_article` VALUES (12, '5646450', 5, '&lt;p style=&quot;text-align: center;&quot;&gt;现在 4K 视频已经很常见了，异次元也曾发布过一篇关于《&lt;a href=&quot;https://www.iplaysoft.com/play-4k-movie.html&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;电脑怎样播放 4K HDR 蓝光电影&lt;/a&gt;》的&lt;a href=&quot;https://www.iplaysoft.com/tag/%E6%95%99%E7%A8%8B&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;教程&lt;/a&gt;，追求最高画质的&lt;a href=&quot;https://www.iplaysoft.com/tag/%E7%94%B5%E5%BD%B1&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;电影&lt;/a&gt;爱好者们应该对 4K 都相当熟悉了。&lt;img src=&quot;https://testyao.oss-cn-beijing.aliyuncs.com/images/20180913/5b9a7f5d630ba.jpg&quot; alt=&quot;FireShot Screen Capture #992 - \'\' - www_h5tpl_com_h5_26_173.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;然而这边 &lt;a href=&quot;https://www.iplaysoft.com/tag/4k&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;4K&lt;/a&gt; 才还刚开始普及，网上就陆续出现更清晰、更高分辨率的&lt;a href=&quot;https://www.iplaysoft.com/tag/%E8%A7%86%E9%A2%91&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;视频&lt;/a&gt;——比如 5K、8K 甚至是相当夸张的 &lt;strong&gt;12K 超高清视频&lt;/strong&gt;！如果你的电脑、&lt;a href=&quot;https://www.iplaysoft.com/tag/%E6%89%8B%E6%9C%BA&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;手机&lt;/a&gt;、&lt;a href=&quot;https://www.iplaysoft.com/go/tv&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;电视&lt;/a&gt;、盒子、播放机可以流畅播放4K，不妨也下载这些 8K 或 12K 的视频来试试你手头设备的播放解码能力吧……&lt;/p&gt;&lt;h3&gt;8K / 12K 分辨率超高清测试视频&lt;/h3&gt;&lt;div&gt;&lt;/div&gt;&lt;div class=&quot;clear&quot;&gt;&lt;/div&gt;&lt;p&gt;这里收录了多部 4K、5K、8K 和 12K 分辨率的超高清航拍&lt;a href=&quot;https://www.iplaysoft.com/tag/%E9%A3%8E%E6%99%AF&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;风景&lt;/a&gt;测试视频。很多都是由 &lt;a href=&quot;https://www.iplaysoft.com/go/dji&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;DJI 大疆无人机&lt;/a&gt; 拍摄于 2017 - 2018 日本、美国等地，风光景色相当唯美，画质优秀，时长大概每部 3 分钟，适用于店面展示，或&lt;a href=&quot;https://www.iplaysoft.com/tag/%E6%B5%8B%E8%AF%95&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;测试&lt;/a&gt;各种电脑、手机、电视盒子或&lt;a href=&quot;https://www.iplaysoft.com/tag/%E6%92%AD%E6%94%BE%E5%99%A8&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;播放器软件&lt;/a&gt;的性能及解码能力。&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;aligncenter size-medium&quot; src=&quot;https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/12k_manhattan_newyork.jpg&quot; srcset=&quot;https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/12k_manhattan_newyork.jpg 1x,https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/12k_manhattan_newyork_2x.jpg 2x&quot; alt=&quot;纽约曼哈顿 12K 高清视频&quot; width=&quot;680&quot; height=&quot;382&quot; style=&quot;text-align: center;&quot;&gt;&lt;/p&gt;&lt;p&gt;这些超高清测试视频均是「&lt;a href=&quot;https://www.iplaysoft.com/go/fq&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;番·羽·土·啬&lt;/a&gt;」后搬运自 YouTube 的，由网友&lt;a href=&quot;http://bbs.feng.com/home.php?mod=space&amp;uid=6673609&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;河东村&lt;/a&gt;整理，文件格式为 webp，大小普遍 300MB~1GB 左右，最高分辨率为 7680x4320，在 &lt;a href=&quot;https://www.iplaysoft.com/go/4k&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;4K 电视&lt;/a&gt;或大尺寸的 &lt;a href=&quot;https://www.iplaysoft.com/go/4kmonitor&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;4K 显示器&lt;/a&gt;下效果非常震撼，视频画面清晰锐利，细节相当丰富！&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;aligncenter size-medium&quot; src=&quot;https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/5k_arizona.jpg&quot; srcset=&quot;https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/5k_arizona.jpg 1x,https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/5k_arizona_2x.jpg 2x&quot; alt=&quot;5K 高清视频&quot; width=&quot;680&quot; height=&quot;382&quot; style=&quot;text-align: center;&quot;&gt;&lt;/p&gt;&lt;p&gt;不过由于 WebP 是主要用于在线流媒体的&lt;a href=&quot;https://www.iplaysoft.com/tag/%E6%A0%BC%E5%BC%8F&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;格式&lt;/a&gt;，一般会经过压缩，所以视频码率不算太高，算不上极限画质测试，但优点胜在文件体积小巧，&lt;a href=&quot;https://www.iplaysoft.com/tag/%E4%B8%8B%E8%BD%BD&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;下载&lt;/a&gt;、保存、传输都比较方便。用来测试日常使用的电子设备的回放解码能力还是可以的。&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;aligncenter size-medium&quot; src=&quot;https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/japan_in_8k.jpg&quot; srcset=&quot;https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/japan_in_8k.jpg 1x,https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/japan_in_8k_2x.jpg 2x&quot; alt=&quot;8K高清视频&quot; width=&quot;680&quot; height=&quot;382&quot; style=&quot;text-align: center;&quot;&gt;&lt;/p&gt;&lt;h3&gt;实际播放测试&lt;/h3&gt;&lt;p&gt;经站长实际测试，使用 &lt;a href=&quot;https://www.iplaysoft.com/go/mac&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;MacBook Pro 2017&lt;/a&gt; + &lt;a href=&quot;https://www.iplaysoft.com/iina.html&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;IINA 播放器&lt;/a&gt;，全部 4K~12K 视频均能流畅播放，没有任何鸭梨。而 Windows 系统下，则推荐使用 &lt;a href=&quot;https://www.iplaysoft.com/potplayer.html&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;PotPlayer&lt;/a&gt;。另外，不安装第三方播放器的情况下，WebP 视频用 &lt;a href=&quot;https://www.iplaysoft.com/google-chrome.html&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;Chrome 谷歌浏览器&lt;/a&gt;、&lt;a href=&quot;https://www.iplaysoft.com/firefox.html&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;FireFox&lt;/a&gt; 似乎都能直接实现硬解播放。&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;aligncenter size-medium&quot; src=&quot;https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/8k_japan.jpg&quot; srcset=&quot;https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/8k_japan.jpg 1x,https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/8k_japan_2x.jpg 2x&quot; alt=&quot;8K高清视频&quot; width=&quot;680&quot; height=&quot;382&quot; style=&quot;text-align: center;&quot;&gt;&lt;/p&gt;&lt;p&gt;在手机上测试，&lt;a href=&quot;https://www.iplaysoft.com/go/iphone&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;iPhone X&lt;/a&gt; 使用 &lt;a href=&quot;https://www.iplaysoft.com/nplayer.html&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;nPlayer&lt;/a&gt; 通过 WiFi 无线播放 &lt;a href=&quot;https://www.iplaysoft.com/go/nas&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;NAS&lt;/a&gt; 里的视频，4K 流畅、8K 略卡顿、12K 闪退，应该是播放器未对高分辨率做适配，因时间关系未对其他 APP 进行测试。感兴趣的同学可以试试看哪款手机、哪款 APP 可以流畅播放 12K 视频吧。&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;aligncenter size-medium&quot; src=&quot;https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/4k_canada.jpg&quot; srcset=&quot;https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/4k_canada.jpg 1x,https://img.iplaysoft.com/wp-content/uploads/2018/4k-8k-12k-video/4k_canada_2x.jpg 2x&quot; alt=&quot;4K 加拿大高清风景视频&quot; width=&quot;680&quot; height=&quot;340&quot; style=&quot;text-align: center;&quot;&gt;&lt;/p&gt;&lt;h3&gt;12K、8K、4K 视频包括：&lt;/h3&gt;&lt;ul&gt;&lt;li&gt;12K 纽约曼哈顿&lt;/li&gt;&lt;li&gt;12K 纽约上空&lt;/li&gt;&lt;li&gt;8K 日本风光&lt;/li&gt;&lt;li&gt;5K 美国亚利桑那&lt;/li&gt;&lt;li&gt;4K 美国拉斯维加斯&lt;/li&gt;&lt;li&gt;4K 加拿大&lt;/li&gt;&lt;li&gt;4K 伊斯坦布尔&lt;/li&gt;&lt;/ul&gt;&lt;h3&gt;8K 高清视频预览&lt;/h3&gt;&lt;p&gt;下面给出一个在线预览的 8K 日本风景视频，要注意的是，这个纯粹是让你提前了解下视频的内容。因为在线版大大缩减了分辨率，只有渣画质，与「高清」毫无关系。&lt;span&gt;要看真实效果必须下载回去播放&lt;/span&gt;，这里仅供你预览。&lt;/p&gt;&lt;div class=&quot;post-video&quot; id=&quot;post-video-0&quot;&gt;&lt;div class=&quot;post-video-image&quot; id=&quot;post-video-image-0&quot;&gt;&lt;/div&gt;&lt;div class=&quot;post-video-loader&quot; style=&quot;text-align: center;&quot;&gt;&lt;div class=&quot;post-video-loader-icon ipsicon ipsicon-play&quot;&gt;&lt;/div&gt;&lt;div&gt;点击开始播放视频&lt;/div&gt;&lt;/div&gt;&lt;a class=&quot;post-video-loader-link&quot; rel=&quot;nofollow&quot;&gt;&lt;/a&gt;&lt;/div&gt;&lt;h3&gt;写在后面：&lt;/h3&gt;&lt;p&gt;无论是用于测试设备的播放&lt;a href=&quot;https://www.iplaysoft.com/tag/%E6%80%A7%E8%83%BD&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;性能&lt;/a&gt;，还是用来做店面的演示，这些超高清的风景视频都是极好的&lt;a href=&quot;https://www.iplaysoft.com/tag/%E7%B4%A0%E6%9D%90&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;素材&lt;/a&gt;！既安静唯美，又拥有惊人的清晰效果。&lt;/p&gt;&lt;p&gt;#dfdfdf&lt;/p&gt;&lt;p&gt;dfdf &lt;/p&gt;&lt;p&gt;虽然现在 4K 片源的&lt;a href=&quot;https://www.iplaysoft.com/tag/%E7%94%B5%E5%BD%B1&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;电影&lt;/a&gt;和视频已经很多了，但想要更高的 8K 甚至 12K 的视频还比较少。如果你也喜欢收藏这些高清的风光&lt;a href=&quot;https://www.iplaysoft.com/tag/%E6%91%84%E5%BD%B1&quot; target=&quot;_blank&quot; rel=&quot;noopener&quot;&gt;摄影&lt;/a&gt;视频，不妨下载回去看看吧。&lt;/p&gt;', 9, 1);
INSERT INTO `xman_article` VALUES (13, '经典模块化前端框架', 4, '&lt;div class=&quot;site-banner&quot; style=&quot;text-align: center;&quot;&gt;&lt;div class=&quot;site-banner-main&quot;&gt;&lt;div class=&quot;layui-anim site-desc site-desc-anim&quot;&gt;&lt;p class=&quot;web-font-desc&quot;&gt;&lt;img src=&quot;http://x.imxiny.com/Public/static/layui/images/face/4.gif&quot; alt=&quot;[可怜]&quot;&gt;是打发斯蒂芬&lt;/p&gt;&lt;/div&gt;&lt;/div&gt;&lt;/div&gt;', 8, 1);
INSERT INTO `xman_article` VALUES (14, '秦始皇11', 6, '&lt;div class=&quot;para&quot; label-module=&quot;para&quot;&gt;&lt;span&gt;秦始皇&lt;/span&gt;（前259年农历十二月初三—前210年），&lt;span&gt;嬴&lt;/span&gt;姓，&lt;span&gt;赵&lt;/span&gt;氏，名&lt;span&gt;政&lt;/span&gt;，又名&lt;span&gt;赵正&lt;/span&gt;（政）、&lt;span&gt;秦政&lt;/span&gt;，或称&lt;span&gt;祖龙&lt;span class=&quot;sup--normal&quot; data-sup=&quot;1-2&quot;&gt;&amp;nbsp;[1-2]&lt;/span&gt;&lt;a name=&quot;ref_[1-2]_5397432&quot; class=&quot;sup-anchor&quot;&gt;&amp;nbsp;&lt;/a&gt;&amp;nbsp;&lt;/span&gt;&lt;span&gt;&lt;/span&gt;，&lt;a href=&quot;https://baike.baidu.com/item/%E7%A7%A6%E5%BA%84%E8%A5%84%E7%8E%8B/6500378&quot; target=&quot;_blank&quot; data-lemmaid=&quot;6500378&quot;&gt;秦庄襄王&lt;/a&gt;之子。&lt;span class=&quot;sup--normal&quot; data-sup=&quot;3&quot;&gt;&amp;nbsp;[3]&lt;/span&gt;&lt;a name=&quot;ref_[3]_5397432&quot; class=&quot;sup-anchor&quot;&gt;&amp;nbsp;&lt;/a&gt;&amp;nbsp;中国历史上著名的&lt;a href=&quot;https://baike.baidu.com/item/%E6%94%BF%E6%B2%BB%E5%AE%B6&quot; target=&quot;_blank&quot;&gt;政治家&lt;/a&gt;、&lt;a href=&quot;https://baike.baidu.com/item/%E6%88%98%E7%95%A5%E5%AE%B6/1242707&quot; target=&quot;_blank&quot; data-lemmaid=&quot;1242707&quot;&gt;战略家&lt;/a&gt;、&lt;a href=&quot;https://baike.baidu.com/item/%E6%94%B9%E9%9D%A9%E5%AE%B6/7239695&quot; target=&quot;_blank&quot; data-lemmaid=&quot;7239695&quot;&gt;改革家&lt;/a&gt;，完成&lt;a href=&quot;https://baike.baidu.com/item/%E5%8D%8E%E5%A4%8F/5823&quot; target=&quot;_blank&quot; data-lemmaid=&quot;5823&quot;&gt;华夏&lt;/a&gt;大一统的铁腕政治人物，也是中国第一个称皇帝的君主。&lt;span class=&quot;sup--normal&quot; data-sup=&quot;4&quot;&gt;&amp;nbsp;[4]&lt;/span&gt;&lt;a name=&quot;ref_[4]_5397432&quot; class=&quot;sup-anchor&quot;&gt;&amp;nbsp;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;para&quot; label-module=&quot;para&quot;&gt;秦始皇是出生于&lt;a href=&quot;https://baike.baidu.com/item/%E8%B5%B5%E5%9B%BD/1641&quot; target=&quot;_blank&quot; data-lemmaid=&quot;1641&quot;&gt;赵国&lt;/a&gt;都城&lt;a href=&quot;https://baike.baidu.com/item/%E9%82%AF%E9%83%B8/334665&quot; target=&quot;_blank&quot; data-lemmaid=&quot;334665&quot;&gt;邯郸&lt;/a&gt;（今&lt;a href=&quot;https://baike.baidu.com/item/%E9%82%AF%E9%83%B8/334665&quot; target=&quot;_blank&quot; data-lemmaid=&quot;334665&quot;&gt;邯郸&lt;/a&gt;），并在此度过了少年时期。前247年，13岁时即王位。&lt;span class=&quot;sup--normal&quot; data-sup=&quot;5&quot;&gt;&amp;nbsp;[5]&lt;/span&gt;&lt;a name=&quot;ref_[5]_5397432&quot; class=&quot;sup-anchor&quot;&gt;&amp;nbsp;&lt;/a&gt;&amp;nbsp;前238年，22岁时，在故都&lt;a href=&quot;https://baike.baidu.com/item/%E9%9B%8D%E5%9F%8E&quot; target=&quot;_blank&quot;&gt;雍城&lt;/a&gt;举行了国君成人加冕仪式，开始“亲理朝政”，除掉&lt;a href=&quot;https://baike.baidu.com/item/%E5%90%95%E4%B8%8D%E9%9F%A6/593525&quot; target=&quot;_blank&quot; data-lemmaid=&quot;593525&quot;&gt;吕不韦&lt;/a&gt;、&lt;a href=&quot;https://baike.baidu.com/item/%E5%AB%AA%E6%AF%90/533294&quot; target=&quot;_blank&quot; data-lemmaid=&quot;533294&quot;&gt;嫪毐&lt;/a&gt;等人，&lt;span class=&quot;sup--normal&quot; data-sup=&quot;6&quot;&gt;&amp;nbsp;[6]&lt;/span&gt;&lt;a name=&quot;ref_[6]_5397432&quot; class=&quot;sup-anchor&quot;&gt;&amp;nbsp;&lt;/a&gt;&amp;nbsp;重用&lt;a href=&quot;https://baike.baidu.com/item/%E6%9D%8E%E6%96%AF/1322&quot; target=&quot;_blank&quot; data-lemmaid=&quot;1322&quot;&gt;李斯&lt;/a&gt;、&lt;a href=&quot;https://baike.baidu.com/item/%E5%B0%89%E7%BC%AD/978068&quot; target=&quot;_blank&quot; data-lemmaid=&quot;978068&quot;&gt;尉缭&lt;/a&gt;，自前230年至前221年，先后灭韩、赵、魏、楚、燕、齐六国，39岁时完成了统一中国大业，建立起一个以&lt;a href=&quot;https://baike.baidu.com/item/%E6%B1%89%E6%97%8F/130605&quot; target=&quot;_blank&quot; data-lemmaid=&quot;130605&quot;&gt;汉族&lt;/a&gt;为主体统一的中央集权的强大国家——&lt;a href=&quot;https://baike.baidu.com/item/%E7%A7%A6%E6%9C%9D/195083&quot; target=&quot;_blank&quot; data-lemmaid=&quot;195083&quot;&gt;秦朝&lt;/a&gt;，并奠定&lt;a href=&quot;https://baike.baidu.com/item/%E4%B8%AD%E5%9B%BD%E6%9C%AC%E5%9C%9F/11029068&quot; target=&quot;_blank&quot; data-lemmaid=&quot;11029068&quot;&gt;中国本土&lt;/a&gt;的疆域。&lt;span class=&quot;sup--normal&quot; data-sup=&quot;4&quot;&gt;&amp;nbsp;[4]&lt;/span&gt;&lt;a name=&quot;ref_[4]_5397432&quot; class=&quot;sup-anchor&quot;&gt;&amp;nbsp;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;para&quot; label-module=&quot;para&quot;&gt;秦始皇认为自己的&lt;a href=&quot;https://baike.baidu.com/item/%E5%8A%9F%E5%8A%B3/11046219&quot; target=&quot;_blank&quot; data-lemmaid=&quot;11046219&quot;&gt;功劳&lt;/a&gt;胜过之前的&lt;a href=&quot;https://baike.baidu.com/item/%E4%B8%89%E7%9A%87%E4%BA%94%E5%B8%9D/138427&quot; target=&quot;_blank&quot; data-lemmaid=&quot;138427&quot;&gt;三皇五帝&lt;/a&gt;，采用&lt;a href=&quot;https://baike.baidu.com/item/%E4%B8%89%E7%9A%87/1643592&quot; target=&quot;_blank&quot; data-lemmaid=&quot;1643592&quot;&gt;三皇&lt;/a&gt;之“皇”、&lt;a href=&quot;https://baike.baidu.com/item/%E4%BA%94%E5%B8%9D/362094&quot; target=&quot;_blank&quot; data-lemmaid=&quot;362094&quot;&gt;五帝&lt;/a&gt;之“帝”构成“皇帝”的称号，&lt;span class=&quot;sup--normal&quot; data-sup=&quot;7&quot;&gt;&amp;nbsp;[7]&lt;/span&gt;&lt;a name=&quot;ref_[7]_5397432&quot; class=&quot;sup-anchor&quot;&gt;&amp;nbsp;&lt;/a&gt;&amp;nbsp;是中国历史上第一个使用“皇帝”称号的君主，所以自称“始皇帝”。同时在中央实行&lt;a href=&quot;https://baike.baidu.com/item/%E4%B8%89%E5%85%AC%E4%B9%9D%E5%8D%BF/905905&quot; target=&quot;_blank&quot; data-lemmaid=&quot;905905&quot;&gt;三公九卿&lt;/a&gt;，管理国家大事。地方上废除&lt;a href=&quot;https://baike.baidu.com/item/%E5%88%86%E5%B0%81%E5%88%B6/755093&quot; target=&quot;_blank&quot; data-lemmaid=&quot;755093&quot;&gt;分封制&lt;/a&gt;，代以&lt;a href=&quot;https://baike.baidu.com/item/%E9%83%A1%E5%8E%BF%E5%88%B6/1859555&quot; target=&quot;_blank&quot; data-lemmaid=&quot;1859555&quot;&gt;郡县制&lt;/a&gt;，同时&lt;a href=&quot;https://baike.baidu.com/item/%E4%B9%A6%E5%90%8C%E6%96%87/858625&quot; target=&quot;_blank&quot; data-lemmaid=&quot;858625&quot;&gt;书同文&lt;/a&gt;，&lt;a href=&quot;https://baike.baidu.com/item/%E8%BD%A6%E5%90%8C%E8%BD%A8/858511&quot; target=&quot;_blank&quot; data-lemmaid=&quot;858511&quot;&gt;车同轨&lt;/a&gt;，统一&lt;a href=&quot;https://baike.baidu.com/item/%E5%BA%A6%E9%87%8F%E8%A1%A1&quot; target=&quot;_blank&quot;&gt;度量衡&lt;/a&gt;。对外北击&lt;a href=&quot;https://baike.baidu.com/item/%E5%8C%88%E5%A5%B4/294798&quot; target=&quot;_blank&quot; data-lemmaid=&quot;294798&quot;&gt;匈奴&lt;/a&gt;，南征&lt;a href=&quot;https://baike.baidu.com/item/%E7%99%BE%E8%B6%8A/1979157&quot; target=&quot;_blank&quot; data-lemmaid=&quot;1979157&quot;&gt;百越&lt;/a&gt;，修筑&lt;a href=&quot;https://baike.baidu.com/item/%E4%B8%87%E9%87%8C%E9%95%BF%E5%9F%8E/35257&quot; target=&quot;_blank&quot; data-lemmaid=&quot;35257&quot;&gt;万里长城&lt;/a&gt;，修筑&lt;a href=&quot;https://baike.baidu.com/item/%E7%81%B5%E6%B8%A0/599313&quot; target=&quot;_blank&quot; data-lemmaid=&quot;599313&quot;&gt;灵渠&lt;/a&gt;，沟通水系。&lt;/div&gt;&lt;div class=&quot;para&quot; label-module=&quot;para&quot;&gt;但是到了后期，求仙梦想长生，苛政虐民，扼杀民&lt;a href=&quot;https://baike.baidu.com/item/%E6%99%BA/13680607&quot; target=&quot;_blank&quot; data-lemmaid=&quot;13680607&quot;&gt;智&lt;/a&gt;，动摇了秦朝统治的根基，前210年，&lt;a href=&quot;https://baike.baidu.com/item/%E7%A7%A6%E5%A7%8B%E7%9A%87%E4%B8%9C%E5%B7%A1&quot; target=&quot;_blank&quot;&gt;秦始皇东巡&lt;/a&gt;途中驾崩于&lt;a href=&quot;https://baike.baidu.com/item/%E9%82%A2%E5%8F%B0/264966&quot; target=&quot;_blank&quot; data-lemmaid=&quot;264966&quot;&gt;邢台&lt;/a&gt;&lt;a href=&quot;https://baike.baidu.com/item/%E6%B2%99%E4%B8%98/8511221&quot; target=&quot;_blank&quot; data-lemmaid=&quot;8511221&quot;&gt;沙丘&lt;/a&gt;。&lt;span class=&quot;sup--normal&quot; data-sup=&quot;8&quot;&gt;&amp;nbsp;[8]&lt;/span&gt;&lt;a name=&quot;ref_[8]_5397432&quot; class=&quot;sup-anchor&quot;&gt;&amp;nbsp;&lt;/a&gt;&lt;/div&gt;&lt;div class=&quot;para&quot; label-module=&quot;para&quot;&gt;秦始皇是中国历史上一位叱咤风云富有传奇色彩的划时代人物，是中国历史上第一个大一统王朝——&lt;a href=&quot;https://baike.baidu.com/item/%E7%A7%A6%E7%8E%8B%E6%9C%9D/8932675&quot; target=&quot;_blank&quot; data-lemmaid=&quot;8932675&quot;&gt;秦王朝&lt;/a&gt;的开国皇帝，对中国和世界历史产生深远影响，把中国推向&lt;a href=&quot;https://baike.baidu.com/item/%E5%A4%A7%E4%B8%80%E7%BB%9F/5485731&quot; target=&quot;_blank&quot; data-lemmaid=&quot;5485731&quot;&gt;大一统&lt;/a&gt;时代，奠定中国两千余年&lt;a href=&quot;https://baike.baidu.com/item/%E6%94%BF%E6%B2%BB%E5%88%B6%E5%BA%A6/2135182&quot; target=&quot;_blank&quot; data-lemmaid=&quot;2135182&quot;&gt;政治制度&lt;/a&gt;基本格局，被明代思想家&lt;a href=&quot;https://baike.baidu.com/item/%E6%9D%8E%E8%B4%BD/478732&quot; target=&quot;_blank&quot; data-lemmaid=&quot;478732&quot;&gt;李贽&lt;/a&gt;誉为“&lt;a href=&quot;https://baike.baidu.com/item/%E5%8D%83%E5%8F%A4%E4%B8%80%E5%B8%9D/33644&quot; target=&quot;_blank&quot; data-lemmaid=&quot;33644&quot;&gt;千古一帝&lt;/a&gt;”&lt;span class=&quot;sup--normal&quot; data-sup=&quot;9&quot;&gt;&amp;nbsp;[9]&lt;/span&gt;&lt;a name=&quot;ref_[9]_5397432&quot; class=&quot;sup-anchor&quot;&gt;&amp;nbsp;&lt;/a&gt;&amp;nbsp;。&lt;span class=&quot;sup--normal&quot; data-sup=&quot;4&quot;&gt;&amp;nbsp;[4]&lt;/span&gt;&lt;a name=&quot;ref_[4]_5397432&quot; class=&quot;sup-anchor&quot;&gt;&amp;nbsp;&lt;/a&gt;&lt;/div&gt;', 9, 1);
INSERT INTO `xman_article` VALUES (15, 'test', 4, '&lt;img src=&quot;http://x.imxiny.com/Public/static/layui/images/face/1.gif&quot; alt=&quot;[嘻嘻]&quot;&gt;这个有点厉害了11', 6, 1);
INSERT INTO `xman_article` VALUES (16, '3333333333332', 4, '&lt;p&gt;&lt;b&gt;ceshi倒萨&lt;/b&gt;打算&lt;b&gt;打打算算 送达&lt;/b&gt;倒萨打算&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;https://testyao.oss-cn-beijing.aliyuncs.com/images/20190614/5d036f29be902.png&quot; alt=&quot;DNS.png&quot;&gt;&lt;/p&gt;', 10, 1);
INSERT INTO `xman_article` VALUES (17, '1', 9, '1', 10, 0);
INSERT INTO `xman_article` VALUES (18, '212', 4, '&lt;b&gt;12312&lt;/b&gt;', 0, 1);
INSERT INTO `xman_article` VALUES (19, 'fd', 5, 'df', 11, 0);
INSERT INTO `xman_article` VALUES (20, '得的', 4, '&lt;img src=&quot;https://testyao.oss-cn-beijing.aliyuncs.com/images/20181016/5bc5c1e5c0af3.jpg&quot; alt=&quot;2.jpg&quot;&gt;曾多次到成都传递出的长长的', 10, 0);
INSERT INTO `xman_article` VALUES (21, '测试', 5, '&lt;p&gt;测试&lt;/p&gt;', 0, 1);
INSERT INTO `xman_article` VALUES (22, '热热热', 5, '热热热', 0, 1);
INSERT INTO `xman_article` VALUES (23, 'aaaaa', 4, '&lt;p&gt;&lt;img src=&quot;https://testyao.oss-cn-beijing.aliyuncs.com/images/20190426/5cc2a3002046e.jpg&quot; alt=&quot;微信图片_20190325160000.jpg&quot;&gt;&lt;/p&gt;&lt;p&gt;哈哈哈哈哈&lt;/p&gt;', 6, 1);

-- ----------------------------
-- Table structure for xman_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `xman_auth_group`;
CREATE TABLE `xman_auth_group`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `rules` varchar(2048) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_auth_group
-- ----------------------------
INSERT INTO `xman_auth_group` VALUES (1, '超级管理员', '拥有所有权限', 1, '27,116,117,118,119,164,165,166,167,172,173,174,175,29,12,63,64,65,66,67,68,17,1,2,5,6,10,18,41,42,43,32,37,38,39,40,19,44,45,46,47,48,50,159,160,161,162,145,146,147,148,149,151,152,153,154,155,156,157,158,163,176,177,178,179');
INSERT INTO `xman_auth_group` VALUES (5, 'testdemo', '展示所用角色组', 1, '27,116,117,118,164,165,166,172,173,174,29,12,63,65,67,17,1,18,32,19,47,48,159,145,146,147,151,152,153,154,163,176,177');

-- ----------------------------
-- Table structure for xman_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `xman_auth_group_access`;
CREATE TABLE `xman_auth_group_access`  (
  `uid` mediumint(8) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_auth_group_access
-- ----------------------------
INSERT INTO `xman_auth_group_access` VALUES (1, 1);
INSERT INTO `xman_auth_group_access` VALUES (2, 1);
INSERT INTO `xman_auth_group_access` VALUES (15, 1);
INSERT INTO `xman_auth_group_access` VALUES (17, 5);
INSERT INTO `xman_auth_group_access` VALUES (18, 1);
INSERT INTO `xman_auth_group_access` VALUES (19, 1);

-- ----------------------------
-- Table structure for xman_auth_menus
-- ----------------------------
DROP TABLE IF EXISTS `xman_auth_menus`;
CREATE TABLE `xman_auth_menus`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名字',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '0父级菜单',
  `rule_id` int(11) NOT NULL DEFAULT 0 COMMENT '绑定的规则id url',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'iconfont icon-menu1' COMMENT '菜单图标',
  `target` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '打开位置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_auth_menus
-- ----------------------------
INSERT INTO `xman_auth_menus` VALUES (1, '内容管理', 0, 27, 'iconfont xman-file-text', 'default');
INSERT INTO `xman_auth_menus` VALUES (3, '系统设置', 0, 29, 'iconfont xman-menu', 'default');
INSERT INTO `xman_auth_menus` VALUES (6, '规则管理', 20, 1, 'layui-icon layui-icon-align-center', 'default');
INSERT INTO `xman_auth_menus` VALUES (7, '后台用户管理', 20, 18, 'layui-icon layui-icon-username', 'default');
INSERT INTO `xman_auth_menus` VALUES (8, '角色组管理', 20, 32, 'layui-icon layui-icon-user', 'default');
INSERT INTO `xman_auth_menus` VALUES (9, '用户管理', 1, 116, 'layui-icon layui-icon-username', 'default');
INSERT INTO `xman_auth_menus` VALUES (18, '菜单管理', 3, 19, 'iconfont xman-menu', 'default');
INSERT INTO `xman_auth_menus` VALUES (19, '点赞', 3, 163, 'iconfont xman-like-fill', '_blank');
INSERT INTO `xman_auth_menus` VALUES (20, '权限管理', 3, 32, 'iconfont xman-file-text', 'default');
INSERT INTO `xman_auth_menus` VALUES (28, 'Test控制器', 3, 145, 'layui-icon layui-icon-rate', 'default');
INSERT INTO `xman_auth_menus` VALUES (30, '错误日志', 39, 63, 'layui-icon layui-icon-tabs', 'default');
INSERT INTO `xman_auth_menus` VALUES (31, '操作日志', 39, 67, 'iconfont xman-control-fill', 'default');
INSERT INTO `xman_auth_menus` VALUES (32, '登录日志', 39, 65, 'layui-icon layui-icon-log', 'default');
INSERT INTO `xman_auth_menus` VALUES (34, '分类管理', 1, 164, 'iconfont xman-sliders', 'default');
INSERT INTO `xman_auth_menus` VALUES (36, '代码生成器', 3, 48, 'iconfont xman-android', 'default');
INSERT INTO `xman_auth_menus` VALUES (37, '留言板', 1, 176, 'layui-icon layui-icon-survey', 'default');
INSERT INTO `xman_auth_menus` VALUES (38, '留言板', 3, 176, 'layui-icon layui-icon-survey', 'default');
INSERT INTO `xman_auth_menus` VALUES (39, '系统日志', 3, 12, 'layui-icon layui-icon-tabs', 'default');
INSERT INTO `xman_auth_menus` VALUES (40, 'testtest', 1, 154, 'iconfont xman-menu', 'default');
INSERT INTO `xman_auth_menus` VALUES (41, '更新日志', 3, 155, 'layui-icon layui-icon-note', 'default');
INSERT INTO `xman_auth_menus` VALUES (42, '点赞', 1, 163, 'iconfont xman-like', 'default');
INSERT INTO `xman_auth_menus` VALUES (43, '文章管理', 1, 172, 'layui-icon layui-icon-read', 'default');
INSERT INTO `xman_auth_menus` VALUES (44, '皮肤管理', 3, 159, 'iconfont xman-skin', 'default');

-- ----------------------------
-- Table structure for xman_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `xman_auth_rule`;
CREATE TABLE `xman_auth_rule`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否支持表达式 1支持',
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '表达式',
  `is_url` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0：不是url 1：url',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父级权限',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 180 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_auth_rule
-- ----------------------------
INSERT INTO `xman_auth_rule` VALUES (1, 'admin/auth/rule', '规则管理', 1, 1, '', 1, 17);
INSERT INTO `xman_auth_rule` VALUES (2, 'admin/auth/add_rule', '添加规则', 1, 1, '', 0, 1);
INSERT INTO `xman_auth_rule` VALUES (5, 'admin/auth/fast_change_rule', '快速更改规则状态', 1, 1, '', 0, 1);
INSERT INTO `xman_auth_rule` VALUES (6, 'admin/auth/edit_rule', '修改规则', 1, 1, '', 0, 1);
INSERT INTO `xman_auth_rule` VALUES (10, 'admin/auth/del_rule', '删除规则', 1, 1, '', 0, 1);
INSERT INTO `xman_auth_rule` VALUES (12, 'system_log', '系统日志', 1, 1, '', 0, 29);
INSERT INTO `xman_auth_rule` VALUES (17, 'auth', '权限管理', 1, 1, '', 0, 29);
INSERT INTO `xman_auth_rule` VALUES (18, 'admin/auth/admin_user', '用户管理', 1, 1, '', 1, 17);
INSERT INTO `xman_auth_rule` VALUES (19, 'admin/auth/menus', '菜单管理', 1, 1, '', 1, 29);
INSERT INTO `xman_auth_rule` VALUES (27, 'content', '内容管理', 1, 1, '', 0, 0);
INSERT INTO `xman_auth_rule` VALUES (29, 'system', '系统设置', 1, 1, '', 0, 0);
INSERT INTO `xman_auth_rule` VALUES (32, 'admin/auth/group', '角色组管理', 1, 1, '', 1, 17);
INSERT INTO `xman_auth_rule` VALUES (37, 'admin/auth/add_group', '添加角色组', 1, 1, '', 0, 32);
INSERT INTO `xman_auth_rule` VALUES (38, 'admin/auth/edit_group', '修改角色组', 1, 1, '', 0, 32);
INSERT INTO `xman_auth_rule` VALUES (39, 'admin/auth/del_group', '删除角色组', 1, 1, '', 0, 32);
INSERT INTO `xman_auth_rule` VALUES (40, 'admin/auth/fast_change_group', '快速修改角色组', 1, 1, '', 0, 32);
INSERT INTO `xman_auth_rule` VALUES (41, 'admin/auth/add_admin', '添加后台用户', 1, 1, '', 0, 18);
INSERT INTO `xman_auth_rule` VALUES (42, 'admin/auth/edit_admin', '修改后台用户', 1, 1, '', 0, 18);
INSERT INTO `xman_auth_rule` VALUES (43, 'admin/auth/del_admin', '删除后台用户', 1, 1, '', 0, 18);
INSERT INTO `xman_auth_rule` VALUES (44, 'admin/auth/add_menu', '添加菜单', 1, 1, '', 0, 19);
INSERT INTO `xman_auth_rule` VALUES (45, 'admin/auth/edit_menu', '修改菜单', 1, 1, '', 0, 19);
INSERT INTO `xman_auth_rule` VALUES (46, 'admin/auth/del_menu', '删除菜单', 1, 1, '', 0, 19);
INSERT INTO `xman_auth_rule` VALUES (47, 'admin/auth/change_menu_sort', '菜单排序', 1, 1, '', 0, 19);
INSERT INTO `xman_auth_rule` VALUES (48, 'admin/makecode/index', '代码生成器', 1, 1, '', 1, 29);
INSERT INTO `xman_auth_rule` VALUES (50, 'admin/makecode/make', '生成代码', 1, 1, '', 1, 48);
INSERT INTO `xman_auth_rule` VALUES (63, 'admin/systemerrorlog/index', '错误日志', 1, 1, '', 1, 12);
INSERT INTO `xman_auth_rule` VALUES (64, 'admin/systemerrorlog/delete', '删除错误日志', 1, 1, '', 0, 63);
INSERT INTO `xman_auth_rule` VALUES (65, 'admin/systemloginlog/index', '登录日志', 1, 1, '', 1, 12);
INSERT INTO `xman_auth_rule` VALUES (66, 'admin/systemloginlog/delete', '删除登录日志', 1, 1, '', 0, 65);
INSERT INTO `xman_auth_rule` VALUES (67, 'admin/systemoperationlog/index', '操作日志', 1, 1, '', 1, 12);
INSERT INTO `xman_auth_rule` VALUES (68, 'admin/systemoperationlog/delete', '删除操作日志', 1, 1, '', 0, 67);
INSERT INTO `xman_auth_rule` VALUES (116, 'admin/user/index', 'User/index', 1, 1, '', 1, 27);
INSERT INTO `xman_auth_rule` VALUES (117, 'admin/user/add', 'User/add', 1, 1, '', 0, 116);
INSERT INTO `xman_auth_rule` VALUES (118, 'admin/user/edit', 'User/edit', 1, 1, '', 0, 116);
INSERT INTO `xman_auth_rule` VALUES (119, 'admin/user/delete', 'User/delete', 1, 1, '', 0, 116);
INSERT INTO `xman_auth_rule` VALUES (145, 'admin/test/index', 'Test/index', 1, 1, '', 1, 0);
INSERT INTO `xman_auth_rule` VALUES (146, 'admin/test/add', 'Test/add', 1, 1, '', 0, 145);
INSERT INTO `xman_auth_rule` VALUES (147, 'admin/test/edit', 'Test/edit', 1, 1, '', 0, 145);
INSERT INTO `xman_auth_rule` VALUES (148, 'admin/test/delete', 'Test/delete', 1, 1, '', 0, 145);
INSERT INTO `xman_auth_rule` VALUES (149, 'admin/index/changepass', '修改密码', 1, 1, '', 0, 0);
INSERT INTO `xman_auth_rule` VALUES (151, 'admin/testtest/add', 'Testtest/add', 1, 1, '', 0, 150);
INSERT INTO `xman_auth_rule` VALUES (152, 'admin/testtest/edit', 'Testtest/edit', 1, 1, '', 0, 150);
INSERT INTO `xman_auth_rule` VALUES (153, 'admin/testtest/delete', 'Testtest/delete', 1, 1, '', 0, 150);
INSERT INTO `xman_auth_rule` VALUES (154, 'admin/testtest/index', 'Testtest/index', 1, 1, '', 1, 0);
INSERT INTO `xman_auth_rule` VALUES (155, 'admin/updatelog/index', '更新日志管理', 1, 1, '', 1, 0);
INSERT INTO `xman_auth_rule` VALUES (156, 'admin/updatelog/add', '添加更新日志', 1, 1, '', 0, 155);
INSERT INTO `xman_auth_rule` VALUES (157, 'admin/updatelog/edit', '修改更新日志', 1, 1, '', 0, 155);
INSERT INTO `xman_auth_rule` VALUES (158, 'admin/updatelog/delete', '删除更新日志', 1, 1, '', 0, 155);
INSERT INTO `xman_auth_rule` VALUES (159, 'admin/systemskin/index', '皮肤管理', 1, 1, '', 1, 29);
INSERT INTO `xman_auth_rule` VALUES (160, 'admin/systemskin/add', '添加皮肤', 1, 1, '', 0, 159);
INSERT INTO `xman_auth_rule` VALUES (161, 'admin/systemskin/edit', '修改皮肤', 1, 1, '', 0, 159);
INSERT INTO `xman_auth_rule` VALUES (162, 'admin/systemskin/delete', '删除皮肤', 1, 1, '', 0, 159);
INSERT INTO `xman_auth_rule` VALUES (163, 'https://fly.layui.com/case/u/8917272', '点赞', 1, 1, '', 1, 0);
INSERT INTO `xman_auth_rule` VALUES (164, 'admin/category/index', '文章分类管理', 1, 1, '', 1, 27);
INSERT INTO `xman_auth_rule` VALUES (165, 'admin/category/add', '文章分类/添加', 1, 1, '', 0, 164);
INSERT INTO `xman_auth_rule` VALUES (166, 'admin/category/edit', '文章分类/修改', 1, 1, '', 0, 164);
INSERT INTO `xman_auth_rule` VALUES (167, 'admin/category/delete', '文章分类/删除', 1, 1, '', 0, 164);
INSERT INTO `xman_auth_rule` VALUES (172, 'admin/article/index', '文章管理', 1, 1, '', 1, 27);
INSERT INTO `xman_auth_rule` VALUES (173, 'admin/article/add', '文章/添加', 1, 1, '', 0, 172);
INSERT INTO `xman_auth_rule` VALUES (174, 'admin/article/edit', '文章/修改', 1, 1, '', 0, 172);
INSERT INTO `xman_auth_rule` VALUES (175, 'admin/article/delete', '文章/删除', 1, 1, '', 0, 172);
INSERT INTO `xman_auth_rule` VALUES (176, 'admin/note/index', 'Note管理', 1, 1, '', 1, 0);
INSERT INTO `xman_auth_rule` VALUES (177, 'admin/note/add', 'Note/添加', 1, 1, '', 0, 176);
INSERT INTO `xman_auth_rule` VALUES (178, 'admin/note/edit', 'Note/修改', 1, 1, '', 0, 176);
INSERT INTO `xman_auth_rule` VALUES (179, 'admin/note/delete', 'Note/删除', 1, 1, '', 0, 176);

-- ----------------------------
-- Table structure for xman_category
-- ----------------------------
DROP TABLE IF EXISTS `xman_category`;
CREATE TABLE `xman_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别描述',
  `add_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_category
-- ----------------------------
INSERT INTO `xman_category` VALUES (4, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190122/5c46d01605c11.jpg', '1111asdasd233333333333333', '1111adsasd', '2020-01-24 00:02:02');
INSERT INTO `xman_category` VALUES (5, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190125/5c4a725b4e1f6.jpg', '八卦111', '八卦a', '2018-09-12 16:26:40');
INSERT INTO `xman_category` VALUES (6, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180912/5b98d0b8afbd8.jpg', '历史', '历史', '2018-09-14 16:40:12');
INSERT INTO `xman_category` VALUES (7, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180913/5b9a02bedd588.jpg', '123', '123', '2018-09-13 14:25:04');
INSERT INTO `xman_category` VALUES (8, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190531/5cf0e3f35685c.jpg', '234', '234324', '2018-09-13 16:49:49');
INSERT INTO `xman_category` VALUES (9, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180920/5ba2ffb38cb6a.jpg', '1', '1', '2018-09-20 10:02:15');
INSERT INTO `xman_category` VALUES (10, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190614/5d036ec6bd3ef.png', 'ss', '1', '2018-09-25 11:12:41');
INSERT INTO `xman_category` VALUES (11, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181011/5bbecaca0ec30.jpg', 'ada', 'aedqwd', '2018-10-12 00:00:00');
INSERT INTO `xman_category` VALUES (12, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181103/5bdd32a8a27e6.png', 'a', 'a', '2018-11-03 00:00:00');
INSERT INTO `xman_category` VALUES (13, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181109/5be460efe023c.png', '12', '1', '2018-11-09 00:14:53');
INSERT INTO `xman_category` VALUES (14, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181207/5c0a312b7ff9d.jpeg', '皮城', 'LOL', '2018-12-07 16:37:32');
INSERT INTO `xman_category` VALUES (15, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190526/5cea7c31417f6.png', 'erqewrweq', 'dfdfd', '2019-05-26 19:45:04');
INSERT INTO `xman_category` VALUES (16, 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190530/5cef9008b3a57.png', '234', '234', '2019-05-30 16:11:00');

-- ----------------------------
-- Table structure for xman_note
-- ----------------------------
DROP TABLE IF EXISTS `xman_note`;
CREATE TABLE `xman_note`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `word` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言',
  `add_time` datetime NOT NULL COMMENT '留言时间',
  `state` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '类型:0=建议,1=问题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_note
-- ----------------------------
INSERT INTO `xman_note` VALUES (1, '有任何意见或问题，可以在这里提交！\r\n1231', '2018-09-12 22:27:28', '0');
INSERT INTO `xman_note` VALUES (2, 'test', '2018-09-12 22:29:11', '0');
INSERT INTO `xman_note` VALUES (3, '213', '2018-09-13 00:00:00', '0');
INSERT INTO `xman_note` VALUES (4, 'tewtw', '2018-09-12 00:00:00', '0');
INSERT INTO `xman_note` VALUES (5, '11321', '2018-09-28 00:00:00', '0');
INSERT INTO `xman_note` VALUES (6, '1231231', '2018-09-19 00:00:00', '0');
INSERT INTO `xman_note` VALUES (7, '做到非常不错~~', '2018-09-28 09:37:40', '0');
INSERT INTO `xman_note` VALUES (8, '做的是真的好！', '2018-10-01 17:24:32', '0');
INSERT INTO `xman_note` VALUES (9, '2123', '2018-10-08 00:00:00', '0');
INSERT INTO `xman_note` VALUES (10, '666', '2018-10-24 11:15:52', '0');
INSERT INTO `xman_note` VALUES (11, '1223', '2018-10-24 00:00:00', '0');
INSERT INTO `xman_note` VALUES (12, '111', '2018-10-28 21:36:01', '0');
INSERT INTO `xman_note` VALUES (13, '21213123dsasda', '2018-10-28 21:36:11', '0');
INSERT INTO `xman_note` VALUES (14, ' wer r we r ', '2018-09-30 00:00:00', '0');
INSERT INTO `xman_note` VALUES (15, 'sfsfsdfsdfsdyy', '2018-11-08 11:59:19', '1');
INSERT INTO `xman_note` VALUES (16, 'asdfsdf', '2018-11-14 00:00:00', '0');
INSERT INTO `xman_note` VALUES (17, 'saf', '2018-11-21 00:00:00', '0');
INSERT INTO `xman_note` VALUES (18, '2222222222222222', '2018-11-22 15:15:19', '0');
INSERT INTO `xman_note` VALUES (19, '大帅哥到此一游', '2018-11-22 17:51:23', '0');
INSERT INTO `xman_note` VALUES (20, '厉害，膜拜大佬。', '2018-11-30 16:48:53', '0');
INSERT INTO `xman_note` VALUES (21, '2323', '2018-12-27 00:00:00', '0');
INSERT INTO `xman_note` VALUES (22, '张先生到此一游', '2018-12-24 11:43:14', '0');
INSERT INTO `xman_note` VALUES (23, '测试', '2019-01-08 00:00:00', '0');
INSERT INTO `xman_note` VALUES (24, '11', '2019-01-22 15:35:44', '0');
INSERT INTO `xman_note` VALUES (25, '那你', '2019-02-10 18:02:07', '0');
INSERT INTO `xman_note` VALUES (26, 'r', '2019-02-20 14:31:22', '0');
INSERT INTO `xman_note` VALUES (27, 'test', '2019-04-15 14:51:53', '0');
INSERT INTO `xman_note` VALUES (28, '1', '2019-05-13 16:04:14', '0');
INSERT INTO `xman_note` VALUES (29, 'gfdfg', '2019-05-26 19:37:40', '1');
INSERT INTO `xman_note` VALUES (30, 'dsfsafsafsd', '2019-05-26 19:43:45', '0');
INSERT INTO `xman_note` VALUES (31, '&lt;', '2019-05-27 21:40:35', '0');
INSERT INTO `xman_note` VALUES (32, '你好', '2019-05-30 22:11:38', '1');
INSERT INTO `xman_note` VALUES (33, '12121', '2019-06-28 00:00:00', '0');
INSERT INTO `xman_note` VALUES (34, '做的真好', '2019-06-14 17:58:16', '0');
INSERT INTO `xman_note` VALUES (35, '1', '2019-06-23 00:00:00', '0');

-- ----------------------------
-- Table structure for xman_system_error_log
-- ----------------------------
DROP TABLE IF EXISTS `xman_system_error_log`;
CREATE TABLE `xman_system_error_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `file` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所在文件',
  `line` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所在行',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '错误码',
  `message` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '错误信息',
  `trace` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'trace信息',
  `createtime` datetime NOT NULL COMMENT '发生时间',
  `admin_user_id` int(11) NULL DEFAULT NULL COMMENT '管理员ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_system_error_log
-- ----------------------------
INSERT INTO `xman_system_error_log` VALUES (1, 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rr\' for key \'test\'\n [ SQL语句 ] : INSERT INTO `xman_test` (`week`,`genderdata`,`content`,`image`,`attachfile`,`keywords`,`price`,`startdate`,`activitytime`,`year`,`times`,`ttswitch`,`teststate`) VALUES (\'monday\',\'male\',\'4rr\',\'/Public/Uploads/img/20180722/5b5362a369b95.png\',\'/Public/Uploads/file/20180722/5b5362a915268.png\',\'4rr\',\'0\',\'2018-07-22\',\'2018-07-22 00:43:27\',\'2018\',\'00:43:30\',\'1\',\'1,2\')', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(824): Think\\Db\\Driver->execute(\'INSERT INTO `xm...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(320): Think\\Db\\Driver->insert(Array, Array, false)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Admin\\Controller\\TestController.class.php(58): Think\\Model->add(Array)\n#5 [internal function]: Admin\\Controller\\TestController->add()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'add\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-22 01:10:13', 2);
INSERT INTO `xman_system_error_log` VALUES (2, 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rr\' for key \'test\'\n [ SQL语句 ] : INSERT INTO `xman_test` (`week`,`genderdata`,`content`,`image`,`attachfile`,`keywords`,`price`,`startdate`,`activitytime`,`year`,`times`,`ttswitch`,`teststate`) VALUES (\'monday\',\'male\',\'4rr\',\'/Public/Uploads/img/20180722/5b5362a369b95.png\',\'/Public/Uploads/file/20180722/5b5362a915268.png\',\'4rr\',\'0\',\'2018-07-22\',\'2018-07-22 00:43:27\',\'2018\',\'00:43:30\',\'1\',\'1,2\')', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(824): Think\\Db\\Driver->execute(\'INSERT INTO `xm...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(320): Think\\Db\\Driver->insert(Array, Array, false)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Admin\\Controller\\TestController.class.php(58): Think\\Model->add(Array)\n#5 [internal function]: Admin\\Controller\\TestController->add()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'add\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-22 01:10:46', 2);
INSERT INTO `xman_system_error_log` VALUES (3, 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rr\' for key \'test\'\n [ SQL语句 ] : UPDATE `xman_test` SET `week`=\'tuesday\',`genderdata`=\'female\',`content`=\'ttr\',`image`=\'/Public/Uploads/img/20180722/5b536cc910311.png\',`attachfile`=\'/Public/Uploads/file/20180722/5b536ccd6ecf0.sql\',`keywords`=\'4rr\',`price`=\'0\',`startdate`=\'2018-07-22\',`activitytime`=\'2018-07-22 01:26:43\',`year`=\'2018\',`times`=\'01:26:47\',`ttswitch`=\'1\',`teststate`=\'2,3\' WHERE `id` = 29', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(906): Think\\Db\\Driver->execute(\'UPDATE `xman_te...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(451): Think\\Db\\Driver->update(Array, Array)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Admin\\Controller\\TestController.class.php(84): Think\\Model->save(Array)\n#5 [internal function]: Admin\\Controller\\TestController->edit()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'edit\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-22 01:27:02', 2);
INSERT INTO `xman_system_error_log` VALUES (4, 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1292:Incorrect date value: \'\' for column \'startdate\' at row 1\n [ SQL语句 ] : INSERT INTO `xman_test` (`week`,`genderdata`,`content`,`image`,`attachfile`,`keywords`,`price`,`startdate`,`activitytime`,`year`,`times`,`ttswitch`,`teststate`) VALUES (\'monday\',\'male\',\'rr\',\'/Public/Uploads/img/20180722/5b536d520602f.png\',\'/Public/Uploads/file/20180722/5b536d56cfd7e.png\',\'rr\',\'0\',\'\',\'\',\'\',\'\',\'0\',\'1\')', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1292:Incorrect ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(824): Think\\Db\\Driver->execute(\'INSERT INTO `xm...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(320): Think\\Db\\Driver->insert(Array, Array, false)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Admin\\Controller\\TestController.class.php(59): Think\\Model->add(Array)\n#5 [internal function]: Admin\\Controller\\TestController->add()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'add\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-22 01:28:58', 2);
INSERT INTO `xman_system_error_log` VALUES (5, 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rr\' for key \'test\'\n [ SQL语句 ] : UPDATE `xman_test` SET `week`=\'monday\',`genderdata`=\'male\',`content`=\'4rr\',`image`=\'/Public/Uploads/img/20180722/5b547b4ce5e7f.jpg\',`attachfile`=\'/Public/Uploads/file/20180722/5b547b4fc23ab.jpg\',`keywords`=\'4rr\',`price`=\'0\',`startdate`=\'2018-07-22\',`activitytime`=\'2018-07-22 20:40:52\',`year`=\'2018\',`times`=\'20:40:55\',`switch`=\'1\',`ttswitch`=\'1\',`teststate`=\'1,2,3\',`test2state`=\'0,1,2\' WHERE `id` = 35', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(906): Think\\Db\\Driver->execute(\'UPDATE `xman_te...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(451): Think\\Db\\Driver->update(Array, Array)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Admin\\Controller\\TestController.class.php(84): Think\\Model->save(Array)\n#5 [internal function]: Admin\\Controller\\TestController->edit()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'edit\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-22 20:41:51', 2);
INSERT INTO `xman_system_error_log` VALUES (6, 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rr\' for key \'test\'\n [ SQL语句 ] : UPDATE `xman_test` SET `week`=\'monday\',`genderdata`=\'female\',`content`=\'testss\',`image`=\'/Public/Uploads/img/20180723/5b55321666936.jpg\',`attachfile`=\'/Public/Uploads/file/20180723/5b5532197d9ea.jpg\',`keywords`=\'4rr\',`price`=\'0\',`startdate`=\'2018-07-23\',`activitytime`=\'2018-07-23 09:40:47\',`year`=\'2018\',`times`=\'09:40:50\',`switch`=\'0\',`ttswitch`=\'1\',`teststate`=\'1,2\',`test2state`=\'0,1\' WHERE `id` = 33', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(906): Think\\Db\\Driver->execute(\'UPDATE `xman_te...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(451): Think\\Db\\Driver->update(Array, Array)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Common\\Controller\\MakeController.class.php(110): Think\\Model->save(Array)\n#5 [internal function]: Admin\\Controller\\TestController->edit()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'edit\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-23 09:41:17', 2);
INSERT INTO `xman_system_error_log` VALUES (7, 'C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Common\\functions.php', '102', '0', '1062:Duplicate entry \'4rrs\' for key \'test\'\n [ SQL语句 ] : UPDATE `xman_test` SET `week`=\'monday\',`genderdata`=\'female\',`content`=\'testss\',`image`=\'/Public/Uploads/img/20180723/5b55321666936.jpg\',`attachfile`=\'/Public/Uploads/file/20180723/5b5532197d9ea.jpg\',`keywords`=\'4rrs\',`price`=\'0\',`startdate`=\'2018-07-23\',`activitytime`=\'2018-07-23 09:40:47\',`year`=\'2018\',`times`=\'09:40:50\',`switch`=\'0\',`ttswitch`=\'1\',`teststate`=\'1,2\',`test2state`=\'0,1\' WHERE `id` = 33', '#0 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(350): E(\'1062:Duplicate ...\')\n#1 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(237): Think\\Db\\Driver->error()\n#2 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Db\\Driver.class.php(906): Think\\Db\\Driver->execute(\'UPDATE `xman_te...\', false)\n#3 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Model.class.php(451): Think\\Db\\Driver->update(Array, Array)\n#4 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\Application\\Common\\Controller\\MakeController.class.php(110): Think\\Model->save(Array)\n#5 [internal function]: Admin\\Controller\\TestController->edit()\n#6 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\TestController))\n#7 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\TestController), \'edit\')\n#8 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\App.class.php(204): Think\\App::exec()\n#9 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\Library\\Think\\Think.class.php(120): Think\\App::run()\n#10 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\ThinkPHP\\ThinkPHP.php(97): Think\\Think::start()\n#11 C:\\E\\PHPIDE\\VertrigoServ\\www\\xinyadmin\\index.php(31): require(\'C:\\\\E\\\\PHPIDE\\\\Ver...\')\n#12 {main}', '2018-07-23 09:41:21', 2);
INSERT INTO `xman_system_error_log` VALUES (8, '/www/wwwroot/xman/ThinkPHP/Common/functions.php', '102', '0', '1292:Incorrect datetime value: \'思达\' for column \'addtime\' at row 1\n [ SQL语句 ] : INSERT INTO `xman_article` (`title`,`author`,`content`,`addtime`,`show_switch`,`like`,`category`,`description`) VALUES (\'sad发生的\',\'思达\',\'阿斯蒂芬阿萨德阿萨德\',\'思达\',\'1\',\'0\',\'0\',\'答复阿斯蒂芬sad\')', '#0 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(350): E(\'1292:Incorrect ...\')\n#1 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(237): Think\\Db\\Driver->error()\n#2 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(824): Think\\Db\\Driver->execute(\'INSERT INTO `xm...\', false)\n#3 /www/wwwroot/xman/ThinkPHP/Library/Think/Model.class.php(320): Think\\Db\\Driver->insert(Array, Array, false)\n#4 /www/wwwroot/xman/Application/Common/Controller/MakeController.class.php(95): Think\\Model->add(Array)\n#5 [internal function]: Admin\\Controller\\ArticleController->add()\n#6 /www/wwwroot/xman/ThinkPHP/Library/Think/App.class.php(173): ReflectionMethod->invoke(Object(Admin\\Controller\\ArticleController))\n#7 /www/wwwroot/xman/ThinkPHP/Library/Think/App.class.php(110): Think\\App::invokeAction(Object(Admin\\Controller\\ArticleController), \'add\')\n#8 /www/wwwroot/xman/ThinkPHP/Library/Think/App.class.php(204): Think\\App::exec()\n#9 /www/wwwroot/xman/ThinkPHP/Library/Think/Think.class.php(120): Think\\App::run()\n#10 /www/wwwroot/xman/ThinkPHP/ThinkPHP.php(97): Think\\Think::start()\n#11 /www/wwwroot/xman/index.php(29): require(\'/www/wwwroot/xm...\')\n#12 {main}', '2018-07-26 12:11:35', 17);
INSERT INTO `xman_system_error_log` VALUES (9, '/www/wwwroot/xman/Application/Runtime/common~runtime.php', '1', '0', '1264:Out of range value for column \'like\' at row 1\n [ SQL语句 ] : UPDATE `xman_article` SET `title`=\'展示文章00\',`author`=\'Xiny111\',`content`=\'&lt;p&gt;FUCK&lt;img src=&quot;https://testyao.oss-cn-beijing.aliyuncs.com/images/20180826/5b81e48e2d0cc.jpg&quot; alt=&quot;73e3e7f5jw1dw5dt3ead3j.jpg&quot;&gt;&lt;/p&gt;\',`addtime`=\'2018-07-25 21:35:46\',`show_switch`=\'1\',`like`=\'100000000001\',`category`=\'2\',`description`=\'&lt;p&gt;FUCK是的1&lt;/p&gt;\' WHERE `id` = 6', '#0 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(350): E(\'1264:Out of ran...\')\n#1 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(237): Think\\Db\\Driver->error()\n#2 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(906): Think\\Db\\Driver->execute(\'UPDATE `xman_ar...\', false)\n#3 /www/wwwroot/xman/ThinkPHP/Library/Think/Model.class.php(451): Think\\Db\\Driver->update(Array, Array)\n#4 /www/wwwroot/xman/Application/Common/Controller/MakeController.class.php(120): Think\\Model->save(Array)\n#5 [internal function]: Admin\\Controller\\ArticleController->edit()\n#6 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): ReflectionMethod->invoke(Object(Admin\\Controller\\ArticleController))\n#7 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): Think\\App::invokeAction(Object(Admin\\Controller\\ArticleController), \'edit\')\n#8 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): Think\\App::exec()\n#9 /www/wwwroot/xman/ThinkPHP/Library/Think/Think.class.php(120): Think\\App::run()\n#10 /www/wwwroot/xman/ThinkPHP/ThinkPHP.php(97): Think\\Think::start()\n#11 /www/wwwroot/xman/index.php(29): require(\'/www/wwwroot/xm...\')\n#12 {main}', '2018-09-06 21:50:16', 17);
INSERT INTO `xman_system_error_log` VALUES (10, '/www/wwwroot/xman/Application/Runtime/common~runtime.php', '1', '0', '1292:Incorrect datetime value: \'\' for column \'add_time\' at row 1\n [ SQL语句 ] : INSERT INTO `xman_category` (`image`,`title`,`desc`,`add_time`) VALUES (\'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180912/5b98d0b8afbd8.jpg\',\'历史\',\'历史\',\'\')', '#0 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(350): E(\'1292:Incorrect ...\')\n#1 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(237): Think\\Db\\Driver->error()\n#2 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(824): Think\\Db\\Driver->execute(\'INSERT INTO `xm...\', false)\n#3 /www/wwwroot/xman/ThinkPHP/Library/Think/Model.class.php(320): Think\\Db\\Driver->insert(Array, Array, false)\n#4 /www/wwwroot/xman/Application/Common/Controller/MakeController.class.php(95): Think\\Model->add(Array)\n#5 [internal function]: Admin\\Controller\\CategoryController->add()\n#6 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): ReflectionMethod->invoke(Object(Admin\\Controller\\CategoryController))\n#7 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): Think\\App::invokeAction(Object(Admin\\Controller\\CategoryController), \'add\')\n#8 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): Think\\App::exec()\n#9 /www/wwwroot/xman/ThinkPHP/Library/Think/Think.class.php(120): Think\\App::run()\n#10 /www/wwwroot/xman/ThinkPHP/ThinkPHP.php(97): Think\\Think::start()\n#11 /www/wwwroot/xman/index.php(29): require(\'/www/wwwroot/xm...\')\n#12 {main}', '2018-09-12 16:39:27', 17);
INSERT INTO `xman_system_error_log` VALUES (11, '/www/wwwroot/xman/Application/Runtime/common~runtime.php', '1', '0', '1292:Incorrect datetime value: \'\' for column \'add_time\' at row 1\n [ SQL语句 ] : INSERT INTO `xman_category` (`image`,`title`,`desc`,`add_time`) VALUES (\'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181109/5be460efe023c.png\',\'12\',\'1\',\'\')', '#0 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(350): E(\'1292:Incorrect ...\')\n#1 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(237): Think\\Db\\Driver->error()\n#2 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(824): Think\\Db\\Driver->execute(\'INSERT INTO `xm...\', false)\n#3 /www/wwwroot/xman/ThinkPHP/Library/Think/Model.class.php(320): Think\\Db\\Driver->insert(Array, Array, false)\n#4 /www/wwwroot/xman/Application/Common/Controller/MakeController.class.php(95): Think\\Model->add(Array)\n#5 [internal function]: Admin\\Controller\\CategoryController->add()\n#6 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): ReflectionMethod->invoke(Object(Admin\\Controller\\CategoryController))\n#7 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): Think\\App::invokeAction(Object(Admin\\Controller\\CategoryController), \'add\')\n#8 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): Think\\App::exec()\n#9 /www/wwwroot/xman/ThinkPHP/Library/Think/Think.class.php(120): Think\\App::run()\n#10 /www/wwwroot/xman/ThinkPHP/ThinkPHP.php(97): Think\\Think::start()\n#11 /www/wwwroot/xman/index.php(29): require(\'/www/wwwroot/xm...\')\n#12 {main}', '2018-11-09 00:14:48', 17);
INSERT INTO `xman_system_error_log` VALUES (12, '/www/wwwroot/xman/Application/Runtime/common~runtime.php', '1', '0', '1292:Incorrect datetime value: \'\' for column \'add_time\' at row 1\n [ SQL语句 ] : INSERT INTO `xman_category` (`image`,`title`,`desc`,`add_time`) VALUES (\'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181207/5c0a312b7ff9d.jpeg\',\'皮城\',\'LOL\',\'\')', '#0 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(350): E(\'1292:Incorrect ...\')\n#1 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(237): Think\\Db\\Driver->error()\n#2 /www/wwwroot/xman/ThinkPHP/Library/Think/Db/Driver.class.php(824): Think\\Db\\Driver->execute(\'INSERT INTO `xm...\', false)\n#3 /www/wwwroot/xman/ThinkPHP/Library/Think/Model.class.php(320): Think\\Db\\Driver->insert(Array, Array, false)\n#4 /www/wwwroot/xman/Application/Common/Controller/MakeController.class.php(95): Think\\Model->add(Array)\n#5 [internal function]: Admin\\Controller\\CategoryController->add()\n#6 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): ReflectionMethod->invoke(Object(Admin\\Controller\\CategoryController))\n#7 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): Think\\App::invokeAction(Object(Admin\\Controller\\CategoryController), \'add\')\n#8 /www/wwwroot/xman/Application/Runtime/common~runtime.php(1): Think\\App::exec()\n#9 /www/wwwroot/xman/ThinkPHP/Library/Think/Think.class.php(120): Think\\App::run()\n#10 /www/wwwroot/xman/ThinkPHP/ThinkPHP.php(97): Think\\Think::start()\n#11 /www/wwwroot/xman/index.php(29): require(\'/www/wwwroot/xm...\')\n#12 {main}', '2018-12-07 16:37:27', 17);

-- ----------------------------
-- Table structure for xman_system_login_log
-- ----------------------------
DROP TABLE IF EXISTS `xman_system_login_log`;
CREATE TABLE `xman_system_login_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_user_id` int(11) NOT NULL COMMENT '管理员账号',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'IP地址',
  `os` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `browser` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '浏览器型号',
  `logtime` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_system_login_log
-- ----------------------------
INSERT INTO `xman_system_login_log` VALUES (1, 2, '127.0.0.1', 'Windows NT 10.0', 'Chrome/75.0.3770.145', '2019-08-15 21:18:32');

-- ----------------------------
-- Table structure for xman_system_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `xman_system_operation_log`;
CREATE TABLE `xman_system_operation_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '操作名称',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '访问地址',
  `way_state` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '访问方式:0=GET,1=POST,2=AJAX',
  `usetime` float(12, 6) NOT NULL DEFAULT 0.000000 COMMENT '耗时(s)',
  `usemem` float(18, 6) NOT NULL DEFAULT 0.000000 COMMENT '使用内存(kb)',
  `result` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '操作结果:0=失败,1=成功',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '提示信息',
  `admin_user_id` int(11) NOT NULL COMMENT '管理员',
  `createtime` datetime NOT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for xman_system_skin
-- ----------------------------
DROP TABLE IF EXISTS `xman_system_skin`;
CREATE TABLE `xman_system_skin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `framecolor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '框架颜色',
  `topcolor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '顶部背景',
  `leftcolor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '左侧背景',
  `topbottomcolor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '顶部底边',
  `menucolor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '三级菜单',
  `user_id` int(11) NULL DEFAULT 0 COMMENT '用户ID',
  `state` enum('1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '2' COMMENT '皮肤类型:1=系统主题,2=用户主题',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '皮肤名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 169 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_system_skin
-- ----------------------------
INSERT INTO `xman_system_skin` VALUES (7, '#019688', '#23262e', '#393d49', '#5fb878', '#2b2e37', 0, '1', 'layui风格');
INSERT INTO `xman_system_skin` VALUES (10, '#409eff', '#23262e', '#393d49', '#c9c9c9', '#2b2e37', 0, '1', 'element风格');
INSERT INTO `xman_system_skin` VALUES (12, '#d25757', '#23262e', '#393d49', '#f79b40', '#2b2e37', 0, '1', '活力少女');
INSERT INTO `xman_system_skin` VALUES (16, '#cc3366', '#23262e', '#393d49', '#e36467', '#2b2e37', 0, '1', '玫红');
INSERT INTO `xman_system_skin` VALUES (20, '#eeca00', '#23262e', '#393d49', '#505050', '#2b2e37', 0, '1', '土豪金');
INSERT INTO `xman_system_skin` VALUES (31, '#ef0f0f', '#06f059', '#0de0f4', '#2727b6', '#bb0bd6', 0, '1', '辣眼睛');
INSERT INTO `xman_system_skin` VALUES (35, '#01aaed', '#23262e', '#393d49', '#ffd700', '#2b2e37', 0, '1', '默认');
INSERT INTO `xman_system_skin` VALUES (156, '#409eff', '#23262e', '#393d49', '#c9c9c9', '#2b2e37', 2, '2', '');
INSERT INTO `xman_system_skin` VALUES (168, '#01aaed', '#23262e', '#393d49', '#ffd700', '#2b2e37', 17, '2', '');

-- ----------------------------
-- Table structure for xman_test
-- ----------------------------
DROP TABLE IF EXISTS `xman_test`;
CREATE TABLE `xman_test`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `week` enum('monday','tuesday','wednesday') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'monday' COMMENT '星期:monday=星期一,tuesday=星期二,wednesday=星期三',
  `genderdata` enum('male','female') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'male' COMMENT '性别:male=男,female=女',
  `textarea` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图片',
  `attachfile` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
  `price` float(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '价格',
  `startdate` date NOT NULL COMMENT '开始日期',
  `activitytime` datetime NOT NULL COMMENT '活动时间(datetime)',
  `year` year(4) NOT NULL COMMENT '年',
  `times` time NOT NULL COMMENT '时间',
  `switch` tinyint(1) NOT NULL DEFAULT 1 COMMENT '上架状态:0=下架,1=正常',
  `ttswitch` tinyint(1) NOT NULL DEFAULT 0 COMMENT '开关:0=OFF,1=ON',
  `teststate` set('1','2','3') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '测试复选:1=选项1,2=选项2,3=选项3,',
  `test2state` set('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '2' COMMENT '爱好:0=唱歌,1=跳舞,2=嫖娼',
  `editor_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '富文本',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `test`(`keywords`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_test
-- ----------------------------
INSERT INTO `xman_test` VALUES (34, 'tuesday', 'female', 'test内容11200123', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190530/5cef8f93082d8.png', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181120/5bf3ba63d4be1.png', 'test x-man', 99.72, '2018-07-12', '2018-07-25 22:16:40', 2018, '22:15:41', 1, 1, '3', '0,2', '&lt;p style=&quot;text-align: left;&quot;&gt;&lt;img alt=&quot;[嘻嘻]&quot; src=&quot;https://x.imxiny.com/Public/static/layui/images/face/1.gif&quot;&gt;本控制器完全由代码生成器生成！&lt;/p&gt;&lt;p&gt;&lt;b&gt;&lt;i&gt;&lt;u&gt;&lt;strike&gt;11111111111111&lt;/strike&gt;&lt;/u&gt;&lt;/i&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;22222222222222&lt;img alt=&quot;login-top.jpg&quot; src=&quot;https://testyao.oss-cn-beijing.aliyuncs.com/images/20180813/5b7199f6b0635.jpg&quot;&gt;&lt;/b&gt;&lt;/p&gt;&lt;p&gt;&lt;b&gt;&lt;img alt=&quot;1.png&quot; src=&quot;https://testyao.oss-cn-beijing.aliyuncs.com/images/20180725/5b588676172a1.png&quot;&gt;&lt;br&gt;&lt;/b&gt;&lt;/p&gt;');
INSERT INTO `xman_test` VALUES (35, 'monday', 'male', '123', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180725/5b588694bbe48.png', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180725/5b58869b8fb63.png', '123', 0.00, '2018-07-25', '2018-07-25 22:18:04', 2018, '22:18:08', 1, 1, '1,2,3', '0,1,2', 'fvfffffffffffffffffff&lt;img src=&quot;https://testyao.oss-cn-beijing.aliyuncs.com/images/20190108/5c34477e21e4c.png&quot; alt=&quot;5AA596C69936F22C1F29EF96304E478C.png&quot;&gt;');
INSERT INTO `xman_test` VALUES (36, 'monday', 'male', '123', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180726/5b59528c98d61.jpg', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180726/5b595290eef32.jpg', '1231', 0.00, '2018-07-26', '2018-07-26 12:48:16', 2018, '12:48:19', 0, 0, '1', '0', '123&lt;img src=&quot;http://x.imxiny.com/Public/static/layui/images/face/26.gif&quot; alt=&quot;[怒]&quot;&gt;');
INSERT INTO `xman_test` VALUES (37, 'monday', 'female', '55', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180801/5b6114e01121e.png', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180801/5b6114c22fde0.txt', 'yyy', 0.00, '2018-08-01', '2018-08-01 10:02:51', 2018, '10:02:55', 1, 1, '1,2', '0,1', 'uyuyy');
INSERT INTO `xman_test` VALUES (38, 'monday', 'female', '423t', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180816/5b756f63bf2b4.png', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180816/5b756f6c0f7d3.png', '432', 0.03, '2018-08-16', '2018-08-30 00:00:00', 2018, '20:35:10', 1, 1, '1', '0,1,2', '&lt;img src=&quot;https://testyao.oss-cn-beijing.aliyuncs.com/images/20180905/5b8fcd68398f6.jpg&quot; alt=&quot;ebec-fzcyxmv1244862.jpg&quot;&gt;');
INSERT INTO `xman_test` VALUES (39, 'monday', 'male', 'ces ', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180917/5b9f5a9b43642.jpg', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180917/5b9f5a9f58bcf.jpg', 'ce', 0.00, '2018-09-17', '2018-09-17 15:41:28', 2018, '15:41:39', 1, 0, '1', '2', 'ces');
INSERT INTO `xman_test` VALUES (40, 'monday', 'male', '撒旦法', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180919/5ba21d8a1faa5.jpg', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180919/5ba21d9436f69.jpg', '说的', 0.03, '2018-09-19', '2018-09-20 00:00:00', 2018, '09:00:00', 1, 0, '1', '2', '&lt;b&gt;是打发士大夫士大夫撒旦法&lt;/b&gt;');
INSERT INTO `xman_test` VALUES (41, 'monday', 'male', '千万千万千万千万', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180929/5baf360ea5619.jpg', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180929/5baf36178e3fc.jpg', '4545', 0.00, '2018-09-29', '2018-09-30 00:00:00', 2018, '00:00:00', 1, 0, '1,2', '1,2', '&lt;p&gt;&amp;nbsp;的房顶上辅导费 卧槽 我就死系那个示范区开放到哪爱上你斯诺伐克n&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;asdfasasdfasfsa&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;sdfasda&lt;/p&gt;');
INSERT INTO `xman_test` VALUES (42, 'monday', 'male', 'dfgdfgdfg', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181002/5bb333349d628.jpg', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181002/5bb3334b07a6d.jpg', '234234234234234243', 0.00, '2018-10-02', '2018-11-08 00:00:00', 2018, '00:00:00', 1, 0, '1', '0,2', 'dfgdfgdfgdfg');
INSERT INTO `xman_test` VALUES (43, 'monday', 'male', 'k', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181017/5bc6e3f3db4ba.jpg', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181017/5bc6e3f76d230.jpg', 'jkl', 0.00, '2018-10-17', '2018-10-18 00:00:00', 2018, '00:03:00', 1, 1, '1', '2', '&lt;b&gt;&lt;img src=&quot;https://testyao.oss-cn-beijing.aliyuncs.com/images/20190108/5c344a9bc1d15.png&quot; alt=&quot;5AA596C69936F22C1F29EF96304E478C.png&quot;&gt;问问未&lt;/b&gt;');
INSERT INTO `xman_test` VALUES (44, 'tuesday', 'male', 'asdf ', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190301/5c78a8dca4e7a.png', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190301/5c78a8dfbd154.png', 'asdf ', 0.00, '2019-03-01', '2019-03-07 00:00:00', 2019, '00:00:05', 1, 0, '1', '2', '');
INSERT INTO `xman_test` VALUES (45, 'monday', 'male', '32432', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190401/5ca0e93b6f83b.png', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190401/5ca0e93f779bb.png', '432432', 1.00, '2019-04-16', '2019-04-30 00:00:00', 2016, '01:01:02', 1, 0, '1', '2', '1321');

-- ----------------------------
-- Table structure for xman_test_test
-- ----------------------------
DROP TABLE IF EXISTS `xman_test_test`;
CREATE TABLE `xman_test_test`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `tilte` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章名',
  `addtime` datetime NOT NULL COMMENT '添加时间',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头图',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `category` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '分类:0=历史,1=政治,2=新闻',
  `switch` tinyint(1) NULL DEFAULT 1 COMMENT '是否展示:0=隐藏,1=展示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_test_test
-- ----------------------------
INSERT INTO `xman_test_test` VALUES (2, 'tt', '2018-08-01 10:01:37', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180801/5b6114834f84b.png', 'tttt', '0', 1);

-- ----------------------------
-- Table structure for xman_update_log
-- ----------------------------
DROP TABLE IF EXISTS `xman_update_log`;
CREATE TABLE `xman_update_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新内容',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片',
  `addtime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_update_log
-- ----------------------------
INSERT INTO `xman_update_log` VALUES (1, '修改菜单管理图标选择样式', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180816/5b752d8ac9f48.png', '2018-08-15 19:04:04');
INSERT INTO `xman_update_log` VALUES (3, '顶部标签栏添加右键菜单包含刷新、关闭等功能', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180816/5b7589437fdd3.png', '2018-08-16 22:25:08');
INSERT INTO `xman_update_log` VALUES (4, '左侧导航栏增加搜索功能', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180816/5b7594def0e9f.png', '2018-08-16 23:14:39');
INSERT INTO `xman_update_log` VALUES (5, '代码生成器增加color控件，IE不支持', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180818/5b77d6265b55b.png', '2018-08-18 16:17:42');
INSERT INTO `xman_update_log` VALUES (6, '强大的可定制皮肤功能，自己制作专属皮肤,系统内置了几种风格，有更好的配色请联系我', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180818/5b77d642ee31d.png', '2018-08-18 16:18:43');
INSERT INTO `xman_update_log` VALUES (7, '菜单、权限管理引入treetable', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180822/5b7d2dbf74325.png', '2018-08-22 17:32:44');
INSERT INTO `xman_update_log` VALUES (8, '恭喜layui更新2.4，本框架今晚升级，啊哈哈哈????', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180828/5b851520753e2.png', '2018-08-28 17:25:54');
INSERT INTO `xman_update_log` VALUES (9, '新版layui,还是等等吧，没有那么好。https://fly.layui.com/jie/32937/', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180828/5b855f3d30657.png', '2018-08-28 22:42:04');
INSERT INTO `xman_update_log` VALUES (10, 'layui升级到v2.4.1，皮肤修改做了调整。其他升级不够稳定，未使用', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180829/5b868e8aa6038.png', '2018-08-29 20:16:08');
INSERT INTO `xman_update_log` VALUES (11, '添加NProgress网站整体进度条，用代码生成器做出的页面都包含此效果', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180904/5b8deb7c97ef4.png', '2018-09-03 21:03:03');
INSERT INTO `xman_update_log` VALUES (12, 'layui版本2.4.1 =&gt; 2.4.3 左侧导航动态滚动条', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180904/5b8e935899999.png', '2018-09-04 22:15:25');
INSERT INTO `xman_update_log` VALUES (13, '代码生成器添加多表支持。可到内容管理-文章管理进行体验。更多详情到代码生成器中查看！', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180912/5b98cb1592e66.jpg', '2018-09-12 16:15:15');

-- ----------------------------
-- Table structure for xman_user
-- ----------------------------
DROP TABLE IF EXISTS `xman_user`;
CREATE TABLE `xman_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名',
  `phone` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '移动电话',
  `birdate` date NOT NULL COMMENT '生日',
  `headimage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '头像',
  `state` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '可用状态:0=禁用,1=可用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of xman_user
-- ----------------------------
INSERT INTO `xman_user` VALUES (6, '66661', '144444', '2018-10-25', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190531/5cf0e5072479a.jpg', '1');
INSERT INTO `xman_user` VALUES (7, '测试', '18812345677', '2018-09-06', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180829/5b861b85ab0b6.jpg', '1');
INSERT INTO `xman_user` VALUES (8, '天蚕土a', '1', '2018-08-16', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180820/5b7a76027477b.jpg', '1');
INSERT INTO `xman_user` VALUES (9, '梦入神机', '41', '2018-08-20', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180820/5b7a760eac923.jpg', '1');
INSERT INTO `xman_user` VALUES (10, '唐家三少', '1231231231', '2018-08-29', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180829/5b86582cc298f.jpg', '1');
INSERT INTO `xman_user` VALUES (11, 'ces', '13303839186', '2018-08-26', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180908/5b9344e87c1f3.jpg', '1');
INSERT INTO `xman_user` VALUES (12, 'teet', 'este', '2018-09-05', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180913/5b9a0a710b87a.jpg', '1');
INSERT INTO `xman_user` VALUES (13, '杀无赦', '辅导费', '2018-09-19', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180921/5ba4926beee37.png', '0');
INSERT INTO `xman_user` VALUES (14, 'test', '13343444282', '2018-09-21', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180921/5ba4e89996d02.jpg', '1');
INSERT INTO `xman_user` VALUES (15, 'test', 'test', '2018-09-26', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180926/5bab37752bdbc.jpg', '1');
INSERT INTO `xman_user` VALUES (16, 'test123', 'teesdfsdf', '2018-09-27', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20180926/5bab378e4cd97.jpg', '1');
INSERT INTO `xman_user` VALUES (17, '测试维恩无群二', '1212121212卫栖梧333', '2018-10-06', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181009/5bbc2111b2034.jpg', '0');
INSERT INTO `xman_user` VALUES (18, '11111133666', '11111133', '2018-10-10', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181011/5bbea51f7e94c.jpg', '1');
INSERT INTO `xman_user` VALUES (19, 'dfdf2', '3', '2018-10-22', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181022/5bcd7462ee117.jpg', '1');
INSERT INTO `xman_user` VALUES (20, 'MrLiu', '13485913248', '2018-10-19', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181024/5bcfe457e4b79.jpg', '1');
INSERT INTO `xman_user` VALUES (21, '1', '1', '2018-11-14', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181130/5c00a5c486eda.png', '0');
INSERT INTO `xman_user` VALUES (22, 'sdasdasdas', '11111111111', '2018-12-20', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20181229/5c27062e43a97.png', '1');
INSERT INTO `xman_user` VALUES (23, '122', '422', '2019-01-02', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190101/5c2b190f39ba9.jpg', '1');
INSERT INTO `xman_user` VALUES (24, '1', '1', '2019-04-03', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190413/5cb0c6cd087f8.jpg', '1');
INSERT INTO `xman_user` VALUES (25, 'ty66', '18506007414', '2019-04-20', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190420/5cbb18e81e336.png', '1');
INSERT INTO `xman_user` VALUES (26, 'dsfgdsfg', 'ffgfdsgdsg', '2019-05-21', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190521/5ce3a772c3be6.png', '1');
INSERT INTO `xman_user` VALUES (27, 'rqwr', 'qwreq', '2019-07-03', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190703/5d1c97f09ae1c.gif', '1');
INSERT INTO `xman_user` VALUES (28, 'ggg', '11222', '2019-08-08', 'https://testyao.oss-cn-beijing.aliyuncs.com/images/20190814/5d5372b3e1c68.png', '1');

SET FOREIGN_KEY_CHECKS = 1;
