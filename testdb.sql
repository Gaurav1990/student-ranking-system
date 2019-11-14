-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: school
-- ------------------------------------------------------
-- Server version	5.7.27-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(22,'Can add Token',8,'add_token'),(23,'Can change Token',8,'change_token'),(24,'Can delete Token',8,'delete_token'),(25,'Can add student',9,'add_student'),(26,'Can change student',9,'change_student'),(27,'Can delete student',9,'delete_student'),(28,'Can add exam',10,'add_exam'),(29,'Can change exam',10,'change_exam'),(30,'Can delete exam',10,'delete_exam'),(31,'Can add result',11,'add_result'),(32,'Can change result',11,'change_result'),(33,'Can delete result',11,'delete_result');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$pyHOEP33MbZm$11vlLS389GTOtWeh4KXeOhtpW6aV+WRZPzCG3fcuqR8=','2019-11-12 11:46:45.743189',1,'admin','','','admin@asdf.com',1,1,'2019-11-12 11:46:31.924055');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_1d10c57f535fb363_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (4,'2019-11-12 13:01:25.485179','1','Gaurav',1,'',9,1),(5,'2019-11-12 13:02:24.188314','1','Gaurav',3,'',9,1),(6,'2019-11-12 13:02:46.688776','2','Gaurav',1,'',9,1),(7,'2019-11-12 13:03:03.720089','3','Manish',1,'',9,1),(8,'2019-11-12 13:03:31.601106','4','Raja',1,'',9,1),(9,'2019-11-12 13:03:59.020201','5','Aarti',1,'',9,1),(10,'2019-11-12 13:04:17.511254','6','Akshta',1,'',9,1),(11,'2019-11-12 13:04:33.502103','7','Suman',1,'',9,1),(12,'2019-11-12 13:04:45.126389','8','Nishant',1,'',9,1),(13,'2019-11-12 13:05:03.725938','9','Rahul',1,'',9,1),(14,'2019-11-12 13:05:19.018417','10','Anamika',1,'',9,1),(15,'2019-11-12 13:07:02.478600','1','Maths',1,'',10,1),(16,'2019-11-12 13:07:10.795619','2','Science',1,'',10,1),(17,'2019-11-12 13:07:30.462460','3','Social',1,'',10,1),(18,'2019-11-12 13:07:38.491709','4','Geography',1,'',10,1),(19,'2019-11-12 13:07:44.351745','5','FirstLang',1,'',10,1),(20,'2019-11-12 13:07:48.482585','6','SecondLang',1,'',10,1),(21,'2019-11-12 13:09:19.980140','1','Gaurav - Maths',1,'',11,1),(22,'2019-11-12 13:09:33.190705','2','Gaurav - Maths',1,'',11,1),(23,'2019-11-12 13:09:44.747031','3','Gaurav - Maths',1,'',11,1),(24,'2019-11-12 13:09:55.019696','4','Gaurav - Maths',1,'',11,1),(25,'2019-11-12 13:10:19.116301','5','Gaurav - Science',1,'',11,1),(26,'2019-11-12 13:10:29.319393','6','Gaurav - Science',1,'',11,1),(27,'2019-11-12 13:10:40.605416','7','Gaurav - Social',1,'',11,1),(28,'2019-11-12 13:11:05.779383','8','Gaurav - Science',1,'',11,1),(29,'2019-11-12 13:11:25.557286','9','Gaurav - Social',1,'',11,1),(30,'2019-11-12 13:11:39.048707','10','Gaurav - Social',1,'',11,1),(31,'2019-11-12 13:11:54.959129','11','Gaurav - Social',1,'',11,1),(32,'2019-11-12 13:12:17.347143','12','Gaurav - Social',1,'',11,1),(33,'2019-11-12 13:12:33.173254','13','Manish - Maths',1,'',11,1),(34,'2019-11-12 13:12:47.232226','14','Manish - Maths',1,'',11,1),(35,'2019-11-12 13:12:58.074559','15','Manish - Maths',1,'',11,1),(36,'2019-11-12 13:13:10.233278','16','Manish - Science',1,'',11,1),(37,'2019-11-12 13:13:28.435582','17','Manish - Science',1,'',11,1),(38,'2019-11-12 13:14:10.863523','7','Gaurav - Science',2,'Changed examFK.',11,1),(39,'2019-11-12 13:14:42.238411','18','Manish - Maths',1,'',11,1),(40,'2019-11-12 13:15:06.240431','19','Manish - Science',1,'',11,1),(41,'2019-11-12 13:15:17.560839','20','Manish - Science',1,'',11,1),(42,'2019-11-12 13:15:48.337290','21','Manish - Social',1,'',11,1),(43,'2019-11-12 13:15:57.612877','22','Manish - Social',1,'',11,1),(44,'2019-11-12 13:16:10.142915','23','Manish - Social',1,'',11,1),(45,'2019-11-12 13:16:20.603118','24','Manish - Social',1,'',11,1),(46,'2019-11-12 13:18:49.270012','25','Raja - Maths',1,'',11,1),(47,'2019-11-12 13:19:10.307552','26','Raja - Maths',1,'',11,1),(48,'2019-11-12 13:22:16.282285','27','Raja - Maths',1,'',11,1),(49,'2019-11-12 13:22:32.234453','28','Raja - Maths',1,'',11,1),(50,'2019-11-12 13:23:07.549275','29','Raja - Science',1,'',11,1),(51,'2019-11-12 13:23:19.714302','30','Raja - Science',1,'',11,1),(52,'2019-11-12 13:23:31.764944','31','Raja - Science',1,'',11,1),(53,'2019-11-12 13:23:43.026443','32','Raja - Science',1,'',11,1),(54,'2019-11-12 13:24:05.751262','33','Raja - Social',1,'',11,1),(55,'2019-11-12 13:24:18.169657','34','Raja - Social',1,'',11,1),(56,'2019-11-12 13:24:30.502926','35','Raja - Social',1,'',11,1),(57,'2019-11-12 13:24:41.820403','36','Raja - Social',1,'',11,1),(58,'2019-11-12 14:01:04.252027','37','Aarti - Maths',1,'',11,1),(59,'2019-11-12 14:01:17.672769','38','Aarti - Maths',1,'',11,1),(60,'2019-11-12 14:01:32.160471','39','Aarti - Maths',1,'',11,1),(61,'2019-11-12 14:01:45.872219','40','Aarti - Maths',1,'',11,1),(62,'2019-11-12 14:02:51.845809','41','Aarti - Science',1,'',11,1),(63,'2019-11-12 14:03:18.056679','42','Aarti - Science',1,'',11,1),(64,'2019-11-12 14:03:29.018337','43','Aarti - Science',1,'',11,1),(65,'2019-11-12 14:04:05.337515','44','Aarti - Science',1,'',11,1),(66,'2019-11-12 14:04:25.707262','45','Aarti - Social',1,'',11,1),(67,'2019-11-12 14:04:42.173021','46','Aarti - Social',1,'',11,1),(68,'2019-11-12 14:04:54.096627','47','Aarti - Social',1,'',11,1),(69,'2019-11-12 14:05:06.401339','48','Aarti - Social',1,'',11,1),(70,'2019-11-12 14:05:18.789310','49','Aarti - Social',1,'',11,1),(71,'2019-11-12 14:05:30.501096','45','Aarti - Social',3,'',11,1),(72,'2019-11-12 14:06:04.808898','50','Akshta - Maths',1,'',11,1),(73,'2019-11-12 14:06:14.968436','51','Akshta - Maths',1,'',11,1),(74,'2019-11-12 14:06:25.567849','52','Akshta - Maths',1,'',11,1),(75,'2019-11-12 14:06:41.498424','53','Akshta - Maths',1,'',11,1),(76,'2019-11-12 14:06:57.466673','54','Akshta - Science',1,'',11,1),(77,'2019-11-12 14:07:08.952638','55','Akshta - Science',1,'',11,1),(78,'2019-11-12 14:07:19.762019','56','Akshta - Science',1,'',11,1),(79,'2019-11-12 14:07:31.343929','57','Akshta - Science',1,'',11,1),(80,'2019-11-12 14:07:49.056418','58','Akshta - Social',1,'',11,1),(81,'2019-11-12 14:07:59.143376','59','Akshta - Social',1,'',11,1),(82,'2019-11-12 14:08:13.074435','60','Akshta - Social',1,'',11,1),(83,'2019-11-12 14:08:24.688160','61','Akshta - Social',1,'',11,1),(84,'2019-11-12 14:09:12.320376','62','Suman - Maths',1,'',11,1),(85,'2019-11-12 14:09:30.302458','63','Suman - Maths',1,'',11,1),(86,'2019-11-12 14:09:53.810019','64','Suman - Maths',1,'',11,1),(87,'2019-11-12 14:10:09.781563','65','Suman - Maths',1,'',11,1),(88,'2019-11-12 14:10:31.773059','66','Suman - Science',1,'',11,1),(89,'2019-11-12 14:10:45.964532','67','Suman - Science',1,'',11,1),(90,'2019-11-12 14:11:00.061461','68','Suman - Science',1,'',11,1),(91,'2019-11-12 14:11:16.328729','69','Suman - Science',1,'',11,1),(92,'2019-11-12 14:11:28.438258','70','Suman - Science',1,'',11,1),(93,'2019-11-12 14:11:41.890393','71','Suman - Science',1,'',11,1),(94,'2019-11-12 14:11:58.128305','69','Suman - Science',3,'',11,1),(95,'2019-11-12 14:11:58.134914','67','Suman - Science',3,'',11,1),(96,'2019-11-12 14:12:50.896029','72','Suman - Social',1,'',11,1),(97,'2019-11-12 14:13:02.916112','73','Suman - Social',1,'',11,1),(98,'2019-11-12 14:13:19.167833','74','Suman - Social',1,'',11,1),(99,'2019-11-12 14:13:30.384357','75','Suman - Social',1,'',11,1),(100,'2019-11-12 14:13:45.403454','76','Nishant - Maths',1,'',11,1),(101,'2019-11-12 14:14:01.877965','77','Nishant - Maths',1,'',11,1),(102,'2019-11-12 14:14:19.666619','78','Nishant - Maths',1,'',11,1),(103,'2019-11-12 14:14:32.366982','79','Nishant - Maths',1,'',11,1),(104,'2019-11-12 14:15:10.953806','80','Nishant - Science',1,'',11,1),(105,'2019-11-12 14:15:21.275537','81','Nishant - Science',1,'',11,1),(106,'2019-11-12 14:15:31.859441','82','Nishant - Science',1,'',11,1),(107,'2019-11-12 14:15:53.091225','83','Nishant - Science',1,'',11,1),(108,'2019-11-12 14:18:13.473013','84','Nishant - Social',1,'',11,1),(109,'2019-11-12 14:18:25.289658','85','Nishant - Social',1,'',11,1),(110,'2019-11-12 14:19:07.838515','86','Nishant - Social',1,'',11,1),(111,'2019-11-12 14:19:38.142062','87','Nishant - Social',1,'',11,1),(112,'2019-11-12 14:20:51.300596','88','Rahul - Maths',1,'',11,1),(113,'2019-11-12 14:21:01.794319','89','Rahul - Maths',1,'',11,1),(114,'2019-11-12 14:21:15.108547','90','Rahul - Maths',1,'',11,1),(115,'2019-11-12 14:21:26.757124','91','Rahul - Maths',1,'',11,1),(116,'2019-11-12 14:22:14.034763','92','Rahul - Science',1,'',11,1),(117,'2019-11-12 14:22:28.388224','93','Rahul - Science',1,'',11,1),(118,'2019-11-12 14:22:48.761340','94','Rahul - Science',1,'',11,1),(119,'2019-11-12 14:23:07.715036','95','Rahul - Science',1,'',11,1),(120,'2019-11-12 14:29:43.913684','96','Rahul - Social',1,'',11,1),(121,'2019-11-12 14:29:56.738935','97','Rahul - Social',1,'',11,1),(122,'2019-11-12 14:30:09.228873','98','Rahul - Social',1,'',11,1),(123,'2019-11-12 14:30:23.332319','99','Rahul - Social',1,'',11,1),(124,'2019-11-12 14:30:36.071276','100','Rahul - Social',1,'',11,1),(125,'2019-11-12 14:30:47.788726','99','Rahul - Social',3,'',11,1),(126,'2019-11-12 14:31:23.097702','101','Anamika - Maths',1,'',11,1),(127,'2019-11-12 14:31:31.772640','102','Anamika - Maths',1,'',11,1),(128,'2019-11-12 14:31:41.905653','103','Anamika - Maths',1,'',11,1),(129,'2019-11-12 14:31:51.390433','104','Anamika - Maths',1,'',11,1),(130,'2019-11-12 14:32:41.517583','105','Anamika - Maths',1,'',11,1),(131,'2019-11-12 14:32:52.798081','103','Anamika - Maths',3,'',11,1),(132,'2019-11-12 14:33:54.305201','106','Anamika - Science',1,'',11,1),(133,'2019-11-12 14:34:06.411177','107','Anamika - Science',1,'',11,1),(134,'2019-11-12 14:34:21.718487','108','Anamika - Science',1,'',11,1),(135,'2019-11-12 14:34:33.386591','109','Anamika - Science',1,'',11,1),(136,'2019-11-12 14:34:51.902550','110','Anamika - Social',1,'',11,1),(137,'2019-11-12 14:35:09.236484','111','Anamika - Social',1,'',11,1),(138,'2019-11-12 14:35:29.586996','112','Anamika - Social',1,'',11,1),(139,'2019-11-12 14:35:41.903771','113','Anamika - Social',1,'',11,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(8,'authtoken','token'),(5,'contenttypes','contenttype'),(10,'exam','exam'),(11,'exam','result'),(9,'exam','student'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2019-11-12 11:46:10.349171'),(2,'auth','0001_initial','2019-11-12 11:46:12.048952'),(3,'admin','0001_initial','2019-11-12 11:46:12.459857'),(4,'contenttypes','0002_remove_content_type_name','2019-11-12 11:46:12.755938'),(5,'auth','0002_alter_permission_name_max_length','2019-11-12 11:46:12.948082'),(6,'auth','0003_alter_user_email_max_length','2019-11-12 11:46:13.089785'),(7,'auth','0004_alter_user_username_opts','2019-11-12 11:46:13.107352'),(8,'auth','0005_alter_user_last_login_null','2019-11-12 11:46:13.232443'),(9,'auth','0006_require_contenttypes_0002','2019-11-12 11:46:13.242610'),(10,'authtoken','0001_initial','2019-11-12 11:46:13.489982'),(11,'authtoken','0002_auto_20160226_1747','2019-11-12 11:46:13.734719'),(12,'sessions','0001_initial','2019-11-12 11:46:13.865841'),(13,'exam','0001_initial','2019-11-12 11:50:04.149898'),(14,'exam','0002_auto_20191112_1259','2019-11-12 12:59:25.701464'),(15,'exam','0003_auto_20191112_1301','2019-11-12 13:01:14.896148'),(16,'exam','0004_auto_20191113_1344','2019-11-13 13:45:03.418348');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('ks96g8fyb5nh6s40e76uuxmk93nai2qm','Mzk2ZGU0NjgzZGIzMmQzMjMzMTE1NzdlMDU2MDhiMjRlNzFmMTRkYjp7Il9hdXRoX3VzZXJfaGFzaCI6ImQ2NTQ3M2NiZGJiODUyYTE0NzYzOTdkZDAyNjk2Y2M0ZDVhNDVmNDgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2019-11-26 11:46:45.752603');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_exam`
--

DROP TABLE IF EXISTS `exam_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(10) NOT NULL,
  `maximum_marks` int(11) NOT NULL,
  `paper_time` int(11) NOT NULL,
  `percentage` int(11) NOT NULL,
  `updation_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_exam`
--

LOCK TABLES `exam_exam` WRITE;
/*!40000 ALTER TABLE `exam_exam` DISABLE KEYS */;
INSERT INTO `exam_exam` VALUES (1,'Maths',100,3,50,'2019-11-12 13:06:22.000000'),(2,'Science',100,3,50,'2019-11-12 13:07:02.000000'),(3,'Social',100,3,25,'2019-11-12 13:07:10.000000'),(4,'Geography',100,3,25,'2019-11-12 13:07:30.000000'),(5,'FirstLang',100,3,25,'2019-11-12 13:07:38.000000'),(6,'SecondLang',100,3,25,'2019-11-12 13:07:44.000000');
/*!40000 ALTER TABLE `exam_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_result`
--

DROP TABLE IF EXISTS `exam_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `terms` varchar(1) NOT NULL,
  `gained_marks` int(11) NOT NULL,
  `updation_date` datetime(6) NOT NULL,
  `examFK_id` int(11) NOT NULL,
  `studentFK_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `exam_result_dfee89f2` (`studentFK_id`),
  KEY `exam_result_examFK_id_2265f2cc4476c220_fk_exam_exam_id` (`examFK_id`),
  CONSTRAINT `exam_result_examFK_id_2265f2cc4476c220_fk_exam_exam_id` FOREIGN KEY (`examFK_id`) REFERENCES `exam_exam` (`id`),
  CONSTRAINT `exam_result_studentFK_id_226217cdb9f77ed9_fk_exam_student_id` FOREIGN KEY (`studentFK_id`) REFERENCES `exam_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_result`
--

LOCK TABLES `exam_result` WRITE;
/*!40000 ALTER TABLE `exam_result` DISABLE KEYS */;
INSERT INTO `exam_result` VALUES (1,'1',80,'2019-11-12 13:09:05.000000',1,2),(2,'2',70,'2019-11-12 13:09:20.000000',1,2),(3,'3',60,'2019-11-12 13:09:33.000000',1,2),(4,'4',90,'2019-11-12 13:09:44.000000',1,2),(5,'1',75,'2019-11-12 13:09:55.000000',2,2),(6,'2',80,'2019-11-12 13:10:19.000000',2,2),(7,'3',85,'2019-11-12 13:10:29.000000',2,2),(8,'4',90,'2019-11-12 13:10:40.000000',2,2),(9,'1',72,'2019-11-12 13:11:05.000000',3,2),(10,'2',82,'2019-11-12 13:11:25.000000',3,2),(11,'3',92,'2019-11-12 13:11:39.000000',3,2),(12,'4',95,'2019-11-12 13:11:55.000000',3,2),(13,'1',70,'2019-11-12 13:12:17.000000',1,3),(14,'2',76,'2019-11-12 13:12:33.000000',1,3),(15,'3',90,'2019-11-12 13:12:47.000000',1,3),(16,'1',99,'2019-11-12 13:12:58.000000',2,3),(17,'3',98,'2019-11-12 13:13:10.000000',2,3),(18,'4',69,'2019-11-12 13:14:29.000000',1,3),(19,'2',77,'2019-11-12 13:14:54.000000',2,3),(20,'4',79,'2019-11-12 13:15:06.000000',2,3),(21,'1',99,'2019-11-12 13:15:34.000000',3,3),(22,'2',89,'2019-11-12 13:15:48.000000',3,3),(23,'3',92,'2019-11-12 13:15:57.000000',3,3),(24,'4',94,'2019-11-12 13:16:10.000000',3,3),(25,'1',83,'2019-11-12 13:18:07.000000',1,4),(26,'2',84,'2019-11-12 13:18:49.000000',1,4),(27,'3',45,'2019-11-12 13:22:03.000000',1,4),(28,'4',43,'2019-11-12 13:22:16.000000',1,4),(29,'1',76,'2019-11-12 13:22:42.000000',2,4),(30,'2',78,'2019-11-12 13:23:07.000000',2,4),(31,'3',44,'2019-11-12 13:23:19.000000',2,4),(32,'4',51,'2019-11-12 13:23:31.000000',2,4),(33,'1',44,'2019-11-12 13:23:51.000000',3,4),(34,'2',54,'2019-11-12 13:24:05.000000',3,4),(35,'3',91,'2019-11-12 13:24:18.000000',3,4),(36,'4',54,'2019-11-12 13:24:30.000000',3,4),(37,'1',70,'2019-11-12 13:59:46.000000',1,5),(38,'2',77,'2019-11-12 14:01:04.000000',1,5),(39,'3',79,'2019-11-12 14:01:17.000000',1,5),(40,'4',83,'2019-11-12 14:01:32.000000',1,5),(41,'1',69,'2019-11-12 14:02:35.000000',2,5),(42,'2',80,'2019-11-12 14:02:51.000000',2,5),(43,'4',90,'2019-11-12 14:03:18.000000',2,5),(44,'3',76,'2019-11-12 14:03:37.000000',2,5),(46,'1',80,'2019-11-12 14:04:25.000000',3,5),(47,'2',99,'2019-11-12 14:04:42.000000',3,5),(48,'3',92,'2019-11-12 14:04:54.000000',3,5),(49,'4',91,'2019-11-12 14:05:06.000000',3,5),(50,'1',90,'2019-11-12 14:05:52.000000',1,6),(51,'2',92,'2019-11-12 14:06:04.000000',1,6),(52,'3',99,'2019-11-12 14:06:15.000000',1,6),(53,'4',70,'2019-11-12 14:06:25.000000',1,6),(54,'1',99,'2019-11-12 14:06:46.000000',2,6),(55,'2',99,'2019-11-12 14:06:57.000000',2,6),(56,'3',76,'2019-11-12 14:07:09.000000',2,6),(57,'4',80,'2019-11-12 14:07:19.000000',2,6),(58,'1',76,'2019-11-12 14:07:36.000000',3,6),(59,'2',92,'2019-11-12 14:07:49.000000',3,6),(60,'3',88,'2019-11-12 14:07:59.000000',3,6),(61,'4',76,'2019-11-12 14:08:13.000000',3,6),(62,'1',70,'2019-11-12 14:08:34.000000',1,7),(63,'2',80,'2019-11-12 14:09:12.000000',1,7),(64,'3',70,'2019-11-12 14:09:30.000000',1,7),(65,'4',90,'2019-11-12 14:09:54.000000',1,7),(66,'1',92,'2019-11-12 14:10:15.000000',2,7),(68,'2',81,'2019-11-12 14:10:46.000000',2,7),(70,'3',76,'2019-11-12 14:11:16.000000',2,7),(71,'4',84,'2019-11-12 14:11:28.000000',2,7),(72,'1',91,'2019-11-12 14:12:37.000000',3,7),(73,'2',90,'2019-11-12 14:12:51.000000',3,7),(74,'3',84,'2019-11-12 14:13:03.000000',3,7),(75,'4',88,'2019-11-12 14:13:19.000000',3,7),(76,'1',91,'2019-11-12 14:13:35.000000',1,8),(77,'2',89,'2019-11-12 14:13:45.000000',1,8),(78,'3',84,'2019-11-12 14:14:02.000000',1,8),(79,'4',89,'2019-11-12 14:14:19.000000',1,8),(80,'1',77,'2019-11-12 14:14:44.000000',2,8),(81,'2',60,'2019-11-12 14:15:11.000000',2,8),(82,'3',68,'2019-11-12 14:15:21.000000',2,8),(83,'4',66,'2019-11-12 14:15:32.000000',2,8),(84,'1',83,'2019-11-12 14:17:58.000000',3,8),(85,'2',67,'2019-11-12 14:18:13.000000',3,8),(86,'3',53,'2019-11-12 14:18:25.000000',3,8),(87,'4',65,'2019-11-12 14:19:08.000000',3,8),(88,'1',67,'2019-11-12 14:20:02.000000',1,9),(89,'2',68,'2019-11-12 14:20:51.000000',1,9),(90,'3',70,'2019-11-12 14:21:01.000000',1,9),(91,'4',67,'2019-11-12 14:21:15.000000',1,9),(92,'1',67,'2019-11-12 14:22:04.000000',2,9),(93,'2',72,'2019-11-12 14:22:14.000000',2,9),(94,'3',84,'2019-11-12 14:22:28.000000',2,9),(95,'4',78,'2019-11-12 14:22:48.000000',2,9),(96,'1',79,'2019-11-12 14:29:32.000000',3,9),(97,'2',77,'2019-11-12 14:29:44.000000',3,9),(98,'3',85,'2019-11-12 14:29:56.000000',3,9),(100,'4',67,'2019-11-12 14:30:23.000000',3,9),(101,'1',77,'2019-11-12 14:30:59.000000',1,10),(102,'2',76,'2019-11-12 14:31:23.000000',1,10),(104,'3',76,'2019-11-12 14:31:42.000000',1,10),(105,'4',70,'2019-11-12 14:31:51.000000',1,10),(106,'1',76,'2019-11-12 14:33:45.000000',2,10),(107,'2',90,'2019-11-12 14:33:54.000000',2,10),(108,'3',70,'2019-11-12 14:34:06.000000',2,10),(109,'4',68,'2019-11-12 14:34:21.000000',2,10),(110,'1',70,'2019-11-12 14:34:40.000000',3,10),(111,'2',92,'2019-11-12 14:34:52.000000',3,10),(112,'3',92,'2019-11-12 14:35:09.000000',3,10),(113,'4',77,'2019-11-12 14:35:29.000000',3,10);
/*!40000 ALTER TABLE `exam_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_student`
--

DROP TABLE IF EXISTS `exam_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exam_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `roll_no` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `standard` varchar(1) NOT NULL,
  `section` varchar(1) NOT NULL,
  `first_lang` varchar(30) DEFAULT NULL,
  `second_lang` varchar(30) DEFAULT NULL,
  `year` int(11) NOT NULL,
  `updation_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_student`
--

LOCK TABLES `exam_student` WRITE;
/*!40000 ALTER TABLE `exam_student` DISABLE KEYS */;
INSERT INTO `exam_student` VALUES (2,1,'Gaurav','1','A','English','French',2019,'2019-11-12 13:02:26.000000'),(3,2,'Manish','1','A','Spanish','Hindi',2019,'2019-11-12 13:02:46.000000'),(4,3,'Raja','1','A','French','Telugu',2019,'2019-11-12 13:03:06.000000'),(5,1,'Aarti','1','B','Spanish','Tamil',2019,'2019-11-12 13:03:31.000000'),(6,2,'Akshta','1','B','French','Telugu',2019,'2019-11-12 13:03:59.000000'),(7,1,'Suman','2','A','Spanish','Hindi',2019,'2019-11-12 13:04:17.000000'),(8,2,'Nishant','2','B','French','Tamil',2019,'2019-11-12 13:04:33.000000'),(9,1,'Rahul','2','B','German','Tamil',2019,'2019-11-12 13:04:45.000000'),(10,2,'Anamika','2','B','Spanish','Tamil',2019,'2019-11-12 13:05:03.000000');
/*!40000 ALTER TABLE `exam_student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-14 10:44:38
