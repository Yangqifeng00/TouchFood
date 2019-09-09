# Host: localhost  (Version: 5.5.32)
# Date: 2019-07-24 10:09:09
# Generator: MySQL-Front 5.3  (Build 2.42)

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;

CREATE DATABASE `touchfood` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `touchfood`;

#
# Source for table "commodity_info"
#

CREATE TABLE `commodity_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` int(11) unsigned DEFAULT NULL,
  `price` varchar(20) DEFAULT NULL,
  `lg_img` varchar(255) DEFAULT NULL,
  `sm_img` varchar(255) DEFAULT NULL,
  `desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "commodity_info"
#

INSERT INTO `commodity_info` VALUES (1,'芝士焗土豆泥',1,'25.00','img/food/01_lgrge.jpg','img/food/01_small.jpg','芝士焗土豆泥，把土豆泥做出披萨的感觉，有点异国风情，是老人家习惯了一辈子中餐的嘴巴和胃也容易接受的味道。而且马苏里拉芝士特殊的香味和拉丝，加上土豆泥的软糯好入口，都很适合老人，绝对有惊喜。'),(2,'营养蔬菜沙拉',2,'35.00','img/food/02_lgrge.jpg','img/food/02_small.jpg','蔬菜沙拉是一种非常营养健康的饮食方法。首先它大多不必加热，这样会最大限度的保持住蔬菜中的各种营养不至于被破坏或流失。蛋黄沙拉酱内加入适量的甜味鲜奶油，其制出的沙拉奶香味浓郁，甜味加重'),(3,'什锦早餐',1,'30.00','img/food/03_lgrge.jpg','img/v/03_small.jpg','鲟龙鱼鱼子颗粒大且饱满，色泽乌黑亮丽，富含17种氨基酸及多种微量元素，被誉为“黑色黄金”。用鲟龙鱼子制成的鱼子酱为美食珍品，过去一直是皇家贡品;在西方，品味鲟龙鱼鱼子酱亦是上流社会的专利，甚至是身份、地位的象征。鲟鱼可以补充丰富的氨基酸和微量元素，对于补脑益智有一定的好处和效果，而且还可以有促进代谢，对于提高体质有好处，而且还可以强身健体 '),(4,'西兰花牛排配饭',2,'35.00','img/food/04_lgrge.jpg','img/food/04_small.jpg','土豆的香腻配上蒜头的激烈，跟牛排产生不可思议的碰撞，有了芥兰，中和了其中的油腻和浓烈，切一小块，放入嘴中，红酒的味道在口中慢慢散开，美味而又不油腻，嚼起了嫩嫩的牛肉。坐在幽静的西餐厅中，彷佛身至皇室园亭，徜徉在花海中，闻着花香，观赏着五颜六色的花朵，品尝着人间美味……'),(5,'黑麦鸡蛋番茄酱土司',1,'35.00','img/food/05_lgrge.jpg','img/food/05_small.jpg','肉质松软,肉筋及肥肉非常少,较易消化.此牛肉细嫩,肉快当中油花分布很平均,吃起来香嫩无草腥之外,也可感觉到一股牛油的香味.。蛋切开，半熟半生的鸡蛋蛋黄流了出来。用汤勺钥起了如水一样但又稠稠的蛋黄，配着蛋白抿了一口，嗯~美味极了'),(6,'蒜蓉小羊排配香草荷包蛋',3,'40.00','img/food/06_lgrge.jpg','img/food/06_small.jpg','蒜和羊肉的搭配，遮去掉了羊肉的味道留下鲜美，色泽金红，蒜香味浓，外香里嫩，肉质厚实而鲜嫩；用60种中草药调制的酱料，把羊排腌至入味，然后用小火慢慢烤熟，让羊排的肉质更加有层次感。一口咬下去，羊肉鲜嫩不柴，非常的有味道。'),(7,'香煎黑椒鳕鱼配新鲜柠檬黄金米饭',2,'20.00','img/food/07_lgrge.jpg','img/food/07_small.jpg','鳕鱼趁热吃之前淋上新鲜柠檬汁，不仅解腻还可以增加鱼肉的鲜味。口感鲜嫩，口味蔬香浓郁，沙律酱香甜去腻'),(8,'意大利香草配鲜香小炒肉 ',3,'30.00','img/food/08_lgrge.jpg','img/food/08_small.jpg','肉质鲜嫩，油香而不腻，酸辣鲜香。用肥瘦相间，鲜嫩滑口的五花肉搭配新鲜爽口的青红椒斜块配以辣味简单快炒，瞬间令人胃口大开'),(9,'Pan Pizza培根黑橄榄披萨',1,'45.00','img/food/09_lgrge.jpg','img/food/09_small.jpg','披萨，首次尝试了薄脆无边的饼底，又薄又脆，口感真的非常棒。填满馅料的时候，顺手又抓一把黑橄榄撒在上面，没想到，就是这一小把，却带来了意想不到的惊喜口感。薄脆的饼底，加上奶香浓郁的馅料，每一口还夹杂着黑橄榄，绝对是美妙的享受…没有尝试过这样搭配的顾客，强烈推荐，一定要试一试，喜欢黑橄榄的顾客，就更加不能错过了。'),(10,'香草圣女果鱼块通心粉',1,'35.00','img/food/10_lgrge.jpg','img/food/10_small.jpg','鱼肉在圣女果的滋润下味道愈发鲜美，配上Q弹的通心粉，美味更加难以抵挡。这道菜也有许多变化，撒上撕碎的面包块、芝士粉、调上自己喜爱的酱汁，都会有不一样的奇妙感觉。'),(11,'番茄蘑菇肉酱意大利面',3,'20.00','img/food/11_lgrge.jpg','img/food/11_small.jpg','这款意面番茄的口味有点重，混合着意大利香草的味道，罗勒、九重塔之类的，更加激发了食物本身的美味，喜欢追求正宗西餐味道的贵客可以尝试一下的，正所谓萝卜白菜各有所爱，只要自己吃着开心就好。'),(12,'黑胡椒酱汁牛排',3,'30.00','img/food/12_lgrge.jpg','img/food/12_small.jpg','厚实的肉层里面，油脂部分几乎是呈雪花状的分布，烹饪的时候油分被逐渐逼出滋润了瘦肉部分，丰腴滑嫩好吃，口感绝不会又干又柴！ 鲜香多汁，既有牛排的嚼劲，又嫩得几乎是嚼而即“溶”。一颗颗微型炸-弹在舌尖上爆开，把裹挟着浓郁牛肉和浇汁香的味觉猛的喷开，从舌尖一直冲刺到脑门，霎时间微汗满面，香满唇间。');

#
# Source for table "commodity_type"
#

CREATE TABLE `commodity_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "commodity_type"
#

INSERT INTO `commodity_type` VALUES (1,'早餐',NULL),(2,'午餐',NULL),(3,'晚餐',NULL),(4,'饮品',NULL);

#
# Source for table "message"
#

CREATE TABLE `message` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(11) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `mess_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

#
# Data for table "message"
#


#
# Source for table "order_"
#

CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "order_"
#


#
# Source for table "orderitem"
#

CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sm_img` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` varchar(20) DEFAULT NULL,
  `couprice` varchar(20) DEFAULT NULL,
  `sub_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `oid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

#
# Data for table "orderitem"
#


#
# Source for table "userlist"
#

CREATE TABLE `userlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `tou_img` varchar(255) DEFAULT NULL,
  `sex` char(4) DEFAULT NULL,
  `age` int(4) DEFAULT '18',
  `qq` varchar(50) DEFAULT NULL,
  `e_mail` varchar(50) DEFAULT NULL,
  `uaddress` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

#
# Data for table "userlist"
#


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
