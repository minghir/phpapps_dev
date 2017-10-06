-- MySQL dump 10.16  Distrib 10.2.7-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: atsepa
-- ------------------------------------------------------
-- Server version	10.2.7-MariaDB

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
  `USER_TYPE` bigint(20) NOT NULL DEFAULT 4,
  `JOIN_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
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
INSERT INTO `app_users` VALUES (1,'victor','alcatraz','minghir@yahoo.com',NULL,NULL,2,'2017-09-24 21:00:00'),(2,'goaga','dadan','goaga@dadan.com',NULL,NULL,3,'2017-09-25 09:46:13');
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
  `ARTICLE_TAGS` text COLLATE utf8_bin DEFAULT NULL,
  `BODY` text COLLATE utf8_bin DEFAULT NULL,
  `INTRO` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEG_ID` bigint(20) NOT NULL DEFAULT 0,
  `IMAGE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID` bigint(20) NOT NULL DEFAULT 0,
  `ARTICLE_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `atsepa_articles_CATEG_ID_FK` (`CATEG_ID`),
  KEY `atsepa_articles_USER_ID_FK` (`USER_ID`),
  CONSTRAINT `atsepa_articles_CATEG_ID_FK` FOREIGN KEY (`CATEG_ID`) REFERENCES `list_article_categories` (`ID`),
  CONSTRAINT `atsepa_articles_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `app_users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (10,'Cerinte minime','','Cerinte minimale site:&lt;br&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;br&gt;1. Deseign si layout: similar cu mail.com (in sensul ca ultimile noutati sa se deruleze pe ecran si sa poata fi accesate) iar deasupra se poate folosi antentul de pe documentele asociatiei. Doua butoane: Despre ATSEPA, Noutati. In pagina principala.&lt;br&gt;2. Platforma trebuie sa ofere useruilor inregistrati urmatoarele facilitati: platforma de vot pe documente sau teme&amp;nbsp; (poll), wikipedia, forum, sharing de fisiere.&lt;br&gt;3. Sectiune de login pentru membrii si administrare site cu trei nivele de acces:&lt;br&gt;Administrator: administreaza tehnic platforma (webmaster)&lt;br&gt;&lt;br&gt;Superuser: Membrii CD sau desemnati (au dreptul sa modifice sau sa incarce pe site in sectiunile specifie documentele oficiale ale Asocotaiei: statut, act constitutiv, precum si documentele supuse consultarii si votului)&lt;br&gt;User: toti membrii asociatiei in afara de superuser care sa permita aceesul la platforma (acces la documentele supuse votului si biblioteca asociatiei, forum si sharing de fisiere in zonele stabilite)&lt;br&gt;4. Site-ul ar trebui optimizat si pentru echipamentele mobile.&lt;br&gt;5. Propun dezvoltarea lui&amp;nbsp; pe o platforma facila pentru a fi scalabil uterior (WordPerss, Drupal).&lt;br&gt;',NULL,2,'user_data/web-design-concept-xs.jpg',1,'0000-00-00 00:00:00'),(11,'Aviation Digital Data Service (ADDS)','','The Aviation Digital Data Service (ADDS) makes available to the aviation community text, digital and graphical forecasts, analyses, and observations of aviation-related weather variables. ADDS is a joint effort of NCAR Research Applications Program (RAP), Global Systems Division (GSD) of NOAA\\\'s Earth System Research Laboratory (ESRL), and the National Centers for Environmental Prediction (NCEP) Aviation Weather Center (AWC).',NULL,1,'user_data/US_Navy_070913-N-1786N-051_Air_Traffic_Controller_2nd_Class_Branden_Powell_keeps_track_of_aircraft_using_a_SPN-43_radar_screen_during_routine_flight_operations_on_board_amphibious_assault_ship_USS_Tarawa_(LHA_1).jpg',1,'2017-09-24 21:00:00'),(17,'AVIATION ELECTRONICS TECHNOLOGY (AVT)','','&lt;div class=\\&quot;field field-name-body field-type-text-with-summary field-label-hidden\\&quot;&gt;&lt;div class=\\&quot;field-items\\&quot;&gt;&lt;div class=\\&quot;field-item even\\&quot; property=\\&quot;content:encoded\\&quot;&gt;&lt;p&gt;Aviation Electronics (or Avionics) are the electronic systems used on aircraft and spacecraft. Avionics include electronic systems used for the control, monitoring, identification and navigation of aircraft.&lt;br /&gt; &lt;br /&gt;The &lt;strong&gt;Aviation Electronics Technology (AVT)&lt;/strong&gt; course is a specialized program in electronics and communications covering aircraft electronics. The program provides students with the knowledge and skills in the field of aircraft electronics maintenance, repair and overhaul.&lt;br /&gt; &lt;br /&gt;Designed to prepare the students for the highly technical field of aviation electronics maintenance, the program provides them the necessary knowledge and skills to be able to install, test, operate, calibrate and repair electronic equipment on aircraft. These equipment typically includes radar, navigational, communications and engine &amp;amp; flight instruments.&lt;br /&gt; &lt;br /&gt;Graduates of this course can take entry-level jobs in the operation and maintenance of aircraft electronic equipment which includes among others the servicing, installation, testing, maintenance, operation, calibration, troubleshooting and repair of aircraft radar, navigational, communications and engine &amp;amp; flight instruments.&lt;br /&gt; &lt;br /&gt;&lt;strong&gt;Note&lt;/strong&gt;:&lt;span style=\\&quot;font-size:12px\\&quot;&gt; AVT graduates who completed their OJT requirements can take the Civil Aviation Authority of the Philippines (CAAP) licensure examination which grants successful examinees an&lt;/span&gt; &lt;strong&gt;Aviation Maintenance  Specialist&lt;/strong&gt; &lt;span style=\\&quot;font-size:11px\\&quot;&gt;&lt;span style=\\&quot;font-size:12px\\&quot;&gt;license with an&lt;/span&gt; &lt;/span&gt;&lt;em&gt;',NULL,1,'user_data/NATS_SwanwickCTC_0048-624x306.jpg',1,'0000-00-00 00:00:00'),(18,'da','da','da',NULL,1,'user_data/',1,'2017-10-05 21:00:00');
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
  `PID` bigint(20) NOT NULL DEFAULT 0,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '''''',
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
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
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_article_categories`
--

LOCK TABLES `list_article_categories` WRITE;
/*!40000 ALTER TABLE `list_article_categories` DISABLE KEYS */;
INSERT INTO `list_article_categories` VALUES (1,'','categ1'),(2,'','categ2');
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
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
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
  `POST_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `USER_ID` bigint(20) DEFAULT NULL,
  `CONTENT` text COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `atsepa_posts_TOPIC_ID_FK` (`TOPIC_ID`),
  CONSTRAINT `atsepa_posts_TOPIC_ID_FK` FOREIGN KEY (`TOPIC_ID`) REFERENCES `topics` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
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
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `TOPIC_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CAT_ID` bigint(20) NOT NULL DEFAULT 0,
  `USER_ID` bigint(20) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `atsepa_topics_CAT_ID_FK` (`CAT_ID`),
  KEY `atsepa_topics_USER_ID_FK` (`USER_ID`),
  CONSTRAINT `atsepa_topics_CAT_ID_FK` FOREIGN KEY (`CAT_ID`) REFERENCES `forum_categories` (`ID`),
  CONSTRAINT `atsepa_topics_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `app_users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-06 19:49:44
