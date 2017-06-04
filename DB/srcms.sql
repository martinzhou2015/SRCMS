-- phpMyAdmin SQL Dump
-- version 4.4.11
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-05-31 22:47:33
-- 服务器版本： 5.5.40
-- PHP Version: 5.5.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `srcms`
--
CREATE DATABASE `srcms` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE srcms;

-- --------------------------------------------------------

--
-- 表的结构 `blog`
--

CREATE TABLE IF NOT EXISTS `blog` (
  `id` int(10) NOT NULL COMMENT '博客ID',
  `title` varchar(100) NOT NULL DEFAULT '暂无' COMMENT '博客标题',
  `name` varchar(100) NOT NULL DEFAULT '默认分类' COMMENT '博客分类',
  `content` text NOT NULL COMMENT '博客内容',
  `update_time` varchar(255) NOT NULL COMMENT '创建时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `blog`
--

INSERT INTO `blog` (`id`, `title`, `name`, `content`, `update_time`) VALUES
(1, 'Andriod安全概论', 'Web安全', '&lt;p&gt;Google 2017年度Andriod安全研究报告&lt;/p&gt;', '1485831269');

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `pid` int(11) DEFAULT NULL COMMENT '父分类ID',
  `name` varchar(20) DEFAULT NULL COMMENT '分类别名',
  `title` varchar(100) DEFAULT NULL COMMENT '分类标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '分类关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '分类描述'
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `pid`, `name`, `title`, `keywords`, `description`) VALUES
(1, 0, 'default', '默认分类', '默认分类', '默认分类描述'),
(2, 0, 'Webvul', 'Web漏洞', '', ''),
(3, 0, 'PC Clinet', 'PC客户端漏洞', '', ''),
(4, 0, 'Sever', '服务器漏洞', '', ''),
(5, 0, 'Mobile Clinet', '移动客户端漏洞', '', ''),
(6, 2, 'SQLinjection', 'SQL注入', '', ''),
(7, 2, 'XSS', 'XSS', '', ''),
(8, 2, 'CSRF', 'CSRF', '', ''),
(9, 5, 'IOS', 'IOS', '', ''),
(10, 5, 'wordpress', 'Android', 'Android', ''),
(11, 3, 'Overflow', '溢出', '', ''),
(12, 3, 'DDOS', '拒绝服务', '', ''),
(13, 7, 'DOM XSS', '基于DOM的XSS', '', ''),
(14, 7, 'Stored XSS', '存储型XSS', '', ''),
(15, 2, 'Logic', '逻辑漏洞', '', '');

-- --------------------------------------------------------

--
-- 表的结构 `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(255) NOT NULL COMMENT '评论编号',
  `user_id` varchar(255) NOT NULL COMMENT '评论用户',
  `post_id` int(255) NOT NULL COMMENT '评论报告',
  `content` varchar(255) NOT NULL COMMENT '评论内容',
  `update_time` varchar(255) NOT NULL COMMENT '评论时间'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='报告评论';

--
-- 转存表中的数据 `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `post_id`, `content`, `update_time`) VALUES
(1, 'user2', 1, '来个人审核呀！！！', '1485862938');

-- --------------------------------------------------------

--
-- 表的结构 `hall`
--

CREATE TABLE IF NOT EXISTS `hall` (
  `id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '名人堂昵称',
  `team` varchar(255) NOT NULL DEFAULT 'Unknown' COMMENT '团队名称',
  `url` varchar(100) NOT NULL COMMENT '名人堂头像URL',
  `des` varchar(100) NOT NULL COMMENT '名人堂介绍'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='名人堂';

--
-- 转存表中的数据 `hall`
--

INSERT INTO `hall` (`id`, `name`, `team`, `url`, `des`) VALUES
(0, 'Nancy Rich', 'Google (Porject Zero)', './PUBLIC/Index/img/400x400/04.jpg', '来自Google Project Zero的Nancy，第一季度帮助我们发现20个涉及Andriod、Google Chrome等核心产品的严重漏洞。对Google安全生态的建设起到了极大的帮助 '),
(1, 'Anna Kusaikina', 'Apple Security Team', './Public/Index/img/400x400/06.jpg', '来自Apple Security Team的Anna，第三季度帮助我们发现5个涉及Google Chrome的高危漏洞，对Chrome的稳定性和安全性的提升贡献非凡。'),
(2, 'Lucas Richardson', 'Microsoft Security Response Center', './Public/Index/img/400x400/05.jpg', '帮助我们发现了一枚严重级别的远程代码执行漏洞，并及时通知我们进行修复，保护了亿万用户的安全，特此表示衷心的感谢。');

-- --------------------------------------------------------

--
-- 表的结构 `info`
--

CREATE TABLE IF NOT EXISTS `info` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `realname` varchar(20) NOT NULL,
  `location` varchar(50) NOT NULL,
  `tel` varchar(11) NOT NULL,
  `zipcode` varchar(6) NOT NULL,
  `alipay` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `info`
--

INSERT INTO `info` (`user_id`, `username`, `realname`, `location`, `tel`, `zipcode`, `alipay`) VALUES
(2, 'user2', 'user', 'user', '11', 'user', '11');

-- --------------------------------------------------------

--
-- 表的结构 `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) unsigned NOT NULL COMMENT '奖品ID',
  `title` varchar(100) NOT NULL COMMENT '奖品名称',
  `url` varchar(100) NOT NULL COMMENT '奖品图片',
  `price` varchar(255) NOT NULL COMMENT '奖品价格',
  `sort` varchar(255) NOT NULL DEFAULT 'graphic' COMMENT '奖品类型'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `links`
--

INSERT INTO `links` (`id`, `title`, `url`, `price`, `sort`) VALUES
(1, '定制记事本', './public/Index/img/400x500/01.jpg', '100', 'graphic'),
(2, 'Moto 360智能腕表', './public/Index/img/970x647/06.jpg', '1000', 'graphic'),
(3, '定制贺卡', './public/Index/img/400x500/02.jpg', '10', 'graphic'),
(4, '定制饮品', './public/Index/img/970x647/09.jpg', '100', 'graphic'),
(5, '有机坚果套装', './public/Index/img/970x647/04.jpg', '200', 'graphic'),
(6, '京东卡1000元', './public/Index/img/400x500/03.jpg', '500', 'virtual'),
(7, 'Apple Watch白色运动版', './public/Index/img/400x500/04.jpg', '3000', 'graphic');

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `id` int(2) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL DEFAULT '暂无',
  `password` varchar(32) NOT NULL DEFAULT '暂无',
  `token` varchar(255) NOT NULL DEFAULT '暂无' COMMENT 'token',
  `login_ip` varchar(20) NOT NULL DEFAULT '暂无',
  `create_at` varchar(11) NOT NULL DEFAULT '暂无',
  `update_at` varchar(11) NOT NULL DEFAULT '暂无'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `manager`
--

INSERT INTO `manager` (`id`, `username`, `email`, `password`, `token`, `login_ip`, `create_at`, `update_at`) VALUES
(1, 'admin', '1009465756@qq.com', '21232f297a57a5a743894a0e4a801fc3', '214b679679a56701df24aeaabb2c952b', '0.0.0.0', '1453778451', '1496241923');

-- --------------------------------------------------------

--
-- 表的结构 `member`
--

CREATE TABLE IF NOT EXISTS `member` (
  `id` int(11) NOT NULL COMMENT '用户ID',
  `pid` varchar(255) NOT NULL DEFAULT '0' COMMENT '个人资料ID',
  `username` varchar(20) DEFAULT '路人甲' COMMENT '用户昵称',
  `realname` varchar(100) NOT NULL DEFAULT '暂无' COMMENT '真实姓名',
  `team` varchar(255) NOT NULL DEFAULT '暂无' COMMENT '团队名称',
  `email` varchar(100) DEFAULT '暂无' COMMENT '用户邮箱',
  `salt` varchar(9) NOT NULL DEFAULT '暂无' COMMENT '加密salt',
  `password` varchar(32) DEFAULT NULL COMMENT '用户密码',
  `token` varchar(255) NOT NULL DEFAULT '0' COMMENT '防护token',
  `avatar` varchar(255) DEFAULT '暂无' COMMENT '用户头像',
  `address` varchar(255) NOT NULL DEFAULT '暂无' COMMENT '用户住址',
  `description` varchar(255) NOT NULL DEFAULT '暂无' COMMENT '个人简介',
  `bankcode` varchar(255) NOT NULL DEFAULT '暂无' COMMENT '银行账号',
  `idcode` varchar(255) NOT NULL DEFAULT '暂无' COMMENT '身份证号',
  `zipcode` varchar(255) NOT NULL DEFAULT '暂无' COMMENT '邮编',
  `alipay` varchar(255) NOT NULL DEFAULT '暂无' COMMENT '支付宝账号',
  `tel` varchar(255) NOT NULL DEFAULT '暂无' COMMENT '联系电话',
  `website` varchar(255) NOT NULL DEFAULT '暂无' COMMENT '个人网站',
  `qqnumber` varchar(255) NOT NULL DEFAULT '0' COMMENT 'QQ号',
  `create_at` varchar(11) DEFAULT '0' COMMENT '创建时间',
  `update_at` varchar(11) DEFAULT '0' COMMENT '更新时间',
  `login_ip` varchar(20) DEFAULT '0' COMMENT '登录IP',
  `status` tinyint(1) DEFAULT '1' COMMENT '0:禁止登陆 1:正常',
  `type` tinyint(1) DEFAULT '1' COMMENT '1:前台用户 2:管理员 ',
  `jifen` int(10) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `jinbi` varchar(255) NOT NULL DEFAULT '0' COMMENT '安全币'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
  `id` int(100) NOT NULL COMMENT '特殊页面ID',
  `title` varchar(255) NOT NULL COMMENT '特殊页面标题',
  `content` varchar(255) NOT NULL COMMENT '特殊页面内容',
  `author` varchar(255) NOT NULL COMMENT '页面作者',
  `time` varchar(255) NOT NULL COMMENT '页面创建时间',
  `name` varchar(255) NOT NULL COMMENT '页面别名'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='特殊页面';

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(10) NOT NULL COMMENT '订单编号',
  `userid` varchar(255) NOT NULL COMMENT '用户ID',
  `username` varchar(50) NOT NULL COMMENT '兑换用户',
  `realname` varchar(50) NOT NULL COMMENT '真实姓名',
  `zipcode` varchar(10) NOT NULL COMMENT '邮编',
  `address` varchar(100) NOT NULL COMMENT '住址',
  `tel` int(15) NOT NULL COMMENT '电话',
  `alipay` varchar(50) NOT NULL COMMENT '支付宝',
  `gid` varchar(100) NOT NULL COMMENT '礼品名称',
  `price` varchar(255) NOT NULL DEFAULT '0' COMMENT '订单金额',
  `update_time` varchar(255) NOT NULL COMMENT '订单时间',
  `finish` int(2) NOT NULL COMMENT '1. 完成 2.未完成'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `order`
--

INSERT INTO `order` (`id`, `userid`, `username`, `realname`, `zipcode`, `address`, `tel`, `alipay`, `gid`, `price`, `update_time`, `finish`) VALUES
(1, '1', 'user', '暂无', '暂无', '暂无', 0, '暂无', '定制饮品', '100', '1486179341', 0);

-- --------------------------------------------------------

--
-- 表的结构 `page`
--

CREATE TABLE IF NOT EXISTS `page` (
  `id` int(11) NOT NULL COMMENT '公告ID',
  `title` varchar(100) NOT NULL COMMENT '公告标题',
  `name` varchar(100) NOT NULL COMMENT '公告名称',
  `author` varchar(100) NOT NULL COMMENT '公告作者',
  `content` text NOT NULL COMMENT '公告内容',
  `update_time` varchar(255) NOT NULL COMMENT '发布日期'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `page`
--

INSERT INTO `page` (`id`, `title`, `name`, `author`, `content`, `update_time`) VALUES
(1, '2017年应急响应中心漏洞收集流程', 'SRC-2017-01', 'admin', '&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;白帽子定义：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;白帽子指通过安全应急响应平台参与漏洞提交过程的安全专家，能够识别计算机系统或网络系统中的安全漏洞，但并不会恶意利用，而是公布漏洞，帮助厂商在被其他人恶意利用之前修补漏洞，维护计算机和互联网安全。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;漏洞收集流程：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;1. 登录并完善资料&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;白帽子使用应急响应中心账号登录平台并完善资料，请确保资料真实有效，并及时更新。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;2. 提交漏洞&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;白帽子根据漏洞提交页面指引，提交安全漏洞信息。请务必详尽，漏洞描述越具体，越便于我们准确进行应急响应。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;3. 审核漏洞&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;漏洞提交后48小时内（法定节假日顺延），我们会对收到的漏洞按照《漏洞验收标准》进行评估同时确定奖励额度。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1485833045'),
(2, '2017年应急响应中心漏洞奖励细节', 'SRC-2017-02', 'admin', '&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-size: 18px;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;基本原则&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;我们对于保护用户利益，帮助安全提升的白帽子黑客，我们给予感谢和回馈。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;我们反对和谴责一切以漏洞测试为借口，利用安全漏洞进行破坏、损害用户利益的黑客行为，包括但不限于利用漏洞盗取用户资料、入侵业务系统、修改、窃取相关系统资料、恶意传播漏洞或数据。对于发生上述行为的、我们司将追究其法律责任。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-size: 18px;&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;漏洞处理流程&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;对于每一个级别的漏洞，我们会根据漏洞利用的技术难度、漏洞造成的影响等进行综合考虑，分成不同的层次，并给与相应积分。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;根据漏洞出现的业务等级，漏洞危害程度分为高危、中危、低危、忽略四个级别，每个级别涵盖的漏洞以及评分标准如下：&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;高危：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;直接获取系统权限（服务器权限、客户端权限）的漏洞。包括但不限于远程任意命令执行、代码执行、任意文件上传获取Webshell、缓冲区溢出、SQL注入获取系统权限、服务器解析漏洞、文件包含漏洞等。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;严重的逻辑设计缺陷。包括但不限于任意账号登陆、任意账号密码修改、短信邮件验证的绕过。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;严重的敏感信息泄露。包括但不限于严重的SQL注入、任意文件包含等。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;越权访问。包括但不限于绕过验证直接访问后台、后台登录弱口令、SSH弱口令，数据库弱口令等。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;中危：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;需要交互才能获取用户身份信息的漏洞。包括存储型XSS等。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;普通逻辑设计缺陷。包括但不限于无限制短信邮件等发送等。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;非重点产品线、利用难度较大的SQL注入漏洞等。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;低危：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;一般信息泄露漏洞。包括但不限于路径泄露、SVN文件泄露、LOG文件泄露、Phpinfo等。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;无法利用或者难以利用的漏洞，包括但不限于反射型XSS和只能弹自己的XSS。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;&lt;span style=&quot;box-sizing: border-box; font-weight: 700;&quot;&gt;忽略：&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;不涉及安全问题的bug。包括但不限于产品功能缺陷、页面乱码、样式混编等。&lt;/p&gt;&lt;p style=&quot;box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; font-size: 0.9375rem; color: rgb(101, 101, 101); line-height: 1.6; font-family: 微软雅黑; white-space: normal; background-color: rgb(255, 255, 255);&quot;&gt;无法重现的漏洞、不能直接体现漏洞的其他问题。包括但不限于纯属用户猜测的问题。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;', '1485833099');

-- --------------------------------------------------------

--
-- 表的结构 `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL,
  `session` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `advise` varchar(255) NOT NULL,
  `time` varchar(11) DEFAULT '0',
  `day` tinyint(1) NOT NULL DEFAULT '0' COMMENT '修补期限',
  `cate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rank` tinyint(1) NOT NULL DEFAULT '1' COMMENT '漏洞等级',
  `bounty` varchar(255) NOT NULL DEFAULT '0' COMMENT '漏洞报告奖励',
  `type` tinyint(1) DEFAULT '1' COMMENT '1:审核中,2:已忽略,3:已确认,4:已修复',
  `visible` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `post`
--

INSERT INTO `post` (`id`, `session`, `title`, `content`, `advise`, `time`, `day`, `cate_id`, `user_id`, `rank`, `bounty`, `type`, `visible`) VALUES
(1, '', '测试工单', '&lt;p&gt;测试工单&lt;/p&gt;', '', '1486183605', 0, 2, 1, 1, '+积分:100 +安全币:100', 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `record`
--

CREATE TABLE IF NOT EXISTS `record` (
  `id` int(100) NOT NULL COMMENT '操作ID',
  `type` int(10) NOT NULL COMMENT '操作类型',
  `name` varchar(255) NOT NULL COMMENT '操作名称',
  `content` varchar(255) NOT NULL COMMENT '操作内容',
  `time` varchar(255) NOT NULL COMMENT '操作时间',
  `user` varchar(255) NOT NULL COMMENT '变动用户',
  `userid` int(10) NOT NULL DEFAULT '0' COMMENT '变动用户ID',
  `operator` varchar(255) NOT NULL DEFAULT '暂无' COMMENT '操作人'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='操作记录';

--
-- 转存表中的数据 `record`
--

INSERT INTO `record` (`id`, `type`, `name`, `content`, `time`, `user`, `userid`, `operator`) VALUES
(1, 1, '兑换定制饮品', '-安全币:100', '1486179341', 'user', 1, 'user'),
(2, 1, '增加积分/安全币', '+积分:100 +安全币:200', '1486188291', 'user', 0, 'admin'),
(3, 1, '增加积分/安全币', '+积分:100 +安全币:100', '1486188711', 'user', 0, 'admin');

-- --------------------------------------------------------

--
-- 表的结构 `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `id` int(11) unsigned NOT NULL COMMENT '配置编号',
  `value` varchar(255) NOT NULL COMMENT '配置内容',
  `key1` varchar(255) NOT NULL COMMENT '配置数据',
  `key2` varchar(255) NOT NULL COMMENT '配置数据',
  `key3` varchar(255) NOT NULL COMMENT '配置数据',
  `key4` varchar(255) NOT NULL COMMENT '配置数据',
  `key5` varchar(255) NOT NULL COMMENT '配置数据',
  `key6` varchar(255) NOT NULL COMMENT '配置数据'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `setting`
--

INSERT INTO `setting` (`id`, `value`, `key1`, `key2`, `key3`, `key4`, `key5`, `key6`) VALUES
(1, 'basic', '1009465756', 'Google Inc.', 'Google Inc. 是一家位于美国的跨国科技企业，业务包括Google搜索、Google Chrome、Andriod等。Google非常重视安全生态的建设，希望通过建立安全应急响应中心邀请安全专家完善生态。', '&lt;script&gt;百度统计&lt;/script&gt;', '1009465756', '© Google 2017-2018 Powered by: SRCMS');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hall`
--
ALTER TABLE `hall`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`) USING BTREE,
  ADD KEY `password` (`password`) USING BTREE;

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cate_id` (`cate_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `record`
--
ALTER TABLE `record`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id`),
  ADD KEY `key` (`key2`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '博客ID',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT COMMENT '评论编号',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '奖品ID',AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `manager`
--
ALTER TABLE `manager`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID';
--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '特殊页面ID';
--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '订单编号',AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `record`
--
ALTER TABLE `record`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT COMMENT '操作ID',AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置编号',AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
