-- MySQL dump 10.13  Distrib 5.6.26, for Win32 (x86)
--
-- Host: localhost    Database: atsepa
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `app_users`
--

DROP TABLE IF EXISTS `app_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_users` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '''''',
  `PASSWORD` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '''''',
  `EMAIL` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '''''',
  `LAST_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `FIRST_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_TYPE` bigint(20) NOT NULL DEFAULT '4',
  `JOIN_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `atsepa_users_113_IDX` (`USERNAME`),
  KEY `atsepa_users_USERTIPE_FK` (`USER_TYPE`),
  CONSTRAINT `atsepa_users_USERTIPE_FK` FOREIGN KEY (`USER_TYPE`) REFERENCES `list_user_types` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_users`
--

LOCK TABLES `app_users` WRITE;
/*!40000 ALTER TABLE `app_users` DISABLE KEYS */;
INSERT INTO `app_users` VALUES (1,'victor','alcatraz','minghir@yahoo.com','Minghir','Victor',2,'2017-10-07 05:52:05'),(2,'goaga','dadan','goaga@dadan.com',NULL,NULL,3,'2017-09-25 09:46:13');
/*!40000 ALTER TABLE `app_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '''''',
  `ARTICLE_TAGS` text COLLATE utf8_bin,
  `BODY` text COLLATE utf8_bin,
  `INTRO` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEG_ID` bigint(20) NOT NULL DEFAULT '0',
  `VISIBLE` bigint(1) NOT NULL DEFAULT '0',
  `IMAGE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID` bigint(20) NOT NULL DEFAULT '0',
  `ARTICLE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `atsepa_articles_CATEG_ID_FK` (`CATEG_ID`),
  KEY `atsepa_articles_USER_ID_FK` (`USER_ID`),
  CONSTRAINT `atsepa_articles_CATEG_ID_FK` FOREIGN KEY (`CATEG_ID`) REFERENCES `list_article_categories` (`ID`),
  CONSTRAINT `atsepa_articles_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `app_users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (10,'Cerinte minime','','Cerinte minimale site:&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;br&gt;1. Deseign si layout: similar cu mail.com (in sensul ca ultimile noutati sa se deruleze pe ecran si sa poata fi accesate) iar deasupra se poate folosi antentul de pe documentele asociatiei. Doua butoane: Despre ATSEPA, Noutati. In pagina principala.&lt;br&gt;2. Platforma trebuie sa ofere useruilor inregistrati urmatoarele facilitati: platforma de vot pe documente sau teme&amp;nbsp; (poll), wikipedia, forum, sharing de fisiere.&lt;br&gt;3. Sectiune de login pentru membrii si administrare site cu trei nivele de acces:&lt;br&gt;Administrator: administreaza tehnic platforma (webmaster)&lt;br&gt;&lt;br&gt;Superuser: Membrii CD sau desemnati (au dreptul sa modifice sau sa incarce pe site in sectiunile specifie documentele oficiale ale Asocotaiei: statut, act constitutiv, precum si documentele supuse consultarii si votului)&lt;br&gt;User: toti membrii asociatiei in afara de superuser care sa permita aceesul la platforma (acces la documentele supuse votului si biblioteca asociatiei, forum si sharing de fisiere in zonele stabilite)&lt;br&gt;4. Site-ul ar trebui optimizat si pentru echipamentele mobile.&lt;br&gt;5. Propun dezvoltarea lui&amp;nbsp; pe o platforma facila pentru a fi scalabil uterior (WordPerss, Drupal).&lt;br&gt;',NULL,2,0,'user_data/web-design-concept-xs.jpg',1,'0000-00-00 00:00:00'),(11,'Aviation Digital Data Service (ADDS)','','The Aviation Digital Data Service (ADDS) makes available to the aviation community text, digital and graphical forecasts, analyses, and observations of aviation-related weather variables. ADDS is a joint effort of NCAR Research Applications Program (RAP), Global Systems Division (GSD) of NOAA\\\'s Earth System Research Laboratory (ESRL), and the National Centers for Environmental Prediction (NCEP) Aviation Weather Center (AWC).',NULL,1,0,'user_data/US_Navy_070913-N-1786N-051_Air_Traffic_Controller_2nd_Class_Branden_Powell_keeps_track_of_aircraft_using_a_SPN-43_radar_screen_during_routine_flight_operations_on_board_amphibious_assault_ship_USS_Tarawa_(LHA_1).jpg',1,'2017-09-24 21:00:00'),(17,'AVIATION ELECTRONICS TECHNOLOGY (AVT)','','&lt;div class=\\&quot;field field-name-body field-type-text-with-summary field-label-hidden\\&quot;&gt;&lt;div class=\\&quot;field-items\\&quot;&gt;&lt;div class=\\&quot;field-item even\\&quot; property=\\&quot;content:encoded\\&quot;&gt;&lt;p&gt;Aviation Electronics (or Avionics) are the electronic systems used on aircraft and spacecraft. Avionics include electronic systems used for the control, monitoring, identification and navigation of aircraft.&lt;br /&gt; &lt;br /&gt;The &lt;strong&gt;Aviation Electronics Technology (AVT)&lt;/strong&gt; course is a specialized program in electronics and communications covering aircraft electronics. The program provides students with the knowledge and skills in the field of aircraft electronics maintenance, repair and overhaul.&lt;br /&gt; &lt;br /&gt;Designed to prepare the students for the highly technical field of aviation electronics maintenance, the program provides them the necessary knowledge and skills to be able to install, test, operate, calibrate and repair electronic equipment on aircraft. These equipment typically includes radar, navigational, communications and engine &amp;amp; flight instruments.&lt;br /&gt; &lt;br /&gt;Graduates of this course can take entry-level jobs in the operation and maintenance of aircraft electronic equipment which includes among others the servicing, installation, testing, maintenance, operation, calibration, troubleshooting and repair of aircraft radar, navigational, communications and engine &amp;amp; flight instruments.&lt;br /&gt; &lt;br /&gt;&lt;strong&gt;Note&lt;/strong&gt;:&lt;span style=\\&quot;font-size:12px\\&quot;&gt; AVT graduates who completed their OJT requirements can take the Civil Aviation Authority of the Philippines (CAAP) licensure examination which grants successful examinees an&lt;/span&gt; &lt;strong&gt;Aviation Maintenance  Specialist&lt;/strong&gt; &lt;span style=\\&quot;font-size:11px\\&quot;&gt;&lt;span style=\\&quot;font-size:12px\\&quot;&gt;license with an&lt;/span&gt; &lt;/span&gt;&lt;em&gt;',NULL,1,0,'user_data/NATS_SwanwickCTC_0048-624x306.jpg',1,'0000-00-00 00:00:00'),(18,'From The Coop','da','Damanek is a new project from Guy Manning, where he has been joined by Dan Mash (bass), Marek Arnold (sax, clarinet, keyboards) and Sean Timms (keyboards, banjo, backing vocals) and then on top of that there are quite a few guests including Nick Magnus and Phideaux. Guy had disbanded Manning, and was then invited to join a new band called United Progressive Fraternity to which he also then brought in Dan and Marek. After the release of the debut album Guy started writing for the second, only for the band to fold, so he decided to start a new one to use the songs, and asked Dan and Marek to be involved, hence the name (DAn, MANning and MarEK), with Sean joining later.&lt;br&gt;\r\nI have long been a fan of Guy\\\\\\\\\\\\\\\'s music, and spent a very pleasant evening with him in his studio some dozen years or so ago, and have enjoyed all albums he has been involved with from PO90 through Manning and The Tangent, so I knew I was going to enjoy this right from the off, and that was indeed immediately the case. Guy has an innate sense of melody, and his songs are always enjoyable on first hearing, with strong arrangements and a feeling that every note is in exactly the right place, played on the right instrument. This is commercial symphonic pop influenced classic crossover progressive rock that oozes class and confidence in equal measures. I can\\\\\\\\\\\\\\\'t pick a favourite as all eight songs are simply superb. This may be a debut release, but all the guys involved have been around the scene for some time and it shows. Let\\\\\\\\\\\\\\\'s hope it\\\\\\\\\\\\\\\'s not long until the next one.','Technically the third \\\\\\\\\\\\\\&quot;special\\\\\\\\\\\\\\&quot; release of the prolific career of the eccentric BUCKETHEAD but in reality nothing more than the early demo tapes that were recorded in 1988 while a young Brian Carroll was a mere',2,0,'user_data/Motherboard_450.jpg',1,'2017-10-05 21:00:00'),(19,'rewqreqw','rwe','rwqrwq','reqwrewqr',1,0,'user_data/',1,'2017-10-06 21:00:00'),(20,'rewqreqw','rwe','rwqrwq','reqwrewqr',1,0,'user_data/',1,'2017-10-06 21:00:00'),(21,'rewqreqw','rwe','rwqrwq','reqwrewqr',1,0,'user_data/',1,'2017-10-06 21:00:00');
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forum_categories`
--

DROP TABLE IF EXISTS `forum_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forum_categories` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PID` bigint(20) NOT NULL DEFAULT '0',
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '''''',
  `DESCRIPTION` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `atsepa_categories_130_IDX` (`NAME`),
  KEY `atsepa_categories_PID_FK` (`PID`),
  CONSTRAINT `atsepa_categories_PID_FK` FOREIGN KEY (`PID`) REFERENCES `forum_categories` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_categories`
--

LOCK TABLES `forum_categories` WRITE;
/*!40000 ALTER TABLE `forum_categories` DISABLE KEYS */;
INSERT INTO `forum_categories` VALUES (0,0,'ROOT','DESC'),(6,0,'CATEGORIE 1',''),(7,0,'CATEGORIE 2',''),(8,6,'Sub categ 1.1',''),(9,6,'Sub categ 1.2',''),(10,7,'Sub categ 2.1',''),(11,7,'Sub categ 2.2','');
/*!40000 ALTER TABLE `forum_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_article_categories`
--

DROP TABLE IF EXISTS `list_article_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_article_categories` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_article_categories`
--

LOCK TABLES `list_article_categories` WRITE;
/*!40000 ALTER TABLE `list_article_categories` DISABLE KEYS */;
INSERT INTO `list_article_categories` VALUES (1,'','Aviatie'),(2,'','Electronica');
/*!40000 ALTER TABLE `list_article_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_user_types`
--

DROP TABLE IF EXISTS `list_user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_user_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_user_types`
--

LOCK TABLES `list_user_types` WRITE;
/*!40000 ALTER TABLE `list_user_types` DISABLE KEYS */;
INSERT INTO `list_user_types` VALUES (1,NULL,'Administrator'),(2,NULL,'Superuser'),(3,NULL,'User'),(4,NULL,'Visitor');
/*!40000 ALTER TABLE `list_user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `POST_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL,
  `CONTENT` text COLLATE utf8_bin,
  PRIMARY KEY (`ID`),
  KEY `atsepa_posts_TOPIC_ID_FK` (`TOPIC_ID`),
  CONSTRAINT `atsepa_posts_TOPIC_ID_FK` FOREIGN KEY (`TOPIC_ID`) REFERENCES `topics` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'2017-10-09 11:50:44',2,1,'dadads'),(2,'2017-10-09 11:50:51',2,1,'dad'),(3,'2017-10-09 11:50:53',2,1,'fasfdasf'),(4,'2017-10-09 11:50:55',2,1,'gfsdgf'),(5,'2017-10-09 11:50:57',2,1,'sdfafdasf'),(6,'2017-10-09 11:51:09',3,1,'sfadasf'),(7,'2017-10-09 11:51:12',3,1,'sfadasffasd'),(8,'2017-10-09 11:51:13',3,1,'sfadasffasd'),(9,'2017-10-09 11:51:14',3,1,'sfadasffasd'),(10,'2017-10-09 11:51:14',3,1,'sfadasffasd');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topics` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SUBJECT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin,
  `TOPIC_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAT_ID` bigint(20) NOT NULL DEFAULT '0',
  `USER_ID` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `atsepa_topics_CAT_ID_FK` (`CAT_ID`),
  KEY `atsepa_topics_USER_ID_FK` (`USER_ID`),
  CONSTRAINT `atsepa_topics_CAT_ID_FK` FOREIGN KEY (`CAT_ID`) REFERENCES `forum_categories` (`ID`),
  CONSTRAINT `atsepa_topics_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `app_users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES (2,'dadas 1','dasdsa','2017-10-09 12:28:48',8,1),(3,'dadas 2','dadas','2017-10-09 12:28:55',8,1),(4,'dasdsa','dasdas','2017-10-09 12:58:08',9,1),(5,'dasdsadsadsa','dasdasdasdas','2017-10-09 12:58:12',9,1),(6,'dasdaaaa','dasdasdasdas','2017-10-09 12:58:18',10,1),(7,'dasdassss','dasdasdasdas','2017-10-09 12:58:21',11,1),(8,'sadas','dasdasd','2017-10-09 12:58:45',9,1),(9,'dasdsa','dsadsa','2017-10-09 12:59:12',11,1);
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_articles`
--

DROP TABLE IF EXISTS `view_articles`;
/*!50001 DROP VIEW IF EXISTS `view_articles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_articles` AS SELECT 
 1 AS `ID`,
 1 AS `NAME`,
 1 AS `INTRO`,
 1 AS `BODY`,
 1 AS `IMAGE`,
 1 AS `ARTICLE_DATE`,
 1 AS `CATEG_NAME`,
 1 AS `LAST_NAME`,
 1 AS `FIRST_NAME`,
 1 AS `USERNAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_articles`
--

/*!50001 DROP VIEW IF EXISTS `view_articles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_articles` AS select `a`.`ID` AS `ID`,`a`.`NAME` AS `NAME`,if((`a`.`INTRO` <> ''),`a`.`INTRO`,substr(`a`.`BODY`,1,255)) AS `INTRO`,`a`.`BODY` AS `BODY`,`a`.`IMAGE` AS `IMAGE`,date_format(`a`.`ARTICLE_DATE`,'%d/%m/%Y') AS `ARTICLE_DATE`,(select `list_article_categories`.`VALUE` from `list_article_categories` where (`list_article_categories`.`ID` = `a`.`CATEG_ID`)) AS `CATEG_NAME`,`u`.`LAST_NAME` AS `LAST_NAME`,`u`.`FIRST_NAME` AS `FIRST_NAME`,`u`.`USERNAME` AS `USERNAME` from (`articles` `a` left join `app_users` `u` on((`a`.`USER_ID` = `u`.`ID`))) order by `a`.`ARTICLE_DATE` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-09 16:10:03
