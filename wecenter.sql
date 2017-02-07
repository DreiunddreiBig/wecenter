-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-02-07 21:55:59
-- 服务器版本： 5.6.35-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wecenter`
--

-- --------------------------------------------------------

--
-- 表的结构 `aws_active_data`
--

CREATE TABLE IF NOT EXISTS `aws_active_data` (
  `active_id` int(10) unsigned NOT NULL,
  `uid` int(11) DEFAULT '0',
  `expire_time` int(10) DEFAULT NULL,
  `active_code` varchar(32) DEFAULT NULL,
  `active_type_code` varchar(16) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL,
  `add_ip` bigint(12) DEFAULT NULL,
  `active_time` int(10) DEFAULT NULL,
  `active_ip` bigint(12) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_answer`
--

CREATE TABLE IF NOT EXISTS `aws_answer` (
  `answer_id` int(11) NOT NULL COMMENT '回答id',
  `question_id` int(11) NOT NULL COMMENT '问题id',
  `answer_content` text COMMENT '回答内容',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `against_count` int(11) NOT NULL DEFAULT '0' COMMENT '反对人数',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '支持人数',
  `uid` int(11) DEFAULT '0' COMMENT '发布问题用户ID',
  `comment_count` int(11) DEFAULT '0' COMMENT '评论总数',
  `uninterested_count` int(11) DEFAULT '0' COMMENT '不感兴趣',
  `thanks_count` int(11) DEFAULT '0' COMMENT '感谢数量',
  `category_id` int(11) DEFAULT '0' COMMENT '分类id',
  `has_attach` tinyint(1) DEFAULT '0' COMMENT '是否存在附件',
  `ip` bigint(11) DEFAULT NULL,
  `force_fold` tinyint(1) DEFAULT '0' COMMENT '强制折叠',
  `anonymous` tinyint(1) DEFAULT '0',
  `publish_source` varchar(16) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='回答';

-- --------------------------------------------------------

--
-- 表的结构 `aws_answer_comments`
--

CREATE TABLE IF NOT EXISTS `aws_answer_comments` (
  `id` int(11) unsigned NOT NULL,
  `answer_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text,
  `time` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_answer_thanks`
--

CREATE TABLE IF NOT EXISTS `aws_answer_thanks` (
  `id` int(11) unsigned NOT NULL,
  `uid` int(11) DEFAULT '0',
  `answer_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_answer_uninterested`
--

CREATE TABLE IF NOT EXISTS `aws_answer_uninterested` (
  `id` int(11) unsigned NOT NULL,
  `uid` int(11) DEFAULT '0',
  `answer_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_answer_vote`
--

CREATE TABLE IF NOT EXISTS `aws_answer_vote` (
  `voter_id` int(11) NOT NULL COMMENT '自动ID',
  `answer_id` int(11) DEFAULT NULL COMMENT '回复id',
  `answer_uid` int(11) DEFAULT NULL COMMENT '回复作者id',
  `vote_uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `vote_value` tinyint(4) NOT NULL COMMENT '-1反对 1 支持',
  `reputation_factor` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_approval`
--

CREATE TABLE IF NOT EXISTS `aws_approval` (
  `id` int(10) NOT NULL,
  `type` varchar(16) DEFAULT NULL,
  `data` mediumtext NOT NULL,
  `uid` int(11) NOT NULL DEFAULT '0',
  `time` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_article`
--

CREATE TABLE IF NOT EXISTS `aws_article` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` text,
  `comments` int(10) DEFAULT '0',
  `views` int(10) DEFAULT '0',
  `add_time` int(10) DEFAULT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `lock` int(1) NOT NULL DEFAULT '0',
  `votes` int(10) DEFAULT '0',
  `title_fulltext` text,
  `category_id` int(10) DEFAULT '0',
  `is_recommend` tinyint(1) DEFAULT '0',
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_article_comments`
--

CREATE TABLE IF NOT EXISTS `aws_article_comments` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `article_id` int(10) NOT NULL,
  `message` text NOT NULL,
  `add_time` int(10) NOT NULL,
  `at_uid` int(10) DEFAULT NULL,
  `votes` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_article_vote`
--

CREATE TABLE IF NOT EXISTS `aws_article_vote` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `type` varchar(16) DEFAULT NULL,
  `item_id` int(10) NOT NULL,
  `rating` tinyint(1) DEFAULT '0',
  `time` int(10) NOT NULL,
  `reputation_factor` int(10) DEFAULT '0',
  `item_uid` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_attach`
--

CREATE TABLE IF NOT EXISTS `aws_attach` (
  `id` int(11) unsigned NOT NULL,
  `file_name` varchar(255) DEFAULT NULL COMMENT '附件名称',
  `access_key` varchar(32) DEFAULT NULL COMMENT '批次 Key',
  `add_time` int(10) DEFAULT '0' COMMENT '上传时间',
  `file_location` varchar(255) DEFAULT NULL COMMENT '文件位置',
  `is_image` int(1) DEFAULT '0',
  `item_type` varchar(32) DEFAULT '0' COMMENT '关联类型',
  `item_id` bigint(20) DEFAULT '0' COMMENT '关联 ID',
  `wait_approval` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_category`
--

CREATE TABLE IF NOT EXISTS `aws_category` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT '0',
  `sort` smallint(6) DEFAULT '0',
  `url_token` varchar(32) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_category`
--

INSERT INTO `aws_category` (`id`, `title`, `type`, `icon`, `parent_id`, `sort`, `url_token`) VALUES
(1, '新生宝典', 'question', NULL, 0, 0, '1'),
(2, '牧院社团', 'question', NULL, 0, 0, NULL),
(3, '闲聊聚集地', 'question', NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `aws_draft`
--

CREATE TABLE IF NOT EXISTS `aws_draft` (
  `id` int(11) unsigned NOT NULL,
  `uid` int(11) DEFAULT '0',
  `type` varchar(16) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `data` text,
  `time` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_edm_task`
--

CREATE TABLE IF NOT EXISTS `aws_edm_task` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `subject` varchar(255) NOT NULL,
  `from_name` varchar(255) NOT NULL,
  `time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_edm_taskdata`
--

CREATE TABLE IF NOT EXISTS `aws_edm_taskdata` (
  `id` int(11) NOT NULL,
  `taskid` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sent_time` int(10) NOT NULL,
  `view_time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_edm_unsubscription`
--

CREATE TABLE IF NOT EXISTS `aws_edm_unsubscription` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_edm_userdata`
--

CREATE TABLE IF NOT EXISTS `aws_edm_userdata` (
  `id` int(11) NOT NULL,
  `usergroup` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_edm_usergroup`
--

CREATE TABLE IF NOT EXISTS `aws_edm_usergroup` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_education_experience`
--

CREATE TABLE IF NOT EXISTS `aws_education_experience` (
  `education_id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `education_years` int(11) DEFAULT NULL COMMENT '入学年份',
  `school_name` varchar(64) DEFAULT NULL COMMENT '学校名',
  `school_type` tinyint(4) DEFAULT NULL COMMENT '学校类别',
  `departments` varchar(64) DEFAULT NULL COMMENT '院系',
  `add_time` int(10) DEFAULT NULL COMMENT '记录添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='教育经历';

-- --------------------------------------------------------

--
-- 表的结构 `aws_favorite`
--

CREATE TABLE IF NOT EXISTS `aws_favorite` (
  `id` int(11) unsigned NOT NULL,
  `uid` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_favorite_tag`
--

CREATE TABLE IF NOT EXISTS `aws_favorite_tag` (
  `id` int(11) unsigned NOT NULL,
  `uid` int(11) DEFAULT '0',
  `title` varchar(128) DEFAULT NULL,
  `item_id` int(11) DEFAULT '0',
  `type` varchar(16) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_feature`
--

CREATE TABLE IF NOT EXISTS `aws_feature` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL COMMENT '专题标题',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `icon` varchar(255) DEFAULT NULL COMMENT '专题图标',
  `topic_count` int(11) NOT NULL DEFAULT '0' COMMENT '话题计数',
  `css` text COMMENT '自定义CSS',
  `url_token` varchar(32) DEFAULT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_feature_topic`
--

CREATE TABLE IF NOT EXISTS `aws_feature_topic` (
  `id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL DEFAULT '0' COMMENT '专题ID',
  `topic_id` int(11) NOT NULL DEFAULT '0' COMMENT '话题ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_geo_location`
--

CREATE TABLE IF NOT EXISTS `aws_geo_location` (
  `id` int(10) NOT NULL,
  `item_type` varchar(32) NOT NULL,
  `item_id` int(10) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL,
  `add_time` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_help_chapter`
--

CREATE TABLE IF NOT EXISTS `aws_help_chapter` (
  `id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `url_token` varchar(32) DEFAULT NULL,
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='帮助中心';

-- --------------------------------------------------------

--
-- 表的结构 `aws_inbox`
--

CREATE TABLE IF NOT EXISTS `aws_inbox` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL COMMENT '发送者 ID',
  `dialog_id` int(11) DEFAULT NULL COMMENT '对话id',
  `message` text COMMENT '内容',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `sender_remove` tinyint(1) DEFAULT '0',
  `recipient_remove` tinyint(1) DEFAULT '0',
  `receipt` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_inbox_dialog`
--

CREATE TABLE IF NOT EXISTS `aws_inbox_dialog` (
  `id` int(11) NOT NULL COMMENT '对话ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '发送者UID',
  `sender_unread` int(11) DEFAULT NULL COMMENT '发送者未读',
  `recipient_uid` int(11) DEFAULT NULL COMMENT '接收者UID',
  `recipient_unread` int(11) DEFAULT NULL COMMENT '接收者未读',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL COMMENT '最后更新时间',
  `sender_count` int(11) DEFAULT NULL COMMENT '发送者显示对话条数',
  `recipient_count` int(11) DEFAULT NULL COMMENT '接收者显示对话条数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_integral_log`
--

CREATE TABLE IF NOT EXISTS `aws_integral_log` (
  `id` int(11) unsigned NOT NULL,
  `uid` int(11) DEFAULT '0',
  `action` varchar(16) DEFAULT NULL,
  `integral` int(11) DEFAULT NULL,
  `note` varchar(128) DEFAULT NULL,
  `balance` int(11) DEFAULT '0',
  `item_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_integral_log`
--

INSERT INTO `aws_integral_log` (`id`, `uid`, `action`, `integral`, `note`, `balance`, `item_id`, `time`) VALUES
(1, 1, 'REGISTER', 2000, '初始资本', 2000, 0, 1486474930),
(2, 1, 'UPLOAD_AVATAR', 20, '上传头像', 2020, 0, 1486474959);

-- --------------------------------------------------------

--
-- 表的结构 `aws_invitation`
--

CREATE TABLE IF NOT EXISTS `aws_invitation` (
  `invitation_id` int(10) unsigned NOT NULL COMMENT '激活ID',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `invitation_code` varchar(32) DEFAULT NULL COMMENT '激活码',
  `invitation_email` varchar(255) DEFAULT NULL COMMENT '激活email',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `add_ip` bigint(12) DEFAULT NULL COMMENT '添加IP',
  `active_expire` tinyint(1) DEFAULT '0' COMMENT '激活过期',
  `active_time` int(10) DEFAULT NULL COMMENT '激活时间',
  `active_ip` bigint(12) DEFAULT NULL COMMENT '激活IP',
  `active_status` tinyint(4) DEFAULT '0' COMMENT '1已使用0未使用-1已删除',
  `active_uid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_jobs`
--

CREATE TABLE IF NOT EXISTS `aws_jobs` (
  `id` int(11) NOT NULL,
  `job_name` varchar(64) DEFAULT NULL COMMENT '职位名'
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_jobs`
--

INSERT INTO `aws_jobs` (`id`, `job_name`) VALUES
(1, '销售'),
(2, '市场/市场拓展/公关'),
(3, '商务/采购/贸易'),
(4, '计算机软、硬件/互联网/IT'),
(5, '电子/半导体/仪表仪器'),
(6, '通信技术'),
(7, '客户服务/技术支持'),
(8, '行政/后勤'),
(9, '人力资源'),
(10, '高级管理'),
(11, '生产/加工/制造'),
(12, '质控/安检'),
(13, '工程机械'),
(14, '技工'),
(15, '财会/审计/统计'),
(16, '金融/银行/保险/证券/投资'),
(17, '建筑/房地产/装修/物业'),
(18, '交通/仓储/物流'),
(19, '普通劳动力/家政服务'),
(20, '零售业'),
(21, '教育/培训'),
(22, '咨询/顾问'),
(23, '学术/科研'),
(24, '法律'),
(25, '美术/设计/创意'),
(26, '编辑/文案/传媒/影视/新闻'),
(27, '酒店/餐饮/旅游/娱乐'),
(28, '化工'),
(29, '能源/矿产/地质勘查'),
(30, '医疗/护理/保健/美容'),
(31, '生物/制药/医疗器械'),
(32, '翻译（口译与笔译）'),
(33, '公务员'),
(34, '环境科学/环保'),
(35, '农/林/牧/渔业'),
(36, '兼职/临时/培训生/储备干部'),
(37, '在校学生'),
(38, '其他');

-- --------------------------------------------------------

--
-- 表的结构 `aws_mail_queue`
--

CREATE TABLE IF NOT EXISTS `aws_mail_queue` (
  `id` int(11) NOT NULL,
  `send_to` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `is_error` tinyint(1) NOT NULL DEFAULT '0',
  `error_message` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_nav_menu`
--

CREATE TABLE IF NOT EXISTS `aws_nav_menu` (
  `id` int(11) unsigned NOT NULL,
  `title` varchar(128) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(16) DEFAULT NULL,
  `type_id` int(11) DEFAULT '0',
  `link` varchar(255) DEFAULT NULL COMMENT '链接',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `sort` smallint(6) DEFAULT '0' COMMENT '排序'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_nav_menu`
--

INSERT INTO `aws_nav_menu` (`id`, `title`, `description`, `type`, `type_id`, `link`, `icon`, `sort`) VALUES
(2, '新生宝典', '对于新生来说，这不是一本假宝典', 'custom', 0, 'http://', '2.jpg', 1),
(4, '闲聊聚集地', '祝您鸡年大吉吧', 'custom', 0, 'http://', '4.jpg', 3),
(5, '牧院社团', '河南牧业经济学院社团及俱乐部', 'custom', 0, 'http://', '5.jpg', 2);

-- --------------------------------------------------------

--
-- 表的结构 `aws_notification`
--

CREATE TABLE IF NOT EXISTS `aws_notification` (
  `notification_id` int(11) NOT NULL COMMENT '自增ID',
  `sender_uid` int(11) DEFAULT NULL COMMENT '发送者ID',
  `recipient_uid` int(11) DEFAULT '0' COMMENT '接收者ID',
  `action_type` int(4) DEFAULT NULL COMMENT '操作类型',
  `model_type` smallint(11) NOT NULL DEFAULT '0',
  `source_id` varchar(16) NOT NULL DEFAULT '0' COMMENT '关联 ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `read_flag` tinyint(1) DEFAULT '0' COMMENT '阅读状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统通知';

-- --------------------------------------------------------

--
-- 表的结构 `aws_notification_data`
--

CREATE TABLE IF NOT EXISTS `aws_notification_data` (
  `notification_id` int(11) unsigned NOT NULL,
  `data` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统通知数据表';

-- --------------------------------------------------------

--
-- 表的结构 `aws_pages`
--

CREATE TABLE IF NOT EXISTS `aws_pages` (
  `id` int(10) NOT NULL,
  `url_token` varchar(32) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `contents` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_posts_index`
--

CREATE TABLE IF NOT EXISTS `aws_posts_index` (
  `id` int(10) NOT NULL,
  `post_id` int(10) NOT NULL,
  `post_type` varchar(16) NOT NULL DEFAULT '',
  `add_time` int(10) NOT NULL,
  `update_time` int(10) DEFAULT '0',
  `category_id` int(10) DEFAULT '0',
  `is_recommend` tinyint(1) DEFAULT '0',
  `view_count` int(10) DEFAULT '0',
  `anonymous` tinyint(1) DEFAULT '0',
  `popular_value` int(10) DEFAULT '0',
  `uid` int(10) NOT NULL,
  `lock` tinyint(1) DEFAULT '0',
  `agree_count` int(10) DEFAULT '0',
  `answer_count` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_question`
--

CREATE TABLE IF NOT EXISTS `aws_question` (
  `question_id` int(11) NOT NULL,
  `question_content` varchar(255) NOT NULL DEFAULT '' COMMENT '问题内容',
  `question_detail` text COMMENT '问题说明',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL,
  `published_uid` int(11) DEFAULT NULL COMMENT '发布用户UID',
  `answer_count` int(11) NOT NULL DEFAULT '0' COMMENT '回答计数',
  `answer_users` int(11) NOT NULL DEFAULT '0' COMMENT '回答人数',
  `view_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览次数',
  `focus_count` int(11) NOT NULL DEFAULT '0' COMMENT '关注数',
  `comment_count` int(11) NOT NULL DEFAULT '0' COMMENT '评论数',
  `action_history_id` int(11) NOT NULL DEFAULT '0' COMMENT '动作的记录表的关连id',
  `category_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类 ID',
  `agree_count` int(11) NOT NULL DEFAULT '0' COMMENT '回复赞同数总和',
  `against_count` int(11) NOT NULL DEFAULT '0' COMMENT '回复反对数总和',
  `best_answer` int(11) NOT NULL DEFAULT '0' COMMENT '最佳回复 ID',
  `has_attach` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否存在附件',
  `unverified_modify` text,
  `unverified_modify_count` int(10) NOT NULL DEFAULT '0',
  `ip` bigint(11) DEFAULT NULL,
  `last_answer` int(11) NOT NULL DEFAULT '0' COMMENT '最后回答 ID',
  `popular_value` double NOT NULL DEFAULT '0',
  `popular_value_update` int(10) NOT NULL DEFAULT '0',
  `lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否锁定',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0',
  `thanks_count` int(10) NOT NULL DEFAULT '0',
  `question_content_fulltext` text,
  `is_recommend` tinyint(1) NOT NULL DEFAULT '0',
  `weibo_msg_id` bigint(20) DEFAULT NULL,
  `received_email_id` int(10) DEFAULT NULL,
  `chapter_id` int(10) unsigned DEFAULT NULL,
  `sort` tinyint(2) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='问题列表';

-- --------------------------------------------------------

--
-- 表的结构 `aws_question_comments`
--

CREATE TABLE IF NOT EXISTS `aws_question_comments` (
  `id` int(11) unsigned NOT NULL,
  `question_id` int(11) DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `message` text,
  `time` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_question_focus`
--

CREATE TABLE IF NOT EXISTS `aws_question_focus` (
  `focus_id` int(11) NOT NULL COMMENT '自增ID',
  `question_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='问题关注表';

-- --------------------------------------------------------

--
-- 表的结构 `aws_question_invite`
--

CREATE TABLE IF NOT EXISTS `aws_question_invite` (
  `question_invite_id` int(11) NOT NULL COMMENT '自增ID',
  `question_id` int(11) NOT NULL COMMENT '问题ID',
  `sender_uid` int(11) NOT NULL,
  `recipients_uid` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL COMMENT '受邀Email',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `available_time` int(10) DEFAULT '0' COMMENT '生效时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邀请问答';

-- --------------------------------------------------------

--
-- 表的结构 `aws_question_thanks`
--

CREATE TABLE IF NOT EXISTS `aws_question_thanks` (
  `id` int(11) unsigned NOT NULL,
  `uid` int(11) DEFAULT '0',
  `question_id` int(11) DEFAULT '0',
  `user_name` varchar(255) DEFAULT NULL,
  `time` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_question_uninterested`
--

CREATE TABLE IF NOT EXISTS `aws_question_uninterested` (
  `interested_id` int(11) NOT NULL COMMENT '自增ID',
  `question_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='问题不感兴趣表';

-- --------------------------------------------------------

--
-- 表的结构 `aws_received_email`
--

CREATE TABLE IF NOT EXISTS `aws_received_email` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `config_id` int(10) NOT NULL,
  `message_id` varchar(255) NOT NULL,
  `date` int(10) NOT NULL,
  `from` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `content` text,
  `question_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='已导入邮件列表';

-- --------------------------------------------------------

--
-- 表的结构 `aws_receiving_email_config`
--

CREATE TABLE IF NOT EXISTS `aws_receiving_email_config` (
  `id` int(10) NOT NULL,
  `protocol` varchar(10) NOT NULL,
  `server` varchar(255) NOT NULL,
  `ssl` tinyint(1) NOT NULL DEFAULT '0',
  `port` smallint(5) DEFAULT NULL,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `uid` int(10) NOT NULL,
  `access_key` varchar(32) NOT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件账号列表';

-- --------------------------------------------------------

--
-- 表的结构 `aws_redirect`
--

CREATE TABLE IF NOT EXISTS `aws_redirect` (
  `id` int(11) unsigned NOT NULL,
  `item_id` int(11) DEFAULT '0',
  `target_id` int(11) DEFAULT '0',
  `time` int(10) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_related_links`
--

CREATE TABLE IF NOT EXISTS `aws_related_links` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `item_type` varchar(32) NOT NULL,
  `item_id` int(10) NOT NULL,
  `link` varchar(255) NOT NULL,
  `add_time` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_related_topic`
--

CREATE TABLE IF NOT EXISTS `aws_related_topic` (
  `id` int(11) unsigned NOT NULL,
  `topic_id` int(11) DEFAULT '0' COMMENT '话题 ID',
  `related_id` int(11) DEFAULT '0' COMMENT '相关话题 ID'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_report`
--

CREATE TABLE IF NOT EXISTS `aws_report` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT '0' COMMENT '举报用户id',
  `type` varchar(50) DEFAULT NULL COMMENT '类别',
  `target_id` int(11) DEFAULT '0' COMMENT 'ID',
  `reason` varchar(255) DEFAULT NULL COMMENT '举报理由',
  `url` varchar(255) DEFAULT NULL,
  `add_time` int(11) DEFAULT '0' COMMENT '举报时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否处理'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_reputation_category`
--

CREATE TABLE IF NOT EXISTS `aws_reputation_category` (
  `auto_id` int(10) unsigned NOT NULL,
  `uid` int(10) DEFAULT '0',
  `category_id` smallint(4) DEFAULT '0',
  `update_time` int(10) DEFAULT '0',
  `reputation` int(10) DEFAULT '0',
  `thanks_count` int(10) DEFAULT '0',
  `agree_count` int(10) DEFAULT '0',
  `question_count` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_reputation_topic`
--

CREATE TABLE IF NOT EXISTS `aws_reputation_topic` (
  `auto_id` int(11) unsigned NOT NULL,
  `uid` int(11) DEFAULT '0',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题ID',
  `topic_count` int(10) DEFAULT '0' COMMENT '威望问题话题计数',
  `update_time` int(10) DEFAULT NULL COMMENT '更新时间',
  `agree_count` int(10) DEFAULT '0' COMMENT '赞成',
  `thanks_count` int(10) DEFAULT '0' COMMENT '感谢',
  `reputation` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_school`
--

CREATE TABLE IF NOT EXISTS `aws_school` (
  `school_id` int(11) NOT NULL COMMENT '自增ID',
  `school_type` tinyint(4) DEFAULT NULL COMMENT '学校类型ID',
  `school_code` int(11) DEFAULT NULL COMMENT '学校编码',
  `school_name` varchar(64) DEFAULT NULL COMMENT '学校名称',
  `area_code` int(11) DEFAULT NULL COMMENT '地区代码'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='学校';

-- --------------------------------------------------------

--
-- 表的结构 `aws_search_cache`
--

CREATE TABLE IF NOT EXISTS `aws_search_cache` (
  `id` int(10) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `data` mediumtext NOT NULL,
  `time` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_sessions`
--

CREATE TABLE IF NOT EXISTS `aws_sessions` (
  `id` varchar(32) NOT NULL,
  `modified` int(10) NOT NULL,
  `data` text NOT NULL,
  `lifetime` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_sessions`
--

INSERT INTO `aws_sessions` (`id`, `modified`, `data`, `lifetime`) VALUES
('coftp3eefhd3hpgd5u8pa0t5b2', 1486475722, 'kgw__Anwsion|a:3:{s:11:"client_info";a:3:{s:12:"__CLIENT_UID";i:1;s:18:"__CLIENT_USER_NAME";s:9:"王小明";s:17:"__CLIENT_PASSWORD";s:32:"2efbc80e24a16c2a1e9c52734198a649";}s:10:"permission";a:15:{s:16:"is_administortar";s:1:"1";s:12:"is_moderator";s:1:"1";s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"edit_question";s:1:"1";s:10:"edit_topic";s:1:"1";s:12:"manage_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:12:"edit_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";s:15:"publish_comment";s:1:"1";}s:11:"admin_login";s:329:"cast-256|50D5DF903C7C7F462D26D949E353144728AADB4C0716CAE2BD78C0886F0F6142ACD24C13594F1CB3EB85CDD1C05D0FA9063DA3C6F2F56A9E9F9CB7B25BDA9826A31D419AF6D85591E42D2B725D98065E368B2337C639E9A27E5683D178808FD5CA5CE3A16D1EE2B42CFDAAAB14C9B50B0C3CE25390EEC6983769CD336A19DAEBD856443FC5FEF4A2135EE6055ED580480B6779E0F7CB54C37E09360F25E07D20";}kgw__Captcha|a:1:{s:4:"word";s:4:"xiwy";}', 1440);

-- --------------------------------------------------------

--
-- 表的结构 `aws_system_setting`
--

CREATE TABLE IF NOT EXISTS `aws_system_setting` (
  `id` int(11) NOT NULL COMMENT 'id',
  `varname` varchar(255) NOT NULL COMMENT '字段名',
  `value` text COMMENT '变量值'
) ENGINE=MyISAM AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COMMENT='系统设置';

--
-- 转存表中的数据 `aws_system_setting`
--

INSERT INTO `aws_system_setting` (`id`, `varname`, `value`) VALUES
(1, 'db_engine', 's:6:"MyISAM";'),
(2, 'site_name', 's:8:"WeCenter";'),
(3, 'description', 's:30:"WeCenter 社交化知识社区";'),
(4, 'keywords', 's:47:"WeCenter,知识社区,社交社区,问答社区";'),
(5, 'sensitive_words', 's:0:"";'),
(6, 'def_focus_uids', 's:1:"1";'),
(7, 'answer_edit_time', 's:2:"30";'),
(8, 'cache_level_high', 's:2:"60";'),
(9, 'cache_level_normal', 's:3:"600";'),
(10, 'cache_level_low', 's:4:"1800";'),
(11, 'unread_flush_interval', 's:3:"100";'),
(12, 'newer_invitation_num', 's:1:"5";'),
(13, 'index_per_page', 's:2:"20";'),
(14, 'from_email', 's:16:"240313001@qq.com";'),
(15, 'img_url', 's:0:"";'),
(16, 'upload_url', 's:29:"http://www.myuahe.com/uploads";'),
(17, 'upload_dir', 's:36:"/data/wwwroot/www.myuahe.com/uploads";'),
(18, 'ui_style', 's:7:"default";'),
(19, 'uninterested_fold', 's:1:"5";'),
(20, 'sina_akey', NULL),
(21, 'sina_skey', NULL),
(22, 'sina_weibo_enabled', 's:1:"N";'),
(23, 'answer_unique', 's:1:"N";'),
(24, 'notifications_per_page', 's:2:"10";'),
(25, 'contents_per_page', 's:2:"10";'),
(26, 'hot_question_period', 's:1:"7";'),
(27, 'category_display_mode', 's:4:"icon";'),
(28, 'recommend_users_number', 's:1:"6";'),
(29, 'ucenter_enabled', 's:1:"N";'),
(30, 'register_valid_type', 's:5:"email";'),
(31, 'best_answer_day', 's:2:"30";'),
(32, 'answer_self_question', 's:1:"Y";'),
(33, 'censoruser', 's:5:"admin";'),
(34, 'best_answer_min_count', 's:1:"3";'),
(35, 'reputation_function', 's:78:"[最佳答案]*3+[赞同]*1-[反对]*1+[发起者赞同]*2-[发起者反对]*1";'),
(36, 'db_version', 's:8:"20160523";'),
(37, 'statistic_code', 's:0:"";'),
(38, 'upload_enable', 's:1:"Y";'),
(39, 'answer_length_lower', 's:1:"2";'),
(40, 'quick_publish', 's:1:"Y";'),
(41, 'register_type', 's:4:"open";'),
(42, 'question_title_limit', 's:3:"100";'),
(43, 'register_seccode', 's:1:"Y";'),
(44, 'admin_login_seccode', 's:1:"Y";'),
(45, 'comment_limit', 's:1:"0";'),
(46, 'backup_dir', ''),
(47, 'best_answer_reput', 's:2:"20";'),
(48, 'publisher_reputation_factor', 's:2:"10";'),
(49, 'request_route_custom', 's:0:"";'),
(50, 'upload_size_limit', 's:3:"512";'),
(51, 'upload_avatar_size_limit', 's:3:"512";'),
(52, 'topic_title_limit', 's:2:"12";'),
(53, 'url_rewrite_enable', 's:1:"N";'),
(54, 'best_agree_min_count', 's:1:"3";'),
(55, 'site_close', 's:1:"N";'),
(56, 'close_notice', 's:39:"站点已关闭，管理员请登录。";'),
(57, 'qq_login_enabled', 's:1:"N";'),
(58, 'qq_login_app_id', ''),
(59, 'qq_login_app_key', ''),
(60, 'integral_system_enabled', 's:1:"N";'),
(61, 'integral_system_config_register', 's:4:"2000";'),
(62, 'integral_system_config_profile', 's:3:"100";'),
(63, 'integral_system_config_invite', 's:3:"200";'),
(64, 'integral_system_config_best_answer', 's:3:"200";'),
(65, 'integral_system_config_answer_fold', 's:3:"-50";'),
(66, 'integral_system_config_new_question', 's:3:"-20";'),
(67, 'integral_system_config_new_answer', 's:2:"-5";'),
(68, 'integral_system_config_thanks', 's:3:"-10";'),
(69, 'integral_system_config_invite_answer', 's:3:"-10";'),
(70, 'username_rule', 's:1:"1";'),
(71, 'username_length_min', 's:1:"2";'),
(72, 'username_length_max', 's:2:"14";'),
(73, 'category_enable', 's:1:"Y";'),
(74, 'integral_unit', 's:6:"金币";'),
(75, 'nav_menu_show_child', 's:1:"N";'),
(76, 'anonymous_enable', 's:1:"Y";'),
(77, 'report_reason', 's:50:"广告/SPAM\n违规内容\n文不对题\n重复发问";'),
(78, 'allowed_upload_types', 's:41:"jpg,jpeg,png,gif,zip,doc,docx,rar,pdf,psd";'),
(79, 'site_announce', 's:0:"";'),
(80, 'icp_beian', 's:0:"";'),
(81, 'report_message_uid', 's:1:"1";'),
(82, 'today_topics', 's:0:"";'),
(83, 'welcome_recommend_users', 's:0:"";'),
(84, 'welcome_message_pm', 's:180:"尊敬的{username}，您已经注册成为{sitename}的会员，请您在发表言论时，遵守当地法律法规。\n如果您有什么疑问可以联系管理员。\n\n{sitename}";'),
(85, 'time_style', 's:1:"Y";'),
(86, 'reputation_log_factor', 's:1:"3";'),
(87, 'advanced_editor_enable', 's:1:"Y";'),
(88, 'auto_question_lock_day', 's:1:"0";'),
(89, 'default_timezone', 's:9:"Etc/GMT-8";'),
(90, 'reader_questions_last_days', 's:2:"30";'),
(91, 'reader_questions_agree_count', 's:2:"10"'),
(92, 'weixin_mp_token', 's:0:"";'),
(93, 'new_user_email_setting', 'a:2:{s:9:"FOLLOW_ME";s:1:"N";s:10:"NEW_ANSWER";s:1:"N";}'),
(94, 'new_user_notification_setting', 'a:0:{}'),
(95, 'user_action_history_fresh_upgrade', 's:1:"Y";'),
(96, 'cache_dir', 's:0:"";'),
(97, 'ucenter_charset', 's:5:"UTF-8";'),
(98, 'question_topics_limit', 's:2:"10";'),
(99, 'mail_config', 'a:7:{s:9:"transport";s:8:"sendmail";s:7:"charset";s:5:"UTF-8";s:6:"server";s:0:"";s:3:"ssl";s:1:"0";s:4:"port";s:0:"";s:8:"username";s:0:"";s:8:"password";s:0:"";}'),
(100, 'auto_create_social_topics', 's:1:"N";'),
(101, 'weixin_subscribe_message_key', 's:0:"";'),
(102, 'weixin_no_result_message_key', 's:0:"";'),
(103, 'weixin_mp_menu', 'a:0:{}'),
(104, 'new_question_force_add_topic', 's:1:"N";'),
(105, 'unfold_question_comments', 's:1:"N";'),
(106, 'report_diagnostics', 's:1:"Y";'),
(107, 'weixin_app_id', 's:0:"";'),
(108, 'weixin_app_secret', 's:0:"";'),
(109, 'weixin_account_role', 's:7:"base";'),
(110, 'weibo_msg_enabled', 's:1:"N";'),
(111, 'weibo_msg_published_user', 'a:0:"";'),
(112, 'admin_notifications', 'a:11:{s:15:"answer_approval";i:0;s:17:"question_approval";i:0;s:16:"article_approval";i:0;s:24:"article_comment_approval";i:0;s:23:"unverified_modify_count";i:0;s:11:"user_report";i:0;s:17:"register_approval";i:0;s:15:"verify_approval";i:0;s:12:"last_version";a:2:{s:7:"version";s:5:"3.1.9";s:9:"build_day";s:8:"20160523";}s:10:"sina_users";N;s:19:"receive_email_error";N;}'),
(113, 'slave_mail_config', 's:0:"";'),
(114, 'receiving_email_global_config', 'a:2:{s:7:"enabled";s:1:"N";s:12:"publish_user";N;}'),
(115, 'last_sent_valid_email_id', 'i:0;'),
(116, 'google_login_enabled', 's:1:"N";'),
(117, 'google_client_id', 's:0:"";'),
(118, 'google_client_secret', 's:0:"";'),
(119, 'facebook_login_enabled', 's:1:"N";'),
(120, 'facebook_app_id', 's:0:"";'),
(121, 'facebook_app_secret', 's:0:"";'),
(122, 'twitter_login_enabled', 's:1:"N";'),
(123, 'twitter_consumer_key', 's:0:"";'),
(124, 'twitter_consumer_secret', 's:0:"";'),
(125, 'weixin_encoding_aes_key', 's:0:"";'),
(126, 'integral_system_config_answer_change_source', 's:1:"Y";'),
(127, 'enable_help_center', 's:1:"N";'),
(128, 'ucenter_path', 's:0:"";'),
(129, 'register_agreement', 's:1626:"当您申请用户时，表示您已经同意遵守本规章。\r\n欢迎您加入本站点参与交流和讨论，本站点为社区，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：\r\n\r\n一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：\r\n　（一）煽动抗拒、破坏宪法和法律、行政法规实施的；\r\n　（二）煽动颠覆国家政权，推翻社会主义制度的；\r\n　（三）煽动分裂国家、破坏国家统一的；\r\n　（四）煽动民族仇恨、民族歧视，破坏民族团结的；\r\n　（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\r\n　（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\r\n　（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\r\n　（八）损害国家机关信誉的；\r\n　（九）其他违反宪法和法律行政法规的；\r\n　（十）进行商业广告行为的。\r\n\r\n二、互相尊重，对自己的言论和行为负责。\r\n三、禁止在申请用户时使用相关本站的词汇，或是带有侮辱、毁谤、造谣类的或是有其含义的各种语言进行注册用户，否则我们会将其删除。\r\n四、禁止以任何方式对本站进行各种破坏行为。\r\n五、如果您有违反国家相关法律法规的行为，本站概不负责，您的登录信息均被记录无疑，必要时，我们会向相关的国家管理部门提供此类信息。";');

-- --------------------------------------------------------

--
-- 表的结构 `aws_topic`
--

CREATE TABLE IF NOT EXISTS `aws_topic` (
  `topic_id` int(11) NOT NULL COMMENT '话题id',
  `topic_title` varchar(64) DEFAULT NULL COMMENT '话题标题',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `discuss_count` int(11) DEFAULT '0' COMMENT '讨论计数',
  `topic_description` text COMMENT '话题描述',
  `topic_pic` varchar(255) DEFAULT NULL COMMENT '话题图片',
  `topic_lock` tinyint(2) NOT NULL DEFAULT '0' COMMENT '话题是否锁定 1 锁定 0 未锁定',
  `focus_count` int(11) DEFAULT '0' COMMENT '关注计数',
  `user_related` tinyint(1) DEFAULT '0' COMMENT '是否被用户关联',
  `url_token` varchar(32) DEFAULT NULL,
  `merged_id` int(11) DEFAULT '0',
  `seo_title` varchar(255) DEFAULT NULL,
  `parent_id` int(10) DEFAULT '0',
  `is_parent` tinyint(1) DEFAULT '0',
  `discuss_count_last_week` int(10) DEFAULT '0',
  `discuss_count_last_month` int(10) DEFAULT '0',
  `discuss_count_update` int(10) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='话题';

--
-- 转存表中的数据 `aws_topic`
--

INSERT INTO `aws_topic` (`topic_id`, `topic_title`, `add_time`, `discuss_count`, `topic_description`, `topic_pic`, `topic_lock`, `focus_count`, `user_related`, `url_token`, `merged_id`, `seo_title`, `parent_id`, `is_parent`, `discuss_count_last_week`, `discuss_count_last_month`, `discuss_count_update`) VALUES
(1, '默认话题', NULL, 0, '默认话题', NULL, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `aws_topic_focus`
--

CREATE TABLE IF NOT EXISTS `aws_topic_focus` (
  `focus_id` int(11) NOT NULL COMMENT '自增ID',
  `topic_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='话题关注表';

-- --------------------------------------------------------

--
-- 表的结构 `aws_topic_merge`
--

CREATE TABLE IF NOT EXISTS `aws_topic_merge` (
  `id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL DEFAULT '0',
  `target_id` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) DEFAULT '0',
  `time` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_topic_relation`
--

CREATE TABLE IF NOT EXISTS `aws_topic_relation` (
  `id` int(11) NOT NULL COMMENT '自增 ID',
  `topic_id` int(11) DEFAULT '0' COMMENT '话题id',
  `item_id` int(11) DEFAULT '0',
  `add_time` int(10) DEFAULT '0' COMMENT '添加时间',
  `uid` int(11) DEFAULT '0' COMMENT '用户ID',
  `type` varchar(16) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_users`
--

CREATE TABLE IF NOT EXISTS `aws_users` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户的 UID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `email` varchar(255) DEFAULT NULL COMMENT 'EMAIL',
  `mobile` varchar(16) DEFAULT NULL COMMENT '用户手机',
  `password` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `salt` varchar(16) DEFAULT NULL COMMENT '用户附加混淆码',
  `avatar_file` varchar(128) DEFAULT NULL COMMENT '头像文件',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别',
  `birthday` int(10) DEFAULT NULL COMMENT '生日',
  `province` varchar(64) DEFAULT NULL COMMENT '省',
  `city` varchar(64) DEFAULT NULL COMMENT '市',
  `job_id` int(10) DEFAULT '0' COMMENT '职业ID',
  `reg_time` int(10) DEFAULT NULL COMMENT '注册时间',
  `reg_ip` bigint(12) DEFAULT NULL COMMENT '注册IP',
  `last_login` int(10) DEFAULT '0' COMMENT '最后登录时间',
  `last_ip` bigint(12) DEFAULT NULL COMMENT '最后登录 IP',
  `online_time` int(10) DEFAULT '0' COMMENT '在线时间',
  `last_active` int(10) DEFAULT NULL COMMENT '最后活跃时间',
  `notification_unread` int(11) NOT NULL DEFAULT '0' COMMENT '未读系统通知',
  `inbox_unread` int(11) NOT NULL DEFAULT '0' COMMENT '未读短信息',
  `inbox_recv` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-所有人可以发给我,1-我关注的人',
  `fans_count` int(10) NOT NULL DEFAULT '0' COMMENT '粉丝数',
  `friend_count` int(10) NOT NULL DEFAULT '0' COMMENT '观众数',
  `invite_count` int(10) NOT NULL DEFAULT '0' COMMENT '邀请我回答数量',
  `article_count` int(10) NOT NULL DEFAULT '0' COMMENT '文章数量',
  `question_count` int(10) NOT NULL DEFAULT '0' COMMENT '问题数量',
  `answer_count` int(10) NOT NULL DEFAULT '0' COMMENT '回答数量',
  `topic_focus_count` int(10) NOT NULL DEFAULT '0' COMMENT '关注话题数量',
  `invitation_available` int(10) NOT NULL DEFAULT '0' COMMENT '邀请数量',
  `group_id` int(10) DEFAULT '0' COMMENT '用户组',
  `reputation_group` int(10) DEFAULT '0' COMMENT '威望对应组',
  `forbidden` tinyint(1) DEFAULT '0' COMMENT '是否禁止用户',
  `valid_email` tinyint(1) DEFAULT '0' COMMENT '邮箱验证',
  `is_first_login` tinyint(1) DEFAULT '1' COMMENT '首次登录标记',
  `agree_count` int(10) DEFAULT '0' COMMENT '赞同数量',
  `thanks_count` int(10) DEFAULT '0' COMMENT '感谢数量',
  `views_count` int(10) DEFAULT '0' COMMENT '个人主页查看数量',
  `reputation` int(10) DEFAULT '0' COMMENT '威望',
  `reputation_update_time` int(10) DEFAULT '0' COMMENT '威望更新',
  `weibo_visit` tinyint(1) DEFAULT '1' COMMENT '微博允许访问',
  `integral` int(10) DEFAULT '0',
  `draft_count` int(10) DEFAULT NULL,
  `common_email` varchar(255) DEFAULT NULL COMMENT '常用邮箱',
  `url_token` varchar(32) DEFAULT NULL COMMENT '个性网址',
  `url_token_update` int(10) DEFAULT '0',
  `verified` varchar(32) DEFAULT NULL,
  `default_timezone` varchar(32) DEFAULT NULL,
  `email_settings` varchar(255) DEFAULT '',
  `weixin_settings` varchar(255) DEFAULT '',
  `recent_topics` text
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_users`
--

INSERT INTO `aws_users` (`uid`, `user_name`, `email`, `mobile`, `password`, `salt`, `avatar_file`, `sex`, `birthday`, `province`, `city`, `job_id`, `reg_time`, `reg_ip`, `last_login`, `last_ip`, `online_time`, `last_active`, `notification_unread`, `inbox_unread`, `inbox_recv`, `fans_count`, `friend_count`, `invite_count`, `article_count`, `question_count`, `answer_count`, `topic_focus_count`, `invitation_available`, `group_id`, `reputation_group`, `forbidden`, `valid_email`, `is_first_login`, `agree_count`, `thanks_count`, `views_count`, `reputation`, `reputation_update_time`, `weibo_visit`, `integral`, `draft_count`, `common_email`, `url_token`, `url_token_update`, `verified`, `default_timezone`, `email_settings`, `weixin_settings`, `recent_topics`) VALUES
(1, '王小明', '240313001@qq.com', '', '2efbc80e24a16c2a1e9c52734198a649', 'miat', '000/00/00/01_avatar_min.jpg', 3, NULL, '', '', 0, 1486474930, 3659362393, 1486474947, 3659362393, 792, 1486475722, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 5, 0, 1, 0, 0, 0, 0, 0, 1486475295, 1, 2020, NULL, NULL, NULL, 0, NULL, '', '', '', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `aws_users_attrib`
--

CREATE TABLE IF NOT EXISTS `aws_users_attrib` (
  `id` int(11) NOT NULL COMMENT '自增id',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `introduction` varchar(255) DEFAULT NULL COMMENT '个人简介',
  `signature` varchar(255) DEFAULT NULL COMMENT '个人签名',
  `qq` bigint(15) DEFAULT NULL,
  `homepage` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户附加属性表';

--
-- 转存表中的数据 `aws_users_attrib`
--

INSERT INTO `aws_users_attrib` (`id`, `uid`, `introduction`, `signature`, `qq`, `homepage`) VALUES
(1, 1, NULL, '', 0, '');

-- --------------------------------------------------------

--
-- 表的结构 `aws_users_facebook`
--

CREATE TABLE IF NOT EXISTS `aws_users_facebook` (
  `id` bigint(20) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `timezone` tinyint(3) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `expires_time` int(10) unsigned NOT NULL DEFAULT '0',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_users_google`
--

CREATE TABLE IF NOT EXISTS `aws_users_google` (
  `id` varchar(64) NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `locale` varchar(16) DEFAULT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `access_token` varchar(128) DEFAULT NULL,
  `refresh_token` varchar(128) DEFAULT NULL,
  `expires_time` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_users_group`
--

CREATE TABLE IF NOT EXISTS `aws_users_group` (
  `group_id` int(11) NOT NULL,
  `type` tinyint(3) DEFAULT '0' COMMENT '0-会员组 1-系统组',
  `custom` tinyint(1) DEFAULT '0' COMMENT '是否自定义',
  `group_name` varchar(50) NOT NULL,
  `reputation_lower` int(11) DEFAULT '0',
  `reputation_higer` int(11) DEFAULT '0',
  `reputation_factor` float DEFAULT '0' COMMENT '威望系数',
  `permission` text COMMENT '权限设置'
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='用户组';

--
-- 转存表中的数据 `aws_users_group`
--

INSERT INTO `aws_users_group` (`group_id`, `type`, `custom`, `group_name`, `reputation_lower`, `reputation_higer`, `reputation_factor`, `permission`) VALUES
(1, 0, 0, '超级管理员', 0, 0, 5, 'a:15:{s:16:"is_administortar";s:1:"1";s:12:"is_moderator";s:1:"1";s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"edit_question";s:1:"1";s:10:"edit_topic";s:1:"1";s:12:"manage_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:12:"edit_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";s:15:"publish_comment";s:1:"1";}'),
(2, 0, 0, '前台管理员', 0, 0, 4, 'a:14:{s:12:"is_moderator";s:1:"1";s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"edit_question";s:1:"1";s:10:"edit_topic";s:1:"1";s:12:"manage_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:12:"edit_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";s:15:"publish_comment";s:1:"1";}'),
(3, 0, 0, '未验证会员', 0, 0, 0, 'a:5:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:11:"human_valid";s:1:"1";s:19:"question_valid_hour";s:1:"2";s:17:"answer_valid_hour";s:1:"2";}'),
(4, 0, 0, '普通会员', 0, 0, 0, 'a:3:{s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:19:"question_valid_hour";s:2:"10";s:17:"answer_valid_hour";s:2:"10";}'),
(5, 1, 0, '注册会员', 0, 100, 1, 'a:6:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:11:"human_valid";s:1:"1";s:19:"question_valid_hour";s:1:"5";s:17:"answer_valid_hour";s:1:"5";s:15:"publish_comment";s:1:"1";}'),
(6, 1, 0, '初级会员', 100, 200, 1, 'a:8:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:19:"question_valid_hour";s:1:"5";s:17:"answer_valid_hour";s:1:"5";s:15:"publish_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";}'),
(7, 1, 0, '中级会员', 200, 500, 1, 'a:9:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:10:"edit_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:15:"publish_comment";s:1:"1";}'),
(8, 1, 0, '高级会员', 500, 1000, 1, 'a:11:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"edit_question";s:1:"1";s:10:"edit_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";s:15:"publish_comment";s:1:"1";}'),
(9, 1, 0, '核心会员', 1000, 999999, 1, 'a:12:{s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"edit_question";s:1:"1";s:10:"edit_topic";s:1:"1";s:12:"manage_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";s:15:"publish_comment";s:1:"1";}'),
(99, 0, 0, '游客', 0, 0, 0, 'a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}');

-- --------------------------------------------------------

--
-- 表的结构 `aws_users_notification_setting`
--

CREATE TABLE IF NOT EXISTS `aws_users_notification_setting` (
  `notice_setting_id` int(11) NOT NULL COMMENT '自增id',
  `uid` int(11) NOT NULL,
  `data` text COMMENT '设置数据'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='通知设定';

-- --------------------------------------------------------

--
-- 表的结构 `aws_users_online`
--

CREATE TABLE IF NOT EXISTS `aws_users_online` (
  `uid` int(11) NOT NULL COMMENT '用户 ID',
  `last_active` int(11) DEFAULT '0' COMMENT '上次活动时间',
  `ip` bigint(12) DEFAULT '0' COMMENT '客户端ip',
  `active_url` varchar(255) DEFAULT NULL COMMENT '停留页面',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户客户端信息'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='在线用户列表';

--
-- 转存表中的数据 `aws_users_online`
--

INSERT INTO `aws_users_online` (`uid`, `last_active`, `ip`, `active_url`, `user_agent`) VALUES
(1, 1486475722, 3659362393, 'http://www.myuahe.com/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36');

-- --------------------------------------------------------

--
-- 表的结构 `aws_users_qq`
--

CREATE TABLE IF NOT EXISTS `aws_users_qq` (
  `id` bigint(11) unsigned NOT NULL,
  `uid` int(11) NOT NULL COMMENT '用户在本地的UID',
  `nickname` varchar(64) DEFAULT NULL,
  `openid` varchar(128) DEFAULT '',
  `gender` varchar(8) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `access_token` varchar(64) DEFAULT NULL,
  `refresh_token` varchar(64) DEFAULT NULL,
  `expires_time` int(10) DEFAULT NULL,
  `figureurl` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_users_sina`
--

CREATE TABLE IF NOT EXISTS `aws_users_sina` (
  `id` bigint(11) NOT NULL COMMENT '新浪用户 ID',
  `uid` int(11) NOT NULL COMMENT '用户在本地的UID',
  `name` varchar(64) DEFAULT NULL COMMENT '微博昵称',
  `location` varchar(255) DEFAULT NULL COMMENT '地址',
  `description` text COMMENT '个人描述',
  `url` varchar(255) DEFAULT NULL COMMENT '用户博客地址',
  `profile_image_url` varchar(255) DEFAULT NULL COMMENT 'Sina 自定义头像地址',
  `gender` varchar(8) DEFAULT NULL,
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `expires_time` int(10) DEFAULT '0' COMMENT '过期时间',
  `access_token` varchar(64) DEFAULT NULL,
  `last_msg_id` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_users_twitter`
--

CREATE TABLE IF NOT EXISTS `aws_users_twitter` (
  `id` bigint(20) unsigned NOT NULL,
  `uid` int(11) unsigned NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `screen_name` varchar(128) DEFAULT NULL,
  `location` varchar(64) DEFAULT NULL,
  `time_zone` varchar(64) DEFAULT NULL,
  `lang` varchar(16) DEFAULT NULL,
  `profile_image_url` varchar(255) DEFAULT NULL,
  `add_time` int(10) unsigned NOT NULL DEFAULT '0',
  `access_token` varchar(255) NOT NULL DEFAULT 'a:2:{s:11:"oauth_token";s:0:"";s:18:"oauth_token_secret";s:0:"";}'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_users_ucenter`
--

CREATE TABLE IF NOT EXISTS `aws_users_ucenter` (
  `id` int(11) unsigned NOT NULL,
  `uid` int(11) DEFAULT '0',
  `uc_uid` int(11) DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_users_weixin`
--

CREATE TABLE IF NOT EXISTS `aws_users_weixin` (
  `id` int(10) NOT NULL,
  `uid` int(10) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `expires_in` int(10) DEFAULT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL,
  `scope` varchar(64) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL,
  `nickname` varchar(64) DEFAULT NULL,
  `sex` tinyint(1) DEFAULT '0',
  `province` varchar(32) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `add_time` int(10) NOT NULL,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `location_update` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_user_action_history`
--

CREATE TABLE IF NOT EXISTS `aws_user_action_history` (
  `history_id` int(11) NOT NULL COMMENT '自增ID',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `associate_type` tinyint(1) DEFAULT NULL COMMENT '关联类型: 1 问题 2 回答 3 评论 4 话题',
  `associate_action` smallint(3) DEFAULT NULL COMMENT '操作类型',
  `associate_id` int(11) DEFAULT NULL COMMENT '关联ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间',
  `associate_attached` int(11) DEFAULT NULL,
  `anonymous` tinyint(1) DEFAULT '0' COMMENT '是否匿名',
  `fold_status` tinyint(1) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户操作记录';

-- --------------------------------------------------------

--
-- 表的结构 `aws_user_action_history_data`
--

CREATE TABLE IF NOT EXISTS `aws_user_action_history_data` (
  `history_id` int(11) unsigned NOT NULL,
  `associate_content` text,
  `associate_attached` text,
  `addon_data` text COMMENT '附加数据'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_user_action_history_fresh`
--

CREATE TABLE IF NOT EXISTS `aws_user_action_history_fresh` (
  `id` int(11) NOT NULL,
  `history_id` int(11) NOT NULL,
  `associate_id` int(11) NOT NULL,
  `associate_type` tinyint(1) NOT NULL,
  `associate_action` smallint(3) NOT NULL,
  `add_time` int(10) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_user_follow`
--

CREATE TABLE IF NOT EXISTS `aws_user_follow` (
  `follow_id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `fans_uid` int(11) DEFAULT NULL COMMENT '关注人的UID',
  `friend_uid` int(11) DEFAULT NULL COMMENT '被关注人的uid',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户关注表';

-- --------------------------------------------------------

--
-- 表的结构 `aws_verify_apply`
--

CREATE TABLE IF NOT EXISTS `aws_verify_apply` (
  `id` int(10) NOT NULL,
  `uid` int(11) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `attach` varchar(255) DEFAULT NULL,
  `time` int(10) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `data` text,
  `status` tinyint(1) DEFAULT '0',
  `type` varchar(16) DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_weibo_msg`
--

CREATE TABLE IF NOT EXISTS `aws_weibo_msg` (
  `id` bigint(20) NOT NULL,
  `created_at` int(10) NOT NULL,
  `msg_author_uid` bigint(20) NOT NULL,
  `text` varchar(255) NOT NULL,
  `access_key` varchar(32) NOT NULL,
  `has_attach` tinyint(1) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL,
  `weibo_uid` bigint(20) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `ticket_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新浪微博消息列表';

-- --------------------------------------------------------

--
-- 表的结构 `aws_weixin_accounts`
--

CREATE TABLE IF NOT EXISTS `aws_weixin_accounts` (
  `id` int(10) NOT NULL,
  `weixin_mp_token` varchar(255) NOT NULL,
  `weixin_account_role` varchar(20) DEFAULT 'base',
  `weixin_app_id` varchar(255) DEFAULT '',
  `weixin_app_secret` varchar(255) DEFAULT '',
  `weixin_mp_menu` text,
  `weixin_subscribe_message_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `weixin_no_result_message_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `weixin_encoding_aes_key` varchar(43) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信多账号设置';

-- --------------------------------------------------------

--
-- 表的结构 `aws_weixin_login`
--

CREATE TABLE IF NOT EXISTS `aws_weixin_login` (
  `id` int(10) NOT NULL,
  `token` int(10) NOT NULL,
  `uid` int(10) DEFAULT NULL,
  `session_id` varchar(32) NOT NULL,
  `expire` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_weixin_message`
--

CREATE TABLE IF NOT EXISTS `aws_weixin_message` (
  `id` int(11) NOT NULL,
  `weixin_id` varchar(32) NOT NULL,
  `content` varchar(255) NOT NULL,
  `action` text,
  `time` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_weixin_msg`
--

CREATE TABLE IF NOT EXISTS `aws_weixin_msg` (
  `id` int(10) NOT NULL,
  `msg_id` bigint(20) NOT NULL,
  `group_name` varchar(255) NOT NULL DEFAULT '未分组',
  `status` varchar(15) NOT NULL DEFAULT 'unsent',
  `error_num` int(10) DEFAULT NULL,
  `main_msg` text,
  `articles_info` text,
  `questions_info` text,
  `create_time` int(10) NOT NULL,
  `filter_count` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信群发列表';

-- --------------------------------------------------------

--
-- 表的结构 `aws_weixin_qr_code`
--

CREATE TABLE IF NOT EXISTS `aws_weixin_qr_code` (
  `scene_id` mediumint(5) NOT NULL,
  `ticket` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `subscribe_num` int(10) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信二维码';

-- --------------------------------------------------------

--
-- 表的结构 `aws_weixin_reply_rule`
--

CREATE TABLE IF NOT EXISTS `aws_weixin_reply_rule` (
  `id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL DEFAULT '0',
  `keyword` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `image_file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '0',
  `sort_status` int(10) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `aws_weixin_third_party_api`
--

CREATE TABLE IF NOT EXISTS `aws_weixin_third_party_api` (
  `id` int(10) NOT NULL,
  `account_id` int(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `rank` tinyint(2) unsigned NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='微信第三方接入';

-- --------------------------------------------------------

--
-- 表的结构 `aws_work_experience`
--

CREATE TABLE IF NOT EXISTS `aws_work_experience` (
  `work_id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `start_year` int(11) DEFAULT NULL COMMENT '开始年份',
  `end_year` int(11) DEFAULT NULL COMMENT '结束年月',
  `company_name` varchar(64) DEFAULT NULL COMMENT '公司名',
  `job_id` int(11) DEFAULT NULL COMMENT '职位ID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='工作经历';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `aws_active_data`
--
ALTER TABLE `aws_active_data`
  ADD PRIMARY KEY (`active_id`),
  ADD KEY `active_code` (`active_code`),
  ADD KEY `active_type_code` (`active_type_code`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `aws_answer`
--
ALTER TABLE `aws_answer`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `agree_count` (`agree_count`),
  ADD KEY `against_count` (`against_count`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `uid` (`uid`),
  ADD KEY `uninterested_count` (`uninterested_count`),
  ADD KEY `force_fold` (`force_fold`),
  ADD KEY `anonymous` (`anonymous`),
  ADD KEY `publich_source` (`publish_source`);

--
-- Indexes for table `aws_answer_comments`
--
ALTER TABLE `aws_answer_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer_id` (`answer_id`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `aws_answer_thanks`
--
ALTER TABLE `aws_answer_thanks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer_id` (`answer_id`);

--
-- Indexes for table `aws_answer_uninterested`
--
ALTER TABLE `aws_answer_uninterested`
  ADD PRIMARY KEY (`id`),
  ADD KEY `answer_id` (`answer_id`);

--
-- Indexes for table `aws_answer_vote`
--
ALTER TABLE `aws_answer_vote`
  ADD PRIMARY KEY (`voter_id`),
  ADD KEY `answer_id` (`answer_id`),
  ADD KEY `vote_value` (`vote_value`);

--
-- Indexes for table `aws_approval`
--
ALTER TABLE `aws_approval`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `uid` (`uid`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `aws_article`
--
ALTER TABLE `aws_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `has_attach` (`has_attach`),
  ADD KEY `uid` (`uid`),
  ADD KEY `comments` (`comments`),
  ADD KEY `views` (`views`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `lock` (`lock`),
  ADD KEY `votes` (`votes`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `is_recommend` (`is_recommend`),
  ADD KEY `chapter_id` (`chapter_id`),
  ADD KEY `sort` (`sort`),
  ADD FULLTEXT KEY `title_fulltext` (`title_fulltext`);

--
-- Indexes for table `aws_article_comments`
--
ALTER TABLE `aws_article_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `article_id` (`article_id`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `votes` (`votes`);

--
-- Indexes for table `aws_article_vote`
--
ALTER TABLE `aws_article_vote`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `type` (`type`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `time` (`time`),
  ADD KEY `item_uid` (`item_uid`);

--
-- Indexes for table `aws_attach`
--
ALTER TABLE `aws_attach`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_key` (`access_key`),
  ADD KEY `is_image` (`is_image`),
  ADD KEY `fetch` (`item_id`,`item_type`),
  ADD KEY `wait_approval` (`wait_approval`);

--
-- Indexes for table `aws_category`
--
ALTER TABLE `aws_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `url_token` (`url_token`),
  ADD KEY `title` (`title`);

--
-- Indexes for table `aws_draft`
--
ALTER TABLE `aws_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `aws_edm_task`
--
ALTER TABLE `aws_edm_task`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aws_edm_taskdata`
--
ALTER TABLE `aws_edm_taskdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskid` (`taskid`),
  ADD KEY `sent_time` (`sent_time`),
  ADD KEY `view_time` (`view_time`);

--
-- Indexes for table `aws_edm_unsubscription`
--
ALTER TABLE `aws_edm_unsubscription`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `aws_edm_userdata`
--
ALTER TABLE `aws_edm_userdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usergroup` (`usergroup`);

--
-- Indexes for table `aws_edm_usergroup`
--
ALTER TABLE `aws_edm_usergroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aws_education_experience`
--
ALTER TABLE `aws_education_experience`
  ADD PRIMARY KEY (`education_id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `aws_favorite`
--
ALTER TABLE `aws_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `time` (`time`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `aws_favorite_tag`
--
ALTER TABLE `aws_favorite_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `title` (`title`),
  ADD KEY `type` (`type`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `aws_feature`
--
ALTER TABLE `aws_feature`
  ADD PRIMARY KEY (`id`),
  ADD KEY `url_token` (`url_token`),
  ADD KEY `title` (`title`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `aws_feature_topic`
--
ALTER TABLE `aws_feature_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `feature_id` (`feature_id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `aws_geo_location`
--
ALTER TABLE `aws_geo_location`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_type` (`item_type`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `geo_location` (`latitude`,`longitude`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `aws_help_chapter`
--
ALTER TABLE `aws_help_chapter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `title` (`title`),
  ADD KEY `url_token` (`url_token`),
  ADD KEY `sort` (`sort`);

--
-- Indexes for table `aws_inbox`
--
ALTER TABLE `aws_inbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `dialog_id` (`dialog_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `sender_remove` (`sender_remove`),
  ADD KEY `recipient_remove` (`recipient_remove`),
  ADD KEY `sender_receipt` (`receipt`);

--
-- Indexes for table `aws_inbox_dialog`
--
ALTER TABLE `aws_inbox_dialog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipient_uid` (`recipient_uid`),
  ADD KEY `sender_uid` (`sender_uid`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `add_time` (`add_time`);

--
-- Indexes for table `aws_integral_log`
--
ALTER TABLE `aws_integral_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `action` (`action`),
  ADD KEY `time` (`time`),
  ADD KEY `integral` (`integral`);

--
-- Indexes for table `aws_invitation`
--
ALTER TABLE `aws_invitation`
  ADD PRIMARY KEY (`invitation_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `invitation_code` (`invitation_code`),
  ADD KEY `invitation_email` (`invitation_email`),
  ADD KEY `active_time` (`active_time`),
  ADD KEY `active_ip` (`active_ip`),
  ADD KEY `active_status` (`active_status`);

--
-- Indexes for table `aws_jobs`
--
ALTER TABLE `aws_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `aws_mail_queue`
--
ALTER TABLE `aws_mail_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `is_error` (`is_error`),
  ADD KEY `send_to` (`send_to`);

--
-- Indexes for table `aws_nav_menu`
--
ALTER TABLE `aws_nav_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`link`);

--
-- Indexes for table `aws_notification`
--
ALTER TABLE `aws_notification`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `recipient_read_flag` (`recipient_uid`,`read_flag`),
  ADD KEY `sender_uid` (`sender_uid`),
  ADD KEY `model_type` (`model_type`),
  ADD KEY `source_id` (`source_id`),
  ADD KEY `action_type` (`action_type`),
  ADD KEY `add_time` (`add_time`);

--
-- Indexes for table `aws_notification_data`
--
ALTER TABLE `aws_notification_data`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `aws_pages`
--
ALTER TABLE `aws_pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `url_token` (`url_token`),
  ADD KEY `enabled` (`enabled`);

--
-- Indexes for table `aws_posts_index`
--
ALTER TABLE `aws_posts_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `post_type` (`post_type`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `is_recommend` (`is_recommend`),
  ADD KEY `anonymous` (`anonymous`),
  ADD KEY `popular_value` (`popular_value`),
  ADD KEY `uid` (`uid`),
  ADD KEY `lock` (`lock`),
  ADD KEY `agree_count` (`agree_count`),
  ADD KEY `answer_count` (`answer_count`),
  ADD KEY `view_count` (`view_count`);

--
-- Indexes for table `aws_question`
--
ALTER TABLE `aws_question`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `update_time` (`update_time`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `published_uid` (`published_uid`),
  ADD KEY `answer_count` (`answer_count`),
  ADD KEY `agree_count` (`agree_count`),
  ADD KEY `question_content` (`question_content`),
  ADD KEY `lock` (`lock`),
  ADD KEY `thanks_count` (`thanks_count`),
  ADD KEY `anonymous` (`anonymous`),
  ADD KEY `popular_value` (`popular_value`),
  ADD KEY `best_answer` (`best_answer`),
  ADD KEY `popular_value_update` (`popular_value_update`),
  ADD KEY `against_count` (`against_count`),
  ADD KEY `is_recommend` (`is_recommend`),
  ADD KEY `weibo_msg_id` (`weibo_msg_id`),
  ADD KEY `received_email_id` (`received_email_id`),
  ADD KEY `unverified_modify_count` (`unverified_modify_count`),
  ADD KEY `chapter_id` (`chapter_id`),
  ADD KEY `sort` (`sort`),
  ADD FULLTEXT KEY `question_content_fulltext` (`question_content_fulltext`);

--
-- Indexes for table `aws_question_comments`
--
ALTER TABLE `aws_question_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `aws_question_focus`
--
ALTER TABLE `aws_question_focus`
  ADD PRIMARY KEY (`focus_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `question_uid` (`question_id`,`uid`);

--
-- Indexes for table `aws_question_invite`
--
ALTER TABLE `aws_question_invite`
  ADD PRIMARY KEY (`question_invite_id`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `sender_uid` (`sender_uid`),
  ADD KEY `recipients_uid` (`recipients_uid`),
  ADD KEY `add_time` (`add_time`);

--
-- Indexes for table `aws_question_thanks`
--
ALTER TABLE `aws_question_thanks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_id` (`question_id`);

--
-- Indexes for table `aws_question_uninterested`
--
ALTER TABLE `aws_question_uninterested`
  ADD PRIMARY KEY (`interested_id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `aws_received_email`
--
ALTER TABLE `aws_received_email`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `config_id` (`config_id`),
  ADD KEY `message_id` (`message_id`),
  ADD KEY `date` (`date`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `aws_receiving_email_config`
--
ALTER TABLE `aws_receiving_email_config`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `server` (`server`);

--
-- Indexes for table `aws_redirect`
--
ALTER TABLE `aws_redirect`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `aws_related_links`
--
ALTER TABLE `aws_related_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `item_type` (`item_type`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `add_time` (`add_time`);

--
-- Indexes for table `aws_related_topic`
--
ALTER TABLE `aws_related_topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `related_id` (`related_id`);

--
-- Indexes for table `aws_report`
--
ALTER TABLE `aws_report`
  ADD PRIMARY KEY (`id`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `aws_reputation_category`
--
ALTER TABLE `aws_reputation_category`
  ADD PRIMARY KEY (`auto_id`),
  ADD UNIQUE KEY `uid_category_id` (`uid`,`category_id`);

--
-- Indexes for table `aws_reputation_topic`
--
ALTER TABLE `aws_reputation_topic`
  ADD PRIMARY KEY (`auto_id`),
  ADD KEY `topic_count` (`topic_count`),
  ADD KEY `uid` (`uid`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `reputation` (`reputation`);

--
-- Indexes for table `aws_school`
--
ALTER TABLE `aws_school`
  ADD PRIMARY KEY (`school_id`);

--
-- Indexes for table `aws_search_cache`
--
ALTER TABLE `aws_search_cache`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hash` (`hash`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `aws_sessions`
--
ALTER TABLE `aws_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modified` (`modified`),
  ADD KEY `lifetime` (`lifetime`);

--
-- Indexes for table `aws_system_setting`
--
ALTER TABLE `aws_system_setting`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `varname` (`varname`);

--
-- Indexes for table `aws_topic`
--
ALTER TABLE `aws_topic`
  ADD PRIMARY KEY (`topic_id`),
  ADD UNIQUE KEY `topic_title` (`topic_title`),
  ADD KEY `url_token` (`url_token`),
  ADD KEY `merged_id` (`merged_id`),
  ADD KEY `discuss_count` (`discuss_count`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `user_related` (`user_related`),
  ADD KEY `focus_count` (`focus_count`),
  ADD KEY `topic_lock` (`topic_lock`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `is_parent` (`is_parent`),
  ADD KEY `discuss_count_last_week` (`discuss_count_last_week`),
  ADD KEY `discuss_count_last_month` (`discuss_count_last_month`),
  ADD KEY `discuss_count_update` (`discuss_count_update`);

--
-- Indexes for table `aws_topic_focus`
--
ALTER TABLE `aws_topic_focus`
  ADD PRIMARY KEY (`focus_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `topic_uid` (`topic_id`,`uid`);

--
-- Indexes for table `aws_topic_merge`
--
ALTER TABLE `aws_topic_merge`
  ADD PRIMARY KEY (`id`),
  ADD KEY `source_id` (`source_id`),
  ADD KEY `target_id` (`target_id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `aws_topic_relation`
--
ALTER TABLE `aws_topic_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `type` (`type`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `aws_users`
--
ALTER TABLE `aws_users`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `user_name` (`user_name`),
  ADD KEY `email` (`email`),
  ADD KEY `reputation` (`reputation`),
  ADD KEY `reputation_update_time` (`reputation_update_time`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `agree_count` (`agree_count`),
  ADD KEY `thanks_count` (`thanks_count`),
  ADD KEY `forbidden` (`forbidden`),
  ADD KEY `valid_email` (`valid_email`),
  ADD KEY `last_active` (`last_active`),
  ADD KEY `integral` (`integral`),
  ADD KEY `url_token` (`url_token`),
  ADD KEY `verified` (`verified`),
  ADD KEY `answer_count` (`answer_count`);

--
-- Indexes for table `aws_users_attrib`
--
ALTER TABLE `aws_users_attrib`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `aws_users_facebook`
--
ALTER TABLE `aws_users_facebook`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD KEY `access_token` (`access_token`);

--
-- Indexes for table `aws_users_google`
--
ALTER TABLE `aws_users_google`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD KEY `access_token` (`access_token`);

--
-- Indexes for table `aws_users_group`
--
ALTER TABLE `aws_users_group`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `type` (`type`),
  ADD KEY `custom` (`custom`);

--
-- Indexes for table `aws_users_notification_setting`
--
ALTER TABLE `aws_users_notification_setting`
  ADD PRIMARY KEY (`notice_setting_id`),
  ADD KEY `uid` (`uid`);

--
-- Indexes for table `aws_users_online`
--
ALTER TABLE `aws_users_online`
  ADD KEY `uid` (`uid`),
  ADD KEY `last_active` (`last_active`);

--
-- Indexes for table `aws_users_qq`
--
ALTER TABLE `aws_users_qq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `access_token` (`access_token`),
  ADD KEY `openid` (`openid`);

--
-- Indexes for table `aws_users_sina`
--
ALTER TABLE `aws_users_sina`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD KEY `access_token` (`access_token`),
  ADD KEY `last_msg_id` (`last_msg_id`);

--
-- Indexes for table `aws_users_twitter`
--
ALTER TABLE `aws_users_twitter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD KEY `access_token` (`access_token`);

--
-- Indexes for table `aws_users_ucenter`
--
ALTER TABLE `aws_users_ucenter`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `uc_uid` (`uc_uid`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `aws_users_weixin`
--
ALTER TABLE `aws_users_weixin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uid` (`uid`),
  ADD KEY `openid` (`openid`),
  ADD KEY `expires_in` (`expires_in`),
  ADD KEY `scope` (`scope`),
  ADD KEY `sex` (`sex`),
  ADD KEY `province` (`province`),
  ADD KEY `city` (`city`),
  ADD KEY `country` (`country`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `latitude` (`latitude`,`longitude`),
  ADD KEY `location_update` (`location_update`);

--
-- Indexes for table `aws_user_action_history`
--
ALTER TABLE `aws_user_action_history`
  ADD PRIMARY KEY (`history_id`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `uid` (`uid`),
  ADD KEY `associate_id` (`associate_id`),
  ADD KEY `anonymous` (`anonymous`),
  ADD KEY `fold_status` (`fold_status`),
  ADD KEY `associate` (`associate_type`,`associate_action`),
  ADD KEY `associate_attached` (`associate_attached`),
  ADD KEY `associate_with_id` (`associate_id`,`associate_type`,`associate_action`),
  ADD KEY `associate_with_uid` (`uid`,`associate_type`,`associate_action`);

--
-- Indexes for table `aws_user_action_history_data`
--
ALTER TABLE `aws_user_action_history_data`
  ADD PRIMARY KEY (`history_id`);

--
-- Indexes for table `aws_user_action_history_fresh`
--
ALTER TABLE `aws_user_action_history_fresh`
  ADD PRIMARY KEY (`id`),
  ADD KEY `associate` (`associate_type`,`associate_action`),
  ADD KEY `add_time` (`add_time`),
  ADD KEY `uid` (`uid`),
  ADD KEY `history_id` (`history_id`),
  ADD KEY `associate_with_id` (`id`,`associate_type`,`associate_action`),
  ADD KEY `associate_with_uid` (`uid`,`associate_type`,`associate_action`),
  ADD KEY `anonymous` (`anonymous`);

--
-- Indexes for table `aws_user_follow`
--
ALTER TABLE `aws_user_follow`
  ADD PRIMARY KEY (`follow_id`),
  ADD KEY `fans_uid` (`fans_uid`),
  ADD KEY `friend_uid` (`friend_uid`),
  ADD KEY `user_follow` (`fans_uid`,`friend_uid`);

--
-- Indexes for table `aws_verify_apply`
--
ALTER TABLE `aws_verify_apply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `time` (`time`),
  ADD KEY `name` (`name`,`status`),
  ADD KEY `type` (`type`);

--
-- Indexes for table `aws_weibo_msg`
--
ALTER TABLE `aws_weibo_msg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `uid` (`uid`),
  ADD KEY `weibo_uid` (`weibo_uid`),
  ADD KEY `question_id` (`question_id`),
  ADD KEY `ticket_id` (`ticket_id`);

--
-- Indexes for table `aws_weixin_accounts`
--
ALTER TABLE `aws_weixin_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weixin_mp_token` (`weixin_mp_token`),
  ADD KEY `weixin_account_role` (`weixin_account_role`),
  ADD KEY `weixin_app_id` (`weixin_app_id`);

--
-- Indexes for table `aws_weixin_login`
--
ALTER TABLE `aws_weixin_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `session_id` (`session_id`),
  ADD KEY `token` (`token`),
  ADD KEY `expire` (`expire`);

--
-- Indexes for table `aws_weixin_message`
--
ALTER TABLE `aws_weixin_message`
  ADD PRIMARY KEY (`id`),
  ADD KEY `weixin_id` (`weixin_id`),
  ADD KEY `time` (`time`);

--
-- Indexes for table `aws_weixin_msg`
--
ALTER TABLE `aws_weixin_msg`
  ADD PRIMARY KEY (`id`),
  ADD KEY `msg_id` (`msg_id`),
  ADD KEY `group_name` (`group_name`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `aws_weixin_qr_code`
--
ALTER TABLE `aws_weixin_qr_code`
  ADD PRIMARY KEY (`scene_id`),
  ADD KEY `ticket` (`ticket`),
  ADD KEY `subscribe_num` (`subscribe_num`);

--
-- Indexes for table `aws_weixin_reply_rule`
--
ALTER TABLE `aws_weixin_reply_rule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `enabled` (`enabled`),
  ADD KEY `sort_status` (`sort_status`);

--
-- Indexes for table `aws_weixin_third_party_api`
--
ALTER TABLE `aws_weixin_third_party_api`
  ADD PRIMARY KEY (`id`),
  ADD KEY `account_id` (`account_id`),
  ADD KEY `enabled` (`enabled`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `aws_work_experience`
--
ALTER TABLE `aws_work_experience`
  ADD PRIMARY KEY (`work_id`),
  ADD KEY `uid` (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `aws_active_data`
--
ALTER TABLE `aws_active_data`
  MODIFY `active_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_answer`
--
ALTER TABLE `aws_answer`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '回答id';
--
-- AUTO_INCREMENT for table `aws_answer_comments`
--
ALTER TABLE `aws_answer_comments`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_answer_thanks`
--
ALTER TABLE `aws_answer_thanks`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_answer_uninterested`
--
ALTER TABLE `aws_answer_uninterested`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_answer_vote`
--
ALTER TABLE `aws_answer_vote`
  MODIFY `voter_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动ID';
--
-- AUTO_INCREMENT for table `aws_approval`
--
ALTER TABLE `aws_approval`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_article`
--
ALTER TABLE `aws_article`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_article_comments`
--
ALTER TABLE `aws_article_comments`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_article_vote`
--
ALTER TABLE `aws_article_vote`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_attach`
--
ALTER TABLE `aws_attach`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_category`
--
ALTER TABLE `aws_category`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `aws_draft`
--
ALTER TABLE `aws_draft`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_edm_task`
--
ALTER TABLE `aws_edm_task`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_edm_taskdata`
--
ALTER TABLE `aws_edm_taskdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_edm_unsubscription`
--
ALTER TABLE `aws_edm_unsubscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_edm_userdata`
--
ALTER TABLE `aws_edm_userdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_edm_usergroup`
--
ALTER TABLE `aws_edm_usergroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_education_experience`
--
ALTER TABLE `aws_education_experience`
  MODIFY `education_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_favorite`
--
ALTER TABLE `aws_favorite`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_favorite_tag`
--
ALTER TABLE `aws_favorite_tag`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_feature`
--
ALTER TABLE `aws_feature`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_feature_topic`
--
ALTER TABLE `aws_feature_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_geo_location`
--
ALTER TABLE `aws_geo_location`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_help_chapter`
--
ALTER TABLE `aws_help_chapter`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_inbox`
--
ALTER TABLE `aws_inbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_inbox_dialog`
--
ALTER TABLE `aws_inbox_dialog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '对话ID';
--
-- AUTO_INCREMENT for table `aws_integral_log`
--
ALTER TABLE `aws_integral_log`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `aws_invitation`
--
ALTER TABLE `aws_invitation`
  MODIFY `invitation_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '激活ID';
--
-- AUTO_INCREMENT for table `aws_jobs`
--
ALTER TABLE `aws_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `aws_mail_queue`
--
ALTER TABLE `aws_mail_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_nav_menu`
--
ALTER TABLE `aws_nav_menu`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `aws_notification`
--
ALTER TABLE `aws_notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `aws_pages`
--
ALTER TABLE `aws_pages`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_posts_index`
--
ALTER TABLE `aws_posts_index`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_question`
--
ALTER TABLE `aws_question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_question_comments`
--
ALTER TABLE `aws_question_comments`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_question_focus`
--
ALTER TABLE `aws_question_focus`
  MODIFY `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `aws_question_invite`
--
ALTER TABLE `aws_question_invite`
  MODIFY `question_invite_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `aws_question_thanks`
--
ALTER TABLE `aws_question_thanks`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_question_uninterested`
--
ALTER TABLE `aws_question_uninterested`
  MODIFY `interested_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `aws_received_email`
--
ALTER TABLE `aws_received_email`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_receiving_email_config`
--
ALTER TABLE `aws_receiving_email_config`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_redirect`
--
ALTER TABLE `aws_redirect`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_related_links`
--
ALTER TABLE `aws_related_links`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_related_topic`
--
ALTER TABLE `aws_related_topic`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_report`
--
ALTER TABLE `aws_report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_reputation_category`
--
ALTER TABLE `aws_reputation_category`
  MODIFY `auto_id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_reputation_topic`
--
ALTER TABLE `aws_reputation_topic`
  MODIFY `auto_id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_search_cache`
--
ALTER TABLE `aws_search_cache`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_system_setting`
--
ALTER TABLE `aws_system_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT for table `aws_topic`
--
ALTER TABLE `aws_topic`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题id',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `aws_topic_focus`
--
ALTER TABLE `aws_topic_focus`
  MODIFY `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `aws_topic_merge`
--
ALTER TABLE `aws_topic_merge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_topic_relation`
--
ALTER TABLE `aws_topic_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增 ID';
--
-- AUTO_INCREMENT for table `aws_users`
--
ALTER TABLE `aws_users`
  MODIFY `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户的 UID',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `aws_users_attrib`
--
ALTER TABLE `aws_users_attrib`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `aws_users_group`
--
ALTER TABLE `aws_users_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `aws_users_notification_setting`
--
ALTER TABLE `aws_users_notification_setting`
  MODIFY `notice_setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id';
--
-- AUTO_INCREMENT for table `aws_users_qq`
--
ALTER TABLE `aws_users_qq`
  MODIFY `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_users_ucenter`
--
ALTER TABLE `aws_users_ucenter`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_users_weixin`
--
ALTER TABLE `aws_users_weixin`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_user_action_history`
--
ALTER TABLE `aws_user_action_history`
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `aws_user_action_history_fresh`
--
ALTER TABLE `aws_user_action_history_fresh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_user_follow`
--
ALTER TABLE `aws_user_follow`
  MODIFY `follow_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
--
-- AUTO_INCREMENT for table `aws_verify_apply`
--
ALTER TABLE `aws_verify_apply`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_weixin_accounts`
--
ALTER TABLE `aws_weixin_accounts`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_weixin_login`
--
ALTER TABLE `aws_weixin_login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_weixin_message`
--
ALTER TABLE `aws_weixin_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_weixin_msg`
--
ALTER TABLE `aws_weixin_msg`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_weixin_qr_code`
--
ALTER TABLE `aws_weixin_qr_code`
  MODIFY `scene_id` mediumint(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_weixin_reply_rule`
--
ALTER TABLE `aws_weixin_reply_rule`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_weixin_third_party_api`
--
ALTER TABLE `aws_weixin_third_party_api`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_work_experience`
--
ALTER TABLE `aws_work_experience`
  MODIFY `work_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID';
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
