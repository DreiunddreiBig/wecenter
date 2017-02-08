-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 2017-02-08 23:21:52
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_article`
--

INSERT INTO `aws_article` (`id`, `uid`, `title`, `message`, `comments`, `views`, `add_time`, `has_attach`, `lock`, `votes`, `title_fulltext`, `category_id`, `is_recommend`, `chapter_id`, `sort`) VALUES
(1, 1, '新生常见问题一览', '[attach]2[/attach]\n[b]英才校区常见问题集锦-以会计学院为例[/b]\n\n首先，恭喜河南牧业经济学院录取，来到河南牧业经济学院就像来到一个大家庭，希望大家互帮互助，共同进步。对于近期学弟学妹们比较关心各种衣食住行的相关问题，作为学长学姐都很高兴为大家进行解读。我作为14级学姐，列了一个常见小问题清单，针对这么多天询问问题的情况，在此作一个统一答复，以便学弟学妹们查看。希望对大家有所帮助！\n[list=1]\n[*][b]住宿方面:[/b]英才校区有六人间和八人间，都是从上下铺，桌子独立开的，（六人间八人间没什么差别的，个人感觉八人间宽敞）不独卫，宿舍内没空调有风扇暖气，住宿楼层越往上暖气越暖和，宿舍每个人一个充电插头，记的自己买插板，大功率的电器就不用带了，什么烧水壶，吹风机都不能用，一用就断电，总之超过200瓦的电器都不行。至于还有好多同学想着能在宿舍吃火锅熬粥什么的，都可以洗洗睡了。宿舍一个月免费供电25度，用超了需要自己去八号办缴费。宿舍一层楼有两个大的洗手间和厕所。宿舍是学校安排统一分配，住宿费是六人间800元，八人间600元，女生本科都是6人间，专科8人间，男生全部是六人间。  每个人都有权利选择床位，基本上都是各班一起住在一起，不排除有混寝。宿舍每天都有可能检查卫生，宿管大妈一般会在上午8点封楼后检查，学校每个院系也有学生会的同学在7点到7点半之间检查卫生，所以宿舍卫生一定要保持干净，不然不合格多次很有可能会被带到办公室接受辅导员训话。全校有18栋宿舍楼，1到17栋宿舍都是6楼，18号楼宿舍12层，8层以下住学生，当然都是没有电梯的，大家不用幻想了。学校两个免费的热水房，方便大家接热水，冬夏季节水时间限制不一样，具体时间你们可以在开水房门口看到。当然学校有澡堂，理发店，洗澡一次4元。[/*]\n[*][b]出行环境：[/b]英才校区位于北三环北大学城附近，学校门口公交车很多，交通便利。坐95路直达火车站，坐962直达汽车站，还有b52,b51,79,156等等。学校门口有夜市小吃街，附近有郑州师范学院中州大学等，学校里有郑州银行自动取款机，邮政取款机，学校外面有河南省农村信用社，邮政银行，工商银行自动取款机，（新生们如果是省内学生建议办个河南省农村信用社卡取钱，或者办个中原银行卡在学校郑州银行取款不收手续费）。[/*]\n[*][b]美食介绍：[/b]在我们学校有这么一句话“东边的饭，西边的面，大食堂二楼的卤肉饭。早餐的粥，晚饭的汤，东餐厅二楼的菜家常。”小餐厅东一生意最火爆，各种盖浇饭都不错，而且茶饮也都可以，便宜好喝；西九的锅仔最出名，东二楼的小四川饭店，小顺子饭店有各种家常菜，最适合小型聚会；东一楼最好吃的麻辣烫是杨国福麻辣烫，有点贵，个人感觉没十几块钱吃不饱。大餐厅适合早餐，小餐厅适合午餐晚餐。学校里面有52乐购超市，里面东西很全的，应有尽有。学校门口小吃很多，炒凉粉烤面筋炒酸奶都很棒，往大学城那面走，一堆小吃摊，一天吃一家，也够一个月的了。[/*]\n[*][b]各种费用问题:[/b]学校学费统一存入通知书卡内，学费住宿费通知书内有明确说明。对于助学贷款，在通知书内有个红色或者绿色本本，是有专门写明助学贷款事宜，若打算申请助学贷款请不要把学费等钱存入卡内，到学校后方便申请助学贷款。还有申请助学金的需要准备以下材料：1.户口本 首页、父、母页 本人页 复印件 共4页。2.父母身份证正反面复印件 共2页。3.自己手写一份申请书。4.手写三级证明（村里手写的证明 上面需要盖三个章 村、乡镇 、县）5.如果有低保证、孤儿证之类的 有复印件更好。[/*]\n[*][b]宽带上网问题：[/b]这个问题大家最关心，毕竟wifi是大家的命，学校的wifi也就是校园网，必须用本校52乐购的卖的联通手机卡，跟这个手机卡也很划算，最低消费每月16，每个月30元的无线网费，一个月46元足够，校园内哪个角落都可以用哦。[/*]\n[*][b]生活小问题：[/b]各位新生来的时候家离不远的话都建议自己带被褥，不要在学校门口购买。开学的时候拿着录取通知书买车票会半价，学校也派有校车在火车站附近接你们，这个详细情况在录取通知书里会说的。还有，大一有早操和早读，不上早读就上早操，具体看各班安排。一周12节课，每天不固定，有时候满课，有时候没课，有时候一两节课，学校不是封闭式的，方便外出。开学军训10天左右，大家可提前做好防晒准备工作，届时会买校服，统一着装军训。[/*]\n[*][b]其他：[/b]至于还有好多同学问一些学校学生会、团学会、协会的情况，其中学生会是属于校级部门，就是各个院系的人谁都可以去面试加入，也是有很多部门，负责全校各个系的通知安排和辅助工作，就是你进入学生会将会结交外学院的小伙伴，学生会招新工作会在10月初举行。至于学校协会也是有很多，基本上都是以娱乐性协会为主，招新工作会在开学初9月下旬在校园里举行，协会30多个，比如：四季风协会，朋辈，武术协会，交际舞协会，会计协会、棋艺协会，茶艺协会等等。基本上大家都是根据个人爱好加入各种社团协会，以丰富自己的课余活动，增加见识阅历。对于院级系级的团学会本人还是比较了解可以给大家讲解的详细一点，也算是举个例子，本学校各个院系都会有团学会，有很多部门，也是在9月下旬进班宣传招新。例如会计学院详细情况如下：[/*]\n[/list]\n[list]\n[*][b][i]主席团[/i][/b]：贯彻执行党总支、团委各项有关学生工作决议。对全系各类活动进行决策、布置和协调。[/*]\n[/list]\n十三个部门介绍 ：\n[list]\n[*][b]办公室：[/b]召集团学会各类会议，做好会务工作，上传下达老师的安排分配，安排好各个部门的活动情况，帮助其他部门完成举办的大型活动，负责整个团学会的工作计划工作总结的整理工作，以及班级团课的检查工作。[/*]\n[*][b]组织部：[/b]负责全院系同学的团课检查，团员党员信息的整理，负责维系促进会计学院各团支部（班级）的具体日常工作，及各团员的各项思想政治学习，协助党支部工作。负责会计学院的摄影工作及协助所有部门组织举办活动。[/*]\n[*][b]学习部：[/b]学风检查，组织各类活动，带动全院学习气氛，为学生学习提供各类信息支持和方法及指导，每周有三天要查早读，每周汇总一次班级日志，各部门有什么活动，协助各部门记成绩部门内部的活动  会有英语演讲比赛、英语歌曲比赛、英语话剧比赛 。  [/*]\n[*][b]文艺部：[/b]组织各类文艺活动，并配合校里里搞好文艺演出，丰富师生的精神文化生活。文举办的校级活动主要有健美操比赛、大合唱比赛，举办的系级比赛主要有迎新晚会、卡扣OK大赛、礼仪模特大赛等等。网教部：上传系新闻，编辑搜集发放微信，举办活动，培训office方面只是，协助其他部门举办活动，每个部门的活动都需要协助。[/*]\n[*][b]运用宣传部：[/b]多种手段对我院政策、信息、团学会活动进行宣传（ps.展板、海报、院系网站、微信公众平台、微博等）。为全院学生第一时间传递学校、学院发布的信息，并及时反馈他们的意见和建议 。与网教部合作对系网站、微信(英才会计)、微博（河南牧业经济学院英才校区团委）等进行运营与维护；与其他部门共同开展内部建设活动，并对我院宣传工作进行监督； 定期举办宣传技能培训（ps.新闻稿写作、书法练习），提高各宣传部成员宣传工作方面的水平；协助团学会其他部门开展工作，使各部门工作更好的完成。 [/*]\n[*][b]体保部：[/b]举办各类体育竞赛，增强学生的竞争意识和体质，检查学生们的早操情况，每天都有一定的时间去训练自己，篮球比赛排球比赛运动会都需要全力去参与其中。 [/*]\n[*][b]纪检部：[/b]纪检部的主要工作是查课，负责检查同学们的考勤状况，以起到督促作用。纪于心检于行，规范校园纪律，和同学们共同营造良好校园氛围。另外纪检部还负责辩论赛的举办，活动的举办更体现出部里成员的团结以及欣赏到参赛选手的唇枪舌战。[/*]\n[*][b]素拓部：[/b]该部门以培养大学生的思想素质为核心，以培养创新精神和实践能力为重点，开展能普遍提高大学生科学素养和人文素养的活动。部门工作内容主要涵盖创新创业、社团活动、点钞技能培训及团学会内部素拓等几个方面，以及带领全院系学生的素质拓展训练，各种大型素质拓展运动会。[/*]\n[*][b]心教部：[/b]心教部负责则学院学生心理健康问题，每月负责调查我们系同学的心理健康状况并且和校心理中心沟通。定期给心理委员开会等等。同时还会举许多的活动和比赛，比如家乡秀，以及心理话剧等大型活动 。[/*]\n[*][b]社实部：[/b]社实部顾名思义就是社会实践。带领全院系参加个各种社会实践活动，增强同学的社会实践能力，社实部每月会有一次户外活动，类似进社区，进养老院，去孤儿院等等。 [/*]\n[*][b]生活部：[/b]全体成员为男生，主要负责会计学院的学生生活方面，以及对日常其他部门活动的支持配合工作，定期进行学生宿舍内务大检查以及教室卫生检查，宣传生活常识，与团学会会他各部门竭诚配合，为同学们营造一个安心舒适的学习生活环境。[/*]\n[*][b]女生部：[/b]全体成员为女生，平时的工作主要是检查督促女生宿舍卫生，为会计系女生营造个良好舒适共适应的环境，除此外，该部在各部门有需要时会尽可能去帮忙！当然同生活部也会举办诸如宿舍文化节、手工艺品大赛、手抄报、主持人大赛、征文活动、、反法西斯周年的演讲征文比赛，还有专属于女生的节日女生节等等。[/*]\n[/list]\n以上的各个部门除了主席团不招新，其他部门院系里新生都可以去面试参加，十三个部门都不可缺少，大家都是尽心尽力为全学院服务，在会计学院团学会这个大家庭，大家是相亲相爱的一家人，团结就是力量，每个人不管在哪个部门都需要严于律己，做好自身工作并帮助其他部门一起开展各个活动，团结是会计学院团学会的一大特色。对于这些部门还有什么不懂的，军训期间各部门就会招新进班宣传，大家可以更详细了解。最后给大家说一点最重要的咱们学校有一种分叫做操行分，特别重要，这个操行分是根据你平时参加活动获奖增加，也可以根据宿舍评比情况增加或者减少，还有就是逃课会扣操行分，总之呢，加操行分很难，减分很容易，所以平时逃课宿舍卫生什么的都要特别注意。\n\n希望写了这么多常见的小问题会帮助到各位新生同学，大家还有什么问题都可以再在群里咨询各位学长学姐，这份锦集的完成，也要感谢会计学院团学会各个部门小伙伴的帮助。最后，最重要的，各位新生报到的时候千万不要忘带录取通知书，自己的档案，还有团员关系转走证明，身份证，团员证，高中毕业证，高考准考证，如果你是预备党员，预备党员转正证明，党课结业证什么的，大家一定要带齐全，不然报道很麻烦。即将作为一名大二的学姐给你们写这么多话，希望对学弟学妹们有所帮助。最后，预祝各位学弟学妹大学生活愉快呦！\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n[b]龙子湖校区常见问题集锦-以农林经济管理学院为例[/b]  \n \n首先，恭喜河南牧业经济学院录取的萌新，来到河南牧业经济学院这个大家庭，希望大家互帮互助哟。对于近期学弟学妹们比较关心各种衣食住行的相关问题，作为学长学姐都很高兴为大家进行解读。我作为15级学长，列了一个常见小问题清单，针对这么多天询问问题的情况，在此作一个统一答复，以便学弟学妹们查看，希望对大家有所帮助！（0.0有没有发现这个和英才的指南文件很像，其实我很偷懒啦嘻嘻嘻~）\n[list=1]\n[*][b]住宿方面:[/b]龙子湖校区只有6人间哟，一边是上下铺，一边是上床下桌，两张长桌六个位置（足够你放台式机哼哼）有独卫，宿舍内没空调没风扇暖气，住宿楼层共六层，宿舍四个充电插座（其实五个啦，四个在桌子旁边，只有唯一一个在上铺床头，有心思的小萌新们开学跑快点去抢哦~去晚了就没啦233），记得自己买插板，大功率的电器就不用带了，什么烧水壶，吹风机都不能用，一用就断电，总之超过200瓦的电器都不行。至于还有好多同学想着能在宿舍吃火锅熬粥什么的，都可以洗洗睡了。宿舍不限电不限水嘻嘻。宿舍是学校安排统一分配，住宿费是800元。每个人都有权利选择床位，基本上都是各班一起住在一起，不排除有混寝。宿舍刚开学检查卫生比较频繁，宿管大爷（男寝是大爷，女寝是大妈..）一般会在8-10点的时间段检查，学校每个院系也有学生会的同学在7点到7点半之间检查卫生，所以宿舍卫生一定要保持干净，不然不合格多次很有可能受到全院点评，，而且影响奖助贷的评定哼哼。全校有16栋宿舍楼，1到16栋宿舍都是6楼，当然都是没有电梯的，大家不用幻想了。学校一个免费的热水房，刷校园卡接水（不扣钱），就是录取通知书里面的那张一卡通，虽然很方便，郑大也没这么高端的卡千万注意不能丢失，你要拿那一张卡当银行卡、吃饭、洗澡、接水、逛超市。。丢了补办很麻烦的。。热水房冬夏季节水时间限制不一样，具体时间你们可以在开水房门口看到。当然学校有澡堂，洗一次大概1-元。理发店办理会员卡大概一次10元（据学长的经验，男生一寝室一张卡就足够了，女生喜欢折腾头发的可以自己办卡，也可以去外面剪）。[/*]\n[*][b]出行环境：[/b]龙子湖校区位于郑州东区，学校门口公交车很多，交通便利。坐305路直达火车站和旅游汽车站。坐166和160直达市体育中心可以坐地铁一号线到金水、郑东新区、二七广场、火车站等等等。。。而且学校西校门的地铁即将通车，以后出行更方便咯~学校门口有夜市小吃街，附近有N多大学，隔壁的教院（现在叫财政金融学院）美女如云2333。学校里有邮政储蓄自动取款机，北门有建设银行和中信银行取款机，（建议新生们用支付宝转账，不收手续费）。[/*]\n[*][b]美食介绍：[/b]这个应该妹子来写好不好。。。我只能说。。都很好吃，我在这上一年了都还没吃过来。。。大餐厅一楼的饼，二楼的拌面，三楼的大肉水饺和砂锅，二餐厅中午的盖浇米饭和学长大盘鸡拌面和凉皮儿，早晨的胡辣汤（这个我们一个宿舍的人喝了一个学期我会骗你！！！我们一度认为里面加了罂粟壳，喝着是真上瘾啊，当然，里面是不会放的你们放心。。），还有还有，二餐厅的绿豆沙冰，好喝的要死！！！重点推荐，夏日必点！！你要是都吃腻了，还可以尝尝大餐厅和二餐厅的旋转小火锅（适合情侣和寝室姐妹和机油一块，比较有氛围）还有小食堂的杨国福，米多面多哟。[/*]\n[*][b]各种费用问题:[/b]学校学费统一存入通知书卡内，学费住宿费通知书内有明确说明。对于助学贷款，在通知书内有个红色或者绿色本本，是有专门写明助学贷款事宜，若打算申请助学贷款请不要把学费等钱存入卡内，到学校后方便申请助学贷款。还有申请助学金的需要准备以下材料：1.户口本 首页、父、母页 本人页 复印件 共4页。2.父母身份证正反面复印件 共2页。3.自己手写一份申请书。4.手写三级证明（村里手写的证明 上面需要盖三个章 村、乡镇 、县）5.如果有低保证、孤儿证之类的 有复印件更好。还有一点，书本费和学费是分开的，开学一段时间才会交书本费，这一点务必注意。[/*]\n[*][b]宽带上网问题：[/b]这个问题大家最关心，毕竟wifi是大家的命，学校的wifi也就是校园网，必须用卖的联通手机卡（这卡是绑定宽带的，不建议大家用通知书袋子里的移动卡，真的贵！！联通宽带卡10元1.5G我会骗你，而且一个月可以开10次。。。），一个月36元套餐还送750M足够，校园内哪个角落都可以用哦。[/*]\n[*][b]生活小问题：[/b]各位新生来的时候家离不远的话都建议自己带被褥，不要在学校门口购买。开学的时候拿着录取通知书买车票会半价，学校也派有校车在火车站附近接你们，这个详细情况在录取通知书里会说的。还有，大一有早操和早读，不上早读就上早操，具体看各院系安排。一周课时数不固定，看各院系安排，每天不固定，有时候满课，有时候没课，有时候一两节课，学校不是封闭式的，方便外出。开学军训15天左右，大家可提前做好防晒准备工作，届时会买校服，统一着装军训。[/*]\n[*][b]其他：[/b]至于还有好多同学问一些学校学生会、团学会、协会的情况，其中学生会分校级部门和院系级部门（校学生会和院系学生会各自管辖，各不相干，有活动才会有联系），就是各个院系的人谁都可以去面试加入，也是有很多部门，负责全校各个系的通知安排和辅助工作，就是你进入学生会将会结交外学院的小伙伴，学生会招新工作会在10月初举行。至于学校协会也是有很多，基本上都是以娱乐性协会为主，招新工作会在开学初9月下旬在校园里举行，协会30多个，比如：朋辈、武术协会、交际舞协会、棋艺协会、茶艺协会、街舞社、书画协会、吉他社、电竞协会等等。基本上大家都是根据个人爱好加入各种社团协会，以丰富自己的课余活动，增加见识阅历。对于院级系级的团总支学生会本人还是比较了解可以给大家讲解的详细一点，也算是举个例子，本学校各个院系都会有团总支，有很多部门，也是在9月下旬进班宣传招新，例如农经学院详细情况如下：[/*]\n[/list]\n[b]十三个部门介绍 ：[/b]\n[list]\n[*]办公室：召集团学会各类会议，做好会务工作，上传下达老师的安排分配，安排好各个部门的活动情况，帮助其他部门完成举办的大型活动，负责整个团学会的工作计划工作总结的整理工作。[/*]\n[*]组织部：负责全院系同学的团课检查，团员党员信息的整理，负责维系促进会计学院各团支部（班级）的具体日常工作，及各团员的各项思想政治学习，协助党支部工作。[/*]\n[*]学习部：学风检查，组织各类活动，带动全院学习气氛，为学生学习提供各类信息支持和方法及指导，每周有三天要查早读，每周汇总一次班级日志，各部门有什么活动，协助各部门记成绩部门内部的活动 。[/*]\n[*]文艺部：组织各类文艺活动，并配合校里里搞好文艺演出，丰富师生的精神文化生活。参加的校级活动主要有校园之星、健美操比赛、大合唱比赛、元旦晚会等等。举办的系级比赛主要有迎新晚会等等。[/*]\n[*]新闻部：上传院新闻，编辑搜集发放微信，举办活动，培训office方面，协助其他部门举办活动，每个部门的活动都需要协助。[/*]\n[*]宣传部：多种手段对我院政策、信息、团学会活动进行宣传（ps.展板、海报、院系网站、微信公众平台、微博等）。为全院学生第一时间传递学校、学院发布的信息，并及时反馈他们的意见和建议 。与新闻部合作对系网站、微信、微博（河南牧业经济学院龙子湖校区团委）等进行运营与维护；与其他部门共同开展内部建设活动，并对我院宣传工作进行监督； 定期举办宣传技能培训（ps.新闻稿写作、书法练习），提高各宣传部成员宣传工作方面的水平；协助团学会其他部门开展工作，使各部门工作更好的完成。 [/*]\n[*]体育部：举办各类体育竞赛，增强学生的竞争意识和体质，检查学生们的早操情况，每天都有一定的时间去训练自己，篮球比赛排球比赛运动会都需要全力去参与其中。 [/*]\n[*]纪检部：纪检部的主要工作是查课，负责检查同学们的考勤状况，以起到督促作用。纪于心检于行，规范校园纪律，和同学们共同营造良好校园氛围。另外纪检部还负责辩论赛的举办，活动的举办更体现出部里成员的团结以及欣赏到参赛选手的唇枪舌战。[/*]\n[*]素拓部：该部门以培养大学生的思想素质为核心，以培养创新精神和实践能力为重点，开展能普遍提高大学生科学素养和人文素养的活动。部门工作内容主要涵盖创新创业、社团活动及学生会内部素拓等几个方面，以及带领全院系学生的素质拓展训练，各种大型素质拓展运动会。[/*]\n[*]心教部：心教部负责则学院学生心理健康问题，每月负责调查我们系同学的心理健康状况并且和校心理中心沟通。定期给心理委员开会等等。同时还会举办许多的活动和比赛，比如家乡秀，以及心理话剧等大型活动 。[/*]\n[*]社实部：社实部顾名思义就是社会实践。带领全院系参加个各种社会实践活动，增强同学的社会实践能力，社实部每月会有一次户外活动，类似进社区，进养老院，去孤儿院等等。 [/*]\n[*]生活部：全体成员为男生，主要负责学院的学生生活方面，以及对日常其他部门活动的支持配合工作，定期进行学生宿舍内务大检查以及教室卫生检查，宣传生活常识，与团学会会他各部门竭诚配合，为同学们营造一个安心舒适的学习生活环境。[/*]\n[*]女生部：全体成员为女生，平时的工作主要是检查督促女生宿舍卫生，为女生营造个良好舒适共适应的环境，除此外，该部在各部门有需要时会尽可能去帮忙！当然同生活部也会举办诸如宿舍文化节、手工艺品大赛、手抄报、主持人大赛、征文活动、、反法西斯周年的演讲征文比赛，还有专属于女生的节日女生节等等。[/*]\n[/list]\n \n以上的各个部门院系里新生都可以去面试参加，十三个部门都不可缺少，大家都是尽心尽力为全学院服务，在农经学院团总支学生会这个大家庭，大家是相亲相爱的一家人，团结就是力量，每个人不管在哪个部门都需要严于律己，做好自身工作并帮助其他部门一起开展各个活动，团结是农经学院团总支学生会的一大特色。对于这些部门还有什么不懂的，军训期间各部门就会招新进班宣传，大家可以更详细了解。最后给大家说一点最重要的咱们学校有一种分叫做操行分，特别重要，这个操行分是根据你平时参加活动获奖增加，也可以根据宿舍评比情况增加或者减少，还有就是逃课会扣操行分，总之呢，加操行分很难，减分很容易，所以平时逃课宿舍卫生什么的都要特别注意。\n\n希望写了这么多常见的小问题会帮助到各位新生同学，大家还有什么问题都可以再在群里咨询各位学长学姐，这份锦集的完成（0.0好吧这是我参考会计学院的指南自己修改的）。最后，最重要的，各位新生报到的时候千万不要忘带录取通知书，自己的档案，还有团员关系转走证明，身份证，团员证，高中毕业证，高考准考证，如果你是预备党员，预备党员转正证明，党课结业证什么的，大家一定要带齐全，不然报道很麻烦。即将作为一名大二的学长给你们写这么多话，希望对学弟学妹们有所帮助。最后，预祝各位学弟学妹大学生活愉快呦！（累屎了QAQ）\n\n2016年7月27日星期三\n王小明\n参考英才校区会计学院指南修改完成。\n ', 0, 4, 1486542585, 1, 0, 0, '2603229983 24120352653838239064 1996835272', 1, 0, NULL, 0),
(2, 1, '河南牧业经济学院院系分区和专业调整方案', '\n[attach]6[/attach]\n\n[attach]3[/attach]\n\n[attach]8[/attach]\n\n[attach]5[/attach]\n\n[attach]4[/attach]\n\n[attach]7[/attach]\n\n[attach]9[/attach]\n\n[attach]10[/attach]\n\n[attach]11[/attach]\n ', 0, 3, 1486543834, 1, 0, 0, '2782721335 2928719994 3246327982 2339838498 3849831995 2099821306 1998719994 3584325972 2604126696', 1, 0, NULL, 0),
(3, 1, '河南牧业经济学院招生章程', '[b]第一章 总则 [/b]\n[list]\n[*]第一条 为了保证河南牧业经济学院招生工作顺利进行，规范招生行为，维护考生合法权益，学校依据《中华人民共和国教育法》、《中华人民共和国高等教育法》及河南省教育厅有关规定，特制定本章程。 [/*]\n[*]第二条 本章程适用于河南牧业经济学院普通全日制本科及专科层次招生工作。 [/*]\n[*]第三条 学校招生工作贯彻“公平、公开、公正、严格程序、择优录取、接受监督”的原则，受纪检监察部门、新闻媒体、考生及家长的监督。 [/*]\n[/list]\n[b]第二章 学校概况[/b] \n[list]\n[*]第四条 河南牧业经济学院（英文译名：Henan University of Animal Husbandry and Economy”，简写为“HUAHE”）为省属普通高等本科学校。经教育部批准,于2013年由原郑州牧业工程高等专科学校、河南商业高等专科学校合并成立。 [/*]\n[*]第五条 学校座落于九州之中、中华腹地的河南省省会郑州，濒临中华民族的母亲河——黄河。现有全日制在校生三万两千余人，拥有农学、经济学、管理学、文学、工学、理学、法学、艺术学等八大学科，设有动物科技学院、制药工程学院、会计学院、工商管理学院等20个教学院系、5个教学部、1个示范性软件职业技术学院、1个继续教育学院和1个国际教育学院，建设有27个本科专业(含7个方向)和78个专科专业（含24个专业方向），其中动物科学、财务管理本科专业被确定为省级“专业综合改革试点”专业，畜牧、兽医专科专业为中央财政支持提升专业服务产业能力项目，食品加工技术、会计电算化、市场营销和物流管理等15个专业为省级特色专业。 [/*]\n[*]第六条 国标代码：10469，河南省招生代码：6045、6047（中外合作办学）、6048(软件类专业)。 [/*]\n[*]第七条 办学性质：公办。 [/*]\n[*]第八条 办学层次：本科、专科。 [/*]\n[*]第九条 办学类型：普通高等学校。 [/*]\n[*]第十条 学习形式：全日制。 [/*]\n[*]第十一条 证书颁发：学生学业期满，成绩合格，由学校颁发国家承认的普通高等学校本、专科毕业证书，符合学士学位授予条件的，授予学位证书。 [/*]\n[*]第十二条 办学地点：郑州市郑东新区龙子湖高校园区龙子湖北路6号（龙子湖校区）；郑州市惠济区英才街2号（英才校区）；郑州市金水区北林路16号（北林校区）。 [/*]\n[/list]\n[b]第三章 组织机构[/b] \n[list]\n[*]第十三条 学校按照上级要求设立校招生工作领导小组，负责制定招生政策，讨论决定招生重大事宜。 [/*]\n[*]第十四条 河南牧业经济学院招生就业处是学校常设机构，负责学校普通招生工作。 [/*]\n[/list]\n[b]第四章 招生计划[/b] \n[list]\n[*]第十五条 学校根据发展规模、办学条件、学科发展、生源状况和社会需求制定当年招生计划，并报上级主管部门审核。审核后的招生计划由我校通过招生信息网、招生简章等形式向社会公布。 [/*]\n[/list]\n[b]第五章 录取 [/b]\n[list]\n[*]第十六条 学校招生录取工作在省教育厅、省招办领导下，执行教育部规定的“学校负责，招办监督”的录取体制。 [/*]\n[*]第十七条 学校按照理工类、文史类、专升本类、对口类、艺术类分类录取考生。 [/*]\n[*]第十八条 按照我省有关规定，农林院校对省内第一志愿报考我校考生（不含专升本、艺术、对口批次）加20分投档。外省则根据当地有关政策执行；投档比例按照各省招生部门有关要求执行，录取时按招生计划数分配专业，缺额专业将在剩余投档考生中择优录取。 [/*]\n[*]第十九条 学校投档严格按照各省相应批次投档政策执行。专业录取规则：对进档考生，结合各专业的录取条件，按照“专业清”的办法进行录取。考生志愿为平行志愿时，各志愿同等对待；考生志愿为非平行志愿时，按照考生志愿顺序录取，优先录取第一志愿，第一志愿生源不足时依次录取后续志愿的考生。 [/*]\n[*]第二十条 学校原则上认可各省教育厅或高招办有关照顾和优先录取的政策，专业安排以考生的特征成绩作为主要依据。 [/*]\n[*]第二十一条 [i]艺术类招生[/i] 我校艺术类招生分为本科和专科两个层次，艺术类本科录取规则为：在文化课成绩和专业成绩达到最低录取控制分数线的情况下，按照（文化课成绩×40%＋专业成绩×60%）从高到低录取。艺术类专科录取规则为：在文化课成绩和专业成绩达到最低录取控制分数线的情况下，按照文化课成绩从高到低录取。 [/*]\n[*]第二十二条 [i]示范性软件职业学院[/i] 软件学院是经河南省教育厅批准成立的2年制普通专科培养模式。 [/*]\n[*]第二十三条 [i]中外合作办学[/i] 学校与爱尔兰的卡罗理工学院、沃特福德理工学院等国外知名大学联合办学，开设会计学与市场营销两个中外合作本科课程项目，设有会计、市场营销和工商企业管理等3个专科专业。 [/*]\n[*]第二十四条 [i]体检要求[/i] 对考生身体健康状况要求，执行教育部和卫生部等部门制定的《普通高等学校招生体检工作指导意见》和有关补充规定。 [/*]\n[/list]\n[b]第六章 学费和奖助学金 [/b]\n[list]\n[*]第二十五条 [i]各专业学费[/i] 根据国家规定，学生入学须交纳学费、住宿费及其它相关费用。学校按河南省物价部门核定的收费标准对学生收取学费、住宿费及其它相关费用。考生可以在学校公布的招生计划中查询各专业学费，收费标准如有变动，以物价管理部门有关文件规定为准。 [/*]\n[*]第二十六条 [i]奖励与资助[/i] [b]优秀学生奖励体系：[/b]1、国家奖学金，每生每年8000元。2、国家励志奖学金，每生每年5000元。3、国家助学金，平均每生每年3000元。4、另设有企业奖学金和单项奖学金。 [b]困难学生资助体系：[/b]1、勤工助学：学校设置勤工助学岗位，困难生可进行勤工助学。2、国家助学贷款：根据《河南省属高校国家助学贷款管理暂行办法》规定，家庭经济困难且符合国家助学贷款条件的学生，可申请国家助学贷款最高为8000元/生.年。  [/*]\n[/list]\n[b]第七章 附则[/b] \n[list]\n[*]第二十七条  高考咨询人员意见仅供参考，不作为录取依据及承诺。学校未委托任何中介机构或个人进行招生录取工作。对以我校名义进行非法招生活动的中介机构或个人，我校将依法追究其相应责任。 [/*]\n[*]第二十八条 新生持学校发放的录取通知书在规定时间内来校报到，对未经同意逾期两周不报到的已录取考生，视其为自行放弃入学资格。 [/*]\n[*]第二十九条 新生入校后，将依据教育部有关文件规定进行新生资格审查，复查合格者取得学籍。复查不合格者，学校将视不同情况予以处理，直至取消入学资格。凡发现弄虚作假者，一律取消入学资格。 [/*]\n[*]第三十条  本章程自省教育厅审核备案之日起生效。学校以往有关招生政策、规定如与本章程冲突，以本章程为准；本章程若与国家法律、法规或上级有关政策相抵触，以国家法律、法规、上级有关政策为准； [/*]\n[*]第三十一条  本章程具体事项按照当年公布为准，由河南牧业经济学院负责解释。 [/*]\n[/list]\n', 0, 4, 1486544185, 0, 0, 0, '2782721335 2928719994 3246327982 2339838498 25307299833145631243', 1, 0, NULL, 0),
(4, 1, '新生报到路线', '[b]客运总站[/b]，有两条线路：\n[i]线路一：[/i]站内乘坐 603路(或 906路 ) → 305路     \n\n[b]汽车客运总站 [/b] 上车，603路(或 906路 )，到 人民公园东门站 下车；   \n人民公园东门站 上车，305路，到 终点站（郑州牧业高等专科）下车，即为我校北门。 \n\n[i]线路二：[/i] 962路 → 305路       \n站内乘坐汽车客运总站  上车  962路，到 紫荆山公园站 下车；   \n紫荆山金水东路站 上车，305路，到 终点站（郑州牧业高等专科）下车，即为我校北门。\n打车大概需要50元左右\n\n[b]客运中心站：[/b]\n乘坐305路，到 终点站（郑州牧业高等专科） 下车，即为我校北门。此外，可以到火车站西出站口乘坐我校接送专车。\n打车大概需要40元左右\n\n\n[b]客运南站：[/b]\n906路 → 305路\n汽车客运南站 上车，906路，人民公园东门站 下车；\n[b]人民公园东门站[/b]  上车，305路，到 终点站（郑州牧业高等专科）下车，即为我校北门。\n打车大概需要50元左右\n\n[b]客运东站，有两条线路：[/b]\n[i]线路一：[/i]570路 → 305路\n商都路东风南路站 上车，570路，金水路中兴路站 下车；\n金水东路中兴路站 上车，305路，到 终点站（郑州牧业高等专科）下车，即为我校北门。\n[i]线路二：[/i]278路 → 305路\n汽车客运东站 上车，278路，东风南路金水东路站 下车；\n金水东路东风南路站 上车，305路，到 终点站（郑州牧业高等专科）下车，即为我校北门。\n打车大概需要25元左右\n\n[b]新北站：[/b]\n156路 → 166路\n[b]花园路国泰路站[/b] 上车，156路，农业东路龙湖外环路站 下车；\n[b]农业东路龙湖外环路站[/b] 上车，166路，河南畜牧专科学院站 下车，即为我校。\n打车大概需要45元左右\n\n\n[b]自驾车：[/b]无论你从哪个方向来郑州，请到郑州市的新区站下高速，下高速后右转往金水东路方向行驶，沿金水东路行驶到明理路（其中路过河南政法大学）右转（到明理路时有提前右转到），沿明理路直行走到没路（因为修地铁封路了）就到河南牧业经济学院西门。\n\n\n[b]火车站：[/b]我校在火车站西广场有专车接站，制药工程学院在龙子湖校区，请同学们看好发车方向。\n', 0, 3, 1486544422, 0, 0, 0, '2603229983 2525321040 3633532447', 1, 0, NULL, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_attach`
--

INSERT INTO `aws_attach` (`id`, `file_name`, `access_key`, `add_time`, `file_location`, `is_image`, `item_type`, `item_id`, `wait_approval`) VALUES
(2, '0ff41bd5ad6eddc414bd0d493fdbb6fd5266332d.jpg', 'ae9d7c7ff05bbc76927b930c6908ff52', 1486542775, 'e19d374a210e9149764346bbfc5c48d2.jpg', 1, 'article', 1, 0),
(3, 'QQ图片20170208164754.png', '492fd8a4aa44fd6241a61619e279a608', 1486543781, '1de1e6a04641ca0e168f878b5d0356c2.png', 1, 'article', 2, 0),
(4, 'QQ图片20170208164806.png', '492fd8a4aa44fd6241a61619e279a608', 1486543781, '33a2eab9bbacc0727499d66fec36fc96.png', 1, 'article', 2, 0),
(5, 'QQ图片20170208164802.png', '492fd8a4aa44fd6241a61619e279a608', 1486543781, '8e34276f161384c0d0cfa18a0d9fab0e.png', 1, 'article', 2, 0),
(6, 'QQ图片20170208164747.png', '492fd8a4aa44fd6241a61619e279a608', 1486543781, 'ffae08b174b94fb1e45d0744ac8c0af5.png', 1, 'article', 2, 0),
(7, 'QQ图片20170208164809.png', '492fd8a4aa44fd6241a61619e279a608', 1486543781, '89c2f405fa957d729ffdd9594d9ff2b1.png', 1, 'article', 2, 0),
(8, 'QQ图片20170208164758.png', '492fd8a4aa44fd6241a61619e279a608', 1486543781, 'ae16ef4aecb7e271f54a344c4b257cd5.png', 1, 'article', 2, 0),
(9, 'QQ图片20170208164812.png', '492fd8a4aa44fd6241a61619e279a608', 1486543782, '341a748c4d77eb00c6e4474c357270a3.png', 1, 'article', 2, 0),
(10, 'QQ图片20170208164815.png', '492fd8a4aa44fd6241a61619e279a608', 1486543782, '621ea47d47a838e452987848f0dfd0ee.png', 1, 'article', 2, 0),
(11, 'QQ图片20170208164818.png', '492fd8a4aa44fd6241a61619e279a608', 1486543782, '611450d602eef931166c6a12160b02a2.png', 1, 'article', 2, 0);

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_integral_log`
--

INSERT INTO `aws_integral_log` (`id`, `uid`, `action`, `integral`, `note`, `balance`, `item_id`, `time`) VALUES
(1, 1, 'REGISTER', 2000, '初始资本', 2000, 0, 1486474930),
(2, 1, 'UPLOAD_AVATAR', 20, '上传头像', 2020, 0, 1486474959),
(3, 2, 'REGISTER', 2000, '初始资本', 2000, 0, 1486528715),
(4, 1, 'UPDATE_SIGNATURE', 10, '完善一句话介绍', 2030, 0, 1486544667),
(5, 1, 'UPDATE_CONTACT', 10, '完善联系资料', 2030, 0, 1486544667);

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
(2, '新生宝典', '对于新生来说，这不是一本假宝典', 'custom', 0, 'http://www.myuahe.com/?/explore/category-1', '2.jpg', 1),
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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_posts_index`
--

INSERT INTO `aws_posts_index` (`id`, `post_id`, `post_type`, `add_time`, `update_time`, `category_id`, `is_recommend`, `view_count`, `anonymous`, `popular_value`, `uid`, `lock`, `agree_count`, `answer_count`) VALUES
(1, 1, 'article', 1486542585, 1486542585, 1, 0, 2, 0, 0, 1, 0, 0, 0),
(2, 2, 'article', 1486543834, 1486543834, 1, 0, 0, 0, 0, 1, 0, 0, 0),
(3, 3, 'article', 1486544185, 1486544185, 1, 0, 0, 0, 0, 1, 0, 0, 0),
(4, 4, 'article', 1486544422, 1486544422, 1, 0, 0, 0, 0, 1, 0, 0, 0);

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
('tmdkqb4mn6bir2ed4rmv4qgd90', 1486566207, 'kgw__Anwsion|a:3:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"human_valid";N;}', 1440),
('uf9m9m9jbllbqlss1qd0isj9q6', 1486566175, 'kgw__Anwsion|a:4:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"admin_login";N;s:11:"human_valid";N;}', 1440),
('rqdna9bdmmt6rld31ksle5gg46', 1486566167, 'kgw__Anwsion|a:4:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"admin_login";N;s:11:"human_valid";N;}', 1440),
('lpom289e6n79f75gmfsr9ioad4', 1486566155, 'kgw__Anwsion|a:4:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"admin_login";N;s:11:"human_valid";N;}', 1440),
('qmn3qs36gtinh81rm4tbdqeqn3', 1486566155, 'kgw__Anwsion|a:3:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"human_valid";N;}', 1440),
('hscj90bi2mqqumerl0k76ji767', 1486566150, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('nduldpsm5rd4f13o6dbs1lsli2', 1486566148, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('kc91kub09in7l9ldvngh0buel1', 1486566141, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('mptens6hoohmmh84o4bpp2thd1', 1486565834, 'kgw__Anwsion|a:3:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"human_valid";N;}', 1440),
('hdiefivkfmmb6hrbeegpj0di31', 1486565834, 'kgw__Anwsion|a:3:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"human_valid";N;}', 1440),
('uptk28e6iginu5tuou49q9q6e2', 1486565834, 'kgw__Anwsion|a:3:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"human_valid";N;}', 1440),
('7k2e80kf4g8l5vglpmmep61cj0', 1486565834, 'kgw__Anwsion|a:3:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"human_valid";N;}', 1440),
('nlt37ckf29ljm1jlf0q730r1h3', 1486565829, 'kgw__Anwsion|a:3:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"human_valid";N;}', 1440),
('35afmpvcdf1g5rtpll6g21ri93', 1486565817, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('n9ifmo0glsfa89sodpmh5i2bm5', 1486565816, 'kgw__Anwsion|a:3:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"human_valid";N;}', 1440),
('v7u9a27ipgrrs1ht3etmtf36n1', 1486565799, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('8fa6v1bvl47nq6s2vij7l07mc7', 1486565787, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('abuocg9nbdu0d5p0in92c6q682', 1486565795, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('e3rk30jpnfb3b40gauk6nqcg34', 1486565787, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('6h3c3q1eg76nrr1dt60isi8203', 1486565787, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('0cdf5jjf7oimoecajmnvmvf1t1', 1486566157, 'kgw__Anwsion|a:3:{s:11:"client_info";a:3:{s:12:"__CLIENT_UID";i:1;s:18:"__CLIENT_USER_NAME";s:9:"王小明";s:17:"__CLIENT_PASSWORD";s:32:"2efbc80e24a16c2a1e9c52734198a649";}s:10:"permission";a:15:{s:16:"is_administortar";s:1:"1";s:12:"is_moderator";s:1:"1";s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"edit_question";s:1:"1";s:10:"edit_topic";s:1:"1";s:12:"manage_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:12:"edit_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";s:15:"publish_comment";s:1:"1";}s:11:"admin_login";s:329:"cast-256|50D5DF903C7C7F462D26D949E353144728AADB4C0716CAE2BD78C0886F0F6142ACD24C13594F1CB3EB85CDD1C05D0FA9063DA3C6F2F56A9E9F9CB7B25BDA9826A31D419AF6D85591E42D2B725D98065E368B2337C639E9A27E5683D178808FD5CA5CE3A16D1EE2B42CFDAAAB14C9B50B0C3CE25390EEC6983769CD336A19DAEBD856443FC5FEF4A2135EE6055ED580480B6779E0F7CB54C37E09360F25E07D20";}kgw__Captcha|a:1:{s:4:"word";s:4:"t363";}', 1440),
('67h6svck830uqqp5hvhprbtdr7', 1486565759, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('jl3ppnu049mbq2hnfnjj41m6m0', 1486565752, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('uvhl8n01vkeco64s6ip5lap0d4', 1486564973, 'kgw__Anwsion|a:3:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"human_valid";N;}', 1440),
('kmpum150o4va9n630pebi04tl6', 1486564973, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('isgd7p1mm10m15k7hmge0lbul2', 1486560831, 'kgw__Anwsion|a:3:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;s:11:"human_valid";N;}', 1440),
('a0p79da2u9t7atc5s71s18gsr6', 1486565742, 'kgw__Anwsion|a:2:{s:11:"client_info";a:3:{s:12:"__CLIENT_UID";i:1;s:18:"__CLIENT_USER_NAME";s:9:"王小明";s:17:"__CLIENT_PASSWORD";s:32:"2efbc80e24a16c2a1e9c52734198a649";}s:10:"permission";a:15:{s:16:"is_administortar";s:1:"1";s:12:"is_moderator";s:1:"1";s:16:"publish_question";s:1:"1";s:21:"publish_approval_time";a:2:{s:5:"start";s:0:"";s:3:"end";s:0:"";}s:13:"edit_question";s:1:"1";s:10:"edit_topic";s:1:"1";s:12:"manage_topic";s:1:"1";s:12:"create_topic";s:1:"1";s:17:"redirect_question";s:1:"1";s:13:"upload_attach";s:1:"1";s:11:"publish_url";s:1:"1";s:15:"publish_article";s:1:"1";s:12:"edit_article";s:1:"1";s:19:"edit_question_topic";s:1:"1";s:15:"publish_comment";s:1:"1";}}', 1440),
('u11fvh2jg0tkddopt5b411uas2', 1486563499, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('opmjbf88cn91p3gtpv087g94g7', 1486564565, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('cdgkkiv2pauqbernl57t9s6290', 1486564571, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440),
('f7eehb084jf4j03pall9lof022', 1486564973, 'kgw__Anwsion|a:2:{s:10:"permission";a:9:{s:10:"visit_site";s:1:"1";s:13:"visit_explore";s:1:"1";s:12:"search_avail";s:1:"1";s:14:"visit_question";s:1:"1";s:11:"visit_topic";s:1:"1";s:13:"visit_feature";s:1:"1";s:12:"visit_people";s:1:"1";s:13:"visit_chapter";s:1:"1";s:11:"answer_show";s:1:"1";}s:11:"client_info";N;}', 1440);

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
(2, 'site_name', 's:24:"牧院新生交流论坛";'),
(3, 'description', 's:24:"牧院新生交流论坛";'),
(4, 'keywords', 's:51:"新生交流,知识社区,社交社区,问答社区";'),
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
(106, 'report_diagnostics', 's:1:"N";'),
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
(129, 'register_agreement', 's:1608:"当您申请用户时，表示您已经同意遵守本规章。\n欢迎您加入本站点参与交流和讨论，本站点为社区，为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：\n\n一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息：\n　（一）煽动抗拒、破坏宪法和法律、行政法规实施的；\n　（二）煽动颠覆国家政权，推翻社会主义制度的；\n　（三）煽动分裂国家、破坏国家统一的；\n　（四）煽动民族仇恨、民族歧视，破坏民族团结的；\n　（五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；\n　（六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；\n　（七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；\n　（八）损害国家机关信誉的；\n　（九）其他违反宪法和法律行政法规的；\n　（十）进行商业广告行为的。\n\n二、互相尊重，对自己的言论和行为负责。\n三、禁止在申请用户时使用相关本站的词汇，或是带有侮辱、毁谤、造谣类的或是有其含义的各种语言进行注册用户，否则我们会将其删除。\n四、禁止以任何方式对本站进行各种破坏行为。\n五、如果您有违反国家相关法律法规的行为，本站概不负责，您的登录信息均被记录无疑，必要时，我们会向相关的国家管理部门提供此类信息。";');

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
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='话题';

--
-- 转存表中的数据 `aws_topic`
--

INSERT INTO `aws_topic` (`topic_id`, `topic_title`, `add_time`, `discuss_count`, `topic_description`, `topic_pic`, `topic_lock`, `focus_count`, `user_related`, `url_token`, `merged_id`, `seo_title`, `parent_id`, `is_parent`, `discuss_count_last_week`, `discuss_count_last_month`, `discuss_count_update`) VALUES
(1, '默认话题', NULL, 0, '默认话题', NULL, 0, 0, 0, NULL, 0, NULL, 0, 0, 0, 0, 0),
(2, '英才校区', 1486542585, 1, '  ', '20170208/bab54befb2b7ca720c15f2d87e78193b_32_32.jpg', 0, 1, 0, NULL, 0, NULL, 0, 0, 1, 1, 1486543254),
(3, '入学', 1486542585, 1, '  ', '20170208/d1c0913840ea42e28bdb02462e9ccf9a_32_32.jpg', 0, 1, 0, NULL, 0, NULL, 0, 0, 1, 1, 1486542787),
(4, '新生', 1486542585, 4, '  ', '20170208/61c617ed4da0178c35ff829d5cc378d0_32_32.jpg', 0, 1, 0, NULL, 0, NULL, 0, 0, 4, 4, 1486544422),
(5, '新生指南', 1486543254, 1, '  ', '20170208/cec4357f24bd7ea639ade54657a4369c_32_32.jpg', 0, 1, 0, NULL, 0, NULL, 0, 0, 1, 1, 1486543254),
(6, '龙子湖校区', 1486543254, 1, '  ', '20170208/15b902eeddc678a15a74f4e7a254403e_32_32.jpg', 0, 1, 0, NULL, 0, NULL, 0, 0, 1, 1, 1486543254),
(7, '院系分区', 1486543871, 1, '', NULL, 0, 1, 0, NULL, 0, NULL, 0, 0, 1, 1, 1486543871),
(8, '专业调整', 1486543887, 1, '', NULL, 0, 1, 0, NULL, 0, NULL, 0, 0, 1, 1, 1486543887),
(9, '招生章程', 1486544185, 1, '', NULL, 0, 1, 0, NULL, 0, NULL, 0, 0, 1, 1, 1486544185);

-- --------------------------------------------------------

--
-- 表的结构 `aws_topic_focus`
--

CREATE TABLE IF NOT EXISTS `aws_topic_focus` (
  `focus_id` int(11) NOT NULL COMMENT '自增ID',
  `topic_id` int(11) DEFAULT NULL COMMENT '话题ID',
  `uid` int(11) DEFAULT NULL COMMENT '用户UID',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='话题关注表';

--
-- 转存表中的数据 `aws_topic_focus`
--

INSERT INTO `aws_topic_focus` (`focus_id`, `topic_id`, `uid`, `add_time`) VALUES
(1, 2, 1, 1486542585),
(2, 3, 1, 1486542585),
(3, 4, 1, 1486542585),
(4, 5, 1, 1486543254),
(5, 6, 1, 1486543254),
(6, 7, 1, 1486543871),
(7, 8, 1, 1486543887),
(8, 9, 1, 1486544185);

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
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_topic_relation`
--

INSERT INTO `aws_topic_relation` (`id`, `topic_id`, `item_id`, `add_time`, `uid`, `type`) VALUES
(9, 4, 1, 1486543254, 1, 'article'),
(8, 6, 1, 1486543254, 1, 'article'),
(7, 5, 1, 1486543254, 1, 'article'),
(10, 2, 1, 1486543254, 1, 'article'),
(11, 4, 2, 1486543834, 1, 'article'),
(12, 7, 2, 1486543871, 1, 'article'),
(13, 8, 2, 1486543887, 1, 'article'),
(14, 4, 3, 1486544185, 1, 'article'),
(15, 9, 3, 1486544185, 1, 'article'),
(16, 4, 4, 1486544422, 1, 'article');

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_users`
--

INSERT INTO `aws_users` (`uid`, `user_name`, `email`, `mobile`, `password`, `salt`, `avatar_file`, `sex`, `birthday`, `province`, `city`, `job_id`, `reg_time`, `reg_ip`, `last_login`, `last_ip`, `online_time`, `last_active`, `notification_unread`, `inbox_unread`, `inbox_recv`, `fans_count`, `friend_count`, `invite_count`, `article_count`, `question_count`, `answer_count`, `topic_focus_count`, `invitation_available`, `group_id`, `reputation_group`, `forbidden`, `valid_email`, `is_first_login`, `agree_count`, `thanks_count`, `views_count`, `reputation`, `reputation_update_time`, `weibo_visit`, `integral`, `draft_count`, `common_email`, `url_token`, `url_token_update`, `verified`, `default_timezone`, `email_settings`, `weixin_settings`, `recent_topics`) VALUES
(1, '王小明', '240313001@qq.com', '', '2efbc80e24a16c2a1e9c52734198a649', 'miat', '000/00/00/01_avatar_min.jpg', 3, 875548800, '河南省', '郑州市', 4, 1486474930, 3659362393, 1486566139, 3659362393, 68989, 1486566139, 0, 0, 0, 1, 0, 0, 4, 0, 0, 8, 10, 1, 5, 0, 1, 0, 0, 0, 1, 0, 1486566131, 1, 2040, 0, '240313001@qq.com', NULL, 0, NULL, '', '', '', 'a:5:{i:0;s:6:"新生";i:1;s:12:"招生章程";i:2;s:12:"专业调整";i:3;s:12:"院系分区";i:4;s:12:"英才校区";}'),
(2, 'admin1', '672779@qq.com', '', '5ccf3435429383d7c2aa2758283e225b', 'xdqw', NULL, 0, NULL, NULL, NULL, 0, 1486528715, 3659362393, 1486541906, 3659362393, 1, 1486541906, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 5, 1, 5, 0, 1, 0, 0, 0, 0, 0, 1486566131, 1, 2000, NULL, NULL, NULL, 0, NULL, NULL, 'a:2:{s:9:"FOLLOW_ME";s:1:"N";s:10:"NEW_ANSWER";s:1:"N";}', '', NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='用户附加属性表';

--
-- 转存表中的数据 `aws_users_attrib`
--

INSERT INTO `aws_users_attrib` (`id`, `uid`, `introduction`, `signature`, `qq`, `homepage`) VALUES
(1, 1, NULL, '人面不知何处去，桃花依旧笑春风', 240313001, ''),
(2, 2, NULL, NULL, NULL, NULL);

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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='通知设定';

--
-- 转存表中的数据 `aws_users_notification_setting`
--

INSERT INTO `aws_users_notification_setting` (`notice_setting_id`, `uid`, `data`) VALUES
(1, 2, 'a:0:{}');

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
(1, 1486566139, 3659362393, 'http://www.myuahe.com/?/account/login/', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2883.87 Safari/537.36');

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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='用户操作记录';

--
-- 转存表中的数据 `aws_user_action_history`
--

INSERT INTO `aws_user_action_history` (`history_id`, `uid`, `associate_type`, `associate_action`, `associate_id`, `add_time`, `associate_attached`, `anonymous`, `fold_status`) VALUES
(1, 1, 4, 401, 2, 1486542585, -1, 0, 0),
(2, 1, 4, 406, 2, 1486542585, -1, 0, 0),
(3, 1, 4, 401, 3, 1486542585, -1, 0, 0),
(4, 1, 4, 406, 3, 1486542585, -1, 0, 0),
(5, 1, 4, 401, 4, 1486542585, -1, 0, 0),
(6, 1, 4, 406, 4, 1486542585, -1, 0, 0),
(7, 1, 1, 501, 1, 1486542585, -1, 0, 0),
(8, 1, 4, 401, 5, 1486543254, -1, 0, 0),
(9, 1, 4, 406, 5, 1486543254, -1, 0, 0),
(10, 1, 4, 401, 6, 1486543254, -1, 0, 0),
(11, 1, 4, 406, 6, 1486543254, -1, 0, 0),
(12, 1, 1, 501, 2, 1486543834, -1, 0, 0),
(13, 1, 4, 401, 7, 1486543871, -1, 0, 0),
(14, 1, 4, 406, 7, 1486543871, -1, 0, 0),
(15, 1, 4, 401, 8, 1486543887, -1, 0, 0),
(16, 1, 4, 406, 8, 1486543887, -1, 0, 0),
(17, 1, 4, 401, 9, 1486544185, -1, 0, 0),
(18, 1, 4, 406, 9, 1486544185, -1, 0, 0),
(19, 1, 1, 501, 3, 1486544185, -1, 0, 0),
(20, 1, 1, 501, 4, 1486544422, -1, 0, 0),
(21, 1, 4, 404, 4, 1486545018, -1, 0, 0),
(22, 1, 4, 403, 4, 1486545021, -1, 0, 0),
(23, 1, 4, 404, 2, 1486545081, -1, 0, 0),
(24, 1, 4, 403, 2, 1486545082, -1, 0, 0),
(25, 1, 4, 404, 3, 1486545119, -1, 0, 0),
(26, 1, 4, 403, 3, 1486545120, -1, 0, 0),
(27, 1, 4, 404, 5, 1486545181, -1, 0, 0),
(28, 1, 4, 403, 5, 1486545183, -1, 0, 0),
(29, 1, 4, 404, 6, 1486545219, -1, 0, 0),
(30, 1, 4, 403, 6, 1486545219, -1, 0, 0);

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

--
-- 转存表中的数据 `aws_user_action_history_data`
--

INSERT INTO `aws_user_action_history_data` (`history_id`, `associate_content`, `associate_attached`, `addon_data`) VALUES
(1, '英才校区', '', ''),
(2, '', '', ''),
(3, '入学', '', ''),
(4, '', '', ''),
(5, '新生', '', ''),
(6, '', '', ''),
(7, '新生常见问题一览', '\n[b][attach]1[/attach][/b]\n [b]英才校区常见问题集锦[/b]\n\n首先，恭喜河南牧业经济学院录取，来到河南牧业经济学院就像来到一个大家庭，希望大家互帮互助，共同进步。对于近期学弟学妹们比较关心各种衣食住行的相关问题，作为学长学姐都很高兴为大家进行解读。我作为14级学姐，列了一个常见小问题清单，针对这么多天询问问题的情况，在此作一个统一答复，以便学弟学妹们查看。希望对大家有所帮助！\n \n[list=1]\n[*]住宿方面:英才校区有六人间和八人间，都是从上下铺，桌子独立开的，（六人间八人间没什么差别的，个人感觉八人间宽敞）不独卫，宿舍内没空调有风扇暖气，住宿楼层越往上暖气越暖和，宿舍每个人一个充电插头，记的自己买插板，大功率的电器就不用带了，什么烧水壶，吹风机都不能用，一用就断电，总之超过200瓦的电器都不行。至于还有好多同学想着能在宿舍吃火锅熬粥什么的，都可以洗洗睡了。宿舍一个月免费供电25度，用超了需要自己去八号办缴费。宿舍一层楼有两个大的洗手间和厕所。宿舍是学校安排统一分配，住宿费是六人间800元，八人间600元，女生本科都是6人间，专科8人间，男生全部是六人间。  每个人都有权利选择床位，基本上都是各班一起住在一起，不排除有混寝。宿舍每天都有可能检查卫生，宿管大妈一般会在上午8点封楼后检查，学校每个院系也有学生会的同学在7点到7点半之间检查卫生，所以宿舍卫生一定要保持干净，不然不合格多次很有可能会被带到办公室接受辅导员训话。全校有18栋宿舍楼，1到17栋宿舍都是6楼，18号楼宿舍12层，8层以下住学生，当然都是没有电梯的，大家不用幻想了。学校两个免费的热水房，方便大家接热水，冬夏季节水时间限制不一样，具体时间你们可以在开水房门口看到。当然学校有澡堂，理发店，洗澡一次4元。[/*]\n[*]出行环境：英才校区位于北三环北大学城附近，学校门口公交车很多，交通便利。坐95路直达火车站，坐962直达汽车站，还有b52,b51,79,156等等。学校门口有夜市小吃街，附近有郑州师范学院中州大学等，学校里有郑州银行自动取款机，邮政取款机，学校外面有河南省农村信用社，邮政银行，工商银行自动取款机，（新生们如果是省内学生建议办个河南省农村信用社卡取钱，或者办个中原银行卡在学校郑州银行取款不收手续费）。[/*]\n[*]美食介绍：在我们学校有这么一句话“东边的饭，西边的面，大食堂二楼的卤肉饭。早餐的粥，晚饭的汤，东餐厅二楼的菜家常。”小餐厅东一生意最火爆，各种盖浇饭都不错，而且茶饮也都可以，便宜好喝；西九的锅仔最出名，东二楼的小四川饭店，小顺子饭店有各种家常菜，最适合小型聚会；东一楼最好吃的麻辣烫是杨国福麻辣烫，有点贵，个人感觉没十几块钱吃不饱。大餐厅适合早餐，小餐厅适合午餐晚餐。学校里面有52乐购超市，里面东西很全的，应有尽有。学校门口小吃很多，炒凉粉烤面筋炒酸奶都很棒，往大学城那面走，一堆小吃摊，一天吃一家，也够一个月的了。[/*]\n[*]各种费用问题:学校学费统一存入通知书卡内，学费住宿费通知书内有明确说明。对于助学贷款，在通知书内有个红色或者绿色本本，是有专门写明助学贷款事宜，若打算申请助学贷款请不要把学费等钱存入卡内，到学校后方便申请助学贷款。还有申请助学金的需要准备以下材料：1.户口本 首页、父、母页 本人页 复印件 共4页。2.父母身份证正反面复印件 共2页。3.自己手写一份申请书。4.手写三级证明（村里手写的证明 上面需要盖三个章 村、乡镇 、县）5.如果有低保证、孤儿证之类的 有复印件更好。[/*]\n[*]宽带上网问题：这个问题大家最关心，毕竟wifi是大家的命，学校的wifi也就是校园网，必须用本校52乐购的卖的联通手机卡，跟这个手机卡也很划算，最低消费每月16，每个月30元的无线网费，一个月46元足够，校园内哪个角落都可以用哦。[/*]\n[*]生活小问题：各位新生来的时候家离不远的话都建议自己带被褥，不要在学校门口购买。开学的时候拿着录取通知书买车票会半价，学校也派有校车在火车站附近接你们，这个详细情况在录取通知书里会说的。还有，大一有早操和早读，不上早读就上早操，具体看各班安排。一周12节课，每天不固定，有时候满课，有时候没课，有时候一两节课，学校不是封闭式的，方便外出。开学军训10天左右，大家可提前做好防晒准备工作，届时会买校服，统一着装军训。[/*]\n[*]至于还有好多同学问一些学校学生会、团学会、协会的情况，其中学生会是属于校级部门，就是各个院系的人谁都可以去面试加入，也是有很多部门，负责全校各个系的通知安排和辅助工作，就是你进入学生会将会结交外学院的小伙伴，学生会招新工作会在10月初举行。至于学校协会也是有很多，基本上都是以娱乐性协会为主，招新工作会在开学初9月下旬在校园里举行，协会30多个，比如：四季风协会，朋辈，武术协会，交际舞协会，会计协会、棋艺协会，茶艺协会等等。基本上大家都是根据个人爱好加入各种社团协会，以丰富自己的课余活动，增加见识阅历。对于院级系级的团学会本人还是比较了解可以给大家讲解的详细一点，也算是举个例子，本学校各个院系都会有团学会，有很多部门，也是在9月下旬进班宣传招新。例如会计学院详细情况如下：[/*]\n[/list]\n[list]\n[*][b][i]主席团[/i][/b]：贯彻执行党总支、团委各项有关学生工作决议。对全系各类活动进行决策、布置和协调。[/*]\n[/list]\n十三个部门介绍 ：\n[list]\n[*][b]办公室：[/b]召集团学会各类会议，做好会务工作，上传下达老师的安排分配，安排好各个部门的活动情况，帮助其他部门完成举办的大型活动，负责整个团学会的工作计划工作总结的整理工作，以及班级团课的检查工作。[/*]\n[*][b]组织部：[/b]负责全院系同学的团课检查，团员党员信息的整理，负责维系促进会计学院各团支部（班级）的具体日常工作，及各团员的各项思想政治学习，协助党支部工作。负责会计学院的摄影工作及协助所有部门组织举办活动。[/*]\n[*][b]学习部：[/b]学风检查，组织各类活动，带动全院学习气氛，为学生学习提供各类信息支持和方法及指导，每周有三天要查早读，每周汇总一次班级日志，各部门有什么活动，协助各部门记成绩部门内部的活动  会有英语演讲比赛、英语歌曲比赛、英语话剧比赛 。  [/*]\n[*][b]文艺部：[/b]组织各类文艺活动，并配合校里里搞好文艺演出，丰富师生的精神文化生活。文举办的校级活动主要有健美操比赛、大合唱比赛，举办的系级比赛主要有迎新晚会、卡扣OK大赛、礼仪模特大赛等等。网教部：上传系新闻，编辑搜集发放微信，举办活动，培训office方面只是，协助其他部门举办活动，每个部门的活动都需要协助。[/*]\n[*][b]运用宣传部：[/b]多种手段对我院政策、信息、团学会活动进行宣传（ps.展板、海报、院系网站、微信公众平台、微博等）。为全院学生第一时间传递学校、学院发布的信息，并及时反馈他们的意见和建议 。与网教部合作对系网站、微信(英才会计)、微博（河南牧业经济学院英才校区团委）等进行运营与维护；与其他部门共同开展内部建设活动，并对我院宣传工作进行监督； 定期举办宣传技能培训（ps.新闻稿写作、书法练习），提高各宣传部成员宣传工作方面的水平；协助团学会其他部门开展工作，使各部门工作更好的完成。 [/*]\n[*][b]体保部：[/b]举办各类体育竞赛，增强学生的竞争意识和体质，检查学生们的早操情况，每天都有一定的时间去训练自己，篮球比赛排球比赛运动会都需要全力去参与其中。 [/*]\n[*][b]纪检部：[/b]纪检部的主要工作是查课，负责检查同学们的考勤状况，以起到督促作用。纪于心检于行，规范校园纪律，和同学们共同营造良好校园氛围。另外纪检部还负责辩论赛的举办，活动的举办更体现出部里成员的团结以及欣赏到参赛选手的唇枪舌战。[/*]\n[*][b]素拓部：[/b]该部门以培养大学生的思想素质为核心，以培养创新精神和实践能力为重点，开展能普遍提高大学生科学素养和人文素养的活动。部门工作内容主要涵盖创新创业、社团活动、点钞技能培训及团学会内部素拓等几个方面，以及带领全院系学生的素质拓展训练，各种大型素质拓展运动会。[/*]\n[*][b]心教部：[/b]心教部负责则学院学生心理健康问题，每月负责调查我们系同学的心理健康状况并且和校心理中心沟通。定期给心理委员开会等等。同时还会举许多的活动和比赛，比如家乡秀，以及心理话剧等大型活动 。[/*]\n[*][b]社实部：[/b]社实部顾名思义就是社会实践。带领全院系参加个各种社会实践活动，增强同学的社会实践能力，社实部每月会有一次户外活动，类似进社区，进养老院，去孤儿院等等。 [/*]\n[*][b]生活部：[/b]全体成员为男生，主要负责会计学院的学生生活方面，以及对日常其他部门活动的支持配合工作，定期进行学生宿舍内务大检查以及教室卫生检查，宣传生活常识，与团学会会他各部门竭诚配合，为同学们营造一个安心舒适的学习生活环境。[/*]\n[*][b]女生部：[/b]全体成员为女生，平时的工作主要是检查督促女生宿舍卫生，为会计系女生营造个良好舒适共适应的环境，除此外，该部在各部门有需要时会尽可能去帮忙！当然同生活部也会举办诸如宿舍文化节、手工艺品大赛、手抄报、主持人大赛、征文活动、、反法西斯周年的演讲征文比赛，还有专属于女生的节日女生节等等。[/*]\n[/list]\n以上的各个部门除了主席团不招新，其他部门院系里新生都可以去面试参加，十三个部门都不可缺少，大家都是尽心尽力为全学院服务，在会计学院团学会这个大家庭，大家是相亲相爱的一家人，团结就是力量，每个人不管在哪个部门都需要严于律己，做好自身工作并帮助其他部门一起开展各个活动，团结是会计学院团学会的一大特色。对于这些部门还有什么不懂的，军训期间各部门就会招新进班宣传，大家可以更详细了解。最后给大家说一点最重要的咱们学校有一种分叫做操行分，特别重要，这个操行分是根据你平时参加活动获奖增加，也可以根据宿舍评比情况增加或者减少，还有就是逃课会扣操行分，总之呢，加操行分很难，减分很容易，所以平时逃课宿舍卫生什么的都要特别注意。\n\n希望写了这么多常见的小问题会帮助到各位新生同学，大家还有什么问题都可以再在群里咨询各位学长学姐，这份锦集的完成，也要感谢会计学院团学会各个部门小伙伴的帮助。最后，最重要的，各位新生报到的时候千万不要忘带录取通知书，自己的档案，还有团员关系转走证明，身份证，团员证，高中毕业证，高考准考证，如果你是预备党员，预备党员转正证明，党课结业证什么的，大家一定要带齐全，不然报道很麻烦。即将作为一名大二的学姐给你们写这么多话，希望对学弟学妹们有所帮助。最后，预祝各位学弟学妹大学生活愉快呦！\n', ''),
(8, '新生指南', '', ''),
(9, '', '', ''),
(10, '龙子湖校区', '', ''),
(11, '', '', ''),
(12, '河南牧业经济学院院系分区和专业调整方案', '\n[attach]6[/attach]\n\n[attach]3[/attach]\n\n[attach]8[/attach]\n\n[attach]5[/attach]\n\n[attach]4[/attach]\n\n[attach]7[/attach]\n\n[attach]9[/attach]\n\n[attach]10[/attach]\n\n[attach]11[/attach]\n ', ''),
(13, '院系分区', '', ''),
(14, '', '', ''),
(15, '专业调整', '', ''),
(16, '', '', ''),
(17, '招生章程', '', ''),
(18, '', '', ''),
(19, '河南牧业经济学院招生章程', '[b]第一章 总则 [/b]\n[list]\n[*]第一条 为了保证河南牧业经济学院招生工作顺利进行，规范招生行为，维护考生合法权益，学校依据《中华人民共和国教育法》、《中华人民共和国高等教育法》及河南省教育厅有关规定，特制定本章程。 [/*]\n[*]第二条 本章程适用于河南牧业经济学院普通全日制本科及专科层次招生工作。 [/*]\n[*]第三条 学校招生工作贯彻“公平、公开、公正、严格程序、择优录取、接受监督”的原则，受纪检监察部门、新闻媒体、考生及家长的监督。 [/*]\n[/list]\n[b]第二章 学校概况[/b] \n[list]\n[*]第四条 河南牧业经济学院（英文译名：Henan University of Animal Husbandry and Economy”，简写为“HUAHE”）为省属普通高等本科学校。经教育部批准,于2013年由原郑州牧业工程高等专科学校、河南商业高等专科学校合并成立。 [/*]\n[*]第五条 学校座落于九州之中、中华腹地的河南省省会郑州，濒临中华民族的母亲河——黄河。现有全日制在校生三万两千余人，拥有农学、经济学、管理学、文学、工学、理学、法学、艺术学等八大学科，设有动物科技学院、制药工程学院、会计学院、工商管理学院等20个教学院系、5个教学部、1个示范性软件职业技术学院、1个继续教育学院和1个国际教育学院，建设有27个本科专业(含7个方向)和78个专科专业（含24个专业方向），其中动物科学、财务管理本科专业被确定为省级“专业综合改革试点”专业，畜牧、兽医专科专业为中央财政支持提升专业服务产业能力项目，食品加工技术、会计电算化、市场营销和物流管理等15个专业为省级特色专业。 [/*]\n[*]第六条 国标代码：10469，河南省招生代码：6045、6047（中外合作办学）、6048(软件类专业)。 [/*]\n[*]第七条 办学性质：公办。 [/*]\n[*]第八条 办学层次：本科、专科。 [/*]\n[*]第九条 办学类型：普通高等学校。 [/*]\n[*]第十条 学习形式：全日制。 [/*]\n[*]第十一条 证书颁发：学生学业期满，成绩合格，由学校颁发国家承认的普通高等学校本、专科毕业证书，符合学士学位授予条件的，授予学位证书。 [/*]\n[*]第十二条 办学地点：郑州市郑东新区龙子湖高校园区龙子湖北路6号（龙子湖校区）；郑州市惠济区英才街2号（英才校区）；郑州市金水区北林路16号（北林校区）。 [/*]\n[/list]\n[b]第三章 组织机构[/b] \n[list]\n[*]第十三条 学校按照上级要求设立校招生工作领导小组，负责制定招生政策，讨论决定招生重大事宜。 [/*]\n[*]第十四条 河南牧业经济学院招生就业处是学校常设机构，负责学校普通招生工作。 [/*]\n[/list]\n[b]第四章 招生计划[/b] \n[list]\n[*]第十五条 学校根据发展规模、办学条件、学科发展、生源状况和社会需求制定当年招生计划，并报上级主管部门审核。审核后的招生计划由我校通过招生信息网、招生简章等形式向社会公布。 [/*]\n[/list]\n[b]第五章 录取 [/b]\n[list]\n[*]第十六条 学校招生录取工作在省教育厅、省招办领导下，执行教育部规定的“学校负责，招办监督”的录取体制。 [/*]\n[*]第十七条 学校按照理工类、文史类、专升本类、对口类、艺术类分类录取考生。 [/*]\n[*]第十八条 按照我省有关规定，农林院校对省内第一志愿报考我校考生（不含专升本、艺术、对口批次）加20分投档。外省则根据当地有关政策执行；投档比例按照各省招生部门有关要求执行，录取时按招生计划数分配专业，缺额专业将在剩余投档考生中择优录取。 [/*]\n[*]第十九条 学校投档严格按照各省相应批次投档政策执行。专业录取规则：对进档考生，结合各专业的录取条件，按照“专业清”的办法进行录取。考生志愿为平行志愿时，各志愿同等对待；考生志愿为非平行志愿时，按照考生志愿顺序录取，优先录取第一志愿，第一志愿生源不足时依次录取后续志愿的考生。 [/*]\n[*]第二十条 学校原则上认可各省教育厅或高招办有关照顾和优先录取的政策，专业安排以考生的特征成绩作为主要依据。 [/*]\n[*]第二十一条 [i]艺术类招生[/i] 我校艺术类招生分为本科和专科两个层次，艺术类本科录取规则为：在文化课成绩和专业成绩达到最低录取控制分数线的情况下，按照（文化课成绩×40%＋专业成绩×60%）从高到低录取。艺术类专科录取规则为：在文化课成绩和专业成绩达到最低录取控制分数线的情况下，按照文化课成绩从高到低录取。 [/*]\n[*]第二十二条 [i]示范性软件职业学院[/i] 软件学院是经河南省教育厅批准成立的2年制普通专科培养模式。 [/*]\n[*]第二十三条 [i]中外合作办学[/i] 学校与爱尔兰的卡罗理工学院、沃特福德理工学院等国外知名大学联合办学，开设会计学与市场营销两个中外合作本科课程项目，设有会计、市场营销和工商企业管理等3个专科专业。 [/*]\n[*]第二十四条 [i]体检要求[/i] 对考生身体健康状况要求，执行教育部和卫生部等部门制定的《普通高等学校招生体检工作指导意见》和有关补充规定。 [/*]\n[/list]\n[b]第六章 学费和奖助学金 [/b]\n[list]\n[*]第二十五条 [i]各专业学费[/i] 根据国家规定，学生入学须交纳学费、住宿费及其它相关费用。学校按河南省物价部门核定的收费标准对学生收取学费、住宿费及其它相关费用。考生可以在学校公布的招生计划中查询各专业学费，收费标准如有变动，以物价管理部门有关文件规定为准。 [/*]\n[*]第二十六条 [i]奖励与资助[/i] [b]优秀学生奖励体系：[/b]1、国家奖学金，每生每年8000元。2、国家励志奖学金，每生每年5000元。3、国家助学金，平均每生每年3000元。4、另设有企业奖学金和单项奖学金。 [b]困难学生资助体系：[/b]1、勤工助学：学校设置勤工助学岗位，困难生可进行勤工助学。2、国家助学贷款：根据《河南省属高校国家助学贷款管理暂行办法》规定，家庭经济困难且符合国家助学贷款条件的学生，可申请国家助学贷款最高为8000元/生.年。  [/*]\n[/list]\n[b]第七章 附则[/b] \n[list]\n[*]第二十七条  高考咨询人员意见仅供参考，不作为录取依据及承诺。学校未委托任何中介机构或个人进行招生录取工作。对以我校名义进行非法招生活动的中介机构或个人，我校将依法追究其相应责任。 [/*]\n[*]第二十八条 新生持学校发放的录取通知书在规定时间内来校报到，对未经同意逾期两周不报到的已录取考生，视其为自行放弃入学资格。 [/*]\n[*]第二十九条 新生入校后，将依据教育部有关文件规定进行新生资格审查，复查合格者取得学籍。复查不合格者，学校将视不同情况予以处理，直至取消入学资格。凡发现弄虚作假者，一律取消入学资格。 [/*]\n[*]第三十条  本章程自省教育厅审核备案之日起生效。学校以往有关招生政策、规定如与本章程冲突，以本章程为准；本章程若与国家法律、法规或上级有关政策相抵触，以国家法律、法规、上级有关政策为准； [/*]\n[*]第三十一条  本章程具体事项按照当年公布为准，由河南牧业经济学院负责解释。 [/*]\n[/list]\n', ''),
(20, '新生报到路线', '[b]客运总站[/b]，有两条线路：\n[i]线路一：[/i]站内乘坐 603路(或 906路 ) → 305路     \n\n[b]汽车客运总站 [/b] 上车，603路(或 906路 )，到 人民公园东门站 下车；   \n人民公园东门站 上车，305路，到 终点站（郑州牧业高等专科）下车，即为我校北门。 \n\n[i]线路二：[/i] 962路 → 305路       \n站内乘坐汽车客运总站  上车  962路，到 紫荆山公园站 下车；   \n紫荆山金水东路站 上车，305路，到 终点站（郑州牧业高等专科）下车，即为我校北门。\n打车大概需要50元左右\n\n[b]客运中心站：[/b]\n乘坐305路，到 终点站（郑州牧业高等专科） 下车，即为我校北门。此外，可以到火车站西出站口乘坐我校接送专车。\n打车大概需要40元左右\n\n\n[b]客运南站：[/b]\n906路 → 305路\n汽车客运南站 上车，906路，人民公园东门站 下车；\n[b]人民公园东门站[/b]  上车，305路，到 终点站（郑州牧业高等专科）下车，即为我校北门。\n打车大概需要50元左右\n\n[b]客运东站，有两条线路：[/b]\n[i]线路一：[/i]570路 → 305路\n商都路东风南路站 上车，570路，金水路中兴路站 下车；\n金水东路中兴路站 上车，305路，到 终点站（郑州牧业高等专科）下车，即为我校北门。\n[i]线路二：[/i]278路 → 305路\n汽车客运东站 上车，278路，东风南路金水东路站 下车；\n金水东路东风南路站 上车，305路，到 终点站（郑州牧业高等专科）下车，即为我校北门。\n打车大概需要25元左右\n\n[b]新北站：[/b]\n156路 → 166路\n[b]花园路国泰路站[/b] 上车，156路，农业东路龙湖外环路站 下车；\n[b]农业东路龙湖外环路站[/b] 上车，166路，河南畜牧专科学院站 下车，即为我校。\n打车大概需要45元左右\n\n\n[b]自驾车：[/b]无论你从哪个方向来郑州，请到郑州市的新区站下高速，下高速后右转往金水东路方向行驶，沿金水东路行驶到明理路（其中路过河南政法大学）右转（到明理路时有提前右转到），沿明理路直行走到没路（因为修地铁封路了）就到河南牧业经济学院西门。\n\n\n[b]火车站：[/b]我校在火车站西广场有专车接站，制药工程学院在龙子湖校区，请同学们看好发车方向。\n', ''),
(21, '20170208/61c617ed4da0178c35ff829d5cc378d0_32_32.jpg', '', ''),
(22, '  ', '', ''),
(23, '20170208/bab54befb2b7ca720c15f2d87e78193b_32_32.jpg', '', ''),
(24, '  ', '', ''),
(25, '20170208/d1c0913840ea42e28bdb02462e9ccf9a_32_32.jpg', '', ''),
(26, '  ', '', ''),
(27, '20170208/cec4357f24bd7ea639ade54657a4369c_32_32.jpg', '', ''),
(28, '  ', '', ''),
(29, '20170208/15b902eeddc678a15a74f4e7a254403e_32_32.jpg', '', ''),
(30, '  ', '', '');

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
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `aws_user_action_history_fresh`
--

INSERT INTO `aws_user_action_history_fresh` (`id`, `history_id`, `associate_id`, `associate_type`, `associate_action`, `add_time`, `uid`, `anonymous`) VALUES
(24, 24, 2, 4, 403, 1486545082, 1, 0),
(26, 26, 3, 4, 403, 1486545120, 1, 0),
(22, 22, 4, 4, 403, 1486545021, 1, 0),
(7, 7, 1, 1, 501, 1486542585, 1, 0),
(28, 28, 5, 4, 403, 1486545183, 1, 0),
(30, 30, 6, 4, 403, 1486545219, 1, 0),
(12, 12, 2, 1, 501, 1486543834, 1, 0),
(14, 14, 7, 4, 406, 1486543871, 1, 0),
(16, 16, 8, 4, 406, 1486543887, 1, 0),
(18, 18, 9, 4, 406, 1486544185, 1, 0),
(19, 19, 3, 1, 501, 1486544185, 1, 0),
(20, 20, 4, 1, 501, 1486544422, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `aws_user_follow`
--

CREATE TABLE IF NOT EXISTS `aws_user_follow` (
  `follow_id` int(11) unsigned NOT NULL COMMENT '自增ID',
  `fans_uid` int(11) DEFAULT NULL COMMENT '关注人的UID',
  `friend_uid` int(11) DEFAULT NULL COMMENT '被关注人的uid',
  `add_time` int(10) DEFAULT NULL COMMENT '添加时间'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户关注表';

--
-- 转存表中的数据 `aws_user_follow`
--

INSERT INTO `aws_user_follow` (`follow_id`, `fans_uid`, `friend_uid`, `add_time`) VALUES
(1, 2, 1, 1486528715);

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
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
  MODIFY `id` int(11) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
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
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '话题id',AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `aws_topic_focus`
--
ALTER TABLE `aws_topic_focus`
  MODIFY `focus_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `aws_topic_merge`
--
ALTER TABLE `aws_topic_merge`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `aws_topic_relation`
--
ALTER TABLE `aws_topic_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增 ID',AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `aws_users`
--
ALTER TABLE `aws_users`
  MODIFY `uid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户的 UID',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `aws_users_attrib`
--
ALTER TABLE `aws_users_attrib`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `aws_users_group`
--
ALTER TABLE `aws_users_group`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `aws_users_notification_setting`
--
ALTER TABLE `aws_users_notification_setting`
  MODIFY `notice_setting_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',AUTO_INCREMENT=2;
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
  MODIFY `history_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `aws_user_action_history_fresh`
--
ALTER TABLE `aws_user_action_history_fresh`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `aws_user_follow`
--
ALTER TABLE `aws_user_follow`
  MODIFY `follow_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID',AUTO_INCREMENT=2;
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
