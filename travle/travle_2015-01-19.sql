# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 10.0.13-MariaDB)
# Database: travle
# Generation Time: 2015-01-18 19:54:52 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table apply
# ------------------------------------------------------------

DROP TABLE IF EXISTS `apply`;

CREATE TABLE `apply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `time` text,
  `other` text,
  `location` text,
  `create_time` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table area
# ------------------------------------------------------------

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `order_index` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;

INSERT INTO `area` (`id`, `name`, `order_index`)
VALUES
	(1,'华东',1),
	(2,'华南',2),
	(3,'华中',3),
	(4,'华北',4),
	(5,'西北',5),
	(6,'西南',6),
	(7,'东北',7),
	(8,'港澳台',8);

/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `provice` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;

INSERT INTO `city` (`id`, `name`, `area_id`, `provice`)
VALUES
	(1,'北京',4,'北京'),
	(2,'上海',1,'上海');

/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table pic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pic`;

CREATE TABLE `pic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `pic` WRITE;
/*!40000 ALTER TABLE `pic` DISABLE KEYS */;

INSERT INTO `pic` (`id`, `type`, `url`, `width`, `height`, `create_time`, `target_id`, `target`)
VALUES
	(1,'avatar_small','http://7u2m1e.com1.z0.glb.clouddn.com/gugong002.jpg',800,800,'2015-01-18 00:00:00',1,'scenic'),
	(2,'avatar_large','http://7u2m1e.com1.z0.glb.clouddn.com/gugong004.jpg',800,800,'2015-01-18 00:00:00',1,'scenic'),
	(3,'album','http://7u2m1e.com1.z0.glb.clouddn.com/gugong009.jpg',800,800,'2015-01-18 00:00:00',1,'scenic'),
	(4,'album','http://7u2m1e.com1.z0.glb.clouddn.com/gugong001.jpg',800,800,'2015-01-18 00:00:00',1,'scenic'),
	(5,'album','http://7u2m1e.com1.z0.glb.clouddn.com/gugong003.jpg',800,800,'2015-01-18 00:00:00',1,'scenic'),
	(6,'album','http://7u2m1e.com1.z0.glb.clouddn.com/gugong005.jpg',800,800,'2015-01-18 00:00:00',1,'scenic'),
	(7,'album','http://7u2m1e.com1.z0.glb.clouddn.com/gugong006.jpg',800,800,'2015-01-18 00:00:00',1,'scenic'),
	(8,'album','http://7u2m1e.com1.z0.glb.clouddn.com/gugong007.jpg',800,800,'2015-01-18 00:00:00',1,'scenic'),
	(9,'album','http://7u2m1e.com1.z0.glb.clouddn.com/gugong008.jpg',800,800,'2015-01-18 00:00:00',1,'scenic');

/*!40000 ALTER TABLE `pic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table scenic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `scenic`;

CREATE TABLE `scenic` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `info` text,
  `ticket` text,
  `location` varchar(255) DEFAULT NULL,
  `traffic` text,
  `notice` text,
  `city_id` int(11) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `url_large` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `scenic` WRITE;
/*!40000 ALTER TABLE `scenic` DISABLE KEYS */;

INSERT INTO `scenic` (`id`, `name`, `info`, `ticket`, `location`, `traffic`, `notice`, `city_id`, `area_id`, `url`, `url_large`)
VALUES
	(1,'故宮（こきゅう）','故宮（こきゅう）は、中華人民共和国の首都北京市に所在する明清朝の旧王宮である歴史的建造物。面積は 725,000m² あり、世界最大の皇宮で、明と清の24代にわたる皇帝の宮城であった。1987年、「北京と瀋陽の明・清王朝皇宮」の一つとしてユネスコの世界遺産（文化遺産)に登録されている。名称故宮とは「古い宮殿、昔の宮殿」という意味で、現在は博物館（故宮博物院#中国 北京市）になっている。黄色と朱色からなる故宮博物院は幻想的な世界で、観る者の期待を決して裏切りません。','☆公園の開放時間＆料金:\r・4～10月 8:00～16:00、入園料60元\r・11～3月 8:30～15:30、入園料40元\r月曜日閉館(祝日と、7月1日から8月31日までの夏季休暇を除く)\r※鐘表館と珍宝館は別途10元                                                                                                        ※留学生は中国で発行された学生証により学割が適用される場合があるが、基本的に外国人は子供も含めて一般料金が適用になる。','北京市東城区故宮博物院','・北京市地下鉄1号線天安門西站（駅）より故宮博物院紫禁城へ徒歩約11分\r・天安門西站（駅）よりバス1、5、10、22、37、52、205、99、728番線、專1番線、專2番線 で約5分（1元 )\r・天安門東站（駅）よりバス1、2、10、20、82、120、37、52、126、99、203、205、210、728番線、專1番線、專2番線で約5分(1元 )\r・北京国際空港から故宮博物院南門までタクシーで約32分\r・北京市地下鉄5号線東四站（駅）から、神武門（北門）へ故宮下車：バス109、609、619番線乗車約13分(1元 )','①2011年7月より故宮観光は南(午門)から入って北(神武門)から出るという一方通行になった。以前のように北からの入場&チケット購入はできないので要注意 ！                               ②2013年5月より、故宮内の灰皿が全撤去され全面禁煙になった。',1,4,'http://7u2m1e.com1.z0.glb.clouddn.com/gugong002.jpg','http://7u2m1e.com1.z0.glb.clouddn.com/gugong004.jpg'),
	(2,'頤和園（いわえん）','頤和園は、北京の海淀区西郊外に位置し、市の中心からの距離は12キロほどのところにある、中国に現存する最大の古代庭園（園林）である。1998年12月に、ユネスコの世界文化遺産に登録された。\r頤和園は元々清蔬園と呼ばれ、清代の繁栄期である乾隆年間（1736～1795年）に創建された。乾隆帝は色を好まず、放蕩をきらい、ただ「山水の楽、懐に忘るあたわず」『御制静宜園記』を心情としていた。清蔬園の施工平面図や立体模型は、すべてみずから審査許可して、所管した。清蔬園は乾隆15年（1750年）に着工、15年の歳月を経て、乾隆29年（1764年）に完工した。\r 乾隆帝が手がけた清蔬園は、歴代皇帝と同様に、その思想と好みによって建造され。乾隆帝は「天人合一、皇帝権力至上の思想」、「長寿不老の神仙思想」、「享楽の思想」を造園思想とした。そのため、清蔬園は歴代皇室の庭園や私家庭園、名山大川、著名な寺院の精華を融合させて、中国の典型的な庭園芸術の代表作となったのである。 ','☆公園の開放時間＆料金:\r・4～10月　6：30～18:00、入園料30元　通し券60元　\r・11～来年3月8：30～17:00、入園料：20元　通し券：50元　\r\r☆観光ポイントの開放時間\r・4～10月　　7：00～17：00\r・11～来年3月　9：00～16：00\r','北京市海淀区新建宫門路19号   ','交通アクセス:   \r・バス209、330、331、332、346、394、712、718、726、732、696、683、801、808、817、926番線、頤和園バス停で下車。\r・バス303、330、331、346、375、384、393、634、716、718、696、683、801、808、817、834、特5番線、頤和園北宮門バス停で下車。\r・バス374、437、704、992、481、952番線、頤和園新建宮門バス停で下車。\r・バス469番線、頤和園西門バス停で下車。\r',NULL,1,4,'http://7u2m1e.com1.z0.glb.clouddn.com/yiheyuan003.jpg','http://7u2m1e.com1.z0.glb.clouddn.com/yiheyuan007.jpg');

/*!40000 ALTER TABLE `scenic` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
