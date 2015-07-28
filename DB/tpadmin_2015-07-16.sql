# ************************************************************
# Sequel Pro SQL dump
# Version 4135
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.42)
# Database: tpadmin
# Generation Time: 2015-07-16 13:12:58 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;



CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL COMMENT '父分类ID',
  `name` varchar(20) DEFAULT NULL COMMENT '分类别名',
  `title` varchar(100) DEFAULT NULL COMMENT '分类标题',
  `keywords` varchar(255) DEFAULT NULL COMMENT '分类关键词',
  `description` varchar(255) DEFAULT NULL COMMENT '分类描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;

INSERT INTO `category` (`id`, `pid`, `name`, `title`, `keywords`, `description`)
VALUES
	(1,0,'default','默认分类','默认分类','默认分类描述'),
	(2,0,'biancheng','编程技术','',''),
	(3,0,'system','操作系统','',''),
	(4,0,'news','业界新闻','',''),
	(5,0,'jianzhan','建站教程','',''),
	(6,2,'html','HTML','',''),
	(7,2,'css','CSS','',''),
	(8,2,'php','PHP','',''),
	(9,5,'discuz','Discuz','',''),
	(10,5,'wordpress','wordpress','',''),
	(11,3,'macos','Mac OS','',''),
	(12,3,'linux','Linux','',''),
	(13,7,'css2','CSS2','',''),
	(14,7,'css3','CSS3','','');

/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;


CREATE TABLE `links` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `sort` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;

INSERT INTO `links` (`id`, `title`, `url`, `sort`)
VALUES
	(1,'安全者','http://www.cnsecer.com',100);

/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;



CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `create_at` varchar(11) DEFAULT '0',
  `update_at` varchar(11) DEFAULT '0',
  `login_ip` varchar(20) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '0:禁止登陆 1:正常',
  `type` tinyint(1) DEFAULT '1' COMMENT '1:前台用户 2:管理员 ',
  PRIMARY KEY (`id`),
  KEY `username` (`username`) USING BTREE,
  KEY `password` (`password`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;

INSERT INTO `member` (`id`, `username`, `email`, `password`, `avatar`, `create_at`, `update_at`, `login_ip`, `status`, `type`)
VALUES
	(1,'admin','515343908@qq.com','21232f297a57a5a743894a0e4a801fc3',NULL,'1436679338','1436935104','0.0.0.0',1,2);

/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;



CREATE TABLE `member_oauth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `qq` varchar(100) DEFAULT NULL COMMENT 'QQ openid',
  `sina` varchar(100) DEFAULT NULL COMMENT 'sina openid',
  `github` varchar(100) DEFAULT NULL COMMENT 'github openid',
  `member_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;

INSERT INTO `page` (`id`, `title`, `name`, `content`)
VALUES
	(1,'关于我们','about','&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;关于我们&lt;/p&gt;&lt;p&gt;关于我们&lt;/p&gt;&lt;p&gt;关于我们&lt;/p&gt;'),
	(2,'联系我们','contact','&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;&lt;p&gt;联系我们&lt;/p&gt;');

/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;



CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` text,
  `time` varchar(11) DEFAULT '0',
  `cate_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1' COMMENT '1:普通,2:置顶,3:热门,4:推荐',
  PRIMARY KEY (`id`),
  KEY `cate_id` (`cate_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;

INSERT INTO `post` (`id`, `title`, `content`, `time`, `cate_id`, `user_id`, `type`)
VALUES
	(1,'数据验证有两种方式','&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;color: rgb(64, 64, 64); font-family: 微软雅黑; line-height: 27.2000007629395px; background-color: rgb(255, 255, 255);&quot;&gt;自动验证是ThinkPHP模型层提供的一种数据验证方法，可以在使用create创建数据对象的时候自动进行数据验证。&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;color: rgb(64, 64, 64); font-family: 微软雅黑; line-height: 27.2000007629395px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 8px 0px; color: rgb(64, 64, 64); font-family: 微软雅黑; line-height: 27.2000007629395px; background-color: rgb(255, 255, 255);&quot;&gt;数据验证可以进行数据类型、业务规则、安全判断等方面的验证操作。&lt;/p&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 8px 0px; color: rgb(64, 64, 64); font-family: 微软雅黑; line-height: 27.2000007629395px; background-color: rgb(255, 255, 255);&quot;&gt;数据验证有两种方式：&lt;/p&gt;&lt;ol class=&quot; list-paddingleft-2&quot; style=&quot;width: 939.546875px; padding: 0px 0px 0px 20px; white-space: normal; color: rgb(64, 64, 64); font-family: 微软雅黑; line-height: 27.2000007629395px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;li&gt;&lt;p&gt;静态方式：在模型类里面通过$_validate属性定义验证规则。&lt;/p&gt;&lt;/li&gt;&lt;li&gt;&lt;p&gt;动态方式：使用模型类的validate方法动态创建自动验证规则。&lt;/p&gt;&lt;/li&gt;&lt;/ol&gt;&lt;p style=&quot;margin-top: 0px; margin-bottom: 0px; white-space: normal; padding: 8px 0px; color: rgb(64, 64, 64); font-family: 微软雅黑; line-height: 27.2000007629395px; background-color: rgb(255, 255, 255);&quot;&gt;无论是什么方式，验证规则的定义是统一的规则，定义格式为：&lt;/p&gt;&lt;p style=&quot;white-space: normal;&quot;&gt;&lt;span style=&quot;color: rgb(64, 64, 64); font-family: 微软雅黑; line-height: 27.2000007629395px; background-color: rgb(255, 255, 255);&quot;&gt;&lt;br/&gt;&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430370526',2,1,1),
	(2,'万死一生，社交APP如何与微信巨鲸共舞？','&lt;p&gt;&lt;img src=&quot;http://upload.chinaz.com/2015/0501/1430470223153.jpg?1.3189642713405192&quot; border=&quot;0&quot; alt=&quot;产品运营  社交APP 微信&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;众所周知，微信是最强悍的社交APP杀手，是每一个社交创业者都不能忽视的对手。&lt;/p&gt;&lt;p&gt;社交APP与其他高频应用（如IM、阅读）的竞争，本质就是时间和习惯的划分。社交APP要想生存，必须稳定地占据用户一定的习惯和时间，要想完成这种切分，只有持续稳定地提供独有的、不可替代的社交红利——高价值的信息、高价值的人脉、高价值的心理体验（虚荣心、归属感、表达欲、异性碰撞等）。&lt;/p&gt;&lt;p&gt;“社交红利=本平台在主攻领域的社交价值-其他平台在同领域的社交价值”&lt;/p&gt;&lt;p&gt;微信的可怕之处在于，作为公式中的“其他平台”，其强大到极致的产品设计和业已形成的用户基础，可以轻易替代甚至超过大多数社交APP的“核心价值”，即便有差距，也完全可以用其他方面的优势去弥补，这样一来用户就很难因为你提供的一点独有红利就形成稳定归属。当微信像海绵一样吸取了用户所有的时间，你的社交APP也就岌岌可危了。微信就像是“三体星来客”，强IM的高频打击如同“水滴”，强关系链封锁如同“智子”，它一口气抬高了几乎所有社交APP的用户获取和留存成本，使每一个社交APP从上线之初就要面对两大绞索：&lt;/p&gt;&lt;p&gt;1、我有微信了，为什么还要下载你的APP？&lt;/p&gt;&lt;p&gt;2、在你的APP找到新朋友了——来，我们加微信聊吧。&lt;/p&gt;&lt;p&gt;很多APP就此沦为微信的“新朋友获取平台”，之所以会这样，从用户心理的角度无非是：&lt;/p&gt;&lt;p&gt;1、懒惰：在高度碎片化、快节奏的移动互联网时代，人们喜欢“集约”，懒于“兼顾”，倾向于把所有愿意维持稳定关系的好友集中到一个平台上，自然是微信了。&lt;/p&gt;&lt;p&gt;2、恐惧：在社交APP层出不穷的时代，人们的尝试多半是“尝鲜”，他们也不知道自己会用多久，亦或这个APP本身能活多久，于是会说，你的微信号是多少？&lt;/p&gt;&lt;p&gt;3、习惯：在日常社交场合，问微信号已经成为一种标配，加微信是比互留手机号更安全的选择，更不易被打扰，还省了话费。在社交APP上互留微信号同样具有礼仪意义，即意味着我不再把你当普通网友，我的朋友圈已经开始接纳你了。&lt;/p&gt;&lt;p&gt;在此，菜狗并不想用常见的强弱关系、私密社交去界定微信。因为事实上，究竟把微信作为强关系沟通工具，还是当成微博，每个人的用法各不相同。但可以肯定的是，一旦两人的关系升级到“持久稳定”阶段，使用微信交流取代原有社交APP就成为大概率事件。&lt;/p&gt;&lt;p&gt;微信就是移动互联网时代的通信录，微信号就是这个时代的电话号码，每个人的主页都是他的名片。面对如此可怕的巨鲸，社交领域的虾米们该如何战战兢兢地生存呢？在此，野路子产品菜狗梳理了几种“幸存之道”，权当抛砖引玉。&lt;/p&gt;&lt;p&gt;战略层：避开攻击半径、实施绝对的差异化&lt;/p&gt;&lt;p&gt;在野路子产品菜狗的第一篇了，我列举了社交APP常见的18种经典死法，这是你首先必须避开的，要避免“产品逻辑和商业模式上明显的漏洞”，否则就是作死。但这远远不够，你必须首先避开微信三体舰队的攻击半径。&lt;/p&gt;&lt;p&gt;中国产品人最大的毛病就是爱做“山寨+加法”，你微信牛逼是吧，我就搞一个微信加陌陌加无秘加比邻。你IM厉害是吧，我就搞一个比你还厉害的IM，这样的战略腾讯屡试不爽，但对于腾讯的对手，则完全是另一回事。&lt;/p&gt;&lt;p&gt;菜狗曾就职中国电信，亲眼目睹易信的发展史。尽管从诞生之初这款APP就被寄予厚望，但你看她刚问世的卖点：流量更便宜、语音质量更高、更安全私密、电信背景……这是一个典型“加法”逻辑的产物，一切都只是寻求“更好”，本质仍然是另一个微信，既切不到用户独有的需求，也谈不上抢占用户的心智。&lt;/p&gt;&lt;p&gt;大多数情况下，加法战略不仅没办法抓住用户的需求，还常常会使产品变重、加大他们的交互成本。这还不是最可怕的，如果你的加法恰好是正确的，那么也就进入了微信舰队的攻击半径。&lt;/p&gt;&lt;p&gt;所谓攻击半径，即是微信的“可能迭代区域”，一方面微信自己可以很轻松地做加法，另一方面不会破坏原有的产品逻辑架构和体验习惯。你要相信，微信有这个国家最强大的产品和技术团队，他们专业、迅猛、追求极致，被荣耀感和归属感包围。如果不幸你用自己的努力验证了想法、教育了市场，他们将迅速跟进，并且几乎一定会比你迭得更好。&lt;/p&gt;&lt;p&gt;好不容易刚刚有起色，你踌躇满志，这时消息出来：腾讯也做了……&lt;/p&gt;&lt;p&gt;所以，你要寻求的是绝对的差异化，即如同Snapchat对Facebook，两者产品逻辑完全不同，后者不可能迭代跟进，这不是什么资源或执行力的护城河，而是基于产品逻辑的“结构壁垒”。商业博弈的核心是差异化，对于微信我们要做的不是颠覆，而是聚焦用户需求的“空挡”（特别是年轻一代用户），通过差异化提供独有的价值，重新划分用户的时间和习惯——只要抢到稳定的一小块即可。你不可能做得更好，但你可以做到五个层次的差异化。&lt;/p&gt;&lt;p&gt;战术层：“差异化”的五个思考面&lt;/p&gt;&lt;p&gt;（一）不同逻辑的信息流&lt;/p&gt;&lt;p&gt;1、描述&lt;/p&gt;&lt;p&gt;本文讲的信息流（new feeds）特指Facebook、微博、微信朋友圈这样的动态页面。我们知道，信息流是一个“社交广场”，其本质是不断呈现你关心的、有意思的人和信息，不仅是各种碎片时间打发无聊的首选，也常常是一个用户与世界保持“心理连接”的手段，每天刷刷朋友圈，感觉我还在圈子里，我不是孤独的。&lt;/p&gt;&lt;p&gt;微信首先是一个高频IM工具，其朋友圈具有三个显著特点：基于封闭关系链、分享成本低于UGC成本、弱筛选弱组织。突破口就在于此，信息流的本质是信息的碎片化和自组织，你可以完全重建其中的“粉碎包装”逻辑和“自组织”逻辑，从而搭建出一个完全不同的信息流体系。归根结底，信息流的价值其实是使用户稳定地保持对一个圈子、虚拟王国的连接，用这个圈子的各种信息和互动填补他们空虚的内心和微弱的存在感，而你要做的是让自己营造的圈子和王国更加独特和聚焦，无法被微信替代。&lt;/p&gt;&lt;p&gt;2、可选项&lt;/p&gt;&lt;p&gt;A、在关系链上做文章，如采用半开放的关系链，能看到更多新朋友（半熟、弱关系）的信息。&lt;/p&gt;&lt;p&gt;举例：在脉脉这款产品中，信息流可以基于“二度人脉”呈现，用户可以看见“好友的好友”的信息，同时由于产品特殊的“定位”，大家都在聊工作的事情，所以这些“二度人脉”及信息往往具有对实际工作显著的价值。在陌陌6.0中，信息流按照“附近”、“相似标签”排布，使其成为一个发现“有共同话题的新朋友”的利器。&lt;/p&gt;&lt;p&gt;B、在信息形式上做文章，如匿名信息、问答信息、活动信息、垂直圈子信息。&lt;/p&gt;&lt;p&gt;举例：尽管Secret已经倒下，无秘类却依然坚强生存，基于熟人的匿名信息提供了和朋友圈完全不同的“情境和生态”。而insta等图片社交应用，带来的则是一个纯粹、高逼格的视觉空间。&lt;/p&gt;&lt;p&gt;C、在信息组织分发模式上做文章，如提升用户的再组织参与感（转发、点赞等），如通过更严格的筛选过滤机制遏制信息“噪音”。&lt;/p&gt;&lt;p&gt;举例：尽管今天的微博已经沦为“垃圾场”，但是其强大的信息传递和公众自组织能力依然令人印象深刻，转发就是声援，转发就是参与，转发就是态度，转发可以成为一次公共事件。&lt;/p&gt;&lt;p&gt;（二）不同体验的IM&lt;/p&gt;&lt;p&gt;1、描述&lt;/p&gt;&lt;p&gt;IM是腾讯系的当家门面，从QQ到微信，在这一领域的优势使他们先后掌控了两个时代的人流入口。至少从目前来看，微信的IM交互模式最符合用户习惯，且体验最佳。从这一点去取得巨大突破几乎是不可能的，不过你可以效法Snapchat类，做一套完全不同的IM，给年轻新潮的用户留下深刻印象。&lt;/p&gt;&lt;p&gt;2、可选项&lt;/p&gt;&lt;p&gt;A、完全不同的通讯介质，比如拍照互动、视频互动、声音互动。&lt;/p&gt;&lt;p&gt;伴随着流量价格的降低、网络的提速、无线城市的实现，未来的IM通讯中将有更加丰富的形式呈现。在目前的微信使用中，文字交流是主要手段，图片多用于炫耀，声音则用在文字较多、懒得打字的繁忙场景。而未来的交流，将可能在“更丰富的内容、更高的效率、更安全的体验”三者中选择其一予以突破。&lt;/p&gt;&lt;p&gt;举例：Snapchat类应用在国内的推广并不顺畅，但确实提供了一种全新的思路：用拍照行为迅速高效地互动。菜狗曾长期使用Biu这款应用，尽管如今产品已经成“搞怪GIF集中营”，但在此前确实能感到拍照互动是一种很炫酷很迅速的体验。&lt;/p&gt;&lt;p&gt;B、完全不同的通讯“视觉”，带给人不一样的体验。&lt;/p&gt;&lt;p&gt;举例：很多年轻人更喜欢使用手Q进行交互，除了关系链的沉淀和区分，还有一个很重要的原因是手Q的聊天界面更轻松有趣个性化，符合年轻一代的审美。而在去年，一款叫做Wire的应用引起了大家广泛的关注，不论产品是否成功，其很有sense的聊天界面、更加纯粹的聊天体验成了人们热议的对象。&lt;/p&gt;&lt;p&gt;C、找到一些微信无法（难以）交互和传播的东西。&lt;/p&gt;&lt;p&gt;举例：还是要提一下Snapchat了，我曾经问过很多留学的朋友他们为何用这款应用，答案常常是“避免酒醉了以后乱传照片”。毫无疑问，Snapchat可以传播一些不方便在公共APP上传播、且无法导出的内容。&lt;/p&gt;&lt;p&gt;D、以上选项都必须反复测算交互成本，验证用户习惯，否则很可能“十个创新九个坑”。&lt;/p&gt;&lt;p&gt;举例：Blink是一款非常酷的产品，但是太酷了，其中的交互逻辑要用一段短视频来教，大家还是用不惯。&lt;/p&gt;&lt;p&gt;（三）独有的切点和功能&lt;/p&gt;&lt;p&gt;1、描述&lt;/p&gt;&lt;p&gt;回顾微信发展的历程，除了IM和信息流这样的标配，更加夺人眼球的一个个差异化功能，从最早的QQ离线消息、语音通话，到摇一摇、附近的人，再到公众号、扫一扫，再到今天的支付、链接一切，几乎每一招都能碰到用户的“G点”，这使它从最早的米聊、go短信中脱颖而出，又将后来的来往、易信压制得死死的。&lt;/p&gt;&lt;p&gt;可见，今天的社交APP要想占住用户习惯中的一亩三分地，独特的、不可替代的、高频功能必不可少。不论你的市场多么庞大，都要选好一个切点，通过功能和玩法的设计提供一个独有的价值，从而闷着头迅速进入市场、抢占桥头堡。&lt;/p&gt;&lt;p&gt;2、可选项&lt;/p&gt;&lt;p&gt;A、找一个用户多、门槛低、场景明确、使用频次高的切点。&lt;/p&gt;&lt;p&gt;举例：大姨吗本身就是一个非常明确的点，用户需求的明确、集中，导致女孩们在这里讨论的事情也羞羞的不好在外头讲了；超级课程表瞄准的是大学生的一个痛点（笔者大学四年都没弄清楚自己课程的教室），再围绕这个点切大学生相关的社交和需求（纸飞机）；抱抱是一款关系触发、破冰非常容易的应用，每一个心情倾诉表达都会变成漂流瓶，触发内心蠢蠢欲动的男生们的跟进。&lt;/p&gt;&lt;p&gt;B、如果一定要细分，要定位“小众”，那么至少找一个“毛利高”的切点。&lt;/p&gt;&lt;p&gt;举例：这种策略常常出现在一些“高端交友”平台上，人少不是他们的弱点，反而是他们刻意营造的优势，平台的创建者满心欢喜地认为，只要绑定这帮土肥圆高富帅，那么钱怎么都是花花地来。&lt;/p&gt;&lt;p&gt;C、切点本身是“爆点”，具备自发传播的价值。&lt;/p&gt;&lt;p&gt;举例：不论大家如何评价脸萌、足记这样的产品，短期爆红的巨大好处都是可以以别人低得多的成本获取用户，有了这么多的用户，什么故事不好说？然而，如果功能矩阵没设计好，除了这个爆点再无纵深，则他们“留存用户的成本”可能也将比别人高得多。&lt;/p&gt;&lt;p&gt;D、建立独有的“无法导出、无法迁移的”内容，要么不方便互留微信号，要么只有基于这个APP才能看到一些特有的个性痕迹、作品、“纪念碑”。&lt;/p&gt;&lt;p&gt;举例：陌陌就是这样一个独特的应用，特别是以前的陌陌，有时候你加了一些好友、会因为一些特殊的原因不方便互留微信号，你懂的。而情侣社交微爱、小恩爱都视图让情侣们在上面建立一个“独特的两人空间”，只要你没分手，你敢删吗？就算分手了，你舍得删吗？&lt;/p&gt;&lt;p&gt;5、发挥你的想象力，IM和信息流是不是就是最好的模式？还有没有更好的选择？要知道，在Facebook推出来前，我们都是在QQ、个人主页、BBS和聊天室社交的。&lt;/p&gt;&lt;p&gt;举例：发挥你的想象力，也许你就是下一个扎克伯格！&lt;/p&gt;&lt;p&gt;（四）另辟蹊径的产品逻辑和商业模式&lt;/p&gt;&lt;p&gt;1、描述&lt;/p&gt;&lt;p&gt;OK，现在你在以上三个层面都有了不同程度的创新，那么现在问题是——怎么把他们整合起来呢？怎么区分优先级呢？首屏放什么呢？商业模式是什么呢？这样一个动态的逻辑体系就是你的产品逻辑和商业模式——你的玩法。&lt;/p&gt;&lt;p&gt;2、可选项&lt;/p&gt;&lt;p&gt;A、不论怎么设计，一定要理清产品的逻辑，让产品更清晰，尽一切可能降低用户交互的成本。&lt;/p&gt;&lt;p&gt;描述：YO、几度、Same这样的应用出现都是一种“极端”，即尽可能地将产品轻量化，使用户形成完全不同的体验，轻量化的应用更多用于打发时间，而非关系沉淀。你未必要那么极端，但是不论精心设计了多少功能，都必须想清楚如何把他们“合起来”，最low的办法是直接送给用户一个“九宫格”，打开一次就得做一次选择题。而陌陌6.0在设计时将原先主打的附近“刷脸”和群组放到二级菜单，和当年微信逐步降低“附近的人”重要性如出一辙，背后都是代表了公司的战略方向和定位迁移。&lt;/p&gt;&lt;p&gt;反面教材：新浪微博在最初的几年里，始终无法使信息流和IM之间自如切换，结果出现了某官员约炮错把评论当IM结果大白天下的情况。人人网号称要打造SMS，但其IM的体验之差直到14年才有所改善。&lt;/p&gt;&lt;p&gt;B、小店连锁、逐步扩张，对接“来钱更快的”领域，打造标准化产品，在不影响用户体验的情况下尽早盈利，争取资本的亲睐。&lt;/p&gt;&lt;p&gt;举例：常规的社交APP思路是“商业地产模式”，前期狠命砸钱把人气搞起来，后期想办法赚大。但是现在出现了请吃饭、美丽约、pp语音、猫呼等应用，可以通过付点小钱迅速满足某类社交体验（你懂的），这就是社交领域的“小店连锁”模式，先开个小店，成本低、现金快，盈利路径清晰，缺点一是可持续性不高、易被替代，二是天花板来得早、爆发性增长空间不足。但如果你想占着一亩三分地闷声发大财，这确实是个不错的选择。&lt;/p&gt;&lt;p&gt;（五）独有的场景和心理&lt;/p&gt;&lt;p&gt;1、描述&lt;/p&gt;&lt;p&gt;正如开头所说，社交APP生存的关键是对用户习惯和时间的切分，要满足这一点，最后的核心一定是找到了“独特的场景”和“对应的价值”。微信不可能是万能的，在维持熟人关系、效率沟通、观看熟人圈资讯等领域确实优势巨大，但是如此错综复杂的人性，可不止这样一些场景。也许在短期内，微信可以满足各种场景的需求，但你要找准他的薄弱场景，尽快咬下一块——一块即可。&lt;/p&gt;&lt;p&gt;2、可选项&lt;/p&gt;&lt;p&gt;A、寻找微信场景的边界。&lt;/p&gt;&lt;p&gt;举例：伴随着微信好友的激增，人们在熟人云集的朋友圈越来越不敢“说真话”，而无秘的产生恰好满足了这一“场景的空档”。&lt;/p&gt;&lt;p&gt;每个人心中都想有一个小黑屋，能在里面肆意地宣泄、偷偷的窥伺，这样的场景需求时不时地出现，于是无秘来了。 同样因为微信好友越来越多，人多嘴杂，这里越来越不适合讨论一些“严谨的高逼格问题”，可人们依然希望有这样的场景，这时知乎和脉脉出现了，要从微信的口中抢专业和工作的场景。 有时人们喜欢参与公众事件，感觉自身的存在及与社会的连接，这时奄奄一息的微博又出现了，“人人当记者、屌丝能发声”一个不错的场景。&lt;/p&gt;&lt;p&gt;B、独特的场景往往对应独特的人群或者人群的独特面，能提供独特的价值。&lt;/p&gt;&lt;p&gt;举例：运动社交正在崛起，你的跑步、羽毛球、健身是不是想和人分享炫耀啊？哎呀菜狗那个胖子不感冒，但是现在有了运动社交APP，都是志同道合之人咯。同性恋社交风起云涌，可以想象，基友们最想遇到的人群就集中在那里。女性社区开始抬头，本来就喜欢拉着闺蜜说八卦的女孩子有去处了，这里女生们是主，男人都是仆。&lt;/p&gt;&lt;p&gt;结语&lt;/p&gt;&lt;p&gt;社交领域与其他互联网领域最大的不同在于，这是一个“不太容易看明白”的领域，即便今天列了这么多的战略战术，但充其量也只是思考方向。&lt;/p&gt;&lt;p&gt;“不太容易看明白”即意味着，往往砸钱玩命运营也没用，执行力高也没用，明星团队也没用，照抄国外也没用……产品没有聚焦用户、切中需求、不断迭代，则一切表面暂时的成效都经不起时间的检验，易信用户突破1个亿又怎样呢？这是一个产品绝对说话的领域，这是一个战略聪明远比战术勤奋重要的多的领域，这是一个对人性的洞察远胜于团队是不是海归3BAT的领域。而这一点，也正是给很多草根创业者们的福音，不像O2O对资源和团队的依赖，屌丝的你也有机会。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544331',1,1,1),
	(3,'为了逆袭苹果 微软正在拿命做一场豪赌','&lt;p&gt;&lt;img src=&quot;http://upload.chinaz.com/2015/0501/1430471371537.jpg?0.7032066211104393&quot; border=&quot;0&quot; alt=&quot;微软 苹果公司&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;一年一度的微软全球开发者大会29日在旧金山如期举行，尽管和往年一样，今年的大会依然人声鼎沸、热闹非凡，但昔日的软件巨头微软，正在这样的喧闹背后进行一场巨大的赌注，筹码是微软的前途命运。&lt;/p&gt;&lt;p&gt;与会的成千上万名开发者中，使用苹果电脑、iPhone手机和安卓手机的开发者不计其数，在微软开发者大会苦心布置的Windows“生态丛林”中，竟没有丝毫的违和感，这是微软不得不接受的残酷现实，往日依靠操作系统称霸行业的黄金岁月早已一去不返，微软无奈地发现：人们的注意力早已从大屏幕的PC转移到小屏幕的手机和平板，占据人们日常生活最多时间的是“愤怒的小鸟”和“谷歌地图”，在这样的环境下，微软该怎么办？&lt;/p&gt;&lt;p&gt;今年的开发者大会，微软向外界给出了部分答案：打通内外部的一切平台。以Windows10为核心，辅助云概念，微软实现一切Windows设备无缝衔接，在Windows电脑上显示的内容，无论在Windows手机还是平板上，甚至是xbox上也好，也能得到完美呈现。另外，微软还苦心打造多款开发者工具，对广大开发者说，你看，用这些工具，可以很容易地把你的成功的iOS和安卓上的应用，移植到Windows上来。什么？你说你用的是苹果电脑或者运行Linux系统的电脑？那也没关系，我们还为你提供了可以在上述系统上运行的开发工具来开发Windows上的应用。&lt;/p&gt;&lt;p&gt;上述努力能否成功，现在还不得而知，这是微软一次压上前途命运的赌注，除此以外，微软还将赌注压在了云计算和虚拟现实技术上，Windows&amp;nbsp;Azure云技术目前市场份额仅为亚马逊的十分之一，但增长迅速，有望实现弯道超车。虚拟现实HoloLens设备在开发者大会上的再度惊艳亮相，让人们有理由相信，微软或许能在下一轮变革中占到先机，但这场变革何时到来，甚至会不会到来，却没有人知道答案。&lt;/p&gt;&lt;p&gt;微软欲打通一切平台&lt;/p&gt;&lt;p&gt;在今年的微软开发者大会上，微软欲打通一切平台的意图愈加明显，具体的路径包括两个方面，一是通过向大量的iOS和安卓应用开发者发布开发工具，帮助他们将已经在iOS和安卓上十分受欢迎的应用快速、便捷地移植到Windows平台上，另一方面，是提供能够在MacOS或Linux等操作系统上运行的程序开发工具，让习惯于在这些平台上进行应用开发的开发者，在非Windows系统上，也能开发基于Window的应用。&lt;/p&gt;&lt;p&gt;以上第一种路径主要通过微软的应用开发利器—Visual&amp;nbsp;Studio&amp;nbsp;2015来实现。在此次开发者大会上，微软发布的Visual&amp;nbsp;Studio&amp;nbsp;2015中的新工具，可以实现让开发者“循环利用几乎所有的安卓应用的Java和C++代码，并开发用于运行Windows&amp;nbsp;10的手机的应用”。例如King公司的热门游戏“糖果传奇”就是通过这一新工具，由iOS平台和安卓平台移植到Windows平台上。&lt;/p&gt;&lt;p&gt;第二种路径主要通过轻量化的Visual&amp;nbsp;Studio&amp;nbsp;Code这一代码编辑器来实现，虽然目前该编辑器仅有预览版，但却是微软首次真正实现在Windows平台以外，为开发者提供应用开发工具，通过Visual&amp;nbsp;Studio&amp;nbsp;Code，开发者能够在苹果的MacOS平台或Linux平台实现应用开发。&lt;/p&gt;&lt;p&gt;微软开发者部门副总裁索曼赛加（Somasegar）说，“许多开发者用Windows系统作为开发环境，但我们也看到许多人用Linux和苹果的Mac系统，我们希望他们保持这一习惯而不是让他们转移到Windows平台环境中来。”&lt;/p&gt;&lt;p&gt;以上一系列便利开发者的措施，实际上都是为了解决Windows平台应用不足的尴尬，这些都是微软在目前行业环境下的妥协之举。截至今年2月份，苹果应用商店的应用已经多达140万，Google&amp;nbsp;Play中安卓平台的应用数量也在同一量级，这两者均属于移动应用的第一阵营，与此相比，基于Windows平台的应用数量仅有可怜的30万。&lt;/p&gt;&lt;p&gt;在微软首席执行官纳德拉提出的微软“云为先、移动为先”的战略下，解决目前应用数量偏少是“移动为先”破局的当务之急。&lt;/p&gt;&lt;p&gt;除了打通各桌面终端平台的“连横”以外，微软还加强了微软自身各平台之间的“无缝连接”，在当天的主旨演讲环节，微软操作系统副总裁泰瑞•&amp;nbsp;梅尔森（Terry&amp;nbsp;Myerson）演示了几款基于Windows10的横跨PC和手机端的应用，包括USA&amp;nbsp;Today新闻应用，微信社交聊天应用等，从展示效果来看，这几款应用均实现了在电脑端和手机端的流畅衔接，通过云技术的应用，用户可以实现这些应用在电脑和手机端的信息同步，同时这些应用通过“Continuum”也将自动适应电脑和手机的不同尺寸的屏幕。USA&amp;nbsp;Today上的视频内容也可以在微软的游戏主机—Xbox上进行播放。&lt;/p&gt;&lt;p&gt;但微软的这一努力能否奏效，依然存在很多的不确定性。如前文所述，微软吸引开发者在不同平台上开发基于Windows平台的应用，以及让开发者更容易地将其他平台的应用移植到Windows平台上，所有这些都是微软基于目前行业环境的无奈之举，微软早已过了软件时代靠操作系统一统天下的时代，在互联网时代，尤其是移动互联网时代，微软眼看着谷歌、苹果等后起之秀，开始形成自己的平台和生态圈，在移动设备大行其道的当下，应用而非软件的概念愈加深入人心。尽管微软为了适应外部行业环境的变化，已经在做出调整，但无奈“大象难起舞”的症结还是让微软在移动互联网时代明显落后于对手。&lt;/p&gt;&lt;p&gt;在打通了自身和不同平台后，微软的境况或许会发生以下变化：越来越多的开发者会首先在苹果和安卓平台试水，然后再兼顾Windows平台，而非将Windows平台上的开发作为优先考虑，但这样做或许能够拉近Windows平台上的应用数量和另两大平台的差距，让微软重回第一阵营，前提是运行微软系统的终端在市场上足够多，微软在本次开发者大会上已经给出中期目标，在未来两到三年实现运行Windows10的设备超过10亿台，如果这一目标得以实现，将使得微软鼓励开发者更多地开发Windows应用更加有说服力。&lt;/p&gt;&lt;p&gt;与会的开发者对微软的新的战略转变表达了乐观的看法。一位来自挪威的开发者对腾讯科技表示，对微软打通各个平台的做法“谨慎乐观”，对于开发者来说，使用微软提供的各种工具将使得为微软开发应用变得更加容易。&lt;/p&gt;&lt;p&gt;致力于智能硬件的Dataart公司首席架构官Sergey&amp;nbsp;Demyanov对腾讯科技表示，开发者并不讨厌微软，微软的市场份额摆在那里，没有人能够忽视，对于iOS和安卓应用的开发者来说，现在可以将代码稍作修改便移植到Windows平台上，何乐而不为呢。&lt;/p&gt;&lt;p&gt;为开发者提供代码调试服务的CodeValue公司架构官Yaniv&amp;nbsp;Yosifovich也表达了类似的观点，他认为对于开发者来说，最重要的是平台上的用户数和活跃度，这些能够给开发者带来实实在在的收入，微软打通自身各个设备的做法，将使得用户的基数更为庞大，这些都将鼓励开发者更多地进行Windows平台上的应用开发。&lt;/p&gt;&lt;p&gt;“云”图大略和虚拟现实&lt;/p&gt;&lt;p&gt;另一个让微软寄予厚望的业务是云计算，从5年前提出Windows&amp;nbsp;Azure概念以来，微软在云计算领域紧追亚马逊，但市场份额仅为后者的十分之一。&lt;/p&gt;&lt;p&gt;微软首席执行官在29日的开发者大会主旨演讲环节透露，到2018财年，微软的商业云计算部门收入将达到200亿美元，目前这部分的收入为63亿美元，这也就意味着在未来的9个季度中需要增加近140亿美元收入。&lt;/p&gt;&lt;p&gt;目前，该部分收入增速迅猛，根据微软最新公布的财报，商业云业务在第三财季同比增速超过100%。&lt;/p&gt;&lt;p&gt;在本次开发者大会上，Azure首席技术官马克•拉西诺维奇（Mark&amp;nbsp;Russinovich）亲自讲解并演示Azure的应用功能，并强调微软的Azure与亚马逊云计算相比，能够提供给用户更多不同的选择。&lt;/p&gt;&lt;p&gt;在今年的开发者大会上，微软的虚拟现实设备HoloLens再度以令人惊叹的方式亮相，与最初亮相时相比，HoloLens的功能得到进一步扩展，从演示的场景来看，至少在医疗和机器人领域，都能够得到应用。&lt;/p&gt;&lt;p&gt;虚拟现实和增强现实，是行业中还未形成明显格局的为数不多的领域之一。从目前已知的信息来看，微软的HoloLens无论在应用的广泛性、功能的实用性还是技术的完善性方面，已经取得了部分领先，在移动互联网时代，微软暂时落后，但如果未来人类进入新的生活方式，不再依赖手机，而是使用虚拟或增强现实设备，那么微软则有望再度把握先机。但这一天何时会到来，甚至是否会到来，还是个很大的未知数。&lt;/p&gt;&lt;p&gt;收藏文章分享文章&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544365',1,1,1),
	(4,'工信部曝光82款问题软件，腾讯新闻、酷我音乐榜上有名','&lt;p&gt;&lt;img src=&quot;/Public/upload/image/201505/1430544402893267.jpg&quot; border=&quot;0&quot; width=&quot;&quot; alt=&quot;APP&quot; title=&quot;APP&quot; height=&quot;&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;【王玄/钛媒编辑】工信部日前公布的电信服务质量通报显示，一季度工信部组织对40家手机应用商店架上软件进行检测，发现存在问题的应用软件82款，涉及违规收集用户个人信息、恶意“吸费”、软件自动向外发送短信、强行捆绑推广其他无关应用软件等问题。&lt;/p&gt;&lt;p&gt;其中，强行捆绑推广其他无关应用软件的问题软件数量最多，腾讯新闻、酷我音乐、百度手机助手、航班助手均属于此类；未经用户同意，收集、使用用户个人信息的问题软件中，有彩票直通车、车托邦等；用户不知情的情况下，自动向外发送短信的问题软件中，清理大师、eCall榜上有名。&lt;/p&gt;&lt;p&gt;近日还有用户投诉，滴滴打车等软件被指注册审核存在漏洞。用户用该软件叫车，结果来的是黑车，举报后还接到黑车司机20多次恐怖和威胁的电话。&lt;/p&gt;&lt;p&gt;工信部对软件市场的监管从2013年开始大力加强，钛媒体《大刀挥向恶意软件，斩不断理还乱》一文曾有详细报道。2014年8月工信部曾曝光44款问题软件，沪江英语、安卓壁纸、找你妹都在名单内。此次数据公布后，工信部提醒用户：在通过互联网方式进行移动支付、网络购物时，仔细核对相关信息，防止个人信息泄露及财产损失。&lt;/p&gt;&lt;p&gt;通告中公布的其他数据整理如下：&lt;/p&gt;&lt;p&gt;1、截至一季度末，全国电话用户总数达到15.39亿户，其中移动电话用户12.94亿户。&lt;/p&gt;&lt;p&gt;2、移动互联网接入流量消费继续快速增长，1-3月累计达7.64亿G，同比增长87.9%；月户均移动互联网接入流量达到295.1M。&lt;/p&gt;&lt;p&gt;3、有关电信服务的申诉为15903人次，收费争议方面的申诉占申诉总量的34.9%，用户服务方面的申诉占申诉总量的48.4%。&lt;/p&gt;&lt;p&gt;4、有效垃圾短信举报21030件次，其中，商业广告推销宣传，占举报总量的31.3%；涉嫌违法犯罪类，占举报总量的68.7%。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544405',1,1,2),
	(5,'21世纪网被责令停办 《理财周报》被吊销','&lt;p&gt;自中宣部、国家新闻出版广电总局等九部门印发通知，部署开展打击新闻敲诈和假新闻专项行动以来，各地各部门协调配合，严肃查办了一批新闻违法案件。4月30日，国家新闻出版广电总局向社会通报了对21世纪网、《理财周报》和《21世纪经济报道》新闻敲诈案件的行政处理情况，其中21世纪网被责令停办，《理财周报》被吊销出版许可证，《21世纪经济报道》被责令整顿。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Public/upload/image/201505/1430544422499686.jpg&quot; border=&quot;0&quot; alt=&quot;21世纪网被停办 理财周报被吊销&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;据国家新闻出版广电总局相关负责人介绍，2014年9月3日以来，21世纪网、《理财周报》和《21世纪经济报道》先后有多人被上海市公安机关采取强制措施，其中有21人被检察机关批准逮捕。案件发生后，国家新闻出版广电总局和广东省新闻出版广电局开展行政调查。经查：21世纪网和《理财周报》主要负责人勾结公关公司，指使新闻采编人员以对上市公司和拟上市公司负面报道相要挟，迫使相关企业签订广告认刊书、服务协议，谋取不正当利益。同时查明，21世纪网、《理财周报》和《21世纪经济报道》还存在采编和经营不分等违规问题。&lt;/p&gt;&lt;p&gt;据该负责人介绍，国家新闻出版广电总局在调查核实基础上，已于4月28日作出行政处理决定：吊销《理财周报》报纸出版许可证；广东省新闻出版广电行政管理机关协同有关部门依法撤销21世纪网许可证；对《21世纪经济报道》进行整顿，要求其全面加强该报领导班子建设，全面加强采编和经营管理，全面加强新闻从业人员管理。&lt;/p&gt;&lt;p&gt;国家新闻出版广电总局有关负责人指出，21世纪网等新闻敲诈案件在社会上造成了恶劣影响，严重损害了基层和群众切身利益，扰乱了市场和行业秩序，损害了新闻媒体公信力，败坏了新闻队伍形象。&lt;/p&gt;&lt;p&gt;该负责人强调，各新闻单位要引以为戒，举一反三，切实加强新闻采编管理。各主管主办单位要切实履行管理职责，建立健全机制，坚决纠正各类违法违规问题。各地新闻出版广电行政部门要继续深入开展打击新闻敲诈和假新闻专项工作，加大案件查办力度，限期挂牌督办一批重点案件，关停一批违规报刊单位，撤销一批违规记者站，吊销一批违规人员新闻记者证，对涉嫌违法犯罪的要移送司法机关追究刑事责任，对内外勾结、包庇纵容、失职渎职的要移送纪检监察部门追究党纪政纪责任。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544425',1,1,3),
	(6,'滴滴快的秀完恩爱就后院起火，屈服于资本的婚姻能走多远？','&lt;p&gt;&lt;img src=&quot;/Public/upload/image/201505/1430544446524279.jpg&quot; alt=&quot;滴滴快的合并 滴滴快的股权分配 滴滴快的合并问题&quot; border=&quot;0&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block; text-indent: 2em; text-align: center;&quot;/&gt;&lt;/p&gt;&lt;p&gt;从滴滴快的宣布合并的那一刻，围绕这一合并的质疑就没有停止过。一方面，合并刺激了市场上的各大竞争对手，专车、拼车、代驾等新业务向服务纵深发展，滴滴快的越来越无力像出租车市场一样去掌控；另一方面，合并后的业务融合、组织架构调整都存在诸多难题，特别是被寄予厚望的专车业务，在合并后的融合中遇到大量司机的抵制，如果再加上传闻中的部分投资人的套现退出意图逐渐显露，滴滴快的的这段姻缘很难得到众人的祝福。&lt;/p&gt;&lt;p&gt;仅有职能部门融合，业务融合不见头绪&lt;/p&gt;&lt;p&gt;4月27日上午，滴滴快的总裁柳青与滴滴快的出租车事业部总经理、战略部负责人Stephen与媒体举行了一场小规模的见面会，他们就滴滴快的合并进程、业务整合情况以及新公司上市融资计划做了回答。&lt;/p&gt;&lt;p&gt;柳青在回答如何处理重合部门的调整时表示，“我们的PR部门是完全合并在一起的，HR部门，就是职能部门基本上完全整合的，完全的融合在一起的。”&lt;/p&gt;&lt;p&gt;但业界关心的业务层面如何融合，柳青并没有回答。实际上，这也是滴滴快的遇到的最大障碍。&lt;/p&gt;&lt;p&gt;从目前看，滴滴快的其实并没有完全梳理好组织架构，业务层面的融合也仅仅停留在口头上，没有实质的进展。由于不涉及具体的业务，因此职能部门是最好融合的，这也就成为滴滴快的目前能拿得出说的融合成果。&lt;/p&gt;&lt;p&gt;“这个行业本身的发展还要经历千山万水，我们今天进入了移动出行的领域，出租车、专车、拼车其实完全整合在了一个大平台上。”柳青为大家描绘了滴滴快的平台型公司的梦想，但现实是出租车、代驾、专车、拼车都在不同的子平台上跑，真正整合在一个平台上难度很大。&lt;/p&gt;&lt;p&gt;专车司机被踢皮球，投诉无门只能罢工&lt;/p&gt;&lt;p&gt;柳青表示，滴滴、快的和一号专车品牌保留，各自走的挺好。但实际情况果真如此吗？&lt;/p&gt;&lt;p&gt;某一号专车司机A就在微信爆料称，由于滴滴和快的合并，导致业务不能平滑过度，专车司机利益极大受损。一号专车是快的2014年7月推出的定位于中高端用户的新业务品牌。&lt;/p&gt;&lt;p&gt;专车司机A表示，之前其和一号专车形成了事实上的劳务派遣关系，和劳务公司签署了两年的劳务合同，但滴滴快的合并后，滴滴要强行收编他们。但做法却十分粗暴：开出了难以完成的指标，收取高额的份子钱，不给奖金，且如果不和滴滴签署所谓的合同，就关闭专车司机的系统。而之前，快的不仅提供基本工资，而且有奖金，还不收份子钱，指标也比较正常可接受。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Public/upload/image/201505/1430544448749686.jpg&quot; alt=&quot;滴滴快的合并 滴滴快的股权分配 滴滴快的合并问题&quot; border=&quot;0&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;1号专车司机朋友圈爆料&lt;/p&gt;&lt;p&gt;“我想问，我们现在的情况是和劳务公司讨说法，还是和快的公司讨说法。当时我们去快的公司面试合格，然后快的指派劳务公司帮我们签合同的，现在两年的合同才刚过了半年，昨天通知我们去滴滴公司，然后他们公司太不讲道理了……”&lt;/p&gt;&lt;p&gt;无奈之下，专车司机只好以罢工进行对抗。据悉，已经上百名专车司机参与了此次罢工事件。&lt;/p&gt;&lt;p&gt;专车司机A的遭遇，只是滴滴快的合并后诸多问题的一个。相信如此大体量的两大公司合并，其在业务融合上产生的问题，将会有更多。而如果不能快速有效解决，合并后的服务质量、用户口碑都有可能不升反降。&lt;/p&gt;&lt;p&gt;投资人套现压力持续增加，发展前景仍不明朗&lt;/p&gt;&lt;p&gt;在滴滴快的合并之前，就曾有传言，双方公司合并后，投资方或会套现退出。之前也曾有媒体报道，新公司管理层将以滴滴打车团队为主，程维出任新公司CEO，快的高管团队大部分将套现离场。&lt;/p&gt;&lt;p&gt;虽然后来实行了双CEO制度，但很多人还是认为这只是权宜之计。毕竟，双CEO制度目前都没有成功的案例。&lt;/p&gt;&lt;p&gt;虽然柳青表示，目前滴滴快的没有IPO的计划，但她也表示，双方的管理层其实在合并中都各自做了让步。既然是让步，肯定就有让步的理由，而资本套现没有理由不在让步的理由之中。&lt;/p&gt;&lt;p&gt;此外，由于前期补贴运营资金过大，以及迟迟没有很好的盈利变现，可想而知一些早期投资人也是渴望公司尽快盈利套现的，IPO是他们套现离场的最好途径。相信随着滴滴快的运营支出的增加和融资的消耗，IPO会不以个别人意志为转移而到来。&lt;/p&gt;&lt;p&gt;据公开消息，滴滴快的最新一轮融资总金额为15亿美金。业界分析称，以他们的烧钱速度，再想通过融资扩张已经非常困难，高估值本身就是一把双刃剑，尤其是存在强大竞品、政策未明的情况下，滴滴快的势必尽快完成IPO，否则既不符合投资人的利益，也会使融资风险大增。&lt;/p&gt;&lt;p&gt;但一旦IPO，在规模盈利能力尚未形成，而投资人又大量套现，滴滴快的还能走多远？&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544451',1,1,4),
	(7,'Waze将在Twitter实时报道城市异常交通信息','&lt;p&gt;&lt;img src=&quot;/Public/upload/image/201505/1430544473570418.jpg&quot; border=&quot;0&quot; alt=&quot;站长之家, 谷歌收购waze, Waze地理定位, Twitter, Waze平台&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;站长之家（Chinaz.com）4月30日消息&amp;nbsp;据外媒消息，4月29日Waze官方博客上宣布，Waze将通过Twitter在重要的城市通知异常交通信息。用户可以选择自己所在的城市，在Twitter上了解当前具体的交通路况。&lt;/p&gt;&lt;p&gt;据了解，目前Waze推出的交通异常警报功能版本还正在测试。Waze方面表示，目前已经建立了50个新的Twitter账户，每个账号对不同的城市进行交通路况进行报道。报道内容包括：恶劣的天气、交通事故、道路封闭等。这样一来，乘客可以通过关注Twitter实时了解到所在城市交通异常的问题。&lt;/p&gt;&lt;p&gt;用户在Twitter上可以关注到的内容包括：&lt;/p&gt;&lt;p&gt;交通异常的位置和原因&lt;/p&gt;&lt;p&gt;交通异常导致增加的行程时间&lt;/p&gt;&lt;p&gt;来自Waze道路实时报道&lt;/p&gt;&lt;p&gt;推荐当前最佳出行路线，以避免交通堵塞。&lt;/p&gt;&lt;p&gt;此次Waze推出的交通警报功能将更有利于乘客出行，乘客可以避开拥堵交通严重的路段，了解到一天不同时期交通信息，制定最佳的出行计划。&lt;/p&gt;&lt;p&gt;站长之家注：&lt;/p&gt;&lt;p&gt;Waze由以色列Waze Mobile公司开发一款基于GPS的导航移动应用软件，2013年谷歌斥资10.3亿美元收购了Waze。&lt;/p&gt;&lt;p&gt;Waze可以收集用户地图数据和其他信息，并预测驾驶时间，提供路线和实时路况更新，用户可以向这款应用报告事故、交通堵塞、速度和交警，并能更新道路、地标、门牌号码等功能。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544476',1,1,1),
	(8,'互联网+情趣用品：羞答答的玫瑰静悄悄地开','&lt;p&gt;导语：7、8平米的空间里集合了一张办公桌、一把椅子、一台茶几、一个沙发、一张折叠床。作为娇羞科技的联合创始人“屈居”在这间小屋子里着实让人觉得过于低调了。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Public/upload/image/201505/1430544498561697.png&quot; alt=&quot;娇羞APP 孙成晓 情趣用品电商 互联网+ 创业经验&quot; border=&quot;0&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;走进孙成晓办公室的时候正值傍晚，夕阳透过窗户打进来给屋子蒙上了一丝“娇羞”的色彩。7、8平米的空间里集合了一张办公桌、一把椅子、一台茶几、一个沙发、一张折叠床。作为娇羞科技的联合创始人“屈居”在这间小屋子里着实让人觉得过于低调了。&lt;/p&gt;&lt;p&gt;笔者带着见网友的心态开始了与孙成晓的聊天。在之前的联系中，孙成晓一直给笔者一种大叔的印象，微胖，胡子拉碴，略显猥琐。而眼前这个戴眼镜，清瘦的“少年”让笔者的防御系统瞬间崩溃。&lt;/p&gt;&lt;p&gt;刚落座，孙同学便进进出出几次将娇羞APP上热销的情趣产品摆满了茶几，完全不在乎佯装淡定内心澎湃的我。瞬间视野被避孕套、飞机杯、自慰棒、皮鞭等等产品充斥了，品类丰富，色彩斑斓。孙成晓看着桌子，也微微有些“娇羞”的神态。&lt;/p&gt;&lt;p&gt;应聘者的两种反映&lt;/p&gt;&lt;p&gt;“我妈不同意”VS “太牛逼了”&lt;/p&gt;&lt;p&gt;“情趣行业的从业者很少，有经验的人也很少。之前卖运动鞋已经没有挑战了，所以想做这个。”孙成晓毫不避讳的谈到初入情趣用品行业的心态。&lt;/p&gt;&lt;p&gt;从有想法到见投资人就用了半个月的时间。第一次见投资人，连个PPT都没做，全凭一张嘴说服并顺利拉到天使轮。这也让他看到了娱乐消费无限发展的可能。&lt;/p&gt;&lt;p&gt;随后，辞职，创业，组团队，找房子，一切都显得水到渠成。&lt;/p&gt;&lt;p&gt;孙成晓介绍，目前团队有13个人，4个女孩子。公司成立第一天来了7个人，初步的团队模型出来了。首批招来的大部分都似乎做技术，与产品本身没有相关性，因此对公司定位情趣用品并没有太多挑剔，但是后来在招聘的过程中出现了两种极端的反映。&lt;/p&gt;&lt;p&gt;“一说我们是做情趣用品的，立马有人说‘我妈不同意’；另一种反应就是‘卧槽，太牛逼了’。所以我们一般就要特别感兴趣的人过来。”对于这种极端的反应孙成晓早已习惯。&lt;/p&gt;&lt;p&gt;对情趣行业的“歧视”和“偏见”也常常使孙成晓成为话题人物。在微信群里，只要他一发言，便会成为大家调侃的对象。也由此会有小伙伴们借机揩油，蹭蹭新品体验之类，对此，孙成晓心知肚明却也不戳破。&lt;/p&gt;&lt;p&gt;“大家不会跟别人说买了这个东西（情趣用品），但是别人买了一定会调侃。这是中国人的一种心态。”&lt;/p&gt;&lt;p&gt;娇羞的方向？&lt;/p&gt;&lt;p&gt;要做情趣版的聚美优品&lt;/p&gt;&lt;p&gt;对孙成晓质疑的声音还有来自投资人，很多上了年纪的投资人并没有看懂娇羞APP的方向。&lt;/p&gt;&lt;p&gt;此外，年初上线的新版本加入了社区的新功能，使得这款电商APP有了社交和互动的元素。但由于话题的特殊性，使得产品涉黄、低俗、擦边球的质疑不断。娇羞会不会成为下一个约炮圣地？&lt;/p&gt;&lt;p&gt;孙成晓解释道，这是一种内容消费，与产品消费并列。但对尺度是有把控的，论坛里的每个帖子都需要我们审核才可以发布。孙成晓将一张巨乳照片展示给笔者说道，这是目前最大的尺度了。但画面上那个姑娘妩媚的表情还是让笔者思维有点跑偏。&lt;/p&gt;&lt;p&gt;但实际上，娇羞APP用户已经遍布到了三四线城市。相比一二线城市来说，三四线城市的群众生活很单调。“饱暖思淫欲”的种子遍地开花，但无奈实体店资源的匮乏及用户的害羞心里，都激发了移动情趣电商的发展。&lt;/p&gt;&lt;p&gt;“你可能想象不到，我们的用户很多都没听过淘宝。”孙成晓“傲娇”的表示，“三四线城市的人是比我们更孤单寂寞的，他们的生活更单调乏味，他们同样需要这些东西（情趣用品）。”成长于三四线城市的孙成晓深有体会的感叹。&lt;/p&gt;&lt;p&gt;孙成晓介绍道，“淘宝电视广告不多，使得三四线城市的用户认知比较少，因此我们的很多用户是不知道淘宝的，也不会用支付宝。而他们上网主要是通过手机，是略过PC这个环节的。”&lt;/p&gt;&lt;p&gt;这个结论着实让笔者有些意外，原来万能的淘宝也有无所不能及的地方。如果就此将淘宝视为劲敌的话你就又错了。“做电商把模式搞的太重不太好，我们现在就是自己掌握自家渠道，没有商家入驻，可以将我们理解为情趣版的聚美优品。”孙成晓给娇羞做了如此定位。&lt;/p&gt;&lt;p&gt;最拼的创始人&lt;/p&gt;&lt;p&gt;亲自上阵体验情趣产品&lt;/p&gt;&lt;p&gt;为了能更好的了解市场，孙成晓常做的一件事就是对用户进行分析。据其透露，娇羞APP的用户涵盖的人群包括了警察、医生、老师、学生、个体老板、金融等等，甚至还有来自千年古刹的和尚。&lt;/p&gt;&lt;p&gt;“用户男女比例上来说，男性购买者占到了7、8成。”谈到这里，孙成晓举起了桌子上的飞机杯说道，“这个是我们针对单身男性用户推出的，同样单身女、已婚、同性恋等等群体我们的产品都能覆盖到。我们满足的是从16到60岁的所有群体。”&lt;/p&gt;&lt;p&gt;“其实，这和心态有关系。很多人对这个都是有误解的。比如说很多人有了女朋友，就不会再买情趣用品了。”&lt;/p&gt;&lt;p&gt;笔者灵光一闪，遂问道，你会给你的女朋友买情趣用品吗？&lt;/p&gt;&lt;p&gt;“呃…你猜，哈哈哈”孙成晓本能的掩盖了我的提问。这样的反应其实和当下大部分购买情趣产品用户的心理一致，本能的羞于表达。&lt;/p&gt;&lt;p&gt;此前，笔者询问了周围一位男性友人小A会不会购买情趣用品。对方的回答是有想过，但是也有顾虑。&lt;/p&gt;&lt;p&gt;“多方面的因素吧主要是自己还没有完全放开，对于情趣用品的认知只是来源于一些宣传，并不是很清楚的知道他们的用途，所以还不敢尝试”小A如是说。&lt;/p&gt;&lt;p&gt;对此，孙成晓也是赞同的。&lt;/p&gt;&lt;p&gt;从用户购买意向上来分析，一个产品最好的口碑来自于周围朋友的推荐。而情趣用品由于隐私性极高，因此用户对产品的认知模块是缺失的。&lt;/p&gt;&lt;p&gt;正是因为此，娇羞APP开辟了“用户晒单”“真人测评”两个大尺度的模块。其中的真人测评在一定程度上以社交的元素激发了用户对情趣产品使用方法的了解。&lt;/p&gt;&lt;p&gt;更让笔者节操尽碎的是，孙成晓对产品的认可大部分来源于亲自实践。“实践出真知”果然是硬道理。这种实践不仅是对产品产地和制作过程的考察，更包括了亲身体验。（此处画面自行脑补，笔者捂脸已跑远）话题至此，孙成晓熟练的将桌子上的两个安全套拆开，“严肃”的跟我讲解了两款产品从薄度到质感的区别。“杜蕾斯很难用的，我从来不用杜蕾斯”这样专业的论断很难在光天化日之下被正视，而就在此时此刻，面对着两个捏瘪的套套，笔者觉得节操只不过是个虚伪的纸老虎，完全阻挡了追求真相的道路。&lt;/p&gt;&lt;p&gt;“最开始做情趣用品的时候觉得，东西好不好用我完全不知道。比如说飞机杯，当时就拿回家一个体验了一下。”孙成晓大方的承认自己的体验过程。&lt;/p&gt;&lt;p&gt;“与用手比起来，这个简直不是一个级别的。”赤裸裸的结论也将谈话推向了高潮。“这种东西首先要说服自己的，自己好才能推荐给别人。”&lt;/p&gt;&lt;p&gt;走出办公室，外面天已黑。和孙成晓一起走向地铁站的路上我打量了下身边这个普通的男孩，走在夜幕下，他和涌进站台里的下班族一样。但是没人知道，这个87年的少年正在用着移动互联网的力量改变着大家对性事的看法。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544501',1,1,2),
	(9,'小偶：这款中文应用占领了美国的社交网络','&lt;p&gt;移动互联网从来不缺突然爆红的明星应用。去年有脸萌，今年的第一款爆款是足记。但这些应用都只在中文互联网红极一时。&lt;/p&gt;&lt;p&gt;小偶则不一样，这款由厦门幻世网络开发的应用，占领了美国苹果 App Store 免费榜排名第一的位置。根据应用追踪分析工具 App Annie 的统计，目前小偶在全球37个国家的 App Store 免费榜单里排名第一，并且在124个国家都进入了前100名。&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;aligncenter size-full wp-image-49126&quot; src=&quot;/Public/upload/image/201505/1430544533350880.png&quot; border=&quot;0&quot; alt=&quot;站长之家, 小偶app, 社交网络, 苹果AppStore&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;小偶是一款帮助用户生成3D动漫效果的应用，用户只要自拍一张照片，小偶就能自动帮你生成各种以你为主角的动画。小偶的脸部捕捉技术很好，制作的动画人物和真人很相似，动画本身也做的很“萌”。从这一点上来说，小偶的火爆和脸萌有几分相似。&lt;/p&gt;&lt;p&gt;虽然这款应用还仅仅支持中文，不过语言并没有阻碍美国用户使用小偶的热情。&lt;/p&gt;&lt;p&gt;很多明星都在自己的社交帐号里发布了用小偶制作的动画。比如 LadyGaga 就在自己的 Instagram 帐号上发布了用小偶制作的她跳钢管舞的动画。也有很多人恶搞政治人物，用奥巴马、克林顿等人的头像，制作了他们的小偶动画。&lt;/p&gt;&lt;p&gt;&lt;img class=&quot;aligncenter size-full wp-image-49123&quot; src=&quot;/Public/upload/image/201505/1430544533483978.png&quot; border=&quot;0&quot; alt=&quot;站长之家, 小偶app, 社交网络, 苹果AppStore&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;小偶并不是今年才发布的应用。它在去年8月发布的时候，名字叫“3D大头秀”，但很快就改名“小偶”。&lt;/p&gt;&lt;p&gt;今年2月小偶首次进入美国 App Store 排行榜，但它真正开始火爆是在今年4月5日的一次更新：它把自己所属的类比从“社交”调整到了“娱乐”。不到20天，小偶就从娱乐分类的1000名开外，冲到了美国 App Store 免费榜的第一位。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544537',1,1,3),
	(10,'罗永浩谈为什么要做手机：行业唯一的聪明人死了','&lt;p&gt;一直以来，关于罗永浩为什么要做手机有很多种答案。现在，老罗给出了最终版。&lt;/p&gt;&lt;p&gt;在罗用户个人的微信公众账号上，他公布了自己做手机的原因，具体如下。&lt;/p&gt;&lt;p&gt;我从小有“造物”的工匠情结（渊源）；成年后最热爱的东西是数码产品（激情）；绝大多数的现代人都喜欢数码产品（需求）；我懂 UI 设计和 ID 设计，在人机交互和营销方面是天才，凑巧又会运作企业（超低概率优势），这行业唯一的聪明人死了（机会）；和无聊沉闷的传统行业比，科技行业有无限的可能性，能通过处心积虑地改善人类的生活品质来获得事业的发展，让我享受工作远超过享受生活（愿景、使命和理想），大概就是这些。&lt;/p&gt;&lt;p&gt;看完之后有何感受？&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Public/upload/image/201505/1430544560991484.png&quot; alt=&quot;罗永浩 锤子手机&quot; border=&quot;0&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544563',1,1,4),
	(11,'美影协要求各分享网站24小时内停止侵权','&lt;p&gt;据报道，一份来自电影协会MPA的发给著名盗版资讯及BT资源分享TorrentFreak信件被公开，要求其站点拥有者在 收到信件后24小时内迅速中止一切盗版内容侵权分享行为或关闭该站点。否则将采取“一切可能的补救措施”来强制其关闭。TorrentFreak内部人士透露这份信件确系来自美国影业协会高 级主管Jan van Voom所发。此外，各个BT种子索引类站点，BT链接资源站，及服务运营方均收到了类似的信件，要求24小时内迅速停止一切侵权行动。&lt;/p&gt;&lt;p&gt;信件中，Voom明确地表示该站点已经侵害了协会及成员各影业公司的版权权益，要求迅速采取有效措施停止进一步版权侵害行为。应当永久关停非法资源下载渠道，版权媒体串流播放，及其他形式的侵权。任何未尽版权方同意的影视内容使用都属于侵权，甚至包括传播种子分享站点的海报。&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;/Public/upload/image/201505/1430544592607433.png&quot; alt=&quot;BT TorrentFreak BT资源分享 分享网站&quot; border=&quot;0&quot; style=&quot;margin: 0px; padding: 0px; border: 1px solid rgb(153, 153, 153); font-family: inherit; font-size: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; line-height: inherit; vertical-align: middle; color: transparent; display: inline-block;&quot;/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544594',1,1,1),
	(12,'部分用户反映 Apple Watch表带扣不紧表壳','&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;威锋网讯，Apple&amp;nbsp;Watch&amp;nbsp;可能贯彻了苹果最先进的技术和工艺，但也依然是苹果全新产品类别的第一代产品而已。&lt;/p&gt;&lt;p&gt;正因如此，可能它会存在一些在之前的产品中没有遇到过的问题。正如早前有用户反映，倘若手腕上有很深的纹身就有可能影响到&amp;nbsp;Apple&amp;nbsp;Watch&amp;nbsp;对穿戴者的数据监测功能，近日又有一个新的问题困扰着部分用户。&lt;/p&gt;&lt;p&gt;根据&amp;nbsp;MacRumors&amp;nbsp;透露，有部分用户反映&amp;nbsp;Apple&amp;nbsp;Watch&amp;nbsp;的表带扣不紧，这可能是表带和表壳连接的结构出现了问题。从视频中我们可以看到表带并没有能够很好地扣紧表带，会出现滑落的情况。&lt;/p&gt;&lt;p&gt;反映这个问题的用户表示当时他从脱下外套的时候&amp;nbsp;Apple&amp;nbsp;Watch&amp;nbsp;就从手中脱落，并摔到了地板上，还“滑行”了一下，经过检查发现，需要几次反复推拉才可以让表带扣紧表壳。&lt;/p&gt;&lt;p&gt;尽管如此，用户还是不需要过分担心，因为这毕竟属于少数情况。正如&amp;nbsp;Apple&amp;nbsp;Watch&amp;nbsp;也遇到了触觉反馈不灵敏的问题，但苹果并没有让这些设备流入市面。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544614',8,1,2),
	(13,'微信支付向政府与媒体类订阅号开放','&lt;p&gt;&lt;br/&gt;&lt;/p&gt;&lt;p&gt;金日，微信公众平台宣布，为了逐步开放微信支付的能力，现允许认证的政府与媒体类订阅号申请微信支付。&lt;/p&gt;&lt;p&gt;认证的政府与媒体类订阅号是指，订阅号在进行微信认证时，选择的主体类型是政府或者媒体。满足微信支付申请条件的帐号，将在左侧导航中出现“微信支付”的文字，点击即可进行申请。&lt;/p&gt;&lt;p&gt;微信方面表示，政府、媒体订阅号开支付是为了在保障安全的前提下，让他们有更丰富的运营手段和盈收模式。&lt;/p&gt;&lt;p&gt;微信支付正在逐步打开。本月23日，微信支付的企业付款已经全面开放，而此前，微信支付只能提供客户向企业单向付款。&lt;/p&gt;&lt;p&gt;&lt;br/&gt;&lt;/p&gt;','1430544638',7,1,3);

/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;



CREATE TABLE `setting` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `setting` WRITE;
/*!40000 ALTER TABLE `setting` DISABLE KEYS */;

INSERT INTO `setting` (`id`, `key`, `value`, `description`)
VALUES
	(1,'site-name','安全者','站点名'),
	(2,'site-keywords','关键词1,关键词2','关键词'),
	(3,'site-description','站点描述信息','站点描述'),
	(4,'site-tongji','&lt;script&gt; console.log(&quot;统计代码&quot;)&lt;/script&gt;','统计代码'),
	(5,'site-icp','123456','ICP备案号'),
	(6,'site-url','http://www.cnsecer.com','站点地址');

/*!40000 ALTER TABLE `setting` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
