-- phpMyAdmin SQL Dump
-- version 4.4.10
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-10-28 19:03:24
-- 服务器版本： 5.7.18
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `netcrm_db`
--

-- --------------------------------------------------------

--
-- 表的结构 `fa_addonnews`
--

CREATE TABLE IF NOT EXISTS `fa_addonnews` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `author` varchar(255) DEFAULT '' COMMENT '作者',
  `age` enum('1-18','19-29','30-39') DEFAULT '1-18' COMMENT '年龄',
  `gender` enum('male','female') DEFAULT 'male' COMMENT '性别'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='新闻';

--
-- 转存表中的数据 `fa_addonnews`
--

INSERT INTO `fa_addonnews` (`id`, `content`, `author`, `age`, `gender`) VALUES
(84, '<p>测试新闻1</p>', 'KS', '1-18', 'male'),
(85, '<p>测试新闻2</p>', 'FX', '19-29', 'male'),
(91, '<p>新闻2<br></p>', 'FF', '1-18', 'male'),
(92, '<p>新闻2<br></p>', 'EE', '30-39', 'male'),
(93, '<p>新闻2<br></p>', 'AA', '30-39', 'male'),
(94, '<p>新闻2<br></p>', 'AE', '1-18', 'male');

-- --------------------------------------------------------

--
-- 表的结构 `fa_addonproduct`
--

CREATE TABLE IF NOT EXISTS `fa_addonproduct` (
  `id` int(10) NOT NULL,
  `content` longtext NOT NULL,
  `productdata` varchar(1500) DEFAULT '' COMMENT '产品列表'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='产品表';

--
-- 转存表中的数据 `fa_addonproduct`
--

INSERT INTO `fa_addonproduct` (`id`, `content`, `productdata`) VALUES
(89, '<p>product1<br></p>', ''),
(90, '<p>产品2</p>', '');

-- --------------------------------------------------------

--
-- 表的结构 `fa_admin`
--

CREATE TABLE IF NOT EXISTS `fa_admin` (
  `id` int(10) unsigned NOT NULL COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

--
-- 转存表中的数据 `fa_admin`
--

INSERT INTO `fa_admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `loginfailure`, `logintime`, `createtime`, `updatetime`, `token`, `status`) VALUES
(1, 'admin', 'Admin', '0ac854dd74e62547acdd76195adb6b68', 'd0cd50', '/assets/img/avatar.png', 'admin@admin.com', 0, 1509162244, 1492186163, 1509162244, '61a48ffc-7e56-4db0-9996-e5c7b62a4f74', 'normal'),
(2, 'admin2', 'admin2', '9a28ce07ce875fbd14172a9ca5357d3c', '2dHDmj', '/assets/img/avatar.png', 'admin2@fastadmin.net', 0, 1505450906, 1492186163, 1505450906, 'df45fdd5-26f4-45ca-83b3-47e4491a315a', 'normal'),
(3, 'admin3', 'admin3', '1c11f945dfcd808a130a8c2a8753fe62', 'WOKJEn', '/assets/img/avatar.png', 'admin3@fastadmin.net', 0, 1501980868, 1492186201, 1501982377, '', 'normal'),
(4, 'admin22', 'admin22', '1c1a0aa0c3c56a8c1a908aab94519648', 'Aybcn5', '/assets/img/avatar.png', 'admin22@fastadmin.net', 0, 0, 1492186240, 1492186240, '', 'normal'),
(5, 'admin32', 'admin32', 'ade94d5d7a7033afa7d84ac3066d0a02', 'FvYK0u', '/assets/img/avatar.png', 'admin32@fastadmin.net', 0, 0, 1492186263, 1492186263, '', 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_admin_log`
--

CREATE TABLE IF NOT EXISTS `fa_admin_log` (
  `id` int(10) unsigned NOT NULL COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '日志标题',
  `content` text NOT NULL COMMENT '内容',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) NOT NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间'
) ENGINE=InnoDB AUTO_INCREMENT=1341 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';

--
-- 转存表中的数据 `fa_admin_log`
--

INSERT INTO `fa_admin_log` (`id`, `admin_id`, `username`, `url`, `title`, `content`, `ip`, `useragent`, `createtime`) VALUES
(1317, 1, 'admin', '/admin.php/addon/install', '插件管理 安装', '{"name":"cms","force":"0","uid":"676","token":"53db3718-c94f-4756-8057-ba43b268bc93"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509091979),
(1318, 1, 'admin', '/admin.php/addon/local', '插件管理 本地安装', '{"name":"cms (1).zip"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509092006),
(1319, 1, 'admin', '/admin.php/addon/state', '插件管理 禁用启用', '{"name":"cms","action":"enable","force":"0"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509092009),
(1320, 1, 'admin', '/admin.php/cms/page/selectpage_type', '', '{"searchTable":"tbl","searchKey":"type","searchValue":"page","field":"type","order_by":[["type","ASC"]],"pkey_name":"type","pkey_value":"page"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509097614),
(1321, 1, 'admin', '/admin.php/ajax/upload', '', '{"name":"avatar.png"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509097652),
(1322, 1, 'admin', '/admin.php/ajax/upload', '', '{"name":"avatar.png"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509097669),
(1323, 1, 'admin', '/admin.php/addon/state', '插件管理 禁用启用', '{"name":"cms","action":"disable","force":"0"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509098353),
(1324, 1, 'admin', '/admin.php/addon/state', '插件管理 禁用启用', '{"name":"cms","action":"disable","force":"1"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509098355),
(1325, 1, 'admin', '/admin.php/addon/uninstall', '插件管理 卸载', '{"name":"cms","force":"0"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509098360),
(1326, 1, 'admin', '/admin.php/addon/install', '插件管理 安装', '{"name":"cms","force":"0","uid":"676","token":"53db3718-c94f-4756-8057-ba43b268bc93"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509098378),
(1327, 1, 'admin', '/admin.php/addon/state', '插件管理 禁用启用', '{"name":"cms","action":"enable","force":"0"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509098381),
(1328, 1, 'admin', '/admin.php/addon/state', '插件管理 禁用启用', '{"name":"cms","action":"enable","force":"1"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509098384),
(1329, 1, 'admin', '/admin.php/cms/fields/rulelist', '', '{"searchTable":"tbl","searchKey":"id","searchValue":"required","field":"name","order_by":[["name","ASC"]],"pkey_name":"id","pkey_value":"required"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509099660),
(1330, 1, 'admin', '/admin.php/cms/fields/rulelist', '', '{"searchTable":"tbl","searchKey":"id","searchValue":"required","field":"name","order_by":[["name","ASC"]],"pkey_name":"id","pkey_value":"required"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509099672),
(1331, 1, 'admin', '/admin.php/ajax/weigh', '', '{"ids":"137,138,136","changeid":"137","pid":"","field":"weigh","orderway":"desc","table":"fields"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509099726),
(1332, 1, 'admin', '/admin.php/ajax/weigh', '', '{"ids":"138,137,136","changeid":"137","pid":"","field":"weigh","orderway":"desc","table":"fields"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509099729),
(1333, 1, 'admin', '/admin.php/index/login?url=//cms', '登录', '{"url":"\\/\\/cms","__token__":"6881fe50694eabd9f25b7ff35e6c8874","username":"admin"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509162244),
(1334, 1, 'admin', '/admin.php/addon/install', '插件管理 安装', '{"name":"blog","force":"0","uid":"676","token":"53db3718-c94f-4756-8057-ba43b268bc93"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509162942),
(1335, 1, 'admin', '/admin.php/cms/fields/rulelist', '', '{"searchTable":"tbl","searchKey":"id","searchValue":"required","field":"name","order_by":[["name","ASC"]],"pkey_name":"id","pkey_value":"required"}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509162966),
(1336, 1, 'admin', '/admin.php/cms/fields/rulelist', '', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"AND","orderBy":[["name","ASC"]],"searchTable":"tbl","page":"1","per_page":"10","and_or":"AND","order_by":[["name","ASC"]],"field":"name","pkey_name":"id","search_field":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509162970),
(1337, 1, 'admin', '/admin.php/cms/fields/rulelist', '', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"AND","orderBy":[["name","ASC"]],"searchTable":"tbl","page":"1","per_page":"10","and_or":"AND","order_by":[["name","ASC"]],"field":"name","pkey_name":"id","search_field":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509162981),
(1338, 1, 'admin', '/admin.php/cms/fields/rulelist', '', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"AND","orderBy":[["name","ASC"]],"searchTable":"tbl","page":"1","per_page":"10","and_or":"AND","order_by":[["name","ASC"]],"field":"name","pkey_name":"id","search_field":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509162989),
(1339, 1, 'admin', '/admin.php/cms/fields/rulelist', '', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"AND","orderBy":[["name","ASC"]],"searchTable":"tbl","page":"1","per_page":"10","and_or":"AND","order_by":[["name","ASC"]],"field":"name","pkey_name":"id","search_field":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509162991),
(1340, 1, 'admin', '/admin.php/cms/fields/rulelist', '', '{"q_word":[""],"pageNumber":"1","pageSize":"10","andOr":"AND","orderBy":[["name","ASC"]],"searchTable":"tbl","page":"1","per_page":"10","and_or":"AND","order_by":[["name","ASC"]],"field":"name","pkey_name":"id","search_field":["name"],"name":""}', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.62 Safari/537.36', 1509162999);

-- --------------------------------------------------------

--
-- 表的结构 `fa_archives`
--

CREATE TABLE IF NOT EXISTS `fa_archives` (
  `id` int(10) unsigned NOT NULL,
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
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内容表';

--
-- 转存表中的数据 `fa_archives`
--

INSERT INTO `fa_archives` (`id`, `channel_id`, `model_id`, `title`, `flag`, `image`, `keywords`, `description`, `tags`, `weigh`, `views`, `comments`, `likes`, `dislikes`, `diyname`, `createtime`, `updatetime`, `publishtime`, `deletetime`, `status`) VALUES
(84, 35, 0, '测试新闻1', '', '', '', '', 0xe69e81e9809f2c4661737441646d696e2ce696b0e997bb31, 84, 1, 0, 0, 0, 'news1', 1508990778, 1508992752, 1508947200, NULL, 'normal'),
(85, 35, 0, '测试新闻2', '', '', '', '', 0x4661737441646d696e2ce69e81e9809f, 85, 0, 0, 0, 0, 'news2', 1508991029, 1508992725, 1508947200, NULL, 'normal'),
(89, 38, 0, '产品1', '', '', '', '', 0xe4baa7e59381312c4661737441646d696e, 89, 1, 0, 0, 0, 'product1', 1508992836, 1508992836, 1508947200, NULL, 'normal'),
(90, 38, 0, '产品2', '', '', '', '', 0xe4baa7e59381322c4661737441646d696e, 90, 0, 0, 0, 0, '', 1508992861, 1508992861, 1508947200, NULL, 'normal'),
(91, 35, 0, '新闻2', '', '', '', '', 0xe696b0e997bb32, 91, 0, 0, 0, 0, 'news2-2', 1508993329, 1508993329, 1508947200, NULL, 'normal'),
(92, 36, 0, '新闻2-2', '', '', '', '', 0xe696b0e997bb32, 92, 0, 0, 0, 0, 'n2', 1508993357, 1508993357, 1508947200, NULL, 'normal'),
(93, 35, 0, '新闻X', '', '', '', '', 0xe696b0e997bb31, 93, 0, 0, 0, 0, 'n23', 1508993390, 1508993390, 1508947200, NULL, 'normal'),
(94, 36, 0, '新闻2X', '', '', '', '', 0xe696b0e997bb32, 94, 0, 0, 0, 0, '2x', 1508993412, 1508993412, 1508947200, NULL, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_attachment`
--

CREATE TABLE IF NOT EXISTS `fa_attachment` (
  `id` int(20) unsigned NOT NULL COMMENT 'ID',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) NOT NULL DEFAULT '' COMMENT '宽度',
  `imagetype` varchar(30) NOT NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(30) NOT NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) NOT NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建日期',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `storage` enum('local','upyun','qiniu') NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) NOT NULL DEFAULT '' COMMENT '文件 sha1编码'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

--
-- 转存表中的数据 `fa_attachment`
--

INSERT INTO `fa_attachment` (`id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES
(1, '/assets/img/qrcode.png', '150', '150', 'png', 0, 21859, 'image/png', '', 1499681848, 1499681848, 1499681848, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6'),
(2, '/uploads/20171027/f57ebce8a72b823912904fe76eda0909.png', '192', '192', 'png', 0, 15135, 'image/png', '', 1509097652, 1509097652, 1509097652, 'local', '9c39ed36543710c1ce4de7e0e56391c37ae58d56'),
(3, '/uploads/20171027/f57ebce8a72b823912904fe76eda0909.png', '192', '192', 'png', 0, 15135, 'image/png', '', 1509097669, 1509097669, 1509097669, 'local', '9c39ed36543710c1ce4de7e0e56391c37ae58d56');

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_group`
--

CREATE TABLE IF NOT EXISTS `fa_auth_group` (
  `id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='分组表';

--
-- 转存表中的数据 `fa_auth_group`
--

INSERT INTO `fa_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES
(1, 0, 'Admin group', '*', 1490883540, 149088354, 'normal'),
(2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1490883540, 1505465692, 'normal'),
(3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1490883540, 1502205322, 'normal'),
(4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1490883540, 1502205350, 'normal'),
(5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1490883540, 1502205344, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_group_access`
--

CREATE TABLE IF NOT EXISTS `fa_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限分组表';

--
-- 转存表中的数据 `fa_auth_group_access`
--

INSERT INTO `fa_auth_group_access` (`uid`, `group_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 5),
(5, 5);

-- --------------------------------------------------------

--
-- 表的结构 `fa_auth_rule`
--

CREATE TABLE IF NOT EXISTS `fa_auth_rule` (
  `id` int(10) unsigned NOT NULL,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

--
-- 转存表中的数据 `fa_auth_rule`
--

INSERT INTO `fa_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `condition`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard\r', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal'),
(2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', 1, 1497429920, 1497430169, 137, 'normal'),
(3, 'file', 0, 'category', 'Category', 'fa fa-list\r', '', 'Category tips', 1, 1497429920, 1497429920, 119, 'normal'),
(4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', 'Addon tips', 1, 1502035509, 1502035509, 0, 'normal'),
(5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', 1, 1497429920, 1497430092, 99, 'normal'),
(6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal'),
(7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal'),
(8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user\r', '', '', 1, 1497429920, 1497429920, 34, 'normal'),
(9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', 'Admin tips', 1, 1497429920, 1497430320, 118, 'normal'),
(10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', 'Admin log tips', 1, 1497429920, 1497430307, 113, 'normal'),
(11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', 'Group tips', 1, 1497429920, 1497429920, 109, 'normal'),
(12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal'),
(13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 136, 'normal'),
(14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 135, 'normal'),
(15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 133, 'normal'),
(16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 134, 'normal'),
(17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 132, 'normal'),
(18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 52, 'normal'),
(19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 51, 'normal'),
(20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 50, 'normal'),
(21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 49, 'normal'),
(22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 48, 'normal'),
(23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 59, 'normal'),
(24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 58, 'normal'),
(25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 57, 'normal'),
(26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 56, 'normal'),
(27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 55, 'normal'),
(28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 54, 'normal'),
(29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 33, 'normal'),
(30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 32, 'normal'),
(31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 31, 'normal'),
(32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 30, 'normal'),
(33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 29, 'normal'),
(34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 28, 'normal'),
(35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 142, 'normal'),
(36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 141, 'normal'),
(37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 140, 'normal'),
(38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 139, 'normal'),
(39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 138, 'normal'),
(40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 117, 'normal'),
(41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 116, 'normal'),
(42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 115, 'normal'),
(43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 114, 'normal'),
(44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 112, 'normal'),
(45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 111, 'normal'),
(46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 110, 'normal'),
(47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 108, 'normal'),
(48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 107, 'normal'),
(49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 106, 'normal'),
(50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 105, 'normal'),
(51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 103, 'normal'),
(52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 102, 'normal'),
(53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 101, 'normal'),
(54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1497429920, 1497429920, 100, 'normal'),
(55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(59, 'file', 4, 'addon/local', 'Local install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(61, 'file', 4, 'addon/install', 'Install', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(62, 'file', 4, 'addon/uninstall', 'Uninstall', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', 0, 1502035509, 1502035509, 0, 'normal'),
(109, 'file', 0, 'cms', 'CMS管理', 'fa fa-list', '', '', 1, 1509098378, 1509098378, 0, 'normal'),
(110, 'file', 109, 'cms/archives', '内容管理', 'fa fa-list', '', '', 1, 1509098378, 1509098378, 0, 'normal'),
(111, 'file', 110, 'cms/archives/index', '查看', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(112, 'file', 110, 'cms/archives/add', '添加', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(113, 'file', 110, 'cms/archives/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(114, 'file', 110, 'cms/archives/del', '删除', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(115, 'file', 110, 'cms/archives/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(116, 'file', 109, 'cms/channel', '栏目管理', 'fa fa-list', '', '', 1, 1509098378, 1509098378, 0, 'normal'),
(117, 'file', 116, 'cms/channel/index', '查看', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(118, 'file', 116, 'cms/channel/add', '添加', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(119, 'file', 116, 'cms/channel/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(120, 'file', 116, 'cms/channel/del', '删除', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(121, 'file', 116, 'cms/channel/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(122, 'file', 109, 'cms/model', '模型管理', 'fa fa-model', '', '', 1, 1509098378, 1509098378, 0, 'normal'),
(123, 'file', 122, 'cms/model/index', '查看', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(124, 'file', 122, 'cms/model/add', '添加', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(125, 'file', 122, 'cms/model/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(126, 'file', 122, 'cms/model/del', '删除', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(127, 'file', 122, 'cms/model/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(128, 'file', 122, 'cms/fields', '字段管理', 'fa fa-fields', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(129, 'file', 128, 'cms/fields/index', '查看', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(130, 'file', 128, 'cms/fields/add', '添加', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(131, 'file', 128, 'cms/fields/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(132, 'file', 128, 'cms/fields/del', '删除', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(133, 'file', 128, 'cms/fields/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(134, 'file', 109, 'cms/tags', '标签管理', 'fa fa-tags', '', '', 1, 1509098378, 1509098378, 0, 'normal'),
(135, 'file', 134, 'cms/tags/index', '查看', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(136, 'file', 134, 'cms/tags/add', '添加', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(137, 'file', 134, 'cms/tags/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(138, 'file', 134, 'cms/tags/del', '删除', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(139, 'file', 134, 'cms/tags/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(140, 'file', 109, 'cms/block', '区域管理', 'fa fa-block', '', '', 1, 1509098378, 1509098378, 0, 'normal'),
(141, 'file', 140, 'cms/block/index', '查看', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(142, 'file', 140, 'cms/block/add', '添加', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(143, 'file', 140, 'cms/block/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(144, 'file', 140, 'cms/block/del', '删除', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(145, 'file', 140, 'cms/block/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(146, 'file', 109, 'cms/page', '单页管理', 'fa fa-page', '', '', 1, 1509098378, 1509098378, 0, 'normal'),
(147, 'file', 146, 'cms/page/index', '查看', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(148, 'file', 146, 'cms/page/add', '添加', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(149, 'file', 146, 'cms/page/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(150, 'file', 146, 'cms/page/del', '删除', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(151, 'file', 146, 'cms/page/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1509098378, 1509098378, 0, 'normal'),
(152, 'file', 0, 'blog', '博客管理', 'fa fa-list', '', '', 1, 1509162942, 1509162942, 0, 'normal'),
(153, 'file', 152, 'blog/post', '日志管理', 'fa fa-list', '', '', 1, 1509162942, 1509162942, 0, 'normal'),
(154, 'file', 153, 'blog/post/index', '查看', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(155, 'file', 153, 'blog/post/add', '添加', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(156, 'file', 153, 'blog/post/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(157, 'file', 153, 'blog/post/del', '删除', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(158, 'file', 153, 'blog/post/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(159, 'file', 152, 'blog/category', '分类管理', 'fa fa-list', '', '', 1, 1509162942, 1509162942, 0, 'normal'),
(160, 'file', 159, 'blog/category/index', '查看', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(161, 'file', 159, 'blog/category/add', '添加', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(162, 'file', 159, 'blog/category/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(163, 'file', 159, 'blog/category/del', '删除', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(164, 'file', 159, 'blog/category/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(165, 'file', 152, 'blog/comment', '评论管理', 'fa fa-comment', '', '', 1, 1509162942, 1509162942, 0, 'normal'),
(166, 'file', 165, 'blog/comment/index', '查看', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(167, 'file', 165, 'blog/comment/add', '添加', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(168, 'file', 165, 'blog/comment/edit', '修改', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(169, 'file', 165, 'blog/comment/del', '删除', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal'),
(170, 'file', 165, 'blog/comment/multi', '批量更新', 'fa fa-circle-o', '', '', 0, 1509162942, 1509162942, 0, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_block`
--

CREATE TABLE IF NOT EXISTS `fa_block` (
  `id` smallint(8) unsigned NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `url` varchar(100) NOT NULL DEFAULT '' COMMENT '链接',
  `content` mediumtext NOT NULL COMMENT '内容',
  `createtime` int(10) NOT NULL COMMENT '添加时间',
  `updatetime` int(10) NOT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='区块表';

--
-- 转存表中的数据 `fa_block`
--

INSERT INTO `fa_block` (`id`, `type`, `name`, `title`, `image`, `url`, `content`, `createtime`, `updatetime`, `status`) VALUES
(1, 'focus', 'focus', '幻灯图片1', '/assets/addons/cms/img/focus/1.jpg', 'http://www.fastadmin.net', '111', 0, 0, 'normal'),
(2, 'focus', 'focus', '幻灯图片2', '/assets/addons/cms/img/focus/2.jpg', 'http://www.fastadmin.net', '222', 0, 0, 'normal'),
(3, 'focus', 'focus', '幻灯图片3', '/assets/addons/cms/img/focus/3.jpg', 'http://www.fastadmin.net', '333', 0, 0, 'normal'),
(4, 'other', 'contactus', '联系我们', '', '', '', 0, 0, 'normal'),
(6, 'other', 'footer', '底部链接', '', '', '<div class="col-md-3 col-sm-3">\n                            <div class="footer-logo">\n                                <a href=“#”><i class="fa fa-bookmark"></i></a>\n                            </div>\n                            <p class="copyright"><small>© 2017. All Rights Reserved. <br>\n                                    FastAdmin\n                                </small>\n                            </p>\n                        </div>\n                        <div class="col-md-5 col-md-push-1 col-sm-5 col-sm-push-1">\n                            <div class="row">\n                                <div class="col-md-4 col-sm-4">\n                                    <ul class="links">\n                                        <li><a href="#">关于我们</a></li>\n                                        <li><a href="#">发展历程</a></li>\n                                        <li><a href="#">服务项目</a></li>\n                                        <li><a href="#">团队成员</a></li>\n                                    </ul>\n                                </div>\n                                <div class="col-md-4 col-sm-4">\n                                    <ul class="links">\n                                        <li><a href="#">新闻</a></li>\n                                        <li><a href="#">资讯</a></li>\n                                        <li><a href="#">推荐</a></li>\n                                        <li><a href="#">博客</a></li>\n                                    </ul>\n                                </div>\n                                <div class="col-md-4 col-sm-4">\n                                    <ul class="links">\n                                        <li><a href="#">服务</a></li>\n                                        <li><a href="#">圈子</a></li>\n                                        <li><a href="#">论坛</a></li>\n                                        <li><a href="#">广告</a></li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                        <div class="col-md-3 col-sm-3 col-md-push-1 col-sm-push-1">\n                            <div class="footer-social">\n                                <a href="#"><i class="fa fa-weibo"></i></a>\n                                <a href="#"><i class="fa fa-qq"></i></a>\n                                <a href="#"><i class="fa fa-wechat"></i></a>\n                            </div>\n                        </div>', 0, 0, 'normal'),
(7, 'other', 'bannerad', '通栏广告', '/assets/addons/cms/img/banner/1.jpg', 'http://www.fastadmin.net', '', 0, 0, 'normal'),
(8, 'other', 'sidebarad1', '边栏广告1', '/assets/addons/cms/img/sidebar/1.jpg', 'http://www.fastadmin.net', '', 0, 0, 'normal'),
(9, 'other', 'sidebarad2', '边栏广告2', '/assets/addons/cms/img/sidebar/2.jpg', 'http://www.fastadmin.net', '', 0, 0, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_blog_category`
--

CREATE TABLE IF NOT EXISTS `fa_blog_category` (
  `id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父分类ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '分类名称',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '分类昵称',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '分类标志',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='博客分类表';

--
-- 转存表中的数据 `fa_blog_category`
--

INSERT INTO `fa_blog_category` (`id`, `pid`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, '默认分类', 'default', '', '/assets/img/qrcode.png', '', '', '', 1502112587, 1502112587, 0, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_blog_comment`
--

CREATE TABLE IF NOT EXISTS `fa_blog_comment` (
  `id` int(10) unsigned NOT NULL COMMENT 'ID',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮箱',
  `website` varchar(100) NOT NULL DEFAULT '' COMMENT '网址',
  `content` text NOT NULL COMMENT '内容',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(50) NOT NULL DEFAULT '' COMMENT 'User Agent',
  `subscribe` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '订阅',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客评论表';

--
-- 转存表中的数据 `fa_blog_comment`
--

INSERT INTO `fa_blog_comment` (`id`, `post_id`, `pid`, `username`, `email`, `website`, `content`, `comments`, `ip`, `useragent`, `subscribe`, `createtime`, `updatetime`, `status`) VALUES
(1, 4, 0, 'Lily', '', '', '博客的出现才是近几年的事情，但是要书写博客历史，却不是一件轻松的事情。许多史料必须像挖掘“古董”一样去求证，而且分歧和争议颇多。', 0, '', '', 0, 1502112587, 1502112587, 'normal'),
(2, 4, 0, '约翰', '', '', '博客天然的草根性，也决定了人们很难来认定一个正式的“博客之父”，也没有人敢于戴上这顶帽子，否则，一定会打得头破血流。', 0, '', '', 0, 1502112587, 1502112587, 'normal'),
(3, 4, 0, '小杜', '', '', 'Blog中最简单的形式。单个的作者对于特定的话题提供相关的资源，发表简短的评论。', 0, '', '', 0, 1502112587, 1502112587, 'normal'),
(4, 4, 2, 'John', '', '', '按照博客主人的知名度、博客文章受欢迎的程度，可以将博客分为名人博客、一般博客、热门博客等。', 0, '', '', 0, 1502112587, 1502112587, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_blog_post`
--

CREATE TABLE IF NOT EXISTS `fa_blog_post` (
  `id` int(10) unsigned NOT NULL COMMENT 'ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `summary` varchar(1500) NOT NULL DEFAULT '' COMMENT '摘要',
  `content` text NOT NULL COMMENT '内容',
  `thumb` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '大图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `comments` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '评论数',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='博客日志表';

--
-- 转存表中的数据 `fa_blog_post`
--

INSERT INTO `fa_blog_post` (`id`, `category_id`, `flag`, `title`, `summary`, `content`, `thumb`, `image`, `keywords`, `description`, `views`, `comments`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 1, '', '关于FastAdmin', '<p>FastAdmin是一款基于ThinkPHP5和Bootstrap的极速后台开发框架，其强大的CRUD一键生成功能和丰富的插件扩展，让你的后台开发更加简单、快速。</p>', '<p>FastAdmin是一款基于ThinkPHP5和Bootstrap的极速后台开发框架，其强大的CRUD一键生成功能和丰富的插件扩展，让你的后台开发更加简单、快速。</p>', '/assets/addons/blog/img/thumb.jpg', '', '', '', 113, 0, 1502112587, 1502112587, 0, 'normal'),
(2, 1, '', '博客的来源', '<p>        博客最早是由Jorn Barger在1997年12月提出博客这个名称，但是在1998年，互联网上的博客网站却屈指可数。那时，Infosift的编辑Jesse J.Garrett想列举一个博客类似站点的名单，便在互联网上开始了艰难的搜索， 终于在1998年的12月，他的搜集好了部分网站的名单。他把这份名单发给了Cameron Barrett，Cameron觉得这份名单非常有用，就将它在Camworld网站上公布于众。其它的博客站点维护者发现此举后，也纷纷把自己的网址和网站名称、主要特色都发了过来，这个名单也就日渐丰富。到了1999年初，Jesse的“完全博客站点”名单所列的站点已达23个。<br></p>', '<div label-module="para"><p>&nbsp; &nbsp; &nbsp; &nbsp; 博客最早是由Jorn Barger在1997年12月提出博客这个名称，但是在1998年，互联网上的博客网站却屈指可数。那时，Infosift的编辑Jesse J.Garrett想列举一个博客类似站点的名单，便在互联网上开始了艰难的搜索， 终于在1998年的12月，他的搜集好了部分网站的名单。他把这份名单发给了Cameron Barrett，Cameron觉得这份名单非常有用，就将它在Camworld网站上公布于众。其它的博客站点维护者发现此举后，也纷纷把自己的网址和网站名称、主要特色都发了过来，这个名单也就日渐丰富。到了1999年初，Jesse的“完全博客站点”名单所列的站点已达23个。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;由于Cameron与Jesse共同维护的博客站点列表既有趣又易于阅读，吸引了很多人的眼球。在这种情况下，Peter Merholz宣称：“这个新鲜事物必将引起大多数人的注意。作为未来的一个常用词语，web-log将不可避免地被简称为blog，而那些编写网络日志的人，也就顺理成章地成为blogger——博客”。这代表着博客被正式命名。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;随着博客数量的增多，每个博客网站上编写的网络日志的内容也混杂起来，以至把每一个新出的站点主要内容和特色都不可能搞清楚。Cameron后来就只在网站上登载熟悉的博客站点了。时隔不久，Brigitte Eaton也搜集出了一个名叫“Eaton网络门户”的博客站点名单，并且提出应该以日期为基础组织内容。这也建立了blog分类排列的一大标准。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1999年7月，一个专门制作博客站点的“Pitas”免费工具软件发布了，这对于博客站点的快速搭建起着很关键的作用。随后，上百个同类工具也如雨后春笋般制作出来。这种工具对于加速建立博客站点的数量，是意义重大的。同年的8月份，Pyra发布了Blogger网站，Groksoup也投入运营，使用这些企业所提供的简单的基于互联网的工具，博客站点的数量终于出现了一种爆炸性增长。1999年末，软件研发商Dave Winer向大家推荐Edit This Page网站，Jeff A. Campbell发布了Velocinews网站。所有的这些服务都是免费的，他们的目的也很明确：让更多的人成为博客，来网上发表意见和见解。</p><div label-module="para"><br></div></div>', '/assets/addons/blog/img/thumb.jpg', '', '', '', 41, 0, 1502111289, 1502111289, 0, 'normal'),
(3, 1, '', '博客的崛起', '<p>&nbsp; &nbsp; &nbsp; &nbsp; 这几年，对于所有新闻媒体来说，都品尝到了技术变革的滋味。如今，再没有任何人会否认互联网对媒体带来的革命，但是，好像也没有多少人感知到互联网的神奇：颠覆性的力量似乎并没有来到人间。所有的核心在于时间。对于性急的人来说，时间如同缓慢的河流，对于从容的人来说，时间又是急流。互联网的力量的确还没有充分施展，因为互联网的商业化起始，到今天仅仅才10年；互联网作为一种新的媒体方式，从尝试到今天，也刚刚跨过10年。</p>', '<p>        这几年，对于所有新闻媒体来说，都品尝到了技术变革的滋味。如今，再没有任何人会否认互联网对媒体带来的革命，但是，好像也没有多少人感知到互联网的神奇：颠覆性的力量似乎并没有来到人间。</p><p>        所有的核心在于时间。对于性急的人来说，时间如同缓慢的河流，对于从容的人来说，时间又是急流。互联网的力量的确还没有充分施展，因为互联网的商业化起始，到今天仅仅才10年；互联网作为一种新的媒体方式，从尝试到今天，也刚刚跨过10年。<br>        对于一种全新的媒体形式来说，10年实在过于短暂。但是，10年也足以让人们感受到势不可挡的力量，以及依然静静潜伏着的冲击力。而今，随着博客的崭露头角，网络媒体异常的力量开始展现了，声势逐渐发大。虽然，博客依然在大多数人的视野之外，但是，他们改变历史的征程已经启动。<br>1998年，个人博客网站“德拉吉报道”率先捅出克林顿莱温斯基绯闻案；<br>2001年，911事件使得博客成为重要的新闻之源，而步入主流；<br>2002年12月，多数党领袖洛特的不慎之言被博客网站盯住，而丢掉了乌纱帽；<br>2003年，围绕新闻报道的传统媒体和互联网上的伊拉克战争也同时开打，美国传统媒体公信力遭遇空前质疑，博客大获全胜；<br>2003年6月，《纽约时报》执行主编和总编辑也被“博客”揭开的真相而下台，引爆了新闻媒体史上最大的丑闻之一；<br>2004年4月，轰动一时的Gmail测试者大部分从bloggers中产生；<br>……<br></p><p>这一系列发源于博客世界的颠覆性力量，不但塑造着博客自身全新的形象，而且，也在深刻地改变着媒体的传统和未来走向。</p>', '/assets/addons/blog/img/thumb.jpg', '', '', '', 58, 0, 1502112074, 1502112074, 0, 'normal'),
(4, 1, '', '博客的时代正在到来', '<p>&nbsp; &nbsp; &nbsp; &nbsp; 全世界每天传播的媒体内容，有一半是由6大媒体巨头所控制。其利益驱动、意识形态以及传统的审查制度，使得这些经过严重加工处理的内容已经越来越不适应人们的需求。媒体的工业化，内容出口的工厂化，都在严重影响其发展。<br>比如，以美联社为例，有近4000人专业记者，每天“制造并出厂”2000万字的内容，每天发布在8500多种报纸、杂志和广播中，把读者当作“信息动物”一样。这种大教堂式的模式主导了整个媒体世界。这时，以个人为中心的博客潮流却开始有力冲击传统媒体，尤其是对新闻界多年形成的传统观念和道德规范。<br></p>', '<p>        全世界每天传播的媒体内容，有一半是由6大媒体巨头所控制。其利益驱动、意识形态以及传统的审查制度，使得这些经过严重加工处理的内容已经越来越不适应人们的需求。媒体的工业化，内容出口的工厂化，都在严重影响其发展。<br>比如，以美联社为例，有近4000人专业记者，每天“制造并出厂”2000万字的内容，每天发布在8500多种报纸、杂志和广播中，把读者当作“信息动物”一样。这种大教堂式的模式主导了整个媒体世界。这时，以个人为中心的博客潮流却开始有力冲击传统媒体，尤其是对新闻界多年形成的传统观念和道德规范。<br>        博客是一种满足“五零”条件(零编辑、零技术、零体制、零成本、零形式)而实现的“零进入壁垒”的网上个人出版方式，从媒体价值链最重要的三个环节：作者、内容和读者三大层次，实现了“源代码的开放”。并同时在道德规范、运作机制和经济规律等层次，将逐步完成体制层面的真正开放，使未来媒体世界完成从大教堂模式到集市模式的根本转变。<br>        博客的出现集中体现了互联网时代媒体界所体现的商业化垄断与非商业化自由，大众化传播与个性化(分众化，小众化)表达，单向传播与双向传播3个基本矛盾、方向和互动。这几个矛盾因为博客引发的开放源代码运动，至少在技术层面上得到了根本的解决。</p>\r\n                <p><img src="/assets/addons/blog/img/thumb.jpg" alt=""></p>', '/assets/addons/blog/img/thumb.jpg', '', '', '', 71, 4, 1502111626, 1502111626, 0, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_category`
--

CREATE TABLE IF NOT EXISTS `fa_category` (
  `id` int(10) unsigned NOT NULL,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) NOT NULL DEFAULT '',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) NOT NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='分类表';

--
-- 转存表中的数据 `fa_category`
--

INSERT INTO `fa_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(1, 0, 'page', '官方新闻', 'news', 'recommend', '/assets/img/qrcode.png', '', '', 'news', 1495262190, 1495262190, 1, 'normal'),
(2, 0, 'page', '移动应用', 'mobileapp', 'hot', '/assets/img/qrcode.png', '', '', 'mobileapp', 1495262244, 1495262244, 2, 'normal'),
(3, 2, 'page', '微信公众号', 'wechatpublic', 'index', '/assets/img/qrcode.png', '', '', 'wechatpublic', 1495262288, 1495262288, 3, 'normal'),
(4, 2, 'page', 'Android开发', 'android', 'recommend', '/assets/img/qrcode.png', '', '', 'android', 1495262317, 1495262317, 4, 'normal'),
(5, 0, 'page', '软件产品', 'software', 'recommend', '/assets/img/qrcode.png', '', '', 'software', 1495262336, 1499681850, 5, 'normal'),
(6, 5, 'page', '网站建站', 'website', 'recommend', '/assets/img/qrcode.png', '', '', 'website', 1495262357, 1495262357, 6, 'normal'),
(7, 5, 'page', '企业管理软件', 'company', 'index', '/assets/img/qrcode.png', '', '', 'company', 1495262391, 1495262391, 7, 'normal'),
(8, 6, 'page', 'PC端', 'website-pc', 'recommend', '/assets/img/qrcode.png', '', '', 'website-pc', 1495262424, 1495262424, 8, 'normal'),
(9, 6, 'page', '移动端', 'website-mobile', 'recommend', '/assets/img/qrcode.png', '', '', 'website-mobile', 1495262456, 1495262456, 9, 'normal'),
(10, 7, 'page', 'CRM系统 ', 'company-crm', 'recommend', '/assets/img/qrcode.png', '', '', 'company-crm', 1495262487, 1495262487, 10, 'normal'),
(11, 7, 'page', 'SASS平台软件', 'company-sass', 'recommend', '/assets/img/qrcode.png', '', '', 'company-sass', 1495262515, 1495262515, 11, 'normal'),
(12, 0, 'test', '测试1', 'test1', 'recommend', '/assets/img/qrcode.png', '', '', 'test1', 1497015727, 1497015727, 12, 'normal'),
(13, 0, 'test', '测试2', 'test2', 'recommend', '/assets/img/qrcode.png', '', '', 'test2', 1497015738, 1497015738, 13, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_channel`
--

CREATE TABLE IF NOT EXISTS `fa_channel` (
  `id` int(10) unsigned NOT NULL,
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
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='栏目表';

--
-- 转存表中的数据 `fa_channel`
--

INSERT INTO `fa_channel` (`id`, `type`, `model_id`, `parent_id`, `name`, `image`, `keywords`, `description`, `diyname`, `outlink`, `items`, `weigh`, `channeltpl`, `listtpl`, `showtpl`, `pagesize`, `createtime`, `updatetime`, `status`) VALUES
(34, 'channel', 7, 0, '新闻中心', '', '', '', 'news', '', 0, 9, 'channel.html', '', '', 10, 1508990697, 1508992553, 'normal'),
(35, 'list', 7, 34, '新闻1', '', '', '', 'news1', '', 6, 5, 'channel.html', 'list_news.html', 'show_news.html', 10, 1508990707, 1508992563, 'normal'),
(36, 'list', 7, 35, '新闻1-1', '', '', '', 'news1-1', '', 2, 8, 'channel.html', 'list_news.html', 'show_news.html', 10, 1508990716, 1508992574, 'normal'),
(37, 'channel', 7, 0, '产品中心', '', '', '', 'product', '', 0, 10, 'channel.html', '', '', 10, 1508992541, 1509099822, 'normal'),
(38, 'list', 8, 37, '产品1', '', '', '', 'product1', '', 2, 4, 'channel.html', 'list_product.html', 'show_product.html', 10, 1508992598, 1508992598, 'normal'),
(39, 'list', 8, 38, '产品1-1', '', '', '', 'product1-1', '', 0, 7, 'channel.html', 'list_product.html', 'show_product.html', 10, 1508992623, 1508992623, 'normal'),
(40, 'link', 7, 0, '关于我们', '', '', '', 'aboutus', 0x2f702f61626f757475732e68746d6c, 0, 1, 'channel.html', '', '', 10, 1508994681, 1508994681, 'normal'),
(41, 'link', 7, 0, '官网首页', '', '', '', 'official', 0x687474703a2f2f7777772e6661737461646d696e2e6e6574, 0, 6, 'channel.html', '', '', 10, 1508994753, 1508994753, 'normal'),
(42, 'link', 7, 0, '交流社区', '', '', '', 'forum', 0x687474703a2f2f666f72756d2e6661737461646d696e2e6e6574, 0, 3, 'channel.html', '', '', 10, 1508994772, 1508994772, 'normal'),
(43, 'link', 7, 0, '文档', '', '', '', 'docs', 0x687474703a2f2f646f632e6661737461646d696e2e6e6574, 0, 2, 'channel.html', '', '', 10, 1508994788, 1508994788, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_config`
--

CREATE TABLE IF NOT EXISTS `fa_config` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) NOT NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) NOT NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `value` text NOT NULL COMMENT '变量值',
  `content` text NOT NULL COMMENT '变量字典数据',
  `rule` varchar(100) NOT NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) NOT NULL DEFAULT '' COMMENT '扩展属性'
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='系统配置';

--
-- 转存表中的数据 `fa_config`
--

INSERT INTO `fa_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `value`, `content`, `rule`, `extend`) VALUES
(1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', 'FastAdmin', '', 'required', ''),
(2, 'beian', 'basic', 'Beian', '粤ICP备15054802号-4', 'string', '', '', '', ''),
(3, 'cdnurl', 'basic', 'Cdn url', '如果使用CDN云储存请配置该值', 'string', '', '', '', ''),
(4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '1.0.1', '', 'required', ''),
(5, 'timezone', 'basic', 'Timezone', '', 'string', 'Asia/Shanghai', '', 'required', ''),
(6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', ''),
(7, 'languages', 'basic', 'Languages', '', 'array', '{"backend":"zh-cn","frontend":"zh-cn"}', '', 'required', ''),
(8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', 'dashboard', '', 'required', ''),
(9, 'categorytype', 'dictionary', 'Cateogry type', '', 'array', '{"default":"Default","page":"Page","article":"Article","test":"Test"}', '', '', ''),
(10, 'configgroup', 'dictionary', 'Config group', '', 'array', '{"basic":"Basic","email":"Email","dictionary":"Dictionary","user":"User","example":"Example"}', '', '', ''),
(11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '1', '["Please select","SMTP","Mail"]', '', ''),
(12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', 'smtp.qq.com', '', '', ''),
(13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '465', '', '', ''),
(14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '10000', '', '', ''),
(15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码）', 'string', 'password', '', '', ''),
(16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '2', '["None","TLS","SSL"]', '', ''),
(17, 'mail_from', 'email', 'Mail from', '', 'string', '10000@qq.com', '', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `fa_fields`
--

CREATE TABLE IF NOT EXISTS `fa_fields` (
  `id` smallint(5) unsigned NOT NULL,
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
  `status` enum('normal','hidden') NOT NULL COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模型字段表';

--
-- 转存表中的数据 `fa_fields`
--

INSERT INTO `fa_fields` (`id`, `model_id`, `name`, `type`, `title`, `content`, `defaultvalue`, `rule`, `msg`, `ok`, `tip`, `decimals`, `length`, `minimum`, `maximum`, `extend`, `weigh`, `createtime`, `updatetime`, `isfilter`, `status`) VALUES
(136, 7, 'author', 'string', '作者', 'value1|title1\r\nvalue2|title2', '', '', '', '', '', 0, 255, 0, 0, '', 136, 1508990735, 1508991985, 1, 'normal'),
(137, 7, 'age', 'select', '年龄', '1-18|1-18岁\r\n19-29|19-29岁\r\n30-39|30-39岁', '', 'required', '', '', '', 0, 255, 0, 0, '', 137, 1508990746, 1508992045, 1, 'normal'),
(138, 7, 'gender', 'radio', '性别', 'male|男\r\nfemale|女', '', 'required', '', '', '', 0, 255, 0, 0, '', 138, 1508992093, 1508992093, 1, 'normal'),
(139, 8, 'productdata', 'images', '产品列表', 'value1|title1\r\nvalue2|title2', '', 'required', '', '', '', 0, 1500, 0, 20, '', 139, 1508992518, 1508992518, 1, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_model`
--

CREATE TABLE IF NOT EXISTS `fa_model` (
  `id` smallint(5) unsigned NOT NULL,
  `name` char(30) NOT NULL COMMENT '模型名称',
  `table` char(20) NOT NULL COMMENT '表名',
  `fields` text NOT NULL COMMENT '字段列表',
  `channeltpl` varchar(30) NOT NULL COMMENT '栏目页模板',
  `listtpl` varchar(30) NOT NULL COMMENT '列表页模板',
  `showtpl` varchar(30) NOT NULL COMMENT '详情页模板',
  `createtime` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `setting` text NOT NULL COMMENT '模型配置'
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='内容模型表';

--
-- 转存表中的数据 `fa_model`
--

INSERT INTO `fa_model` (`id`, `name`, `table`, `fields`, `channeltpl`, `listtpl`, `showtpl`, `createtime`, `updatetime`, `setting`) VALUES
(7, '新闻', 'addonnews', 'author,age', 'channel.html', 'list_news.html', 'show_news.html', 1508990659, 1508992045, ''),
(8, '产品', 'addonproduct', '', 'channel.html', 'list_product.html', 'show_product.html', 1508992445, 1508992445, '');

-- --------------------------------------------------------

--
-- 表的结构 `fa_page`
--

CREATE TABLE IF NOT EXISTS `fa_page` (
  `id` int(10) unsigned NOT NULL COMMENT 'ID',
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
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态'
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='单页表';

--
-- 转存表中的数据 `fa_page`
--

INSERT INTO `fa_page` (`id`, `category_id`, `type`, `title`, `keywords`, `description`, `flag`, `image`, `content`, `icon`, `views`, `comments`, `diyname`, `showtpl`, `createtime`, `updatetime`, `weigh`, `status`) VALUES
(28, 0, 'page', '基于ThinkPHP5和Bootstrap的极速后台开发框架', 'fds', 'fdsfdsdsf', '', 'fds', '<p>基于ThinkPHP5和Bootstrap进行二次开发,手机、平板、PC均自动适配,无需要担心兼容性问题</p>', '', 0, 0, 'aboutus', 'page', 1508933935, 1508934150, 28, 'normal');

-- --------------------------------------------------------

--
-- 表的结构 `fa_tags`
--

CREATE TABLE IF NOT EXISTS `fa_tags` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '标签名称',
  `archives` text NOT NULL COMMENT '文档ID集合',
  `nums` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='标签表';

--
-- 转存表中的数据 `fa_tags`
--

INSERT INTO `fa_tags` (`id`, `name`, `archives`, `nums`) VALUES
(30, 'FastAdmin', '85,84,89,90', 4),
(31, '极速', '85,84', 2),
(32, '新闻1', '84,93', 2),
(33, '产品1', '89', 1),
(34, '产品2', '90', 1),
(35, '新闻2', '91,92,94', 3);

-- --------------------------------------------------------

--
-- 表的结构 `fa_test`
--

CREATE TABLE IF NOT EXISTS `fa_test` (
  `id` int(10) unsigned NOT NULL COMMENT 'ID',
  `admin_id` int(10) NOT NULL COMMENT '管理员ID',
  `category_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) NOT NULL COMMENT '分类ID(多选)',
  `week` enum('monday','tuesday','wednesday') NOT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') NOT NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') NOT NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') NOT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) NOT NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) NOT NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(100) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '省市',
  `price` float(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '刷新时间(int)',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') NOT NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') NOT NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='测试表';

--
-- 转存表中的数据 `fa_test`
--

INSERT INTO `fa_test` (`id`, `admin_id`, `category_id`, `category_ids`, `week`, `flag`, `genderdata`, `hobbydata`, `title`, `content`, `image`, `images`, `attachfile`, `keywords`, `description`, `city`, `price`, `views`, `startdate`, `activitytime`, `year`, `times`, `refreshtime`, `createtime`, `updatetime`, `weigh`, `switch`, `status`, `state`) VALUES
(1, 0, 12, '12,13', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', 0.00, 0, '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1499682285, 1499682526, 1499682526, 0, 1, 'normal', '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fa_addonnews`
--
ALTER TABLE `fa_addonnews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_addonproduct`
--
ALTER TABLE `fa_addonproduct`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_admin`
--
ALTER TABLE `fa_admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`) USING BTREE;

--
-- Indexes for table `fa_admin_log`
--
ALTER TABLE `fa_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`username`);

--
-- Indexes for table `fa_archives`
--
ALTER TABLE `fa_archives`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`channel_id`,`status`),
  ADD KEY `channel` (`channel_id`,`weigh`,`id`);

--
-- Indexes for table `fa_attachment`
--
ALTER TABLE `fa_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_auth_group`
--
ALTER TABLE `fa_auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_auth_group_access`
--
ALTER TABLE `fa_auth_group_access`
  ADD UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `fa_auth_rule`
--
ALTER TABLE `fa_auth_rule`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `pid` (`pid`),
  ADD KEY `weigh` (`weigh`);

--
-- Indexes for table `fa_block`
--
ALTER TABLE `fa_block`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_blog_category`
--
ALTER TABLE `fa_blog_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weigh` (`weigh`,`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `fa_blog_comment`
--
ALTER TABLE `fa_blog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`,`pid`) USING BTREE;

--
-- Indexes for table `fa_blog_post`
--
ALTER TABLE `fa_blog_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `fa_category`
--
ALTER TABLE `fa_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weigh` (`weigh`,`id`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `fa_channel`
--
ALTER TABLE `fa_channel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `diyname` (`diyname`),
  ADD KEY `weigh` (`weigh`,`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `fa_config`
--
ALTER TABLE `fa_config`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `fa_fields`
--
ALTER TABLE `fa_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`model_id`) USING BTREE;

--
-- Indexes for table `fa_model`
--
ALTER TABLE `fa_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fa_page`
--
ALTER TABLE `fa_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `fa_tags`
--
ALTER TABLE `fa_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `nums` (`nums`);

--
-- Indexes for table `fa_test`
--
ALTER TABLE `fa_test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fa_admin`
--
ALTER TABLE `fa_admin`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fa_admin_log`
--
ALTER TABLE `fa_admin_log`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=1341;
--
-- AUTO_INCREMENT for table `fa_archives`
--
ALTER TABLE `fa_archives`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `fa_attachment`
--
ALTER TABLE `fa_attachment`
  MODIFY `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `fa_auth_group`
--
ALTER TABLE `fa_auth_group`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `fa_auth_rule`
--
ALTER TABLE `fa_auth_rule`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=171;
--
-- AUTO_INCREMENT for table `fa_block`
--
ALTER TABLE `fa_block`
  MODIFY `id` smallint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=211;
--
-- AUTO_INCREMENT for table `fa_blog_category`
--
ALTER TABLE `fa_blog_category`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `fa_blog_comment`
--
ALTER TABLE `fa_blog_comment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `fa_blog_post`
--
ALTER TABLE `fa_blog_post`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `fa_category`
--
ALTER TABLE `fa_category`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `fa_channel`
--
ALTER TABLE `fa_channel`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `fa_config`
--
ALTER TABLE `fa_config`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `fa_fields`
--
ALTER TABLE `fa_fields`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=140;
--
-- AUTO_INCREMENT for table `fa_model`
--
ALTER TABLE `fa_model`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `fa_page`
--
ALTER TABLE `fa_page`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `fa_tags`
--
ALTER TABLE `fa_tags`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `fa_test`
--
ALTER TABLE `fa_test`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
