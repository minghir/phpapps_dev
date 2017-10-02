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
INSERT INTO `app_users` VALUES (1,'victor','alcatraz','minghir@yahoo.com',2,'2017-09-24 21:00:00'),(2,'goaga','dadan','goaga@dadan.com',3,'2017-09-25 09:46:13');
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
  `CATEG_ID` bigint(20) NOT NULL DEFAULT '0',
  `IMAGE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID` bigint(20) NOT NULL DEFAULT '0',
  `ARTICLE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `atsepa_articles_CATEG_ID_FK` (`CATEG_ID`),
  KEY `atsepa_articles_USER_ID_FK` (`USER_ID`),
  CONSTRAINT `atsepa_articles_CATEG_ID_FK` FOREIGN KEY (`CATEG_ID`) REFERENCES `list_article_categories` (`ID`),
  CONSTRAINT `atsepa_articles_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `app_users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (10,'das',NULL,'This foreign key is the same as the previous one, but there is one difference: the user can\\\'t be deleted as long as there are still topics with the user id of the user. We don\\\'t use CASCADE here because there might be valuable information in our topics. We wouldn\\\'t want that information to get deleted if someone decides to delete their account. To still give users the opportunity to delete their account, you could build some feature that anonymizes all their topics and then delete their account. Unfortunately, that is beyond the scope of this tutorial.',2,NULL,1,'0000-00-00 00:00:00'),(11,'GIGI',NULL,'Oracle Human Resources ( HRMS )Tables, Views | www ...  www.oracleappsquery.com/?q=oracle-apps-r12-human-resources-tables-views-hrms  Oracle Human Resources ( HRMS )Tables, Views ... Test table for ADE. HR_ALL_ORGANIZATION_UNITS, Organization unit definitions. ... Sequence and Database. This table can hold multiple Ranges for a given Sequence and Database.',1,NULL,1,'2017-09-24 21:00:00'),(17,'GALERIE FOTO','','Cine este noul Inspector pentru management instituțional și educație permanentă din Arad',1,'user_data/11195280_10153293546377094_555126213_n.jpg',1,'0000-00-00 00:00:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forum_categories`
--

LOCK TABLES `forum_categories` WRITE;
/*!40000 ALTER TABLE `forum_categories` DISABLE KEYS */;
INSERT INTO `forum_categories` VALUES (0,0,'ROOT','DESC'),(6,5,'CATEGORIE 1',''),(7,5,'CATEGORIE 2','');
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
  `DESCRIPTION` text COLLATE utf8_bin,
  `TOPIC_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CAT_ID` bigint(20) NOT NULL DEFAULT '0',
  `USER_ID` bigint(20) NOT NULL DEFAULT '0',
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

-- Dump completed on 2017-10-02 16:24:23
