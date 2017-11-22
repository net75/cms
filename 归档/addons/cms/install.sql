SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for fa_addonnews
-- ----------------------------
DROP TABLE IF EXISTS `fa_addonnews`;
CREATE TABLE `fa_addonnews` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `author` varchar(255) DEFAULT '' COMMENT '作者',
  `age` enum('1-18','19-29','30-39') DEFAULT '1-18' COMMENT '年龄',
  `gender` enum('male','female') DEFAULT 'male' COMMENT '性别',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻';

-- ----------------------------
-- Records of fa_addonnews
-- ----------------------------
BEGIN;
INSERT INTO `fa_addonnews` VALUES (84, '<p>测试新闻1</p>', 'KS', '1-18', 'male');
INSERT INTO `fa_addonnews` VALUES (85, '<p>测试新闻2</p>', 'FX', '19-29', 'male');
INSERT INTO `fa_addonnews` VALUES (91, '<p>新闻2<br></p>', 'FF', '1-18', 'male');
INSERT INTO `fa_addonnews` VALUES (92, '<p>新闻2<br></p>', 'EE', '30-39', 'male');
INSERT INTO `fa_addonnews` VALUES (93, '<p>新闻2<br></p>', 'AA', '30-39', 'male');
INSERT INTO `fa_addonnews` VALUES (94, '<p>新闻2<br></p>', 'AE', '1-18', 'male');
COMMIT;

-- ----------------------------
-- Table structure for fa_addonproduct
-- ----------------------------
DROP TABLE IF EXISTS `fa_addonproduct`;
CREATE TABLE `fa_addonproduct` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `productdata` varchar(1500) DEFAULT '' COMMENT '产品列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品表';

-- ----------------------------
-- Records of fa_addonproduct
-- ----------------------------
BEGIN;
INSERT INTO `fa_addonproduct` VALUES (89, '<p>product1<br></p>', '');
INSERT INTO `fa_addonproduct` VALUES (90, '<p>产品2</p>', '');
COMMIT;

-- ----------------------------
-- Table structure for fa_archives
-- ----------------------------
DROP TABLE IF EXISTS `fa_archives`;
CREATE TABLE `fa_archives` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `channel_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '栏目ID',
  `model_id` int(10) NOT NULL COMMENT '模型ID',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '文章标题',
  `flag` set('hot','new','recommend') NOT NULL DEFAULT '' COMMENT '标志',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `tags` varbinary(255) NOT NULL DEFAULT '' COMMENT 'TAG',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论次数',
  `likes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点赞数',
  `dislikes` int(10) unsigned NOT NULL COMMENT '点踩数',
  `diyname` varchar(50) NOT NULL COMMENT '自定义URL',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `publishtime` int(10) DEFAULT NULL COMMENT '发布时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`channel_id`,`status`),
  KEY `channel` (`channel_id`,`weigh`,`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内容表';

-- ----------------------------
-- Records of fa_archives
-- ----------------------------
BEGIN;
INSERT INTO `fa_archives` VALUES (84, 35, 0, '测试新闻1', '', '', '', '', 0xE69E81E9809F2C4661737441646D696E2CE696B0E997BB31, 84, 1, 0, 0, 0, 'news1', 1508990778, 1508992752, 1508947200, NULL, 'normal');
INSERT INTO `fa_archives` VALUES (85, 35, 0, '测试新闻2', '', '', '', '', 0x4661737441646D696E2CE69E81E9809F, 85, 0, 0, 0, 0, 'news2', 1508991029, 1508992725, 1508947200, NULL, 'normal');
INSERT INTO `fa_archives` VALUES (89, 38, 0, '产品1', '', '', '', '', 0xE4BAA7E59381312C4661737441646D696E, 89, 1, 0, 0, 0, 'product1', 1508992836, 1508992836, 1508947200, NULL, 'normal');
INSERT INTO `fa_archives` VALUES (90, 38, 0, '产品2', '', '', '', '', 0xE4BAA7E59381322C4661737441646D696E, 90, 0, 0, 0, 0, '', 1508992861, 1508992861, 1508947200, NULL, 'normal');
INSERT INTO `fa_archives` VALUES (91, 35, 0, '新闻2', '', '', '', '', 0xE696B0E997BB32, 91, 0, 0, 0, 0, 'news2-2', 1508993329, 1508993329, 1508947200, NULL, 'normal');
INSERT INTO `fa_archives` VALUES (92, 36, 0, '新闻2-2', '', '', '', '', 0xE696B0E997BB32, 92, 0, 0, 0, 0, 'n2', 1508993357, 1508993357, 1508947200, NULL, 'normal');
INSERT INTO `fa_archives` VALUES (93, 35, 0, '新闻X', '', '', '', '', 0xE696B0E997BB31, 93, 0, 0, 0, 0, 'n23', 1508993390, 1508993390, 1508947200, NULL, 'normal');
INSERT INTO `fa_archives` VALUES (94, 36, 0, '新闻2X', '', '', '', '', 0xE696B0E997BB32, 94, 0, 0, 0, 0, '2x', 1508993412, 1508993412, 1508947200, NULL, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_block
-- ----------------------------
DROP TABLE IF EXISTS `fa_block`;
CREATE TABLE `fa_block` (
  `id` smallint(8) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `content` mediumtext NOT NULL COMMENT '内容',
  `createtime` int(10) NOT NULL COMMENT '添加时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='区块表';

-- ----------------------------
-- Records of fa_block
-- ----------------------------
BEGIN;
INSERT INTO `fa_block` VALUES (1, 'focus', 'focus', '幻灯图片1', '/assets/addons/cms/img/focus/1.jpg', 'http://www.fastadmin.net', '111', 0, 0, 'normal');
INSERT INTO `fa_block` VALUES (2, 'focus', 'focus', '幻灯图片2', '/assets/addons/cms/img/focus/2.jpg', 'http://www.fastadmin.net', '222', 0, 0, 'normal');
INSERT INTO `fa_block` VALUES (3, 'focus', 'focus', '幻灯图片3', '/assets/addons/cms/img/focus/3.jpg', 'http://www.fastadmin.net', '333', 0, 0, 'normal');
INSERT INTO `fa_block` VALUES (4, 'other', 'contactus', '联系我们', '', '', '', 0, 0, 'normal');
INSERT INTO `fa_block` VALUES (6, 'other', 'footer', '底部链接', '', '', '<div class=\"col-md-3 col-sm-3\">\n                            <div class=\"footer-logo\">\n                                <a href=“#”><i class=\"fa fa-bookmark\"></i></a>\n                            </div>\n                            <p class=\"copyright\"><small>© 2017. All Rights Reserved. <br>\n                                    FastAdmin\n                                </small>\n                            </p>\n                        </div>\n                        <div class=\"col-md-5 col-md-push-1 col-sm-5 col-sm-push-1\">\n                            <div class=\"row\">\n                                <div class=\"col-md-4 col-sm-4\">\n                                    <ul class=\"links\">\n                                        <li><a href=\"#\">关于我们</a></li>\n                                        <li><a href=\"#\">发展历程</a></li>\n                                        <li><a href=\"#\">服务项目</a></li>\n                                        <li><a href=\"#\">团队成员</a></li>\n                                    </ul>\n                                </div>\n                                <div class=\"col-md-4 col-sm-4\">\n                                    <ul class=\"links\">\n                                        <li><a href=\"#\">新闻</a></li>\n                                        <li><a href=\"#\">资讯</a></li>\n                                        <li><a href=\"#\">推荐</a></li>\n                                        <li><a href=\"#\">博客</a></li>\n                                    </ul>\n                                </div>\n                                <div class=\"col-md-4 col-sm-4\">\n                                    <ul class=\"links\">\n                                        <li><a href=\"#\">服务</a></li>\n                                        <li><a href=\"#\">圈子</a></li>\n                                        <li><a href=\"#\">论坛</a></li>\n                                        <li><a href=\"#\">广告</a></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                        <div class=\"col-md-3 col-sm-3 col-md-push-1 col-sm-push-1\">\n                            <div class=\"footer-social\">\n                                <a href=\"#\"><i class=\"fa fa-weibo\"></i></a>\n                                <a href=\"#\"><i class=\"fa fa-qq\"></i></a>\n                                <a href=\"#\"><i class=\"fa fa-wechat\"></i></a>\n                            </div>\n                        </div>', 0, 0, 'normal');
INSERT INTO `fa_block` VALUES (7, 'other', 'bannerad', '通栏广告', '/assets/addons/cms/img/banner/1.jpg', 'http://www.fastadmin.net', '', 0, 0, 'normal');
INSERT INTO `fa_block` VALUES (8, 'other', 'sidebarad1', '边栏广告1', '/assets/addons/cms/img/sidebar/1.jpg', 'http://www.fastadmin.net', '', 0, 0, 'normal');
INSERT INTO `fa_block` VALUES (9, 'other', 'sidebarad2', '边栏广告2', '/assets/addons/cms/img/sidebar/2.jpg', 'http://www.fastadmin.net', '', 0, 0, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_channel
-- ----------------------------
DROP TABLE IF EXISTS `fa_channel`;
CREATE TABLE `fa_channel` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('channel','page','link','list') NOT NULL COMMENT '类型',
  `model_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '模型ID',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(30) NOT NULL COMMENT '名称',
  `image` varchar(100) NOT NULL COMMENT '图片',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `diyname` varchar(30) NOT NULL COMMENT '自定义名称',
  `outlink` varbinary(255) NOT NULL DEFAULT '' COMMENT '外部链接',
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '文章数量',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `channeltpl` varchar(100) NOT NULL DEFAULT '' COMMENT '栏目页模板',
  `listtpl` varchar(100) NOT NULL COMMENT '列表页模板',
  `showtpl` varchar(100) NOT NULL COMMENT '详情页模板',
  `pagesize` smallint(5) NOT NULL COMMENT '分页大小',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `diyname` (`diyname`),
  KEY `weigh` (`weigh`,`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='栏目表';

-- ----------------------------
-- Records of fa_channel
-- ----------------------------
BEGIN;
INSERT INTO `fa_channel` VALUES (34, 'channel', 7, 0, '新闻中心', '', '', '', 'news', '', 0, 9, 'channel.html', '', '', 10, 1508990697, 1508992553, 'normal');
INSERT INTO `fa_channel` VALUES (35, 'list', 7, 34, '新闻1', '', '', '', 'news1', '', 6, 5, 'channel.html', 'list_news.html', 'show_news.html', 10, 1508990707, 1508992563, 'normal');
INSERT INTO `fa_channel` VALUES (36, 'list', 7, 35, '新闻1-1', '', '', '', 'news1-1', '', 2, 8, 'channel.html', 'list_news.html', 'show_news.html', 10, 1508990716, 1508992574, 'normal');
INSERT INTO `fa_channel` VALUES (37, 'channel', 7, 0, '产品中心', '', '', '', 'product', '', 0, 10, 'channel.html', '', '', 10, 1508992541, 1508992541, 'normal');
INSERT INTO `fa_channel` VALUES (38, 'list', 8, 37, '产品1', '', '', '', 'product1', '', 2, 4, 'channel.html', 'list_product.html', 'show_product.html', 10, 1508992598, 1508992598, 'normal');
INSERT INTO `fa_channel` VALUES (39, 'list', 8, 38, '产品1-1', '', '', '', 'product1-1', '', 0, 7, 'channel.html', 'list_product.html', 'show_product.html', 10, 1508992623, 1508992623, 'normal');
INSERT INTO `fa_channel` VALUES (40, 'link', 7, 0, '关于我们', '', '', '', 'aboutus', 0x2F702F61626F757475732E68746D6C, 0, 1, 'channel.html', '', '', 10, 1508994681, 1508994681, 'normal');
INSERT INTO `fa_channel` VALUES (41, 'link', 7, 0, '官网首页', '', '', '', 'official', 0x687474703A2F2F7777772E6661737461646D696E2E6E6574, 0, 6, 'channel.html', '', '', 10, 1508994753, 1508994753, 'normal');
INSERT INTO `fa_channel` VALUES (42, 'link', 7, 0, '交流社区', '', '', '', 'forum', 0x687474703A2F2F666F72756D2E6661737461646D696E2E6E6574, 0, 3, 'channel.html', '', '', 10, 1508994772, 1508994772, 'normal');
INSERT INTO `fa_channel` VALUES (43, 'link', 7, 0, '文档', '', '', '', 'docs', 0x687474703A2F2F646F632E6661737461646D696E2E6E6574, 0, 2, 'channel.html', '', '', 10, 1508994788, 1508994788, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_fields
-- ----------------------------
DROP TABLE IF EXISTS `fa_fields`;
CREATE TABLE `fa_fields` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `model_id` int(10) NOT NULL COMMENT '模型ID',
  `name` char(30) NOT NULL COMMENT '名称',
  `type` varchar(30) NOT NULL COMMENT '类型',
  `title` varchar(30) NOT NULL COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `defaultvalue` varchar(100) NOT NULL DEFAULT '' COMMENT '默认值',
  `rule` varchar(30) DEFAULT NULL COMMENT '验证规则',
  `msg` varchar(30) DEFAULT '0' COMMENT '错误消息',
  `ok` varchar(30) DEFAULT '0' COMMENT '成功消息',
  `tip` varchar(30) DEFAULT NULL COMMENT '提示消息',
  `decimals` tinyint(1) NOT NULL COMMENT '小数点',
  `length` mediumint(8) NOT NULL COMMENT '长度',
  `minimum` smallint(6) NOT NULL COMMENT '最小数量',
  `maximum` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '最大数量',
  `extend` varchar(30) NOT NULL COMMENT '扩展信息',
  `weigh` int(10) NOT NULL COMMENT '排序',
  `createtime` int(10) NOT NULL COMMENT '添加时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `isfilter` tinyint(1) NOT NULL COMMENT '筛选',
  `status` enum('normal','hidden') NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `model_id` (`model_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模型字段表';

-- ----------------------------
-- Records of fa_fields
-- ----------------------------
BEGIN;
INSERT INTO `fa_fields` VALUES (136, 7, 'author', 'string', '作者', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', 136, 1508990735, 1508991985, 1, 'normal');
INSERT INTO `fa_fields` VALUES (137, 7, 'age', 'select', '年龄', '1-18|1-18岁\r\n19-29|19-29岁\r\n30-39|30-39岁', '', 'required', '', '', '', 0, 255, 0, 0, '', 137, 1508990746, 1508992045, 1, 'normal');
INSERT INTO `fa_fields` VALUES (138, 7, 'gender', 'radio', '性别', 'male|男\r\nfemale|女', '', 'required', '', '', '', 0, 255, 0, 0, '', 138, 1508992093, 1508992093, 1, 'normal');
INSERT INTO `fa_fields` VALUES (139, 8, 'productdata', 'images', '产品列表', 'value1|title1\r\nvalue2|title2', '', 'required', '', '', '', 0, 1500, 0, 20, '', 139, 1508992518, 1508992518, 1, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_model
-- ----------------------------
DROP TABLE IF EXISTS `fa_model`;
CREATE TABLE `fa_model` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL COMMENT '模型名称',
  `table` char(20) NOT NULL COMMENT '表名',
  `fields` text NOT NULL COMMENT '字段列表',
  `channeltpl` varchar(30) NOT NULL COMMENT '栏目页模板',
  `listtpl` varchar(30) NOT NULL COMMENT '列表页模板',
  `showtpl` varchar(30) NOT NULL COMMENT '详情页模板',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `setting` text NOT NULL COMMENT '模型配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内容模型表';

-- ----------------------------
-- Records of fa_model
-- ----------------------------
BEGIN;
INSERT INTO `fa_model` VALUES (7, '新闻', 'addonnews', 'author,age', 'channel.html', 'list_news.html', 'show_news.html', 1508990659, 1508992045, '');
INSERT INTO `fa_model` VALUES (8, '产品', 'addonproduct', '', 'channel.html', 'list_product.html', 'show_product.html', 1508992445, 1508992445, '');
COMMIT;

-- ----------------------------
-- Table structure for fa_page
-- ----------------------------
DROP TABLE IF EXISTS `fa_page`;
CREATE TABLE `fa_page` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category_id` int(10) NOT NULL DEFAULT '0' COMMENT '分类ID',
  `type` varchar(50) NOT NULL COMMENT '类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  `content` text NOT NULL COMMENT '内容',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论',
  `diyname` varchar(50) NOT NULL COMMENT '自定义',
  `showtpl` varchar(50) NOT NULL COMMENT '视图模板',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='单页表';

-- ----------------------------
-- Records of fa_page
-- ----------------------------
BEGIN;
INSERT INTO `fa_page` VALUES (28, 0, 'page', '基于ThinkPHP5和Bootstrap的极速后台开发框架', 'fds', 'fdsfdsdsf', '', 'fds', '<p>基于ThinkPHP5和Bootstrap进行二次开发,手机、平板、PC均自动适配,无需要担心兼容性问题</p>', '', 0, 0, 'aboutus', 'page', 1508933935, 1508934150, 28, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for fa_tags
-- ----------------------------
DROP TABLE IF EXISTS `fa_tags`;
CREATE TABLE `fa_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '标签名称',
  `archives` text NOT NULL COMMENT '文档ID集合',
  `nums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `nums` (`nums`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='标签表';

-- ----------------------------
-- Records of fa_tags
-- ----------------------------
BEGIN;
INSERT INTO `fa_tags` VALUES (30, 'FastAdmin', '85,84,89,90', 4);
INSERT INTO `fa_tags` VALUES (31, '极速', '85,84', 2);
INSERT INTO `fa_tags` VALUES (32, '新闻1', '84,93', 2);
INSERT INTO `fa_tags` VALUES (33, '产品1', '89', 1);
INSERT INTO `fa_tags` VALUES (34, '产品2', '90', 1);
INSERT INTO `fa_tags` VALUES (35, '新闻2', '91,92,94', 3);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;