-- MySQL dump 10.16  Distrib 10.1.25-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: atsepa
-- ------------------------------------------------------
-- Server version	10.1.25-MariaDB

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
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `articles` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '''''',
  `BODY` text COLLATE utf8_bin,
  `CATEG_ID` bigint(20) NOT NULL DEFAULT '0',
  `USER_ID` bigint(20) NOT NULL DEFAULT '0',
  `ARTICLE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `atsepa_articles_CATEG_ID_FK` (`CATEG_ID`),
  KEY `atsepa_articles_USER_ID_FK` (`USER_ID`),
  CONSTRAINT `atsepa_articles_CATEG_ID_FK` FOREIGN KEY (`CATEG_ID`) REFERENCES `list_article_categories` (`ID`),
  CONSTRAINT `atsepa_articles_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-08-06 14:26:42
