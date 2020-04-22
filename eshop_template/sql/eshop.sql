-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: eshop
-- ------------------------------------------------------
-- Server version	10.4.12-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PID` bigint(20) NOT NULL,
  `NAME` varchar(20) NOT NULL DEFAULT '',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `PID` (`PID`),
  KEY `categories_ibfk_2` (`MODIFY_UID`),
  KEY `categories_ibfk_3` (`CREATE_UID`),
  CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `categories` (`ID`),
  CONSTRAINT `categories_ibfk_2` FOREIGN KEY (`MODIFY_UID`) REFERENCES `phpapps`.`users` (`ID`),
  CONSTRAINT `categories_ibfk_3` FOREIGN KEY (`CREATE_UID`) REFERENCES `phpapps`.`users` (`ID`),
  CONSTRAINT `eshop_categories_PID_FK` FOREIGN KEY (`PID`) REFERENCES `categories` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,'root','root','',1,1,'2015-08-19 09:39:54','2015-08-19 09:39:54'),(8,1,'a','s','d',1,1,'2015-08-19 09:39:54','2015-08-19 09:39:54'),(14,1,'sa','sa','sa',1,1,'2015-08-19 09:39:54','2015-08-19 09:39:54');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEG_ID` bigint(20) NOT NULL DEFAULT 0,
  `PRODUCT_NAME` varchar(255) NOT NULL DEFAULT '',
  `DESCRIPTION` tinytext NOT NULL,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `CATEG_ID` (`CATEG_ID`),
  KEY `products_ibfk_2` (`MODIFY_UID`),
  KEY `products_ibfk_3` (`CREATE_UID`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`CATEG_ID`) REFERENCES `categories` (`ID`),
  CONSTRAINT `products_ibfk_2` FOREIGN KEY (`MODIFY_UID`) REFERENCES `phpapps`.`users` (`ID`),
  CONSTRAINT `products_ibfk_3` FOREIGN KEY (`CREATE_UID`) REFERENCES `phpapps`.`users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,8,'cici','aaa',1,1,'2015-08-19 09:40:59','2015-08-19 09:40:59'),(2,1,'mimisss','fifi',1,1,'2016-08-16 13:28:13','2016-08-16 08:35:07'),(4,1,'aaass','aaaasasasss',1,1,'2016-08-16 13:35:09','2016-08-16 13:33:39'),(9,8,'sadasdddsds2222','ttttttttt',1,1,'2016-08-16 13:40:33','2016-08-16 13:40:22');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-23  0:02:32
