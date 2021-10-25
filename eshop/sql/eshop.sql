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
  `PID` bigint(20) NOT NULL DEFAULT 0,
  `NAME` varchar(255) NOT NULL DEFAULT '''''',
  `TITLE` varchar(255) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `PID` (`PID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,0,'DETERGENTI','DETERGENTI',''),(8,0,'PRODUSE PENTRU BAIE','PRODUSE PENTRU BAIE',''),(14,0,'PRODUSE PENTRU BUCĂTĂRIE','PRODUSE PENTRU BUCĂTĂRIE',''),(15,0,'MENAJ','MENAJ',''),(16,0,'ÎNGRIJIRE PERSONALĂ','ÎNGRIJIRE PERSONALĂ',''),(17,0,'MOBILĂ ȘI PARDOSELI','MOBILĂ ȘI PARDOSELI',''),(18,0,'DIVERSE','DIVERSE',''),(19,1,'TEST','TEST','');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FIRST_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TITLE_ID` bigint(20) DEFAULT NULL,
  `BIRTH_DATE` date DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `COUNTRY_ID` bigint(20) DEFAULT NULL,
  `COUNTY_ID` bigint(20) DEFAULT NULL,
  `CITY` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `POSTAL_CODE` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `ADDRESS_DETAILS` text COLLATE utf8_bin DEFAULT NULL,
  `REMARKS` text COLLATE utf8_bin DEFAULT NULL,
  `PHONE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (4,'Laura','Minghir',2,'1977-12-29','laura','alcatraz',1,20,'Hotarele','7001','Strada Almasu Mic, nr. 10, bl. B17, ap.36, et. 1, Sector 5','','0721655467'),(5,'Laura','Minghir',1,'1977-12-29',NULL,NULL,1,10,'Bucuresti','7000','Strada Almasul Mic, nr. 10, bl. B17, ap.36, et. 1, Sector 4','Livrare dupa ora 20','0721655467'),(15,'Laura','Minghir',2,NULL,'minghir@gmail.com','alcatraz',NULL,10,'Bucuresti','7000','','','0721655467'),(18,NULL,NULL,NULL,NULL,'minghirs@gmail.com','alcatraz',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_counties`
--

DROP TABLE IF EXISTS `list_counties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_counties` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_counties`
--

LOCK TABLES `list_counties` WRITE;
/*!40000 ALTER TABLE `list_counties` DISABLE KEYS */;
INSERT INTO `list_counties` VALUES (1,NULL,'ALBA'),(2,NULL,'ARAD'),(3,NULL,'ARGES'),(4,NULL,'BACAU'),(5,NULL,'BIHOR'),(6,NULL,'BISTRITA-NASAUD'),(7,NULL,'BOTOSANI'),(8,NULL,'BRAILA'),(9,NULL,'BRASOV'),(10,NULL,'BUCURESTI'),(11,NULL,'BUZAU'),(12,NULL,'CALARASI'),(13,NULL,'CARAS-SEVERIN'),(14,NULL,'CLUJ'),(15,NULL,'CONSTANTA'),(16,NULL,'COVASNA'),(17,NULL,'DIMBOVITA'),(18,NULL,'DOLJ'),(19,NULL,'GALATI'),(20,NULL,'GIURGIU'),(21,NULL,'GORJ'),(22,NULL,'HARGHITA'),(23,NULL,'HUNEDOARA'),(24,NULL,'IALOMITA'),(25,NULL,'IASI'),(26,NULL,'ILFOV'),(27,NULL,'MARAMURES'),(28,NULL,'MEHEDINTI'),(29,NULL,'MURES'),(30,NULL,'NEAMT'),(31,NULL,'OLT'),(32,NULL,'PRAHOVA'),(33,NULL,'SALAJ'),(34,NULL,'SATU MARE'),(35,NULL,'SIBIU'),(36,NULL,'SUCEAVA'),(37,NULL,'TELEORMAN'),(38,NULL,'TIMIS'),(39,NULL,'TULCEA'),(40,NULL,'VASLUI'),(41,NULL,'VILCEA'),(42,NULL,'VRANCEA');
/*!40000 ALTER TABLE `list_counties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_countries`
--

DROP TABLE IF EXISTS `list_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_countries` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_countries`
--

LOCK TABLES `list_countries` WRITE;
/*!40000 ALTER TABLE `list_countries` DISABLE KEYS */;
INSERT INTO `list_countries` VALUES (1,'','Romania');
/*!40000 ALTER TABLE `list_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_currency`
--

DROP TABLE IF EXISTS `list_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_currency` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_currency`
--

LOCK TABLES `list_currency` WRITE;
/*!40000 ALTER TABLE `list_currency` DISABLE KEYS */;
INSERT INTO `list_currency` VALUES (1,'','Lei');
/*!40000 ALTER TABLE `list_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_order_status`
--

DROP TABLE IF EXISTS `list_order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_order_status` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_order_status`
--

LOCK TABLES `list_order_status` WRITE;
/*!40000 ALTER TABLE `list_order_status` DISABLE KEYS */;
INSERT INTO `list_order_status` VALUES (1,'','prelucrare'),(2,'','efectuata'),(3,'','anulata');
/*!40000 ALTER TABLE `list_order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_title`
--

DROP TABLE IF EXISTS `list_title`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_title` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_title`
--

LOCK TABLES `list_title` WRITE;
/*!40000 ALTER TABLE `list_title` DISABLE KEYS */;
INSERT INTO `list_title` VALUES (1,'','Mrs.'),(2,'','Miss'),(3,'','Mr.');
/*!40000 ALTER TABLE `list_title` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_titles`
--

DROP TABLE IF EXISTS `list_titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_titles` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_titles`
--

LOCK TABLES `list_titles` WRITE;
/*!40000 ALTER TABLE `list_titles` DISABLE KEYS */;
INSERT INTO `list_titles` VALUES (1,'','Dl.'),(2,'','Dna.');
/*!40000 ALTER TABLE `list_titles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` bigint(20) NOT NULL DEFAULT 0,
  `CLIENT_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_bin NOT NULL DEFAULT '&quot;&quot;',
  `MSG_DATA` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (5,0,'aaaa','aaaaaaaaaaaaa','adasda',NULL),(6,0,'aaaa','aaaaaaaaaaaaa','adasda',NULL),(7,0,'Dna. Laura Minghir','laura','',NULL),(8,0,'Dna. Laura Minghir','laura','',NULL),(9,0,'gg','ddd','eee',NULL),(10,0,'aa','ddd','sss',NULL),(11,0,'Dna. Laura Minghir','laura','dd',NULL),(12,0,'Dna. Laura Minghir','laura','dd',NULL);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORDER_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `AMOUNT` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,16,7,1),(2,16,3,1),(3,17,12,1),(4,18,2,1),(5,18,6,5),(6,19,2,1),(7,19,6,5),(8,20,2,1),(9,20,6,5),(10,21,2,1),(11,21,6,5),(12,22,2,1),(13,22,6,5),(14,23,2,1),(15,23,6,5),(16,24,2,1),(17,24,6,5),(18,25,2,1),(19,25,6,5),(20,26,2,1),(21,26,6,5),(22,27,2,1),(23,27,6,5),(24,28,2,1),(25,28,6,5),(26,29,2,1),(27,29,6,5),(28,30,2,1),(29,30,6,5),(30,31,6,1),(31,32,3,1),(32,33,4,1),(33,33,1,1),(34,33,16,1),(35,34,6,1);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` bigint(20) DEFAULT NULL,
  `ORDER_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `STATUS_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `eshop_orders_CLIENT_ID_FK` (`CLIENT_ID`),
  KEY `eshop_orders_STATUS_ID_FK` (`STATUS_ID`),
  CONSTRAINT `eshop_orders_CLIENT_ID_FK` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`ID`),
  CONSTRAINT `eshop_orders_STATUS_ID_FK` FOREIGN KEY (`STATUS_ID`) REFERENCES `list_order_status` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,4,'2021-10-08 09:36:57',NULL),(3,4,'2021-10-08 09:37:30',NULL),(4,4,'2021-10-08 09:38:26',NULL),(5,4,'2021-10-08 09:59:21',NULL),(6,4,'2021-10-08 10:01:39',NULL),(7,4,'2021-10-08 10:02:20',NULL),(8,4,'2021-10-08 10:02:22',NULL),(9,4,'2021-10-08 10:02:36',NULL),(10,4,'2021-10-08 10:02:58',NULL),(11,4,'2021-10-08 10:05:34',NULL),(12,4,'2021-10-08 10:05:44',NULL),(13,4,'2021-10-08 10:06:05',NULL),(14,4,'2021-10-08 10:06:58',NULL),(15,4,'2021-10-08 10:17:16',NULL),(16,4,'2021-10-08 10:17:50',NULL),(17,4,'2021-10-14 06:53:38',NULL),(18,4,'2021-10-15 10:57:58',NULL),(19,4,'2021-10-15 10:59:56',NULL),(20,4,'2021-10-15 11:03:23',NULL),(21,4,'2021-10-15 11:04:45',NULL),(22,4,'2021-10-15 11:05:02',NULL),(23,4,'2021-10-15 11:05:21',NULL),(24,4,'2021-10-15 11:05:56',NULL),(25,4,'2021-10-15 11:05:59',NULL),(26,4,'2021-10-15 11:06:00',NULL),(27,4,'2021-10-15 11:06:07',NULL),(28,4,'2021-10-15 11:07:23',NULL),(29,4,'2021-10-15 11:09:03',NULL),(30,4,'2021-10-15 11:11:02',NULL),(31,4,'2021-10-15 11:11:24',NULL),(32,4,'2021-10-15 11:12:31',NULL),(33,15,'2021-10-21 11:04:47',NULL),(34,4,'2021-10-23 13:31:51',NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_images` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PRODUCT_ID` bigint(20) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IMG_FILE_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `eshop_product_images_PRODUCT_ID_FK` (`PRODUCT_ID`),
  CONSTRAINT `eshop_product_images_PRODUCT_ID_FK` FOREIGN KEY (`PRODUCT_ID`) REFERENCES `products` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (15,2,NULL,'user_data/2/5f9fb50aa7feb.jpg',NULL),(16,2,NULL,'user_data/2/5f9fb59895c59.gif',NULL),(18,3,NULL,'user_data/2/5fa6812e8fcd3.jpg',NULL),(19,4,NULL,'user_data/2/5fd604dc918a7.bmp',NULL),(20,6,NULL,'user_data/2/5fd605177bf1c.bmp',NULL),(21,1,NULL,'user_data/2/616ad4383a1ef.jpg',NULL),(22,16,NULL,'user_data/2/616ad4811429d.jpg',NULL);
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEGORY_ID` bigint(20) DEFAULT NULL,
  `PRODUCT_TITLE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `PRICE` decimal(20,2) NOT NULL DEFAULT 0.00,
  `CURRENCY_ID` bigint(20) DEFAULT NULL,
  `STOCK` decimal(20,0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `eshop_products_CATEGORY_ID_FK` (`CATEGORY_ID`),
  KEY `eshop_products_CURRENCY_ID_FK` (`CURRENCY_ID`),
  CONSTRAINT `eshop_products_CATEGORY_ID_FK` FOREIGN KEY (`CATEGORY_ID`) REFERENCES `categories` (`ID`),
  CONSTRAINT `eshop_products_CURRENCY_ID_FK` FOREIGN KEY (`CURRENCY_ID`) REFERENCES `list_currency` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,8,'VOPSEA PAR','Access progression Icecrown Citadel is split into four sections since release, in the following order: The Lower Spire (the first four bosses), the Plagueworks (the next three), the Crimson Hall (the next two), and Frostwing Halls (the last three). There was a period of some weeks after the opening of the first section before going on into the second. The Lich King may not be fought until Professor Putricide, Blood-Queen Lana\\\\\\\'thel and Sindragosa are dead. Any heroic modes may not be attempted until the Lich King has been defeated on normal mode, and you cannot face the Lich King on heroic mode during that week\\\\\\\'s lockout unless you defeat Putricide, Lana\\\\\\\'thel and Sindragosa on heroic mode. The second wing of the Citadel, the Plagueworks, was opened on US servers on January 5, 2010. The third wing, the Crimson Hall, was opened two weeks later, on January 19.[1] The fourth wing was opened with content patch 3.3.2 on February 2, 2010.',12.00,1,100),(2,8,'VOPSEA PAR222','Access progression\r\nIcecrown Citadel is split into four sections since release, in the following order: The Lower Spire (the first four bosses), the Plagueworks (the next three), the Crimson Hall (the next two), and Frostwing Halls (the last three). There was a period of some weeks after the opening of the first section before going on into the second. The Lich King may not be fought until Professor Putricide, Blood-Queen Lana\\\'thel and Sindragosa are dead. Any heroic modes may not be attempted until the Lich King has been defeated on normal mode, and you cannot face the Lich King on heroic mode during that week\\\'s lockout unless you defeat Putricide, Lana\\\'thel and Sindragosa on heroic mode. The second wing of the Citadel, the Plagueworks, was opened on US servers on January 5, 2010. The third wing, the Crimson Hall, was opened two weeks later, on January 19.[1] The fourth wing was opened with content patch 3.3.2 on February 2, 2010.',23.00,1,100),(3,8,'RUJ MARO','',23.00,1,100),(4,8,'VOPSEA PAR','',23.00,1,100),(6,8,'VOPSEA PAR222','',23.00,1,100),(7,8,'VOPSEA PAR222','',23.00,1,100),(8,8,'VOPSEA PAR222','',23.00,1,100),(9,8,'VOPSEA PAR222','',23.00,1,100),(10,8,'VOPSEA PAR222','',23.00,1,100),(12,8,'VOPSEA PAR222','',23.00,1,100),(13,8,'VOPSEA PAR222','',23.00,1,100),(14,8,'VOPSEA PAR222','',23.00,1,100),(15,8,'VOPSEA PAR2224','das',23.00,1,100),(16,1,'Pronto','',23.00,1,100);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_clients`
--

DROP TABLE IF EXISTS `view_clients`;
/*!50001 DROP VIEW IF EXISTS `view_clients`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_clients` (
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `EMAIL` tinyint NOT NULL,
  `COUNTY` tinyint NOT NULL,
  `CITY` tinyint NOT NULL,
  `POSTAL_CODE` tinyint NOT NULL,
  `ADDRESS_DETAILS` tinyint NOT NULL,
  `PHONE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_messages`
--

DROP TABLE IF EXISTS `view_messages`;
/*!50001 DROP VIEW IF EXISTS `view_messages`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_messages` (
  `ID` tinyint NOT NULL,
  `CLIENT_NAME` tinyint NOT NULL,
  `EMAIL` tinyint NOT NULL,
  `MESSAGE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_orders`
--

DROP TABLE IF EXISTS `view_orders`;
/*!50001 DROP VIEW IF EXISTS `view_orders`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_orders` (
  `ID` tinyint NOT NULL,
  `CLIENT_ID` tinyint NOT NULL,
  `ORDER_DATE` tinyint NOT NULL,
  `STATUS_ID` tinyint NOT NULL,
  `CLIENT_NAME` tinyint NOT NULL,
  `EMAIL` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_products`
--

DROP TABLE IF EXISTS `view_products`;
/*!50001 DROP VIEW IF EXISTS `view_products`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_products` (
  `ID` tinyint NOT NULL,
  `CATEGORY_ID` tinyint NOT NULL,
  `CATEGORY` tinyint NOT NULL,
  `PRODUCT_TITLE` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `PRICE` tinyint NOT NULL,
  `CURRENCY_ID` tinyint NOT NULL,
  `CURRENCY` tinyint NOT NULL,
  `STOCK` tinyint NOT NULL,
  `IMG` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_clients`
--

/*!50001 DROP TABLE IF EXISTS `view_clients`*/;
/*!50001 DROP VIEW IF EXISTS `view_clients`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_clients` AS select `c`.`ID` AS `ID`,concat((select `list_titles`.`VALUE` from `list_titles` where `list_titles`.`ID` = `c`.`TITLE_ID`),' ',`c`.`FIRST_NAME`,' ',`c`.`LAST_NAME`) AS `NAME`,`c`.`EMAIL` AS `EMAIL`,(select `list_counties`.`VALUE` from `list_counties` where `list_counties`.`ID` = `c`.`COUNTY_ID`) AS `COUNTY`,`c`.`CITY` AS `CITY`,`c`.`POSTAL_CODE` AS `POSTAL_CODE`,`c`.`ADDRESS_DETAILS` AS `ADDRESS_DETAILS`,`c`.`PHONE` AS `PHONE` from `clients` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_messages`
--

/*!50001 DROP TABLE IF EXISTS `view_messages`*/;
/*!50001 DROP VIEW IF EXISTS `view_messages`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_messages` AS select `messages`.`ID` AS `ID`,`messages`.`CLIENT_NAME` AS `CLIENT_NAME`,`messages`.`EMAIL` AS `EMAIL`,`messages`.`MESSAGE` AS `MESSAGE` from `messages` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_orders`
--

/*!50001 DROP TABLE IF EXISTS `view_orders`*/;
/*!50001 DROP VIEW IF EXISTS `view_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_orders` AS select `o`.`ID` AS `ID`,`o`.`CLIENT_ID` AS `CLIENT_ID`,`o`.`ORDER_DATE` AS `ORDER_DATE`,`o`.`STATUS_ID` AS `STATUS_ID`,concat(`c`.`FIRST_NAME`,' ',`c`.`LAST_NAME`) AS `CLIENT_NAME`,`c`.`EMAIL` AS `EMAIL` from (`orders` `o` left join `clients` `c` on(`o`.`CLIENT_ID` = `c`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_products`
--

/*!50001 DROP TABLE IF EXISTS `view_products`*/;
/*!50001 DROP VIEW IF EXISTS `view_products`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_products` AS select `p`.`ID` AS `ID`,`p`.`CATEGORY_ID` AS `CATEGORY_ID`,`c`.`NAME` AS `CATEGORY`,`p`.`PRODUCT_TITLE` AS `PRODUCT_TITLE`,`p`.`DESCRIPTION` AS `DESCRIPTION`,`p`.`PRICE` AS `PRICE`,`p`.`CURRENCY_ID` AS `CURRENCY_ID`,`cr`.`VALUE` AS `CURRENCY`,`p`.`STOCK` AS `STOCK`,(select `i`.`IMG_FILE_NAME` from `product_images` `i` where `i`.`PRODUCT_ID` = `p`.`ID` and `i`.`ID` = (select min(`j`.`ID`) from `product_images` `j` where `j`.`PRODUCT_ID` = `p`.`ID` limit 1)) AS `IMG` from ((`products` `p` left join `categories` `c` on(`p`.`CATEGORY_ID` = `c`.`ID`)) left join `list_currency` `cr` on(`p`.`CURRENCY_ID` = `cr`.`ID`)) */;
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

-- Dump completed on 2021-10-24 10:57:21
