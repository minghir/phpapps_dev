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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,0,'DETERGENTI','DETERGENTI',''),(8,0,'PRODUSE PENTRU BAIE','PRODUSE PENTRU BAIE',''),(14,0,'PRODUSE PENTRU BUCĂTĂRIE','PRODUSE PENTRU BUCĂTĂRIE',''),(15,0,'MENAJ','MENAJ',''),(16,0,'ÎNGRIJIRE PERSONALĂ','ÎNGRIJIRE PERSONALĂ',''),(17,0,'MOBILĂ ȘI PARDOSELI','MOBILĂ ȘI PARDOSELI',''),(18,0,'DIVERSE','DIVERSE','');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,NULL,NULL,NULL,NULL,'gigi@fifi.com','aaaaaaaaaaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,NULL,NULL,NULL,NULL,'gigi@fifi','aaaaaaaaaaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,NULL,NULL,NULL,'gigififi','aaaaaaaaaaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Laura','Minghir',2,'1977-12-29','laura','alcatraz',1,10,'Bucuresti','7000','Strada Almasul Mic, nr. 10, bl. B17, ap.36, et. 1, Sector 4','','0721655467'),(5,'Laura','Minghir',1,'1977-12-29',NULL,NULL,1,10,'Bucuresti','7000','Strada Almasul Mic, nr. 10, bl. B17, ap.36, et. 1, Sector 4','Livrare dupa ora 20','0721655467'),(6,NULL,NULL,NULL,NULL,'minghir@gmail.com','12345678',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
  `MESSAGE` text COLLATE utf8_bin NOT NULL DEFAULT '&quot;&quot;',
  `MSG_DATA` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,0,'',NULL),(2,0,'',NULL),(3,0,'dadas',NULL),(4,0,'dadas',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
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
  `ORDER_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `STATUS_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `eshop_orders_CLIENT_ID_FK` (`CLIENT_ID`),
  KEY `eshop_orders_STATUS_ID_FK` (`STATUS_ID`),
  CONSTRAINT `eshop_orders_CLIENT_ID_FK` FOREIGN KEY (`CLIENT_ID`) REFERENCES `clients` (`ID`),
  CONSTRAINT `eshop_orders_STATUS_ID_FK` FOREIGN KEY (`STATUS_ID`) REFERENCES `list_order_status` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (13,1,NULL,'user_data/2/5eac513015406.jpg',NULL),(14,1,NULL,'user_data/2/5fd77395f308c.jpg',NULL),(15,2,NULL,'user_data/2/5f9fb50aa7feb.jpg',NULL),(16,2,NULL,'user_data/2/5f9fb59895c59.gif',NULL),(17,1,NULL,'user_data/2/5fa50b4a6d2d4.jpg',NULL),(18,3,NULL,'user_data/2/5fa6812e8fcd3.jpg',NULL),(19,4,NULL,'user_data/2/5fd604dc918a7.bmp',NULL),(20,6,NULL,'user_data/2/5fd605177bf1c.bmp',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,8,'VOPSEA PAR','',23.00,1,100),(2,8,'VOPSEA PAR222','dadas',23.00,1,100),(3,8,'RUJ MARO','',23.00,1,100),(4,8,'VOPSEA PAR','',23.00,1,100),(6,8,'VOPSEA PAR222','',23.00,1,100),(7,8,'VOPSEA PAR222','',23.00,1,100),(8,8,'VOPSEA PAR222','',23.00,1,100),(9,8,'VOPSEA PAR222','',23.00,1,100),(10,8,'VOPSEA PAR222','',23.00,1,100),(12,8,'VOPSEA PAR222','',23.00,1,100),(13,8,'VOPSEA PAR222','',23.00,1,100),(14,8,'VOPSEA PAR222','',23.00,1,100),(15,8,'VOPSEA PAR2224','das',23.00,1,100);
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
  `PHONE` tinyint NOT NULL
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
/*!50001 VIEW `view_clients` AS select `c`.`ID` AS `ID`,concat((select `list_title`.`VALUE` from `list_title` where `list_title`.`ID` = `c`.`TITLE_ID`),' ',`c`.`FIRST_NAME`,' ',`c`.`LAST_NAME`) AS `NAME`,`c`.`EMAIL` AS `EMAIL`,(select `list_counties`.`VALUE` from `list_counties` where `list_counties`.`ID` = `c`.`COUNTY_ID`) AS `COUNTY`,`c`.`CITY` AS `CITY`,`c`.`PHONE` AS `PHONE` from `clients` `c` */;
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

-- Dump completed on 2021-10-05 10:35:21
