-- MySQL dump 10.13  Distrib 5.6.26, for Win32 (x86)
--
-- Host: localhost    Database: phpapps
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
-- Table structure for table `aa`
--

DROP TABLE IF EXISTS `aa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aa` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `APP_ID` bigint(20) DEFAULT NULL,
  `NUME` varchar(255) DEFAULT NULL,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `MODIFY_UID` (`MODIFY_UID`),
  KEY `CREATE_UID` (`CREATE_UID`),
  KEY `phpapps_applications_APP_ID_FK` (`APP_ID`),
  CONSTRAINT `aa_ibfk_1` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `aa_ibfk_2` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `phpapps_applications_APP_ID_FK` FOREIGN KEY (`APP_ID`) REFERENCES `applications` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aa`
--

LOCK TABLES `aa` WRITE;
/*!40000 ALTER TABLE `aa` DISABLE KEYS */;
/*!40000 ALTER TABLE `aa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aa_test`
--

DROP TABLE IF EXISTS `aa_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aa_test` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `nume` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aa_test`
--

LOCK TABLES `aa_test` WRITE;
/*!40000 ALTER TABLE `aa_test` DISABLE KEYS */;
INSERT INTO `aa_test` VALUES (3,'2015-08-21'),(4,'2015-08-29'),(6,'7777');
/*!40000 ALTER TABLE `aa_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aaaa`
--

DROP TABLE IF EXISTS `aaaa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aaaa` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aaaa`
--

LOCK TABLES `aaaa` WRITE;
/*!40000 ALTER TABLE `aaaa` DISABLE KEYS */;
/*!40000 ALTER TABLE `aaaa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `APP_NAME` varchar(20) NOT NULL DEFAULT '',
  `APP_TITLE` varchar(255) NOT NULL DEFAULT '',
  `APP_SCHEMA` varchar(20) NOT NULL DEFAULT '',
  `BASE_DIR` varchar(20) NOT NULL DEFAULT '',
  `APP_DATE` date NOT NULL DEFAULT '0000-00-00',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `applications_ibfk_2` (`MODIFY_UID`),
  KEY `applications_ibfk_3` (`CREATE_UID`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,1,'phpapps','Admin PHP Applications','3','.','2015-10-03','Admin PHP Applications',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,1,'eshop_template','E-Shop Template','7','..','0000-00-00','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,1,'laravel_test','Laravel Database Test','2','../','2016-08-30','',1,1,'2016-08-30 08:52:02','2016-08-30 08:25:01');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form_details`
--

DROP TABLE IF EXISTS `form_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form_details` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORM_ID` bigint(20) NOT NULL,
  `FIELD` varchar(255) NOT NULL DEFAULT '',
  `FIELD_TYPE` varchar(255) NOT NULL DEFAULT '',
  `HIDDEN` int(1) NOT NULL DEFAULT '0',
  `LABEL` varchar(255) NOT NULL DEFAULT '',
  `MANDATORY` int(1) NOT NULL DEFAULT '0',
  `INPUT_TYPE` varchar(255) NOT NULL DEFAULT '',
  `REFERENCE_LIST` varchar(255) NOT NULL DEFAULT '',
  `REFERENCE_TABLE` varchar(255) NOT NULL DEFAULT '',
  `REFERENCE_FIELD` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `FORM_ID` (`FORM_ID`),
  CONSTRAINT `form_details_ibfk_1` FOREIGN KEY (`FORM_ID`) REFERENCES `forms` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=356 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_details`
--

LOCK TABLES `form_details` WRITE;
/*!40000 ALTER TABLE `form_details` DISABLE KEYS */;
INSERT INTO `form_details` VALUES (58,47,'ID','bigint(20)',1,'ID',0,'text','','',''),(59,47,'USER_ID','bigint(20)',0,'User',1,'select_table','','users','USERNAME'),(60,47,'APP_NAME','varchar(20)',0,'Application name',1,'text','','',''),(61,47,'APP_TITLE','varchar(255)',0,'Application title',0,'text','','',''),(62,47,'APP_SCHEMA','varchar(20)',0,'Application database',0,'select_list','list_databases','',''),(63,47,'BASE_DIR','varchar(20)',0,'Application Directory',0,'text','','',''),(64,47,'APP_DATE','date',0,'APP_DATE',0,'date','','',''),(65,47,'DESCRIPTION','varchar(255)',0,'Description',0,'textarea','','',''),(66,48,'ID','bigint(20)',1,'ID',0,'text','','',''),(67,48,'VALUE','varchar(20)',0,'VALUE',1,'text','','',''),(68,48,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(77,54,'ID','bigint(20)',1,'ID',0,'text','','',''),(78,54,'PID','bigint(20)',0,'PID',1,'select_table','','categories','NAME'),(79,54,'NAME','varchar(20)',0,'NAME',0,'text','','',''),(80,54,'TITLE','varchar(255)',0,'TITLE',0,'text','','',''),(81,54,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'text','','',''),(98,55,'ID','bigint(20)',1,'ID',0,'text','','',''),(99,55,'USERNAME','varchar(255)',0,'USERNAME',1,'text','','',''),(100,55,'PASSWORD','varchar(255)',0,'PASSWORD',0,'text','','',''),(101,55,'FIRSTNAME','varchar(255)',0,'FIRSTNAME',0,'text','','',''),(102,55,'LASTNAME','varchar(255)',0,'LASTNAME',0,'text','','',''),(103,55,'EMAIL','varchar(255)',0,'EMAIL',0,'text','','',''),(104,55,'USER_TYPE','bigint(20)',0,'USER_TYPE',0,'select_list','list_user_types','',''),(105,55,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(129,60,'ID','bigint(20)',1,'ID',0,'text','','',''),(130,60,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'hidden','','',''),(131,60,'SCRIPT_TYPE','bigint(20)',0,'SCRIPT_TYPE',0,'select_list','list_script_types','',''),(132,60,'SCRIPT_NAME','varchar(255)',0,'SCRIPT_NAME',1,'text','','',''),(133,60,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(159,65,'ID','bigint(20)',1,'ID',0,'text','','',''),(160,65,'APP_ID','bigint(20)',0,'APP_ID',1,'hidden','','',''),(161,65,'SCRIPT_ID','bigint(20)',0,'START SCRIPT',1,'select_table','','scripts','SCRIPT_NAME'),(162,65,'MODULE_NAME','varchar(20)',0,'MODULE NAME',0,'text','','',''),(163,65,'MODULE_TITLE','varchar(255)',0,'MODULE TITLE',0,'text','','',''),(164,65,'MODULE_DATE','date',0,'MODULE_DATE',0,'hidden','','',''),(165,65,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(166,66,'ID','bigint(20)',1,'ID',0,'text','','',''),(167,66,'ROLE_NAME','varchar(255)',0,'ROLE_NAME',1,'text','','',''),(168,66,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(175,69,'ID','bigint(20)',1,'ID',0,'text','','',''),(176,69,'UID','bigint(20)',0,'UID',1,'hidden','','',''),(177,69,'ROLE_ID','bigint(20)',0,'ROLE_ID',1,'select_table','','roles','ROLE_NAME'),(188,72,'ID','bigint(20)',1,'ID',0,'text','','',''),(189,72,'PERMISSION_NAME','varchar(255)',0,'PERMISSION_NAME',1,'select_list','list_permission_names','',''),(190,72,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(191,72,'PERMISSION_TYPE','bigint(20)',0,'PERMISSION_TYPE',1,'select_list','list_permission_types','',''),(192,72,'OBJECT_TYPE','bigint(20)',0,'OBJECT_TYPE',1,'select_list','list_object_types','',''),(193,72,'OBJECT_ID','bigint(20)',0,'OBJECT_ID',1,'hidden','','',''),(194,73,'ID','bigint(20)',1,'ID',0,'text','','',''),(195,73,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'select_table','','modules','MODULE_NAME'),(196,73,'VIEW_NAME','varchar(255)',0,'VIEW_NAME',1,'text','','',''),(197,73,'CREATE_VIEW_QUERY','tinytext',0,'CREATE_VIEW_QUERY',0,'textarea','','',''),(198,73,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(199,74,'ID','bigint(20)',1,'ID',0,'text','','',''),(200,74,'CATEG_ID','bigint(20)',0,'CATEG_ID',0,'select_table','','categories','NAME'),(201,74,'PRODUCT_NAME','varchar(255)',0,'PRODUCT_NAME',0,'text','','',''),(202,74,'DESCRIPTION','tinytext',0,'DESCRIPTION',0,'text','','',''),(209,76,'ID','bigint(20)',1,'ID',0,'text','','',''),(210,76,'ROLE_ID','bigint(20)',0,'ROLE_ID',1,'select_table','','roles','ROLE_NAME'),(211,76,'PERMISSION_ID','bigint(20)',0,'PERMISSION_ID',1,'select_table','','view_permissions','DESCRIPTION'),(223,79,'ID','bigint(20)',1,'ID',0,'text','','',''),(224,79,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'hidden','','',''),(225,79,'SCHEMA_ID','bigint(20)',0,'SCHEMA_ID',1,'hidden','','',''),(226,79,'TABLE_NAME','varchar(255)',0,'TABLE_NAME',1,'select_table','','tables','TABLE_NAME'),(227,79,'CREATE_TABLE_QUERY','text',1,'CREATE_TABLE_QUERY',0,'text','','',''),(228,79,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(246,84,'ID','bigint(20)',1,'ID',0,'text','','',''),(247,84,'USERNAME','varchar(255)',0,'USERNAME',1,'text','','',''),(248,84,'PASSWORD','varchar(255)',0,'PASSWORD',0,'text','','',''),(249,84,'FIRSTNAME','varchar(255)',0,'FIRSTNAME',0,'text','','',''),(250,84,'LASTNAME','varchar(255)',0,'LASTNAME',0,'text','','',''),(251,84,'EMAIL','varchar(255)',0,'EMAIL',0,'text','','',''),(252,84,'USER_TYPE','bigint(20)',0,'USER_TYPE',0,'select_list','list_user_types','',''),(253,84,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(254,84,'PROFILE_ID','bigint(20)',0,'PROFILE_ID',0,'select_table','','user_profiles','PROFILE_NAME'),(255,84,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(256,84,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(257,84,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(258,84,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(259,85,'ID','bigint(20)',1,'ID',0,'text','','',''),(260,85,'SCRIPT_ID','bigint(20)',0,'SCRIPT_ID',0,'select_table','','scripts','SCRIPT_NAME'),(261,85,'PROFILE_NAME','varchar(255)',0,'PROFILE_NAME',1,'text','','',''),(262,85,'THEME','bigint(10)',0,'THEME',0,'text','','',''),(263,85,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(264,85,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(265,85,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(266,85,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(316,91,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(317,91,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'hidden','','',''),(318,91,'SCHEMA_ID','bigint(20)',0,'SCHEMA_ID',1,'hidden','','',''),(319,91,'TABLE_NAME','varchar(255)',0,'TABLE_NAME',1,'text','','',''),(320,91,'TABLE_TYPE','bigint(20)',0,'TABLE_TYPE',0,'select_list','list_table_types','',''),(321,91,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(322,91,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(323,91,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(324,91,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(325,91,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(341,93,'ID','bigint(20)',1,'ID',0,'hidden','','',''),(342,93,'TABLE_ID','bigint(20)',0,'TABLE_ID',1,'hidden','','',''),(343,93,'COLUMN_NAME','varchar(255)',0,'COLUMN_NAME',1,'text','','',''),(344,93,'COLUMN_TYPE_ID','bigint(20)',0,'COLUMN_TYPE_ID',1,'select_list','list_mysql_column_types','',''),(345,93,'COLUMN_SIZE','bigint(20)',0,'COLUMN_SIZE',0,'text','','',''),(346,93,'COLUMN_DEFAULT_VALUE','varchar(255)',0,'COLUMN_DEFAULT_VALUE',0,'text','','',''),(347,93,'FOREIGN_KEY_SCHEMA_ID','bigint(20)',0,'FOREIGN_KEY_SCHEMA_ID',0,'select_list','list_databases','',''),(348,93,'FOREIGN_KEY_TABLE_ID','bigint(20)',0,'FOREIGN_KEY_TABLE_ID',0,'select_table','','tables','TABLE_NAME'),(349,93,'FOREIGN_KEY_COLUMN_ID','bigint(20)',1,'FOREIGN_KEY_COLUMN_ID',0,'hidden','','',''),(350,93,'COLUMN_INDEX_TYPE_ID','bigint(20)',0,'COLUMN_INDEX_TYPE_ID',0,'select_list','list_index_types','',''),(351,93,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(352,93,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(353,93,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(354,93,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(355,93,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','','');
/*!40000 ALTER TABLE `form_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forms`
--

DROP TABLE IF EXISTS `forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `forms` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` bigint(20) NOT NULL,
  `FORM_NAME` varchar(255) NOT NULL DEFAULT '',
  `TABLE_ID` bigint(20) NOT NULL DEFAULT '0',
  `FORM_QUERY` varchar(255) NOT NULL DEFAULT '',
  `FORM_PHP_DIR` varchar(20) NOT NULL DEFAULT '',
  `FORM_TPL_DIR` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `MODULE_ID` (`MODULE_ID`,`FORM_NAME`),
  KEY `forms_ibfk_2` (`TABLE_ID`),
  KEY `forms_ibfk_3` (`MODIFY_UID`),
  KEY `forms_ibfk_4` (`CREATE_UID`),
  CONSTRAINT `forms_ibfk_1` FOREIGN KEY (`MODULE_ID`) REFERENCES `modules` (`ID`),
  CONSTRAINT `forms_ibfk_2` FOREIGN KEY (`TABLE_ID`) REFERENCES `tables` (`ID`),
  CONSTRAINT `forms_ibfk_3` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `forms_ibfk_4` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES (22,1,'phpapps_admin_lists',4,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(47,1,'phpapps_admin_applications_form',2,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(48,1,'phpapps_admin_list_form',18,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,10,'eshop_admin_categories_form',80,'','..\\eshop_template','..\\eshop_template','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(55,1,'phpapps_admin_users_form',1,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,1,'phpapps_admin_scripts_form',83,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,1,'phpapps_admin_modules_form',3,'','.\\phpapps','.\\phpapps','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,7,'phpapps_users_roles_form',88,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,7,'phpapps_users_user_roles_form',90,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,7,'phpapps_users_permissions_form',89,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(73,1,'phpapps_admin_views_form',97,'','.\\phpapps','.\\phpapps','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(74,10,'eshop_admin_products_form',100,'','..\\eshop_template','..\\eshop_template','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(76,7,'phpapps_users_role_permissions_form',91,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(79,1,'phpapps_admin_add_table_form',4,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,7,'phpapps_users_users_form',87,'','D:\\linuxport\\Apache2','D:\\linuxport\\Apache2','',1,1,'2015-08-19 09:47:14','2015-08-19 09:47:14'),(85,7,'phpapps_users_user_profiles_form',99,'','D:\\linuxport\\Apache2','D:\\linuxport\\Apache2','',1,1,'2015-08-19 11:48:51','2015-08-19 11:48:51'),(91,1,'phpapps_admin_tables_form',4,'','D:\\\\linuxport\\\\Apach','D:\\\\linuxport\\\\Apach','',1,1,'2016-09-06 05:51:08','2016-09-06 05:51:08'),(93,1,'phpapps_admin_table_details_form',131,'','D:\\\\linuxport\\\\Apach','D:\\\\linuxport\\\\Apach','',1,1,'2016-09-07 06:43:45','2016-09-07 06:43:45');
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_databases`
--

DROP TABLE IF EXISTS `list_databases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_databases` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_databases`
--

LOCK TABLES `list_databases` WRITE;
/*!40000 ALTER TABLE `list_databases` DISABLE KEYS */;
INSERT INTO `list_databases` VALUES (1,'mysql','mysql'),(2,'test','test'),(3,'phpapps','phpapps'),(4,'acsru_ccm','acsru_ccm'),(5,'acsru_sas','acsru_sas'),(6,'acsru_nego','acsru_nego'),(7,'eshop',''),(8,'acsru_v1',''),(9,'acsru_112','');
/*!40000 ALTER TABLE `list_databases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_empty`
--

DROP TABLE IF EXISTS `list_empty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_empty` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_empty`
--

LOCK TABLES `list_empty` WRITE;
/*!40000 ALTER TABLE `list_empty` DISABLE KEYS */;
/*!40000 ALTER TABLE `list_empty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_index_types`
--

DROP TABLE IF EXISTS `list_index_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_index_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_index_types`
--

LOCK TABLES `list_index_types` WRITE;
/*!40000 ALTER TABLE `list_index_types` DISABLE KEYS */;
INSERT INTO `list_index_types` VALUES (1,'PRIMARY',''),(2,'UNIQUE',''),(3,'INDEX',''),(4,'FULLTEXT',''),(5,'NONE','NONE');
/*!40000 ALTER TABLE `list_index_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_mysql_column_types`
--

DROP TABLE IF EXISTS `list_mysql_column_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_mysql_column_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_mysql_column_types`
--

LOCK TABLES `list_mysql_column_types` WRITE;
/*!40000 ALTER TABLE `list_mysql_column_types` DISABLE KEYS */;
INSERT INTO `list_mysql_column_types` VALUES (1,'TINYINT','Signed: -128 <-> 127<br>\r\nUnsigned: 0 <-> 255'),(2,'SMALLINT','Signed: -32768 <-> 32767<br>\r\nUnsigned: -32768 <-> 32767'),(3,'MEDIUMINT','Signed: -8388608 <-> 8388607<br>\r\nUnsigned: 0 <-> 16777215'),(4,'INTEGER','Signed : -2147483648 <-> 2147483647<br>\r\nUnsigned: 0 <-> 4294967295'),(5,'BIGINT','Signed: -9223372036854775808 <-> 9223372036854775807<br>\r\nUnsigned: 0 <-> 18446744073709551615'),(6,'NUMERIC',''),(7,'VARCHAR',''),(8,'TEXT','');
/*!40000 ALTER TABLE `list_mysql_column_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_no_yes`
--

DROP TABLE IF EXISTS `list_no_yes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_no_yes` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_no_yes`
--

LOCK TABLES `list_no_yes` WRITE;
/*!40000 ALTER TABLE `list_no_yes` DISABLE KEYS */;
INSERT INTO `list_no_yes` VALUES (0,'NO','Id = 0'),(1,'YES','Id = 1');
/*!40000 ALTER TABLE `list_no_yes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_object_types`
--

DROP TABLE IF EXISTS `list_object_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_object_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_object_types`
--

LOCK TABLES `list_object_types` WRITE;
/*!40000 ALTER TABLE `list_object_types` DISABLE KEYS */;
INSERT INTO `list_object_types` VALUES (1,'script','Application Script'),(2,'form','Application form'),(3,'table','Database Table'),(4,'view','Database view');
/*!40000 ALTER TABLE `list_object_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_permission_names`
--

DROP TABLE IF EXISTS `list_permission_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_permission_names` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_permission_names`
--

LOCK TABLES `list_permission_names` WRITE;
/*!40000 ALTER TABLE `list_permission_names` DISABLE KEYS */;
INSERT INTO `list_permission_names` VALUES (1,'select',''),(2,'insert',''),(3,'update',''),(4,'delete',''),(5,'create_table',''),(6,'create_view',''),(7,'create_script',''),(8,'create_form',''),(9,'create_app',''),(10,'create_module','');
/*!40000 ALTER TABLE `list_permission_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_permission_types`
--

DROP TABLE IF EXISTS `list_permission_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_permission_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_permission_types`
--

LOCK TABLES `list_permission_types` WRITE;
/*!40000 ALTER TABLE `list_permission_types` DISABLE KEYS */;
INSERT INTO `list_permission_types` VALUES (1,'database object',''),(2,'application object','');
/*!40000 ALTER TABLE `list_permission_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_script_types`
--

DROP TABLE IF EXISTS `list_script_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_script_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_script_types`
--

LOCK TABLES `list_script_types` WRITE;
/*!40000 ALTER TABLE `list_script_types` DISABLE KEYS */;
INSERT INTO `list_script_types` VALUES (1,'admin',''),(2,'public','');
/*!40000 ALTER TABLE `list_script_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_table_types`
--

DROP TABLE IF EXISTS `list_table_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_table_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_table_types`
--

LOCK TABLES `list_table_types` WRITE;
/*!40000 ALTER TABLE `list_table_types` DISABLE KEYS */;
INSERT INTO `list_table_types` VALUES (1,'list_table',''),(2,'values_table',''),(3,'result_table','');
/*!40000 ALTER TABLE `list_table_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_user_types`
--

DROP TABLE IF EXISTS `list_user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_user_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_user_types`
--

LOCK TABLES `list_user_types` WRITE;
/*!40000 ALTER TABLE `list_user_types` DISABLE KEYS */;
INSERT INTO `list_user_types` VALUES (1,'admin','admin');
/*!40000 ALTER TABLE `list_user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_vars`
--

DROP TABLE IF EXISTS `module_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_vars` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` bigint(20) NOT NULL DEFAULT '0',
  `VAR_NAME` varchar(255) NOT NULL DEFAULT '',
  `VAR_VALUE` varchar(255) NOT NULL DEFAULT '',
  `VAR_TYPE` bigint(20) NOT NULL DEFAULT '0',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `MODULE_ID` (`MODULE_ID`),
  KEY `VAR_TYPE` (`VAR_TYPE`),
  KEY `MODIFY_UID` (`MODIFY_UID`),
  KEY `CREATE_UID` (`CREATE_UID`),
  CONSTRAINT `module_vars_ibfk_1` FOREIGN KEY (`MODULE_ID`) REFERENCES `modules` (`ID`),
  CONSTRAINT `module_vars_ibfk_2` FOREIGN KEY (`VAR_TYPE`) REFERENCES `list_mysql_column_types` (`ID`),
  CONSTRAINT `module_vars_ibfk_3` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `module_vars_ibfk_4` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_vars`
--

LOCK TABLES `module_vars` WRITE;
/*!40000 ALTER TABLE `module_vars` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_vars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `APP_ID` bigint(20) NOT NULL,
  `SCRIPT_ID` bigint(20) NOT NULL DEFAULT '2',
  `MODULE_NAME` varchar(20) NOT NULL DEFAULT '',
  `MODULE_TITLE` varchar(255) NOT NULL DEFAULT '',
  `MODULE_DATE` date NOT NULL DEFAULT '0000-00-00',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `APP_ID` (`APP_ID`),
  KEY `modules_ibfk_2` (`SCRIPT_ID`),
  KEY `modules_ibfk_3` (`MODIFY_UID`),
  KEY `modules_ibfk_4` (`CREATE_UID`),
  CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`APP_ID`) REFERENCES `applications` (`ID`),
  CONSTRAINT `modules_ibfk_2` FOREIGN KEY (`SCRIPT_ID`) REFERENCES `scripts` (`ID`),
  CONSTRAINT `modules_ibfk_3` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `modules_ibfk_4` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,1,2,'phpapps_admin','PHPApps Admin Module','0000-00-00','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,1,3,'phpapps_users','PHPApps Admin Users','0000-00-00','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,1,2,'phpapps_lang','PHPApps Admin Languages','0000-00-00','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,7,2,'eshop_admin','E-Shop Admin Module','0000-00-00','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,10,7,'test_schema','test_schema','2016-08-30','',1,1,'2016-08-30 08:38:36','2016-08-30 08:38:36');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PERMISSION_NAME` bigint(20) NOT NULL DEFAULT '1',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `PERMISSION_TYPE` bigint(20) NOT NULL DEFAULT '1',
  `OBJECT_TYPE` bigint(20) NOT NULL DEFAULT '1',
  `OBJECT_ID` bigint(20) NOT NULL DEFAULT '0',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `permissions_unique_name_obj_id_idx` (`PERMISSION_NAME`,`OBJECT_ID`),
  KEY `permissions_ibfk_1` (`PERMISSION_NAME`),
  KEY `permissions_ibfk_2` (`PERMISSION_TYPE`),
  KEY `permissions_ibfk_3` (`OBJECT_TYPE`),
  CONSTRAINT `permissions_ibfk_1` FOREIGN KEY (`PERMISSION_NAME`) REFERENCES `list_permission_names` (`ID`),
  CONSTRAINT `permissions_ibfk_2` FOREIGN KEY (`PERMISSION_TYPE`) REFERENCES `list_permission_types` (`ID`),
  CONSTRAINT `permissions_ibfk_3` FOREIGN KEY (`OBJECT_TYPE`) REFERENCES `list_object_types` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (3,1,'select_applications',1,3,2,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,2,'',1,3,2,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,3,'',1,3,2,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(6,4,'',1,3,2,1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permissions` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) NOT NULL DEFAULT '0',
  `PERMISSION_ID` bigint(20) NOT NULL DEFAULT '0',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  KEY `PERMISSION_ID` (`PERMISSION_ID`),
  KEY `role_permissions_ibfk_3` (`MODIFY_UID`),
  KEY `role_permissions_ibfk_4` (`CREATE_UID`),
  CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`ID`),
  CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permissions` (`ID`),
  CONSTRAINT `role_permissions_ibfk_3` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `role_permissions_ibfk_4` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
INSERT INTO `role_permissions` VALUES (1,2,3,1,1,'2015-08-19 09:41:50','2015-08-19 09:30:34'),(2,2,3,1,1,'2015-08-19 09:30:34','2015-08-19 09:30:34'),(3,3,3,1,1,'2015-08-19 09:30:34','2015-08-19 09:30:34');
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_NAME` varchar(255) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `roles_ibfk_1` (`MODIFY_UID`),
  KEY `roles_ibfk_2` (`CREATE_UID`),
  CONSTRAINT `roles_ibfk_1` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `roles_ibfk_2` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'phpapps_admin','',1,1,'2015-08-19 09:29:33','2015-08-19 09:29:34'),(3,'role 2','',1,1,'2015-08-19 09:29:33','2015-08-19 09:29:34'),(4,'rrr','',1,1,'2015-11-19 12:56:00','2015-11-19 12:56:00');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scripts`
--

DROP TABLE IF EXISTS `scripts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scripts` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` bigint(20) NOT NULL DEFAULT '0',
  `SCRIPT_TYPE` bigint(20) NOT NULL DEFAULT '0',
  `SCRIPT_NAME` varchar(255) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `scripts_modid_name_idx` (`MODULE_ID`,`SCRIPT_NAME`),
  KEY `MODULE_ID` (`MODULE_ID`),
  KEY `SCRIPT_TYPE` (`SCRIPT_TYPE`),
  KEY `scripts_ibfk_3` (`MODIFY_UID`),
  KEY `scripts_ibfk_4` (`CREATE_UID`),
  CONSTRAINT `scripts_ibfk_1` FOREIGN KEY (`MODULE_ID`) REFERENCES `modules` (`ID`),
  CONSTRAINT `scripts_ibfk_2` FOREIGN KEY (`SCRIPT_TYPE`) REFERENCES `list_script_types` (`ID`),
  CONSTRAINT `scripts_ibfk_3` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `scripts_ibfk_4` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (2,1,1,'phpapps_admin_module','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(3,7,1,'phpapps_users_module','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(4,7,1,'phpapps_users_generate_permissions','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(5,7,1,'phpapps_users_manage_user_roles','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(6,1,1,'sql','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(7,1,2,'index','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(8,7,1,'phpapps_users_manage_roles_permissions','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(9,8,1,'sql','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(10,1,2,'login','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(11,7,1,'user_home','',1,1,'2015-08-19 11:49:50','2015-08-19 11:49:50'),(12,1,1,'phpapps_admin_applications','',1,1,'2015-08-19 12:32:57','2015-08-19 12:32:57'),(13,1,1,'test_pdo','',1,1,'2016-01-18 09:18:00','2016-01-18 09:18:00'),(18,13,1,'test_laravel','',1,1,'2016-08-30 08:56:13','2016-08-30 08:56:13'),(19,1,1,'phpinfo','',1,1,'2016-08-30 12:51:15','2016-08-30 12:51:15');
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_query`
--

DROP TABLE IF EXISTS `sql_query`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_query` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `QUERY` text NOT NULL,
  `DESCR` varchar(255) DEFAULT NULL,
  `DATAQ` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_query`
--

LOCK TABLES `sql_query` WRITE;
/*!40000 ALTER TABLE `sql_query` DISABLE KEYS */;
INSERT INTO `sql_query` VALUES (1,'select CONCAT(\'$MYSQL_COLUMN_TYPES[\',ID,\']=\\\"\',VALUE,\'\\\";\') AS MYSQL_COLUMN_TYPES_ARRAY from  list_mysql_column_types','MYSQL_COLUMN_TYPES_ARRAY','2015-07-29 10:36:48'),(2,'select CONCAT(\'$MYSQL_INDEX_TYPES[\',ID,\']=\\\"\',VALUE,\'\\\";\') AS MYSQL_INDEX_TYPES_ARRAY from  list_index_types','MYSQL_INDEX_TYPES_ARRAY','2015-07-29 10:39:49'),(3,'create view view_permissions as\r\nselect \r\n	p.ID,\r\n 	pn.VALUE AS PERMISSION_NAME,\r\n        pn.ID AS PERMISSION_NAME_ID,\r\n 	p.DESCRIPTION,\r\n 	pt.VALUE AS PERMISSION_TYPE,\r\n        pt.ID AS PERMISSION_TYPE_ID,\r\n 	ot.VALUE AS OBJECT_TYPE,\r\n        ot.ID AS OBJECT_TYPE_ID,\r\n     case ot.VALUE\r\n      when \'table\' then (SELECT TABLE_NAME FROM tables WHERE ID = p.OBJECT_ID)\r\n      when \'view\' then (SELECT VIEW_NAME FROM views WHERE ID = p.OBJECT_ID)\r\n      when \'form\' then (SELECT FORM_NAME FROM forms WHERE ID = p.OBJECT_ID)\r\n      when \'script\' then (SELECT SCRIPT_NAME FROM scripts WHERE ID = p.OBJECT_ID)\r\nend  AS OBJECT_NAME,\r\np.OBJECT_ID 	 \r\n\r\nfrom permissions p , list_permission_types pt, list_object_types ot, list_permission_names pn \r\nwhere p.PERMISSION_TYPE = pt.ID and p.OBJECT_TYPE = ot.ID and p.PERMISSION_NAME = pn.ID','view_permissions','2015-08-12 09:24:56'),(4,'show tables','show tables','2016-04-05 15:03:53'),(6,'create view view_table_details as select d.ID,\r\nd.TABLE_ID,\r\nt.TABLE_NAME,\r\nd.COLUMN_NAME,\r\nd.COLUMN_TYPE_ID,\r\n(SELECT VALUE FROM list_mysql_column_types WHERE ID = d.COLUMN_TYPE_ID) AS COLUMN_TYPE_LABEl,\r\nd.COLUMN_SIZE,\r\nd.COLUMN_DEFAULT_VALUE,\r\nd.FOREIGN_KEY_SCHEMA_ID,\r\n(SELECT VALUE FROM list_databases WHERE ID = d.FOREIGN_KEY_SCHEMA_ID) AS FOREIGN_KEY_SCHEMA_LABEl,\r\nd.FOREIGN_KEY_TABLE_ID,\r\n(SELECT TABLE_NAME FROM tables WHERE ID = d.FOREIGN_KEY_TABLE_ID) AS FOREIGN_KEY_TABLE_LABEl,\r\nd.FOREIGN_KEY_COLUMN_ID,\r\n(SELECT COLUMN_NAME FROM table_details WHERE ID = d.FOREIGN_KEY_COLUMN_ID) AS FOREIGN_KEY_COLUMN_LABEL,\r\nd.COLUMN_INDEX_TYPE_ID,\r\n(SELECT VALUE FROM list_index_types WHERE ID = d.COLUMN_INDEX_TYPE_ID) AS COLUMN_INDEX_TYPE_LABEL,\r\nd.DESCRIPTION,\r\nd.MODIFY_UID,\r\n(SELECT USERNAME FROM users WHERE ID = d.MODIFY_UID) AS MODIFIED_BY,\r\nd.CREATE_UID,\r\n(SELECT USERNAME FROM users WHERE ID = d.CREATE_UID) AS CREATED_BY,\r\nd.MODIFY_DATE,\r\nd.CREATE_DATE\r\n\r\nfrom  table_details d left join tables t on (d.table_id = t.id)','view_table_details','2016-09-06 11:20:15');
/*!40000 ALTER TABLE `sql_query` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_details`
--

DROP TABLE IF EXISTS `table_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_details` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TABLE_ID` bigint(20) NOT NULL,
  `COLUMN_NAME` varchar(255) NOT NULL DEFAULT '',
  `COLUMN_TYPE_ID` bigint(20) NOT NULL DEFAULT '0',
  `COLUMN_SIZE` bigint(20) NOT NULL DEFAULT '0',
  `COLUMN_DEFAULT_VALUE` varchar(255) NOT NULL DEFAULT '',
  `FOREIGN_KEY_SCHEMA_ID` bigint(20) NOT NULL DEFAULT '0',
  `FOREIGN_KEY_TABLE_ID` bigint(20) NOT NULL DEFAULT '0',
  `FOREIGN_KEY_COLUMN_ID` bigint(20) NOT NULL DEFAULT '0',
  `COLUMN_INDEX_TYPE_ID` bigint(20) NOT NULL DEFAULT '0',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `TABLE_ID` (`TABLE_ID`),
  KEY `MODIFY_UID` (`MODIFY_UID`),
  KEY `CREATE_UID` (`CREATE_UID`),
  KEY `table_details_ibfk_1` (`COLUMN_TYPE_ID`),
  KEY `table_details_ibfk_3` (`FOREIGN_KEY_SCHEMA_ID`),
  KEY `table_details_ibfk_4` (`FOREIGN_KEY_TABLE_ID`),
  KEY `table_details_ibfk_5` (`FOREIGN_KEY_COLUMN_ID`),
  KEY `table_details_ibfk_6` (`COLUMN_INDEX_TYPE_ID`),
  CONSTRAINT `table_details_ibfk_1` FOREIGN KEY (`COLUMN_TYPE_ID`) REFERENCES `list_mysql_column_types` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `table_details_ibfk_2` FOREIGN KEY (`TABLE_ID`) REFERENCES `tables` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `table_details_ibfk_6` FOREIGN KEY (`COLUMN_INDEX_TYPE_ID`) REFERENCES `list_index_types` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `table_details_ibfk_7` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `table_details_ibfk_8` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_details`
--

LOCK TABLES `table_details` WRITE;
/*!40000 ALTER TABLE `table_details` DISABLE KEYS */;
INSERT INTO `table_details` VALUES (46,195,'ID',5,20,'',0,0,0,1,'',1,1,'2016-09-19 14:13:27','2016-09-19 14:13:27'),(48,195,'APP_ID',5,20,'1',3,2,0,5,'aaa',1,1,'2016-09-19 14:32:08','2016-09-19 14:32:08'),(49,195,'NUME',7,255,'test',0,0,0,5,'aaa',1,1,'2016-09-19 14:34:32','2016-09-19 14:34:32');
/*!40000 ALTER TABLE `table_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` bigint(20) NOT NULL,
  `SCHEMA_ID` bigint(20) NOT NULL DEFAULT '0',
  `TABLE_NAME` varchar(255) NOT NULL DEFAULT '',
  `TABLE_TYPE` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `tables_table_name_module_id_idx` (`TABLE_NAME`,`MODULE_ID`),
  KEY `MODULE_ID` (`MODULE_ID`),
  KEY `tables_ibfk_2` (`SCHEMA_ID`),
  KEY `tables_ibfk_3` (`TABLE_TYPE`),
  KEY `tables_ibfk_4` (`MODIFY_UID`),
  KEY `tables_ibfk_5` (`CREATE_UID`),
  CONSTRAINT `tables_ibfk_1` FOREIGN KEY (`MODULE_ID`) REFERENCES `modules` (`ID`),
  CONSTRAINT `tables_ibfk_2` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `list_databases` (`ID`),
  CONSTRAINT `tables_ibfk_3` FOREIGN KEY (`TABLE_TYPE`) REFERENCES `list_table_types` (`ID`),
  CONSTRAINT `tables_ibfk_4` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `tables_ibfk_5` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,1,3,'users',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(2,1,3,'applications',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(3,1,3,'modules',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(4,1,3,'tables',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(5,1,3,'forms',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(13,1,3,'list_databases',1,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(18,1,3,'list_empty',1,'Empty list',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(20,1,3,'list_user_types',1,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(35,1,3,'list_no_yes',1,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(37,1,3,'list_mysql_column_types',1,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(42,1,3,'list_index_types',1,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(78,1,3,'list_table_types',1,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(80,10,7,'categories',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(82,1,3,'list_script_types',1,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(83,1,3,'scripts',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(87,7,3,'users',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(88,7,3,'roles',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(89,7,3,'permissions',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(90,7,3,'user_roles',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(91,7,3,'role_permissions',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(93,7,3,'list_permission_types',1,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(96,1,3,'list_object_types',1,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(97,1,3,'views',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(98,7,3,'list_permission_names',1,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(99,7,3,'user_profiles',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(100,10,7,'products',2,'',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(101,1,7,'categories',2,'',1,1,'2015-08-19 07:05:34','0000-00-00 00:00:00'),(102,1,7,'products',NULL,'',1,1,'2015-08-19 07:14:13','2015-08-19 07:14:13'),(103,7,3,'scripts',NULL,'',1,1,'2015-08-19 11:48:19','2015-08-19 11:48:19'),(106,1,3,'test',2,'aaa',1,1,'2016-08-22 06:13:00','2016-07-20 05:59:53'),(111,1,2,'test_aa',1,'22',1,1,'2016-08-18 13:31:47','2016-08-17 08:22:25'),(129,1,3,'module_vars',2,'',1,1,'2016-08-29 06:13:16','2016-08-29 06:13:16'),(130,13,2,'sss',2,'',1,1,'2016-08-30 08:53:55','2016-08-30 08:53:55'),(131,1,3,'table_details',2,'',1,1,'2016-08-31 07:10:21','2016-08-31 07:10:21'),(195,1,3,'AA',2,'',1,1,'2016-09-19 14:13:27','2016-09-19 14:13:27');
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test`
--

DROP TABLE IF EXISTS `test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test`
--

LOCK TABLES `test` WRITE;
/*!40000 ALTER TABLE `test` DISABLE KEYS */;
/*!40000 ALTER TABLE `test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsssst`
--

DROP TABLE IF EXISTS `tsssst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsssst` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `MODIFY_UID` (`MODIFY_UID`),
  KEY `CREATE_UID` (`CREATE_UID`),
  CONSTRAINT `tsssst_ibfk_1` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `tsssst_ibfk_2` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsssst`
--

LOCK TABLES `tsssst` WRITE;
/*!40000 ALTER TABLE `tsssst` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsssst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tsst`
--

DROP TABLE IF EXISTS `tsst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tsst` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `nume` varchar(22) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nume` (`nume`),
  KEY `MODIFY_UID` (`MODIFY_UID`),
  KEY `CREATE_UID` (`CREATE_UID`),
  CONSTRAINT `tsst_ibfk_1` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `tsst_ibfk_2` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tsst`
--

LOCK TABLES `tsst` WRITE;
/*!40000 ALTER TABLE `tsst` DISABLE KEYS */;
/*!40000 ALTER TABLE `tsst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profiles` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SCRIPT_ID` bigint(20) NOT NULL DEFAULT '0',
  `PROFILE_NAME` varchar(255) NOT NULL DEFAULT '',
  `THEME` bigint(10) NOT NULL DEFAULT '0',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `user_profiles_ibfk_1` (`SCRIPT_ID`),
  KEY `user_profiles_ibfk_2` (`MODIFY_UID`),
  KEY `user_profiles_ibfk_3` (`CREATE_UID`),
  CONSTRAINT `user_profiles_ibfk_1` FOREIGN KEY (`SCRIPT_ID`) REFERENCES `scripts` (`ID`),
  CONSTRAINT `user_profiles_ibfk_2` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `user_profiles_ibfk_3` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
INSERT INTO `user_profiles` VALUES (2,12,'user_home',0,1,1,'2015-08-19 12:33:18','2015-08-19 11:53:47'),(3,6,'prof_sql',0,1,1,'2015-08-19 12:15:39','2015-08-19 12:15:39');
/*!40000 ALTER TABLE `user_profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` bigint(20) NOT NULL DEFAULT '0',
  `ROLE_ID` bigint(20) NOT NULL DEFAULT '0',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `user_roles_user_role_idx` (`UID`,`ROLE_ID`),
  KEY `UID` (`UID`),
  KEY `ROLE_ID` (`ROLE_ID`),
  KEY `user_roles_ibfk_3` (`MODIFY_UID`),
  KEY `user_roles_ibfk_4` (`CREATE_UID`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `roles` (`ID`),
  CONSTRAINT `user_roles_ibfk_3` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `user_roles_ibfk_4` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (4,4,2,1,1,'2015-08-19 09:37:24','2015-08-19 09:37:24'),(5,2,2,1,1,'2015-08-19 09:37:24','2015-08-19 09:37:24'),(8,1,2,1,1,'2015-08-20 09:03:18','2015-08-20 09:03:18'),(9,2,3,1,1,'2015-08-20 09:07:35','2015-08-20 09:07:35'),(10,1,3,1,1,'2015-09-09 14:46:42','2015-09-09 14:46:42');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(255) NOT NULL DEFAULT '',
  `PASSWORD` varchar(255) NOT NULL DEFAULT '',
  `FIRSTNAME` varchar(255) NOT NULL DEFAULT '',
  `LASTNAME` varchar(255) NOT NULL DEFAULT '',
  `EMAIL` varchar(255) NOT NULL DEFAULT '',
  `USER_TYPE` bigint(20) NOT NULL DEFAULT '1',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `PROFILE_ID` bigint(20) NOT NULL DEFAULT '0',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `users_username_unique_idx` (`USERNAME`),
  KEY `USER_TYPE` (`USER_TYPE`),
  KEY `users_username_idx` (`USERNAME`),
  KEY `users_password_idx` (`PASSWORD`),
  KEY `users_ibfk_2` (`MODIFY_UID`),
  KEY `users_ibfk_3` (`CREATE_UID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`USER_TYPE`) REFERENCES `list_user_types` (`ID`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'victor','alcatraz','Gigi','Fanica','',1,'bb',2,1,1,'2016-04-05 12:00:49','0000-00-00 00:00:00'),(2,'cornelia','a','ss','','',1,'aa',2,1,1,'2016-04-05 12:00:13','0000-00-00 00:00:00'),(4,'ana','a','aa','aa','aa',1,'aa',2,1,1,'2016-04-05 12:00:13','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_forms`
--

DROP TABLE IF EXISTS `view_forms`;
/*!50001 DROP VIEW IF EXISTS `view_forms`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_forms` AS SELECT 
 1 AS `ID`,
 1 AS `FORM_NAME`,
 1 AS `MODULE_ID`,
 1 AS `MODULE_NAME`,
 1 AS `APP_ID`,
 1 AS `APP_NAME`,
 1 AS `TABLE_ID`,
 1 AS `TABLE_NAME`,
 1 AS `TABLE_SCHEMA`,
 1 AS `FORM_QUERY`,
 1 AS `FORM_PHP_DIR`,
 1 AS `FORM_TPL_DIR`,
 1 AS `DESCRIPTION`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_modules`
--

DROP TABLE IF EXISTS `view_modules`;
/*!50001 DROP VIEW IF EXISTS `view_modules`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_modules` AS SELECT 
 1 AS `ID`,
 1 AS `APP_ID`,
 1 AS `APP_NAME`,
 1 AS `APP_SCHEMA`,
 1 AS `MODULE_NAME`,
 1 AS `MODULE_TITLE`,
 1 AS `MODULE_DATE`,
 1 AS `MODULE_SCHEMA`,
 1 AS `SCHEMA_NAME`,
 1 AS `DESCRIPTION`,
 1 AS `SCRIPT_ID`,
 1 AS `SCRIPT_NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_permissions`
--

DROP TABLE IF EXISTS `view_permissions`;
/*!50001 DROP VIEW IF EXISTS `view_permissions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_permissions` AS SELECT 
 1 AS `ID`,
 1 AS `PERMISSION_NAME`,
 1 AS `PERMISSION_NAME_ID`,
 1 AS `DESCRIPTION`,
 1 AS `PERMISSION_TYPE`,
 1 AS `PERMISSION_TYPE_ID`,
 1 AS `OBJECT_TYPE`,
 1 AS `OBJECT_TYPE_ID`,
 1 AS `OBJECT_NAME`,
 1 AS `OBJECT_ID`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_role_permissions`
--

DROP TABLE IF EXISTS `view_role_permissions`;
/*!50001 DROP VIEW IF EXISTS `view_role_permissions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_role_permissions` AS SELECT 
 1 AS `ID`,
 1 AS `ROLE_ID`,
 1 AS `ROLE_NAME`,
 1 AS `PERMISSION_ID`,
 1 AS `PERMISSION_NAME`,
 1 AS `PERMISSION_NAME_ID`,
 1 AS `PERMISSION_DESC`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_scripts`
--

DROP TABLE IF EXISTS `view_scripts`;
/*!50001 DROP VIEW IF EXISTS `view_scripts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_scripts` AS SELECT 
 1 AS `ID`,
 1 AS `SCRIPT_NAME`,
 1 AS `APP_ID`,
 1 AS `APP_NAME`,
 1 AS `MODULE_ID`,
 1 AS `MODULE_NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_table_details`
--

DROP TABLE IF EXISTS `view_table_details`;
/*!50001 DROP VIEW IF EXISTS `view_table_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_table_details` AS SELECT 
 1 AS `ID`,
 1 AS `TABLE_ID`,
 1 AS `TABLE_NAME`,
 1 AS `COLUMN_NAME`,
 1 AS `COLUMN_TYPE_ID`,
 1 AS `COLUMN_TYPE_LABEl`,
 1 AS `COLUMN_SIZE`,
 1 AS `COLUMN_DEFAULT_VALUE`,
 1 AS `FOREIGN_KEY_SCHEMA_ID`,
 1 AS `FOREIGN_KEY_SCHEMA_LABEl`,
 1 AS `FOREIGN_KEY_TABLE_ID`,
 1 AS `FOREIGN_KEY_TABLE_LABEl`,
 1 AS `FOREIGN_KEY_COLUMN_ID`,
 1 AS `FOREIGN_KEY_COLUMN_LABEL`,
 1 AS `COLUMN_INDEX_TYPE_ID`,
 1 AS `COLUMN_INDEX_TYPE_LABEL`,
 1 AS `DESCRIPTION`,
 1 AS `MODIFY_UID`,
 1 AS `MODIFIED_BY`,
 1 AS `CREATE_UID`,
 1 AS `CREATED_BY`,
 1 AS `MODIFY_DATE`,
 1 AS `CREATE_DATE`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_tables`
--

DROP TABLE IF EXISTS `view_tables`;
/*!50001 DROP VIEW IF EXISTS `view_tables`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_tables` AS SELECT 
 1 AS `ID`,
 1 AS `TABLE_SCHEMA_ID`,
 1 AS `TABLE_SCHEMA`,
 1 AS `TABLE_NAME`,
 1 AS `APP_SCHEMA`,
 1 AS `APP_ID`,
 1 AS `APP_NAME`,
 1 AS `MODULE_ID`,
 1 AS `MODULE_NAME`,
 1 AS `DESCRIPTION`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_roles`
--

DROP TABLE IF EXISTS `view_user_roles`;
/*!50001 DROP VIEW IF EXISTS `view_user_roles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_user_roles` AS SELECT 
 1 AS `ID`,
 1 AS `UID`,
 1 AS `USERNAME`,
 1 AS `ROLE_ID`,
 1 AS `ROLE_NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_users`
--

DROP TABLE IF EXISTS `view_users`;
/*!50001 DROP VIEW IF EXISTS `view_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_users` AS SELECT 
 1 AS `ID`,
 1 AS `USERNAME`,
 1 AS `PASSWORD`,
 1 AS `FIRSTNAME`,
 1 AS `LASTNAME`,
 1 AS `EMAIL`,
 1 AS `USER_TYPE`,
 1 AS `DESCRIPTION`,
 1 AS `PROFILE_ID`,
 1 AS `PROFILE_NAME`,
 1 AS `SCRIPT_ID`,
 1 AS `SCRIPT_NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` bigint(20) NOT NULL DEFAULT '0',
  `VIEW_NAME` varchar(255) NOT NULL DEFAULT '',
  `CREATE_VIEW_QUERY` tinytext NOT NULL,
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `views_view_name_module_id_idx` (`VIEW_NAME`,`MODULE_ID`),
  KEY `MODULE_ID` (`MODULE_ID`),
  KEY `views_ibfk_2` (`MODIFY_UID`),
  KEY `views_ibfk_3` (`CREATE_UID`),
  CONSTRAINT `views_ibfk_1` FOREIGN KEY (`MODULE_ID`) REFERENCES `modules` (`ID`),
  CONSTRAINT `views_ibfk_2` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `views_ibfk_3` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (1,1,'view_forms','','',1,1,'2015-08-19 09:38:14','2015-08-19 09:38:14'),(2,1,'view_modules','','',1,1,'2015-08-19 09:38:14','2015-08-19 09:38:14'),(3,1,'view_tables','','',1,1,'2015-08-19 09:38:14','2015-08-19 09:38:14'),(4,7,'view_permissions','','',1,1,'2015-08-19 09:38:14','2015-08-19 09:38:14'),(5,7,'view_user_roles','','',1,1,'2015-08-19 09:38:14','2015-08-19 09:38:14');
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `view_forms`
--

/*!50001 DROP VIEW IF EXISTS `view_forms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_forms` AS select `f`.`ID` AS `ID`,`f`.`FORM_NAME` AS `FORM_NAME`,`f`.`MODULE_ID` AS `MODULE_ID`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`f`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`VALUE` AS `TABLE_SCHEMA`,`f`.`FORM_QUERY` AS `FORM_QUERY`,`f`.`FORM_PHP_DIR` AS `FORM_PHP_DIR`,`f`.`FORM_TPL_DIR` AS `FORM_TPL_DIR`,`f`.`DESCRIPTION` AS `DESCRIPTION` from ((((`forms` `f` join `modules` `m`) join `applications` `a`) join `tables` `t`) join `list_databases` `d`) where ((`f`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`f`.`TABLE_ID` = `t`.`ID`) and (`t`.`SCHEMA_ID` = `d`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_modules`
--

/*!50001 DROP VIEW IF EXISTS `view_modules`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_modules` AS select `m`.`ID` AS `ID`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`a`.`APP_SCHEMA` AS `APP_SCHEMA`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`m`.`MODULE_TITLE` AS `MODULE_TITLE`,`m`.`MODULE_DATE` AS `MODULE_DATE`,`a`.`APP_SCHEMA` AS `MODULE_SCHEMA`,`d`.`VALUE` AS `SCHEMA_NAME`,`m`.`DESCRIPTION` AS `DESCRIPTION`,`m`.`SCRIPT_ID` AS `SCRIPT_ID`,`s`.`SCRIPT_NAME` AS `SCRIPT_NAME` from (((`modules` `m` join `applications` `a`) join `scripts` `s`) join `list_databases` `d`) where ((`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`) and (`m`.`SCRIPT_ID` = `s`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_permissions`
--

/*!50001 DROP VIEW IF EXISTS `view_permissions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_permissions` AS select `p`.`ID` AS `ID`,`pn`.`VALUE` AS `PERMISSION_NAME`,`pn`.`ID` AS `PERMISSION_NAME_ID`,`p`.`DESCRIPTION` AS `DESCRIPTION`,`pt`.`VALUE` AS `PERMISSION_TYPE`,`pt`.`ID` AS `PERMISSION_TYPE_ID`,`ot`.`VALUE` AS `OBJECT_TYPE`,`ot`.`ID` AS `OBJECT_TYPE_ID`,(case `ot`.`VALUE` when _latin1'table' then (select `tables`.`TABLE_NAME` AS `TABLE_NAME` from `tables` where (`tables`.`ID` = `p`.`OBJECT_ID`)) when _latin1'view' then (select `views`.`VIEW_NAME` AS `VIEW_NAME` from `views` where (`views`.`ID` = `p`.`OBJECT_ID`)) when _latin1'form' then (select `forms`.`FORM_NAME` AS `FORM_NAME` from `forms` where (`forms`.`ID` = `p`.`OBJECT_ID`)) when _latin1'script' then (select `scripts`.`SCRIPT_NAME` AS `SCRIPT_NAME` from `scripts` where (`scripts`.`ID` = `p`.`OBJECT_ID`)) end) AS `OBJECT_NAME`,`p`.`OBJECT_ID` AS `OBJECT_ID` from (((`permissions` `p` join `list_permission_types` `pt`) join `list_object_types` `ot`) join `list_permission_names` `pn`) where ((`p`.`PERMISSION_TYPE` = `pt`.`ID`) and (`p`.`OBJECT_TYPE` = `ot`.`ID`) and (`p`.`PERMISSION_NAME` = `pn`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_role_permissions`
--

/*!50001 DROP VIEW IF EXISTS `view_role_permissions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_role_permissions` AS select `rp`.`ID` AS `ID`,`rp`.`ROLE_ID` AS `ROLE_ID`,`r`.`ROLE_NAME` AS `ROLE_NAME`,`rp`.`PERMISSION_ID` AS `PERMISSION_ID`,(select `list_permission_names`.`VALUE` AS `VALUE` from `list_permission_names` where (`list_permission_names`.`ID` = `p`.`PERMISSION_NAME`)) AS `PERMISSION_NAME`,`p`.`PERMISSION_NAME` AS `PERMISSION_NAME_ID`,`p`.`DESCRIPTION` AS `PERMISSION_DESC` from ((`role_permissions` `rp` join `roles` `r`) join `permissions` `p`) where ((`rp`.`ROLE_ID` = `r`.`ID`) and (`rp`.`PERMISSION_ID` = `p`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_scripts`
--

/*!50001 DROP VIEW IF EXISTS `view_scripts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_scripts` AS select `s`.`ID` AS `ID`,`s`.`SCRIPT_NAME` AS `SCRIPT_NAME`,`a`.`ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`m`.`ID` AS `MODULE_ID`,`m`.`MODULE_NAME` AS `MODULE_NAME` from ((`scripts` `s` join `modules` `m`) join `applications` `a`) where ((`s`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_table_details`
--

/*!50001 DROP VIEW IF EXISTS `view_table_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_table_details` AS select `d`.`ID` AS `ID`,`d`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`COLUMN_NAME` AS `COLUMN_NAME`,`d`.`COLUMN_TYPE_ID` AS `COLUMN_TYPE_ID`,(select `list_mysql_column_types`.`VALUE` from `list_mysql_column_types` where (`list_mysql_column_types`.`ID` = `d`.`COLUMN_TYPE_ID`)) AS `COLUMN_TYPE_LABEl`,`d`.`COLUMN_SIZE` AS `COLUMN_SIZE`,`d`.`COLUMN_DEFAULT_VALUE` AS `COLUMN_DEFAULT_VALUE`,`d`.`FOREIGN_KEY_SCHEMA_ID` AS `FOREIGN_KEY_SCHEMA_ID`,(select `list_databases`.`VALUE` from `list_databases` where (`list_databases`.`ID` = `d`.`FOREIGN_KEY_SCHEMA_ID`)) AS `FOREIGN_KEY_SCHEMA_LABEl`,`d`.`FOREIGN_KEY_TABLE_ID` AS `FOREIGN_KEY_TABLE_ID`,(select `tables`.`TABLE_NAME` from `tables` where (`tables`.`ID` = `d`.`FOREIGN_KEY_TABLE_ID`)) AS `FOREIGN_KEY_TABLE_LABEl`,`d`.`FOREIGN_KEY_COLUMN_ID` AS `FOREIGN_KEY_COLUMN_ID`,(select `table_details`.`COLUMN_NAME` from `table_details` where (`table_details`.`ID` = `d`.`FOREIGN_KEY_COLUMN_ID`)) AS `FOREIGN_KEY_COLUMN_LABEL`,`d`.`COLUMN_INDEX_TYPE_ID` AS `COLUMN_INDEX_TYPE_ID`,(select `list_index_types`.`VALUE` from `list_index_types` where (`list_index_types`.`ID` = `d`.`COLUMN_INDEX_TYPE_ID`)) AS `COLUMN_INDEX_TYPE_LABEL`,`d`.`DESCRIPTION` AS `DESCRIPTION`,`d`.`MODIFY_UID` AS `MODIFY_UID`,(select `users`.`USERNAME` from `users` where (`users`.`ID` = `d`.`MODIFY_UID`)) AS `MODIFIED_BY`,`d`.`CREATE_UID` AS `CREATE_UID`,(select `users`.`USERNAME` from `users` where (`users`.`ID` = `d`.`CREATE_UID`)) AS `CREATED_BY`,`d`.`MODIFY_DATE` AS `MODIFY_DATE`,`d`.`CREATE_DATE` AS `CREATE_DATE` from (`table_details` `d` left join `tables` `t` on((`d`.`TABLE_ID` = `t`.`ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_tables`
--

/*!50001 DROP VIEW IF EXISTS `view_tables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_tables` AS select `t`.`ID` AS `ID`,`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`VALUE` AS `APP_SCHEMA`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`t`.`MODULE_ID` AS `MODULE_ID`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`t`.`DESCRIPTION` AS `DESCRIPTION` from (((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_roles`
--

/*!50001 DROP VIEW IF EXISTS `view_user_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_roles` AS select `ur`.`ID` AS `ID`,`ur`.`UID` AS `UID`,`u`.`USERNAME` AS `USERNAME`,`ur`.`ROLE_ID` AS `ROLE_ID`,`r`.`ROLE_NAME` AS `ROLE_NAME` from ((`user_roles` `ur` join `users` `u`) join `roles` `r`) where ((`ur`.`UID` = `u`.`ID`) and (`ur`.`ROLE_ID` = `r`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_users`
--

/*!50001 DROP VIEW IF EXISTS `view_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_users` AS select `u`.`ID` AS `ID`,`u`.`USERNAME` AS `USERNAME`,`u`.`PASSWORD` AS `PASSWORD`,`u`.`FIRSTNAME` AS `FIRSTNAME`,`u`.`LASTNAME` AS `LASTNAME`,`u`.`EMAIL` AS `EMAIL`,`u`.`USER_TYPE` AS `USER_TYPE`,`u`.`DESCRIPTION` AS `DESCRIPTION`,`u`.`PROFILE_ID` AS `PROFILE_ID`,`up`.`PROFILE_NAME` AS `PROFILE_NAME`,`up`.`SCRIPT_ID` AS `SCRIPT_ID`,`s`.`SCRIPT_NAME` AS `SCRIPT_NAME` from ((`users` `u` join `user_profiles` `up`) join `scripts` `s`) where ((`u`.`PROFILE_ID` = `up`.`ID`) and (`up`.`SCRIPT_ID` = `s`.`ID`)) */;
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

-- Dump completed on 2016-09-20 16:41:30
