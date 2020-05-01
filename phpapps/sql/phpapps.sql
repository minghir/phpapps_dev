-- MariaDB dump 10.17  Distrib 10.4.12-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: phpapps
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
  `APPLICATION_TYPE_ID` bigint(20) DEFAULT NULL,
  `APP_DATE` date NOT NULL DEFAULT '0000-00-00',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `USER_ID` (`USER_ID`),
  KEY `applications_ibfk_2` (`MODIFY_UID`),
  KEY `applications_ibfk_3` (`CREATE_UID`),
  KEY `phpapps_applications_LAYOUT_ID_FK` (`APPLICATION_TYPE_ID`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `applications_ibfk_3` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,1,'phpapps','PHP Applications','3','.',1,'2016-03-13','Admin PHP Applications and more goodie lili si gp',1,1,'2020-04-22 15:07:10','0000-00-00 00:00:00'),(7,1,'eshop','E-Shop','7','..',2,'0000-00-00','',1,1,'2020-04-29 18:36:47','0000-00-00 00:00:00'),(8,1,'php_quiz','PHP Quiz','12','.',1,'2017-02-22','aa',1,1,'2019-11-19 10:26:19','2017-02-21 11:06:36'),(10,1,'atsepa','ATSEPA Romania','17','',1,'0000-00-00','',1,1,'2019-11-19 10:26:19','2017-07-09 08:31:09'),(88,1,'cstudor','Clubul Sportiv Tudor','15','',1,'2019-11-30','',1,1,'2019-11-30 10:39:40','2019-11-30 10:39:40');
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_elements`
--

DROP TABLE IF EXISTS `custom_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_elements` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `PHP_CLASS_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TEMPLATE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_elements`
--

LOCK TABLES `custom_elements` WRITE;
/*!40000 ALTER TABLE `custom_elements` DISABLE KEYS */;
INSERT INTO `custom_elements` VALUES (14,'CUSTOM_ELEMENT_1',1,'',NULL,33),(27,'CUSTOM_ELEMENT_2',1,'',NULL,33),(28,'TEMPLATE_SOURCE_EDITOR',1,'',NULL,33),(29,'PHP_SOURCE_EDITOR',1,'',NULL,2),(33,'CUSTOM_ELEMENT_3',1,'',NULL,33),(37,'CUSTOM_ELEMENT_4',1,'',NULL,1),(38,'CUSTOM_ELEMENT_5',1,'',NULL,1);
/*!40000 ALTER TABLE `custom_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_connections`
--

DROP TABLE IF EXISTS `db_connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `db_connections` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DB_TYPE` bigint(20) DEFAULT NULL,
  `DB_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DB_HOST` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DB_PORT` bigint(20) DEFAULT NULL,
  `DB_USER_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DB_PASSWORD` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `phpapps_db_connections_DB_TYPE_FK` (`DB_TYPE`),
  CONSTRAINT `phpapps_db_connections_DB_TYPE_FK` FOREIGN KEY (`DB_TYPE`) REFERENCES `list_dbms_types` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_connections`
--

LOCK TABLES `db_connections` WRITE;
/*!40000 ALTER TABLE `db_connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `db_connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `display_object_elements`
--

DROP TABLE IF EXISTS `display_object_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `display_object_elements` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DISPLAY_OBJECT_ID` bigint(255) DEFAULT NULL,
  `DISPLAY_OBJECT_TYPE_ID` bigint(20) DEFAULT NULL,
  `ELEMENT_ID` bigint(20) DEFAULT NULL,
  `ELEMENT_TYPE_ID` bigint(20) DEFAULT NULL,
  `TEMPLATE_VARIABLE_NAME` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'NULL',
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display_object_elements`
--

LOCK TABLES `display_object_elements` WRITE;
/*!40000 ALTER TABLE `display_object_elements` DISABLE KEYS */;
INSERT INTO `display_object_elements` VALUES (1,24,1,5,1,'PHPAPPS_MAIN_NAVBAR',''),(2,24,1,1,3,'PAGE_TITLE',''),(5,1,1,5,1,'PHPAPPS_MAIN_NAVBAR',''),(6,25,1,7,1,'meniu_laura',''),(9,174,2,2,4,'templates_grid',''),(10,174,2,3,4,'custom_elements_grid',''),(11,174,2,4,4,'grids_grid',''),(12,253,2,14,5,'CUSTOM_EL_1',''),(15,253,2,27,5,'TEST_CE_2',''),(17,253,2,33,5,'TPL_ED',''),(18,261,2,28,5,'LAYOUT_TEMPLATE_EDITOR',''),(19,268,2,3,4,'GRID1',''),(20,269,2,3,1,'MENU_4',''),(21,272,2,3,1,'MENU_2',''),(22,273,2,3,1,'MENU2',''),(23,274,2,3,1,'MENU_2',''),(24,274,2,1,4,'GRID_1',''),(25,281,2,3,1,'MENU_2',''),(26,282,2,28,5,'CUSTOM_TPL_ED',''),(28,256,2,8,4,'PHPAPPS_DESIGNER_GRID_ACTIONS',''),(29,33,4,3,1,'TEST_CM',''),(30,33,4,1,4,'SSSSSSSS',''),(31,33,4,27,5,'DDD',''),(32,37,4,33,5,'CE_3',''),(33,37,4,38,5,'CE_2',''),(34,27,4,37,5,'TPL_ED',''),(37,1,1,38,5,'PHPAPPS_LAYOUTS_BOOTSTRAP_LINKS',''),(38,174,2,13,4,'custom_forms_grid',''),(39,165,2,14,4,'DATABASE_CONNECTIONS_GRID',''),(40,165,2,9,4,'PHPAPPS_DATABASE_DATABASES_GRID',''),(41,299,2,15,4,'ESHOP_CATEGORIES',''),(42,299,2,16,4,'ESHOP_PRODUCTS',''),(43,301,2,17,4,'ESHOP_PRODUCT_IMGS','');
/*!40000 ALTER TABLE `display_object_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `errr`
--

DROP TABLE IF EXISTS `errr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `errr` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `test2` varchar(23) COLLATE utf8_bin NOT NULL DEFAULT 'aa',
  `test` varchar(23) COLLATE utf8_bin NOT NULL DEFAULT 'aa',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `errr`
--

LOCK TABLES `errr` WRITE;
/*!40000 ALTER TABLE `errr` DISABLE KEYS */;
/*!40000 ALTER TABLE `errr` ENABLE KEYS */;
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
  `HIDDEN` int(1) NOT NULL DEFAULT 0,
  `LABEL` varchar(255) NOT NULL DEFAULT '',
  `MANDATORY` int(1) NOT NULL DEFAULT 0,
  `INPUT_TYPE` varchar(255) NOT NULL DEFAULT '',
  `REFERENCE_LIST` varchar(255) NOT NULL DEFAULT '',
  `REFERENCE_TABLE` varchar(255) NOT NULL DEFAULT '',
  `REFERENCE_FIELD` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `FORM_ID` (`FORM_ID`),
  CONSTRAINT `form_details_ibfk_1` FOREIGN KEY (`FORM_ID`) REFERENCES `scripts` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1097 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_details`
--

LOCK TABLES `form_details` WRITE;
/*!40000 ALTER TABLE `form_details` DISABLE KEYS */;
INSERT INTO `form_details` VALUES (129,60,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(130,60,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'hidden','','',''),(131,60,'SCRIPT_TYPE','bigint(20)',1,'SCRIPT_TYPE',0,'hidden','','',''),(132,60,'SCRIPT_NAME','varchar(255)',0,'SCRIPT_NAME',1,'text','','',''),(133,60,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(159,65,'ID','bigint(20)',1,'ID',0,'text','','',''),(160,65,'APP_ID','bigint(20)',0,'APP_ID',1,'select_table','','phpapps.applications','APP_NAME'),(161,65,'SCRIPT_ID','bigint(20)',0,'START SCRIPT',1,'select_table','','phpapps.scripts','SCRIPT_NAME'),(162,65,'MODULE_NAME','varchar(20)',0,'MODULE NAME',1,'text','','',''),(163,65,'MODULE_TITLE','varchar(255)',0,'MODULE TITLE',0,'text','','',''),(164,65,'MODULE_DATE','date',0,'MODULE_DATE',0,'hidden','','',''),(165,65,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(166,66,'ID','bigint(20)',1,'ID',0,'text','','',''),(167,66,'ROLE_NAME','varchar(255)',0,'ROLE_NAME',1,'text','','',''),(168,66,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(175,69,'ID','bigint(20)',1,'ID',0,'text','','',''),(176,69,'UID','bigint(20)',0,'UID',1,'hidden','','',''),(177,69,'ROLE_ID','bigint(20)',0,'ROLE_ID',1,'select_table','','roles','ROLE_NAME'),(188,72,'ID','bigint(20)',1,'ID',0,'text','','',''),(189,72,'PERMISSION_NAME','varchar(255)',0,'PERMISSION_NAME',1,'select_list','list_permission_names','',''),(190,72,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(191,72,'PERMISSION_TYPE','bigint(20)',0,'PERMISSION_TYPE',1,'select_list','list_permission_types','',''),(192,72,'OBJECT_TYPE','bigint(20)',0,'OBJECT_TYPE',1,'select_list','list_object_types','',''),(193,72,'OBJECT_ID','bigint(20)',0,'OBJECT_ID',1,'hidden','','',''),(209,76,'ID','bigint(20)',1,'ID',0,'text','','',''),(210,76,'ROLE_ID','bigint(20)',0,'ROLE_ID',1,'select_table','','roles','ROLE_NAME'),(211,76,'PERMISSION_ID','bigint(20)',0,'PERMISSION_ID',1,'select_table','','view_permissions','DESCRIPTION'),(366,95,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(367,95,'MODULE_ID','bigint(20)',0,'MODULE',0,'select_table','','modules','MODULE_NAME'),(368,95,'FORM_NAME','varchar(255)',0,'FORM_NAME',0,'text','','',''),(369,95,'TABLE_ID','bigint(20)',0,'TABLE',0,'select_table','','tables','TABLE_NAME'),(370,95,'FORM_QUERY','varchar(255)',0,'FORM_QUERY',0,'text','','',''),(371,95,'FORM_PHP_DIR','varchar(20)',0,'FORM_PHP_DIR',0,'text','','',''),(372,95,'FORM_TPL_DIR','varchar(20)',0,'FORM_TPL_DIR',0,'text','','',''),(373,95,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'text','','',''),(374,95,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(375,95,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(376,95,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(377,95,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(410,101,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(411,101,'COLUMN_TYPE_ID','bigint(20)',0,'COLUMN_TYPE_ID',0,'select_list','list_mysql_column_types','',''),(412,101,'DEF_TPL','varchar(255)',0,'DEF_TPL',0,'textarea','','',''),(413,101,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(419,103,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(420,103,'DBMS_TYPE_ID','bigint(20)',0,'DBMS_TYPE_ID',1,'select_list','list_dbms_types','',''),(421,103,'SINTAX_TYPE_ID','bigint(20)',0,'SINTAX_TYPE_ID',1,'select_list','list_sql_sintax_types','',''),(422,103,'DEF_TPL','text',0,'DEF_TPL',0,'textarea','','',''),(423,103,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(435,105,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(436,105,'ORIGIN_ID','bigint(20)',0,'ORIGIN_ID',0,'hidden','','',''),(437,105,'MODULE_ID','bigint(20)',0,'MODULE_ID',0,'hidden','','',''),(438,105,'SCHEMA_ID','bigint(20)',0,'SCHEMA_ID',0,'hidden','','',''),(439,105,'TABLE_NAME','varchar(255)',0,'LIST_NAME',1,'text','','',''),(440,105,'TABLE_TYPE','bigint(20)',0,'TABLE_TYPE',0,'hidden','','',''),(441,105,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(442,105,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(443,105,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(444,105,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(445,105,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(457,107,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(458,107,'ORIGIN_ID','bigint(20)',0,'ORIGIN_ID',0,'hidden','','',''),(459,107,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'hidden','','',''),(460,107,'SCHEMA_ID','bigint(20)',0,'SCHEMA_ID',1,'hidden','','',''),(461,107,'TABLE_NAME','varchar(255)',0,'TABLE_NAME',1,'text','','',''),(462,107,'TABLE_TYPE','bigint(20)',0,'TABLE_TYPE',1,'select_list','phpapps.list_table_types','',''),(463,107,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(464,107,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(465,107,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(466,107,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(467,107,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(546,114,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(547,114,'TABLE_ID','bigint(20)',0,'TABLE_ID',1,'select_table','','tables','TABLE_NAME'),(548,114,'COLUMN_NAME','varchar(255)',0,'COLUMN_NAME',1,'text','','',''),(549,114,'COLUMN_TYPE_ID','bigint(20)',0,'COLUMN_TYPE_ID',1,'select_list','list_mysql_column_types','',''),(550,114,'UNSIGN','tinyint(3) unsigned',0,'UNSIGN',1,'select_list','list_no_yes','',''),(551,114,'COLUMN_SIZE','bigint(20)',0,'COLUMN_SIZE',0,'text','','',''),(552,114,'ACCEPT_NULL','tinyint(3) unsigned',0,'ACCEPT_NULL',1,'select_list','list_no_yes','',''),(553,114,'COLUMN_DEFAULT_VALUE','varchar(255)',0,'COLUMN_DEFAULT_VALUE',0,'text','','',''),(554,114,'AUTOINCREMENT','tinyint(3) unsigned',0,'AUTOINCREMENT',1,'select_list','list_no_yes','',''),(555,114,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(556,114,'ORD','smallint(5) unsigned',0,'ORD',0,'text','','',''),(557,114,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(558,114,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(559,114,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(560,114,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(561,115,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(562,115,'TABLE_ID','bigint(20)',0,'TABLE_ID',0,'hidden','','',''),(563,115,'COLUMN_NAME','varchar(255)',0,'COLUMN_NAME',1,'text','','',''),(564,115,'COLUMN_TYPE_ID','bigint(20)',0,'COLUMN_TYPE_ID',1,'select_list','phpapps.list_mysql_column_types','',''),(565,115,'UNSIGN','tinyint(3) unsigned',0,'UNSIGN',1,'select_list','phpapps.list_no_yes','',''),(566,115,'COLUMN_SIZE','bigint(20)',0,'COLUMN_SIZE',0,'text','','',''),(567,115,'ACCEPT_NULL','tinyint(3) unsigned',0,'ACCEPT_NULL',1,'select_list','phpapps.list_no_yes','',''),(568,115,'COLUMN_DEFAULT_VALUE','varchar(255)',0,'COLUMN_DEFAULT_VALUE',0,'text','','',''),(569,115,'AUTOINCREMENT','tinyint(3) unsigned',0,'AUTOINCREMENT',1,'select_list','phpapps.list_no_yes','',''),(570,115,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(571,115,'ORD','smallint(5) unsigned',1,'ORD',0,'text','','',''),(572,115,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(573,115,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(574,115,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(575,115,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(588,117,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(589,117,'COLUMN_ID','bigint(20)',0,'COLUMN_ID',1,'select_table','','phpapps.table_details','COLUMN_NAME'),(590,117,'FK_NAME','varchar(255)',0,'FK_NAME',1,'hidden','','',''),(591,117,'FK_TABLE_ID','bigint(20)',0,'FK_TABLE_ID',1,'select_table','','phpapps.tables','TABLE_NAME'),(592,117,'FK_COLUMN_ID','bigint(20)',0,'FK_COLUMN_ID',0,'hidden','','',''),(593,117,'ON_UPDATE','bigint(20)',0,'ON_UPDATE',0,'select_list','phpapps.list_foreign_key_options','',''),(594,117,'ON_DELETE','bigint(20)',0,'ON_DELETE',0,'select_list','phpapps.list_foreign_key_options','',''),(595,117,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(596,117,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(597,117,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(598,117,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(599,117,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(600,118,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(601,118,'TABLE_ID','bigint(20)',0,'TABLE_ID',1,'select_table','','tables','TABLE_NAME'),(602,118,'INDEX_NAME','varchar(255)',0,'INDEX_NAME',1,'text','','',''),(603,118,'INDEX_TYPE','bigint(20)',0,'INDEX_TYPE',1,'select_list','list_index_types','',''),(604,118,'INDEX_COLUMNS','varchar(255)',0,'INDEX_COLUMNS',1,'select_table','','table_details','COLUMN_NAME'),(605,118,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(606,118,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(607,118,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(608,118,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(609,118,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(610,119,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(611,119,'TABLE_ID','bigint(20)',0,'TABLE_ID',1,'hidden','','',''),(612,119,'INDEX_NAME','varchar(255)',0,'INDEX_NAME',1,'hidden','','',''),(613,119,'INDEX_TYPE_ID','bigint(20)',0,'INDEX_TYPE_ID',1,'select_list','phpapps.list_index_types','',''),(614,119,'INDEX_COLUMNS','varchar(255)',0,'INDEX_COLUMNS',1,'select_table_multiple','','phpapps.table_details','COLUMN_NAME'),(615,119,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(616,119,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(617,119,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(618,119,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(619,119,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(620,120,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(621,120,'ORIGIN_ID','bigint(20)',0,'ORIGIN_ID',0,'hidden','','',''),(622,120,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'hidden','','',''),(623,120,'SCHEMA_ID','bigint(20)',0,'SCHEMA_ID',1,'hidden','','',''),(624,120,'TABLE_NAME','varchar(255)',0,'TABLE_NAME',1,'select_table','','phpapps.tables','TABLE_NAME'),(625,120,'TABLE_TYPE','bigint(20)',0,'TABLE_TYPE',1,'hidden','','',''),(626,120,'DESCRIPTION','varchar(255)',1,'DESCRIPTION',0,'text','','',''),(627,120,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(628,120,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(629,120,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(630,120,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(663,125,'ID','bigint(20)',1,'ID',0,'text','','',''),(664,125,'NO','bigint(10)',0,'NO',1,'text','','',''),(665,125,'CATEG_ID','bigint(20)',0,'CATEG_ID',1,'select_table','','php_quiz.categories','NAME'),(666,125,'QUESTION','text',0,'QUESTION',1,'textarea','','',''),(667,125,'ANSWER_1','text',0,'ANSWER_1',0,'textarea','','',''),(668,125,'CORRECT_1','bigint(1)',0,'CORRECT_1',0,'select_list','php_quiz.list_da_nu','',''),(669,125,'IMAGE_1','varchar(255)',1,'IMAGE_1',0,'text','','',''),(670,125,'ANSWER_2','text',0,'ANSWER_2',0,'textarea','','',''),(671,125,'CORRECT_2','bigint(1)',0,'CORRECT_2',0,'select_list','php_quiz.list_da_nu','',''),(672,125,'IMAGE_2','varchar(255)',1,'IMAGE_2',0,'text','','',''),(673,125,'ANSWER_3','text',0,'ANSWER_3',0,'textarea','','',''),(674,125,'CORRECT_3','bigint(1)',0,'CORRECT_3',0,'select_list','php_quiz.list_da_nu','',''),(675,125,'IMAGE_3','varchar(255)',1,'IMAGE_3',0,'text','','',''),(676,125,'ANSWER_4','text',0,'ANSWER_4',0,'textarea','','',''),(677,125,'CORRECT_4','bigint(1)',0,'CORRECT_4',0,'select_list','php_quiz.list_da_nu','',''),(678,125,'IMAGE_4','varchar(255)',1,'IMAGE_4',0,'text','','',''),(706,132,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(707,132,'MODULE_ID','bigint(20)',0,'MODULE_ID',0,'hidden','','',''),(708,132,'QUERY_NAME','text',0,'QUERY_NAME',0,'text','','',''),(709,132,'QUERY_BODY','text',0,'QUERY_BODY',0,'textarea','','',''),(710,132,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(713,134,'ID','bigint(20)',1,'ID',0,'text','','',''),(714,134,'FILE_PATH','varchar(255)',0,'FILE_PATH',0,'file','','',''),(715,134,'NUME','varchar(255)',0,'NUME',0,'text','','',''),(716,135,'ID','bigint(20)',1,'ID',0,'text','','',''),(717,135,'USERNAME','varchar(255)',0,'USERNAME',0,'text','','',''),(718,135,'PASSWORD','varchar(255)',0,'PASSWORD',0,'text','','',''),(719,135,'EMAIL','varchar(255)',0,'EMAIL',0,'text','','',''),(720,135,'USER_TYPE','bigint(20)',0,'USER_TYPE',0,'select_list','atsepa.list_user_types','',''),(721,135,'JOIN_DATE','timestamp',0,'JOIN_DATE',0,'date','','',''),(742,139,'ID','bigint(20)',1,'ID',0,'text','','',''),(743,139,'USERNAME','varchar(255)',0,'USERNAME',0,'text','','',''),(744,139,'PASSWORD','varchar(255)',0,'PASSWORD',0,'text','','',''),(745,139,'EMAIL','varchar(255)',0,'EMAIL',0,'text','','',''),(746,139,'USER_TYPE','bigint(20)',0,'USER_TYPE',0,'select_list','atsepa.list_user_types','',''),(747,139,'JOIN_DATE','timestamp',1,'JOIN_DATE',0,'text','','',''),(748,140,'ID','bigint(20)',1,'ID',0,'text','','',''),(749,140,'NAME','varchar(255)',0,'Title',0,'text','','',''),(750,140,'ARTICLE_TAGS','text',0,'Tags',0,'textarea','','',''),(751,140,'BODY','text',0,'Content',0,'textarea','','',''),(752,140,'CATEG_ID','bigint(20)',0,'Category',1,'select_list','atsepa.list_article_categories','',''),(753,140,'IMAGE','varchar(255)',0,'Title Image',0,'file','','',''),(754,140,'USER_ID','bigint(20)',0,'USER_ID',1,'hidden','','',''),(755,140,'ARTICLE_DATE','timestamp',0,'ARTICLE_DATE',0,'hidden','','',''),(759,142,'ID','bigint(20)',1,'ID',0,'text','','',''),(760,142,'PID','bigint(20)',0,'PID',0,'select_table','','atsepa.forum_categories','NAME'),(761,142,'NAME','varchar(255)',0,'NAME',1,'text','','',''),(762,142,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(763,143,'ID','bigint(20)',1,'ID',0,'text','','',''),(764,143,'SUBJECT','varchar(255)',0,'SUBJECT',0,'text','','',''),(765,143,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(766,143,'TOPIC_DATE','timestamp',1,'TOPIC_DATE',0,'text','','',''),(767,143,'CAT_ID','bigint(20)',0,'CAT_ID',0,'select_table','','atsepa.forum_categories','NAME'),(768,143,'USER_ID','bigint(20)',0,'USER_ID',1,'hidden','','',''),(769,144,'ID','bigint(20)',1,'ID',0,'text','','',''),(770,144,'POST_DATE','timestamp',1,'POST_DATE',0,'text','','',''),(771,144,'TOPIC_ID','bigint(20)',0,'TOPIC_ID',0,'select_table','','atsepa.topics','SUBJECT'),(772,144,'USER_ID','bigint(20)',0,'USER_ID',1,'hidden','','',''),(773,144,'CONTENT','text',0,'CONTENT',0,'textarea','','',''),(774,139,'LAST_NAME','varchar(255)',0,'LAST_NAME',0,'text','','',''),(775,139,'FIRST_NAME','varchar(255)',0,'FIRST_NAME',0,'text','','',''),(776,140,'INTRO','varchar(255)',0,'Intro',0,'textarea','','',''),(777,145,'ID','bigint(20)',1,'ID',0,'text','','',''),(778,145,'SUBJECT','varchar(255)',0,'SUBJECT',0,'text','','',''),(779,145,'NAME','varchar(255)',0,'NAME',1,'text','','',''),(780,145,'EMAIL','varchar(255)',0,'EMAIL',0,'text','','',''),(781,145,'MESSAGE','text',0,'MESSAGE',0,'textarea','','',''),(782,145,'DATA','timestamp',1,'DATA',0,'text','','',''),(783,140,'VISIBLE','bigint(1)',0,'Public',0,'select_list','atsepa.da_nu','',''),(795,148,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(796,148,'upload_file','varchar(255)',0,'upload_file',1,'file','','',''),(814,151,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(815,151,'THEME_NAME','varchar(255)',0,'THEME_NAME',1,'text','','',''),(816,151,'CSS_FILE','varchar(255)',0,'CSS_FILE',0,'text','','',''),(834,153,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(835,153,'USER_ID','bigint(20)',0,'USER_ID',1,'select_table','','phpapps.users','USERNAME'),(836,153,'SCRIPT_ID','bigint(20)',0,'SCRIPT_ID',0,'select_table','','phpapps.scripts','SCRIPT_NAME'),(837,153,'PROFILE_NAME','varchar(255)',0,'PROFILE_NAME',1,'text','','',''),(838,153,'THEME_ID','bigint(10)',0,'THEME_ID',0,'select_table','','phpapps.themes','THEME_NAME'),(839,153,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(840,153,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(841,153,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(842,153,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(858,60,'TABLE_ID','bigint(20)',1,'TABLE_ID',0,'text','','',''),(859,60,'FORM_QUERY','varchar(255)',1,'FORM_QUERY',0,'text','','',''),(860,60,'FORM_PHP_DIR','varchar(255)',1,'FORM_PHP_DIR',0,'text','','',''),(861,60,'FORM_TPL_DIR','varchar(255)',1,'FORM_TPL_DIR',0,'text','','',''),(862,60,'WEB_TYPE_ID','bigint(2)',0,'WEB_TYPE_ID',0,'select_list','phpapps.list_web_script_type','',''),(863,60,'SCRIPT_TYPE_ID','bigint(2)',0,'SCRIPT_TYPE_ID',0,'select_list','phpapps.list_script_types','',''),(864,60,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(865,60,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(866,60,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(867,60,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(870,232,'ID','bigint(20)',0,'ID',0,'text','','',''),(871,233,'ID','bigint(20)',0,'ID',0,'text','','',''),(872,233,'nume','varchar(255)',0,'nume',1,'text','','',''),(878,60,'LAYOUT_ID','bigint(20)',0,'LAYOUT_ID',1,'select_table','','phpapps.layouts','NAME'),(885,151,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(886,151,'THEME_NAME','varchar(255)',0,'THEME_NAME',0,'text','','',''),(887,151,'CSS_FILE','varchar(255)',0,'CSS_FILE',0,'text','','',''),(890,240,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(891,240,'NAME','varchar(255)',0,'NAME',1,'text','','',''),(892,240,'MENU_TITLE','varchar(255)',0,'MENU_TITLE',0,'text','','',''),(893,240,'MENU_TYPE','bigint(20)',0,'MENU_TYPE',1,'select_list','phpapps.list_menu_types','',''),(894,240,'ORIENTATION','bigint(2)',0,'ORIENTATION',1,'select_list','phpapps.list_menu_orientation','',''),(895,240,'QUERY_ID','bigint(20)',0,'QUERY_ID',0,'select_table','','phpapps.queries','QUERY_NAME'),(896,240,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(897,241,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(898,241,'PID','bigint(20)',0,'PID',0,'select_table','','phpapps.menu_items','LABEL'),(899,241,'MENU_ID','bigint(20)',0,'MENU_ID',0,'hidden','','phpapps.menus','NAME'),(900,241,'ACTION','varchar(255)',0,'ACTION',0,'text','','',''),(901,241,'LABEL','varchar(255)',0,'LABEL',0,'text','','',''),(902,242,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(903,242,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'select_table','','phpapps.modules','MODULE_NAME'),(904,242,'VIEW_NAME','varchar(255)',0,'VIEW_NAME',1,'text','','',''),(905,242,'CREATE_VIEW_QUERY','text',0,'CREATE_VIEW_QUERY',1,'textarea','','',''),(906,242,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(907,242,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(908,242,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(909,242,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(910,242,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(911,243,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(912,243,'QUERY_ID','bigint(20)',0,'QUERY_ID',0,'hidden','','',''),(913,243,'PARAMETER_NAME','varchar(255)',0,'PARAMETER_NAME',1,'text','','',''),(914,243,'PARAMETER_VALUE','varchar(255)',0,'PARAMETER_VALUE',1,'text','','',''),(915,243,'PARAMETER_TYPE','bigint(20)',0,'PARAMETER_TYPE',1,'select_list','phpapps.list_query_parameter_type','',''),(916,244,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(917,244,'LAYOUT_ID','bigint(20)',0,'LAYOUT_ID',1,'select_table','','phpapps.layouts','NAME'),(918,244,'VARIABLE_NAME','varchar(255)',0,'VARIABLE_NAME',1,'text','','',''),(919,244,'VARIABLE_CONTENT','text',0,'VARIABLE_CONTENT',0,'textarea','','',''),(920,245,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(921,245,'LAYOUT_ID','bigint(255)',0,'LAYOUT_ID',0,'select_table','','phpapps.layouts','NAME'),(922,245,'ELEMENT_ID','bigint(20)',0,'ELEMENT_ID',0,'select_table','','VIEW_POSIBLE_LAYOUT_ELEMENTS','ELEMENT_NAME'),(923,245,'ELEMENT_TYPE','bigint(20)',0,'ELEMENT_TYPE',0,'select_list','phpapps.list_layout_elements_types','',''),(924,245,'LAYOUT_VARIABLE_NAME','varchar(255)',0,'LAYOUT_VARIABLE_NAME',0,'text','','',''),(925,245,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(927,256,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(928,256,'GRID_NAME','varchar(255)',0,'GRID_NAME',1,'text','','',''),(929,256,'GRID_TYPE','bigint(20)',0,'GRID_TYPE',0,'select_list','phpapps.list_grid_types','',''),(930,256,'TABLE_ID','bigint(20)',0,'TABLE_ID',0,'select_table','','phpapps.tables','TABLE_NAME'),(931,256,'QUERY_ID','bigint(20)',0,'QUERY_ID',0,'select_table','','phpapps.queries','QUERY_NAME'),(932,256,'EDITABLE','bigint(20)',0,'EDITABLE',0,'select_list','phpapps.list_true_false','',''),(933,256,'FILTERABLE','bigint(20)',0,'FILTERABLE',0,'select_list','phpapps.list_true_false','',''),(934,256,'PAGINABLE','bigint(20)',0,'PAGINABLE',0,'select_list','phpapps.list_true_false','',''),(935,256,'EXPORTABLE','bigint(20)',0,'EXPORTABLE',0,'select_list','phpapps.list_true_false','',''),(936,256,'EDIT_FORM_ID','bigint(20)',0,'EDIT_FORM_ID',0,'select_table','','phpapps.scripts','SCRIPT_NAME'),(937,256,'ROWS_ON_PAGE','bigint(20)',0,'ROWS_ON_PAGE',0,'text','','',''),(938,256,'ELEMENT_TEMPLATE_ID','bigint(20)',0,'ELEMENT_TEMPLATE_ID',0,'select_table','','phpapps.templates','TEMPLATE_NAME'),(939,257,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(940,257,'TEMPLATE_NAME','varchar(255)',0,'TEMPLATE_NAME',0,'text','','',''),(941,257,'APP_ID','bigint(20)',0,'APP_ID',1,'select_table','','phpapps.applications','APP_NAME'),(942,257,'ELEMENT_TYPE_ID','bigint(20)',0,'ELEMENT_TYPE_ID',1,'select_list','phpapps.list_layout_elements_types','',''),(943,256,'GRID_TITLE','varchar(255)',0,'GRID_TITLE',1,'text','','',''),(944,259,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(945,259,'GRID_ID','bigint(20)',0,'GRID_ID',0,'hidden','','',''),(946,259,'COLUMN_ID','bigint(20)',0,'COLUMN_ID',0,'select_table','','phpapps.table_details','COLUMN_NAME'),(947,259,'LABEL','varchar(255)',0,'LABEL',0,'text','','',''),(948,259,'ACTION','varchar(255)',0,'ACTION',0,'text','','',''),(949,260,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(950,260,'DISPLAY_OBJECT_ID','bigint(255)',0,'DISPLAY_OBJECT_ID',1,'hidden','','',''),(951,260,'DISPLAY_OBJECT_TYPE_ID','bigint(20)',0,'DISPLAY_OBJECT_TYPE_ID',1,'hidden','','',''),(952,260,'ELEMENT_ID','bigint(20)',0,'ELEMENT_ID',1,'select_table','','view_posible_display_object_elements','ELEMENT_NAME'),(953,260,'ELEMENT_TYPE_ID','bigint(20)',0,'ELEMENT_TYPE_ID',1,'select_list','phpapps.list_display_elements_types','',''),(954,260,'LAYOUT_VARIABLE_NAME','varchar(255)',1,'LAYOUT_VARIABLE_NAME',0,'text','','',''),(955,260,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(956,260,'TEMPLATE_VARIABLE_NAME','varchar(255)',0,'TEMPLATE_VARIABLE_NAME',1,'text','','',''),(957,261,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(958,261,'NAME','varchar(255)',0,'NAME',1,'text','','',''),(959,261,'APP_ID','bigint(20)',0,'APP_ID',1,'select_table','','phpapps.applications','APP_NAME'),(960,261,'DESCRIPTION','text',0,'DESCRIPTION',0,'text','','',''),(961,259,'ALT_COLUMN_TEXT','varchar(255)',0,'ALT_COLUMN_TEXT',0,'textarea','','',''),(967,263,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(968,263,'NAME','varchar(255)',0,'NAME',1,'text','','',''),(969,263,'APP_ID','bigint(20)',0,'APP_ID',1,'select_table','','phpapps.applications','APP_NAME'),(970,263,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(971,263,'PHP_CLASS_NAME','varchar(255)',1,'PHP_CLASS_NAME',0,'text','','',''),(972,263,'TEMPLATE_ID','bigint(20)',0,'TEMPLATE_ID',0,'select_table','','phpapps.templates','TEMPLATE_NAME'),(973,264,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(974,264,'USERNAME','varchar(255)',0,'USERNAME',1,'text','','',''),(975,264,'PASSWORD','varchar(255)',0,'PASSWORD',1,'text','','',''),(976,264,'FIRSTNAME','varchar(255)',0,'FIRSTNAME',0,'text','','',''),(977,264,'LASTNAME','varchar(255)',0,'LASTNAME',0,'text','','',''),(978,264,'EMAIL','varchar(255)',0,'EMAIL',0,'text','','',''),(979,264,'USER_TYPE','bigint(20)',0,'USER_TYPE',0,'select_list','phpapps.list_user_types','',''),(980,264,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(981,264,'PROFILE_ID','bigint(20)',0,'PROFILE_ID',0,'text','','',''),(982,264,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(983,264,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(984,264,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(985,264,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(996,274,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(997,274,'TEMPLATE_NAME','varchar(255)',0,'TEMPLATE_NAME',1,'text','','',''),(998,274,'APP_ID','bigint(20)',0,'APP_ID',1,'select_table','','phpapps.applications','APP_NAME'),(999,274,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(1000,274,'ELEMENT_TYPE_ID','bigint(20)',0,'ELEMENT_TYPE_ID',1,'select_list','phpapps.list_template_types','',''),(1001,60,'TEMPLATE_ID','bigint(20)',0,'TEMPLATE_ID',0,'select_table','','phpapps.templates','TEMPLATE_NAME'),(1008,278,'ID','bigint(20)',0,'ID',0,'text','','',''),(1009,278,'FORM_NAME','varchar(255)',0,'FORM_NAME',0,'text','','',''),(1020,285,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(1021,285,'GRID_ID','bigint(20)',0,'GRID_ID',1,'hidden','','',''),(1022,285,'NAME','varchar(255)',0,'NAME',0,'text','','',''),(1023,285,'LABEL','varchar(255)',0,'LABEL',1,'text','','',''),(1024,285,'ACTION','varchar(255)',0,'ACTION',0,'text','','',''),(1025,285,'ACTION_SCRIPT','varchar(255)',0,'ACTION_SCRIPT',0,'text','','',''),(1026,285,'POPUP_PAGE','bigint(2)',0,'POPUP_PAGE',0,'select_list','phpapps.list_true_false','',''),(1027,285,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(1028,285,'GRID_ACTION_ID','bigint(20)',1,'GRID_ACTION_ID',0,'select_list','phpapps.list_grid_action_types','',''),(1029,285,'GRID_ACTION_TYPE_ID','bigint(20)',0,'GRID_ACTION_TYPE_ID',0,'select_list','phpapps.list_grid_action_types','',''),(1030,256,'SORTABLE','bigint(20)',0,'SORTABLE',0,'select_list','phpapps.list_true_false','',''),(1031,288,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(1032,288,'USER_ID','bigint(20)',0,'USER_ID',0,'hidden','','',''),(1033,288,'APP_NAME','varchar(20)',0,'APP_NAME',1,'text','','',''),(1034,288,'APP_TITLE','varchar(255)',0,'APP_TITLE',1,'text','','',''),(1035,288,'APP_SCHEMA','varchar(20)',0,'APP_SCHEMA',1,'select_list','phpapps.list_databases','',''),(1036,288,'BASE_DIR','varchar(20)',1,'BASE_DIR',0,'text','','',''),(1037,288,'APPLICATION_TYPE_ID','bigint(20)',0,'APPLICATION_TYPE_ID',1,'select_list','phpapps.list_application_types','',''),(1038,288,'APP_DATE','date',1,'APP_DATE',0,'date','','',''),(1039,288,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(1040,288,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(1041,288,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(1042,288,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(1043,288,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(1044,289,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(1045,289,'VALUE','varchar(20)',0,'VALUE',1,'text','','',''),(1046,289,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(1047,294,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(1048,294,'VALUE','varchar(20)',0,'VALUE',1,'text','','',''),(1049,294,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'text','','',''),(1077,298,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(1078,298,'PID','bigint(20)',0,'PID',0,'select_table','','eshop.categories','NAME'),(1079,298,'NAME','varchar(20)',0,'NAME',0,'text','','',''),(1080,298,'TITLE','varchar(255)',0,'TITLE',0,'text','','',''),(1081,298,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(1083,240,'TEMPLATE_ID','bigint(20)',0,'TEMPLATE_ID',1,'select_table','','phpapps.templates','TEMPLATE_NAME'),(1084,301,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(1085,301,'CATEGORY_ID','bigint(20)',0,'CATEGORY',0,'select_table','','eshop.categories','NAME'),(1086,301,'PRODUCT_TITLE','varchar(255)',0,'TITLE',0,'text','','',''),(1087,301,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(1088,301,'PRICE','decimal(20,0)',0,'PRICE',0,'text','','',''),(1089,301,'CURRENCY_ID','bigint(20)',0,'CURRENCY',0,'select_list','eshop.list_currency','',''),(1090,301,'STOCK','decimal(20,0)',0,'STOCK',0,'text','','',''),(1094,303,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(1095,303,'PRODUCT_ID','bigint(20)',0,'PRODUCT_ID',0,'hidden','','',''),(1096,303,'IMG_FILE_NAME','varchar(255)',0,'IMG_FILE_NAME',1,'file','','','');
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
  `FORM_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
/*!40000 ALTER TABLE `forms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grid_actions`
--

DROP TABLE IF EXISTS `grid_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grid_actions` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `GRID_ID` bigint(20) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LABEL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_SCRIPT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `POPUP_PAGE` bigint(2) DEFAULT NULL,
  `GRID_ACTION_TYPE_ID` bigint(20) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `phpapps_grid_actions_GRID_ID_FK` (`GRID_ID`),
  KEY `phpapps_grid_actions_POPUP_PAGE_FK` (`POPUP_PAGE`),
  KEY `phpapps_grid_actions_GRID_ACTION_TYPE_ID_FK` (`GRID_ACTION_TYPE_ID`),
  CONSTRAINT `phpapps_grid_actions_GRID_ACTION_TYPE_ID_FK` FOREIGN KEY (`GRID_ACTION_TYPE_ID`) REFERENCES `list_grid_action_types` (`ID`),
  CONSTRAINT `phpapps_grid_actions_GRID_ID_FK` FOREIGN KEY (`GRID_ID`) REFERENCES `grids` (`ID`),
  CONSTRAINT `phpapps_grid_actions_POPUP_PAGE_FK` FOREIGN KEY (`POPUP_PAGE`) REFERENCES `list_true_false` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grid_actions`
--

LOCK TABLES `grid_actions` WRITE;
/*!40000 ALTER TABLE `grid_actions` DISABLE KEYS */;
INSERT INTO `grid_actions` VALUES (1,1,'aa','aa','aa',NULL,NULL,1,'aa'),(2,1,'bb','bb','bb','bb.php',1,2,''),(3,1,'cc','cc','cc','cc',1,1,''),(4,7,'RRR','RRR','RRR','RRRR',1,1,'dadada'),(5,9,'edit','edit','editRec','phpapps_database_list_databases_form_imp.php',1,2,''),(6,9,'new','new','newRec','phpapps_database_list_databases_form_imp.php',1,1,''),(7,9,'add','add','addRec','phpapps_database_list_databases_form_imp.php',1,1,''),(8,9,'delete','delete','deleteRec','phpapps_database_list_databases_form_imp.php',1,2,'');
/*!40000 ALTER TABLE `grid_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grid_columns`
--

DROP TABLE IF EXISTS `grid_columns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grid_columns` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `GRID_ID` bigint(20) DEFAULT NULL,
  `COLUMN_ID` bigint(20) DEFAULT NULL,
  `ALT_COLUMN_TEXT` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LABEL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `phpapps_grid_columns_GRID_ID_FK` (`GRID_ID`),
  KEY `phpapps_grid_columns_COLUMN_ID_FK` (`COLUMN_ID`),
  CONSTRAINT `phpapps_grid_columns_COLUMN_ID_FK` FOREIGN KEY (`COLUMN_ID`) REFERENCES `table_details` (`ID`),
  CONSTRAINT `phpapps_grid_columns_GRID_ID_FK` FOREIGN KEY (`GRID_ID`) REFERENCES `grids` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grid_columns`
--

LOCK TABLES `grid_columns` WRITE;
/*!40000 ALTER TABLE `grid_columns` DISABLE KEYS */;
INSERT INTO `grid_columns` VALUES (7,1,848,'\\\'MIMI\\\' AS FIFI','TEST2',''),(8,1,848,'\'MIMI\' AS FIFI','TEST2',''),(9,2,1078,'','TEMPLATE','run_code_editor.php?gact=editTpl'),(10,2,1080,'(SELECT VALUE FROM  phpapps.list_template_types WHERE ID = ELEMENT_TYPE_ID ) AS ELEMENT_TYPE','TYPE',''),(11,2,1079,'( SELECT APP_NAME FROM phpapps.applications WHERE ID = APP_ID) AS APPLICATION','APPLICATION',''),(12,3,1127,'','ELEMENT NAME','phpapps_designer_custom_element_run.php'),(13,3,1128,'( SELECT APP_NAME FROM phpapps.applications WHERE ID = APP_ID) AS APPLICATION','APPLICATION',''),(14,4,1083,'','NAME','phpapps_designer_grid_run.php?gact=test'),(15,4,1084,'(SELECT VALUE FROM phpapps.list_grid_types WHERE phpapps.list_grid_types.ID = GRID_TYPE)','TYPE',''),(23,8,1220,'','LABEL',''),(24,8,1221,'','ACTION',''),(25,8,1224,'IF(GRID_ACTION_TYPE_ID = \\\'1\\\',\\\'grid_action\\\',\\\'row_action\\\')','TYPE',''),(26,17,1268,'','IMG','');
/*!40000 ALTER TABLE `grid_columns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grids`
--

DROP TABLE IF EXISTS `grids`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grids` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `GRID_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GRID_TITLE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `GRID_TYPE` bigint(20) NOT NULL DEFAULT 1,
  `TABLE_ID` bigint(20) NOT NULL DEFAULT 0,
  `QUERY_ID` bigint(20) NOT NULL DEFAULT 0,
  `EDITABLE` bigint(20) NOT NULL DEFAULT 0,
  `FILTERABLE` bigint(20) NOT NULL DEFAULT 0,
  `PAGINABLE` bigint(20) NOT NULL DEFAULT 0,
  `SORTABLE` bigint(20) DEFAULT NULL,
  `EXPORTABLE` bigint(20) NOT NULL DEFAULT 0,
  `EDIT_FORM_ID` bigint(20) DEFAULT NULL,
  `ROWS_ON_PAGE` bigint(20) NOT NULL DEFAULT 10,
  `ELEMENT_TEMPLATE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `phpapps_grids_GRID_TYPE_FK` (`GRID_TYPE`),
  KEY `phpapps_grids_ELEMENT_TEMPLATE_ID_FK` (`ELEMENT_TEMPLATE_ID`),
  CONSTRAINT `phpapps_grids_ELEMENT_TEMPLATE_ID_FK` FOREIGN KEY (`ELEMENT_TEMPLATE_ID`) REFERENCES `templates` (`ID`),
  CONSTRAINT `phpapps_grids_GRID_TYPE_FK` FOREIGN KEY (`GRID_TYPE`) REFERENCES `list_grid_types` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grids`
--

LOCK TABLES `grids` WRITE;
/*!40000 ALTER TABLE `grids` DISABLE KEYS */;
INSERT INTO `grids` VALUES (1,'GRID_TEST_1','GRID_TEST_1',1,362,0,1,0,0,1,0,177,20,36),(2,'PHPAPPS_DESIGNER_TEMPLATES_GRID','TEMPLATES',1,350,0,1,0,1,1,0,274,20,2),(3,'PHPAPPS_DESIGNER_CUSTOM_ELEMENTS_GRID','CUSTOM ELEMENTS',1,359,0,1,0,1,1,0,263,20,2),(4,'PHPAPPS_DESIGNER_GRIDS_GRID','GRIDS',1,347,0,1,0,1,1,0,256,10,2),(7,'GRID_TEST_2','GRID_TEST_2',1,363,0,1,0,0,1,0,172,10,2),(8,'PHPAPPS_DESIGNER_GRID_ACTIONS','GRID MAIN ACTIONS',1,363,0,1,0,0,1,0,285,10,2),(9,'PHPAPPS_DATABASE_DATABASES','DATABASES',3,289,0,0,0,1,1,0,0,10,36),(10,'GRID_QUERY_TEST','GRID_QUERY_TEST',2,0,12,0,0,0,0,0,0,10,2),(12,'DISP LIST ELEMENTS','GRID_LIST_TEST',1,197,0,1,0,1,1,0,0,5,2),(13,'PHPAPPS_DESIGNER_CUSTOM_FORMS_GRID','CUSTOM_FORMS',1,5,0,1,0,1,1,0,0,5,2),(14,'PHPAPPS_DATABASE_CONNECTIONS_GRID','DB CONNECTIONS',1,365,0,1,0,1,1,0,0,10,36),(15,'eshop_categories','CATEGORIES',1,80,0,1,0,1,1,0,298,10,2),(16,'eshop_products','PRODUCTS',1,377,0,1,0,1,1,0,301,10,2),(17,'eshop_product_imgs','IMAGES',1,379,0,1,0,1,0,0,303,10,2);
/*!40000 ALTER TABLE `grids` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layout_variables`
--

DROP TABLE IF EXISTS `layout_variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layout_variables` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `LAYOUT_ID` bigint(20) DEFAULT NULL,
  `VARIABLE_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VARIABLE_CONTENT` text COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phpapps_layout_variables_1044_1045_IDX` (`LAYOUT_ID`,`VARIABLE_NAME`),
  CONSTRAINT `phpapps_layout_variables_LAYOUT_ID_FK` FOREIGN KEY (`LAYOUT_ID`) REFERENCES `layouts` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layout_variables`
--

LOCK TABLES `layout_variables` WRITE;
/*!40000 ALTER TABLE `layout_variables` DISABLE KEYS */;
INSERT INTO `layout_variables` VALUES (1,24,'PAGE_TITLE','Titlu de test');
/*!40000 ALTER TABLE `layout_variables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layouts`
--

DROP TABLE IF EXISTS `layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layouts` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `APP_ID` bigint(20) NOT NULL DEFAULT 1,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phpapps_layouts_126_996_IDX` (`NAME`,`APP_ID`),
  KEY `phpapps_layouts_APP_ID_FK` (`APP_ID`),
  CONSTRAINT `phpapps_layouts_APP_ID_FK` FOREIGN KEY (`APP_ID`) REFERENCES `applications` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layouts`
--

LOCK TABLES `layouts` WRITE;
/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
INSERT INTO `layouts` VALUES (1,'phpapps',1,''),(5,'default',1,''),(19,'test_cpy_lay3',1,''),(20,'default2',1,''),(23,'phpapps_form',1,'test'),(24,'empty_layout',1,''),(25,'laura',1,'aaa'),(26,'phpapps_popup',1,''),(27,'phpapps_login',1,''),(31,'eshop_admin_layout',7,'');
/*!40000 ALTER TABLE `layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_application_types`
--

DROP TABLE IF EXISTS `list_application_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_application_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_application_types`
--

LOCK TABLES `list_application_types` WRITE;
/*!40000 ALTER TABLE `list_application_types` DISABLE KEYS */;
INSERT INTO `list_application_types` VALUES (1,'Web Application Builder Cloud Oriented','wabco'),(2,'Template Application','template'),(3,'Custom Application for Clients','custom');
/*!40000 ALTER TABLE `list_application_types` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_databases`
--

LOCK TABLES `list_databases` WRITE;
/*!40000 ALTER TABLE `list_databases` DISABLE KEYS */;
INSERT INTO `list_databases` VALUES (1,'mysql','mysql'),(2,'test','test'),(3,'phpapps','phpapps'),(7,'eshop',''),(10,'information_schema',''),(11,'performance_schema',''),(12,'php_quiz',''),(15,'test',''),(17,'atsepa',''),(29,'diomax','');
/*!40000 ALTER TABLE `list_databases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_dbms_types`
--

DROP TABLE IF EXISTS `list_dbms_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_dbms_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_dbms_types`
--

LOCK TABLES `list_dbms_types` WRITE;
/*!40000 ALTER TABLE `list_dbms_types` DISABLE KEYS */;
INSERT INTO `list_dbms_types` VALUES (1,'mysql','');
/*!40000 ALTER TABLE `list_dbms_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_display_elements_types`
--

DROP TABLE IF EXISTS `list_display_elements_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_display_elements_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_display_elements_types`
--

LOCK TABLES `list_display_elements_types` WRITE;
/*!40000 ALTER TABLE `list_display_elements_types` DISABLE KEYS */;
INSERT INTO `list_display_elements_types` VALUES (1,'','MENU'),(2,'','FORM'),(3,'','LAYOUT_VARIABLE'),(4,'','GRID'),(5,'','CUSTOM_ELEMENT');
/*!40000 ALTER TABLE `list_display_elements_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_display_objects_types`
--

DROP TABLE IF EXISTS `list_display_objects_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_display_objects_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_display_objects_types`
--

LOCK TABLES `list_display_objects_types` WRITE;
/*!40000 ALTER TABLE `list_display_objects_types` DISABLE KEYS */;
INSERT INTO `list_display_objects_types` VALUES (1,'','LAYOUT'),(2,'','SCRIPT'),(3,'','FORM'),(4,'','CUSTOM_ELEMENT');
/*!40000 ALTER TABLE `list_display_objects_types` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_empty`
--

LOCK TABLES `list_empty` WRITE;
/*!40000 ALTER TABLE `list_empty` DISABLE KEYS */;
INSERT INTO `list_empty` VALUES (1,'aaa','aaa'),(2,'rrr','rrrr');
/*!40000 ALTER TABLE `list_empty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_foreign_key_options`
--

DROP TABLE IF EXISTS `list_foreign_key_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_foreign_key_options` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(255) NOT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_foreign_key_options`
--

LOCK TABLES `list_foreign_key_options` WRITE;
/*!40000 ALTER TABLE `list_foreign_key_options` DISABLE KEYS */;
INSERT INTO `list_foreign_key_options` VALUES (1,'RESTRICT',''),(2,'CASCADE',''),(3,'SET NULL',''),(4,'NO ACTION','');
/*!40000 ALTER TABLE `list_foreign_key_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_grid_action_types`
--

DROP TABLE IF EXISTS `list_grid_action_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_grid_action_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_grid_action_types`
--

LOCK TABLES `list_grid_action_types` WRITE;
/*!40000 ALTER TABLE `list_grid_action_types` DISABLE KEYS */;
INSERT INTO `list_grid_action_types` VALUES (1,'','grid_action'),(2,'','row_action');
/*!40000 ALTER TABLE `list_grid_action_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_grid_types`
--

DROP TABLE IF EXISTS `list_grid_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_grid_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_grid_types`
--

LOCK TABLES `list_grid_types` WRITE;
/*!40000 ALTER TABLE `list_grid_types` DISABLE KEYS */;
INSERT INTO `list_grid_types` VALUES (1,'','table'),(2,'','query'),(3,'','list'),(4,'','view');
/*!40000 ALTER TABLE `list_grid_types` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_index_types`
--

LOCK TABLES `list_index_types` WRITE;
/*!40000 ALTER TABLE `list_index_types` DISABLE KEYS */;
INSERT INTO `list_index_types` VALUES (1,'PRIMARY',''),(2,'UNIQUE',''),(3,'INDEX',''),(4,'FULLTEXT','');
/*!40000 ALTER TABLE `list_index_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_menu_orientation`
--

DROP TABLE IF EXISTS `list_menu_orientation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_menu_orientation` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_menu_orientation`
--

LOCK TABLES `list_menu_orientation` WRITE;
/*!40000 ALTER TABLE `list_menu_orientation` DISABLE KEYS */;
INSERT INTO `list_menu_orientation` VALUES (1,'','VERTICAL'),(2,'','HORIZONTAL');
/*!40000 ALTER TABLE `list_menu_orientation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_menu_types`
--

DROP TABLE IF EXISTS `list_menu_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_menu_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_menu_types`
--

LOCK TABLES `list_menu_types` WRITE;
/*!40000 ALTER TABLE `list_menu_types` DISABLE KEYS */;
INSERT INTO `list_menu_types` VALUES (1,'','DYNAMIC'),(2,'','STATIC');
/*!40000 ALTER TABLE `list_menu_types` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_mysql_column_types`
--

LOCK TABLES `list_mysql_column_types` WRITE;
/*!40000 ALTER TABLE `list_mysql_column_types` DISABLE KEYS */;
INSERT INTO `list_mysql_column_types` VALUES (1,'TINYINT','Signed: -128 <-> 127<br>\r\nUnsigned: 0 <-> 255'),(2,'SMALLINT','Signed: -32768 <-> 32767<br>\r\nUnsigned: -32768 <-> 32767'),(3,'MEDIUMINT','Signed: -8388608 <-> 8388607<br>\r\nUnsigned: 0 <-> 16777215'),(4,'INTEGER','Signed : -2147483648 <-> 2147483647<br>\r\nUnsigned: 0 <-> 4294967295'),(5,'BIGINT','Signed: -9223372036854775808 <-> 9223372036854775807<br>\r\nUnsigned: 0 <-> 18446744073709551615'),(6,'NUMERIC',''),(7,'VARCHAR',''),(8,'TEXT',''),(9,'TIMESTAMP',''),(10,'DATE',''),(11,'DECIMAL','');
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
INSERT INTO `list_object_types` VALUES (1,'script','Application Script'),(2,'form','Application Form'),(3,'table','Database Table'),(4,'view','Database View');
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
-- Table structure for table `list_query_parameter_type`
--

DROP TABLE IF EXISTS `list_query_parameter_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_query_parameter_type` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_query_parameter_type`
--

LOCK TABLES `list_query_parameter_type` WRITE;
/*!40000 ALTER TABLE `list_query_parameter_type` DISABLE KEYS */;
INSERT INTO `list_query_parameter_type` VALUES (1,'','STATIC'),(2,'','DYNAMIC');
/*!40000 ALTER TABLE `list_query_parameter_type` ENABLE KEYS */;
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
INSERT INTO `list_script_types` VALUES (1,'ADMIN',''),(2,'PUBLIC','');
/*!40000 ALTER TABLE `list_script_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_sql_sintax_types`
--

DROP TABLE IF EXISTS `list_sql_sintax_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_sql_sintax_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `VALUE` varchar(20) NOT NULL DEFAULT '',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_sql_sintax_types`
--

LOCK TABLES `list_sql_sintax_types` WRITE;
/*!40000 ALTER TABLE `list_sql_sintax_types` DISABLE KEYS */;
INSERT INTO `list_sql_sintax_types` VALUES (1,'CREATE_TABLE','CREATE'),(2,'ALTER_TABLE_ADD_PK','ALTER ADD'),(3,'DROP_TABLE','DROP'),(4,'ALTER_TABLE_ADD_COL','ALTER ADD'),(5,'ALTER_TBL_REN_TBL','ALTER'),(6,'ALTER_TABLE_DROP_COL','ALTER DROP'),(7,'ALTER_TABLE_ADD_FK','ALTER ADD'),(8,'ALTER_TABLE_DROP_FK','ALTER DROP'),(9,'FOREIGN_KEY_DEF','DEF'),(10,'ALTER_TABLE_DROP_PK','ALTER DROP'),(11,'ALTER_TABLE_CHG_COL','ALTER'),(12,'ALTER_TABLE_DROP_IDX','ALTER DROP'),(13,'ALTER_TABLE_ADD_IDX','ALTER ADD'),(14,'INDEX_DEF','');
/*!40000 ALTER TABLE `list_sql_sintax_types` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_table_types`
--

LOCK TABLES `list_table_types` WRITE;
/*!40000 ALTER TABLE `list_table_types` DISABLE KEYS */;
INSERT INTO `list_table_types` VALUES (1,'list_table',''),(2,'values_table',''),(3,'result_table',''),(4,'virtual_table','VIRTUAL TABLE - nu exista');
/*!40000 ALTER TABLE `list_table_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_template_types`
--

DROP TABLE IF EXISTS `list_template_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_template_types` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_template_types`
--

LOCK TABLES `list_template_types` WRITE;
/*!40000 ALTER TABLE `list_template_types` DISABLE KEYS */;
INSERT INTO `list_template_types` VALUES (1,'','SCRIPT'),(2,'','FORM'),(3,'','GRID'),(4,'','MENU'),(5,'','CUSTOM_ELEMENT');
/*!40000 ALTER TABLE `list_template_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_true_false`
--

DROP TABLE IF EXISTS `list_true_false`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_true_false` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_true_false`
--

LOCK TABLES `list_true_false` WRITE;
/*!40000 ALTER TABLE `list_true_false` DISABLE KEYS */;
INSERT INTO `list_true_false` VALUES (0,'','FALSE'),(1,'','TRUE');
/*!40000 ALTER TABLE `list_true_false` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_user_types`
--

LOCK TABLES `list_user_types` WRITE;
/*!40000 ALTER TABLE `list_user_types` DISABLE KEYS */;
INSERT INTO `list_user_types` VALUES (1,'admin','admin'),(2,'ROOT','');
/*!40000 ALTER TABLE `list_user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_web_script_type`
--

DROP TABLE IF EXISTS `list_web_script_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_web_script_type` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_web_script_type`
--

LOCK TABLES `list_web_script_type` WRITE;
/*!40000 ALTER TABLE `list_web_script_type` DISABLE KEYS */;
INSERT INTO `list_web_script_type` VALUES (1,'1','FORM'),(2,'2','SCRIPT'),(3,'3','POPUP');
/*!40000 ALTER TABLE `list_web_script_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PID` bigint(20) DEFAULT NULL,
  `MENU_ID` bigint(20) NOT NULL DEFAULT 1,
  `ACTION` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LABEL` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `phpapps_menu_items_MENU_ID_FK` (`MENU_ID`),
  KEY `phpapps_menu_items_PID_FK` (`PID`),
  CONSTRAINT `phpapps_menu_items_MENU_ID_FK` FOREIGN KEY (`MENU_ID`) REFERENCES `menus` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (3,0,3,'test1.php?aa=bb&amp;cc=dd','TEST1'),(4,3,3,'http://www.google.com','TEST2'),(5,4,3,'AA2','AA'),(6,0,4,'AA2','TEST1ss'),(7,0,4,'AA2','TEST3ssss'),(8,0,3,'MENU2','MENU2'),(9,8,3,'SUB_1_MENU2','SUB_1_MENU2'),(10,8,3,'SUB_2_MENU2','SUB_2_MENU2'),(11,9,3,'SUB_SUB_1_MENU2','SUB_SUB_1_MENU2'),(12,0,6,'TEST_M4','TEST_M4'),(13,0,7,'MMI','MMI'),(14,0,7,'FIFI','FIFI'),(15,14,7,'GIGI','GIGI');
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menus` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MENU_TITLE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MENU_TYPE` bigint(20) NOT NULL DEFAULT 1,
  `ORIENTATION` bigint(2) NOT NULL DEFAULT 1,
  `QUERY_ID` bigint(20) DEFAULT NULL,
  `TEMPLATE_ID` bigint(20) NOT NULL DEFAULT 0,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `phpapps_menus_ORIENTATION_FK` (`ORIENTATION`),
  KEY `phpapps_menus_MENU_TYPE_FK` (`MENU_TYPE`),
  KEY `phpapps_menus_QUERY_ID_FK` (`QUERY_ID`),
  CONSTRAINT `phpapps_menus_MENU_TYPE_FK` FOREIGN KEY (`MENU_TYPE`) REFERENCES `list_menu_types` (`ID`),
  CONSTRAINT `phpapps_menus_ORIENTATION_FK` FOREIGN KEY (`ORIENTATION`) REFERENCES `list_menu_orientation` (`ID`),
  CONSTRAINT `phpapps_menus_QUERY_ID_FK` FOREIGN KEY (`QUERY_ID`) REFERENCES `queries` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (3,'TEST_MENU_2','',2,2,11,38,''),(4,'TEST_MENU_3','TEST_MENU_3',2,2,11,38,''),(5,'PHPAPPS_MAIN_NAVBAR','WABCO',1,1,14,38,''),(6,'TEST_MENU_4','TEST_MENU_4',2,1,11,38,''),(7,'laura','laura',2,2,11,38,'AAAA');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_vars`
--

DROP TABLE IF EXISTS `module_vars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `module_vars` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` bigint(20) NOT NULL DEFAULT 0,
  `VAR_NAME` varchar(255) NOT NULL DEFAULT '',
  `VAR_VALUE` varchar(255) NOT NULL DEFAULT '',
  `VAR_TYPE` bigint(20) NOT NULL DEFAULT 0,
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `SCRIPT_ID` bigint(20) NOT NULL DEFAULT 2,
  `MODULE_NAME` varchar(20) NOT NULL DEFAULT '',
  `MODULE_TITLE` varchar(255) NOT NULL DEFAULT '',
  `MODULE_DATE` date NOT NULL DEFAULT '0000-00-00',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `APP_ID` (`APP_ID`),
  KEY `modules_ibfk_2` (`SCRIPT_ID`),
  KEY `modules_ibfk_3` (`MODIFY_UID`),
  KEY `modules_ibfk_4` (`CREATE_UID`),
  CONSTRAINT `modules_ibfk_1` FOREIGN KEY (`APP_ID`) REFERENCES `applications` (`ID`),
  CONSTRAINT `modules_ibfk_3` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `modules_ibfk_4` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `phpapps_modules_SCRIPT_ID_FK` FOREIGN KEY (`SCRIPT_ID`) REFERENCES `scripts` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,1,154,'phpapps_admin','admin','0000-00-00','',1,1,'2020-04-21 15:39:30','0000-00-00 00:00:00'),(7,1,155,'phpapps_users','users','0000-00-00','',1,1,'2020-04-21 15:39:40','0000-00-00 00:00:00'),(8,1,252,'phpapps_lang','languages','0000-00-00','',1,1,'2020-04-21 16:24:39','0000-00-00 00:00:00'),(10,7,299,'eshop_admin','admin','0000-00-00','',1,1,'2020-05-01 08:01:48','0000-00-00 00:00:00'),(14,1,165,'phpapps_database','database','2016-09-21','',1,1,'2020-04-21 15:39:54','2016-09-21 07:01:06'),(15,8,154,'questions','Questions','2017-02-21','',1,1,'2019-11-20 09:53:12','2017-02-21 12:12:54'),(17,10,154,'forum','Forum','2017-07-09','',1,1,'2019-11-20 09:53:12','2017-07-09 08:33:48'),(18,1,154,'imp_exp','import / export','2017-07-09','',1,1,'2020-04-21 15:40:12','2017-07-09 09:27:25'),(19,10,154,'articles','Articles','2017-07-09','',1,1,'2019-11-20 09:53:12','2017-07-09 11:26:27'),(20,10,154,'admin','Admin','2017-07-09','',1,1,'2019-11-20 09:53:12','2017-07-09 12:24:29'),(21,1,174,'phpapps_designer','designer','2017-09-28','',1,1,'2020-04-21 15:40:18','2017-09-28 06:25:31'),(27,1,154,'test_app','tests','2019-11-20','',1,1,'2020-04-21 15:40:36','2019-11-20 13:23:49'),(29,88,154,'cstudor_admin','Admin','2019-11-30','Administration page',1,1,'2019-11-30 10:40:49','2019-11-30 10:40:49'),(31,7,291,'eshop_public','public','2020-04-25','',1,1,'2020-04-29 18:46:18','2020-04-25 11:49:22');
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mysql_column_defs`
--

DROP TABLE IF EXISTS `mysql_column_defs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mysql_column_defs` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `COLUMN_TYPE_ID` bigint(20) NOT NULL,
  `DEF_TPL` text NOT NULL,
  `DESCRIPTION` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `list_mysql_column_types_ID_fk` (`COLUMN_TYPE_ID`),
  CONSTRAINT `list_mysql_column_types_ID_fk` FOREIGN KEY (`COLUMN_TYPE_ID`) REFERENCES `list_mysql_column_types` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mysql_column_defs`
--

LOCK TABLES `mysql_column_defs` WRITE;
/*!40000 ALTER TABLE `mysql_column_defs` DISABLE KEYS */;
INSERT INTO `mysql_column_defs` VALUES (1,5,'{$COLUMN_OBJ->COLUMN_NAME} BIGINT{if $COLUMN_OBJ->COLUMN_SIZE != \\\"\\\"}({$COLUMN_OBJ->COLUMN_SIZE}){/if} {if ! $COLUMN_OBJ->ACCEPT_NULL }NOT NULL{/if} {if $COLUMN_OBJ->DEFAULT_VAL!= \\\"\\\" } DEFAULT \\\'{if $COLUMN_OBJ->DEFAULT_VAL != \\\"EMPTY\\\"}{$COLUMN_OBJ->DEFAULT_VAL}{/if}\\\'{/if}',''),(2,7,'{$COLUMN_OBJ->COLUMN_NAME} VARCHAR ({$COLUMN_OBJ->COLUMN_SIZE}) {if $COLUMN_OBJ->ACCEPT_NULL === FALSE }NOT NULL{/if} {if $COLUMN_OBJ->DEFAULT_VAL!= \\\"\\\" } DEFAULT \\\'{if $COLUMN_OBJ->DEFAULT_VAL != \\\"EMPTY\\\"}{$COLUMN_OBJ->DEFAULT_VAL}{/if}\\\' {/if}',''),(3,8,'{$COLUMN_OBJ->COLUMN_NAME} TEXT {if $COLUMN_OBJ->ACCEPT_NULL === FALSE }NOT NULL{/if} {if $COLUMN_OBJ->DEFAULT_VAL!= \\\"\\\" } DEFAULT \\\'{if $COLUMN_OBJ->DEFAULT_VAL != \\\"EMPTY\\\"}{$COLUMN_OBJ->DEFAULT_VAL}{/if}\\\' {/if}',''),(4,9,'{$COLUMN_OBJ->COLUMN_NAME} TIMESTAMP{if $COLUMN_OBJ->COLUMN_SIZE != \\\"\\\"}({$COLUMN_OBJ->COLUMN_SIZE}){/if} {if ! $COLUMN_OBJ->ACCEPT_NULL }NOT NULL{/if} {if $COLUMN_OBJ->DEFAULT_VAL!= \\\"\\\" } DEFAULT \\\'{if $COLUMN_OBJ->DEFAULT_VAL != \\\"EMPTY\\\"}{$COLUMN_OBJ->DEFAULT_VAL}{/if}\\\'{/if}','TIMESTAMP'),(5,6,'{$COLUMN_OBJ->COLUMN_NAME} NUMERIC{if $COLUMN_OBJ->COLUMN_SIZE != \\\"\\\"}({$COLUMN_OBJ->COLUMN_SIZE}){/if} {if ! $COLUMN_OBJ->ACCEPT_NULL }NOT NULL{/if} {if $COLUMN_OBJ->DEFAULT_VAL!= \\\"\\\" } DEFAULT \\\'{if $COLUMN_OBJ->DEFAULT_VAL != \\\"EMPTY\\\"}{$COLUMN_OBJ->DEFAULT_VAL}{/if}\\\'{/if}','NUMERIC'),(6,11,'{$COLUMN_OBJ->COLUMN_NAME} NUMERIC{if $COLUMN_OBJ->COLUMN_SIZE != \\\"\\\"}({$COLUMN_OBJ->COLUMN_SIZE}){/if} {if ! $COLUMN_OBJ->ACCEPT_NULL }NOT NULL{/if} {if $COLUMN_OBJ->DEFAULT_VAL!= \\\"\\\" } DEFAULT \\\'{if $COLUMN_OBJ->DEFAULT_VAL != \\\"EMPTY\\\"}{$COLUMN_OBJ->DEFAULT_VAL}{/if}\\\'{/if}','DECIMAL'),(9,10,'{$COLUMN_OBJ->COLUMN_NAME} DATE {if ! $COLUMN_OBJ->ACCEPT_NULL }NOT NULL{/if} {if $COLUMN_OBJ->DEFAULT_VAL!= \"\" } DEFAULT \'{if $COLUMN_OBJ->DEFAULT_VAL != \"EMPTY\"}{$COLUMN_OBJ->DEFAULT_VAL}{/if}\'{/if}','DATE');
/*!40000 ALTER TABLE `mysql_column_defs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `PERMISSION_NAME` bigint(20) NOT NULL DEFAULT 1,
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `PERMISSION_TYPE` bigint(20) NOT NULL DEFAULT 1,
  `OBJECT_TYPE` bigint(20) NOT NULL DEFAULT 1,
  `OBJECT_ID` bigint(20) NOT NULL DEFAULT 0,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
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
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` bigint(20) NOT NULL DEFAULT 0,
  `QUERY_NAME` varchar(255) DEFAULT NULL,
  `QUERY_BODY` text DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `phpapps_queries_MODULE_ID_FK` (`MODULE_ID`),
  CONSTRAINT `phpapps_queries_MODULE_ID_FK` FOREIGN KEY (`MODULE_ID`) REFERENCES `modules` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
INSERT INTO `queries` VALUES (0,14,'EMPTY_QUERY','SELECT ID FROM dual','SELECT FROM VIRTUAL TABLE FOR ORIGIN_ID'),(5,14,'MENU_SHOW_TABLES','show tables',''),(6,14,'queries','select * from queries where ID = :id or ID = :id2',''),(8,14,'sql_console_saves','select * from sql_console_saves',''),(9,14,'apps','select * from applications',''),(10,14,'view_user_profiles','select up.*,t.*,s.* from phpapps.user_profiles up left join phpapps.themes t on (up.theme_id = t.ID) left join phpapps.scripts s on (up.script_id = s.id);',''),(11,14,'MENU_STATIC_QUERY','SELECT ID,PID,ACTION,LABEL FROM MENU_ITEMS WHERE MENU_ID=:MENU_ID',''),(12,14,'SELECT_ALL_FROM_TABLES','select * from tables',''),(14,14,'MENU_APPLICATIONS_QUERY','select ID, 0 AS PID, CONCAT(:SERVER_HOST_NAME,\\\'/phpapps_dev/\\\',APP_NAME,\\\'/\\\',APP_NAME,\\\'.php\\\') AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all\r\nselect CONCAT(APP_ID,ID) AS ID, APP_ID AS PID, CONCAT(:SERVER_HOST_NAME,\\\'/\\\',(select run_path from view_scripts s where s.id = SCRIPT_ID),\\\'?module_id=\\\',ID) AS ACTION , MODULE_TITLE AS LABEL from view_modules','');
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `query_parameters`
--

DROP TABLE IF EXISTS `query_parameters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `query_parameters` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `QUERY_ID` bigint(20) DEFAULT NULL,
  `PARAMETER_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARAMETER_VALUE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARAMETER_TYPE` bigint(20) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `phpapps_query_parameters_QUERY_ID_FK` (`QUERY_ID`),
  KEY `phpapps_query_parameters_PARAMETER_TYPE_FK` (`PARAMETER_TYPE`),
  CONSTRAINT `phpapps_query_parameters_PARAMETER_TYPE_FK` FOREIGN KEY (`PARAMETER_TYPE`) REFERENCES `list_query_parameter_type` (`ID`),
  CONSTRAINT `phpapps_query_parameters_QUERY_ID_FK` FOREIGN KEY (`QUERY_ID`) REFERENCES `queries` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `query_parameters`
--

LOCK TABLES `query_parameters` WRITE;
/*!40000 ALTER TABLE `query_parameters` DISABLE KEYS */;
INSERT INTO `query_parameters` VALUES (4,6,':id','10',1),(5,11,':MENU_ID','$MENU_ID',2),(6,6,':id2','14',1),(8,14,':SERVER_HOST_NAME','$SERVER_HOST_NAME',2);
/*!40000 ALTER TABLE `query_parameters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permissions` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` bigint(20) NOT NULL DEFAULT 0,
  `PERMISSION_ID` bigint(20) NOT NULL DEFAULT 0,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `MODULE_ID` bigint(20) NOT NULL,
  `SCRIPT_NAME` varchar(255) DEFAULT NULL,
  `TABLE_ID` bigint(20) NOT NULL DEFAULT 0,
  `FORM_QUERY` varchar(255) NOT NULL DEFAULT '',
  `FORM_PHP_DIR` varchar(255) DEFAULT NULL,
  `FORM_TPL_DIR` varchar(255) DEFAULT NULL,
  `WEB_TYPE_ID` bigint(2) NOT NULL DEFAULT 1,
  `SCRIPT_TYPE_ID` bigint(2) NOT NULL DEFAULT 1,
  `LAYOUT_ID` bigint(20) NOT NULL DEFAULT 1,
  `TEMPLATE_ID` bigint(20) NOT NULL DEFAULT 0,
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `MODULE_ID` (`MODULE_ID`,`SCRIPT_NAME`),
  KEY `forms_ibfk_2` (`TABLE_ID`),
  KEY `forms_ibfk_3` (`MODIFY_UID`),
  KEY `forms_ibfk_4` (`CREATE_UID`),
  KEY `phpapps_forms_WEB_TYPE_ID_FK` (`WEB_TYPE_ID`),
  KEY `phpapps_forms_SCRIPT_TYPE_ID_FK` (`SCRIPT_TYPE_ID`),
  KEY `phpapps_scripts_LAYOUT_ID_FK` (`LAYOUT_ID`),
  CONSTRAINT `phpapps_forms_SCRIPT_TYPE_ID_FK` FOREIGN KEY (`SCRIPT_TYPE_ID`) REFERENCES `list_script_types` (`ID`),
  CONSTRAINT `phpapps_forms_WEB_TYPE_ID_FK` FOREIGN KEY (`WEB_TYPE_ID`) REFERENCES `list_web_script_type` (`ID`),
  CONSTRAINT `phpapps_scripts_LAYOUT_ID_FK` FOREIGN KEY (`LAYOUT_ID`) REFERENCES `layouts` (`ID`),
  CONSTRAINT `scripts_ibfk_1` FOREIGN KEY (`MODULE_ID`) REFERENCES `modules` (`ID`),
  CONSTRAINT `scripts_ibfk_2` FOREIGN KEY (`TABLE_ID`) REFERENCES `tables` (`ID`),
  CONSTRAINT `scripts_ibfk_3` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `scripts_ibfk_4` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=304 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (60,1,'phpapps_admin_scripts_form',83,'','.','.',1,1,26,0,'',1,1,'2020-04-29 08:36:45','0000-00-00 00:00:00'),(65,1,'phpapps_admin_modules_form',3,'','.\\phpapps','.\\phpapps',1,1,5,0,'',1,1,'2020-04-26 10:48:51','0000-00-00 00:00:00'),(66,7,'phpapps_users_roles_form',88,'','.','.',1,1,5,0,'',1,1,'2020-04-26 10:48:51','0000-00-00 00:00:00'),(69,7,'phpapps_users_user_roles_form',90,'','.','.',1,1,5,0,'',1,1,'2020-04-26 10:48:51','0000-00-00 00:00:00'),(72,7,'phpapps_users_permissions_form',89,'','.','.',1,1,5,0,'',1,1,'2020-04-26 10:48:51','0000-00-00 00:00:00'),(76,7,'phpapps_users_role_permissions_form',91,'','.','.',1,1,5,0,'',1,1,'2020-04-26 10:48:51','0000-00-00 00:00:00'),(95,1,'phpapps_admin_forms_form',5,'','D:\\\\linuxport\\\\work\\','D:\\\\linuxport\\\\work\\',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2016-09-21 11:37:03'),(101,14,'phpapps_database_mysql_column_defs_form',222,'','/var/www/html/phpapp','/var/www/html/phpapp',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2016-09-24 05:10:00'),(103,14,'phpapps_database_sql_sintax_form',224,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2016-09-26 06:31:40'),(105,14,'phpapps_database_lists_form',197,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2016-09-27 09:52:59'),(107,14,'phpapps_database_tables_form',197,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2016-09-28 08:58:39'),(114,14,'phpapps_database_table_details_form',198,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2016-09-30 08:29:05'),(115,14,'phpapps_database_table_details_DDL_form',198,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2016-09-30 08:33:22'),(117,14,'phpapps_database_table_fks_DDL_form',276,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2016-10-03 07:46:58'),(118,14,'phpapps_database_table_indexes_form',279,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2016-10-03 10:53:46'),(119,14,'phpapps_database_table_indexes_DDL_form',279,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2016-10-03 12:02:10'),(120,14,'phpapps_database_add_table_form',197,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2016-10-11 09:04:57'),(125,15,'php_quiz_questions_questions_form',284,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2017-02-27 08:06:39'),(132,14,'phpapps_database_queries_form',281,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2017-09-20 08:30:22'),(134,18,'imp_exp_test_import_form',298,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2017-09-22 06:16:12'),(135,20,'admin_app_users_form',299,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2017-09-25 07:11:35'),(139,19,'articles_app_users_form',294,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2017-09-25 09:57:04'),(140,19,'articles_articles_form',292,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2017-09-25 12:46:40'),(142,17,'forum_forum_categories_form',301,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2017-10-02 12:14:27'),(143,17,'forum_topics_form',302,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2017-10-02 13:15:21'),(144,17,'forum_posts_form',304,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2017-10-02 13:20:38'),(145,20,'admin_contact_form',305,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2017-10-11 08:29:40'),(148,1,'phpapps_admin_test_upload_form',318,'','D:/linuxport/work/ww','D:/linuxport/work/ww',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-10-28 08:32:34'),(151,21,'phpapps_designer_themes_form',324,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-09 11:12:22'),(153,7,'phpapps_users_user_profiles_form',99,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-09 15:45:50'),(154,1,'phpapps_admin_module',0,'',NULL,NULL,2,1,1,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(155,7,'phpapps_users_module',0,'',NULL,NULL,2,1,1,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(156,7,'phpapps_users_generate_permissions',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(157,7,'phpapps_users_manage_user_roles',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(158,14,'sql_console',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(159,1,'index',0,'',NULL,NULL,2,2,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(160,7,'phpapps_users_manage_roles_permissions',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(161,1,'phpapps_login',0,'',NULL,NULL,2,2,27,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(162,7,'user_home',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(163,1,'phpapps_admin_applications',0,'',NULL,NULL,2,1,1,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(164,1,'phpinfo',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(165,14,'phpapps_database_module',0,'',NULL,NULL,2,1,1,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(166,14,'phpapps_database_browse_list',0,'',NULL,NULL,2,1,26,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(167,14,'test_column_def',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(168,14,'phpapps_database_browse_tables',0,'',NULL,NULL,2,1,26,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(169,15,'questions',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(170,15,'quiz_test',0,'',NULL,NULL,2,2,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(171,18,'import_excel',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(172,19,'articles',0,'',NULL,NULL,2,2,5,0,'display articles grid',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(173,21,'layout_designer',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(174,21,'phpapps_designer_module',0,'',NULL,NULL,2,1,1,0,'',1,1,'2020-04-28 18:09:06','2019-11-20 08:24:00'),(175,17,'forum_categs',0,'',NULL,NULL,2,2,5,0,'Display forum categories',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(176,19,'article',0,'',NULL,NULL,2,2,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(177,19,'about',0,'',NULL,NULL,2,2,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(178,20,'login',0,'',NULL,NULL,2,2,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(179,17,'forum_topics',0,'',NULL,NULL,2,2,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(180,17,'forum_posts',0,'',NULL,NULL,2,2,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(181,20,'contact',0,'',NULL,NULL,2,2,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(182,20,'sign_up',0,'',NULL,NULL,2,2,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(183,20,'home',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(184,14,'phpapps_database_table_rescan_columns',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(185,14,'phpapps_database_table_rescan_indexes',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(186,14,'phpapps_database_table_rescan_FKs',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(187,1,'test_jquery',0,'',NULL,NULL,2,2,5,0,'special pentru atesta jquery',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(188,1,'test_oci',0,'',NULL,NULL,2,1,5,0,'TEST EMANAG',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(189,14,'user_profile',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-20 08:24:00'),(230,7,'phpapps_login',0,'',NULL,NULL,2,2,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-22 18:02:33'),(232,27,'phpapps_test_app_test1_form',335,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,1,0,'',1,1,'2020-04-26 20:55:09','2019-11-23 08:32:13'),(233,27,'phpapps_test_app_test2_form',336,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-23 12:27:28'),(234,29,'cstudor_contact',0,'',NULL,NULL,2,2,5,0,'',1,1,'2020-04-26 10:48:51','2019-11-30 10:41:36'),(238,21,'phpapps_designer_menu_run',0,'',NULL,NULL,2,1,26,0,'',1,1,'2020-04-26 10:48:51','2020-04-17 07:49:38'),(240,21,'phpapps_designer_menus_form',328,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,5,0,'',1,1,'2020-05-01 08:46:23','2020-04-17 08:35:11'),(241,21,'phpapps_designer_menu_items_form',331,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,26,0,'',1,1,'2020-05-01 08:43:13','2020-04-17 09:44:23'),(242,14,'phpapps_database_views_form',202,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,1,0,'',1,1,'2020-04-26 10:48:51','2020-04-18 08:41:57'),(243,14,'phpapps_database_query_parameters_form',341,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,1,0,'',1,1,'2020-04-26 10:48:51','2020-04-18 09:18:40'),(244,21,'phpapps_designer_layout_variables_form',346,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,1,0,'',1,1,'2020-04-26 10:48:51','2020-04-20 09:39:50'),(245,21,'phpapps_designer_layout_elements_form',343,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,1,0,'',1,1,'2020-04-26 10:48:51','2020-04-20 10:01:55'),(247,10,'index',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2020-04-20 18:23:50'),(248,1,'phpapps',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2020-04-21 06:38:03'),(251,20,'atsepa',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 10:48:51','2020-04-21 06:40:27'),(252,8,'phpapps_languages_module',0,'',NULL,NULL,2,1,1,0,'',1,1,'2020-04-26 10:48:51','2020-04-21 16:23:57'),(253,21,'test_laura',0,'',NULL,NULL,2,1,25,0,'',1,1,'2020-04-26 10:48:51','2020-04-21 19:48:24'),(254,14,'phpapps_database_browse_views',0,'',NULL,NULL,2,1,26,0,'',1,1,'2020-04-26 10:48:51','2020-04-22 06:42:49'),(255,14,'phpapps_database_browse_queries',0,'',NULL,NULL,2,1,26,0,'',1,1,'2020-04-26 10:48:51','2020-04-22 06:43:46'),(256,21,'phpapps_designer_grids_form',347,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,26,0,'',1,1,'2020-04-26 16:11:15','2020-04-22 06:56:27'),(257,21,'phpapps_designer_layout_elements_templates_form',350,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,1,0,'',1,1,'2020-04-26 10:48:51','2020-04-22 07:38:59'),(258,21,'phpapps_designer_grid_run',0,'',NULL,NULL,2,1,26,0,'',1,1,'2020-04-26 10:48:51','2020-04-22 08:40:33'),(259,21,'phpapps_designer_grid_columns_form',351,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,26,0,'',1,1,'2020-04-26 10:48:51','2020-04-22 11:28:10'),(260,21,'phpapps_designer_display_object_elements_form',343,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,26,0,'',1,1,'2020-04-26 17:16:16','2020-04-22 16:28:41'),(261,21,'phpapps_designer_layouts_form',300,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,26,0,'',1,1,'2020-05-01 09:48:26','2020-04-22 18:43:47'),(263,21,'phpapps_designer_custom_elements_form',359,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,26,0,'',1,1,'2020-04-26 13:53:55','2020-04-23 10:52:32'),(264,7,'phpapps_users_users_form',87,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,1,0,'',1,1,'2020-04-26 10:48:51','2020-04-23 18:16:38'),(265,21,'phpapps_designer_custom_element_run',0,'',NULL,NULL,2,1,26,0,'',1,1,'2020-04-26 10:48:51','2020-04-25 12:35:17'),(268,21,'test_victor',0,'',NULL,NULL,2,1,1,0,'',1,1,'2020-04-26 10:48:51','2020-04-26 06:49:50'),(274,21,'phpapps_designer_templates_form',350,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,26,0,'',1,1,'2020-04-28 06:21:45','2020-04-26 08:02:22'),(278,21,'phpapps_designer_forms_form',360,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,5,0,'',1,1,'2020-04-26 10:48:51','2020-04-26 10:34:08'),(281,21,'test_victor2',0,'',NULL,NULL,2,1,5,34,'',1,1,'2020-04-26 11:41:07','2020-04-26 10:42:37'),(283,1,'run_php_script',0,'',NULL,NULL,2,1,26,0,'',1,1,'2020-04-26 14:12:12','2020-04-26 14:12:12'),(285,21,'phpapps_designer_grid_actions_form',363,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,26,0,'',1,1,'2020-04-26 17:19:56','2020-04-26 17:10:16'),(286,27,'aa',0,'',NULL,NULL,2,1,1,0,'',1,1,'2020-04-26 20:56:08','2020-04-26 20:56:08'),(287,27,'bb',0,'',NULL,NULL,2,1,5,0,'',1,1,'2020-04-26 21:22:01','2020-04-26 21:22:01'),(288,1,'phpapps_admin_applications_form',2,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,1,0,'',1,1,'2020-04-29 07:23:54','2020-04-29 07:23:54'),(289,14,'phpapps_database_list_databases_form',199,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,26,0,'',1,1,'2020-04-29 08:44:27','2020-04-29 08:43:02'),(291,1,'phpapps_admin_module_default',0,'',NULL,NULL,2,1,1,0,'',1,1,'2020-04-29 18:18:20','2020-04-29 18:17:35'),(294,14,'phpapps_database_list_form',210,'','D:/work/www\\\\phpapps_dev\\\\phpapps','D:/work/www\\\\phpapps_dev\\\\phpapps',1,1,1,0,'',1,1,'2020-05-01 06:44:43','2020-05-01 06:44:43'),(298,10,'eshop_admin_categories_form',80,'','D:/work/www\\\\phpapps_dev\\\\eshop','D:/work/www\\\\phpapps_dev\\\\eshop',1,1,31,0,'',1,1,'2020-05-01 12:23:48','2020-05-01 07:48:14'),(299,10,'eshop_admin_module',0,'',NULL,NULL,2,1,31,0,'',1,1,'2020-05-01 09:52:18','2020-05-01 08:01:09'),(300,1,'phpapps_admin_other_module',0,'',NULL,NULL,2,1,1,0,'',1,1,'2020-05-01 09:23:33','2020-05-01 09:23:33'),(301,10,'eshop_admin_products_form',377,'','D:/work/www\\\\phpapps_dev\\\\eshop','D:/work/www\\\\phpapps_dev\\\\eshop',1,1,31,0,'',1,1,'2020-05-01 12:03:46','2020-05-01 12:02:31'),(303,10,'eshop_admin_product_images_form',379,'','D:/work/www\\\\phpapps_dev\\\\eshop','D:/work/www\\\\phpapps_dev\\\\eshop',1,1,31,0,'',1,1,'2020-05-01 12:24:03','2020-05-01 12:17:27');
/*!40000 ALTER TABLE `scripts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_console_history`
--

DROP TABLE IF EXISTS `sql_console_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_console_history` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `QUERY` text DEFAULT NULL,
  `RUN_SCHEMA` bigint(20) DEFAULT NULL,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `sql_console_history_users_MODIFY_UID_FK` (`MODIFY_UID`),
  KEY `sql_console_history_users_CREATE_UID_FK` (`CREATE_UID`),
  KEY `phpapps_sql_console_history_RUN_SCHEMA_FK` (`RUN_SCHEMA`),
  CONSTRAINT `phpapps_sql_console_history_RUN_SCHEMA_FK` FOREIGN KEY (`RUN_SCHEMA`) REFERENCES `list_databases` (`ID`),
  CONSTRAINT `sql_console_history_users_CREATE_UID_FK` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `sql_console_history_users_MODIFY_UID_FK` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1389 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_console_history`
--

LOCK TABLES `sql_console_history` WRITE;
/*!40000 ALTER TABLE `sql_console_history` DISABLE KEYS */;
INSERT INTO `sql_console_history` VALUES (1,'show tables',3,1,1,'2016-10-07 09:21:16','2016-10-07 09:21:16'),(2,'select * from  applications',3,1,1,'2016-10-07 09:21:33','2016-10-07 09:21:33'),(3,'select * from  sql_console_history',3,1,1,'2016-10-07 09:21:47','2016-10-07 09:21:47'),(4,'select * from  sql_console_history',3,1,1,'2016-10-07 09:49:11','2016-10-07 09:49:11'),(5,'select * from  sql_console_history',3,1,1,'2016-10-07 09:49:31','2016-10-07 09:49:31'),(6,'select * from  sql_console_history',3,1,1,'2016-10-07 09:49:52','2016-10-07 09:49:52'),(7,'select * from  sql_console_history',3,1,1,'2016-10-07 09:50:07','2016-10-07 09:50:07'),(8,'select * from  sql_console_history',3,1,1,'2016-10-07 09:50:23','2016-10-07 09:50:23'),(9,'select * from  sql_console_history',3,1,1,'2016-10-07 09:50:47','2016-10-07 09:50:47'),(10,'select * from  sql_console_history',3,1,1,'2016-10-07 09:50:53','2016-10-07 09:50:53'),(11,'select * from  sql_console_history',3,1,1,'2016-10-07 09:51:01','2016-10-07 09:51:01'),(12,'select * from  sql_console_history',3,1,1,'2016-10-07 09:51:11','2016-10-07 09:51:11'),(13,'select * from  sql_console_history',3,1,1,'2016-10-07 09:51:36','2016-10-07 09:51:36'),(14,'select * from  sql_console_history',3,1,1,'2016-10-07 09:53:53','2016-10-07 09:53:53'),(15,'select * from  sql_console_history',3,1,1,'2016-10-07 10:08:47','2016-10-07 10:08:47'),(16,'select * from  sql_console_history',3,1,1,'2016-10-07 10:24:33','2016-10-07 10:24:33'),(17,'select * from  sql_console_history',3,1,1,'2016-10-07 10:24:53','2016-10-07 10:24:53'),(18,'select * from  sql_console_history',3,1,1,'2016-10-07 10:25:21','2016-10-07 10:25:21'),(19,'select * from  sql_console_history',3,1,1,'2016-10-07 10:25:21','2016-10-07 10:25:21'),(20,'select * from  sql_console_history',3,1,1,'2016-10-07 10:25:23','2016-10-07 10:25:23'),(21,'select * from  sql_console_history',3,1,1,'2016-10-07 10:25:47','2016-10-07 10:25:47'),(22,'select * from  sql_console_history',3,1,1,'2016-10-07 10:25:52','2016-10-07 10:25:52'),(23,'select \r\n ti.ID,\r\nt.SCHEMA_ID,\r\n(select value from phpapps.list_databases where id = t.schema_id) as \'TABLE_SCHEMA\',\r\n ti.TABLE_ID,\r\n t.TABLE_NAME,\r\n ti.INDEX_NAME,\r\n ti.INDEX_TYPE_ID,\r\n(select value from phpapps.list_index_types where id = ti.INDEX_TYPE_ID) as INDEX_TYPE,\r\n ti.INDEX_COLUMNS,\r\n(select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE td.ID IN (ti.INDEX_COLUMNS) GROUP BY td.TABLE_ID ) as \'INDEX_COLUMNS_LABELS\',\r\n ti.DESCRIPTION,\r\n ti.MODIFY_UID,\r\n ti.CREATE_UID,\r\n ti.MODIFY_DATE,\r\n ti.CREATE_DATE\r\n from table_indexes ti left join tables t on (ti.table_id = t.id)',3,1,1,'2016-10-07 10:26:58','2016-10-07 10:26:58'),(24,'select \r\n ti.ID,\r\nt.SCHEMA_ID,\r\n(select value from phpapps.list_databases where id = t.schema_id) as \'TABLE_SCHEMA\',\r\n ti.TABLE_ID,\r\n t.TABLE_NAME,\r\n ti.INDEX_NAME,\r\n ti.INDEX_TYPE_ID,\r\n(select value from phpapps.list_index_types where id = ti.INDEX_TYPE_ID) as INDEX_TYPE,\r\n ti.INDEX_COLUMNS,\r\n(select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE td.ID IN (ti.INDEX_COLUMNS) GROUP BY td.TABLE_ID ) as \'INDEX_COLUMNS_LABELS\',\r\n ti.DESCRIPTION,\r\n ti.MODIFY_UID,\r\n ti.CREATE_UID,\r\n ti.MODIFY_DATE,\r\n ti.CREATE_DATE\r\n from table_indexes ti left join tables t on (ti.table_id = t.id)',3,1,1,'2016-10-07 10:27:17','2016-10-07 10:27:17'),(25,'show tables',7,1,1,'2016-10-07 10:45:18','2016-10-07 10:45:18'),(26,'select \r\n ti.ID,\r\nt.SCHEMA_ID,\r\n(select value from phpapps.list_databases where id = t.schema_id) as \'TABLE_SCHEMA\',\r\n ti.TABLE_ID,\r\n t.TABLE_NAME,\r\n ti.INDEX_NAME,\r\n ti.INDEX_TYPE_ID,\r\n(select value from phpapps.list_index_types where id = ti.INDEX_TYPE_ID) as INDEX_TYPE,\r\n ti.INDEX_COLUMNS,\r\n(select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE td.ID IN (ti.INDEX_COLUMNS) GROUP BY td.TABLE_ID ) as \'INDEX_COLUMNS_LABELS\',\r\n ti.DESCRIPTION,\r\n ti.MODIFY_UID,\r\n ti.CREATE_UID,\r\n ti.MODIFY_DATE,\r\n ti.CREATE_DATE\r\n from table_indexes ti left join tables t on (ti.table_id = t.id)',NULL,1,1,'2016-10-07 10:50:57','2016-10-07 10:50:57'),(46,'select * from sql_console_history',3,1,1,'2016-10-10 13:42:55','2016-10-10 13:42:55'),(47,'show tables',7,1,1,'2016-10-10 13:43:13','2016-10-10 13:43:13'),(48,'show tables',3,1,1,'2016-10-10 13:43:56','2016-10-10 13:43:56'),(49,'select * from  sql_console_history',3,1,1,'2016-10-10 13:44:06','2016-10-10 13:44:06'),(50,'select * from  sql_console_saves',3,1,1,'2016-10-10 13:44:20','2016-10-10 13:44:20'),(51,'show tables',1,1,1,'2016-10-10 13:50:37','2016-10-10 13:50:37'),(52,'desc tables',3,1,1,'2016-10-11 08:57:59','2016-10-11 08:57:59'),(53,'select * from tables',3,1,1,'2016-10-11 09:14:39','2016-10-11 09:14:39'),(54,'show tables',3,1,1,'2016-11-07 09:25:48','2016-11-07 09:25:48'),(55,'select * from queries',3,1,1,'2016-11-07 09:26:06','2016-11-07 09:26:06'),(56,'select * from  views',3,1,1,'2016-11-07 09:33:11','2016-11-07 09:33:11'),(57,'select * from  queries',3,1,1,'2016-11-07 09:34:09','2016-11-07 09:34:09'),(58,'select * from  queries',3,1,1,'2016-11-07 09:34:30','2016-11-07 09:34:30'),(59,'SELECT TABLE_NAME FROM phpapps.tables WHERE MODULE_ID = 1 UNION ALL SELECT VIEW_NAME FROM phpapps.views WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:01:47','2017-02-21 10:01:47'),(60,'SELECT SCHEMA_NAME, TABLE_NAME FROM phpapps.tables WHERE MODULE_ID = 1 UNION ALL SELECT SCHEMA_NAME, VIEW_NAME FROM phpapps.views WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:02:22','2017-02-21 10:02:22'),(61,'SELECT SCHEMA_NAME, TABLE_NAME FROM phpapps.tables WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:02:32','2017-02-21 10:02:32'),(62,'SELECT  TABLE_NAME,* FROM phpapps.tables WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:02:39','2017-02-21 10:02:39'),(63,'SELECT  *,TABLE_NAME FROM phpapps.tables WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:02:47','2017-02-21 10:02:47'),(64,'SELECT  *,TABLE_NAME FROM phpapps.view_tables WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:03:10','2017-02-21 10:03:10'),(65,'show tables',3,1,1,'2017-02-21 10:04:36','2017-02-21 10:04:36'),(66,'select * from views',3,1,1,'2017-02-21 10:04:50','2017-02-21 10:04:50'),(67,'select * from view_tables',3,1,1,'2017-02-21 10:10:22','2017-02-21 10:10:22'),(68,'SELECT ID AS VALUE, USERNAME AS LABEL FROM phpapps.users ORDER BY USERNAME',3,1,1,'2017-02-21 10:46:42','2017-02-21 10:46:42'),(69,'show tables',3,1,1,'2017-02-21 11:01:10','2017-02-21 11:01:10'),(70,'select * from view_tables',3,1,1,'2017-02-21 11:01:27','2017-02-21 11:01:27'),(71,'SELECT COLUMN_NAME AS ID,COLUMN_NAME AS VALUE FROM phpapps.view_table_details WHERE TABLE_ID = 284 ORDER BY ORD',3,1,1,'2017-02-21 12:16:28','2017-02-21 12:16:28'),(72,'SELECT * FROM phpapps.view_table_details WHERE TABLE_ID = 284 ORDER BY ORD',3,1,1,'2017-02-21 12:16:58','2017-02-21 12:16:58'),(73,'SELECT * FROM phpapps.view_table_details',3,1,1,'2017-02-22 07:02:02','2017-02-22 07:02:02'),(74,'SELECT * FROM phpapps.view_tables',3,1,1,'2017-02-22 07:02:15','2017-02-22 07:02:15'),(75,'SELECT TABLE_SCHEMA FROM phpapps.view_tables WHERE TABLE_NAME = \'list_da_nu\' AND ORIGIN_ID = \'0\'',3,1,1,'2017-02-22 07:09:02','2017-02-22 07:09:02'),(76,'SELECT TABLE_SCHEMA FROM phpapps.view_tables WHERE TABLE_NAME = \'list_da_nu\' AND ORIGIN_ID = \'0\'',3,1,1,'2017-02-24 11:15:09','2017-02-24 11:15:09'),(77,'show tables',12,1,1,'2017-02-24 11:15:20','2017-02-24 11:15:20'),(78,'select q.NO,q.CATEG_ID,(SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION,q.ANSWER_1,q.CORRECT_1,q.IMAGE_1,q.ANSWER_2,q.CORRECT_2,q.IMAGE_2,q.ANSWER_3,\r\nq.CORRECT_3,q.IMAGE_3 from questions',12,1,1,'2017-02-24 11:34:27','2017-02-24 11:34:27'),(79,'select q.NO,q.CATEG_ID,(SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION,q.ANSWER_1,q.CORRECT_1,q.IMAGE_1,q.ANSWER_2,q.CORRECT_2,q.IMAGE_2,q.ANSWER_3,\r\nq.CORRECT_3,q.IMAGE_3 from questions q',12,1,1,'2017-02-24 11:34:36','2017-02-24 11:34:36'),(80,'SELECT q.NO, q.CATEG_ID, (SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION, q.ANSWER_1, q.CORRECT_1, q.IMAGE_1, q.ANSWER_2, q.CORRECT_2, q.IMAGE_2, q.ANSWER_3, q.CORRECT_3, q.IMAGE_3 FROM questions q ORDER BY q.CATEG_ID, q.NO',12,1,1,'2017-02-24 11:54:19','2017-02-24 11:54:19'),(81,'SELECT q.NO, q.CATEG_ID, (SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION, q.ANSWER_1, q.CORRECT_1, q.IMAGE_1, q.ANSWER_2, q.CORRECT_2, q.IMAGE_2, q.ANSWER_3, q.CORRECT_3, q.IMAGE_3 FROM questions q ORDER BY q.CATEG_ID, q.NO',12,1,1,'2017-02-24 11:54:22','2017-02-24 11:54:22'),(82,'SELECT q.NO, q.CATEG_ID, (SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION, q.ANSWER_1, q.CORRECT_1, q.IMAGE_1, q.ANSWER_2, q.CORRECT_2, q.IMAGE_2, q.ANSWER_3, q.CORRECT_3, q.IMAGE_3 FROM questions q ORDER BY q.CATEG_ID, q.NO',12,1,1,'2017-02-24 11:54:23','2017-02-24 11:54:23'),(83,'SELECT q.NO, q.CATEG_ID, (SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION, q.ANSWER_1, q.CORRECT_1, q.IMAGE_1, q.ANSWER_2, q.CORRECT_2, q.IMAGE_2, q.ANSWER_3, q.CORRECT_3, q.IMAGE_3 FROM questions q ORDER BY q.CATEG_ID, q.NO',12,1,1,'2017-02-24 11:54:24','2017-02-24 11:54:24'),(84,'SELECT q.NO, q.CATEG_ID, (SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION, q.ANSWER_1, q.CORRECT_1, q.IMAGE_1, q.ANSWER_2, q.CORRECT_2, q.IMAGE_2, q.ANSWER_3, q.CORRECT_3, q.IMAGE_3 FROM questions q ORDER BY q.CATEG_ID, q.NO',12,1,1,'2017-02-24 11:54:25','2017-02-24 11:54:25'),(85,'show tables',12,1,1,'2017-02-28 14:23:51','2017-02-28 14:23:51'),(86,'select * from questions limit 2 order by rand()',12,1,1,'2017-02-28 14:24:45','2017-02-28 14:24:45'),(87,'select * from questions  order by rand() limit 2',12,1,1,'2017-02-28 14:25:08','2017-02-28 14:25:08'),(88,'select * from questions  order by rand() limit 2',12,1,1,'2017-02-28 14:25:12','2017-02-28 14:25:12'),(89,'select * from questions  order by rand() limit 2',12,1,1,'2017-02-28 14:25:14','2017-02-28 14:25:14'),(90,'select * from questions  order by rand() limit 2',12,1,1,'2017-02-28 14:25:16','2017-02-28 14:25:16'),(91,'select * from questions  order by rand() limit 2',12,1,1,'2017-02-28 14:25:18','2017-02-28 14:25:18'),(92,'show tables;',1,1,1,'2017-04-14 06:25:31','2017-04-14 06:25:31'),(93,'show tables',3,1,1,'2017-04-14 06:25:46','2017-04-14 06:25:46'),(94,'select * from view_scripts',3,1,1,'2017-04-14 06:26:03','2017-04-14 06:26:03'),(95,'select * from scripts',3,1,1,'2017-04-14 06:26:45','2017-04-14 06:26:45'),(96,'show tables',3,1,1,'2017-04-14 06:27:03','2017-04-14 06:27:03'),(97,'show tables',3,1,1,'2017-04-14 06:29:51','2017-04-14 06:29:51'),(98,'select * from view_scripts',3,1,1,'2017-04-20 09:12:36','2017-04-20 09:12:36'),(99,'select * from scripts',3,1,1,'2017-04-20 12:43:48','2017-04-20 12:43:48'),(100,'select * from view_scripts',3,1,1,'2017-04-20 12:45:48','2017-04-20 12:45:48'),(101,'select * from scripts',3,1,1,'2017-04-20 12:46:04','2017-04-20 12:46:04'),(102,'select * from scripts',3,1,1,'2017-04-20 12:46:51','2017-04-20 12:46:51'),(103,'select * from scripts',3,1,1,'2017-04-20 12:48:03','2017-04-20 12:48:03'),(104,'select * from scripts',3,1,1,'2017-04-20 12:48:21','2017-04-20 12:48:21'),(105,'select * from scripts',3,1,1,'2017-04-20 12:56:21','2017-04-20 12:56:21'),(106,'select * from scripts',3,1,1,'2017-04-20 13:01:53','2017-04-20 13:01:53'),(107,'select * from scripts',3,1,1,'2017-04-20 13:01:59','2017-04-20 13:01:59'),(108,'select * from scripts',3,1,1,'2017-04-20 13:03:54','2017-04-20 13:03:54'),(109,'select * from scripts',3,1,1,'2017-04-20 13:05:38','2017-04-20 13:05:38'),(110,'select * from scripts',3,1,1,'2017-04-20 13:05:54','2017-04-20 13:05:54'),(111,'select * from scripts',3,1,1,'2017-04-20 13:09:18','2017-04-20 13:09:18'),(112,'select * from scripts',3,1,1,'2017-04-20 13:17:24','2017-04-20 13:17:24'),(113,'select * from scripts',3,1,1,'2017-04-20 13:18:45','2017-04-20 13:18:45'),(114,'select * from scripts',3,1,1,'2017-04-20 13:22:04','2017-04-20 13:22:04'),(115,'show tables;',17,1,1,'2017-08-06 11:01:30','2017-08-06 11:01:30'),(116,'show tables',3,1,1,'2017-08-06 11:01:50','2017-08-06 11:01:50'),(117,'select * from view_tables',3,1,1,'2017-08-06 11:02:09','2017-08-06 11:02:09'),(118,'show tables',3,1,1,'2017-08-06 11:22:35','2017-08-06 11:22:35'),(119,'select * from view_table_fks',3,1,1,'2017-08-06 11:22:52','2017-08-06 11:22:52'),(120,'select * from view_table_indexes',3,1,1,'2017-08-06 11:24:02','2017-08-06 11:24:02'),(121,'show tables',3,1,1,'2017-09-07 07:36:06','2017-09-07 07:36:06'),(122,'select * from  list_databases',3,1,1,'2017-09-07 07:36:46','2017-09-07 07:36:46'),(123,'select * from  queries',3,1,1,'2017-09-07 07:59:24','2017-09-07 07:59:24'),(124,'desc  queries',3,1,1,'2017-09-07 07:59:30','2017-09-07 07:59:30'),(125,'select * from queries',3,1,1,'2017-09-20 08:23:37','2017-09-20 08:23:37'),(126,'select * from forms',3,1,1,'2017-09-20 08:29:02','2017-09-20 08:29:02'),(127,'show tables',3,1,1,'2017-09-20 09:23:00','2017-09-20 09:23:00'),(128,'show tables',3,1,1,'2017-09-22 06:21:19','2017-09-22 06:21:19'),(129,'select * from test_import',3,1,1,'2017-09-22 06:21:30','2017-09-22 06:21:30'),(130,'select * from test_import',3,1,1,'2017-09-22 06:23:30','2017-09-22 06:23:30'),(131,'select * from test_import',3,1,1,'2017-09-22 06:27:51','2017-09-22 06:27:51'),(132,'select * from test_import',3,1,1,'2017-09-22 06:28:14','2017-09-22 06:28:14'),(133,'select * from test_import',3,1,1,'2017-09-22 07:33:05','2017-09-22 07:33:05'),(134,'select * from test_import',3,1,1,'2017-09-22 07:39:21','2017-09-22 07:39:21'),(135,'select * from test_import',3,1,1,'2017-09-22 08:20:20','2017-09-22 08:20:20'),(136,'show tables',3,1,1,'2017-09-25 09:26:59','2017-09-25 09:26:59'),(137,'select * from view_table_details',3,1,1,'2017-09-25 09:27:14','2017-09-25 09:27:14'),(138,'select * from view_table_details where table_id = \'292\'',3,1,1,'2017-09-25 09:27:38','2017-09-25 09:27:38'),(139,'show tables;',3,1,1,'2017-09-25 09:27:56','2017-09-25 09:27:56'),(140,'select * from view_table_details where table_id = \'292\'',3,1,1,'2017-09-25 09:28:29','2017-09-25 09:28:29'),(141,'select * from view_table_details where table_id = \'292\' order by ord',3,1,1,'2017-09-25 09:29:17','2017-09-25 09:29:17'),(142,'select id,COLUMN_NAME, ord from view_table_details where table_id = \'292\' order by ord',3,1,1,'2017-09-25 09:29:40','2017-09-25 09:29:40'),(143,'select id,COLUMN_NAME, ord from view_table_details where table_id = \'292\' order by ord',3,1,1,'2017-09-25 09:30:36','2017-09-25 09:30:36'),(144,'select * from form_details where form_id not in (select id from forms)',3,1,1,'2017-09-25 09:49:57','2017-09-25 09:49:57'),(145,'select * from form_details',3,1,1,'2017-09-25 09:51:13','2017-09-25 09:51:13'),(146,'select * from forms',3,1,1,'2017-09-25 09:51:22','2017-09-25 09:51:22'),(147,'select * from forms',3,1,1,'2017-09-25 09:53:15','2017-09-25 09:53:15'),(148,'select * from view_forms',3,1,1,'2017-09-25 12:30:07','2017-09-25 12:30:07'),(149,'show tables',17,1,1,'2017-10-03 12:00:43','2017-10-03 12:00:43'),(150,'select * from  forum_categories',17,1,1,'2017-10-03 12:00:57','2017-10-03 12:00:57'),(151,'select * from  forum_categories order by pid',17,1,1,'2017-10-03 12:01:12','2017-10-03 12:01:12'),(152,'select * from  forum_categories order by pid',17,1,1,'2017-10-03 12:01:14','2017-10-03 12:01:14'),(153,'select * from  forum_categories left join forum_categories on id = pid order by pid',17,1,1,'2017-10-03 12:01:57','2017-10-03 12:01:57'),(154,'select * from  forum_categories left join forum_categories on forum_categories.id = forum_categories.pid order by pid',17,1,1,'2017-10-03 12:02:12','2017-10-03 12:02:12'),(155,'select name, (select name from forum_categories where id = pid) as pname  from  forum_categories',17,1,1,'2017-10-03 12:03:23','2017-10-03 12:03:23'),(156,'select a.name, (select name from forum_categories b where b.id = a.pid) as pname  from  forum_categories a',17,1,1,'2017-10-03 12:03:55','2017-10-03 12:03:55'),(157,'select a.id,a.pid, a.name, (select name from forum_categories b where b.id = a.pid) as pname  from  forum_categories a',17,1,1,'2017-10-03 12:04:20','2017-10-03 12:04:20'),(158,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a',17,1,1,'2017-10-03 12:04:53','2017-10-03 12:04:53'),(159,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a\r\norder by id+pid',17,1,1,'2017-10-03 12:05:25','2017-10-03 12:05:25'),(160,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a\r\norder by id+pid',17,1,1,'2017-10-03 12:05:27','2017-10-03 12:05:27'),(161,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a\r\norder by id+pid',17,1,1,'2017-10-03 12:05:27','2017-10-03 12:05:27'),(162,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a\r\norder by id+pid desc',17,1,1,'2017-10-03 12:05:39','2017-10-03 12:05:39'),(163,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a',17,1,1,'2017-10-03 12:05:48','2017-10-03 12:05:48'),(164,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a order by id,pid',17,1,1,'2017-10-03 12:13:09','2017-10-03 12:13:09'),(165,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a order by id,pid',17,1,1,'2017-10-03 12:13:11','2017-10-03 12:13:11'),(166,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a order by id,pid',17,1,1,'2017-10-03 12:13:12','2017-10-03 12:13:12'),(167,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a order by pid,id',17,1,1,'2017-10-03 12:13:17','2017-10-03 12:13:17'),(168,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a order by pid,id',17,1,1,'2017-10-03 12:13:19','2017-10-03 12:13:19'),(169,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a order by pid',17,1,1,'2017-10-03 12:13:24','2017-10-03 12:13:24'),(170,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a order by pid',17,1,1,'2017-10-03 12:13:25','2017-10-03 12:13:25'),(171,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name from  forum_categories a order by pid,id',17,1,1,'2017-10-03 12:13:30','2017-10-03 12:13:30'),(172,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a order by concat(pid,id)',17,1,1,'2017-10-03 12:13:44','2017-10-03 12:13:44'),(173,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a order by concat(pid,id)',17,1,1,'2017-10-03 12:13:45','2017-10-03 12:13:45'),(174,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a order by concat(pid,id)',17,1,1,'2017-10-03 12:13:46','2017-10-03 12:13:46'),(175,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a order by concat(pid,id)',17,1,1,'2017-10-03 12:13:47','2017-10-03 12:13:47'),(176,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a order by concat(pid,id)',17,1,1,'2017-10-03 12:13:47','2017-10-03 12:13:47'),(177,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a order by concat(id,pid)',17,1,1,'2017-10-03 12:13:57','2017-10-03 12:13:57'),(178,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a order by concat(id,pid) desc',17,1,1,'2017-10-03 12:14:09','2017-10-03 12:14:09'),(179,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a order by concat(id,pid),pid desc',17,1,1,'2017-10-03 12:14:23','2017-10-03 12:14:23'),(180,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a order by concat(id,pid),id desc',17,1,1,'2017-10-03 12:14:28','2017-10-03 12:14:28'),(181,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a order by concat(id,pid),id desc',17,1,1,'2017-10-03 12:14:29','2017-10-03 12:14:29'),(182,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a order by concat(id,pid) desc',17,1,1,'2017-10-03 12:14:33','2017-10-03 12:14:33'),(183,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a where pid <> 0 order by concat(id,pid) desc',17,1,1,'2017-10-03 12:14:53','2017-10-03 12:14:53'),(184,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a where pid <> 0 order by concat(pid,id) desc',17,1,1,'2017-10-03 12:15:11','2017-10-03 12:15:11'),(185,'select a.id,a.pid,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a where pid <> 0 order by concat(pid,id)',17,1,1,'2017-10-03 12:15:16','2017-10-03 12:15:16'),(186,'select a.pid,a.id,  (select name from forum_categories b where b.id = a.pid) as pname, a.name \r\nfrom  forum_categories a where pid <> 0 order by concat(pid,id)',17,1,1,'2017-10-03 12:15:28','2017-10-03 12:15:28'),(187,'SELECT a.PID,a.ID,  (SELECT NAME from atsepa.forum_categories b WHERE b.ID = a.PID) as P_NAME, a.NAME\r\nFROM  atsepa.forum_categories a WHERE PID <> 0 ORDER BY CONCAT(PID,ID)',17,1,1,'2017-10-03 12:18:41','2017-10-03 12:18:41'),(188,'select * from articles',17,1,1,'2017-10-05 10:42:38','2017-10-05 10:42:38'),(189,'select * from articles',17,1,1,'2017-10-05 10:42:55','2017-10-05 10:42:55'),(190,'select * from app_users',17,1,1,'2017-10-05 10:43:19','2017-10-05 10:43:19'),(191,'select * from app_users',17,1,1,'2017-10-06 12:32:11','2017-10-06 12:32:11'),(192,'show tables',17,1,1,'2017-10-06 15:54:50','2017-10-06 15:54:50'),(193,'select * from articles',17,1,1,'2017-10-06 15:55:14','2017-10-06 15:55:14'),(194,'select * from articles',17,1,1,'2017-10-06 16:02:44','2017-10-06 16:02:44'),(195,'SELECT COLUMN_NAME AS ID,COLUMN_NAME AS VALUE FROM phpapps.view_table_details WHERE TABLE_ID = 292',17,1,1,'2017-10-06 16:14:54','2017-10-06 16:14:54'),(196,'select * from articles',17,1,1,'2017-10-06 16:16:27','2017-10-06 16:16:27'),(197,'show tables',17,1,1,'2017-10-07 05:12:33','2017-10-07 05:12:33'),(198,'select * from articles',17,1,1,'2017-10-07 05:12:47','2017-10-07 05:12:47'),(199,'SELECT a.ID, a.NAME,a.INTRO,CONCAT(SUBSTR(a.BODY,1,200),\"...\") AS BODY,a.IMAGE, a.ARTICLE_DATE from articles',17,1,1,'2017-10-07 05:32:01','2017-10-07 05:32:01'),(200,'SELECT a.ID, a.NAME,a.INTRO,CONCAT(SUBSTR(a.BODY,1,200),\"...\") AS BODY,a.IMAGE, a.ARTICLE_DATE from articles a',17,1,1,'2017-10-07 05:32:07','2017-10-07 05:32:07'),(201,'SELECT a.ID, a.NAME,a.INTRO,CONCAT(SUBSTR(a.BODY,1,200),\"...\") AS BODY,a.IMAGE, a.ARTICLE_DATE,a.* from articles a',17,1,1,'2017-10-07 05:32:18','2017-10-07 05:32:18'),(202,'show tables',17,1,1,'2017-10-07 05:33:14','2017-10-07 05:33:14'),(203,'select * from list_article_categories',17,1,1,'2017-10-07 05:33:44','2017-10-07 05:33:44'),(204,'SELECT a.ID, a.NAME,a.INTRO,CONCAT(SUBSTR(a.BODY,1,200),\"...\") AS BODY,a.IMAGE, a.ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME \r\nfrom articles a',17,1,1,'2017-10-07 05:34:51','2017-10-07 05:34:51'),(205,'select * from app_users',17,1,1,'2017-10-07 05:35:10','2017-10-07 05:35:10'),(206,'SELECT a.ID, a.NAME,a.INTRO,CONCAT(SUBSTR(a.BODY,1,200),\"...\") AS BODY,a.IMAGE, a.ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 05:36:43','2017-10-07 05:36:43'),(207,'desc articles',17,1,1,'2017-10-07 05:37:19','2017-10-07 05:37:19'),(208,'SELECT a.ID, a.NAME,a.INTRO,CONCAT(SUBSTR(a.BODY,1,200),\"...\") AS SHORT_BODY,a.BODY,a.IMAGE, a.ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 05:39:27','2017-10-07 05:39:27'),(209,'SELECT a.ID, a.NAME,a.INTRO,CONCAT(SUBSTR(a.BODY,1,200),\"...\") AS SHORT_BODY,a.BODY,a.IMAGE, a.ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 05:40:23','2017-10-07 05:40:23'),(210,'CREATE VIEW view_articles AS SELECT a.ID, a.NAME,a.INTRO,CONCAT(SUBSTR(a.BODY,1,200),\"...\") AS SHORT_BODY,a.BODY,a.IMAGE, a.ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 05:40:43','2017-10-07 05:40:43'),(211,'select * from view_articles',17,1,1,'2017-10-07 05:41:06','2017-10-07 05:41:06'),(212,'drop VIEW view_articles',17,1,1,'2017-10-07 05:50:38','2017-10-07 05:50:38'),(213,'CREATE VIEW view_articles AS SELECT a.ID, a.NAME,a.INTRO,CONCAT(SUBSTR(a.BODY,1,200),\"...\") AS SHORT_BODY,a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 05:51:17','2017-10-07 05:51:17'),(214,'select * from  view_articles',17,1,1,'2017-10-07 05:51:27','2017-10-07 05:51:27'),(215,'drop view  view_articles',17,1,1,'2017-10-07 05:57:03','2017-10-07 05:57:03'),(216,'CREATE VIEW view_articles AS SELECT a.ID, a.NAME,a.INTRO,CONCAT(SUBSTR(a.BODY,1,255),\"...\") AS SHORT_BODY,a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 05:57:06','2017-10-07 05:57:06'),(217,'drop view  view_articles',17,1,1,'2017-10-07 05:58:28','2017-10-07 05:58:28'),(218,'CREATE VIEW view_articles AS SELECT a.ID, a.NAME,IF(a.INTRO =\'\',SUBSTR(a.BODY,1,255),a.INTRO) AS INTRO , a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 05:58:30','2017-10-07 05:58:30'),(219,'select * from view_articles',17,1,1,'2017-10-07 05:59:16','2017-10-07 05:59:16'),(220,'CREATE VIEW view_articles AS SELECT a.ID, a.NAME,IF(a.INTRO = \"\",SUBSTR(a.BODY,1,255),a.INTRO) AS INTRO , a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 05:59:41','2017-10-07 05:59:41'),(221,'drop view  view_articles',17,1,1,'2017-10-07 05:59:47','2017-10-07 05:59:47'),(222,'CREATE VIEW view_articles AS SELECT a.ID, a.NAME,IF(a.INTRO = \"\",SUBSTR(a.BODY,1,255),a.INTRO) AS INTRO , a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 05:59:49','2017-10-07 05:59:49'),(223,'select * from view_articles',17,1,1,'2017-10-07 05:59:52','2017-10-07 05:59:52'),(224,'SELECT a.ID, a.NAME,IF(a.INTRO = \"\",SUBSTR(a.BODY,1,255),a.INTRO) AS INTRO , a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 06:00:50','2017-10-07 06:00:50'),(225,'SELECT a.ID, a.NAME,IF(a.INTRO == \"\",SUBSTR(a.BODY,1,255),a.INTRO) AS INTRO , a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 06:01:09','2017-10-07 06:01:09'),(226,'SELECT a.ID, a.NAME,IF(a.INTRO = \"\",SUBSTR(a.BODY,1,255),a.INTRO) AS INTRO , a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 06:01:16','2017-10-07 06:01:16'),(227,'SELECT a.ID, a.NAME,IF(a.INTRO <> \"\",SUBSTR(a.BODY,1,255),a.INTRO) AS INTRO , a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 06:02:30','2017-10-07 06:02:30'),(228,'SELECT a.ID, a.NAME,IF(a.INTRO <> \"\",a.INTRO,SUBSTR(a.BODY,1,255)) AS INTRO , a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 06:02:42','2017-10-07 06:02:42'),(229,'drop view  view_articles',17,1,1,'2017-10-07 06:03:04','2017-10-07 06:03:04'),(230,'create view view_articles as SELECT a.ID, a.NAME,IF(a.INTRO <> \"\",a.INTRO,SUBSTR(a.BODY,1,255)) AS INTRO , a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID)',17,1,1,'2017-10-07 06:03:06','2017-10-07 06:03:06'),(231,'select * from view_articles',17,1,1,'2017-10-07 06:06:43','2017-10-07 06:06:43'),(232,'drop view  view_articles',17,1,1,'2017-10-07 06:27:47','2017-10-07 06:27:47'),(233,'create view view_articles as SELECT a.ID, a.NAME,IF(a.INTRO <> \"\",a.INTRO,SUBSTR(a.BODY,1,255)) AS INTRO , a.BODY,a.IMAGE, DATE_FORMAT(a.ARTICLE_DATE,\"%d/%m/%Y\") AS ARTICLE_DATE,(SELECT VALUE FROM atsepa.list_article_categories WHERE atsepa.list_article_categories.ID = a.CATEG_ID) AS CATEG_NAME,\r\nu.LAST_NAME,u.FIRST_NAME,u.USERNAME\r\nfrom articles a LEFT JOIN app_users u ON (a.USER_ID = u.ID) ORDER BY a.ARTICLE_DATE DESC',17,1,1,'2017-10-07 06:27:49','2017-10-07 06:27:49'),(234,'SELECT NAME,INTRO,CATEG_NAME,USERNAME,ARTICLE_DATE,IMAGE,FIRST_NAME,LAST_NAME,IDFROM atsepa.view_articles WHERE ID =21',17,1,1,'2017-10-07 07:21:15','2017-10-07 07:21:15'),(235,'select * from app_users',17,1,1,'2017-10-07 08:04:26','2017-10-07 08:04:26'),(236,'SELECT \r\n                                a.PID,\r\n                                a.ID,  \r\n                                (SELECT NAME from atsepa.forum_categories b WHERE b.ID = a.PID) as P_NAME, \r\n                                a.NAME\r\n                            FROM  atsepa.forum_categories a \r\n                            WHERE PID <> 0 \r\n                            ORDER BY CONCAT(PID,ID)',17,1,1,'2017-10-09 09:25:32','2017-10-09 09:25:32'),(237,'SELECT ID,PID,NAME,\"\r\n                    . \"(SELECT COUNT(*) FROM atsepa.topics WHERE CAT_ID = ID ) AS NO_TOPICS\"\r\n                    . \"from atsepa.forum_categories',17,1,1,'2017-10-09 11:03:10','2017-10-09 11:03:10'),(238,'SELECT ID,PID,NAME,(SELECT COUNT(*) FROM atsepa.topics WHERE CAT_ID = ID ) AS NO_TOPICS from atsepa.forum_categories',17,1,1,'2017-10-09 11:03:23','2017-10-09 11:03:23'),(239,'SELECT ID,PID,NAME,(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = atsepa.forum_categories.ID ) AS NO_TOPICS from atsepa.forum_categories',17,1,1,'2017-10-09 11:03:54','2017-10-09 11:03:54'),(240,'SELECT ID,PID,NAME,(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = atsepa.forum_categories.ID ) AS NO_TOPICSfrom atsepa.forum_categories WHERE PID =6',17,1,1,'2017-10-09 11:05:40','2017-10-09 11:05:40'),(241,'SELECT ID, SUBJECT, DESCRIPTION, TOPIC_DATE FROM atsepa.topics WHERE atsepa.topics.CAT_ID =8',17,1,1,'2017-10-09 12:15:16','2017-10-09 12:15:16'),(242,'SELECT ID, POST_DATE, TOPIC_ID, USER_ID, CONTENT,\r\n (SELECT USERNAME FROM atsepa.app_users WHERE atsepa.app_users.ID = atsepa.posts.USER_ID ) AS USERNAME,\r\n (SELECT SUBJECT FROM atsepa.topics WHERE atsepa.topics.ID = 2) AS SUBJECTFROM atsepa.posts WHERE TOPIC_ID = 2',17,1,1,'2017-10-09 12:53:49','2017-10-09 12:53:49'),(243,'SELECT ID, POST_DATE, TOPIC_ID, USER_ID, CONTENT,\r\n (SELECT USERNAME FROM atsepa.app_users WHERE atsepa.app_users.ID = atsepa.posts.USER_ID ) AS USERNAME,\r\n (SELECT SUBJECT FROM atsepa.topics WHERE atsepa.topics.ID = 2) AS SUBJECT FROM atsepa.posts WHERE TOPIC_ID = 2',17,1,1,'2017-10-09 12:53:56','2017-10-09 12:53:56'),(244,'select * from atsepa.posts p LEFT JOIN atsepa.app_users u ON (p.USER_ID = u.ID), \r\nLEFT JOIN atsepa.topics t ON ( p.CAT_ID = t.ID)',17,1,1,'2017-10-09 12:56:30','2017-10-09 12:56:30'),(245,'select * from atsepa.posts p LEFT JOIN atsepa.app_users u ON (p.USER_ID = u.ID) \r\nLEFT JOIN atsepa.topics t ON ( p.CAT_ID = t.ID)',17,1,1,'2017-10-09 12:56:42','2017-10-09 12:56:42'),(246,'select * from atsepa.posts p LEFT JOIN atsepa.app_users u ON (p.USER_ID = u.ID) \r\nLEFT JOIN atsepa.topics t ON ( p.CATEG_ID = t.ID)',17,1,1,'2017-10-09 12:56:48','2017-10-09 12:56:48'),(247,'select * from atsepa.posts p LEFT JOIN atsepa.app_users u ON (p.USER_ID = u.ID) \r\nLEFT JOIN atsepa.topics t ON ( p.TOPIC_ID = t.ID)',17,1,1,'2017-10-09 12:57:02','2017-10-09 12:57:02'),(248,'select * from  sql_console_saves',3,1,1,'2017-10-09 13:09:02','2017-10-09 13:09:02'),(249,'select * from  sql_console_history',3,1,1,'2017-10-09 13:09:18','2017-10-09 13:09:18'),(250,'SELECT ID, POST_DATE, TOPIC_ID, USER_ID, CONTENT,\r\n(SELECT USERNAME FROM atsepa.app_users WHERE atsepa.app_users.ID = atsepa.posts.USER_ID ) AS USERNAME,\r\n(SELECT SUBJECT FROM atsepa.topics WHERE atsepa.topics.ID = 5) AS SUBJECT \r\nFROM atsepa.posts WHERE TOPIC_ID = 5',1,1,1,'2017-10-10 08:41:25','2017-10-10 08:41:25'),(251,'SELECT ID, POST_DATE, TOPIC_ID, USER_ID, CONTENT,\r\n(SELECT USERNAME FROM atsepa.app_users WHERE atsepa.app_users.ID = atsepa.posts.USER_ID ) AS USERNAME,\r\n(SELECT SUBJECT FROM atsepa.topics WHERE atsepa.topics.ID = 2) AS SUBJECT \r\nFROM atsepa.posts WHERE TOPIC_ID = 2',1,1,1,'2017-10-10 08:52:09','2017-10-10 08:52:09'),(252,'select (select NAME from atsepa.forum_categories where PID = ID) PARENT_NAME,NAME from atsepa.forum_categories',17,1,1,'2017-10-10 11:24:34','2017-10-10 11:24:34'),(253,'select (select NAME from atsepa.forum_categories b where b.PID = a.ID) PARENT_NAME,NAME from atsepa.forum_categories a',17,1,1,'2017-10-10 11:24:59','2017-10-10 11:24:59'),(254,'select (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME from atsepa.forum_categories a',17,1,1,'2017-10-10 11:25:15','2017-10-10 11:25:15'),(255,'select (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME from atsepa.forum_categories a WHERE ID <> 0',17,1,1,'2017-10-10 11:26:03','2017-10-10 11:26:03'),(256,'select (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME from atsepa.forum_categories a WHERE ID <> 0\r\nORDER BY CONCAT(PID,ID)',17,1,1,'2017-10-10 11:26:39','2017-10-10 11:26:39'),(257,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME from atsepa.forum_categories a WHERE ID <> 0\r\nORDER BY CONCAT(PID,ID)',17,1,1,'2017-10-10 11:26:53','2017-10-10 11:26:53'),(258,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME from atsepa.forum_categories a WHERE ID <> 0\r\nORDER BY CONCAT(PID,\'-\',ID)',17,1,1,'2017-10-10 11:27:20','2017-10-10 11:27:20'),(259,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME from atsepa.forum_categories a WHERE ID <> 0\r\nORDER BY PID,ID',17,1,1,'2017-10-10 11:27:34','2017-10-10 11:27:34'),(260,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME from atsepa.forum_categories a WHERE ID <> 0\r\nORDER BY ID,PID',17,1,1,'2017-10-10 11:27:40','2017-10-10 11:27:40'),(261,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME from atsepa.forum_categories a WHERE ID <> 0\r\nORDER BY CONCAT(ID,PID)',17,1,1,'2017-10-10 11:27:50','2017-10-10 11:27:50'),(262,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME from atsepa.forum_categories a WHERE ID <> 0',17,1,1,'2017-10-10 11:28:22','2017-10-10 11:28:22'),(263,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY ID DESC',17,1,1,'2017-10-10 11:29:21','2017-10-10 11:29:21'),(264,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY ID,PID',17,1,1,'2017-10-10 11:29:38','2017-10-10 11:29:38'),(265,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY PID,ID',17,1,1,'2017-10-10 11:29:52','2017-10-10 11:29:52'),(266,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY PID,ID',17,1,1,'2017-10-10 11:29:53','2017-10-10 11:29:53'),(267,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY NAME,PARENT_NAME',17,1,1,'2017-10-10 11:30:25','2017-10-10 11:30:25'),(268,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY CONCAT(NAME,PARENT_NAME)',17,1,1,'2017-10-10 11:30:40','2017-10-10 11:30:40'),(269,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY CONCAT(PARENT_NAME,NAME)',17,1,1,'2017-10-10 11:30:53','2017-10-10 11:30:53'),(270,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY CONCAT(PARENT_NAME,NAME),NAME',17,1,1,'2017-10-10 11:31:11','2017-10-10 11:31:11'),(271,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY CONCAT(PARENT_NAME,NAME),NAME',17,1,1,'2017-10-10 11:31:12','2017-10-10 11:31:12'),(272,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY CONCAT(PARENT_NAME,NAME),PARENT_NAME',17,1,1,'2017-10-10 11:32:44','2017-10-10 11:32:44'),(273,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY PARENT_NAME, CONCAT(PARENT_NAME,NAME)',17,1,1,'2017-10-10 11:32:52','2017-10-10 11:32:52'),(274,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY PARENT_NAME, CONCAT(PARENT_NAME,NAME)',17,1,1,'2017-10-10 11:32:53','2017-10-10 11:32:53'),(275,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY NAME, CONCAT(PARENT_NAME,NAME)',17,1,1,'2017-10-10 11:33:10','2017-10-10 11:33:10'),(276,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY  CONCAT(NAME,PARENT_NAME,NAME)',17,1,1,'2017-10-10 11:33:25','2017-10-10 11:33:25'),(277,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE ID <> 0 ORDER BY  CONCAT(NAME,PARENT_NAME,NAME)',17,1,1,'2017-10-10 11:33:28','2017-10-10 11:33:28'),(278,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(NAME,PARENT_NAME,NAME)',17,1,1,'2017-10-10 11:33:54','2017-10-10 11:33:54'),(279,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(NAME,PARENT_NAME)',17,1,1,'2017-10-10 11:34:02','2017-10-10 11:34:02'),(280,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(NAME,PARENT_NAME)',17,1,1,'2017-10-10 11:34:03','2017-10-10 11:34:03'),(281,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME \r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(NAME,PARENT_NAME)',17,1,1,'2017-10-10 11:34:04','2017-10-10 11:34:04'),(282,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME,\r\n(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = atsepa.forum_categories.ID ) AS NO_TOPICS\r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(NAME,PARENT_NAME)',17,1,1,'2017-10-10 11:35:32','2017-10-10 11:35:32'),(283,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME,\r\n(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_TOPICS\r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(NAME,PARENT_NAME)',17,1,1,'2017-10-10 11:35:51','2017-10-10 11:35:51'),(284,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME,\r\n(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_TOPICS\r\n	(SELECT COUNT(*) FROM atsepa.posts LEFT JOIN atsepa.topics ON (atsepa.posts.TOPIC_ID = atsepa.topics.ID)  \r\n WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_POSTS\r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(NAME,PARENT_NAME)',17,1,1,'2017-10-10 11:36:42','2017-10-10 11:36:42'),(285,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME,\r\n(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_TOPICS,\r\n	(SELECT COUNT(*) FROM atsepa.posts LEFT JOIN atsepa.topics ON (atsepa.posts.TOPIC_ID = atsepa.topics.ID)  \r\n WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_POSTS\r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(NAME,PARENT_NAME)',17,1,1,'2017-10-10 11:37:06','2017-10-10 11:37:06'),(286,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME,\r\n(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_TOPICS,\r\n	(SELECT COUNT(*) FROM atsepa.posts LEFT JOIN atsepa.topics ON (atsepa.posts.TOPIC_ID = atsepa.topics.ID)  \r\n WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_POSTS\r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(NAME,PARENT_NAME)',17,1,1,'2017-10-10 12:24:56','2017-10-10 12:24:56'),(287,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME,\r\n(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_TOPICS,\r\n	(SELECT COUNT(*) FROM atsepa.posts LEFT JOIN atsepa.topics ON (atsepa.posts.TOPIC_ID = atsepa.topics.ID)  \r\n WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_POSTS\r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(PARENT_NAME,NAME)',17,1,1,'2017-10-10 12:25:16','2017-10-10 12:25:16'),(288,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME,\r\n(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_TOPICS,\r\n	(SELECT COUNT(*) FROM atsepa.posts LEFT JOIN atsepa.topics ON (atsepa.posts.TOPIC_ID = atsepa.topics.ID)  \r\n WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_POSTS\r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(PARENT_NAME,NAME)',17,1,1,'2017-10-10 12:27:38','2017-10-10 12:27:38'),(289,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME,\r\n(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_TOPICS,\r\n	(SELECT COUNT(*) FROM atsepa.posts LEFT JOIN atsepa.topics ON (atsepa.posts.TOPIC_ID = atsepa.topics.ID)  \r\n WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_POSTS\r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(PARENT_NAME,NAME)',17,1,1,'2017-10-10 12:28:23','2017-10-10 12:28:23'),(290,'select ID, PID, (select NAME from atsepa.forum_categories b where b.ID = a.PID) PARENT_NAME,NAME,\r\n(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_TOPICS,\r\n	(SELECT COUNT(*) FROM atsepa.posts LEFT JOIN atsepa.topics ON (atsepa.posts.TOPIC_ID = atsepa.topics.ID)  \r\n WHERE atsepa.topics.CAT_ID = a.ID ) AS NO_POSTS\r\nfrom atsepa.forum_categories a WHERE PID <> 0 ORDER BY  CONCAT(PARENT_NAME,NAME)',17,1,1,'2017-10-10 12:31:56','2017-10-10 12:31:56'),(291,'select * from topics',17,1,1,'2017-10-11 06:23:57','2017-10-11 06:23:57'),(292,'SELECT t.ID, t.SUBJECT,t.DESCRIPTION, t.TOPIC_DATE,t.CAT_ID,c.NAME,u.USERNAME FROM atsepa.topics t left join \r\natsepa.forum_categories c ON (t.CAT_ID = c.ID) left join atsepa.app_users u on (t.USER_ID = u.ID)',17,1,1,'2017-10-11 06:34:02','2017-10-11 06:34:02'),(293,'SELECT t.ID, t.SUBJECT,t.DESCRIPTION, t.TOPIC_DATE,t.CAT_ID,c.NAME,u.USERNAME,\r\n( SELECT COUNT(*) AS NO_POSTS FROM atsepa.posts p WHERE p.TOPIC_ID = t.ID ) AS NO_POSTS\r\n FROM atsepa.topics t left join \r\natsepa.forum_categories c ON (t.CAT_ID = c.ID) left join atsepa.app_users u on (t.USER_ID = u.ID)',17,1,1,'2017-10-11 06:37:15','2017-10-11 06:37:15'),(294,'SELECT * FROM atsepa.posts',17,1,1,'2017-10-11 07:17:01','2017-10-11 07:17:01'),(295,'SELECT p.ID,p.POST_DATE,p.TOPIC_ID,p.USER_ID,p.CONTENT,t.SUBJECT, u.USERNAME FROM \r\natsepa.posts p left join atsepa.topics t on (p.TOPIC_ID = t.ID) \r\nleft join atsepa.app_users u on (p.USER_ID = u.ID)',17,1,1,'2017-10-11 07:23:39','2017-10-11 07:23:39'),(296,'SELECT p.ID,p.POST_DATE,p.TOPIC_ID,p.USER_ID,p.CONTENT,t.SUBJECT, u.USERNAME , c.NAME FROM \r\natsepa.posts p left join atsepa.topics t on (p.TOPIC_ID = t.ID) \r\nleft join atsepa.app_users u on (p.USER_ID = u.ID)\r\nleft join atsepa.forum_categories c on (t.CATEG_ID = c.ID)',17,1,1,'2017-10-11 07:24:28','2017-10-11 07:24:28'),(297,'SELECT p.ID,p.POST_DATE,p.TOPIC_ID,p.USER_ID,p.CONTENT,t.SUBJECT, u.USERNAME , c.NAME FROM \r\natsepa.posts p left join atsepa.topics t on (p.TOPIC_ID = t.ID) \r\nleft join atsepa.app_users u on (p.USER_ID = u.ID)\r\nleft join atsepa.forum_categories c on (t.CAT_ID = c.ID)',17,1,1,'2017-10-11 07:24:33','2017-10-11 07:24:33'),(298,'SELECT p.ID,p.POST_DATE,p.TOPIC_ID,p.USER_ID,p.CONTENT,t.SUBJECT, u.USERNAME , c.NAME FROM \r\natsepa.posts p left join atsepa.topics t on (p.TOPIC_ID = t.ID) \r\nleft join atsepa.app_users u on (p.USER_ID = u.ID)\r\nleft join atsepa.forum_categories c on (t.CAT_ID = c.ID)',17,1,1,'2017-10-11 07:32:35','2017-10-11 07:32:35'),(299,'SHOW CREATE VIEW atsepa.view_articles',3,1,1,'2017-10-13 07:46:46','2017-10-13 07:46:46'),(300,'show tables',3,1,1,'2018-03-30 05:07:42','2018-03-30 05:07:42'),(301,'show tables',3,1,1,'2018-10-23 06:00:03','2018-10-23 06:00:03'),(302,'desc test_5',3,1,1,'2018-10-23 06:00:20','2018-10-23 06:00:20'),(303,'desc INFORMATION_SCHEMA.COLUMNS',10,1,1,'2018-10-23 08:49:09','2018-10-23 08:49:09'),(304,'select * from  INFORMATION_SCHEMA.COLUMNS where WHERE table_name = \'test_5\'',10,1,1,'2018-10-23 08:49:58','2018-10-23 08:49:58'),(305,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_5\'',10,1,1,'2018-10-23 08:50:05','2018-10-23 08:50:05'),(306,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_5\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 08:51:26','2018-10-23 08:51:26'),(307,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_5\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 08:52:35','2018-10-23 08:52:35'),(308,'show tables',10,1,1,'2018-10-23 08:53:42','2018-10-23 08:53:42'),(309,'show tables',10,1,1,'2018-10-23 08:58:48','2018-10-23 08:58:48'),(310,'select * from VIEWS',10,1,1,'2018-10-23 08:59:00','2018-10-23 08:59:00'),(311,'select * from VIEWS where TABLE_SCHEMA = \'phpapps\'',10,1,1,'2018-10-23 08:59:39','2018-10-23 08:59:39'),(312,'select * from INFORMATION_SCHEMA.INNODB_COLUMNS where TABLE_SCHEMA = \'phpapps\'',10,1,1,'2018-10-23 09:05:41','2018-10-23 09:05:41'),(313,'show tables like \'INODB%\'',10,1,1,'2018-10-23 09:06:18','2018-10-23 09:06:18'),(314,'show tables like \'INNODB%\'',10,1,1,'2018-10-23 09:06:23','2018-10-23 09:06:23'),(315,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_5\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 09:24:11','2018-10-23 09:24:11'),(316,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_5\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 09:24:36','2018-10-23 09:24:36'),(317,'show tables',3,1,1,'2018-10-23 09:24:43','2018-10-23 09:24:43'),(318,'select * from forms',3,1,1,'2018-10-23 09:24:52','2018-10-23 09:24:52'),(319,'show tables',10,1,1,'2018-10-23 09:25:01','2018-10-23 09:25:01'),(320,'select * from INNODB_SYS_TABLES limit 10',10,1,1,'2018-10-23 09:25:31','2018-10-23 09:25:31'),(321,'select * from INNODB_SYS_TABLES',10,1,1,'2018-10-23 09:25:42','2018-10-23 09:25:42'),(322,'select * from INNODB_SYS_TABLES where name like \'phpapps%\'',10,1,1,'2018-10-23 09:26:17','2018-10-23 09:26:17'),(323,'select * from INNODB_SYS_COLUMNS where name like \'phpapps%\'',10,1,1,'2018-10-23 09:32:29','2018-10-23 09:32:29'),(324,'select * from INNODB_SYS_COLUMNS limit 10',10,1,1,'2018-10-23 09:32:38','2018-10-23 09:32:38'),(325,'select * from INNODB_SYS_TABLES limit 10',10,1,1,'2018-10-23 09:51:21','2018-10-23 09:51:21'),(326,'select * from INNODB_SYS_TABLES',10,1,1,'2018-10-23 09:51:26','2018-10-23 09:51:26'),(327,'select * from INNODB_SYS_TABLES where name like \'phpapps%\'',10,1,1,'2018-10-23 09:52:17','2018-10-23 09:52:17'),(328,'select * from INNODB_SYS_COLUMNS limit 10',10,1,1,'2018-10-23 09:54:02','2018-10-23 09:54:02'),(329,'select * from INNODB_SYS_COLUMNS where TABLE_ID = 4976',10,1,1,'2018-10-23 09:54:21','2018-10-23 09:54:21'),(330,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_5\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 11:11:54','2018-10-23 11:11:54'),(331,'select right(NAME,LOCATE(\'/\',NAME)) from INNODB_SYS_TABLES where name like \'phpapps%\'',10,1,1,'2018-10-23 11:49:47','2018-10-23 11:49:47'),(332,'select right(NAME,LOCATE(\'/\',NAME) -1) from INNODB_SYS_TABLES where name like \'phpapps%\'',10,1,1,'2018-10-23 11:50:04','2018-10-23 11:50:04'),(333,'select right(NAME,LENGTH( NAME) - LOCATE(\'/\',NAME) ) from INNODB_SYS_TABLES where name like \'phpapps%\'',10,1,1,'2018-10-23 11:51:30','2018-10-23 11:51:30'),(334,'select *, right(NAME,LENGTH( NAME) - LOCATE(\'/\',NAME) ) AS TABLE_NAME from INNODB_SYS_TABLES where name like \'phpapps%\'',10,1,1,'2018-10-23 11:51:51','2018-10-23 11:51:51'),(335,'select *, right(NAME,LENGTH( NAME) - LOCATE(\'/\',NAME) ) AS SCHEMA_NAME, right(NAME,LENGTH( NAME) - LOCATE(\'/\',NAME) ) AS TABLE_NAME from INNODB_SYS_TABLES where name like \'phpapps%\'',10,1,1,'2018-10-23 11:56:59','2018-10-23 11:56:59'),(336,'select *, left(NAME,LOCATE(\'/\',NAME) ) AS SCHEMA_NAME, right(NAME,LENGTH( NAME) - LOCATE(\'/\',NAME) ) AS TABLE_NAME from INNODB_SYS_TABLES where name like \'phpapps%\'',10,1,1,'2018-10-23 11:57:17','2018-10-23 11:57:17'),(337,'select *, left(NAME,LOCATE(\'/\',NAME) -1 ) AS SCHEMA_NAME, right(NAME,LENGTH( NAME) - LOCATE(\'/\',NAME) ) AS TABLE_NAME from INNODB_SYS_TABLES where name like \'phpapps%\'',10,1,1,'2018-10-23 11:57:25','2018-10-23 11:57:25'),(338,'select * from table_details',3,1,1,'2018-10-23 12:02:10','2018-10-23 12:02:10'),(339,'show tables',3,1,1,'2018-10-23 12:05:17','2018-10-23 12:05:17'),(340,'select * from table details',3,1,1,'2018-10-23 12:09:03','2018-10-23 12:09:03'),(341,'select * from table_details',3,1,1,'2018-10-23 12:09:08','2018-10-23 12:09:08'),(342,'SELECT @rownum:=@rownum+1 AS rownum, dummy.*\r\nFROM (SELECT @rownum:=0) r, dummy',3,1,1,'2018-10-23 12:14:17','2018-10-23 12:14:17'),(343,'SELECT @rownum:=@rownum+1 AS rownum, dummy.*\r\nFROM (SELECT @rownum:=0)',3,1,1,'2018-10-23 12:14:34','2018-10-23 12:14:34'),(344,'SELECT @rownum:=@rownum+1 AS rownum, dummy.*\r\nFROM (SELECT @rownum:=0) dummy',3,1,1,'2018-10-23 12:14:48','2018-10-23 12:14:48'),(345,'SELECT @rownum:=@rownum+1 AS rownum, dummy.*\r\nFROM (SELECT @rownum:=0) dummy,r',3,1,1,'2018-10-23 12:15:43','2018-10-23 12:15:43'),(346,'SELECT @rownum:=@rownum+1 AS rownum, dummy.*\r\nFROM (SELECT @rownum:=0) dummy',3,1,1,'2018-10-23 12:15:50','2018-10-23 12:15:50'),(347,'SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy',3,1,1,'2018-10-23 12:16:48','2018-10-23 12:16:48'),(348,'select ,table_name, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy) ID from tables',3,1,1,'2018-10-23 12:18:14','2018-10-23 12:18:14'),(349,'select ,table_name, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy) as ID from tables',3,1,1,'2018-10-23 12:18:26','2018-10-23 12:18:26'),(350,'select ,table_name, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) ) as ID from tables',3,1,1,'2018-10-23 12:18:40','2018-10-23 12:18:40'),(351,'(SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) )',3,1,1,'2018-10-23 12:18:59','2018-10-23 12:18:59'),(352,'(SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy )',3,1,1,'2018-10-23 12:19:06','2018-10-23 12:19:06'),(353,'select \'1\', (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy )',3,1,1,'2018-10-23 12:19:19','2018-10-23 12:19:19'),(354,'select \'1\', (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as id',3,1,1,'2018-10-23 12:19:24','2018-10-23 12:19:24'),(355,'select table_name, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as id from tables',3,1,1,'2018-10-23 12:19:37','2018-10-23 12:19:37'),(356,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_5\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 12:21:21','2018-10-23 12:21:21'),(357,'select *,\'11\' from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_5\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 12:21:37','2018-10-23 12:21:37'),(358,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_5\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 12:21:43','2018-10-23 12:21:43'),(359,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_5\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 12:21:47','2018-10-23 12:21:47'),(360,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_5\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 12:21:48','2018-10-23 12:21:48'),(361,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_22\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 12:21:52','2018-10-23 12:21:52'),(362,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 12:21:56','2018-10-23 12:21:56'),(363,'select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 12:22:02','2018-10-23 12:22:02'),(364,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',10,1,1,'2018-10-23 12:22:09','2018-10-23 12:22:09'),(365,'select * from table_details',3,1,1,'2018-10-23 12:22:32','2018-10-23 12:22:32'),(366,'',10,1,1,'2018-10-24 06:45:49','2018-10-24 06:45:49'),(367,'',11,1,1,'2018-10-24 06:45:54','2018-10-24 06:45:54'),(368,'show tables',3,1,1,'2018-10-24 06:46:02','2018-10-24 06:46:02'),(369,'select * from  sql_console_saves',3,1,1,'2018-10-24 06:46:23','2018-10-24 06:46:23'),(370,'select * from table_details',3,1,1,'2018-11-01 13:25:10','2018-11-01 13:25:10'),(371,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2018-11-01 13:26:24','2018-11-01 13:26:24'),(372,'select * from table_details',3,1,1,'2018-11-01 13:26:50','2018-11-01 13:26:50'),(373,'select subunit,nume,(prima_pen+desf_cim+ajut_bug) from acsru_v1.lich where (prima_pen+desf_cim+ajut_bug) <> 0',1,1,1,'2018-12-11 17:26:43','2018-12-11 17:26:43'),(374,'select subunit,nume,(prima_pen+desf_cim+ajut_bug) from acsru_v1.lich where (prima_pen+desf_cim+ajut_bug) <> 0 and data like \'2018%\'',1,1,1,'2018-12-11 17:27:03','2018-12-11 17:27:03'),(375,'select * from tables',3,1,1,'2019-08-25 06:16:06','2019-08-25 06:16:06'),(376,'select * from tables order by CREATE_DATE desc',3,1,1,'2019-08-25 06:17:12','2019-08-25 06:17:12'),(377,'select * from view_tables order by CREATE_DATE desc',3,1,1,'2019-08-25 06:17:26','2019-08-25 06:17:26'),(378,'select * from view_tables order by id desc',3,1,1,'2019-08-25 06:17:38','2019-08-25 06:17:38'),(379,'select * from tables order by id desc',3,1,1,'2019-08-25 06:44:30','2019-08-25 06:44:30'),(380,'desc tables',3,1,1,'2019-08-25 06:44:49','2019-08-25 06:44:49'),(381,'select * from tables order by id desc',3,1,1,'2019-08-25 06:45:04','2019-08-25 06:45:04'),(382,'select * from tables order by id desc',3,1,1,'2019-08-25 07:10:31','2019-08-25 07:10:31'),(383,'select * from table_details where id = \'311\' order by id desc',3,1,1,'2019-08-25 07:10:49','2019-08-25 07:10:49'),(384,'select * from table_details  order by id desc',3,1,1,'2019-08-25 07:11:06','2019-08-25 07:11:06'),(385,'select * from table_details where table_id = \'311\' order by id desc',3,1,1,'2019-08-25 07:11:23','2019-08-25 07:11:23'),(386,'select * from table_details where table_id = \'311\' order by id desc',3,1,1,'2019-08-25 07:12:16','2019-08-25 07:12:16'),(387,'select * from tables',3,1,1,'2019-08-25 07:12:28','2019-08-25 07:12:28'),(388,'select * from tables order by id desc',3,1,1,'2019-08-25 07:12:39','2019-08-25 07:12:39'),(389,'select * from view_table_details order by id desc',3,1,1,'2019-08-25 07:16:53','2019-08-25 07:16:53'),(390,'select * from view_tables order by id desc',3,1,1,'2019-08-25 07:19:20','2019-08-25 07:19:20'),(391,'show tables',3,1,1,'2019-08-25 07:32:35','2019-08-25 07:32:35'),(392,'select * from form_details',3,1,1,'2019-08-25 07:32:57','2019-08-25 07:32:57'),(393,'select * from forms',3,1,1,'2019-08-25 07:33:11','2019-08-25 07:33:11'),(394,'select * from forms where form name = \'phpapps_database_table_details_DDL_form\'',3,1,1,'2019-08-25 07:33:24','2019-08-25 07:33:24'),(395,'select * from forms where form_name = \'phpapps_database_table_details_DDL_form\'',3,1,1,'2019-08-25 07:33:36','2019-08-25 07:33:36'),(396,'select * from form_details where form_id = \'115\'',3,1,1,'2019-08-25 07:34:00','2019-08-25 07:34:00'),(397,'show tables',1,1,1,'2019-09-24 05:17:06','2019-09-24 05:17:06'),(398,'show tables',3,1,1,'2019-09-24 05:17:23','2019-09-24 05:17:23'),(399,'select * from applications',3,1,1,'2019-09-24 05:17:32','2019-09-24 05:17:32'),(400,'select * from applications',3,1,1,'2019-09-24 05:30:30','2019-09-24 05:30:30'),(401,'select * from applications',3,1,1,'2019-09-24 05:59:04','2019-09-24 05:59:04'),(402,'select * from applications',3,1,1,'2019-09-24 06:08:23','2019-09-24 06:08:23'),(403,'select * from GLOBALS_DIR',3,1,1,'2019-09-24 06:09:11','2019-09-24 06:09:11'),(404,'select * from applications',3,1,1,'2019-09-24 06:09:26','2019-09-24 06:09:26'),(405,'select * from applications',3,1,1,'2019-09-24 06:10:50','2019-09-24 06:10:50'),(406,'select * from applications',3,1,1,'2019-09-24 06:10:52','2019-09-24 06:10:52'),(407,'select * from applications',3,1,1,'2019-09-24 06:11:50','2019-09-24 06:11:50'),(408,'select * from applications',3,1,1,'2019-09-24 06:12:09','2019-09-24 06:12:09'),(409,'select * from applications',3,1,1,'2019-09-24 06:24:50','2019-09-24 06:24:50'),(410,'select * from applications',3,1,1,'2019-09-24 06:27:36','2019-09-24 06:27:36'),(411,'select * from applications',3,1,1,'2019-09-24 06:27:57','2019-09-24 06:27:57'),(412,'select * from applications',3,1,1,'2019-09-24 06:47:18','2019-09-24 06:47:18'),(413,'select * from applications',3,1,1,'2019-09-24 06:47:30','2019-09-24 06:47:30'),(414,'select * from applications',3,1,1,'2019-09-24 06:47:38','2019-09-24 06:47:38'),(415,'select * from applications',3,1,1,'2019-09-24 06:54:41','2019-09-24 06:54:41'),(416,'select * from applications',3,1,1,'2019-09-24 06:56:27','2019-09-24 06:56:27'),(417,'select * from applications',3,1,1,'2019-09-24 06:56:58','2019-09-24 06:56:58'),(418,'select * from applications',3,1,1,'2019-09-24 06:57:51','2019-09-24 06:57:51'),(419,'select * from applications',3,1,1,'2019-09-24 06:59:39','2019-09-24 06:59:39'),(420,'select * from applications',3,1,1,'2019-09-24 07:22:23','2019-09-24 07:22:23'),(421,'select * from applications',3,1,1,'2019-09-24 07:22:41','2019-09-24 07:22:41'),(422,'select * from applications',3,1,1,'2019-09-24 07:23:40','2019-09-24 07:23:40'),(423,'select * from applications',3,1,1,'2019-09-24 07:26:36','2019-09-24 07:26:36'),(424,'select * from applications',3,1,1,'2019-09-24 07:26:41','2019-09-24 07:26:41'),(425,'select * from applications',3,1,1,'2019-09-24 07:31:46','2019-09-24 07:31:46'),(426,'select * from applications',3,1,1,'2019-09-24 07:41:37','2019-09-24 07:41:37'),(427,'select * from applications',3,1,1,'2019-09-24 07:42:04','2019-09-24 07:42:04'),(428,'select * from applications',3,1,1,'2019-09-24 07:42:14','2019-09-24 07:42:14'),(429,'select * from applications',3,1,1,'2019-09-24 07:44:09','2019-09-24 07:44:09'),(430,'select * from applications',3,1,1,'2019-09-24 07:52:21','2019-09-24 07:52:21'),(431,'select * from applications',3,1,1,'2019-09-24 07:53:18','2019-09-24 07:53:18'),(432,'select * from applications',3,1,1,'2019-09-24 12:27:58','2019-09-24 12:27:58'),(433,'select * from applications',3,1,1,'2019-09-24 12:30:43','2019-09-24 12:30:43'),(434,'select * from applications',3,1,1,'2019-09-25 06:24:07','2019-09-25 06:24:07'),(435,'select * from applications',3,1,1,'2019-09-25 06:25:00','2019-09-25 06:25:00'),(436,'select * from applications',3,1,1,'2019-09-25 06:25:38','2019-09-25 06:25:38'),(437,'select * from applications',3,1,1,'2019-09-25 06:25:52','2019-09-25 06:25:52'),(438,'select * from view_applications',3,1,1,'2019-09-27 08:01:48','2019-09-27 08:01:48'),(439,'select * from applications',3,1,1,'2019-09-27 08:02:26','2019-09-27 08:02:26'),(440,'select * from view_table_details',3,1,1,'2019-09-27 08:27:21','2019-09-27 08:27:21'),(441,'select * from table_details',3,1,1,'2019-09-27 08:29:21','2019-09-27 08:29:21'),(442,'select * from table_details',3,1,1,'2019-09-27 09:43:12','2019-09-27 09:43:12'),(443,'select CONCAT(\'$MYSQL_COLUMN_TYPES[\',ID,\']=\\\"\',VALUE,\'\\\";\') AS MYSQL_COLUMN_TYPES_ARRAY from  list_mysql_column_types',3,1,1,'2019-09-27 10:26:23','2019-09-27 10:26:23'),(444,'show tables',3,1,1,'2019-09-27 10:26:31','2019-09-27 10:26:31'),(445,'create view view_table_details as select d.ID,\r\nd.TABLE_ID,\r\nt.TABLE_NAME,\r\nd.COLUMN_NAME,\r\nd.COLUMN_TYPE_ID,\r\n(SELECT VALUE FROM list_mysql_column_types WHERE ID = d.COLUMN_TYPE_ID) AS COLUMN_TYPE_LABEl,\r\nd.COLUMN_SIZE,\r\nd.COLUMN_DEFAULT_VALUE,\r\nd.FOREIGN_KEY_SCHEMA_ID,\r\n(SELECT VALUE FROM list_databases WHERE ID = d.FOREIGN_KEY_SCHEMA_ID) AS FOREIGN_KEY_SCHEMA_LABEl,\r\nd.FOREIGN_KEY_TABLE_ID,\r\n(SELECT TABLE_NAME FROM tables WHERE ID = d.FOREIGN_KEY_TABLE_ID) AS FOREIGN_KEY_TABLE_LABEl,\r\nd.FOREIGN_KEY_COLUMN_ID,\r\n(SELECT COLUMN_NAME FROM table_details WHERE ID = d.FOREIGN_KEY_COLUMN_ID) AS FOREIGN_KEY_COLUMN_LABEL,\r\nd.COLUMN_INDEX_TYPE_ID,\r\n(SELECT VALUE FROM list_index_types WHERE ID = d.COLUMN_INDEX_TYPE_ID) AS COLUMN_INDEX_TYPE_LABEL,\r\nd.DESCRIPTION,\r\nd.MODIFY_UID,\r\n(SELECT USERNAME FROM users WHERE ID = d.MODIFY_UID) AS MODIFIED_BY,\r\nd.CREATE_UID,\r\n(SELECT USERNAME FROM users WHERE ID = d.CREATE_UID) AS CREATED_BY,\r\nd.MODIFY_DATE,\r\nd.CREATE_DATE\r\n\r\nfrom  table_details d left join tables t on (d.table_id = t.id)',3,1,1,'2019-09-27 10:26:37','2019-09-27 10:26:37'),(446,'show tables',10,1,1,'2019-09-27 10:27:41','2019-09-27 10:27:41'),(447,'select * from  INNODB_SYS_COLUMNS  limit 10',10,1,1,'2019-09-27 10:28:18','2019-09-27 10:28:18'),(448,'show tables',10,1,1,'2019-09-27 10:28:31','2019-09-27 10:28:31'),(449,'select * from TABLES  limit 10',10,1,1,'2019-09-27 10:28:54','2019-09-27 10:28:54'),(450,'select * from TABLES  limit 10',10,1,1,'2019-09-27 10:29:18','2019-09-27 10:29:18'),(451,'select * from TABLES  limit 10',10,1,1,'2019-09-27 10:29:33','2019-09-27 10:29:33'),(452,'select * from COLUMNS   limit 10',10,1,1,'2019-09-27 10:29:36','2019-09-27 10:29:36'),(453,'select * from COLUMNS   limit 10',10,1,1,'2019-09-27 10:29:43','2019-09-27 10:29:43'),(454,'select * from COLUMNS   limit 10',10,1,1,'2019-09-27 10:29:50','2019-09-27 10:29:50'),(455,'select * from COLUMNS   limit 10',10,1,1,'2019-09-27 10:29:57','2019-09-27 10:29:57'),(456,'select * from table_details',10,1,1,'2019-09-30 05:12:53','2019-09-30 05:12:53'),(457,'select * from table_details',3,1,1,'2019-09-30 05:13:07','2019-09-30 05:13:07'),(458,'show tables',3,1,1,'2019-10-01 05:14:39','2019-10-01 05:14:39'),(459,'select * from sql_console_history',3,1,1,'2019-10-01 05:14:54','2019-10-01 05:14:54'),(460,'select * from sql_console_history order by CREATE_DATE desc',3,1,1,'2019-10-01 05:15:19','2019-10-01 05:15:19'),(461,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-01 05:16:04','2019-10-01 05:16:04'),(462,'select * from table details',3,1,1,'2019-10-01 05:17:01','2019-10-01 05:17:01'),(463,'select * from table_details',3,1,1,'2019-10-01 05:17:06','2019-10-01 05:17:06'),(464,'select * from table_details',3,1,1,'2019-10-01 05:18:08','2019-10-01 05:18:08'),(465,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'test_cols\' and table_schema = \'phpapps\'',3,1,1,'2019-10-01 05:18:31','2019-10-01 05:18:31'),(466,'select * from table_details',3,1,1,'2019-10-01 08:49:13','2019-10-01 08:49:13'),(467,'select * from sql_console_history order by CREATE_DATE desc',3,1,1,'2019-10-01 11:11:10','2019-10-01 11:11:10'),(468,'select * from sql_console_history order by CREATE_DATE desc',3,1,1,'2019-10-03 07:12:59','2019-10-03 07:12:59'),(469,'select * from sql_console_history order by CREATE_DATE desc',3,1,1,'2019-10-03 07:13:13','2019-10-03 07:13:13'),(470,'select * from sql_console_history order by CREATE_DATE desc',3,1,1,'2019-10-03 07:35:52','2019-10-03 07:35:52'),(471,'select * from sql_console_history order by CREATE_DATE desc',3,1,1,'2019-10-03 08:12:32','2019-10-03 08:12:32'),(472,'select * from sql_console_history order by CREATE_DATE desc',3,1,1,'2019-10-03 08:14:15','2019-10-03 08:14:15'),(473,'select * from table_details',3,1,1,'2019-10-03 09:17:26','2019-10-03 09:17:26'),(474,'select * from sql_console_history order by CREATE_DATE desc',3,1,1,'2019-10-03 09:17:27','2019-10-03 09:17:27'),(475,'select * from sql_console_history order by CREATE_DATE desc',3,1,1,'2019-10-03 09:38:48','2019-10-03 09:38:48'),(476,'select * from table_details',3,1,1,'2019-10-03 09:38:53','2019-10-03 09:38:53'),(477,'select * from table_details',3,1,1,'2019-10-03 09:50:58','2019-10-03 09:50:58'),(478,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-18 16:21:32','2019-10-18 16:21:32'),(479,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\' union all\r\nselect * from (select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\') where id = 9',3,1,1,'2019-10-18 16:22:51','2019-10-18 16:22:51'),(480,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\' union all\r\nselect * from (select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\') as rvf where id = 9',3,1,1,'2019-10-18 16:23:10','2019-10-18 16:23:10'),(481,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-18 16:23:30','2019-10-18 16:23:30'),(482,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-18 16:23:32','2019-10-18 16:23:32'),(483,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\' union all\r\nselect * from (select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\') as rvf where ID = 9',3,1,1,'2019-10-18 16:23:48','2019-10-18 16:23:48'),(484,'select * from (select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\') as rvf where ID = 9',3,1,1,'2019-10-18 16:24:42','2019-10-18 16:24:42'),(485,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\' union\r\n\r\nselect * from (select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\') as rvf where ID = 9',3,1,1,'2019-10-18 16:25:30','2019-10-18 16:25:30'),(486,'select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\' union all\r\n\r\nselect * from (select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\') as rvf where ID = 9',3,1,1,'2019-10-18 16:25:36','2019-10-18 16:25:36'),(487,'select * from table_details',3,1,1,'2019-10-18 16:26:48','2019-10-18 16:26:48'),(488,'select * from view_table_details',3,1,1,'2019-10-18 16:26:56','2019-10-18 16:26:56'),(489,'select * from view_table_details WHERE table_name = \'tables\'',3,1,1,'2019-10-18 16:27:18','2019-10-18 16:27:18'),(490,'select * from table_details WHERE table_name = \'tables\'',3,1,1,'2019-10-18 17:32:02','2019-10-18 17:32:02'),(491,'select * from table_details WHERE table_name = \'tables\'',3,1,1,'2019-10-18 17:32:02','2019-10-18 17:32:02'),(492,'select * from table_details',3,1,1,'2019-10-18 17:32:12','2019-10-18 17:32:12'),(493,'select * from (select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\') as rvf where ID = 9',3,1,1,'2019-10-18 20:20:23','2019-10-18 20:20:23'),(494,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE VALUE = DATA_TYPE ) AS COLUMN_TYPE_ID\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\'',3,1,1,'2019-10-18 20:34:05','2019-10-18 20:34:05'),(495,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE VALUE = DATA_TYPE ) AS COLUMN_TYPE_ID\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-18 20:34:31','2019-10-18 20:34:31'),(496,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = DATA_TYPE ) AS COLUMN_TYPE_ID\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-18 20:35:28','2019-10-18 20:35:28'),(497,'select * from (select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\') as rvf',3,1,1,'2019-10-18 20:35:50','2019-10-18 20:35:50'),(498,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-18 20:36:32','2019-10-18 20:36:32'),(499,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-18 20:41:48','2019-10-18 20:41:48'),(500,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	COLUMN_SIZE\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-18 21:07:36','2019-10-18 21:07:36'),(501,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	\'??\' as COLUMN_SIZE\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-18 21:07:58','2019-10-18 21:07:58'),(502,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	\'??\' as COLUMN_SIZE\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-18 21:08:02','2019-10-18 21:08:02'),(503,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	\'??\' as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:25:28','2019-10-19 06:25:28'),(504,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	\'??\' as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:26:11','2019-10-19 06:26:11'),(505,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	\'??\' as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	\'0\' AS AUTOINCREMENT\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:27:09','2019-10-19 06:27:09'),(506,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	\'??\' as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:28:45','2019-10-19 06:28:45'),(507,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	\'??\' as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:30:33','2019-10-19 06:30:33'),(508,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	\'??\' as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:30:43','2019-10-19 06:30:43'),(509,'desc table_details',3,1,1,'2019-10-19 06:31:33','2019-10-19 06:31:33'),(510,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\'),LOCATE(\')\')) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:35:27','2019-10-19 06:35:27'),(511,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE),LOCATE(\')\',COLUMN_TYPE)) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:36:16','2019-10-19 06:36:16'),(512,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:36:32','2019-10-19 06:36:32'),(513,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:36:38','2019-10-19 06:36:38'),(514,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)-2) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:36:59','2019-10-19 06:36:59'),(515,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)-10) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:37:04','2019-10-19 06:37:04'),(516,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)-9) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:37:13','2019-10-19 06:37:13'),(517,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)-8) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:37:20','2019-10-19 06:37:20'),(518,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)-8) as COLUMN_SIZE,\r\n	LOCATE(\')\',COLUMN_TYPE),\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:38:25','2019-10-19 06:38:25'),(519,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)-8) as COLUMN_SIZE,\r\n	LOCATE(\'(\',COLUMN_TYPE),\r\n	LOCATE(\')\',COLUMN_TYPE),\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:38:50','2019-10-19 06:38:50'),(520,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)) as COLUMN_SIZE,\r\n	LOCATE(\'(\',COLUMN_TYPE),\r\n	LOCATE(\')\',COLUMN_TYPE),\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:39:10','2019-10-19 06:39:10'),(521,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)) as COLUMN_SIZE,\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:40:00','2019-10-19 06:40:00'),(522,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)) as COLUMN_SIZE,\r\n	LENGTH(COLUMN_SIZE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:40:51','2019-10-19 06:40:51'),(523,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)) as COLUMN_SIZE,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:41:04','2019-10-19 06:41:04'),(524,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)) as COLUMN_SIZE,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LENGTH(COLUMN_TYPE)) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:41:43','2019-10-19 06:41:43'),(525,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)) as COLUMN_SIZE,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LENGTH(COLUMN_TYPE)-1) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:41:58','2019-10-19 06:41:58'),(526,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE)) as COLUMN_SIZE,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LENGTH(COLUMN_TYPE)-1) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:42:00','2019-10-19 06:42:00'),(527,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,POSITION(\'(\',COLUMN_TYPE)+1,POSITION(\')\',COLUMN_TYPE)) as COLUMN_SIZE,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LENGTH(COLUMN_TYPE)-1) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:43:02','2019-10-19 06:43:02'),(528,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,POSITION(\'(\' IN COLUMN_TYPE)+1,POSITION(\')\' IN COLUMN_TYPE)) as COLUMN_SIZE,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LENGTH(COLUMN_TYPE)-1) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:43:31','2019-10-19 06:43:31'),(529,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,POSITION(\'(\' IN COLUMN_TYPE)+1,POSITION(\')\' IN COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LENGTH(COLUMN_TYPE)-1) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:43:43','2019-10-19 06:43:43'),(530,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,POSITION(\'(\' IN COLUMN_TYPE)+1,POSITION(\')\' IN COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LENGTH(COLUMN_TYPE)-1) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:43:44','2019-10-19 06:43:44'),(531,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,POSITION(\'(\' IN COLUMN_TYPE)+1,POSITION(\')\' IN COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LENGTH(COLUMN_TYPE)-1 - LOCATE(\'(\',COLUMN_TYPE)+1 ) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:44:39','2019-10-19 06:44:39'),(532,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,POSITION(\'(\' IN COLUMN_TYPE)+1,POSITION(\')\' IN COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LENGTH(COLUMN_TYPE)-1 - LOCATE(\'(\',COLUMN_TYPE) -1 ) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:44:48','2019-10-19 06:44:48'),(533,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,POSITION(\'(\' IN COLUMN_TYPE)+1,POSITION(\')\' IN COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LENGTH(COLUMN_TYPE)-1 - LOCATE(\'(\',COLUMN_TYPE)) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:44:55','2019-10-19 06:44:55'),(534,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:45:58','2019-10-19 06:45:58'),(535,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE2,\r\n	LENGTH(COLUMN_TYPE),\r\n	LOCATE(\'(\',COLUMN_TYPE)+1,\r\n	LOCATE(\')\',COLUMN_TYPE)-1,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:46:09','2019-10-19 06:46:09'),(536,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:46:25','2019-10-19 06:46:25'),(537,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'tables\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:46:57','2019-10-19 06:46:57'),(538,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'table_details\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:47:12','2019-10-19 06:47:12'),(539,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD\r\n	\'0\' AS MODIFY_UID,\r\n	\'0\' AS CREATE_UID,\r\n	NOW() AS MODIFY_DATE,\r\n	NOW() AS CREATE_DATE\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'table_details\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:48:40','2019-10-19 06:48:40'),(540,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD,\r\n	\'0\' AS MODIFY_UID,\r\n	\'0\' AS CREATE_UID,\r\n	NOW() AS MODIFY_DATE,\r\n	NOW() AS CREATE_DATE\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'table_details\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 06:48:48','2019-10-19 06:48:48'),(541,'select * from table_details where table_id = 313',3,1,1,'2019-10-19 07:38:52','2019-10-19 07:38:52'),(542,'select * from (select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'modules\' and table_schema = \'phpapps\') as rvf',3,1,1,'2019-10-19 08:03:41','2019-10-19 08:03:41'),(543,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD,\r\n	\'0\' AS MODIFY_UID,\r\n	\'0\' AS CREATE_UID,\r\n	NOW() AS MODIFY_DATE,\r\n	NOW() AS CREATE_DATE\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'table_details\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 08:04:29','2019-10-19 08:04:29'),(544,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD,\r\n	\'0\' AS MODIFY_UID,\r\n	\'0\' AS CREATE_UID,\r\n	NOW() AS MODIFY_DATE,\r\n	NOW() AS CREATE_DATE\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'table_details\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 08:07:17','2019-10-19 08:07:17'),(545,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD,\r\n	\'0\' AS MODIFY_UID,\r\n	\'0\' AS CREATE_UID,\r\n	NOW() AS MODIFY_DATE,\r\n	NOW() AS CREATE_DATE\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'modules\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 08:07:27','2019-10-19 08:07:27'),(546,'SELECT \'12\' AS TABLE_ID, \r\n	COLUMN_NAME,\r\n	(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n	\'0\' AS UNSIGN,\r\n	SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE,\r\n	IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\n	COLUMN_DEFAULT AS COLUMN_DEFAULT_VALUE,\r\n	IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT,\r\n	COLUMN_COMMENT AS DESCRIPTION,\r\n	ORDINAL_POSITION AS ORD,\r\n	\'0\' AS MODIFY_UID,\r\n	\'0\' AS CREATE_UID,\r\n	NOW() AS MODIFY_DATE,\r\n	NOW() AS CREATE_DATE\r\n	from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'views\' and table_schema = \'phpapps\'',3,1,1,'2019-10-19 08:21:01','2019-10-19 08:21:01'),(547,'select * from (select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'views\' and table_schema = \'phpapps\') as rvf',3,1,1,'2019-10-19 08:21:30','2019-10-19 08:21:30'),(548,'select * from (select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'views\' and table_schema = \'phpapps\') as rvf',3,1,1,'2019-10-19 08:22:49','2019-10-19 08:22:49'),(549,'select * from tables',3,1,1,'2019-10-19 08:33:20','2019-10-19 08:33:20'),(550,'select \r\n ti.ID,\r\nt.SCHEMA_ID,\r\n(select value from phpapps.list_databases where id = t.schema_id) as \'TABLE_SCHEMA\',\r\n ti.TABLE_ID,\r\n t.TABLE_NAME,\r\n ti.INDEX_NAME,\r\n ti.INDEX_TYPE_ID,\r\n(select value from phpapps.list_index_types where id = ti.INDEX_TYPE_ID) as INDEX_TYPE,\r\n ti.INDEX_COLUMNS,\r\n(select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE ti.INDEX_COLUMNS REGEXP concat(\',?\',td.ID,\',?\' ) GROUP BY td.TABLE_ID ) as \'INDEX_COLUMNS_LABELS\',\r\n ti.DESCRIPTION,\r\n ti.MODIFY_UID,\r\n ti.CREATE_UID,\r\n ti.MODIFY_DATE,\r\n ti.CREATE_DATE\r\n from table_indexes ti left join tables t on (ti.table_id = t.id) where t.ORIGIN_ID = \'0\'',3,1,1,'2019-10-19 08:36:03','2019-10-19 08:36:03'),(551,'select \r\n ti.ID,\r\nt.SCHEMA_ID,\r\n\r\n ti.TABLE_ID,\r\n t.TABLE_NAME,\r\n ti.INDEX_NAME,\r\n ti.INDEX_TYPE_ID,\r\n(select value from phpapps.list_index_types where id = ti.INDEX_TYPE_ID) as INDEX_TYPE,\r\n ti.INDEX_COLUMNS,\r\n(select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE ti.INDEX_COLUMNS REGEXP concat(\',?\',td.ID,\',?\' ) GROUP BY td.TABLE_ID ) as \'INDEX_COLUMNS_LABELS\',\r\n ti.DESCRIPTION,\r\n ti.MODIFY_UID,\r\n ti.CREATE_UID,\r\n ti.MODIFY_DATE,\r\n ti.CREATE_DATE\r\n from table_indexes ti left join tables t on (ti.table_id = t.id) where t.ORIGIN_ID = \'0\'',3,1,1,'2019-10-19 08:36:15','2019-10-19 08:36:15'),(552,'select \r\n ti.ID,\r\nt.SCHEMA_ID,\r\n(select value from phpapps.list_databases where id = t.schema_id) as \'TABLE_SCHEMA\',\r\n ti.TABLE_ID,\r\n t.TABLE_NAME,\r\n ti.INDEX_NAME,\r\n ti.INDEX_TYPE_ID,\r\n\r\n ti.INDEX_COLUMNS,\r\n(select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE ti.INDEX_COLUMNS REGEXP concat(\',?\',td.ID,\',?\' ) GROUP BY td.TABLE_ID ) as \'INDEX_COLUMNS_LABELS\',\r\n ti.DESCRIPTION,\r\n ti.MODIFY_UID,\r\n ti.CREATE_UID,\r\n ti.MODIFY_DATE,\r\n ti.CREATE_DATE\r\n from table_indexes ti left join tables t on (ti.table_id = t.id) where t.ORIGIN_ID = \'0\'',3,1,1,'2019-10-19 08:36:24','2019-10-19 08:36:24'),(553,'select \r\n ti.ID,\r\nt.SCHEMA_ID,\r\n(select value from phpapps.list_databases where id = t.schema_id) as \'TABLE_SCHEMA\',\r\n ti.TABLE_ID,\r\n t.TABLE_NAME,\r\n ti.INDEX_NAME,\r\n ti.INDEX_TYPE_ID,\r\n(select value from phpapps.list_index_types where id = ti.INDEX_TYPE_ID) as INDEX_TYPE,\r\n ti.INDEX_COLUMNS,\r\n\r\n ti.DESCRIPTION,\r\n ti.MODIFY_UID,\r\n ti.CREATE_UID,\r\n ti.MODIFY_DATE,\r\n ti.CREATE_DATE\r\n from table_indexes ti left join tables t on (ti.table_id = t.id) where t.ORIGIN_ID = \'0\'',3,1,1,'2019-10-19 08:36:35','2019-10-19 08:36:35'),(554,'select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE ti.INDEX_COLUMNS REGEXP concat(\',?\',td.ID,\',?\' ) GROUP BY td.TABLE_ID',3,1,1,'2019-10-19 08:39:49','2019-10-19 08:39:49'),(555,'select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td GROUP BY td.TABLE_ID',3,1,1,'2019-10-19 08:40:28','2019-10-19 08:40:28'),(556,'select \r\n ti.ID,\r\nt.SCHEMA_ID,\r\n(select value from phpapps.list_databases where id = t.schema_id) as \'TABLE_SCHEMA\',\r\n ti.TABLE_ID,\r\n t.TABLE_NAME,\r\n ti.INDEX_NAME,\r\n ti.INDEX_TYPE_ID,\r\n(select value from phpapps.list_index_types where id = ti.INDEX_TYPE_ID) as INDEX_TYPE,\r\n ti.INDEX_COLUMNS,\r\n\r\n ti.DESCRIPTION,\r\n ti.MODIFY_UID,\r\n ti.CREATE_UID,\r\n ti.MODIFY_DATE,\r\n ti.CREATE_DATE,\r\n ti.*\r\n from table_indexes ti left join tables t on (ti.table_id = t.id) where t.ORIGIN_ID = \'0\'',3,1,1,'2019-10-19 08:43:20','2019-10-19 08:43:20'),(557,'select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE \'58,71\' REGEXP concat(\',?\',td.ID,\',?\' ) GROUP BY td.TABLE_ID',3,1,1,'2019-10-19 08:47:03','2019-10-19 08:47:03'),(558,'select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE \'58\' REGEXP concat(\',?\',td.ID,\',?\' ) GROUP BY td.TABLE_ID',3,1,1,'2019-10-19 08:47:49','2019-10-19 08:47:49'),(559,'select * from CHECK_CONSTRAINTS limit 100',10,1,1,'2019-10-19 13:30:26','2019-10-19 13:30:26'),(560,'select * from KEY_COLUMN_USAGE limit 100',10,1,1,'2019-10-19 13:31:28','2019-10-19 13:31:28'),(561,'select * from KEY_COLUMN_USAGE where table_name = users',10,1,1,'2019-10-19 13:32:14','2019-10-19 13:32:14'),(562,'select * from KEY_COLUMN_USAGE where table_name = applications',10,1,1,'2019-10-19 13:32:21','2019-10-19 13:32:21'),(563,'select * from KEY_COLUMN_USAGE where table_name = modules',10,1,1,'2019-10-19 13:32:26','2019-10-19 13:32:26'),(564,'select * from KEY_COLUMN_USAGE where table_name = \'modules\'',10,1,1,'2019-10-19 13:32:35','2019-10-19 13:32:35'),(565,'select * from table_fks',3,1,1,'2019-10-19 13:33:51','2019-10-19 13:33:51'),(566,'select * from view_table_fks',3,1,1,'2019-10-19 13:34:11','2019-10-19 13:34:11'),(567,'select * from STATISTICS',10,1,1,'2019-10-19 13:37:05','2019-10-19 13:37:05'),(568,'select * from STATISTICS where TABLE_SCHEMA = \'phpapps\'',10,1,1,'2019-10-19 13:37:59','2019-10-19 13:37:59'),(569,'select * from table_fks',3,1,1,'2019-10-19 15:31:29','2019-10-19 15:31:29'),(570,'select * from table_indexes',3,1,1,'2019-10-19 15:31:39','2019-10-19 15:31:39'),(571,'select * from KEY_COLUMN_USAGE limit 100',10,1,1,'2019-10-24 07:02:49','2019-10-24 07:02:49'),(572,'select * from table_fks',3,1,1,'2019-10-24 07:18:24','2019-10-24 07:18:24'),(573,'show tables',10,1,1,'2019-10-24 07:20:50','2019-10-24 07:20:50'),(574,'select * from  REFERENTIAL_CONSTRAINTS  limit 10',10,1,1,'2019-10-24 07:21:10','2019-10-24 07:21:10'),(575,'select * from  REFERENTIAL_CONSTRAINTS  where CONSTRAINT_SCHEMA = \'phpapps\' and TABLE_NAME = \'test_cols\'',10,1,1,'2019-10-24 07:22:22','2019-10-24 07:22:22'),(576,'select * from  CONSTRAINTS  where CONSTRAINT_SCHEMA = \'phpapps\' and TABLE_NAME = \'test_cols\'',10,1,1,'2019-10-24 07:22:32','2019-10-24 07:22:32'),(577,'show tables',10,1,1,'2019-10-24 07:22:39','2019-10-24 07:22:39'),(578,'select * from  TABLE_CONSTRAINTS  where CONSTRAINT_SCHEMA = \'phpapps\' and TABLE_NAME = \'test_cols\'',10,1,1,'2019-10-24 07:23:05','2019-10-24 07:23:05'),(579,'show tables',10,1,1,'2019-10-24 07:23:53','2019-10-24 07:23:53'),(580,'SELECT \r\n  TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE\r\nWHERE\r\n  REFERENCED_TABLE_SCHEMA = \'phpapps\' AND\r\n  REFERENCED_TABLE_NAME = \'test_cols\'',10,1,1,'2019-10-24 07:25:58','2019-10-24 07:25:58'),(581,'SELECT \r\n  TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME, REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE\r\nWHERE\r\n  REFERENCED_TABLE_SCHEMA = \'phpapps\' AND\r\n  REFERENCED_TABLE_NAME = \'table_details\'',10,1,1,'2019-10-24 07:26:14','2019-10-24 07:26:14'),(582,'SELECT \r\n  *\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE\r\nWHERE\r\n  REFERENCED_TABLE_SCHEMA = \'phpapps\' AND\r\n  REFERENCED_TABLE_NAME = \'table_details\'',10,1,1,'2019-10-24 07:26:27','2019-10-24 07:26:27'),(583,'SELECT \r\n  *\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE\r\nWHERE\r\n  REFERENCED_TABLE_SCHEMA = \'phpapps\' AND\r\n  TABLE_NAME = \'table_details\'',10,1,1,'2019-10-24 07:27:08','2019-10-24 07:27:08'),(584,'SELECT \r\n  *\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE\r\nWHERE\r\n	TABLE_SCHEMA = \'phpapps\' AND\r\n  TABLE_NAME = \'table_details\'',10,1,1,'2019-10-24 07:28:29','2019-10-24 07:28:29'),(585,'show tables',10,1,1,'2019-10-24 07:29:23','2019-10-24 07:29:23'),(586,'select * from view_table_fks',3,1,1,'2019-10-24 07:38:07','2019-10-24 07:38:07'),(587,'show tables',1,1,1,'2019-10-24 08:02:45','2019-10-24 08:02:45'),(588,'SELECT \r\n  *\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE\r\nWHERE\r\n	TABLE_SCHEMA = \'phpapps\' AND\r\n  TABLE_NAME = \'table_details\'',10,1,1,'2019-10-24 08:19:44','2019-10-24 08:19:44'),(589,'select * from table_fks',3,1,1,'2019-10-24 08:20:08','2019-10-24 08:20:08'),(590,'select * from table_details;',3,1,1,'2019-10-24 08:21:56','2019-10-24 08:21:56'),(591,'select * from view_table_details;',3,1,1,'2019-10-24 08:23:00','2019-10-24 08:23:00'),(592,'SELECT \r\n  SELECT ID FROOM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:25:56','2019-10-24 08:25:56'),(593,'SELECT \r\n  ( SELECT ID FROOM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:26:12','2019-10-24 08:26:12'),(594,'SELECT \r\n  ( SELECT ID FROOM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:26:15','2019-10-24 08:26:15'),(595,'SELECT \r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:27:13','2019-10-24 08:27:13'),(596,'SELECT \r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n  CONSTRAINT_NAME AS FK_NAME\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:27:55','2019-10-24 08:27:55'),(597,'select * from tables',3,1,1,'2019-10-24 08:30:24','2019-10-24 08:30:24'),(598,'SELECT \r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n  CONSTRAINT_NAME AS FK_NAME,\r\n  (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME =  INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME ) AS FK_TABLE_ID\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:30:49','2019-10-24 08:30:49'),(599,'SELECT \r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n  CONSTRAINT_NAME AS FK_NAME,\r\n  (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME =  INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME ) AS FK_TABLE_ID\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:30:55','2019-10-24 08:30:55'),(600,'SELECT \r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n  CONSTRAINT_NAME AS FK_NAME,\r\n  (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME =  INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:31:35','2019-10-24 08:31:35'),(601,'SELECT \r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n  CONSTRAINT_NAME AS FK_NAME,\r\n  (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID,\r\n  FK_COLUMN_ID\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:38:47','2019-10-24 08:38:47'),(602,'SELECT \r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n  CONSTRAINT_NAME AS FK_NAME,\r\n  (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID,\r\n\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:39:04','2019-10-24 08:39:04'),(603,'SELECT \r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n  CONSTRAINT_NAME AS FK_NAME,\r\n  (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID\r\n\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:39:24','2019-10-24 08:39:24'),(604,'SELECT \r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n  CONSTRAINT_NAME AS FK_NAME,\r\n  (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID\r\n\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:51:06','2019-10-24 08:51:06'),(605,'SELECT \r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n  CONSTRAINT_NAME AS FK_NAME,\r\n  (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID,\r\n	\r\n	\'uid\' AS MODIFY_UID,\r\n	\'uid\' AS CREATE_UID,\r\n	NOW() AS MODIFY_DATE,\r\n	NOW() AS CREATE_DATE\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:52:55','2019-10-24 08:52:55'),(606,'SELECT \r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n  CONSTRAINT_NAME AS FK_NAME,\r\n  (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n  ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID,\r\n	\r\n	\'uid\' AS MODIFY_UID,\r\n	\'uid\' AS CREATE_UID,\r\n	NOW() AS MODIFY_DATE,\r\n	NOW() AS CREATE_DATE\r\nFROM\r\n  INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' and table_name = \'table_details\'',3,1,1,'2019-10-24 08:55:55','2019-10-24 08:55:55'),(607,'SELECT \r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n                                    CONSTRAINT_NAME AS FK_NAME,\r\n                                    (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID,\r\n	                            :user_id AS MODIFY_UID,\r\n                                    :user_id AS CREATE_UID,\r\n                                    NOW() AS MODIFY_DATE,\r\n                                    NOW() AS CREATE_DATE\r\n                                    FROM\r\n                                        INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = :schema_name AND table_name = :table_name AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME IS NOT NULL',3,1,1,'2019-10-24 09:00:36','2019-10-24 09:00:36'),(608,'SELECT \r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n                                    CONSTRAINT_NAME AS FK_NAME,\r\n                                    (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID,\r\n	                            :user_id AS MODIFY_UID,\r\n                                    :user_id AS CREATE_UID,\r\n                                    NOW() AS MODIFY_DATE,\r\n                                    NOW() AS CREATE_DATE\r\n                                    FROM\r\n                                        INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = :schema_name AND table_name = :table_name AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME <> \'\'',3,1,1,'2019-10-24 09:00:54','2019-10-24 09:00:54'),(609,'SELECT \r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n                                    CONSTRAINT_NAME AS FK_NAME,\r\n                                    (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID,\r\n	                            :user_id AS MODIFY_UID,\r\n                                    :user_id AS CREATE_UID,\r\n                                    NOW() AS MODIFY_DATE,\r\n                                    NOW() AS CREATE_DATE\r\n                                    FROM\r\n                                        INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' AND table_name = \'table_details\' AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME <> \'\'',3,1,1,'2019-10-24 09:01:18','2019-10-24 09:01:18'),(610,'SELECT \r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n                                    CONSTRAINT_NAME AS FK_NAME,\r\n                                    (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID,\r\n	                            :user_id AS MODIFY_UID,\r\n                                    :user_id AS CREATE_UID,\r\n                                    NOW() AS MODIFY_DATE,\r\n                                    NOW() AS CREATE_DATE\r\n                                    FROM\r\n                                        INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' AND table_name = \'table_details\'',3,1,1,'2019-10-24 09:01:25','2019-10-24 09:01:25'),(611,'SELECT \r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n                                    CONSTRAINT_NAME AS FK_NAME,\r\n                                    (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID,\r\n	                            :user_id AS MODIFY_UID,\r\n                                    :user_id AS CREATE_UID,\r\n                                    NOW() AS MODIFY_DATE,\r\n                                    NOW() AS CREATE_DATE\r\n                                    FROM\r\n                                        INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' AND table_name = \'tables\'',3,1,1,'2019-10-24 09:01:45','2019-10-24 09:01:45'),(612,'SELECT \r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID,\r\n                                    CONSTRAINT_NAME AS FK_NAME,\r\n                                    (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n                                    ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID,\r\n	                            :user_id AS MODIFY_UID,\r\n                                    :user_id AS CREATE_UID,\r\n                                    NOW() AS MODIFY_DATE,\r\n                                    NOW() AS CREATE_DATE\r\n                                    FROM\r\n                                        INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' AND table_name = \'tables\'',11,1,1,'2019-10-24 09:01:57','2019-10-24 09:01:57'),(613,'SELECT ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID, CONSTRAINT_NAME AS FK_NAME, (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID, ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' AND table_name = \'table_details\'',11,1,1,'2019-10-24 09:03:14','2019-10-24 09:03:14'),(614,'SELECT ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.TABLE_NAME AND \r\n        INFORMATION_SCHEMA.KEY_COLUMN_USAGE.COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS COLUMN_ID, CONSTRAINT_NAME AS FK_NAME,\r\n        (SELECT ID FROM phpapps.tables WHERE phpapps.tables.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME AND ORIGIN_ID = \'0\') AS FK_TABLE_ID,\r\n        ( SELECT ID FROM phpapps.view_table_details WHERE phpapps.view_table_details.TABLE_NAME = INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_TABLE_NAME \r\n         AND INFORMATION_SCHEMA.KEY_COLUMN_USAGE.REFERENCED_COLUMN_NAME = phpapps.view_table_details.COLUMN_NAME ) AS FK_COLUMN_ID, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE\r\n         FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE where TABLE_SCHEMA = \'phpapps\' AND table_name = \'table_details\' AND REFERENCED_TABLE_NAME <> \'\'',11,1,1,'2019-10-24 09:29:33','2019-10-24 09:29:33'),(615,'SELECT ID,COLUMN_NAME AS VALUE FROM phpapps.view_table_details WHERE TABLE_ID = \'275\' ORDER BY ORD',10,1,1,'2019-10-24 09:59:44','2019-10-24 09:59:44'),(616,'SELECT ID,COLUMN_NAME AS VALUE FROM phpapps.view_table_details WHERE TABLE_ID = \'275\'',3,1,1,'2019-10-24 10:52:53','2019-10-24 10:52:53'),(617,'select * from modules',3,1,1,'2019-10-24 12:47:36','2019-10-24 12:47:36'),(618,'SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID, \'0\' AS UNSIGN, SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE, IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL, IFNULL(COLUMN_DEFAULT,\'\') AS COLUMN_DEFAULT_VALUE, IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT, COLUMN_COMMENT AS DESCRIPTION, ORDINAL_POSITION AS ORD, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'applicants\' and table_schema = \'recrutare\'',3,1,1,'2019-10-24 12:56:53','2019-10-24 12:56:53'),(619,'SELECT \'317\' AS TABLE_ID, COLUMN_NAME, (SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID, \'0\' AS UNSIGN, SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE, IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL, IFNULL(COLUMN_DEFAULT,\'\') AS COLUMN_DEFAULT_VALUE, IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT, COLUMN_COMMENT AS DESCRIPTION, ORDINAL_POSITION AS ORD, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'applicants\' and table_schema = \'recrutare\'',3,1,1,'2019-10-24 12:58:13','2019-10-24 12:58:13'),(620,'SELECT \'317\' AS TABLE_ID, COLUMN_NAME, (SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID, \'0\' AS UNSIGN, SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE, IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL, IFNULL(COLUMN_DEFAULT,\'\') AS COLUMN_DEFAULT_VALUE, IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT, COLUMN_COMMENT AS DESCRIPTION, ORDINAL_POSITION AS ORD, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'applicant\' and table_schema = \'recrutare\'',3,1,1,'2019-10-24 13:01:14','2019-10-24 13:01:14'),(621,'SELECT ID,COLUMN_NAME AS VALUE FROM phpapps.table_idxs WHERE TABLE_ID = \'275\' ORDER BY ORD',10,1,1,'2019-10-25 06:30:26','2019-10-25 06:30:26'),(622,'SELECT ID,COLUMN_NAME AS VALUE FROM phpapps.table_indexes WHERE TABLE_ID = \'275\' ORDER BY ORD',10,1,1,'2019-10-25 06:30:56','2019-10-25 06:30:56'),(623,'SELECT * FROM phpapps.table_indexes WHERE TABLE_ID = \'275\' ORDER BY ORD',10,1,1,'2019-10-25 06:31:04','2019-10-25 06:31:04'),(624,'SELECT * FROM phpapps.table_indexes WHERE TABLE_ID = \'275\'',10,1,1,'2019-10-25 06:31:11','2019-10-25 06:31:11'),(625,'SELECT * FROM phpapps.table_indexes',10,1,1,'2019-10-25 06:31:16','2019-10-25 06:31:16'),(626,'SELECT DISTINCT\r\n    TABLE_NAME,\r\n    INDEX_NAME\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'users\';',11,1,1,'2019-10-25 06:54:51','2019-10-25 06:54:51'),(627,'SELECT DISTINCT\r\n    *\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'users\';',11,1,1,'2019-10-25 06:55:05','2019-10-25 06:55:05'),(628,'SELECT DISTINCT\r\n    *\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'table_details\';',11,1,1,'2019-10-25 06:55:20','2019-10-25 06:55:20'),(629,'SELECT DISTINCT\r\n    *\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\';',11,1,1,'2019-10-25 06:55:41','2019-10-25 06:55:41'),(630,'SELECT DISTINCT\r\n    *\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\';',11,1,1,'2019-10-25 07:17:36','2019-10-25 07:17:36'),(631,'SELECT DISTINCT\r\n    *\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\';',11,1,1,'2019-10-25 07:25:57','2019-10-25 07:25:57'),(632,'SELECT * FROM phpapps.table_indexes',10,1,1,'2019-10-25 07:26:26','2019-10-25 07:26:26'),(633,'SELECT DISTINCT\r\n  INDEX_NAME\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\';',3,1,1,'2019-10-25 07:28:25','2019-10-25 07:28:25'),(634,'SELECT DISTINCT\r\n  INDEX_NAME\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:29:04','2019-10-25 07:29:04'),(635,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*)\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:29:45','2019-10-25 07:29:45'),(636,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  INDEX_TYPE\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:30:23','2019-10-25 07:30:23'),(637,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',INDEX_TYPE)\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:31:33','2019-10-25 07:31:33'),(638,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 0,INDEX_TYPE,UNIQUE))\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:33:27','2019-10-25 07:33:27'),(639,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 0,INDEX_TYPE,\'UNIQUE\'))\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:33:34','2019-10-25 07:33:34'),(640,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 0,INDEX_TYPE,if(index_name = \'PRIMARY\',\'PRIMARY\',\'UNIQUE\')))\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:34:18','2019-10-25 07:34:18'),(641,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 0,INDEX_TYPE,\'UNIQUE\'))\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:35:37','2019-10-25 07:35:37'),(642,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,INDEX_TYPE,\'UNIQUE\'))\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:35:57','2019-10-25 07:35:57'),(643,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\'))\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:36:42','2019-10-25 07:36:42'),(644,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\'))\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:37:07','2019-10-25 07:37:07'),(645,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:37:31','2019-10-25 07:37:31'),(646,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n  GROUP_CONCAT(INDEX_COLUMNS)\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:39:44','2019-10-25 07:39:44'),(647,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n  GROUP_CONCAT(COLUMN_NAME) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:40:02','2019-10-25 07:40:02'),(648,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n  (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN ( GROUP_CONCAT(COLUMN_NAME) ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:42:52','2019-10-25 07:42:52'),(649,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(COLUMN_NAME)\r\n -- (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN ( GROUP_CONCAT(COLUMN_NAME) ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:43:17','2019-10-25 07:43:17'),(650,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\'\\\'\'COLUMN_NAME\'\\\'\')\r\n -- (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN ( GROUP_CONCAT(COLUMN_NAME) ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:43:44','2019-10-25 07:43:44'),(651,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\")\r\n -- (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN ( GROUP_CONCAT(COLUMN_NAME) ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:44:08','2019-10-25 07:44:08'),(652,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\")\r\n (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN ( GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\") ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:44:27','2019-10-25 07:44:27'),(653,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\")\r\n (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN ( GROUP_CONCAT(\"\'\",INFORMATION_SCHEMA.STATISTICS.COLUMN_NAME,\"\'\") ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:45:22','2019-10-25 07:45:22'),(654,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\")\r\n (SELECT ID  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN ( GROUP_CONCAT(\"\'\",INFORMATION_SCHEMA.STATISTICS.COLUMN_NAME,\"\'\") ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:46:14','2019-10-25 07:46:14'),(655,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\")\r\n (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN ( GROUP_CONCAT(\"\'\",INFORMATION_SCHEMA.STATISTICS.COLUMN_NAME,\"\'\") ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:46:32','2019-10-25 07:46:32'),(656,'SELECT * FROM phpapps.table_details',10,1,1,'2019-10-25 07:47:09','2019-10-25 07:47:09'),(657,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\")\r\n (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN ( GROUP_CONCAT(\"\'\",INFORMATION_SCHEMA.STATISTICS.COLUMN_NAME,\"\'\") ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:47:26','2019-10-25 07:47:26'),(658,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\")\r\n (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS WHERE INDEX_NAME = INDEX_NAME ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:48:36','2019-10-25 07:48:36'),(659,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS WHERE INDEX_NAME = INDEX_NAME ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:48:57','2019-10-25 07:48:57'),(660,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\") ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:49:35','2019-10-25 07:49:35'),(661,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS WHERE INDEX_NAME = INDEX_NAME ) ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:50:43','2019-10-25 07:50:43'),(662,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = INDEX_NAME ) ) AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:51:11','2019-10-25 07:51:11'),(663,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT( phpapps.table_details.ID)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = INDEX_NAME )  AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:51:19','2019-10-25 07:51:19'),(664,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT( phpapps.table_details.COLUMN_NAME)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = INDEX_NAME )  AND TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:51:38','2019-10-25 07:51:38'),(665,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT( phpapps.table_details.COLUMN_NAME)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = INDEX_NAME )  AND TABLE_ID =\'275\') AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:52:32','2019-10-25 07:52:32'),(666,'SELECT GROUP_CONCAT( phpapps.table_details.COLUMN_NAME)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = INDEX_NAME )  AND TABLE_ID =\'275\'',10,1,1,'2019-10-25 07:52:57','2019-10-25 07:52:57'),(667,'SELECT GROUP_CONCAT( phpapps.table_details.COLUMN_NAME)  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )  AND TABLE_ID =\'275\'',10,1,1,'2019-10-25 07:53:25','2019-10-25 07:53:25'),(668,'SELECT phpapps.table_details.COLUMN_NAME  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )  AND TABLE_ID =\'275\'',10,1,1,'2019-10-25 07:53:34','2019-10-25 07:53:34'),(669,'SELECT phpapps.table_details.COLUMN_NAME  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )  AND TABLE_ID =\'275\'',10,1,1,'2019-10-25 07:53:59','2019-10-25 07:53:59'),(670,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT ID  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = INDEX_NAME )  AND TABLE_ID =\'275\') AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 07:54:50','2019-10-25 07:54:50'),(671,'SELECT phpapps.table_details.COLUMN_NAME  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 07:55:14','2019-10-25 07:55:14'),(672,'SELECT phpapps.table_details.COLUMN_NAME  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 07:55:15','2019-10-25 07:55:15'),(673,'SELECT phpapps.table_details.COLUMN_NAME  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT INFORMATION_SCHEMA.STATISTICS.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 07:55:57','2019-10-25 07:55:57'),(674,'SELECT phpapps.table_details.COLUMN_NAME  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT INFORMATION_SCHEMA.STATISTICS.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 07:56:36','2019-10-25 07:56:36'),(675,'SELECT INFORMATION_SCHEMA.STATISTICS.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX',10,1,1,'2019-10-25 07:57:08','2019-10-25 07:57:08'),(676,'SELECT INFORMATION_SCHEMA.STATISTICS.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 07:57:26','2019-10-25 07:57:26'),(677,'SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 07:57:37','2019-10-25 07:57:37'),(678,'SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 07:57:48','2019-10-25 07:57:48'),(679,'SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 07:58:00','2019-10-25 07:58:00'),(680,'SELECT phpapps.table_details.COLUMN_NAME  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 07:58:22','2019-10-25 07:58:22'),(681,'SELECT phpapps.table_details.COLUMN_NAME  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT TRIM(COLUMN_NAME) FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 07:58:55','2019-10-25 07:58:55'),(682,'SELECT phpapps.table_details.COLUMN_NAME  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 07:59:02','2019-10-25 07:59:02'),(683,'SELECT INFORMATION_SCHEMA.STATISTICS.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 07:59:31','2019-10-25 07:59:31'),(684,'SELECT aa.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 07:59:42','2019-10-25 07:59:42'),(685,'SELECT phpapps.table_details.COLUMN_NAME  from phpapps.table_details WHERE phpapps.table_details.COLUMN_NAME IN (SELECT aa.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 07:59:49','2019-10-25 07:59:49'),(686,'SELECT bb.COLUMN_NAME  from phpapps.table_details bb WHERE bb.COLUMN_NAME IN (SELECT aa.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 08:00:11','2019-10-25 08:00:11'),(687,'SELECT bb.COLUMN_NAME  from phpapps.table_details bb WHERE bb.COLUMN_NAME IN (SELECT aa.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 08:00:12','2019-10-25 08:00:12'),(688,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT ID  from phpapps.table_details WHERE  TABLE_ID =\'275\') AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:01:15','2019-10-25 08:01:15'),(689,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n GROUP_CONCAT(SELECT ID  from phpapps.table_details WHERE  TABLE_ID =\'275\') AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:01:26','2019-10-25 08:01:26'),(690,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n GROUP_CONCAT((SELECT ID  from phpapps.table_details WHERE  TABLE_ID =\'275\')) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:01:45','2019-10-25 08:01:45'),(691,'SELECT DISTINCT\r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT(ID)  from phpapps.table_details WHERE  TABLE_ID =\'275\' GROUP BY TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:02:22','2019-10-25 08:02:22'),(692,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' GROUP BY td.TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:03:27','2019-10-25 08:03:27'),(693,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN( \'VIEW_ID2\',\'MUMUSA\') GROUP BY td.TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:04:00','2019-10-25 08:04:00'),(694,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN( SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS) GROUP BY td.TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:04:41','2019-10-25 08:04:41'),(695,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN( SELECT s2.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS s2) GROUP BY td.TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:04:59','2019-10-25 08:04:59'),(696,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN( SELECT s2.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS s2) GROUP BY td.TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:05:00','2019-10-25 08:05:00'),(697,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\"),\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN( GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\")) GROUP BY td.TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:06:25','2019-10-25 08:06:25'),(698,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\") AS aas,\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN( aas) GROUP BY td.TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:06:45','2019-10-25 08:06:45'),(699,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\") AS aas,\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' GROUP BY td.TABLE_ID) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:07:06','2019-10-25 08:07:06'),(700,'SELECT bb.COLUMN_NAME  from phpapps.table_details bb WHERE bb.COLUMN_NAME IN (SELECT aa.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 08:07:32','2019-10-25 08:07:32'),(701,'SELECT bb.ID  from phpapps.table_details bb WHERE bb.COLUMN_NAME IN (SELECT aa.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 08:07:51','2019-10-25 08:07:51'),(702,'SELECT bb.ID  from phpapps.table_details bb WHERE bb.COLUMN_NAME IN (SELECT aa.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 08:07:52','2019-10-25 08:07:52'),(703,'SELECT bb.ID  from phpapps.table_details bb WHERE bb.COLUMN_NAME IN (SELECT GROUP_CONCAT (aa.COLUMN_NAME) FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 08:08:28','2019-10-25 08:08:28'),(704,'SELECT bb.ID  from phpapps.table_details bb WHERE bb.COLUMN_NAME IN (SELECT GROUP_CONCAT (\"\'\",aa.COLUMN_NAME\"\'\") FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 08:08:42','2019-10-25 08:08:42'),(705,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\") AS aas,\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' GROUP BY td.TABLE_ID having GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\") =  GROUP_CONCAT(td.COLUMN_NAME) ) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:51:09','2019-10-25 08:51:09'),(706,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\") AS aas,\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' GROUP BY td.TABLE_ID having GROUP_CONCAT(\"\'\",INFORMATION_SCHEMA.STATISTICS.COLUMN_NAME,\"\'\") =  GROUP_CONCAT(td.COLUMN_NAME) ) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:51:29','2019-10-25 08:51:29'),(707,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\") AS aas,\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' GROUP BY td.TABLE_ID having td.COLUMN_NAME in  (\'test\',\'GOGU\') ) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:53:31','2019-10-25 08:53:31'),(708,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\") AS aas,\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\' GROUP BY td.TABLE_ID ) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:53:53','2019-10-25 08:53:53'),(709,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\") AS aas,\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\'  ) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:56:43','2019-10-25 08:56:43'),(710,'SELECT \r\n  INDEX_NAME,\r\n  count(*),\r\n  if(index_name = \'PRIMARY\',\'PRIMARY\',if(NON_UNIQUE = 1,IF(INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",COLUMN_NAME,\"\'\") AS aas,\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td WHERE  td.TABLE_ID =\'275\'  where td.COLUMN_NAME in  (SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = INDEX_NAME )) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS\r\nWHERE TABLE_SCHEMA = \'phpapps\' AND TABLE_NAME = \'test_cols\' GROUP BY INDEX_NAME;',3,1,1,'2019-10-25 08:58:02','2019-10-25 08:58:02'),(711,'SELECT \r\n  s.INDEX_NAME,\r\n  count(*),\r\n  if(s.index_name = \'PRIMARY\',\'PRIMARY\',if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS aas,\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td \r\n WHERE  td.TABLE_ID =\'275\'  where td.COLUMN_NAME in  (SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = s.INDEX_NAME )) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS s\r\nWHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',3,1,1,'2019-10-25 08:59:27','2019-10-25 08:59:27'),(712,'SELECT \r\n  s.INDEX_NAME,\r\n  count(*),\r\n  if(s.index_name = \'PRIMARY\',\'PRIMARY\',if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n   GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS aas,\r\n (SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td \r\n		WHERE  td.TABLE_ID =\'275\'  where td.COLUMN_NAME IN  \r\n (SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = s.INDEX_NAME )) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS s\r\nWHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME',3,1,1,'2019-10-25 09:01:22','2019-10-25 09:01:22'),(713,'SELECT \r\n  s.INDEX_NAME,\r\n  count(*),\r\n  IF(s.index_name = \'PRIMARY\',\'PRIMARY\',if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n  GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS aas,\r\n	(SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\'  where td.COLUMN_NAME IN  \r\n						(SELECT GROUP_CONCAT(bb.COLUMN_NAME) FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = s.INDEX_NAME )) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS s\r\nWHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',3,1,1,'2019-10-25 09:03:33','2019-10-25 09:03:33'),(714,'SELECT \r\n  s.INDEX_NAME,\r\n  count(*),\r\n  IF(s.index_name = \'PRIMARY\',\'PRIMARY\',if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n  GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS aas,\r\n	(SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN  \r\n						(SELECT GROUP_CONCAT(bb.COLUMN_NAME) FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = s.INDEX_NAME )) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS s\r\nWHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',3,1,1,'2019-10-25 09:03:54','2019-10-25 09:03:54'),(715,'SELECT \r\n  s.INDEX_NAME,\r\n  count(*),\r\n  IF(s.index_name = \'PRIMARY\',\'PRIMARY\',if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n  GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS aas,\r\n	(SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN  \r\n						(SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = s.INDEX_NAME )) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS s\r\nWHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',3,1,1,'2019-10-25 09:06:36','2019-10-25 09:06:36'),(716,'SELECT \r\n  s.INDEX_NAME,\r\n  count(*),\r\n  IF(s.index_name = \'PRIMARY\',\'PRIMARY\',if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n  GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS aas,\r\n	(SELECT GROUP_CONCAT(td.ID)  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN  \r\n						(SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = s.INDEX_NAME )) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS s\r\nWHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',3,1,1,'2019-10-25 09:07:14','2019-10-25 09:07:14'),(717,'SELECT \r\n  s.INDEX_NAME,\r\n  count(*),\r\n  IF(s.index_name = \'PRIMARY\',\'PRIMARY\',if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n  GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS aas,\r\n	(SELECT td.ID  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN  \r\n						(SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = s.INDEX_NAME )) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS s\r\nWHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',3,1,1,'2019-10-25 09:07:33','2019-10-25 09:07:33'),(718,'SELECT \r\n  s.INDEX_NAME,\r\n  count(*),\r\n  IF(s.index_name = \'PRIMARY\',\'PRIMARY\',if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE,\r\n  GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS aas,\r\n	(SELECT td.ID  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN  \r\n						(SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = s.INDEX_NAME )) AS INDEX_COLUMNS\r\nFROM INFORMATION_SCHEMA.STATISTICS s\r\nWHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',3,1,1,'2019-10-25 09:07:39','2019-10-25 09:07:39'),(719,'SELECT td.ID  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' AND td.COLUMN_NAME IN  \r\n						(SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 09:08:29','2019-10-25 09:08:29'),(720,'SELECT td.ID  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' union all\r\n						SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 09:09:11','2019-10-25 09:09:11'),(721,'SELECT td.CLUMN_NAME  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' union all\r\n						SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 09:10:05','2019-10-25 09:10:05'),(722,'SELECT td.COLUMN_NAME  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' union all\r\n						SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 09:10:14','2019-10-25 09:10:14'),(723,'SELECT concat(\'|\',td.COLUMN_NAME,\'|\')  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' union all\r\n						SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 09:10:54','2019-10-25 09:10:54'),(724,'SELECT concat(\'|\',td.COLUMN_NAME,\'|\')  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' union all\r\n						SELECT concat(\'|\',bb.COLUMN_NAME,\'|\') FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 09:11:12','2019-10-25 09:11:12'),(725,'SELECT concat(\'|\',td.COLUMN_NAME,\'|\')  from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' and concat(\'|\',td.COLUMN_NAME,\'|\') in \r\n						 ( SELECT concat(\'|\',bb.COLUMN_NAME,\'|\') FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 09:12:06','2019-10-25 09:12:06'),(726,'SELECT td.COLUMN_NAME from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' and td.COLUMN_NAME in \r\n						 ( SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 09:12:37','2019-10-25 09:12:37'),(727,'SELECT td.COLUMN_NAME from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' and td.COLUMN_NAME in \r\n						 ( SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )\r\n						 union all SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 09:12:53','2019-10-25 09:12:53'),(728,'SELECT td.COLUMN_NAME,td.id from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' and td.COLUMN_NAME in \r\n						 ( SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )\r\n						 union all SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 09:17:00','2019-10-25 09:17:00'),(729,'SELECT td.COLUMN_NAME,td.id from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' and td.COLUMN_NAME in \r\n						 ( SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb WHERE bb.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\' )',10,1,1,'2019-10-25 09:17:09','2019-10-25 09:17:09'),(730,'SELECT td.COLUMN_NAME,td.id from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' and td.COLUMN_NAME in \r\n						 ( SELECT bb.COLUMN_NAME FROM INFORMATION_SCHEMA.STATISTICS bb  )',10,1,1,'2019-10-25 09:18:04','2019-10-25 09:18:04'),(731,'SELECT td.COLUMN_NAME,td.id from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\'',10,1,1,'2019-10-25 09:18:29','2019-10-25 09:18:29'),(732,'SELECT td.COLUMN_NAME,td.id from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' and td.column_name in (select column_name from INFORMATION_SCHEMA.STATISTICS)',10,1,1,'2019-10-25 09:19:35','2019-10-25 09:19:35'),(733,'SELECT td.COLUMN_NAME,td.id from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' and td.column_name in (select column_name from INFORMATION_SCHEMA.STATISTICS limit 100)',10,1,1,'2019-10-25 09:19:47','2019-10-25 09:19:47'),(734,'SELECT td.COLUMN_NAME,td.id from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\' and td.column_name in (select column_name from INFORMATION_SCHEMA.STATISTICS where table_name = \'test_cols\')',10,1,1,'2019-10-25 09:20:08','2019-10-25 09:20:08'),(735,'select column_name from INFORMATION_SCHEMA.STATISTICS where table_name = \'test_cols\'',10,1,1,'2019-10-25 09:20:18','2019-10-25 09:20:18'),(736,'SELECT td.COLUMN_NAME,td.id from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\'',10,1,1,'2019-10-25 09:20:39','2019-10-25 09:20:39'),(737,'SELECT td.COLUMN_NAME,td.id from phpapps.table_details td \r\n			WHERE  td.TABLE_ID =\'275\'  and td.column_name in (select column_name from INFORMATION_SCHEMA.STATISTICS where table_name = \'test_cols\')',10,1,1,'2019-10-25 09:21:21','2019-10-25 09:21:21'),(738,'SELECT * from phpapps.table_indexes',10,1,1,'2019-10-25 10:06:51','2019-10-25 10:06:51'),(739,'SELECT GROUP_CONCAT (\"\'\",aa.COLUMN_NAME\"\'\") FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 10:08:08','2019-10-25 10:08:08'),(740,'SELECT * FROM INFORMATION_SCHEMA.STATISTICS aa WHERE aa.INDEX_NAME = \'phpapps_test_cols_566_567_IDX\'',10,1,1,'2019-10-25 10:08:14','2019-10-25 10:08:14'),(741,'select * from phpapps.list_index_types',10,1,1,'2019-10-25 10:23:46','2019-10-25 10:23:46'),(742,'SELECT \'275\' AS TABLE_ID, s.INDEX_NAME, IF(s.index_name = \'PRIMARY\',\'PRIMARY\',\r\n				   (SELECT i.ID FROM phpapps.list_index_types i WHERE i.VALUE = ( if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\'))) AS INDEX_TYPE, GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS INDEX_COLUMNS, \r\n				   s.COMMENT AS DESCRIPTION, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.STATISTICS s WHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',10,1,1,'2019-10-25 10:24:11','2019-10-25 10:24:11'),(743,'SELECT \'275\' AS TABLE_ID, s.INDEX_NAME, IF(s.index_name = \'PRIMARY\',\'PRIMARY\',\r\n				   (SELECT i.ID FROM phpapps.list_index_types i WHERE i.VALUE = ( if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE, GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS INDEX_COLUMNS, \r\n				   s.COMMENT AS DESCRIPTION, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.STATISTICS s WHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',10,1,1,'2019-10-25 10:24:19','2019-10-25 10:24:19'),(744,'SELECT \'275\' AS TABLE_ID, s.INDEX_NAME, IF(s.index_name = \'PRIMARY\',\'PRIMARY\',\r\n				   (SELECT i.ID FROM phpapps.list_index_types i WHERE i.VALUE =  if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE, GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS INDEX_COLUMNS, \r\n				   s.COMMENT AS DESCRIPTION, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.STATISTICS s WHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',10,1,1,'2019-10-25 10:24:34','2019-10-25 10:24:34'),(745,'SELECT \'275\' AS TABLE_ID, s.INDEX_NAME, IF(s.index_name = \'PRIMARY\',\'PRIMARY\',\r\n				   (SELECT i.ID FROM phpapps.list_index_types i WHERE i.VALUE =  if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) AS INDEX_TYPE, GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS INDEX_COLUMNS, \r\n				   s.COMMENT AS DESCRIPTION, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.STATISTICS s WHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',10,1,1,'2019-10-25 10:24:35','2019-10-25 10:24:35'),(746,'SELECT \'275\' AS TABLE_ID, s.INDEX_NAME, IF(s.index_name = \'PRIMARY\',\'PRIMARY\',\r\n				   (SELECT i.ID FROM phpapps.list_index_types i WHERE i.VALUE = ( if(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) ) AS INDEX_TYPE, GROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS INDEX_COLUMNS, \r\n				   s.COMMENT AS DESCRIPTION, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.STATISTICS s WHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',10,1,1,'2019-10-25 10:25:03','2019-10-25 10:25:03'),(747,'SELECT \'275\' AS TABLE_ID, s.INDEX_NAME, IF(s.index_name = \'PRIMARY\',\'PRIMARY\',\r\n(SELECT i.ID FROM phpapps.list_index_types i WHERE i.VALUE =  IF(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\') ) AS INDEX_TYPE, \r\nGROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS INDEX_COLUMNS, \r\n				   s.COMMENT AS DESCRIPTION, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.STATISTICS s WHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',10,1,1,'2019-10-25 10:27:41','2019-10-25 10:27:41'),(748,'SELECT \'275\' AS TABLE_ID, s.INDEX_NAME, \r\n(SELECT i.ID FROM phpapps.list_index_types i WHERE i.VALUE =  IF(s.index_name = \'PRIMARY\',\'PRIMARY\',IF(s.NON_UNIQUE = 1,IF(s.INDEX_TYPE = \'FULLTEXT\',\'FULLTEXT\',\'INDEX\'),\'UNIQUE\')) ) AS INDEX_TYPE, \r\nGROUP_CONCAT(\"\'\",s.COLUMN_NAME,\"\'\") AS INDEX_COLUMNS, \r\n				   s.COMMENT AS DESCRIPTION, \'1\' AS MODIFY_UID, \'1\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.STATISTICS s WHERE s.TABLE_SCHEMA = \'phpapps\' AND s.TABLE_NAME = \'test_cols\' GROUP BY s.INDEX_NAME;',10,1,1,'2019-10-25 10:28:58','2019-10-25 10:28:58'),(749,'select * from phpapps.view_tables',10,1,1,'2019-10-28 10:49:48','2019-10-28 10:49:48'),(753,'select * from phpapps.sql_sintax',3,1,1,'2019-10-29 07:50:19','2019-10-29 07:50:19'),(754,'SELECT ID AS VALUE, CONCAT(\'(\',APP_NAME,\'/\', MODULE_NAME,\') \',TABLE_NAME) AS LABEL FROM phpapps.view_tables WHERE MODULE_ID <> \'7\' AND TABLE_TYPE = \'2\' GROUP BY CONCAT(TABLE_SCHEMA,\'.\',TABLE_NAME) ORDER BY APP_NAME,MODULE_NAME,TABLE_NAME',3,1,1,'2019-11-09 10:52:10','2019-11-09 10:52:10'),(755,'SELECT ID AS VALUE, CONCAT(\'(\',APP_NAME,\'/\', MODULE_NAME,\') \',TABLE_NAME) AS LABEL FROM phpapps.view_tables WHERE MODULE_ID <> \'7\' AND TABLE_TYPE = \'2\' GROUP BY ID,CONCAT(TABLE_SCHEMA,\'.\',TABLE_NAME) ORDER BY APP_NAME,MODULE_NAME,TABLE_NAME',3,1,1,'2019-11-09 10:53:17','2019-11-09 10:53:17'),(756,'ALTER TABLE phpapps.user_profiles ADD CONSTRAINT phpapps_user_profiles_THEME_ID_FK FOREIGN KEY (THEME_ID) REFERENCES phpapps.themes (ID)',3,1,1,'2019-11-09 11:05:44','2019-11-09 11:05:44'),(757,'select * from phpapps.user_profiles ;',3,1,1,'2019-11-10 07:09:17','2019-11-10 07:09:17'),(758,'select * from phpapps.user_profiles ;',3,1,1,'2019-11-10 07:11:20','2019-11-10 07:11:20'),(759,'select *,t.theme from phpapps.user_profiles up left join themes t on (up.theme_od = t.ID) ;',3,1,1,'2019-11-10 07:12:20','2019-11-10 07:12:20'),(760,'select *,t.name from phpapps.user_profiles up left join themes t on (up.theme_od = t.ID) ;',3,1,1,'2019-11-10 07:12:27','2019-11-10 07:12:27'),(761,'select * from themes',3,1,1,'2019-11-10 07:12:44','2019-11-10 07:12:44'),(762,'select *,t.THEME_NAME,t.CSS_FILE from phpapps.user_profiles up left join themes t on (up.theme_od = t.ID) ;',3,1,1,'2019-11-10 07:13:08','2019-11-10 07:13:08'),(763,'select *,t.THEME_NAME,t.CSS_FILE from phpapps.user_profiles up left join themes t on (up.theme_id = t.ID) ;',3,1,1,'2019-11-10 07:13:16','2019-11-10 07:13:16'),(764,'select * from phpapps.user_profiles up left join themes t on (up.theme_id = t.ID) ;',3,1,1,'2019-11-10 07:14:00','2019-11-10 07:14:00'),(765,'select up.* from phpapps.user_profiles up left join themes t on (up.theme_id = t.ID) ;',3,1,1,'2019-11-10 07:14:10','2019-11-10 07:14:10'),(766,'select up.*,t.* from phpapps.user_profiles up left join themes t on (up.theme_id = t.ID) ;',3,1,1,'2019-11-10 07:14:26','2019-11-10 07:14:26'),(767,'select up.*,t.*,s.* from phpapps.user_profiles up left join themes t on (up.theme_id = t.ID) left join scripts.s on (up.script_id = s.id);',3,1,1,'2019-11-10 07:15:19','2019-11-10 07:15:19'),(768,'show tables',3,1,1,'2019-11-10 07:15:45','2019-11-10 07:15:45'),(769,'select up.*,t.*,s.* from phpapps.user_profiles up left join phpapps.themes t on (up.theme_id = t.ID) left join phpapps.scripts s on (up.script_id = s.id);',3,1,1,'2019-11-10 07:16:08','2019-11-10 07:16:08'),(770,'select * from user profiles',3,1,1,'2019-11-10 07:18:32','2019-11-10 07:18:32'),(771,'select * from user_profiles',3,1,1,'2019-11-10 07:18:40','2019-11-10 07:18:40'),(772,'select up.*,t.THEME_NAME, t.CSS_FILE,s.* from phpapps.user_profiles up left join phpapps.themes t on (up.theme_id = t.ID) left join phpapps.scripts s on (up.script_id = s.id);',3,1,1,'2019-11-10 07:19:18','2019-11-10 07:19:18'),(773,'select up.*,t.THEME_NAME, t.CSS_FILE,s.SCRIPT_NAME from phpapps.user_profiles up left join phpapps.themes t on (up.theme_id = t.ID) left join phpapps.scripts s on (up.script_id = s.id);',3,1,1,'2019-11-10 07:19:34','2019-11-10 07:19:34'),(774,'select * from users',3,1,1,'2019-11-10 07:23:14','2019-11-10 07:23:14'),(775,'show tables like \'list%\'',3,1,1,'2019-11-10 11:29:31','2019-11-10 11:29:31'),(776,'select * from scripts',3,1,1,'2019-11-10 19:28:23','2019-11-10 19:28:23'),(777,'select * from view_scripts',3,1,1,'2019-11-10 19:28:48','2019-11-10 19:28:48'),(778,'select * from view_forms',3,1,1,'2019-11-10 19:29:20','2019-11-10 19:29:20'),(779,'select * from scripts',3,1,1,'2019-11-10 19:50:33','2019-11-10 19:50:33'),(780,'select * from view_scripts',3,1,1,'2019-11-10 19:50:38','2019-11-10 19:50:38'),(781,'SELECT ID, CONCAT(FORM_NAME,\"_imp (\",APP_NAME,\":\", MODULE_NAME, \")\") AS ACTION_FILE, \"FORM\" AS ACTION_TYPE FROM phpapps.view_forms union all\r\nSELECT ID, CONCAT(SCRIPT_NAME,\"_imp (\",APP_NAME,\":\", MODULE_NAME, \")\") AS ACTION_FILE, \"SCRIPT\" AS ACTION_TYPE FROM phpapps.view_scripts',3,1,1,'2019-11-10 19:51:56','2019-11-10 19:51:56'),(782,'select * from view_actions',3,1,1,'2019-11-10 19:53:17','2019-11-10 19:53:17'),(783,'show tables',3,1,1,'2019-11-19 10:25:16','2019-11-19 10:25:16'),(784,'select * from applications',3,1,1,'2019-11-19 10:25:52','2019-11-19 10:25:52'),(785,'select * from applications',3,1,1,'2019-11-19 10:26:21','2019-11-19 10:26:21'),(786,'select * from view_applications',3,1,1,'2019-11-19 10:40:27','2019-11-19 10:40:27'),(787,'select * from applications',3,1,1,'2019-11-19 10:40:35','2019-11-19 10:40:35'),(788,'SELECT app.*,lay.NAME FROM phpapps.applications app LEFT JOIN phpapps.layouts lay ON (app.LAYOUT_ID = lay.ID)',3,1,1,'2019-11-19 10:42:49','2019-11-19 10:42:49'),(789,'SELECT app.*,lay.NAME AS LAYOUT_NAME FROM phpapps.applications app LEFT JOIN phpapps.layouts lay ON (app.LAYOUT_ID = lay.ID)',3,1,1,'2019-11-19 10:43:18','2019-11-19 10:43:18'),(790,'select * from view_applications',3,1,1,'2019-11-19 10:44:16','2019-11-19 10:44:16'),(791,'select * from view_applications',3,1,1,'2019-11-19 11:09:33','2019-11-19 11:09:33'),(792,'select * from view_applications',3,1,1,'2019-11-19 12:46:38','2019-11-19 12:46:38'),(793,'select * from view_applications',3,1,1,'2019-11-19 12:51:22','2019-11-19 12:51:22'),(794,'select * from scripts',1,1,1,'2019-11-20 07:08:27','2019-11-20 07:08:27'),(795,'select * from scripts',3,1,1,'2019-11-20 07:08:38','2019-11-20 07:08:38'),(796,'select * from forms',1,1,1,'2019-11-20 07:08:51','2019-11-20 07:08:51'),(797,'select * from forms',3,1,1,'2019-11-20 07:09:02','2019-11-20 07:09:02'),(798,'select * from forms',3,1,1,'2019-11-20 08:22:26','2019-11-20 08:22:26'),(799,'select * from forms',3,1,1,'2019-11-20 08:24:07','2019-11-20 08:24:07'),(800,'select *\r\nfrom information_schema.KEY_COLUMN_USAGE\r\nwhere table_schema = \'my_database\'\r\nand referenced_table_name = \'my_table_here\';',3,1,1,'2019-11-20 08:51:46','2019-11-20 08:51:46'),(801,'select *\r\nfrom information_schema.KEY_COLUMN_USAGE\r\nwhere table_schema = \'phpapps\'\r\nand referenced_table_name = \'scripts\';',3,1,1,'2019-11-20 08:52:02','2019-11-20 08:52:02'),(802,'show create view view_scripts;',3,1,1,'2019-11-20 09:04:20','2019-11-20 09:04:20'),(803,'select `s`.`ID` AS `ID`,`s`.`SCRIPT_NAME` AS `SCRIPT_NAME`,`a`.`ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`m`.`ID` AS `MODULE_ID`,`m`.`MODULE_NAME` AS `MODULE_NAME` from ((`scripts` `s` join `modules` `m`) join `applications` `a`) where ((`s`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`))',3,1,1,'2019-11-20 09:04:36','2019-11-20 09:04:36'),(804,'show create view view_forms',3,1,1,'2019-11-20 09:05:03','2019-11-20 09:05:03'),(805,'select `f`.`ID` AS `ID`,`f`.`FORM_NAME` AS `FORM_NAME`,`f`.`MODULE_ID` AS `MODULE_ID`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`f`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`VALUE` AS `TABLE_SCHEMA`,`f`.`FORM_QUERY` AS `FORM_QUERY`,`f`.`FORM_PHP_DIR` AS `FORM_PHP_DIR`,`f`.`FORM_TPL_DIR` AS `FORM_TPL_DIR`,`f`.`DESCRIPTION` AS `DESCRIPTION` from ((((`forms` `f` join `modules` `m`) join `applications` `a`) join `tables` `t`) join `list_databases` `d`) where ((`f`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`f`.`TABLE_ID` = `t`.`ID`) and (`t`.`SCHEMA_ID` = `d`.`ID`))',3,1,1,'2019-11-20 09:05:10','2019-11-20 09:05:10'),(806,'select `f`.`ID` AS `ID`,\r\n`f`.`SCRIPT_NAME` AS `FORM_NAME`,`f`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,\r\n`f`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`VALUE` AS `TABLE_SCHEMA`,\r\n`f`.`FORM_QUERY` AS `FORM_QUERY`,`f`.`FORM_PHP_DIR` AS `FORM_PHP_DIR`,`f`.`FORM_TPL_DIR` AS `FORM_TPL_DIR`,`f`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`scripts` `f` join `modules` `m`) join `applications` `a`) join `tables` `t`) join `list_databases` `d`) where ((`f`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`f`.`TABLE_ID` = `t`.`ID`) and (`t`.`SCHEMA_ID` = `d`.`ID`))',3,1,1,'2019-11-20 09:06:16','2019-11-20 09:06:16'),(807,'select * from scripts',3,1,1,'2019-11-20 09:07:31','2019-11-20 09:07:31'),(808,'select `f`.`ID` AS `ID`,\r\n`f`.`SCRIPT_NAME` AS `FORM_NAME`,`f`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,\r\n`f`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`VALUE` AS `TABLE_SCHEMA`,\r\n`f`.`FORM_QUERY` AS `FORM_QUERY`,`f`.`FORM_PHP_DIR` AS `FORM_PHP_DIR`,`f`.`FORM_TPL_DIR` AS `FORM_TPL_DIR`,`f`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`scripts` `f` join `modules` `m`) join `applications` `a`) join `tables` `t`) join `list_databases` `d`) where ((`f`.`MODULE_ID` = `m`.`ID`) and \r\n(`m`.`APP_ID` = `a`.`ID`) and (`f`.`TABLE_ID` = `t`.`ID`) and (`t`.`SCHEMA_ID` = `d`.`ID`)) and `f`.`WEB_TYPE_ID` = \'1\'',3,1,1,'2019-11-20 09:07:56','2019-11-20 09:07:56'),(809,'show create view scripts',3,1,1,'2019-11-20 09:09:15','2019-11-20 09:09:15'),(810,'show create view view_scripts',3,1,1,'2019-11-20 09:09:21','2019-11-20 09:09:21'),(811,'select * from scripts',3,1,1,'2019-11-20 09:10:11','2019-11-20 09:10:11'),(812,'show create view view_users;',3,1,1,'2019-11-20 09:14:45','2019-11-20 09:14:45'),(813,'select `u`.`ID` AS `ID`,`u`.`USERNAME` AS `USERNAME`,`u`.`PASSWORD` AS `PASSWORD`,`u`.`FIRSTNAME` AS `FIRSTNAME`,`u`.`LASTNAME` AS `LASTNAME`,`u`.`EMAIL` AS `EMAIL`,`u`.`USER_TYPE` AS `USER_TYPE`,`u`.`DESCRIPTION` AS `DESCRIPTION`,`u`.`PROFILE_ID` AS `PROFILE_ID`,`up`.`PROFILE_NAME` AS `PROFILE_NAME`,`up`.`SCRIPT_ID` AS `SCRIPT_ID`,`s`.`SCRIPT_NAME` AS `SCRIPT_NAME` from ((`users` `u` join `user_profiles` `up`) join `scripts` `s`) where ((`u`.`PROFILE_ID` = `up`.`ID`) and (`up`.`SCRIPT_ID` = `s`.`ID`))',3,1,1,'2019-11-20 09:14:56','2019-11-20 09:14:56'),(814,'select * from scripts',3,1,1,'2019-11-20 09:16:29','2019-11-20 09:16:29'),(815,'select * from scripts where web_type_id = \'2\'',3,1,1,'2019-11-20 09:16:43','2019-11-20 09:16:43'),(816,'select * from  view_users',3,1,1,'2019-11-20 09:18:01','2019-11-20 09:18:01'),(817,'SELECT ID, MODULE_NAME, MODULE_TITLE, DESCRIPTION, SCRIPT_NAME, CONCAT(\'http://localhost:89/phpapps_dev/\' ,APP_NAME,\'/\',SCRIPT_NAME) AS SCRIPT_PATH FROM phpapps.view_modules WHERE APP_ID = \'1\' ORDER BY MODULE_NAMESELECT ID, MODULE_NAME, MODULE_TITLE, DESCRIPTION, SCRIPT_NAME, CONCAT(\'http://localhost:89/phpapps_dev/\' ,APP_NAME,\'/\',SCRIPT_NAME) AS SCRIPT_PATH FROM phpapps.view_modules WHERE APP_ID = \'7\' ORDER BY MODULE_NAMESELECT ID, MODULE_NAME, MODULE_TITLE, DESCRIPTION, SCRIPT_NAME, CONCAT(\'http://localhost:89/phpapps_dev/\' ,APP_NAME,\'/\',SCRIPT_NAME) AS SCRIPT_PATH FROM phpapps.view_modules WHERE APP_ID = \'8\' ORDER BY MODULE_NAMESELECT ID, MODULE_NAME, MODULE_TITLE, DESCRIPTION, SCRIPT_NAME, CONCAT(\'http://localhost:89/phpapps_dev/\' ,APP_NAME,\'/\',SCRIPT_NAME) AS SCRIPT_PATH FROM phpapps.view_modules WHERE APP_ID = \'10\' ORDER BY MODULE_NAMESELECT ID, MODULE_NAME, MODULE_TITLE, DESCRIPTION, SCRIPT_NAME, CONCAT(\'http://localhost:89/phpapps_dev/\' ,APP_NAME,\'/\',SCRIPT_NAME) AS SCRIPT_PATH FROM phpapps.view_modules WHERE APP_ID = \'87\' ORDER BY MODULE_NAME',3,1,1,'2019-11-20 09:43:28','2019-11-20 09:43:28'),(818,'SELECT ID, MODULE_NAME, MODULE_TITLE, DESCRIPTION, SCRIPT_NAME, CONCAT(\'http://localhost:89/phpapps_dev/\' ,APP_NAME,\'/\',SCRIPT_NAME) AS SCRIPT_PATH FROM phpapps.view_modules \r\nWHERE APP_ID = \'1\' ORDER BY MODULE_NAME',3,1,1,'2019-11-20 09:44:26','2019-11-20 09:44:26'),(819,'SELECT ID, MODULE_NAME, MODULE_TITLE, DESCRIPTION, SCRIPT_NAME, CONCAT(\'http://localhost:89/phpapps_dev/\' ,APP_NAME,\'/\',SCRIPT_NAME) AS SCRIPT_PATH FROM phpapps.view_modules \r\nWHERE APP_ID = \'1\' ORDER BY MODULE_NAME',3,1,1,'2019-11-20 09:44:29','2019-11-20 09:44:29'),(820,'SELECT * FROM phpapps.view_modules \r\nWHERE APP_ID = \'1\' ORDER BY MODULE_NAME',3,1,1,'2019-11-20 09:44:41','2019-11-20 09:44:41'),(821,'SELECT * FROM phpapps.view_modules',3,1,1,'2019-11-20 09:44:50','2019-11-20 09:44:50'),(822,'select `m`.`ID` AS `ID`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`a`.`APP_SCHEMA` AS `APP_SCHEMA`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`m`.`MODULE_TITLE` AS `MODULE_TITLE`,`m`.`MODULE_DATE` AS `MODULE_DATE`,`a`.`APP_SCHEMA` AS `MODULE_SCHEMA`,`d`.`VALUE` AS `SCHEMA_NAME`,`m`.`DESCRIPTION` AS `DESCRIPTION`,`m`.`SCRIPT_ID` AS `SCRIPT_ID`,`s`.`SCRIPT_NAME` AS `SCRIPT_NAME` from (((`modules` `m` join `applications` `a`) join `scripts` `s`) join `list_databases` `d`) where ((`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`) and (`m`.`SCRIPT_ID` = `s`.`ID`))',3,1,1,'2019-11-20 09:45:27','2019-11-20 09:45:27'),(823,'select * from scripts where module_id = \'1\'',3,1,1,'2019-11-20 09:48:46','2019-11-20 09:48:46'),(824,'select * from scripts where module_id = \'1\' and WEB_TYPE_ID = \'2\'',3,1,1,'2019-11-20 09:48:57','2019-11-20 09:48:57'),(825,'select `m`.`ID` AS `ID`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`a`.`APP_SCHEMA` AS `APP_SCHEMA`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`m`.`MODULE_TITLE` AS `MODULE_TITLE`,\r\n`m`.`MODULE_DATE` AS `MODULE_DATE`,`a`.`APP_SCHEMA` AS `MODULE_SCHEMA`,`d`.`VALUE` AS `SCHEMA_NAME`,`m`.`DESCRIPTION` AS `DESCRIPTION`,`m`.`SCRIPT_ID` AS `SCRIPT_ID`,\r\n`s`.`SCRIPT_NAME` AS `SCRIPT_NAME` from (((`modules` `m` join `applications` `a`) join `scripts` `s`) join `list_databases` `d`) where ((`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`) and (`m`.`SCRIPT_ID` = `s`.`ID`))',3,1,1,'2019-11-20 09:51:16','2019-11-20 09:51:16'),(826,'select * from scripts where module_id = \'7\' and WEB_TYPE_ID = \'2\'',3,1,1,'2019-11-20 09:51:28','2019-11-20 09:51:28'),(827,'select * from scripts where module_id = \'8\' and WEB_TYPE_ID = \'2\'',3,1,1,'2019-11-20 09:52:24','2019-11-20 09:52:24'),(828,'select * from scripts  WEB_TYPE_ID = \'2\'',3,1,1,'2019-11-20 09:52:48','2019-11-20 09:52:48'),(829,'select * from scripts  where WEB_TYPE_ID = \'2\'',3,1,1,'2019-11-20 09:52:53','2019-11-20 09:52:53'),(830,'select * from scripts  where WEB_TYPE_ID = \'2\'',3,1,1,'2019-11-20 10:01:11','2019-11-20 10:01:11'),(831,'select * from user_profiles',3,1,1,'2019-11-20 10:04:32','2019-11-20 10:04:32'),(832,'select * from view_users',3,1,1,'2019-11-20 10:04:52','2019-11-20 10:04:52'),(833,'select `m`.`ID` AS `ID`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`a`.`APP_SCHEMA` AS `APP_SCHEMA`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`m`.`MODULE_TITLE` AS `MODULE_TITLE`,\r\n`m`.`MODULE_DATE` AS `MODULE_DATE`,`a`.`APP_SCHEMA` AS `MODULE_SCHEMA`,`d`.`VALUE` AS `SCHEMA_NAME`,`m`.`DESCRIPTION` AS `DESCRIPTION`,`m`.`SCRIPT_ID` AS `SCRIPT_ID`,\r\n`s`.`SCRIPT_NAME` AS `SCRIPT_NAME` from (((`modules` `m` join `applications` `a`) join `scripts` `s`) join `list_databases` `d`) where ((`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`) and (`m`.`SCRIPT_ID` = `s`.`ID`))',3,1,1,'2019-11-20 10:05:05','2019-11-20 10:05:05'),(834,'select * from view_scripts',3,1,1,'2019-11-20 10:25:29','2019-11-20 10:25:29'),(835,'SELECT SCRIPT_NAME, (SELECT VALUE FROM list_script_types WHERE ID = SCRIPT_TYPE_ID) AS SCRIPT_TYPE_ID, DESCRIPTION, ID FROM phpapps.view_scripts WHERE MODULE_ID = \'1\' limit 0,20',3,1,1,'2019-11-20 10:30:04','2019-11-20 10:30:04'),(836,'SELECT SCRIPT_NAME, (SELECT VALUE FROM list_script_types WHERE ID = SCRIPT_TYPE_ID) AS SCRIPT_TYPE_ID, DESCRIPTION, ID FROM phpapps.view_scripts WHERE MODULE_ID = \'1\' limit 0,20',3,1,1,'2019-11-20 10:32:17','2019-11-20 10:32:17'),(837,'SELECT SCRIPT_NAME, (SELECT VALUE FROM list_script_types WHERE ID = SCRIPT_TYPE_ID) AS SCRIPT_TYPE_ID, DESCRIPTION, ID FROM phpapps.view_scripts WHERE MODULE_ID = \'1\' limit 0,20',3,1,1,'2019-11-20 10:32:56','2019-11-20 10:32:56'),(838,'select * from scripts',3,1,1,'2019-11-20 10:43:23','2019-11-20 10:43:23'),(839,'select * from phpapps.view_tables',3,1,1,'2019-11-20 12:14:12','2019-11-20 12:14:12'),(840,'select * from phpapps.view_tables where table_name = \'tables\'',3,1,1,'2019-11-20 12:29:55','2019-11-20 12:29:55'),(841,'select * from view_scripts',3,1,1,'2019-11-20 18:03:00','2019-11-20 18:03:00'),(842,'select * from scripts',3,1,1,'2019-11-20 18:03:08','2019-11-20 18:03:08'),(843,'select * from view_scripts',3,1,1,'2019-11-20 18:03:31','2019-11-20 18:03:31'),(844,'select * from scripts',3,1,1,'2019-11-20 18:04:31','2019-11-20 18:04:31'),(845,'select * from phpapps.view_modules',3,1,1,'2019-11-20 18:06:28','2019-11-20 18:06:28'),(846,'SELECT ID, FROM phpapps.scripts WHERE MODULE_ID = \'27\' AND SCRIPT_NAME = \'phpapps_test3_get_php\'',3,1,1,'2019-11-20 18:17:32','2019-11-20 18:17:32'),(847,'SELECT ID FROM phpapps.scripts WHERE MODULE_ID = \'27\' AND SCRIPT_NAME = \'phpapps_test4_get_php\'',3,1,1,'2019-11-20 18:18:20','2019-11-20 18:18:20'),(848,'SELECT ID FROM phpapps.scripts WHERE MODULE_ID = \'27\' AND SCRIPT_NAME = \'phpapps_test4_get_php\'',3,1,1,'2019-11-20 18:20:51','2019-11-20 18:20:51'),(849,'SELECT APP_ID, APP_NAME, MODULE_ID FROM phpapps.view_modules WHERE ID = \'27\'',3,1,1,'2019-11-20 18:43:30','2019-11-20 18:43:30'),(850,'SELECT ID, APP_ID, APP_NAME FROM phpapps.view_modules WHERE ID = \'27\'',3,1,1,'2019-11-20 18:44:09','2019-11-20 18:44:09'),(851,'SELECT SCRIPT_TYPE_ID FROM scripts WHERE SCRIPT_NAME = \'phpapps_login\'',3,1,1,'2019-11-22 18:14:48','2019-11-22 18:14:48'),(852,'SELECT script_name,SCRIPT_TYPE_ID FROM scripts WHERE SCRIPT_NAME = \'phpapps_login\'',3,1,1,'2019-11-22 18:15:02','2019-11-22 18:15:02'),(853,'select * from scripts',3,1,1,'2019-11-22 18:15:14','2019-11-22 18:15:14'),(854,'select * from scripts order by CREATE_DATE desc',3,1,1,'2019-11-22 18:15:35','2019-11-22 18:15:35'),(855,'select * from users order by CREATE_DATE desc',3,1,1,'2019-11-22 19:21:03','2019-11-22 19:21:03'),(856,'SELECT ID, APP_NAME, TABLE_NAME, TABLE_SCHEMA FROM phpapps.view_tables WHERE ID = :id AND MODULE_ID = :module_id AND ORIGIN_ID = \'0\'',3,1,1,'2020-03-28 08:22:33','2020-03-28 08:22:33'),(857,'SELECT ID, APP_NAME, TABLE_NAME, TABLE_SCHEMA FROM phpapps.view_tables WHERE ID = :id AND MODULE_ID = :module_id AND ORIGIN_ID = \'0\'',3,1,1,'2020-03-28 08:22:35','2020-03-28 08:22:35'),(858,'SELECT ID, APP_NAME, TABLE_NAME, TABLE_SCHEMA FROM phpapps.view_tables WHERE ID = \'325\' AND MODULE_ID = \'7\' AND ORIGIN_ID = \'0\'',3,1,1,'2020-03-28 08:23:17','2020-03-28 08:23:17'),(859,'SELECT ID, APP_NAME, TABLE_NAME, TABLE_SCHEMA FROM phpapps.view_tables WHERE ID = \'325\' AND MODULE_ID = \'7\'',3,1,1,'2020-03-28 08:23:26','2020-03-28 08:23:26'),(860,'SELECT * FROM phpapps.view_tables WHERE ID = \'325\' AND MODULE_ID = \'7\'',3,1,1,'2020-03-28 08:23:39','2020-03-28 08:23:39'),(861,'SELECT * FROM phpapps.view_tables',3,1,1,'2020-03-28 08:23:51','2020-03-28 08:23:51'),(862,'SELECT ID, APP_NAME, TABLE_NAME, TABLE_SCHEMA FROM phpapps.view_tables WHERE ID = \'325\' AND MODULE_ID = \'7\'',3,1,1,'2020-03-28 08:24:22','2020-03-28 08:24:22'),(863,'select * from view_tables',3,1,1,'2020-03-28 08:30:28','2020-03-28 08:30:28'),(864,'show create view view_tables',3,1,1,'2020-03-28 08:31:42','2020-03-28 08:31:42'),(865,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(SELECT modules.ID FROM phpapps.modules WHERE modules.ID = t.module_id) AS ORIGIN_MODULE_ID,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))',3,1,1,'2020-03-28 08:35:37','2020-03-28 08:35:37'),(866,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(SELECT MODULE_ID FROM t.tables  WHERE t.ID = t.ID and t.ORIGIN_ID = 0) AS ORIGIN_MODULE_ID,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))',3,1,1,'2020-03-28 08:40:24','2020-03-28 08:40:24'),(867,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(SELECT MODULE_ID FROM tables  WHERE ID = t.ID and t.ORIGIN_ID = 0) AS ORIGIN_MODULE_ID,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))',3,1,1,'2020-03-28 08:40:50','2020-03-28 08:40:50'),(868,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(SELECT MODULE_ID FROM tables  WHERE ID = t.ID and ORIGIN_ID = 0) AS ORIGIN_MODULE_ID,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))',3,1,1,'2020-03-28 08:41:55','2020-03-28 08:41:55'),(869,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(SELECT MODULE_ID FROM tables  WHERE ID = t.ID and ORIGIN_ID = 0) AS ORIGIN_MODULE_ID,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))\r\norder by id',3,1,1,'2020-03-28 08:42:16','2020-03-28 08:42:16'),(870,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(SELECT ggg.MODULE_ID FROM tables ggg WHERE ggg.ID = t.ID and ggg.ORIGIN_ID = 0) AS ORIGIN_MODULE_ID,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))\r\norder by id',3,1,1,'2020-03-28 08:46:42','2020-03-28 08:46:42'),(871,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(SELECT ggg.MODULE_ID FROM tables ggg WHERE ggg.ID = t.ID and ggg.ORIGIN_ID = 0) AS ORIGIN_MODULE_ID,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))\r\norder by id',3,1,1,'2020-03-28 08:46:44','2020-03-28 08:46:44'),(872,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(SELECT ggg.MODULE_ID FROM tables ggg WHERE ggg.TABLE_NAME = t.TABLE_NAME and ggg.ORIGIN_ID = 0) AS ORIGIN_MODULE_ID,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))\r\norder by id',3,1,1,'2020-03-28 08:48:22','2020-03-28 08:48:22'),(873,'select table_name from tables where origin_id = 0',3,1,1,'2020-03-28 08:52:31','2020-03-28 08:52:31'),(874,'select id,origin_id,table_name from tables where origin_id = 0',3,1,1,'2020-03-28 08:52:44','2020-03-28 08:52:44'),(875,'select count(*), id,origin_id,table_name from tables where origin_id = 0 group by table_name',3,1,1,'2020-03-28 08:54:59','2020-03-28 08:54:59'),(876,'select count(*), id,origin_id,table_name from tables where origin_id = 0 group by table_name,id,origin_id',3,1,1,'2020-03-28 08:55:18','2020-03-28 08:55:18'),(877,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(SELECT ggg.MODULE_ID FROM tables ggg WHERE ggg.TABLE_NAME = t.TABLE_NAME and ggg.ORIGIN_ID = 0 group by ggg.id,ggg.module_id) AS ORIGIN_MODULE_ID,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))\r\norder by id',3,1,1,'2020-03-28 08:56:29','2020-03-28 08:56:29'),(878,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(SELECT ggg.MODULE_ID FROM tables ggg WHERE ggg.TABLE_NAME = t.TABLE_NAME and ggg.ORIGIN_ID = 0 group by ggg.id,ggg.module_id) AS ORIGIN_MODULE_ID,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))\r\norder by id',3,1,1,'2020-03-28 08:56:30','2020-03-28 08:56:30'),(879,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))\r\norder by id',3,1,1,'2020-03-28 08:56:39','2020-03-28 08:56:39'),(880,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(select ggg.module_id from tables ggg where ggg.id = t.origin_id) as origin_module_id,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))\r\norder by id',3,1,1,'2020-03-28 08:58:09','2020-03-28 08:58:09'),(881,'select `t`.`ID` AS `ID`,\r\n`t`.`ORIGIN_ID` AS `ORIGIN_ID`,\r\n(select ggg.module_id from tables ggg where ggg.id = t.origin_id) as ORIGIN_MODULE_ID,\r\n`t`.`TABLE_TYPE` AS `TABLE_TYPE`,\r\n`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,\r\n`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,\r\n(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,\r\n`t`.`TABLE_NAME` AS `TABLE_NAME`,\r\n`d`.`VALUE` AS `APP_SCHEMA`,\r\n`m`.`APP_ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`t`.`MODULE_ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME`,\r\n`t`.`DESCRIPTION` AS `DESCRIPTION` \r\nfrom ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`))\r\norder by id',3,1,1,'2020-03-28 09:05:58','2020-03-28 09:05:58'),(882,'select * from view_tables',3,1,1,'2020-03-28 09:07:42','2020-03-28 09:07:42'),(883,'select * from view_tables',3,1,1,'2020-03-28 09:07:44','2020-03-28 09:07:44'),(884,'select * from view_tables',3,1,1,'2020-03-29 11:00:11','2020-03-29 11:00:11'),(885,'select count(*), id,origin_id,table_name from tables where origin_id = 0 group by table_name,id,origin_id',3,1,1,'2020-03-29 11:00:21','2020-03-29 11:00:21'),(886,'show tables',3,1,1,'2020-03-30 17:48:03','2020-03-30 17:48:03'),(887,'show tables',3,1,1,'2020-03-31 17:37:22','2020-03-31 17:37:22'),(888,'select * from forms',3,1,1,'2020-04-03 18:01:38','2020-04-03 18:01:38'),(889,'show tables',3,1,1,'2020-04-03 18:01:51','2020-04-03 18:01:51'),(890,'select * from view_forms',3,1,1,'2020-04-03 18:05:31','2020-04-03 18:05:31'),(891,'show create view view_forms',3,1,1,'2020-04-03 18:05:47','2020-04-03 18:05:47'),(892,'select * from view_forms',3,1,1,'2020-04-03 18:20:45','2020-04-03 18:20:45'),(893,'SELECT FORM_PHP_DIR, FORM_NAME , APP_NAME FROM phpapps.view_forms f WHERE f.TABLE_NAME = \'links\' AND f.MODULE_ID = \'14\' ORDER BY f.ID ASC',3,1,1,'2020-04-03 18:24:08','2020-04-03 18:24:08'),(894,'SELECT FORM_PHP_DIR, FORM_NAME , APP_NAME FROM phpapps.view_forms f WHERE f.TABLE_NAME = \'links\' ORDER BY f.ID ASC',3,1,1,'2020-04-03 18:24:17','2020-04-03 18:24:17'),(895,'SELECT * FROM phpapps.view_forms f WHERE f.TABLE_NAME = \'links\' ORDER BY f.ID ASC',3,1,1,'2020-04-03 18:24:25','2020-04-03 18:24:25'),(896,'select * from scripts',3,1,1,'2020-04-04 09:31:06','2020-04-04 09:31:06'),(897,'select * from applications',3,1,1,'2020-04-04 09:31:24','2020-04-04 09:31:24'),(898,'select * from scripts',3,1,1,'2020-04-04 09:31:34','2020-04-04 09:31:34'),(899,'select * from applications',3,1,1,'2020-04-05 09:37:16','2020-04-05 09:37:16'),(900,'select * from layouts',1,1,1,'2020-04-05 11:43:32','2020-04-05 11:43:32'),(901,'select * from layouts',3,1,1,'2020-04-05 11:43:47','2020-04-05 11:43:47'),(902,'select l.* from layouts l left join applications a on (l.APP_ID = a.ID)',3,1,1,'2020-04-05 11:47:37','2020-04-05 11:47:37'),(903,'select * from layouts l left join applications a on (l.APP_ID = a.ID)',3,1,1,'2020-04-05 11:47:41','2020-04-05 11:47:41'),(904,'select l.ID,l.NAME,l.APP_ID,a.APP_NAME from layouts l left join applications a on (l.APP_ID = a.ID)',3,1,1,'2020-04-05 11:48:17','2020-04-05 11:48:17'),(905,'select l.ID,l.NAME,l.APP_ID,a.APP_NAME from layouts l left join applications a on (l.APP_ID = a.ID)',3,1,1,'2020-04-05 11:49:05','2020-04-05 11:49:05'),(906,'select * from view_layouts',3,1,1,'2020-04-05 11:50:05','2020-04-05 11:50:05'),(907,'select * from view_layouts',3,1,1,'2020-04-05 11:50:07','2020-04-05 11:50:07'),(908,'select * from scripts',3,1,1,'2020-04-05 12:04:33','2020-04-05 12:04:33'),(909,'show tables',3,1,1,'2020-04-05 12:38:55','2020-04-05 12:38:55'),(910,'select * from view_layouts',3,1,1,'2020-04-05 17:29:54','2020-04-05 17:29:54'),(911,'select * from view_scripts',3,1,1,'2020-04-05 17:30:44','2020-04-05 17:30:44'),(912,'select * from scripts',3,1,1,'2020-04-05 17:30:59','2020-04-05 17:30:59'),(913,'select l.name,l.app_name from layouts l left join scripts s on (s.layout_id = l.id) where s.id = \'154\'',3,1,1,'2020-04-05 19:09:23','2020-04-05 19:09:23'),(914,'select l.name,l.app_name from view_layouts l left join scripts s on (s.layout_id = l.id) where s.id = \'154\'',3,1,1,'2020-04-05 19:09:55','2020-04-05 19:09:55'),(915,'select l.name,l.app_name from view_layouts l left join scripts s on (s.layout_id = l.id) where s.id = \'154\'',3,1,1,'2020-04-05 19:14:55','2020-04-05 19:14:55'),(916,'show tables',1,1,1,'2020-04-11 12:29:58','2020-04-11 12:29:58'),(917,'show tables',3,1,1,'2020-04-11 12:30:06','2020-04-11 12:30:06'),(918,'select * from sql_console_saves',3,1,1,'2020-04-11 12:30:25','2020-04-11 12:30:25'),(919,'select * from sql_console_history',3,1,1,'2020-04-11 12:30:44','2020-04-11 12:30:44'),(920,'select * from sql_console_history',3,1,1,'2020-04-11 12:31:21','2020-04-11 12:31:21'),(921,'show tables',3,1,1,'2020-04-11 12:31:30','2020-04-11 12:31:30'),(922,'select * frfom themes',3,1,1,'2020-04-11 12:31:55','2020-04-11 12:31:55'),(923,'select * from themes',3,1,1,'2020-04-11 12:32:00','2020-04-11 12:32:00'),(924,'select * from menus',3,1,1,'2020-04-11 12:52:50','2020-04-11 12:52:50'),(925,'SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID, \'0\' AS UNSIGN, SUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE, IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL, IFNULL(COLUMN_DEFAULT,\'\') AS COLUMN_DEFAULT_VALUE, IF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT, COLUMN_COMMENT AS DESCRIPTION, ORDINAL_POSITION AS ORD, \'\' AS MODIFY_UID, \'\' AS CREATE_UID, NOW() AS MODIFY_DATE, NOW() AS CREATE_DATE FROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'menus\' and table_schema = \'phpapps\'',3,1,1,'2020-04-12 08:40:28','2020-04-12 08:40:28'),(926,'SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n\'0\' AS UNSIGN, \r\nSUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE, IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\nIFNULL(COLUMN_DEFAULT,\'\') AS COLUMN_DEFAULT_VALUE, \r\nIF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT, \r\nCOLUMN_COMMENT AS DESCRIPTION, \r\nORDINAL_POSITION AS ORD, \r\n\'\' AS MODIFY_UID, \r\n\'\' AS CREATE_UID, \r\nNOW() AS MODIFY_DATE, \r\nNOW() AS CREATE_DATE \r\nFROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'menus\' and table_schema = \'phpapps\'',3,1,1,'2020-04-12 08:41:54','2020-04-12 08:41:54'),(927,'SELECT \'328\' AS TABLE_ID, COLUMN_NAME,\r\n(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n\'0\' AS UNSIGN, \r\nSUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE, IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\nIFNULL(COLUMN_DEFAULT,\'\') AS COLUMN_DEFAULT_VALUE, \r\nIF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT, \r\nCOLUMN_COMMENT AS DESCRIPTION, \r\nORDINAL_POSITION AS ORD, \r\n\'\' AS MODIFY_UID, \r\n\'\' AS CREATE_UID, \r\nNOW() AS MODIFY_DATE, \r\nNOW() AS CREATE_DATE \r\nFROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'menus\' and table_schema = \'phpapps\'',3,1,1,'2020-04-12 08:42:45','2020-04-12 08:42:45'),(928,'SELECT \'328\' AS TABLE_ID, COLUMN_NAME,\r\n(SELECT ID FROM list_mysql_column_types WHERE list_mysql_column_types.VALUE = UPPER(DATA_TYPE) ) AS COLUMN_TYPE_ID,\r\n\'0\' AS UNSIGN, \r\nSUBSTR(COLUMN_TYPE,LOCATE(\'(\',COLUMN_TYPE)+1,LOCATE(\')\',COLUMN_TYPE) - LOCATE(\'(\',COLUMN_TYPE)-1) as COLUMN_SIZE, IF(IS_NULLABLE = \'NO\',0,1) AS ACCEPT_NULL,\r\nIFNULL(COLUMN_DEFAULT,\'\') AS COLUMN_DEFAULT_VALUE, \r\nIF(EXTRA = \'auto_increment\',1,0) AS AUTOINCREMENT, \r\nCOLUMN_COMMENT AS DESCRIPTION, \r\nORDINAL_POSITION AS ORD, \r\n\'0\' AS MODIFY_UID, \r\n\'0\' AS CREATE_UID, \r\nNOW() AS MODIFY_DATE, \r\nNOW() AS CREATE_DATE \r\nFROM INFORMATION_SCHEMA.COLUMNS WHERE table_name = \'menus\' and table_schema = \'phpapps\'',3,1,1,'2020-04-12 08:44:09','2020-04-12 08:44:09'),(929,'select * from users',3,1,1,'2020-04-12 08:44:33','2020-04-12 08:44:33'),(930,'select * from themes',3,1,1,'2020-04-12 11:53:30','2020-04-12 11:53:30'),(931,'select * from menus',3,1,1,'2020-04-12 12:00:47','2020-04-12 12:00:47'),(932,'select * from menus',3,1,1,'2020-04-13 07:33:02','2020-04-13 07:33:02'),(933,'select * from menus',3,1,1,'2020-04-17 07:24:15','2020-04-17 07:24:15'),(934,'select * from list_menu_types',3,1,1,'2020-04-17 07:30:26','2020-04-17 07:30:26'),(935,'select * from menus',3,1,1,'2020-04-17 07:33:18','2020-04-17 07:33:18'),(936,'select * from queries',3,1,1,'2020-04-17 07:33:43','2020-04-17 07:33:43'),(937,'select * from applications',3,1,1,'2020-04-17 07:34:44','2020-04-17 07:34:44'),(938,'select * from modules',3,1,1,'2020-04-17 07:34:51','2020-04-17 07:34:51'),(939,'select * from queries',3,1,1,'2020-04-17 07:35:01','2020-04-17 07:35:01'),(940,'select * from menus',3,1,1,'2020-04-17 07:35:33','2020-04-17 07:35:33'),(941,'SELECT m.ID, m.NAME, lmt.VALUE, lmt.ID AS LIST_MENU_TYPE_ID, lmt.DESCRIPTION,lmo.VALUE, lmo.ID AS LIST_MENU_ORIENTATION_ID ,lmo.DESCRIPTION, m.QUERY_ID,q.QUERY_NAME\r\nfrom menus m , list_menu_type lmt, list_menu_orientation lmo, queries q\r\nwhere m.MENU_TYPE = lmt.ID AND\r\nm.ORIENTATION = lmo.ID AND\r\nm.QUERY_ID = q.ID',3,1,1,'2020-04-17 07:38:36','2020-04-17 07:38:36'),(942,'SELECT m.ID, m.NAME, lmt.VALUE, lmt.ID AS LIST_MENU_TYPE_ID, lmt.DESCRIPTION,lmo.VALUE, lmo.ID AS LIST_MENU_ORIENTATION_ID ,lmo.DESCRIPTION, m.QUERY_ID,q.QUERY_NAME\r\nfrom menus m , list_menu_types lmt, list_menu_orientation lmo, queries q\r\nwhere m.MENU_TYPE = lmt.ID AND\r\nm.ORIENTATION = lmo.ID AND\r\nm.QUERY_ID = q.ID',3,1,1,'2020-04-17 07:38:52','2020-04-17 07:38:52'),(943,'SELECT m.ID, m.NAME, lmt.VALUE, lmt.ID AS LIST_MENU_TYPE_ID, lmt.DESCRIPTION,lmo.VALUE, lmo.ID AS LIST_MENU_ORIENTATION_ID ,lmo.DESCRIPTION, m.QUERY_ID,q.QUERY_NAME,q.DESCRIPTION\r\nfrom menus m , list_menu_types lmt, list_menu_orientation lmo, queries q\r\nwhere m.MENU_TYPE = lmt.ID AND\r\nm.ORIENTATION = lmo.ID AND\r\nm.QUERY_ID = q.ID',3,1,1,'2020-04-17 07:39:23','2020-04-17 07:39:23'),(944,'SELECT m.ID, m.NAME, lmt.VALUE AS MENU_TYPE, lmt.ID AS LIST_MENU_TYPE_ID, lmt.DESCRIPTION,lmo.VALUE AS ORIENTATION, lmo.ID AS LIST_MENU_ORIENTATION_ID ,lmo.DESCRIPTION, m.QUERY_ID,q.QUERY_NAME,q.DESCRIPTION\r\nfrom menus m , list_menu_types lmt, list_menu_orientation lmo, queries q\r\nwhere m.MENU_TYPE = lmt.ID AND\r\nm.ORIENTATION = lmo.ID AND\r\nm.QUERY_ID = q.ID',3,1,1,'2020-04-17 07:40:46','2020-04-17 07:40:46'),(945,'SELECT m.ID, m.NAME, lmt.VALUE AS MENU_TYPE, lmt.ID AS LIST_MENU_TYPE_ID,lmo.VALUE AS ORIENTATION, lmo.ID AS LIST_MENU_ORIENTATION_ID, m.QUERY_ID,q.QUERY_NAME,q.DESCRIPTION\r\nfrom menus m , list_menu_types lmt, list_menu_orientation lmo, queries q\r\nwhere m.MENU_TYPE = lmt.ID AND\r\nm.ORIENTATION = lmo.ID AND\r\nm.QUERY_ID = q.ID',3,1,1,'2020-04-17 07:41:33','2020-04-17 07:41:33'),(946,'select * from view_menus',3,1,1,'2020-04-17 07:41:58','2020-04-17 07:41:58'),(947,'select * from view_menus',3,1,1,'2020-04-17 07:42:00','2020-04-17 07:42:00'),(948,'select * from menus',3,1,1,'2020-04-17 07:42:21','2020-04-17 07:42:21'),(949,'select * from view_menus',3,1,1,'2020-04-17 07:43:58','2020-04-17 07:43:58'),(950,'select module_id,script_name from scripts',3,1,1,'2020-04-17 07:53:31','2020-04-17 07:53:31'),(951,'select module_id,script_name from scripts order by CREATE_DATE desc',3,1,1,'2020-04-17 07:54:00','2020-04-17 07:54:00'),(952,'select * from modules',3,1,1,'2020-04-17 07:54:52','2020-04-17 07:54:52'),(953,'select * from phpapps.view_scripts',3,1,1,'2020-04-17 07:55:59','2020-04-17 07:55:59'),(954,'select * from phpapps.view_scripts where MODULE_ID = \'21\'',3,1,1,'2020-04-17 07:56:13','2020-04-17 07:56:13'),(955,'select * from scripts order by CREATE_DATE desc',3,1,1,'2020-04-17 07:56:31','2020-04-17 07:56:31'),(956,'show create view phpapps.view_scripts',3,1,1,'2020-04-17 07:58:14','2020-04-17 07:58:14'),(957,'select * from phpapps.queries where MODULE_ID = \'21\'',3,1,1,'2020-04-17 09:27:35','2020-04-17 09:27:35'),(958,'select * from phpapps.queries',3,1,1,'2020-04-17 09:27:41','2020-04-17 09:27:41'),(959,'select * from phpapps.view_menus',3,1,1,'2020-04-17 09:32:04','2020-04-17 09:32:04'),(960,'select * from menu_items order by CREATE_DATE desc',3,1,1,'2020-04-17 09:56:29','2020-04-17 09:56:29'),(961,'select * from menu_items',3,1,1,'2020-04-17 09:56:38','2020-04-17 09:56:38'),(962,'select * from menu_items',3,1,1,'2020-04-17 10:24:34','2020-04-17 10:24:34'),(963,'show create view phpapps.menu_items',3,1,1,'2020-04-17 10:33:26','2020-04-17 10:33:26'),(964,'select * from  phpapps.menu_items',3,1,1,'2020-04-17 10:33:39','2020-04-17 10:33:39'),(965,'select * from view_menus',3,1,1,'2020-04-17 15:15:05','2020-04-17 15:15:05'),(966,'select * from queries',3,1,1,'2020-04-17 17:51:39','2020-04-17 17:51:39'),(967,'select * from view_menus',3,1,1,'2020-04-17 17:52:43','2020-04-17 17:52:43'),(968,'select * from view_menus',3,1,1,'2020-04-17 17:52:45','2020-04-17 17:52:45'),(969,'show tables',3,1,1,'2020-04-17 17:53:12','2020-04-17 17:53:12'),(970,'select * from query_parameters',3,1,1,'2020-04-17 17:53:46','2020-04-17 17:53:46'),(971,'select * from menu_items',3,1,1,'2020-04-17 18:12:00','2020-04-17 18:12:00'),(972,'SELECT ID, APP_NAME, TABLE_NAME, TABLE_SCHEMA, ORIGIN_ID, ORIGIN_MODULE_ID FROM phpapps.views WHERE ID = \'1\'',3,1,1,'2020-04-18 07:22:44','2020-04-18 07:22:44'),(973,'SELECT ID, APP_NAME, TABLE_NAME, TABLE_SCHEMA, ORIGIN_ID, ORIGIN_MODULE_ID FROM phpapps.views WHERE ID = \'1\'',3,1,1,'2020-04-18 07:22:46','2020-04-18 07:22:46'),(974,'SELECT ID,  TABLE_NAME, TABLE_SCHEMA, ORIGIN_ID, ORIGIN_MODULE_ID FROM phpapps.views WHERE ID = \'1\'',3,1,1,'2020-04-18 07:22:54','2020-04-18 07:22:54'),(975,'SELECT * FROM phpapps.views WHERE ID = \'1\'',3,1,1,'2020-04-18 07:23:08','2020-04-18 07:23:08'),(976,'SELECT ID, MODULE_ID, VIEW_NAME, CREATE_VIEW_QUERY, DESCRIPTION FROM phpapps.views WHERE ID = \'1\' AND MODULE_ID = \'14\'',3,1,1,'2020-04-18 07:29:50','2020-04-18 07:29:50'),(977,'select * from views',3,1,1,'2020-04-18 07:30:37','2020-04-18 07:30:37'),(978,'select * from query_parameters',3,1,1,'2020-04-18 09:25:21','2020-04-18 09:25:21'),(979,'select * from menu_items',3,1,1,'2020-04-18 16:15:29','2020-04-18 16:15:29'),(980,'SELECT LABEL, ACTION, ID FROM phpapps.menu_items WHERE QUERY_ID = \'3\' limit 0,20',3,1,1,'2020-04-18 16:16:07','2020-04-18 16:16:07'),(981,'show tables',3,1,1,'2020-04-19 09:36:55','2020-04-19 09:36:55'),(982,'show tables like \'list%\'',3,1,1,'2020-04-19 09:37:03','2020-04-19 09:37:03'),(983,'show tables',3,1,1,'2020-04-19 10:04:27','2020-04-19 10:04:27'),(984,'select * from  menu_items',3,1,1,'2020-04-19 10:04:52','2020-04-19 10:04:52'),(985,'select p.ID,p.PID,p.MENU_ID,p.ACTION,p.LABEL,(SELECT LABEL FROM menu_items sub WHERE sub.ID = p.PID) AS PLABEL from menu_items p',3,1,1,'2020-04-19 10:07:42','2020-04-19 10:07:42'),(986,'select p.ID,p.PID,p.MENU_ID,p.ACTION,p.LABEL,(SELECT LABEL FROM menu_items sub WHERE sub.ID = p.PID) AS PLABEL , (SELECT ACTION FROM menu_items sub WHERE sub.ID = p.PID) AS PACTION from menu_items p',3,1,1,'2020-04-19 10:08:26','2020-04-19 10:08:26'),(987,'select * from view_menu_items',3,1,1,'2020-04-19 10:09:24','2020-04-19 10:09:24'),(988,'select * from view_menu_items',3,1,1,'2020-04-19 10:09:27','2020-04-19 10:09:27'),(989,'SELECT ID,ACTION,LABEL FROM phpapps.menu_items WHERE PID = \'3\'',3,1,1,'2020-04-19 11:04:32','2020-04-19 11:04:32'),(990,'SELECT ID,ACTION,LABEL FROM phpapps.menu_items WHERE PID = \'4\'',3,1,1,'2020-04-19 11:04:38','2020-04-19 11:04:38'),(991,'SELECT ID,ACTION,LABEL FROM phpapps.menu_items',3,1,1,'2020-04-19 11:05:45','2020-04-19 11:05:45'),(992,'SELECT ID,PID,ACTION,LABEL FROM phpapps.menu_items WHERE PID = \'4\'',3,1,1,'2020-04-19 11:16:04','2020-04-19 11:16:04'),(993,'SELECT ID,PID,ACTION,LABEL FROM phpapps.menu_items',3,1,1,'2020-04-19 11:16:21','2020-04-19 11:16:21'),(994,'SELECT *,ID,PID,ACTION,LABEL FROM phpapps.menu_items',3,1,1,'2020-04-19 11:16:32','2020-04-19 11:16:32'),(995,'SELECT *,ID,PID,ACTION,LABEL FROM phpapps.menu_items',3,1,1,'2020-04-19 11:26:15','2020-04-19 11:26:15'),(996,'SELECT ID,PID,ACTION,LABEL FROM phpapps.menu_items WHERE PID = \'8\'',3,1,1,'2020-04-19 11:27:04','2020-04-19 11:27:04'),(997,'SELECT ID,PID,ACTION,LABEL FROM phpapps.menu_items',3,1,1,'2020-04-19 11:44:32','2020-04-19 11:44:32'),(998,'SELECT *,ID,PID,ACTION,LABEL FROM phpapps.menu_items',3,1,1,'2020-04-19 11:44:44','2020-04-19 11:44:44'),(999,'select * from applications',3,1,1,'2020-04-19 15:57:02','2020-04-19 15:57:02'),(1000,'SELECT ID, \'0\' AS PID, \'index.php?app_id=\' || ID AS ACTION, APP_NAME AS LABEL  FROM phpapps.applications',3,1,1,'2020-04-19 16:00:02','2020-04-19 16:00:02'),(1001,'SELECT ID, \'0\' AS PID, CONCATENATE(\'index.php?app_id=\', ID) AS ACTION, APP_NAME AS LABEL  FROM phpapps.applications',3,1,1,'2020-04-19 16:01:16','2020-04-19 16:01:16'),(1002,'SELECT ID, \'0\' AS PID, CONCAT(\'index.php?app_id=\', ID) AS ACTION, APP_NAME AS LABEL  FROM phpapps.applications',3,1,1,'2020-04-19 16:01:24','2020-04-19 16:01:24'),(1003,'SELECT ID, \'0\' AS PID, CONCAT(\'index.php?app_id=\', ID) AS ACTION, APP_NAME AS LABEL  FROM phpapps.applications',3,1,1,'2020-04-19 16:02:26','2020-04-19 16:02:26'),(1004,'SELECT ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL  FROM phpapps.applications',3,1,1,'2020-04-19 16:03:20','2020-04-19 16:03:20'),(1005,'select * from view_menus',3,1,1,'2020-04-19 16:06:33','2020-04-19 16:06:33'),(1006,'SELECT ID,PID,ACTION,LABEL FROM SELECT ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:09:45','2020-04-19 16:09:45'),(1007,'SELECT ID,PID,ACTION,LABEL FROM ( SELECT ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:10:02','2020-04-19 16:10:02'),(1008,'SELECT ID,PID,ACTION,LABEL FROM ( SELECT ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:10:03','2020-04-19 16:10:03'),(1009,'SELECT ID,PID,ACTION,LABEL FROM ( SELECT 5 as MENU_ID, ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:11:39','2020-04-19 16:11:39'),(1010,'SELECT ID,PID,ACTION,LABEL FROM ( SELECT 5 as MENU_ID, ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:11:40','2020-04-19 16:11:40'),(1011,'SELECT ID,PID,ACTION,LABEL FROM ( SELECT 5 as MENU_ID, ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) as menu_items WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:12:53','2020-04-19 16:12:53'),(1012,'SELECT ID,PID,ACTION,LABEL FROM ( SELECT  ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) as menu_items WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:13:01','2020-04-19 16:13:01'),(1013,'SELECT ID,PID,ACTION,LABEL FROM ( SELECT  ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) as menu_items WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:13:02','2020-04-19 16:13:02'),(1014,'SELECT ID,PID,ACTION,LABEL FROM ( SELECT  5 as MENU_ID , ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) as menu_items WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:13:21','2020-04-19 16:13:21'),(1015,'SELECT menu_id, ID,PID,ACTION,LABEL FROM ( SELECT  5 as MENU_ID , ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) as menu_items WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:14:21','2020-04-19 16:14:21'),(1016,'SELECT menu_id, ID,PID,ACTION,LABEL FROM ( 5 as MENU_ID , ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) as menu_items WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:22:35','2020-04-19 16:22:35'),(1017,'SELECT menu_id, ID,PID,ACTION,LABEL FROM ( SELECT 5 as MENU_ID , ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) as menu_items WHERE PID = \'0\' AND MENU_ID = \'5\'',3,1,1,'2020-04-19 16:22:44','2020-04-19 16:22:44'),(1018,'SELECT ID,PID,ACTION,LABEL FROM SELECT ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications WHERE PID = \'0\'',3,1,1,'2020-04-19 16:26:09','2020-04-19 16:26:09'),(1019,'SELECT ID,PID,ACTION,LABEL FROM ( SELECT ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications ) AS phpapps.menu_items WHERE PID = \'0\'',3,1,1,'2020-04-19 16:27:09','2020-04-19 16:27:09'),(1020,'SELECT ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications',3,1,1,'2020-04-19 16:30:59','2020-04-19 16:30:59'),(1021,'select * from view_modules',3,1,1,'2020-04-19 16:31:15','2020-04-19 16:31:15'),(1022,'select ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all\r\nselect ID,APP_ID AS PID, ID AS ACTION , MODULE_TITLE AS LABEL from view_modules',3,1,1,'2020-04-19 16:33:50','2020-04-19 16:33:50'),(1023,'SELECT * FROM (select ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all\r\nselect ID,APP_ID AS PID, ID AS ACTION , MODULE_TITLE AS LABEL from view_modules ) as menu_items',3,1,1,'2020-04-19 16:37:00','2020-04-19 16:37:00'),(1024,'SELECT * FROM (select ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all\r\nselect ID,APP_ID AS PID, ID AS ACTION , MODULE_TITLE AS LABEL from view_modules ) as menu_items',3,1,1,'2020-04-19 16:37:03','2020-04-19 16:37:03'),(1025,'SELECT ID,PID,ACTION,LABEL FROM SELECT * FROM (select ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all select ID,APP_ID AS PID, ID AS ACTION , MODULE_TITLE AS LABEL from view_modules ) as menu_items WHERE PID = \'0\'',3,1,1,'2020-04-19 16:38:42','2020-04-19 16:38:42'),(1026,'SELECT ID,PID,ACTION,LABEL FROM SELECT * FROM (select ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all select ID,APP_ID AS PID, ID AS ACTION , MODULE_TITLE AS LABEL from view_modules ) as menu_items WHERE PID = \'0\'',3,1,1,'2020-04-19 16:41:50','2020-04-19 16:41:50'),(1027,'SELECT ID,PID,ACTION,LABEL FROM (select ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all select ID,APP_ID AS PID, ID AS ACTION , MODULE_TITLE AS LABEL from view_modules ) as menu_items WHERE PID = \'0\'',3,1,1,'2020-04-19 16:42:05','2020-04-19 16:42:05'),(1028,'SELECT ID,PID,ACTION,LABEL FROM (select ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all select ID,APP_ID AS PID, ID AS ACTION , MODULE_TITLE AS LABEL from view_modules ) as menu_items',3,1,1,'2020-04-19 16:42:29','2020-04-19 16:42:29'),(1029,'SELECT ID,PID,ACTION,LABEL FROM (select ID, 0 AS PID, ID AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all select (APP_ID+ID) AS ID ,APP_ID AS PID, ID AS ACTION , MODULE_TITLE AS LABEL from view_modules ) as menu_items',3,1,1,'2020-04-19 16:43:29','2020-04-19 16:43:29'),(1030,'select * from queries',3,1,1,'2020-04-20 07:10:18','2020-04-20 07:10:18'),(1031,'select * from queries_parameters',3,1,1,'2020-04-20 07:10:47','2020-04-20 07:10:47'),(1032,'select * from querie_parameters',3,1,1,'2020-04-20 07:10:53','2020-04-20 07:10:53'),(1033,'select * from queri_parameters',3,1,1,'2020-04-20 07:11:02','2020-04-20 07:11:02'),(1034,'select * from query_parameters',3,1,1,'2020-04-20 07:11:16','2020-04-20 07:11:16'),(1035,'select * from queries where ID = \'2\'',3,1,1,'2020-04-20 07:18:05','2020-04-20 07:18:05'),(1036,'select * from queries where ID = \'2\'',3,1,1,'2020-04-20 07:18:06','2020-04-20 07:18:06'),(1037,'select * from queries where ID = \'45\'',3,1,1,'2020-04-20 07:18:11','2020-04-20 07:18:11'),(1038,'select * from queries where ID = \'45\'',3,1,1,'2020-04-20 07:18:12','2020-04-20 07:18:12'),(1039,'select * from queries',3,1,1,'2020-04-20 07:18:16','2020-04-20 07:18:16'),(1040,'SELECT * FROM MENU_ITEMS WHERE MENU_ID=\'5\'',3,1,1,'2020-04-20 07:43:46','2020-04-20 07:43:46'),(1041,'show tables',3,1,1,'2020-04-20 07:59:50','2020-04-20 07:59:50'),(1042,'select * from view_menus',3,1,1,'2020-04-20 08:02:17','2020-04-20 08:02:17'),(1043,'SELECT ID,NAME,MENU_TITLE,MENU_TYPE,ORIENTATION,QUERY_BODY,QUERY_ID FROM phpapps.view_menus WHERE ID = \'3\'',3,1,1,'2020-04-20 08:19:24','2020-04-20 08:19:24'),(1044,'SELECT ID,NAME FROM phpapps.menus',3,1,1,'2020-04-20 08:50:44','2020-04-20 08:50:44'),(1045,'show tables like \'list%\'',3,1,1,'2020-04-20 08:51:08','2020-04-20 08:51:08'),(1046,'select * from list_databases',3,1,1,'2020-04-20 08:51:19','2020-04-20 08:51:19'),(1047,'SELECT ID,NAME AS VALUE FROM phpapps.menus',3,1,1,'2020-04-20 08:51:36','2020-04-20 08:51:36'),(1048,'SELECT ID,NAME,\'MENU\' AS ELEMENT_TYPE  AS VALUE FROM phpapps.menus',3,1,1,'2020-04-20 08:52:08','2020-04-20 08:52:08'),(1049,'SELECT ID,NAME  AS VALUE,\'MENU\' AS ELEMENT_TYPE  FROM phpapps.menus',3,1,1,'2020-04-20 08:52:21','2020-04-20 08:52:21'),(1050,'select * from scripts',3,1,1,'2020-04-20 08:52:45','2020-04-20 08:52:45'),(1051,'SELECT ID,NAME  AS VALUE,\'1\' AS ELEMENT_TYPE  FROM phpapps.menus',3,1,1,'2020-04-20 08:54:07','2020-04-20 08:54:07'),(1052,'select * from scripts where WEB_TYPE_ID = \'1\'',3,1,1,'2020-04-20 08:56:07','2020-04-20 08:56:07'),(1053,'SELECT ID,NAME  AS VALUE,\'1\' AS ELEMENT_TYPE  FROM phpapps.menus UNION ALL\r\nSELECT ID,SCRIPT_NAME  AS VALUE,\'2\' AS ELEMENT_TYPE from phpapps.scripts where WEB_TYPE_ID = \'1\'',3,1,1,'2020-04-20 08:56:34','2020-04-20 08:56:34'),(1054,'select * from layout_variables',3,1,1,'2020-04-20 09:36:25','2020-04-20 09:36:25'),(1055,'select * from VIEW_POSIBLE_LAYOUT_ELEMENTS',3,1,1,'2020-04-20 09:38:31','2020-04-20 09:38:31'),(1056,'select * from views',3,1,1,'2020-04-20 09:44:16','2020-04-20 09:44:16'),(1057,'select * from view_tables',3,1,1,'2020-04-20 09:45:13','2020-04-20 09:45:13'),(1058,'show create view_tables',3,1,1,'2020-04-20 09:45:40','2020-04-20 09:45:40'),(1059,'show create view view_tables',3,1,1,'2020-04-20 09:45:46','2020-04-20 09:45:46'),(1060,'SELECT ID, MODULE_ID, VIEW_NAME, CREATE_VIEW_QUERY, DESCRIPTION FROM phpapps.views WHERE ID = \'6\' AND MODULE_ID = \'14\'',3,1,1,'2020-04-20 09:55:33','2020-04-20 09:55:33'),(1061,'SELECT ID, MODULE_ID, VIEW_NAME, CREATE_VIEW_QUERY, DESCRIPTION FROM phpapps.views WHERE ID = \'6\'',3,1,1,'2020-04-20 09:55:39','2020-04-20 09:55:39'),(1062,'SELECT ID, MODULE_ID, VIEW_NAME, CREATE_VIEW_QUERY, DESCRIPTION FROM phpapps.views WHERE ID = \'6\' AND MODULE_ID = \'14\'',3,1,1,'2020-04-20 09:56:11','2020-04-20 09:56:11'),(1063,'SELECT ID, MODULE_ID, VIEW_NAME, CREATE_VIEW_QUERY, DESCRIPTION FROM phpapps.views',3,1,1,'2020-04-20 09:56:16','2020-04-20 09:56:16'),(1064,'select ID, 0 AS PID, CONCAT(\'phpapps_dev\',APP_NAME,\'phpapps_admin_applicationsphp\',ID) AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all\r\nselect CONCAT(APP_ID,ID) AS ID, APP_ID AS PID, ID AS ACTION , MODULE_TITLE AS LABEL from view_modules',3,1,1,'2020-04-20 14:56:21','2020-04-20 14:56:21'),(1065,'select ID, 0 AS PID, \'index.php\' AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all\r\nselect CONCAT(APP_ID,ID) AS ID, APP_ID AS PID, ID AS ACTION , MODULE_TITLE AS LABEL from view_modules',3,1,1,'2020-04-20 14:57:27','2020-04-20 14:57:27'),(1066,'select * from modules',3,1,1,'2020-04-20 15:42:28','2020-04-20 15:42:28'),(1067,'select ID, 0 AS PID, \'index.php\' AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all\r\nselect CONCAT(APP_ID,ID) AS ID, APP_ID AS PID, ID AS ACTION , MODULE_TITLE AS LABEL from view_modules',3,1,1,'2020-04-20 16:32:51','2020-04-20 16:32:51'),(1068,'select * from modules',3,1,1,'2020-04-20 16:33:24','2020-04-20 16:33:24'),(1069,'select * from view_modules',3,1,1,'2020-04-20 16:33:34','2020-04-20 16:33:34'),(1070,'select CONCAT(APP_ID,ID) AS ID, APP_ID AS PID, CONCAT(\'http://localhost/phpapps_dev/phpapps/phpapps_admin_module.php?module_id=\',ID) AS ACTION , MODULE_TITLE AS LABEL from view_modules',3,1,1,'2020-04-20 16:34:48','2020-04-20 16:34:48'),(1071,'select * from view_scripts',3,1,1,'2020-04-20 16:35:13','2020-04-20 16:35:13'),(1072,'select * from scripts',3,1,1,'2020-04-20 16:35:36','2020-04-20 16:35:36'),(1073,'select * from view_scripts',3,1,1,'2020-04-20 16:36:02','2020-04-20 16:36:02'),(1074,'select *,concat(\'phpapps_dev/\',app_name,\'/\',script_name,\'.php\') from view_scripts',3,1,1,'2020-04-20 16:47:07','2020-04-20 16:47:07'),(1075,'select *,concat(\'phpapps_dev/\',app_name,\'/\',script_name,if(SCRIPT_TYPE_ID=1,\'_imp\',\'\')\'.php\') from view_scripts',3,1,1,'2020-04-20 16:48:04','2020-04-20 16:48:04'),(1076,'select *,concat(\'phpapps_dev/\',app_name,\'/\',script_name,if(SCRIPT_TYPE_ID=1,\'_imp\',\'\'),\'.php\') from view_scripts',3,1,1,'2020-04-20 16:48:14','2020-04-20 16:48:14'),(1077,'scripts',3,1,1,'2020-04-20 16:50:39','2020-04-20 16:50:39'),(1078,'select * from scripts',3,1,1,'2020-04-20 16:50:45','2020-04-20 16:50:45'),(1079,'select *,concat(\'phpapps_dev/\',app_name,\'/\',script_name,if(WEB_TYPE_ID=1,\'_imp\',\'\'),\'.php\') from view_scripts',3,1,1,'2020-04-20 16:52:03','2020-04-20 16:52:03'),(1080,'select *,concat(\'phpapps_dev/\',app_name,\'/\',script_name,if(WEB_TYPE_ID=1,\'_imp\',\'\'),\'.php\') from scripts',3,1,1,'2020-04-20 16:52:15','2020-04-20 16:52:15'),(1081,'show create view view_scripts',3,1,1,'2020-04-20 16:52:49','2020-04-20 16:52:49'),(1082,'select `s`.`ID` AS `ID`,\r\n`s`.`SCRIPT_NAME` AS `SCRIPT_NAME`,\r\n`a`.`ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`s`.`SCRIPT_TYPE_ID` AS `SCRIPT_TYPE_ID`,\r\n`s`.`DESCRIPTION` AS `DESCRIPTION`,\r\n`m`.`ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME` ,\r\nconcat(\'phpapps_dev/\',1.app_name,\'/\',s.script_name,if(s.WEB_TYPE_ID=1,\'_imp\',\'\'),\'.php\') AS RUN_PATH \r\nfrom ((`scripts` `s` join `modules` `m`) join `applications` `a`) where `s`.`MODULE_ID` = `m`.`ID` and `m`.`APP_ID` = `a`.`ID` and `s`.`WEB_TYPE_ID` = \'2\'',3,1,1,'2020-04-20 17:33:05','2020-04-20 17:33:05'),(1083,'select `s`.`ID` AS `ID`,\r\n`s`.`SCRIPT_NAME` AS `SCRIPT_NAME`,\r\n`a`.`ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`s`.`SCRIPT_TYPE_ID` AS `SCRIPT_TYPE_ID`,\r\n`s`.`DESCRIPTION` AS `DESCRIPTION`,\r\n`m`.`ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME` ,\r\nconcat(\'phpapps_dev/\',a.app_name,\'/\',s.script_name,if(s.WEB_TYPE_ID=1,\'_imp\',\'\'),\'.php\') AS RUN_PATH \r\nfrom ((`scripts` `s` join `modules` `m`) join `applications` `a`) where `s`.`MODULE_ID` = `m`.`ID` and `m`.`APP_ID` = `a`.`ID` and `s`.`WEB_TYPE_ID` = \'2\'',3,1,1,'2020-04-20 17:33:19','2020-04-20 17:33:19'),(1084,'select * from scripts',3,1,1,'2020-04-20 17:33:59','2020-04-20 17:33:59'),(1085,'select p.ID,p.PID,p.MENU_ID,p.ACTION,p.LABEL,(SELECT LABEL FROM menu_items sub WHERE sub.ID = p.PID) AS PLABEL , (SELECT ACTION FROM menu_items sub WHERE sub.ID = p.PID) AS PACTION from menu_items p\r\n\r\n\r\nArray ( [0] => menu_item Object ( [ID] => 3 [PID] => 0 [ACTION] => test1.php?aa=bb&cc=dd [LABEL] => TEST1 \r\n[sub_menu_items] => Array ( [0] => menu_item Object ( [ID] => 4 [PID] => 3 [ACTION] => http://www.google.com [LABEL] => TEST2 [sub_menu_items] => Array ( [0] => menu_item Object ( [ID] => 5 [PID] => 4 [ACTION] => AA2 [LABEL] => AA [sub_menu_items] => Array ( [0] => ) ) ) ) ) ) )\r\n\r\n\r\nArray ( [0] => menu_item Object ( [ID] => 3 [PID] => 0 [ACTION] => test1.php?aa=bb&cc=dd [LABEL] => TEST1 \r\n																									[sub_menu_items] => Array ( [0] => Array ( [0] => menu_item Object ( [ID] => 4 [PID] => 3 [ACTION] => http://www.google.com [LABEL] => TEST2 \r\n																																																										[sub_menu_items] => Array ( [0] => Array ( [0] => menu_item Object ( [ID] => 5 [PID] => 4 [ACTION] => AA2 [LABEL] => AA [sub_menu_items] => Array ( [0] => Array ( ) ) ) ) ) ) ) ) )\r\n    	[1] => menu_item Object ( [ID] => 8 [PID] => 0 [ACTION] => MENU2 [LABEL] => MENU2 [sub_menu_items] => Array \r\n		( [0] => Array ( [0] => menu_item Object ( [ID] => 9 [PID] => 8 [ACTION] => SUB_1_MENU2 [LABEL] => SUB_1_MENU2 [sub_menu_items] => Array ( [0] => Array ( ) ) ) [1] \r\n		=> menu_item Object ( [ID] => 10 [PID] => 8 [ACTION] => SUB_2_MENU2 [LABEL] => SUB_2_MENU2 [sub_menu_items] => Array ( [0] => Array ( ) ) ) ) ) ) )\r\n		\r\n		\r\n		\r\n		\r\ndrop view VIEW_POSIBLE_LAYOUT_ELEMENTS; 		\r\nCREATE VIEW VIEW_POSIBLE_LAYOUT_ELEMENTS AS (	SELECT ID,CONCAT(NAME,\'(menu)\')  AS ELEMENT_NAME,\'1\' AS ELEMENT_TYPE  FROM phpapps.menus UNION ALL\r\nSELECT ID,CONCAT(SCRIPT_NAME,\'(form)\')  AS ELEMENT_NAME,\'2\' AS ELEMENT_TYPE from phpapps.scripts where WEB_TYPE_ID = \'1\' UNION ALL\r\nSELECT ID,CONCAT(VARIABLE_NAME,\'(layout variable)\')  AS ELEMENT_NAME,\'3\' AS ELEMENT_TYPE from phpapps.layout_variables\r\n)\r\n\r\n\r\nselect `s`.`ID` AS `ID`,\r\n`s`.`SCRIPT_NAME` AS `SCRIPT_NAME`,\r\n`a`.`ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`s`.`SCRIPT_TYPE_ID` AS `SCRIPT_TYPE_ID`,\r\n`s`.`DESCRIPTION` AS `DESCRIPTION`,\r\n`m`.`ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME` ,\r\nconcat(\'phpapps_dev/\',a.app_name,\'/\',s.script_name,if(s.WEB_TYPE_ID=\'1\',\'_imp\',\'\'),\'.php\') AS RUN_PATH \r\nfrom ((`scripts` `s` join `modules` `m`) join `applications` `a`) where `s`.`MODULE_ID` = `m`.`ID` and `m`.`APP_ID` = `a`.`ID` and `s`.`WEB_TYPE_ID` = \'2\'',3,1,1,'2020-04-20 17:34:58','2020-04-20 17:34:58'),(1086,'select `s`.`ID` AS `ID`,\r\n`s`.`SCRIPT_NAME` AS `SCRIPT_NAME`,\r\n`a`.`ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`s`.`SCRIPT_TYPE_ID` AS `SCRIPT_TYPE_ID`,\r\n`s`.`DESCRIPTION` AS `DESCRIPTION`,\r\n`m`.`ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME` ,\r\nconcat(\'phpapps_dev/\',a.app_name,\'/\',s.script_name,if(s.WEB_TYPE_ID=\'1\',\'_imp\',\'\'),\'.php\') AS RUN_PATH \r\nfrom ((`scripts` `s` join `modules` `m`) join `applications` `a`) where `s`.`MODULE_ID` = `m`.`ID` and `m`.`APP_ID` = `a`.`ID` and `s`.`WEB_TYPE_ID` = \'2\'',3,1,1,'2020-04-20 17:35:12','2020-04-20 17:35:12'),(1087,'select `s`.`ID` AS `ID`,\r\n`s`.`SCRIPT_NAME` AS `SCRIPT_NAME`,\r\n`a`.`ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`s`.`SCRIPT_TYPE_ID` AS `SCRIPT_TYPE_ID`,\r\n`s`.`DESCRIPTION` AS `DESCRIPTION`,\r\ns.WEB_TYPE_ID,\r\n`m`.`ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME` ,\r\nconcat(\'phpapps_dev/\',a.app_name,\'/\',s.script_name,if(s.WEB_TYPE_ID=\'1\',\'_imp\',\'\'),\'.php\') AS RUN_PATH \r\nfrom ((`scripts` `s` join `modules` `m`) join `applications` `a`) where `s`.`MODULE_ID` = `m`.`ID` and `m`.`APP_ID` = `a`.`ID` and `s`.`WEB_TYPE_ID` = \'2\'',3,1,1,'2020-04-20 17:35:31','2020-04-20 17:35:31'),(1088,'show tables',3,1,1,'2020-04-20 17:36:03','2020-04-20 17:36:03'),(1089,'select * from  view_forms',3,1,1,'2020-04-20 17:36:24','2020-04-20 17:36:24'),(1090,'select `s`.`ID` AS `ID`,\r\n`s`.`SCRIPT_NAME` AS `SCRIPT_NAME`,\r\n`a`.`ID` AS `APP_ID`,\r\n`a`.`APP_NAME` AS `APP_NAME`,\r\n`s`.`SCRIPT_TYPE_ID` AS `SCRIPT_TYPE_ID`,\r\n`s`.`DESCRIPTION` AS `DESCRIPTION`,\r\n`m`.`ID` AS `MODULE_ID`,\r\n`m`.`MODULE_NAME` AS `MODULE_NAME` ,\r\nconcat(\'phpapps_dev/\',a.app_name,\'/\',s.script_name,\'.php\') AS RUN_PATH \r\nfrom ((`scripts` `s` join `modules` `m`) join `applications` `a`) where `s`.`MODULE_ID` = `m`.`ID` and `m`.`APP_ID` = `a`.`ID` and `s`.`WEB_TYPE_ID` = \'2\'',3,1,1,'2020-04-20 17:37:23','2020-04-20 17:37:23'),(1091,'select * from modules',3,1,1,'2020-04-20 17:39:30','2020-04-20 17:39:30'),(1092,'select ID, 0 AS PID, CONCAT(\'http://localhost/phpapps_dev/\',APP_NAME,\'/index.php\') AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all\r\nselect CONCAT(APP_ID,ID) AS ID, APP_ID AS PID, (select run_path from view_scripts s where s.id = SCRIPT_ID) AS ACTION , MODULE_TITLE AS LABEL from view_modules',3,1,1,'2020-04-20 17:39:59','2020-04-20 17:39:59'),(1093,'select ID, 0 AS PID, CONCAT(\'http://localhost/phpapps_dev/\',APP_NAME,\'/index.php\') AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all\r\nselect CONCAT(APP_ID,ID) AS ID, APP_ID AS PID, CONCAT((select run_path from view_scripts s where s.id = SCRIPT_ID),\'?module_id=\',ID) AS ACTION , MODULE_TITLE AS LABEL from view_modules',3,1,1,'2020-04-20 17:41:21','2020-04-20 17:41:21'),(1094,'select ID, 0 AS PID, CONCAT(\'http://localhost/phpapps_dev/\',APP_NAME,\'/index.php\') AS ACTION, APP_NAME AS LABEL FROM phpapps.applications union all\r\nselect CONCAT(APP_ID,ID) AS ID, APP_ID AS PID, CONCAT(\'http://localhost/\',(select run_path from view_scripts s where s.id = SCRIPT_ID),\'?module_id=\',ID) AS ACTION , MODULE_TITLE AS LABEL from view_modules',3,1,1,'2020-04-20 17:44:05','2020-04-20 17:44:05'),(1095,'SELECT ID,NAME,MENU_TITLE,MENU_TYPE,ORIENTATION,QUERY_BODY,QUERY_ID,TEMPLATE_FILE FROM phpapps.view_menus WHERE ID = \'5\'',1,1,1,'2020-04-21 07:17:15','2020-04-21 07:17:15'),(1096,'show create view view_menus',1,1,1,'2020-04-21 07:18:10','2020-04-21 07:18:10'),(1097,'',3,1,1,'2020-04-21 07:18:23','2020-04-21 07:18:23'),(1098,'show create view view_menus',3,1,1,'2020-04-21 07:18:25','2020-04-21 07:18:25'),(1099,'select * from menus',3,1,1,'2020-04-21 07:21:56','2020-04-21 07:21:56'),(1100,'select l.NAME,l.APP_NAME from view_layouts l left join scripts s on (s.layout_id = l.id) where s.id = \'238\'',3,1,1,'2020-04-21 08:20:26','2020-04-21 08:20:26'),(1101,'select *,l.NAME,l.APP_NAME from view_layouts l left join scripts s on (s.layout_id = l.id) where s.id = \'238\'',3,1,1,'2020-04-21 08:21:04','2020-04-21 08:21:04'),(1102,'select * from layout_elements;',3,1,1,'2020-04-21 09:05:57','2020-04-21 09:05:57'),(1103,'select * from view_applications',3,1,1,'2020-04-21 15:21:59','2020-04-21 15:21:59'),(1104,'select * from view_modules',3,1,1,'2020-04-21 15:29:28','2020-04-21 15:29:28'),(1105,'show tables like \'list%\'',3,1,1,'2020-04-22 05:37:50','2020-04-22 05:37:50'),(1106,'select * from grids',3,1,1,'2020-04-22 08:17:08','2020-04-22 08:17:08'),(1107,'select * from scripts',3,1,1,'2020-04-22 08:19:32','2020-04-22 08:19:32'),(1108,'select * from view_scripts',3,1,1,'2020-04-22 08:19:40','2020-04-22 08:19:40'),(1109,'select * from tables',3,1,1,'2020-04-22 08:21:51','2020-04-22 08:21:51'),(1110,'show create view_scripts',3,1,1,'2020-04-22 08:22:38','2020-04-22 08:22:38'),(1111,'show create view view_scripts',3,1,1,'2020-04-22 08:22:45','2020-04-22 08:22:45'),(1112,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE	\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME,\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID), tables t on (g.TABLE_ID = t.IT)',3,1,1,'2020-04-22 08:24:16','2020-04-22 08:24:16'),(1113,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE	\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID), tables t on (g.TABLE_ID = t.IT)',3,1,1,'2020-04-22 08:24:25','2020-04-22 08:24:25'),(1114,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE,	\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID), tables t on (g.TABLE_ID = t.IT)',3,1,1,'2020-04-22 08:24:42','2020-04-22 08:24:42'),(1115,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE,	\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID), tables t on (g.TABLE_ID = t.ID)',3,1,1,'2020-04-22 08:24:49','2020-04-22 08:24:49'),(1116,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE,	\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID), left join tables t on (g.TABLE_ID = t.ID)',3,1,1,'2020-04-22 08:25:27','2020-04-22 08:25:27'),(1117,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE,	\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID) left join tables t on (g.TABLE_ID = t.ID)',3,1,1,'2020-04-22 08:26:03','2020-04-22 08:26:03'),(1118,'desc view_grids',3,1,1,'2020-04-22 08:33:28','2020-04-22 08:33:28'),(1119,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE,	\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID) left join tables t on (g.TABLE_ID = t.ID)',3,1,1,'2020-04-22 08:33:37','2020-04-22 08:33:37'),(1120,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE,	\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID) left join tables t on (g.TABLE_ID = t.ID)',3,1,1,'2020-04-22 08:33:44','2020-04-22 08:33:44'),(1121,'desc view_grids',3,1,1,'2020-04-22 08:34:15','2020-04-22 08:34:15'),(1122,'select * from view_grids',3,1,1,'2020-04-22 09:36:20','2020-04-22 09:36:20'),(1123,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE AS GRID_TYPE_ID\r\n	(select VALUE from phpapps.list_grid_types lgt WHERE lgd.ID = g.GRID_TYPE) AS GRID_TYPE\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME,\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID), tables t on (g.TABLE_ID = t.IT)',3,1,1,'2020-04-22 09:38:26','2020-04-22 09:38:26'),(1124,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE AS GRID_TYPE_ID\r\n	(select VALUE from phpapps.list_grid_types lgt WHERE lgt.ID = g.GRID_TYPE) AS GRID_TYPE\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME,\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID), tables t on (g.TABLE_ID = t.IT)',3,1,1,'2020-04-22 09:38:52','2020-04-22 09:38:52'),(1125,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE AS GRID_TYPE_ID\r\n	(select VALUE from phpapps.list_grid_types lgt WHERE lgt.ID = g.GRID_TYPE) AS GRID_TYPE,\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME,\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID), tables t on (g.TABLE_ID = t.IT)',3,1,1,'2020-04-22 09:39:28','2020-04-22 09:39:28'),(1126,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE AS GRID_TYPE_ID,\r\n	(select VALUE from phpapps.list_grid_types lgt WHERE lgt.ID = g.GRID_TYPE) AS GRID_TYPE,\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME,\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID), tables t on (g.TABLE_ID = t.IT)',3,1,1,'2020-04-22 09:39:34','2020-04-22 09:39:34'),(1127,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE AS GRID_TYPE_ID,\r\n	(select VALUE from phpapps.list_grid_types lgt WHERE lgt.ID = g.GRID_TYPE) AS GRID_TYPE,\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME,\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID) left join tables t on (g.TABLE_ID = t.IT)',3,1,1,'2020-04-22 09:39:59','2020-04-22 09:39:59'),(1128,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE AS GRID_TYPE_ID,\r\n	(select VALUE from phpapps.list_grid_types lgt WHERE lgt.ID = g.GRID_TYPE) AS GRID_TYPE,\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID) left join tables t on (g.TABLE_ID = t.IT)',3,1,1,'2020-04-22 09:40:31','2020-04-22 09:40:31'),(1129,'SELECT g.ID,\r\n	g.GRID_NAME,\r\n	g.GRID_TYPE AS GRID_TYPE_ID,\r\n	(select VALUE from phpapps.list_grid_types lgt WHERE lgt.ID = g.GRID_TYPE) AS GRID_TYPE,\r\n	g.TABLE_ID,\r\n	g.QUERY_ID,\r\n	g.EDITABLE,\r\n	g.FILTERABLE,\r\n	g.PAGINABLE,\r\n	g.EXPORTABLE,\r\n	g.EDIT_FORM_ID,\r\n	g.ROWS_ON_PAGE,\r\n	g.ELEMENT_TEMPLATE_ID,\r\n	s.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\n	t.TABLE_NAME\r\n	from grids g left join view_scripts s on (s.ID  = g.EDIT_FORM_ID) left join tables t on (g.TABLE_ID = t.ID)',3,1,1,'2020-04-22 09:40:43','2020-04-22 09:40:43'),(1130,'select * from tables',3,1,1,'2020-04-22 09:58:59','2020-04-22 09:58:59'),(1131,'select * from view_tables',3,1,1,'2020-04-22 09:59:07','2020-04-22 09:59:07'),(1132,'select * from view_grids',3,1,1,'2020-04-22 10:00:30','2020-04-22 10:00:30'),(1133,'select * from view_scripts',3,1,1,'2020-04-22 10:05:07','2020-04-22 10:05:07'),(1134,'show tables',3,1,1,'2020-04-22 11:41:04','2020-04-22 11:41:04'),(1135,'show tables',3,1,1,'2020-04-22 11:52:53','2020-04-22 11:52:53'),(1136,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, LAYOUT_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'1\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, LAYOUT_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'1\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, LAYOUT_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'1\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-22 12:21:42','2020-04-22 12:21:42'),(1137,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, LAYOUT_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'1\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-22 12:22:04','2020-04-22 12:22:04'),(1138,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, LAYOUT_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'1\' AND DISPLAY_OBJECT_TYPE_ID=\'2\'',3,1,1,'2020-04-22 12:22:09','2020-04-22 12:22:09'),(1139,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, LAYOUT_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'1\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-22 12:22:13','2020-04-22 12:22:13'),(1140,'show tables',3,1,1,'2020-04-22 12:24:08','2020-04-22 12:24:08'),(1141,'show tables like \'view%\'',3,1,1,'2020-04-22 15:11:27','2020-04-22 15:11:27'),(1142,'select * from phpapps.display_object_elements',3,1,1,'2020-04-22 16:54:51','2020-04-22 16:54:51'),(1143,'show tables',3,1,1,'2020-04-22 16:56:31','2020-04-22 16:56:31'),(1144,'select * from  display_object_elements',3,1,1,'2020-04-22 16:57:02','2020-04-22 16:57:02'),(1145,'select * from  layouts',3,1,1,'2020-04-22 17:02:20','2020-04-22 17:02:20'),(1146,'select * from  scripts',3,1,1,'2020-04-22 17:05:05','2020-04-22 17:05:05'),(1147,'select dsp.ID,\r\n	dsp.DISPLAY_OBJECT_ID,\r\n	dsp.DISPLAY_OBJECT_TYPE_ID,\r\n	CASE\r\n    WHEN dsp.DISPLAY_OBJECT_ID = \'1\' THEN (SELECT l.NAME FROM phpapps.layouts l WHERE l.ID = dsp.DISPLAY_OBJECT_ID)\r\n    WHEN dsp.DISPLAY_OBJECT_ID = \'2\' THEN (SELECT s.SCRIPT_NAME FROM phpapps.scripts s WHERE s.ID = dsp.DISPLAY_OBJECT_ID)\r\n    ELSE \"The quantity is under 30\"\r\n	END AS DISPLAY_OBJECT_NAME,\r\n	\r\n	\r\n	dsp.ELEMENT_ID,\r\n	dsp.ELEMENT_TYPE_ID,\r\n	dsp.TEMPLATE_VARIABLE_NAME,\r\n	dsp.DESCRIPTION from display_object_elements dsp',3,1,1,'2020-04-22 17:06:38','2020-04-22 17:06:38'),(1148,'select dsp.ID,\r\n	dsp.DISPLAY_OBJECT_ID,\r\n	dsp.DISPLAY_OBJECT_TYPE_ID,\r\n	CASE\r\n    WHEN dsp.DISPLAY_OBJECT_ID = \'1\' THEN (SELECT l.NAME FROM phpapps.layouts l WHERE l.ID = dsp.DISPLAY_OBJECT_ID)\r\n    WHEN dsp.DISPLAY_OBJECT_ID = \'2\' THEN (SELECT s.SCRIPT_NAME FROM phpapps.scripts s WHERE s.ID = dsp.DISPLAY_OBJECT_ID)\r\n    ELSE \'\'\r\n	END AS DISPLAY_OBJECT_NAME,\r\n	\r\n	\r\n	dsp.ELEMENT_ID,\r\n	dsp.ELEMENT_TYPE_ID,\r\n	dsp.TEMPLATE_VARIABLE_NAME,\r\n	dsp.DESCRIPTION from display_object_elements dsp',3,1,1,'2020-04-22 17:07:00','2020-04-22 17:07:00'),(1149,'select dsp.ID,\r\n	dsp.DISPLAY_OBJECT_ID,\r\n	dsp.DISPLAY_OBJECT_TYPE_ID,\r\n	CASE\r\n    WHEN dsp.DISPLAY_OBJECT_ID = \'1\' THEN (SELECT l.NAME FROM phpapps.layouts l WHERE l.ID = dsp.DISPLAY_OBJECT_ID)\r\n    WHEN dsp.DISPLAY_OBJECT_ID = \'2\' THEN (SELECT s.SCRIPT_NAME FROM phpapps.scripts s WHERE s.ID = dsp.DISPLAY_OBJECT_ID)\r\n    ELSE \'UNKNOWN\'\r\n	END AS DISPLAY_OBJECT_NAME,\r\n	dsp.ELEMENT_ID,\r\n	dsp.ELEMENT_TYPE_ID,\r\n	dsp.TEMPLATE_VARIABLE_NAME,\r\n	dsp.DESCRIPTION from display_object_elements dsp',3,1,1,'2020-04-22 17:07:25','2020-04-22 17:07:25'),(1150,'select dsp.ID,\r\n	dsp.DISPLAY_OBJECT_ID,\r\n	CASE\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'1\' THEN (SELECT l.NAME FROM phpapps.layouts l WHERE l.ID = dsp.DISPLAY_OBJECT_ID)\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'2\' THEN (SELECT s.SCRIPT_NAME FROM phpapps.scripts s WHERE s.ID = dsp.DISPLAY_OBJECT_ID)\r\n		ELSE \'UNKNOWN\'\r\n	END AS DISPLAY_OBJECT_NAME,\r\n	\r\n	dsp.DISPLAY_OBJECT_TYPE_ID,\r\n	\r\n	CASE\r\n		WHEN dsp.DISPLAY_OBJECT_ID = \'1\' THEN \'LAYOUT\'\r\n		WHEN dsp.DISPLAY_OBJECT_ID = \'2\' THEN \'SCRIPT\'\r\n		ELSE \'UNKNOWN\'\r\n	END AS DISPLAY_OBJECT_TYPE,\r\n	\r\n	dsp.ELEMENT_ID,\r\n	dsp.ELEMENT_TYPE_ID,\r\n	dsp.TEMPLATE_VARIABLE_NAME,\r\n	dsp.DESCRIPTION from display_object_elements dsp',3,1,1,'2020-04-22 17:11:01','2020-04-22 17:11:01'),(1151,'select dsp.ID,\r\n	dsp.DISPLAY_OBJECT_ID,\r\n	CASE\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'1\' THEN (SELECT l.NAME FROM phpapps.layouts l WHERE l.ID = dsp.DISPLAY_OBJECT_ID)\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'2\' THEN (SELECT s.SCRIPT_NAME FROM phpapps.scripts s WHERE s.ID = dsp.DISPLAY_OBJECT_ID)\r\n		ELSE \'UNKNOWN\'\r\n	END AS DISPLAY_OBJECT_NAME,\r\n	\r\n	dsp.DISPLAY_OBJECT_TYPE_ID,\r\n	\r\n	CASE\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'1\' THEN \'LAYOUT\'\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'2\' THEN \'SCRIPT\'\r\n		ELSE \'UNKNOWN\'\r\n	END AS DISPLAY_OBJECT_TYPE,\r\n	\r\n	dsp.ELEMENT_ID,\r\n	dsp.ELEMENT_TYPE_ID,\r\n	dsp.TEMPLATE_VARIABLE_NAME,\r\n	dsp.DESCRIPTION from display_object_elements dsp',3,1,1,'2020-04-22 17:11:43','2020-04-22 17:11:43'),(1152,'select dsp.ID,\r\n	dsp.DISPLAY_OBJECT_ID,\r\n	CASE\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'1\' THEN (SELECT l.NAME FROM phpapps.layouts l WHERE l.ID = dsp.DISPLAY_OBJECT_ID)\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'2\' THEN (SELECT s.SCRIPT_NAME FROM phpapps.scripts s WHERE s.ID = dsp.DISPLAY_OBJECT_ID)\r\n		ELSE \'UNKNOWN\'\r\n	END AS DISPLAY_OBJECT_NAME,\r\n	\r\n	dsp.DISPLAY_OBJECT_TYPE_ID,\r\n	\r\n	(SELECT ldo.VALUE FROM list_display_objects_types ldo WHERE ldo.ID = dsp.DISPLAY_OBJECT_TYPE_ID) AS DISPLAY_OBJECT_TYPE,\r\n	\r\n	\r\n	dsp.ELEMENT_ID,\r\n	dsp.ELEMENT_TYPE_ID,\r\n	dsp.TEMPLATE_VARIABLE_NAME,\r\n	dsp.DESCRIPTION from display_object_elements dsp',3,1,1,'2020-04-22 17:14:01','2020-04-22 17:14:01'),(1153,'select dsp.ID,\r\n	dsp.DISPLAY_OBJECT_ID,\r\n	CASE\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'1\' THEN (SELECT l.NAME FROM phpapps.layouts l WHERE l.ID = dsp.DISPLAY_OBJECT_ID)\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'2\' THEN (SELECT s.SCRIPT_NAME FROM phpapps.scripts s WHERE s.ID = dsp.DISPLAY_OBJECT_ID)\r\n		ELSE \'UNKNOWN\'\r\n	END AS DISPLAY_OBJECT_NAME,\r\n	dsp.DISPLAY_OBJECT_TYPE_ID,\r\n	(SELECT ldo.VALUE FROM list_display_objects_types ldo WHERE ldo.ID = dsp.DISPLAY_OBJECT_TYPE_ID) AS DISPLAY_OBJECT_TYPE,\r\n	dsp.ELEMENT_ID,\r\n	\r\n	dsp.ELEMENT_TYPE_ID,\r\n	(SELECT lde.VALUE FROM list_display_elements_types lde WHERE lde.ID = dsp.ELEMENT_TYPE_ID) AS ELEMENT_TYPE,\r\n	dsp.TEMPLATE_VARIABLE_NAME,\r\n	dsp.DESCRIPTION from display_object_elements dsp',3,1,1,'2020-04-22 17:16:01','2020-04-22 17:16:01'),(1154,'select dsp.ID,\r\n	dsp.DISPLAY_OBJECT_ID,\r\n	CASE\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'1\' THEN (SELECT l.NAME FROM phpapps.layouts l WHERE l.ID = dsp.DISPLAY_OBJECT_ID)\r\n		WHEN dsp.DISPLAY_OBJECT_TYPE_ID = \'2\' THEN (SELECT s.SCRIPT_NAME FROM phpapps.scripts s WHERE s.ID = dsp.DISPLAY_OBJECT_ID)\r\n		ELSE \'UNKNOWN OBJECT\'\r\n	END AS DISPLAY_OBJECT_NAME,\r\n	dsp.DISPLAY_OBJECT_TYPE_ID,\r\n	(SELECT ldo.VALUE FROM list_display_objects_types ldo WHERE ldo.ID = dsp.DISPLAY_OBJECT_TYPE_ID) AS DISPLAY_OBJECT_TYPE,\r\n	dsp.ELEMENT_ID,\r\n	\r\n	CASE\r\n		WHEN dsp.ELEMENT_TYPE_ID = \'1\' THEN (SELECT m.NAME FROM phpapps.menus m WHERE m.ID = dsp.ELEMENT_ID)\r\n		WHEN dsp.ELEMENT_TYPE_ID = \'2\' THEN (SELECT ss.SCRIPT_NAME FROM phpapps.scripts ss WHERE ss.ID = dsp.ELEMENT_ID)\r\n		WHEN dsp.ELEMENT_TYPE_ID = \'3\' THEN (SELECT lv.VARIABLE_NAME FROM phpapps.layout_variables lv WHERE lv.ID = dsp.ELEMENT_ID)\r\n		WHEN dsp.ELEMENT_TYPE_ID = \'4\' THEN (SELECT g.GRID_NAME FROM phpapps.grids g WHERE g.ID = dsp.ELEMENT_ID)\r\n		ELSE \'UNKNOWN ELEMENT\'\r\n	END AS ELEMENT_NAME,\r\n	\r\n	dsp.ELEMENT_TYPE_ID,\r\n	(SELECT lde.VALUE FROM list_display_elements_types lde WHERE lde.ID = dsp.ELEMENT_TYPE_ID) AS ELEMENT_TYPE,\r\n	dsp.TEMPLATE_VARIABLE_NAME,\r\n	dsp.DESCRIPTION from display_object_elements dsp',3,1,1,'2020-04-22 17:22:14','2020-04-22 17:22:14'),(1155,'select * from view_display_object_elements',3,1,1,'2020-04-22 17:23:23','2020-04-22 17:23:23'),(1156,'select * from view_display_object_elements',3,1,1,'2020-04-22 17:23:24','2020-04-22 17:23:24'),(1157,'select * from view_display_object_elements',3,1,1,'2020-04-22 17:23:25','2020-04-22 17:23:25'),(1158,'select * from view_display_object_elements',3,1,1,'2020-04-22 17:23:26','2020-04-22 17:23:26'),(1159,'select * from view_display_object_elements',3,1,1,'2020-04-22 17:23:27','2020-04-22 17:23:27'),(1160,'select * from view_display_object_elements',3,1,1,'2020-04-22 17:30:01','2020-04-22 17:30:01'),(1161,'select * from view_display_object_elements',3,1,1,'2020-04-22 17:30:02','2020-04-22 17:30:02'),(1162,'select * from view_display_object_elements',3,1,1,'2020-04-22 17:31:37','2020-04-22 17:31:37'),(1163,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'25\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-22 18:00:33','2020-04-22 18:00:33'),(1164,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.view_display_object_elements WHERE DISPLAY_OBJECT_ID = \'25\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-22 18:00:51','2020-04-22 18:00:51'),(1165,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.view_display_object_elements WHERE DISPLAY_OBJECT_ID = \'25\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-22 18:00:52','2020-04-22 18:00:52'),(1166,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'253\' AND DISPLAY_OBJECT_TYPE_ID=\'2\'',3,1,1,'2020-04-22 18:20:08','2020-04-22 18:20:08'),(1167,'select * from grid_columns',3,1,1,'2020-04-22 19:09:07','2020-04-22 19:09:07'),(1168,'select * from table_details',3,1,1,'2020-04-22 19:11:43','2020-04-22 19:11:43'),(1169,'select\r\ngc.ID,\r\ngc.GRID_ID,	\r\ng.GRID_NAME,\r\ngc.COLUMN_ID,\r\ntd.COLUMN_NAME,	\r\ngc.ALT_COLUMN_TEXT,\r\ngc.LABEL,	\r\ngc.ACTION\r\nfrom phpapps.grid_columns gc left join phpapps.grids g on(gc.GRID_ID = g.ID) left join phpapps.table_details td on (gc.COLUMN_ID = td.ID)',3,1,1,'2020-04-22 19:13:48','2020-04-22 19:13:48'),(1170,'select * from view_grid_columns',3,1,1,'2020-04-22 19:15:07','2020-04-22 19:15:07'),(1171,'select * from view_grid_columns',3,1,1,'2020-04-22 19:15:09','2020-04-22 19:15:09'),(1172,'select * from table details',3,1,1,'2020-04-22 19:16:39','2020-04-22 19:16:39'),(1173,'select * from table_details',3,1,1,'2020-04-22 19:16:44','2020-04-22 19:16:44'),(1174,'select * from view_table_details',3,1,1,'2020-04-22 19:16:53','2020-04-22 19:16:53'),(1175,'select * from grids',3,1,1,'2020-04-22 19:18:55','2020-04-22 19:18:55'),(1176,'select * from grid_columns',3,1,1,'2020-04-22 19:19:55','2020-04-22 19:19:55'),(1177,'select * from view_grid_columns',3,1,1,'2020-04-22 19:20:19','2020-04-22 19:20:19'),(1178,'SELECT ID AS VALUE, COLUMN_NAME AS LABEL FROM phpapps.table_details WHERE TABLE_ID = \'338\'',3,1,1,'2020-04-22 19:39:34','2020-04-22 19:39:34'),(1179,'select * from  tables',3,1,1,'2020-04-22 19:40:11','2020-04-22 19:40:11'),(1180,'SELECT ID AS VALUE, COLUMN_NAME AS LABEL FROM phpapps.table_details WHERE TABLE_ID = \'338\'',3,1,1,'2020-04-22 19:41:02','2020-04-22 19:41:02'),(1181,'select * from tables',3,1,1,'2020-04-22 19:41:33','2020-04-22 19:41:33'),(1182,'SELECT ID AS VALUE, COLUMN_NAME AS LABEL FROM phpapps.table_details WHERE TABLE_ID = SELECT ORIGIN_ID FROM TABLES WHERE ID = \'338\')',3,1,1,'2020-04-22 19:42:04','2020-04-22 19:42:04'),(1183,'SELECT ID AS VALUE, COLUMN_NAME AS LABEL FROM phpapps.table_details WHERE TABLE_ID = (SELECT ORIGIN_ID FROM TABLES WHERE ID = \'338\')',3,1,1,'2020-04-22 19:42:15','2020-04-22 19:42:15'),(1184,'select * from view_table_details',3,1,1,'2020-04-22 19:42:59','2020-04-22 19:42:59'),(1185,'SELECT ID AS VALUE, COLUMN_NAME AS LABEL FROM phpapps.table_details WHERE TABLE_ID = (SELECT IF(ORIGIN_ID = 0,ID,ORIGIN_ID) FROM TABLES WHERE ID = \'338\')',3,1,1,'2020-04-22 19:44:51','2020-04-22 19:44:51'),(1186,'SELECT ID AS VALUE, COLUMN_NAME AS LABEL FROM phpapps.table_details WHERE TABLE_ID = (SELECT IF(ORIGIN_ID = 0,ID,ORIGIN_ID) FROM TABLES WHERE ID = \'338\')',3,1,1,'2020-04-22 19:44:52','2020-04-22 19:44:52'),(1187,'SELECT ID AS VALUE, COLUMN_NAME AS LABEL FROM phpapps.table_details WHERE TABLE_ID = (SELECT IF(ORIGIN_ID = 0,ID,ORIGIN_ID) FROM TABLES WHERE ID = \'338\')',3,1,1,'2020-04-22 19:44:53','2020-04-22 19:44:53'),(1188,'select * from grid_columns',3,1,1,'2020-04-22 19:50:29','2020-04-22 19:50:29'),(1189,'select * from view_grid_columns',3,1,1,'2020-04-22 19:50:37','2020-04-22 19:50:37'),(1190,'select * from view_grid_columns',3,1,1,'2020-04-22 19:59:32','2020-04-22 19:59:32'),(1191,'SELECT COLUMN_NAME, ALT_COLUMN_TEXT, LABEL, ACTION FROM phpapps.view_grid_columns WHERE GRID_ID=\'1\'',3,1,1,'2020-04-22 20:07:18','2020-04-22 20:07:18'),(1192,'show create view phpapps.view_applications',3,1,1,'2020-04-22 20:31:05','2020-04-22 20:31:05'),(1193,'SELECT ID, GRID_NAME, GRID_TITLE, GRID_TYPE, TABLE_ID, QUERY_ID, EDITABLE, FILTERABLE, PAGINABLE, EXPORTABLE, EDIT_FORM_ID, ROWS_ON_PAGE, ELEMENT_TEMPLATE_ID, EDIT_FORM_RUN_PATH, EDIT_FORM_FILE_NAME, TABLE_NAME FROM phpapps.view_grids WHERE ID = \'2',1,1,1,'2020-04-23 09:40:05','2020-04-23 09:40:05'),(1194,'SELECT ID, GRID_NAME, GRID_TITLE, GRID_TYPE, TABLE_ID, QUERY_ID, EDITABLE, FILTERABLE, PAGINABLE, EXPORTABLE, EDIT_FORM_ID, ROWS_ON_PAGE, ELEMENT_TEMPLATE_ID, \r\nEDIT_FORM_RUN_PATH, EDIT_FORM_FILE_NAME, TABLE_NAME FROM phpapps.view_grids WHERE ID = \'2\'',1,1,1,'2020-04-23 09:40:28','2020-04-23 09:40:28'),(1195,'select *  FROM phpapps.view_grids',1,1,1,'2020-04-23 09:41:01','2020-04-23 09:41:01'),(1196,'show create view view_grids',1,1,1,'2020-04-23 09:41:27','2020-04-23 09:41:27'),(1197,'show create view phpapps.view_grids',1,1,1,'2020-04-23 09:41:40','2020-04-23 09:41:40'),(1198,'select g.ID AS ID,g.GRID_NAME AS GRID_NAME,\r\ng.GRID_TITLE AS GRID_TITLE,g.GRID_TYPE AS GRID_TYPE_ID,(select lgt.VALUE from phpapps.list_grid_types lgt where lgt.ID = g.GRID_TYPE) AS GRID_TYPE,g.TABLE_ID AS TABLE_ID,\r\ng.QUERY_ID AS QUERY_ID,g.EDITABLE AS EDITABLE,g.FILTERABLE AS FILTERABLE,g.PAGINABLE AS PAGINABLE,g.EXPORTABLE AS EXPORTABLE,\r\ng.EDIT_FORM_ID AS EDIT_FORM_ID,g.ROWS_ON_PAGE AS ROWS_ON_PAGE,\r\ng.ELEMENT_TEMPLATE_ID AS ELEMENT_TEMPLATE_ID,\r\ns.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\ns.FILE_NAME AS EDIT_FORM_FILE_NAME,concat(t.TABLE_SCHEMA,\'.\',t.TABLE_NAME) AS TABLE_NAME \r\nfrom ((phpapps.grids g left join phpapps.view_scripts s on(s.ID = g.EDIT_FORM_ID)) left join phpapps.view_tables t on(g.TABLE_ID = t.ID))',1,1,1,'2020-04-23 09:43:26','2020-04-23 09:43:26'),(1199,'select * from view_scripts',3,1,1,'2020-04-23 09:44:00','2020-04-23 09:44:00'),(1200,'select * from view_scripts order by id desc',3,1,1,'2020-04-23 09:44:19','2020-04-23 09:44:19'),(1201,'select * from view_forms order by id desc',3,1,1,'2020-04-23 09:44:34','2020-04-23 09:44:34'),(1202,'select g.ID AS ID,g.GRID_NAME AS GRID_NAME,\r\ng.GRID_TITLE AS GRID_TITLE,g.GRID_TYPE AS GRID_TYPE_ID,(select lgt.VALUE from phpapps.list_grid_types lgt where lgt.ID = g.GRID_TYPE) AS GRID_TYPE,g.TABLE_ID AS TABLE_ID,\r\ng.QUERY_ID AS QUERY_ID,g.EDITABLE AS EDITABLE,g.FILTERABLE AS FILTERABLE,g.PAGINABLE AS PAGINABLE,g.EXPORTABLE AS EXPORTABLE,\r\ng.EDIT_FORM_ID AS EDIT_FORM_ID,g.ROWS_ON_PAGE AS ROWS_ON_PAGE,\r\ng.ELEMENT_TEMPLATE_ID AS ELEMENT_TEMPLATE_ID,\r\ns.RUN_PATH AS EDIT_FORM_RUN_PATH,\r\ns.FILE_NAME AS EDIT_FORM_FILE_NAME,concat(t.TABLE_SCHEMA,\'.\',t.TABLE_NAME) AS TABLE_NAME \r\nfrom ((phpapps.grids g left join phpapps.view_scripts s on(s.ID = g.EDIT_FORM_ID)) left join phpapps.view_tables t on(g.TABLE_ID = t.ID))',1,1,1,'2020-04-23 09:47:38','2020-04-23 09:47:38'),(1203,'select * from phpapps.view_grids',1,1,1,'2020-04-23 09:48:00','2020-04-23 09:48:00'),(1204,'SELECT ID, GRID_NAME, GRID_TITLE, GRID_TYPE, TABLE_ID, QUERY_ID, EDITABLE, FILTERABLE, PAGINABLE, EXPORTABLE, EDIT_FORM_ID, ROWS_ON_PAGE, ELEMENT_TEMPLATE_ID, EDIT_FORM_RUN_PATH, EDIT_FORM_FILE_NAME, TABLE_NAME FROM phpapps.view_grids WHERE ID = \'2\'',3,1,1,'2020-04-23 09:50:11','2020-04-23 09:50:11'),(1205,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'1\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements',3,1,1,'2020-04-23 10:02:42','2020-04-23 10:02:42'),(1206,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'1\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-23 10:03:21','2020-04-23 10:03:21'),(1207,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements',3,1,1,'2020-04-23 10:04:05','2020-04-23 10:04:05'),(1208,'SELECT *,ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements',3,1,1,'2020-04-23 10:04:18','2020-04-23 10:04:18'),(1209,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'165\' AND DISPLAY_OBJECT_TYPE_ID=\'2\'',3,1,1,'2020-04-23 10:07:33','2020-04-23 10:07:33'),(1210,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements',3,1,1,'2020-04-23 10:07:41','2020-04-23 10:07:41'),(1211,'SELECT *,ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements',3,1,1,'2020-04-23 10:07:47','2020-04-23 10:07:47'),(1212,'SELECT *,ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.view_display_object_elements',3,1,1,'2020-04-23 10:07:58','2020-04-23 10:07:58'),(1213,'SELECT *,ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.view_display_object_elements',3,1,1,'2020-04-23 10:07:59','2020-04-23 10:07:59'),(1214,'SELECT *,ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.view_display_object_elements',3,1,1,'2020-04-23 10:08:00','2020-04-23 10:08:00'),(1215,'select * from templates',3,1,1,'2020-04-23 10:14:43','2020-04-23 10:14:43'),(1216,'select * from phpapps.list_element_types',1,1,1,'2020-04-23 10:22:08','2020-04-23 10:22:08'),(1217,'show tables',3,1,1,'2020-04-23 10:22:32','2020-04-23 10:22:32'),(1218,'show tables like \'list\'',3,1,1,'2020-04-23 10:22:38','2020-04-23 10:22:38'),(1219,'show tables like \'list%\'',3,1,1,'2020-04-23 10:22:45','2020-04-23 10:22:45'),(1220,'select t.ID, t.TEMPLATE_NAME,t.APP_ID,t.DESCRIPTION,t.ELEMENT_TYPE_ID \r\n(SELECT ldet.VALUE FROM list_display_elements_types ldet WHERE t.ELEMENT_TYPE_ID = ldet.ID ) AS ELEMENT_TYPE\r\nfrom templates t',3,1,1,'2020-04-23 10:23:59','2020-04-23 10:23:59'),(1221,'select t.ID, t.TEMPLATE_NAME,t.APP_ID,t.DESCRIPTION,t.ELEMENT_TYPE_ID, \r\n(SELECT ldet.VALUE FROM list_display_elements_types ldet WHERE t.ELEMENT_TYPE_ID = ldet.ID ) AS ELEMENT_TYPE\r\nfrom templates t',3,1,1,'2020-04-23 10:24:05','2020-04-23 10:24:05'),(1222,'select t.ID, \r\nt.TEMPLATE_NAME,\r\nt.APP_ID,\r\na.APP_NAME,\r\nt.DESCRIPTION,\r\nt.ELEMENT_TYPE_ID, \r\n(SELECT ldet.VALUE FROM list_display_elements_types ldet WHERE t.ELEMENT_TYPE_ID = ldet.ID ) AS ELEMENT_TYPE\r\nfrom templates t left join applications a on (a.ID = t.APP_ID)',3,1,1,'2020-04-23 10:25:07','2020-04-23 10:25:07'),(1223,'select * from view templates',3,1,1,'2020-04-23 19:21:56','2020-04-23 19:21:56'),(1224,'select * from view_templates',3,1,1,'2020-04-23 19:22:03','2020-04-23 19:22:03'),(1225,'select * from view_templates',3,1,1,'2020-04-23 20:04:02','2020-04-23 20:04:02'),(1226,'select * from view_templates',3,1,1,'2020-04-23 20:04:32','2020-04-23 20:04:32'),(1227,'select TEMPLATE_NAME,APP_NAME,ELEMENT_TYPE from view_templates where ID = \'18\'',3,1,1,'2020-04-23 20:23:40','2020-04-23 20:23:40'),(1228,'select * from view_templates',3,1,1,'2020-04-23 20:23:47','2020-04-23 20:23:47'),(1229,'select * from view_templates',3,1,1,'2020-04-23 20:23:48','2020-04-23 20:23:48'),(1230,'select * from view_templates',3,1,1,'2020-04-23 20:24:12','2020-04-23 20:24:12'),(1231,'select * from applications',3,1,1,'2020-04-25 08:47:42','2020-04-25 08:47:42'),(1232,'SELECT ID, APP_ID, (SELECT APP_NAME FROM phpapps.applications WHERE phpapps.applications.ID = phpapps.custom_elemets.ID) AS APP_NAME FROM phpapps.custom_elements WHERE APP_ID = \'1\' AND NAME = \'CUSTOM_ELEMENT_1\'',3,1,1,'2020-04-25 09:08:12','2020-04-25 09:08:12'),(1233,'SELECT ID, APP_ID, (SELECT APP_NAME FROM phpapps.applications WHERE phpapps.applications.ID = phpapps.custom_elemets.APP_ID) AS APP_NAME FROM phpapps.custom_elements WHERE APP_ID = \'1\' AND NAME = \'CUSTOM_ELEMENT_1\'',3,1,1,'2020-04-25 09:08:44','2020-04-25 09:08:44'),(1234,'SELECT ID, APP_ID, (SELECT APP_NAME FROM phpapps.applications WHERE phpapps.applications.ID = phpapps.custom_elements.APP_ID) AS APP_NAME FROM phpapps.custom_elements WHERE APP_ID = \'1\' AND NAME = \'CUSTOM_ELEMENT_1\'',3,1,1,'2020-04-25 09:08:54','2020-04-25 09:08:54'),(1235,'select * from view_templates',3,1,1,'2020-04-25 11:08:15','2020-04-25 11:08:15'),(1236,'show create view view_templates',3,1,1,'2020-04-25 11:08:29','2020-04-25 11:08:29'),(1237,'select * from list_layout_elements_types',3,1,1,'2020-04-25 11:13:15','2020-04-25 11:13:15'),(1238,'select * from view_custom_elements',3,1,1,'2020-04-25 12:27:20','2020-04-25 12:27:20'),(1239,'select * from custom_elements',3,1,1,'2020-04-25 12:27:29','2020-04-25 12:27:29'),(1240,'show tables like \'view%\'',3,1,1,'2020-04-25 15:54:27','2020-04-25 15:54:27'),(1241,'select * from view_posible_display_object_elements',3,1,1,'2020-04-25 15:54:52','2020-04-25 15:54:52'),(1242,'show create view view_posible_display_object_elements',3,1,1,'2020-04-25 15:55:07','2020-04-25 15:55:07'),(1243,'select ID AS ID,concat(NAME,\'(custom_element)\') AS ELEMENT_NAME,\'5\' AS ELEMENT_TYPE from custom_elements',3,1,1,'2020-04-25 16:25:24','2020-04-25 16:25:24'),(1244,'select * from phpapps.view_display_object_elements',3,1,1,'2020-04-25 16:32:01','2020-04-25 16:32:01'),(1245,'show create view phpapps.view_display_object_elements',3,1,1,'2020-04-25 16:32:18','2020-04-25 16:32:18'),(1246,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'253\' AND DISPLAY_OBJECT_TYPE_ID=\'2\'',3,1,1,'2020-04-25 16:53:36','2020-04-25 16:53:36'),(1247,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'25\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-25 17:02:14','2020-04-25 17:02:14'),(1248,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'253\' AND DISPLAY_OBJECT_TYPE_ID=\'2\'',3,1,1,'2020-04-25 17:02:39','2020-04-25 17:02:39'),(1249,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'25\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-25 17:04:06','2020-04-25 17:04:06'),(1250,'select * from list_display_objects_types',3,1,1,'2020-04-25 18:40:45','2020-04-25 18:40:45'),(1251,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'5\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-25 18:41:10','2020-04-25 18:41:10'),(1252,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'5\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-25 18:46:40','2020-04-25 18:46:40'),(1253,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'5\' AND DISPLAY_OBJECT_TYPE_ID=\'2\'',3,1,1,'2020-04-25 18:46:48','2020-04-25 18:46:48'),(1254,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'5\'',3,1,1,'2020-04-25 18:46:52','2020-04-25 18:46:52'),(1255,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'5\'',3,1,1,'2020-04-25 18:46:53','2020-04-25 18:46:53'),(1256,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements',3,1,1,'2020-04-25 18:47:03','2020-04-25 18:47:03'),(1257,'SELECT ID, ELEMENT_ID, ELEMENT_TYPE_ID, TEMPLATE_VARIABLE_NAME FROM phpapps.display_object_elements WHERE DISPLAY_OBJECT_ID = \'5\' AND DISPLAY_OBJECT_TYPE_ID=\'1\'',3,1,1,'2020-04-25 18:51:06','2020-04-25 18:51:06'),(1258,'select * from view_tables',3,1,1,'2020-04-25 19:42:28','2020-04-25 19:42:28'),(1259,'select * from sql_console_history',3,1,1,'2020-04-25 19:58:43','2020-04-25 19:58:43'),(1260,'show tables',3,1,1,'2020-04-26 07:00:14','2020-04-26 07:00:14'),(1261,'select * from view_display_object_elements',3,1,1,'2020-04-26 07:19:37','2020-04-26 07:19:37'),(1262,'select * from scripts',3,1,1,'2020-04-26 07:32:35','2020-04-26 07:32:35'),(1263,'select * from view_templates',3,1,1,'2020-04-26 08:58:16','2020-04-26 08:58:16'),(1264,'select * from form_details where form_id = \'60\'',3,1,1,'2020-04-26 09:06:14','2020-04-26 09:06:14'),(1265,'select * from form_details where form_id = \'60\'',3,1,1,'2020-04-26 09:07:09','2020-04-26 09:07:09'),(1266,'select * from view_display_object_elements',3,1,1,'2020-04-26 09:07:15','2020-04-26 09:07:15'),(1267,'select * from layouts',3,1,1,'2020-04-26 09:18:50','2020-04-26 09:18:50'),(1268,'show tables',3,1,1,'2020-04-26 09:18:57','2020-04-26 09:18:57'),(1269,'select * from display_object_elements',3,1,1,'2020-04-26 09:19:46','2020-04-26 09:19:46'),(1270,'select * from view_layouts',3,1,1,'2020-04-26 09:20:18','2020-04-26 09:20:18'),(1271,'select * from scripts',3,1,1,'2020-04-26 09:20:47','2020-04-26 09:20:47'),(1272,'select * from view_layouts',3,1,1,'2020-04-26 10:03:34','2020-04-26 10:03:34'),(1273,'show create view view_layouts',3,1,1,'2020-04-26 10:03:53','2020-04-26 10:03:53'),(1274,'select * from view_layouts',3,1,1,'2020-04-26 10:04:09','2020-04-26 10:04:09'),(1275,'SELECT ID FROM scripts WHERE SCRIPT_NAME = \'phpapps_admin_scripts_form_imp\'',3,1,1,'2020-04-26 10:06:38','2020-04-26 10:06:38'),(1276,'SELECT *,ID FROM scripts',3,1,1,'2020-04-26 10:07:07','2020-04-26 10:07:07'),(1277,'SELECT t.ID, t.TEMPLATE_NAME FROM phpapps.templates t LEFT JOIN phpapps.scripts s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = \'1\'',3,1,1,'2020-04-26 11:04:03','2020-04-26 11:04:03'),(1278,'SELECT t.ID, t.TEMPLATE_NAME FROM phpapps.templates t LEFT JOIN phpapps.scripts s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = \'165\'',3,1,1,'2020-04-26 11:05:12','2020-04-26 11:05:12'),(1279,'SELECT t.ID, t.TEMPLATE_NAME FROM phpapps.templates t LEFT JOIN phpapps.scripts s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = \'165\'',3,1,1,'2020-04-26 11:05:14','2020-04-26 11:05:14'),(1280,'SELECT t.ID, t.TEMPLATE_NAME FROM phpapps.templates t LEFT JOIN phpapps.scripts s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = \'165\'',3,1,1,'2020-04-26 11:05:15','2020-04-26 11:05:15'),(1281,'SELECT t.ID, t.TEMPLATE_NAME FROM phpapps.templates t LEFT JOIN phpapps.scripts s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = \'281\'',3,1,1,'2020-04-26 11:07:16','2020-04-26 11:07:16'),(1282,'SELECT t.ID, t.TEMPLATE_NAME FROM phpapps.templates t LEFT JOIN phpapps.scripts s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = \'281\'',3,1,1,'2020-04-26 11:07:17','2020-04-26 11:07:17'),(1283,'SELECT *,t.ID, t.TEMPLATE_NAME FROM phpapps.templates t LEFT JOIN phpapps.scripts s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = \'281\'',3,1,1,'2020-04-26 11:09:48','2020-04-26 11:09:48'),(1284,'SELECT *,t.ID, t.TEMPLATE_NAME FROM phpapps.view_templates t LEFT JOIN phpapps.scripts s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = \'281\'',3,1,1,'2020-04-26 11:12:59','2020-04-26 11:12:59'),(1285,'select * from scripts where script_name like \'%run%\'',3,1,1,'2020-04-26 14:11:21','2020-04-26 14:11:21'),(1286,'select * from grids',3,1,1,'2020-04-26 16:02:31','2020-04-26 16:02:31'),(1287,'select * from grid_actions',3,1,1,'2020-04-26 16:07:00','2020-04-26 16:07:00'),(1288,'select * from view_grids',3,1,1,'2020-04-26 16:28:08','2020-04-26 16:28:08'),(1289,'select * from grid_actions',3,1,1,'2020-04-26 17:03:07','2020-04-26 17:03:07'),(1290,'select * from grid_actions',3,1,1,'2020-04-26 17:12:52','2020-04-26 17:12:52'),(1291,'select * from tables',3,1,1,'2020-04-26 17:41:50','2020-04-26 17:41:50'),(1292,'select * from view_tables',3,1,1,'2020-04-26 17:42:04','2020-04-26 17:42:04'),(1293,'select * from tables',3,1,1,'2020-04-26 17:42:11','2020-04-26 17:42:11'),(1294,'select * from grid_columns',3,1,1,'2020-04-26 17:46:13','2020-04-26 17:46:13'),(1295,'SELECT t.ID, t.TEMPLATE_NAME, t.ELEMENT_TYPE_ID, t.APP_NAME FROM phpapps.view_templates t LEFT JOIN phpapps.CUSTOM_ELEMENTS s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = \'33\'',1,1,1,'2020-04-27 11:56:18','2020-04-27 11:56:18'),(1296,'select * from phpapps.view_posible_display_object_elements',3,1,1,'2020-04-28 05:53:40','2020-04-28 05:53:40'),(1297,'SELECT ID, GRID_NAME, GRID_TITLE, GRID_TYPE, TABLE_ID, QUERY_ID, EDITABLE, FILTERABLE, PAGINABLE, EXPORTABLE, EDIT_FORM_ID, ROWS_ON_PAGE, ELEMENT_TEMPLATE_ID, EDIT_FORM_FILE_NAME, TABLE_NAME FROM phpapps.view_grids WHERE ID = \'8\'',3,1,1,'2020-04-28 10:55:03','2020-04-28 10:55:03'),(1298,'SELECT ID, GRID_NAME, GRID_TITLE, GRID_TYPE, TABLE_ID, QUERY_ID, EDITABLE, FILTERABLE, PAGINABLE, EXPORTABLE, EDIT_FORM_ID, ROWS_ON_PAGE, ELEMENT_TEMPLATE_ID, EDIT_FORM_FILE_NAME, TABLE_NAME FROM phpapps.view_grids',3,1,1,'2020-04-28 10:55:28','2020-04-28 10:55:28'),(1299,'select * from list_databases',3,1,1,'2020-04-28 11:05:22','2020-04-28 11:05:22'),(1300,'SELECT ID, GRID_NAME, GRID_TITLE, GRID_TYPE, TABLE_ID, QUERY_ID, EDITABLE, FILTERABLE, PAGINABLE, EXPORTABLE, EDIT_FORM_ID, ROWS_ON_PAGE, ELEMENT_TEMPLATE_ID, EDIT_FORM_FILE_NAME, TABLE_NAME FROM phpapps.view_grids WHERE ID = \'8\'',3,1,1,'2020-04-28 11:11:14','2020-04-28 11:11:14'),(1301,'SELECT ID, GRID_NAME, GRID_TITLE, GRID_TYPE, TABLE_ID, QUERY_ID, EDITABLE, FILTERABLE, PAGINABLE, EXPORTABLE, EDIT_FORM_ID, ROWS_ON_PAGE, ELEMENT_TEMPLATE_ID, EDIT_FORM_FILE_NAME, TABLE_NAME FROM phpapps.view_grids WHERE ID = \'9\'',3,1,1,'2020-04-28 11:21:26','2020-04-28 11:21:26'),(1302,'select * from queries',3,1,1,'2020-04-28 11:26:17','2020-04-28 11:26:17'),(1303,'SELECT ID, GRID_ID, NAME, LABEL, ACTION, ACTION_SCRIPT, POPUP_PAGE, DESCRIPTION, GRID_ACTION_ID FROM phpapps.grid_actions WHERE ID = \'1\'',3,1,1,'2020-04-28 13:43:36','2020-04-28 13:43:36'),(1304,'SELECT ID, GRID_NAME, GRID_TITLE, GRID_TYPE, TABLE_ID, QUERY_ID, EDITABLE, FILTERABLE, PAGINABLE, EXPORTABLE, SORTABLE, EDIT_FORM_ID, ROWS_ON_PAGE, ELEMENT_TEMPLATE_ID, EDIT_FORM_FILE_NAME, TABLE_NAME FROM phpapps.view_grids WHERE ID = \'1\'',3,1,1,'2020-04-28 13:59:08','2020-04-28 13:59:08'),(1305,'show create view phpapps.view_grids',3,1,1,'2020-04-28 13:59:36','2020-04-28 13:59:36'),(1306,'select * from grid_actions',3,1,1,'2020-04-28 14:03:30','2020-04-28 14:03:30'),(1307,'SELECT ID, GRID_NAME, GRID_TITLE, GRID_TYPE, TABLE_ID, QUERY_ID, EDITABLE, FILTERABLE, PAGINABLE, EXPORTABLE, SORTABLE, EDIT_FORM_ID, ROWS_ON_PAGE, ELEMENT_TEMPLATE_ID, EDIT_FORM_FILE_NAME, TABLE_NAME FROM phpapps.view_grids WHERE ID = \'8\'',3,1,1,'2020-04-28 14:04:38','2020-04-28 14:04:38'),(1308,'SELECT COLUMN_NAME, ALT_COLUMN_TEXT, LABEL, ACTION, ID FROM phpapps.view_grid_columns WHERE GRID_ID = \'8\' limit 0,20',3,1,1,'2020-04-28 14:07:00','2020-04-28 14:07:00'),(1309,'show create view view_grid_columns',3,1,1,'2020-04-28 14:08:03','2020-04-28 14:08:03'),(1310,'select `gc`.`ID` AS `ID`,`gc`.`GRID_ID` AS `GRID_ID`,`g`.`GRID_NAME` AS `GRID_NAME`,`gc`.`COLUMN_ID` AS `COLUMN_ID`,`td`.`COLUMN_NAME` AS `COLUMN_NAME`,`td`.`TABLE_ID` AS `TABLE_ID`,`gc`.`ALT_COLUMN_TEXT` AS `ALT_COLUMN_TEXT`,`gc`.`LABEL` AS `LABEL`,`gc`.`ACTION` AS `ACTION` from ((`grid_columns` `gc` left join `grids` `g` on(`gc`.`GRID_ID` = `g`.`ID`)) left join `table_details` `td` on(`gc`.`COLUMN_ID` = `td`.`ID`))',3,1,1,'2020-04-28 14:08:29','2020-04-28 14:08:29'),(1311,'select * from view_templates',1,1,1,'2020-04-28 18:10:38','2020-04-28 18:10:38'),(1312,'select * from view_templates',1,1,1,'2020-04-28 18:10:51','2020-04-28 18:10:51'),(1313,'select* from view_templates',3,1,1,'2020-04-28 18:11:23','2020-04-28 18:11:23'),(1314,'show create view view_templates',3,1,1,'2020-04-28 18:12:14','2020-04-28 18:12:14'),(1315,'show create view templates',3,1,1,'2020-04-28 18:14:36','2020-04-28 18:14:36'),(1316,'select * from view_templates',3,1,1,'2020-04-28 18:14:51','2020-04-28 18:14:51'),(1317,'show create view templates',3,1,1,'2020-04-28 18:19:24','2020-04-28 18:19:24'),(1318,'show create view view_templates',3,1,1,'2020-04-28 18:19:32','2020-04-28 18:19:32'),(1319,'select t.ID AS ID,t.TEMPLATE_NAME AS TEMPLATE_NAME,t.APP_ID AS APP_ID,\r\na.APP_NAME AS APP_NAME,t.DESCRIPTION AS DESCRIPTION,t.ELEMENT_TYPE_ID AS ELEMENT_TYPE_ID,\r\n(select ldet.VALUE from list_template_types ldet where t.ELEMENT_TYPE_ID = ldet.ID) AS ELEMENT_TYPE \r\nfrom (templates t left join applications a on(a.ID = t.APP_ID))',3,1,1,'2020-04-28 18:21:13','2020-04-28 18:21:13'),(1320,'select * from view_grids',3,1,1,'2020-04-28 18:24:44','2020-04-28 18:24:44'),(1321,'show create view view_grids',3,1,1,'2020-04-28 18:25:30','2020-04-28 18:25:30'),(1322,'select * from grids',3,1,1,'2020-04-28 18:28:54','2020-04-28 18:28:54'),(1323,'select * from templates',3,1,1,'2020-04-28 18:29:47','2020-04-28 18:29:47'),(1324,'select * from view_templates',3,1,1,'2020-04-28 18:29:53','2020-04-28 18:29:53'),(1325,'select * from view_grids',3,1,1,'2020-04-28 18:32:37','2020-04-28 18:32:37'),(1326,'show databases',1,1,1,'2020-04-29 08:36:07','2020-04-29 08:36:07'),(1327,'show databases',1,1,1,'2020-04-29 08:38:04','2020-04-29 08:38:04'),(1328,'show databases',1,1,1,'2020-04-29 08:38:33','2020-04-29 08:38:33'),(1329,'show databases',1,1,1,'2020-04-29 09:00:06','2020-04-29 09:00:06'),(1330,'show databases',1,1,1,'2020-04-29 09:00:07','2020-04-29 09:00:07'),(1331,'show databases',1,1,1,'2020-04-29 09:00:08','2020-04-29 09:00:08'),(1332,'show databases',1,1,1,'2020-04-29 09:04:40','2020-04-29 09:04:40'),(1333,'select * from view_tables',1,1,1,'2020-04-29 09:07:33','2020-04-29 09:07:33'),(1334,'select * from view_tables',3,1,1,'2020-04-29 09:07:42','2020-04-29 09:07:42'),(1335,'select * from view_tables',3,1,1,'2020-04-29 09:12:28','2020-04-29 09:12:28'),(1336,'show databases',1,1,1,'2020-04-29 09:12:33','2020-04-29 09:12:33'),(1337,'show databases',1,1,1,'2020-04-30 10:28:20','2020-04-30 10:28:20'),(1338,'show tables',7,1,1,'2020-05-01 05:44:14','2020-05-01 05:44:14'),(1339,'show tables',7,1,1,'2020-05-01 05:47:19','2020-05-01 05:47:19'),(1340,'show tables',7,1,1,'2020-05-01 05:47:22','2020-05-01 05:47:22'),(1341,'desc dual',7,1,1,'2020-05-01 05:47:37','2020-05-01 05:47:37'),(1342,'show tables',7,1,1,'2020-05-01 05:47:47','2020-05-01 05:47:47'),(1343,'show tables',7,1,1,'2020-05-01 05:48:25','2020-05-01 05:48:25'),(1344,'SELECT SCHEMA_NAME, MODULE_SCHEMA FROM view_modules WHERE ID = \'10\'',7,1,1,'2020-05-01 05:49:19','2020-05-01 05:49:19'),(1345,'SELECT SCHEMA_NAME, MODULE_SCHEMA FROM view_modules WHERE ID = \'10\'',7,1,1,'2020-05-01 05:49:20','2020-05-01 05:49:20'),(1346,'SELECT SCHEMA_NAME, MODULE_SCHEMA FROM view_modules',7,1,1,'2020-05-01 05:49:30','2020-05-01 05:49:30'),(1347,'SELECT SCHEMA_NAME, MODULE_SCHEMA FROM view_modules',7,1,1,'2020-05-01 05:49:32','2020-05-01 05:49:32'),(1348,'SELECT * FROM view_modules',7,1,1,'2020-05-01 05:49:40','2020-05-01 05:49:40'),(1349,'show create view view_modules',7,1,1,'2020-05-01 05:50:08','2020-05-01 05:50:08'),(1350,'show create view view_modules',7,1,1,'2020-05-01 05:50:10','2020-05-01 05:50:10'),(1351,'SELECT SCHEMA_NAME, MODULE_SCHEMA FROM phpapps.view_modules WHERE ID = \'10\'',7,1,1,'2020-05-01 05:53:33','2020-05-01 05:53:33'),(1352,'SELECT ID, SCRIPT_NAME FROM phpapps.scripts',7,1,1,'2020-05-01 07:04:56','2020-05-01 07:04:56'),(1353,'SELECT * FROM phpapps.view_scripts',7,1,1,'2020-05-01 07:05:07','2020-05-01 07:05:07'),(1354,'SELECT * FROM phpapps.table_details where table_id = 80',7,1,1,'2020-05-01 07:37:47','2020-05-01 07:37:47'),(1355,'SELECT * FROM phpapps.table_details where table_id = 80',7,1,1,'2020-05-01 07:38:49','2020-05-01 07:38:49'),(1356,'select * from view_menus',3,1,1,'2020-05-01 08:05:37','2020-05-01 08:05:37'),(1357,'select * from scripts where name like \'%menu%\'',3,1,1,'2020-05-01 08:19:19','2020-05-01 08:19:19'),(1358,'select * from scripts where script_name like \'%menu%\'',3,1,1,'2020-05-01 08:19:29','2020-05-01 08:19:29'),(1359,'SELECT ID,NAME,MENU_TITLE,MENU_TYPE,ORIENTATION,QUERY_BODY,QUERY_ID,TEMPLATE_ID FROM phpapps.view_menus WHERE ID = \'5\'',3,1,1,'2020-05-01 08:25:31','2020-05-01 08:25:31'),(1360,'show create view view_menus',3,1,1,'2020-05-01 08:25:51','2020-05-01 08:25:51'),(1361,'select \r\nm.TEMPLATE_ID AS TEMPLATE_ID,\r\nt.TEMPLATE_NAME,\r\nm.ID AS ID,m.NAME AS NAME,m.MENU_TITLE AS MENU_TITLE,\r\nm.DESCRIPTION AS DESCRIPTION,lmt.VALUE AS MENU_TYPE,lmt.ID AS LIST_MENU_TYPE_ID,\r\nlmo.VALUE AS ORIENTATION,lmo.ID AS LIST_MENU_ORIENTATION_ID,\r\nm.QUERY_ID AS QUERY_ID,q.QUERY_NAME AS QUERY_NAME,\r\nq.DESCRIPTION AS QUERY_DESCRIPTION,q.QUERY_BODY AS QUERY_BODY \r\nfrom (((menus m join list_menu_types lmt) join list_menu_orientation lmo) join queries q)\r\nleft join templates t on (m.template_id = t.id) \r\nwhere m.MENU_TYPE = lmt.ID and m.ORIENTATION = lmo.ID and m.QUERY_ID = q.ID',3,1,1,'2020-05-01 08:28:37','2020-05-01 08:28:37'),(1362,'select * from templates',3,1,1,'2020-05-01 08:28:56','2020-05-01 08:28:56'),(1363,'select * from templates',3,1,1,'2020-05-01 08:31:08','2020-05-01 08:31:08'),(1364,'select \r\nm.TEMPLATE_ID AS TEMPLATE_ID,\r\nt.TEMPLATE_NAME,\r\nm.ID AS ID,m.NAME AS NAME,m.MENU_TITLE AS MENU_TITLE,\r\nm.DESCRIPTION AS DESCRIPTION,lmt.VALUE AS MENU_TYPE,lmt.ID AS LIST_MENU_TYPE_ID,\r\nlmo.VALUE AS ORIENTATION,lmo.ID AS LIST_MENU_ORIENTATION_ID,\r\nm.QUERY_ID AS QUERY_ID,q.QUERY_NAME AS QUERY_NAME,\r\nq.DESCRIPTION AS QUERY_DESCRIPTION,q.QUERY_BODY AS QUERY_BODY \r\nfrom (((menus m join list_menu_types lmt) join list_menu_orientation lmo) join queries q)\r\nleft join templates t on (m.template_id = t.id) \r\nwhere m.MENU_TYPE = lmt.ID and m.ORIENTATION = lmo.ID and m.QUERY_ID = q.ID',3,1,1,'2020-05-01 08:31:12','2020-05-01 08:31:12'),(1365,'select \r\nm.TEMPLATE_ID AS TEMPLATE_ID,\r\nt.TEMPLATE_NAME,\r\nm.ID AS ID,m.NAME AS NAME,m.MENU_TITLE AS MENU_TITLE,\r\nm.DESCRIPTION AS DESCRIPTION,lmt.VALUE AS MENU_TYPE,lmt.ID AS LIST_MENU_TYPE_ID,\r\nlmo.VALUE AS ORIENTATION,lmo.ID AS LIST_MENU_ORIENTATION_ID,\r\nm.QUERY_ID AS QUERY_ID,q.QUERY_NAME AS QUERY_NAME,\r\nq.DESCRIPTION AS QUERY_DESCRIPTION,q.QUERY_BODY AS QUERY_BODY \r\nfrom (((menus m join list_menu_types lmt) join list_menu_orientation lmo) join queries q)\r\nleft join templates t on (m.template_id = t.id) \r\nwhere m.MENU_TYPE = lmt.ID and m.ORIENTATION = lmo.ID and m.QUERY_ID = q.ID',3,1,1,'2020-05-01 08:31:55','2020-05-01 08:31:55'),(1366,'select * from view_templates',3,1,1,'2020-05-01 08:32:20','2020-05-01 08:32:20'),(1367,'select \r\nm.TEMPLATE_ID AS TEMPLATE_ID,\r\nt.TEMPLATE_NAME,\r\nm.ID AS ID,m.NAME AS NAME,m.MENU_TITLE AS MENU_TITLE,\r\nm.DESCRIPTION AS DESCRIPTION,lmt.VALUE AS MENU_TYPE,lmt.ID AS LIST_MENU_TYPE_ID,\r\nlmo.VALUE AS ORIENTATION,lmo.ID AS LIST_MENU_ORIENTATION_ID,\r\nm.QUERY_ID AS QUERY_ID,q.QUERY_NAME AS QUERY_NAME,\r\nq.DESCRIPTION AS QUERY_DESCRIPTION,q.QUERY_BODY AS QUERY_BODY \r\nfrom (((menus m join list_menu_types lmt) join list_menu_orientation lmo) join queries q)\r\nleft join templates t on (m.template_id = t.id) \r\nwhere m.MENU_TYPE = lmt.ID and m.ORIENTATION = lmo.ID and m.QUERY_ID = q.ID',3,1,1,'2020-05-01 08:33:00','2020-05-01 08:33:00'),(1368,'select \r\nm.TEMPLATE_ID AS TEMPLATE_ID,\r\nt.TEMPLATE_NAME,\r\nt.APP_ID,\r\nt.APP_NAME,\r\n\r\nm.ID AS ID,m.NAME AS NAME,m.MENU_TITLE AS MENU_TITLE,\r\nm.DESCRIPTION AS DESCRIPTION,lmt.VALUE AS MENU_TYPE,lmt.ID AS LIST_MENU_TYPE_ID,\r\nlmo.VALUE AS ORIENTATION,lmo.ID AS LIST_MENU_ORIENTATION_ID,\r\nm.QUERY_ID AS QUERY_ID,q.QUERY_NAME AS QUERY_NAME,\r\nq.DESCRIPTION AS QUERY_DESCRIPTION,q.QUERY_BODY AS QUERY_BODY \r\nfrom (((menus m join list_menu_types lmt) join list_menu_orientation lmo) join queries q)\r\nleft join templates t on (m.template_id = t.id) \r\nwhere m.MENU_TYPE = lmt.ID and m.ORIENTATION = lmo.ID and m.QUERY_ID = q.ID',3,1,1,'2020-05-01 08:33:10','2020-05-01 08:33:10'),(1369,'select \r\nm.TEMPLATE_ID AS TEMPLATE_ID,\r\nt.TEMPLATE_NAME,\r\nt.APP_ID,\r\nt.APP_NAME,\r\n\r\nm.ID AS ID,m.NAME AS NAME,m.MENU_TITLE AS MENU_TITLE,\r\nm.DESCRIPTION AS DESCRIPTION,lmt.VALUE AS MENU_TYPE,lmt.ID AS LIST_MENU_TYPE_ID,\r\nlmo.VALUE AS ORIENTATION,lmo.ID AS LIST_MENU_ORIENTATION_ID,\r\nm.QUERY_ID AS QUERY_ID,q.QUERY_NAME AS QUERY_NAME,\r\nq.DESCRIPTION AS QUERY_DESCRIPTION,q.QUERY_BODY AS QUERY_BODY \r\nfrom (((menus m join list_menu_types lmt) join list_menu_orientation lmo) join queries q)\r\nleft join view_templates t on (m.template_id = t.id) \r\nwhere m.MENU_TYPE = lmt.ID and m.ORIENTATION = lmo.ID and m.QUERY_ID = q.ID',3,1,1,'2020-05-01 08:33:27','2020-05-01 08:33:27'),(1370,'select * from view_form_details',3,1,1,'2020-05-01 08:39:54','2020-05-01 08:39:54'),(1371,'select * from form_details',3,1,1,'2020-05-01 08:39:59','2020-05-01 08:39:59'),(1372,'select * from form_details where id = \'240\'',3,1,1,'2020-05-01 08:40:07','2020-05-01 08:40:07'),(1373,'select * from form_details where form_id = \'240\'',3,1,1,'2020-05-01 08:40:39','2020-05-01 08:40:39'),(1374,'select * from form_details where form_id = \'240\'',3,1,1,'2020-05-01 08:41:14','2020-05-01 08:41:14'),(1375,'select * from form_details where form_id = \'240\'',3,1,1,'2020-05-01 08:42:33','2020-05-01 08:42:33'),(1376,'select l.ID AS LAYOUT_ID, l.NAME,l.APP_NAME from view_layouts l left join scripts s on (s.layout_id = l.id) where s.id = \'240\'',3,1,1,'2020-05-01 08:47:25','2020-05-01 08:47:25'),(1377,'select * from menu_items',3,1,1,'2020-05-01 08:52:30','2020-05-01 08:52:30'),(1378,'select * from view_menu_items',3,1,1,'2020-05-01 08:52:36','2020-05-01 08:52:36'),(1379,'select l.ID AS LAYOUT_ID, l.NAME,l.APP_NAME from view_layouts l left join scripts s on (s.layout_id = l.id) where s.id = \'299\'',3,1,1,'2020-05-01 08:55:15','2020-05-01 08:55:15'),(1380,'select * from view_custom_elements',3,1,1,'2020-05-01 08:59:16','2020-05-01 08:59:16'),(1381,'select * from custom_elements',3,1,1,'2020-05-01 08:59:22','2020-05-01 08:59:22'),(1382,'SELECT t.ID, t.TEMPLATE_NAME, t.ELEMENT_TYPE_ID, t.APP_NAME FROM phpapps.view_templates t LEFT JOIN phpapps.CUSTOM_ELEMENTS s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = \'38\'',3,1,1,'2020-05-01 09:00:53','2020-05-01 09:00:53'),(1383,'SELECT t.ID, t.TEMPLATE_NAME, t.ELEMENT_TYPE_ID, t.APP_NAME FROM phpapps.view_templates t LEFT JOIN phpapps.CUSTOM_ELEMENTS s ON (s.TEMPLATE_ID = t.ID) WHERE s.ID = \'38\'',3,1,1,'2020-05-01 09:02:34','2020-05-01 09:02:34'),(1384,'select * from scripts where script_name like \'%layouts%\'',3,1,1,'2020-05-01 09:46:56','2020-05-01 09:46:56'),(1385,'select * from view_scripts where script_name like \'%layouts%\'',3,1,1,'2020-05-01 09:47:26','2020-05-01 09:47:26'),(1386,'select l.ID AS LAYOUT_ID, l.NAME,l.APP_NAME from view_layouts l left join scripts s on (s.layout_id = l.id) where s.id = \'261\'',3,1,1,'2020-05-01 09:48:47','2020-05-01 09:48:47'),(1387,'select * from product_images',3,1,1,'2020-05-01 12:38:26','2020-05-01 12:38:26'),(1388,'select * from product_images',7,1,1,'2020-05-01 12:38:37','2020-05-01 12:38:37');
/*!40000 ALTER TABLE `sql_console_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_console_saves`
--

DROP TABLE IF EXISTS `sql_console_saves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_console_saves` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `QUERY` text NOT NULL,
  `DESCR` varchar(255) DEFAULT NULL,
  `DATAQ` datetime DEFAULT NULL,
  `DATABASE_ID` bigint(20) NOT NULL DEFAULT 3,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_console_saves`
--

LOCK TABLES `sql_console_saves` WRITE;
/*!40000 ALTER TABLE `sql_console_saves` DISABLE KEYS */;
INSERT INTO `sql_console_saves` VALUES (1,'select CONCAT(\'$MYSQL_COLUMN_TYPES[\',ID,\']=\\\"\',VALUE,\'\\\";\') AS MYSQL_COLUMN_TYPES_ARRAY from  list_mysql_column_types','MYSQL_COLUMN_TYPES_ARRAY','2015-07-29 10:36:48',3),(2,'select CONCAT(\'$MYSQL_INDEX_TYPES[\',ID,\']=\\\"\',VALUE,\'\\\";\') AS MYSQL_INDEX_TYPES_ARRAY from  list_index_types','MYSQL_INDEX_TYPES_ARRAY','2015-07-29 10:39:49',3),(3,'create view view_permissions as\r\nselect \r\n	p.ID,\r\n 	pn.VALUE AS PERMISSION_NAME,\r\n        pn.ID AS PERMISSION_NAME_ID,\r\n 	p.DESCRIPTION,\r\n 	pt.VALUE AS PERMISSION_TYPE,\r\n        pt.ID AS PERMISSION_TYPE_ID,\r\n 	ot.VALUE AS OBJECT_TYPE,\r\n        ot.ID AS OBJECT_TYPE_ID,\r\n     case ot.VALUE\r\n      when \'table\' then (SELECT TABLE_NAME FROM tables WHERE ID = p.OBJECT_ID)\r\n      when \'view\' then (SELECT VIEW_NAME FROM views WHERE ID = p.OBJECT_ID)\r\n      when \'form\' then (SELECT FORM_NAME FROM forms WHERE ID = p.OBJECT_ID)\r\n      when \'script\' then (SELECT SCRIPT_NAME FROM scripts WHERE ID = p.OBJECT_ID)\r\nend  AS OBJECT_NAME,\r\np.OBJECT_ID 	 \r\n\r\nfrom permissions p , list_permission_types pt, list_object_types ot, list_permission_names pn \r\nwhere p.PERMISSION_TYPE = pt.ID and p.OBJECT_TYPE = ot.ID and p.PERMISSION_NAME = pn.ID','view_permissions','2015-08-12 09:24:56',3),(4,'show tables','show tables','2016-04-05 15:03:53',3),(6,'create view view_table_details as select d.ID,\r\nd.TABLE_ID,\r\nt.TABLE_NAME,\r\nd.COLUMN_NAME,\r\nd.COLUMN_TYPE_ID,\r\n(SELECT VALUE FROM list_mysql_column_types WHERE ID = d.COLUMN_TYPE_ID) AS COLUMN_TYPE_LABEl,\r\nd.COLUMN_SIZE,\r\nd.COLUMN_DEFAULT_VALUE,\r\nd.FOREIGN_KEY_SCHEMA_ID,\r\n(SELECT VALUE FROM list_databases WHERE ID = d.FOREIGN_KEY_SCHEMA_ID) AS FOREIGN_KEY_SCHEMA_LABEl,\r\nd.FOREIGN_KEY_TABLE_ID,\r\n(SELECT TABLE_NAME FROM tables WHERE ID = d.FOREIGN_KEY_TABLE_ID) AS FOREIGN_KEY_TABLE_LABEl,\r\nd.FOREIGN_KEY_COLUMN_ID,\r\n(SELECT COLUMN_NAME FROM table_details WHERE ID = d.FOREIGN_KEY_COLUMN_ID) AS FOREIGN_KEY_COLUMN_LABEL,\r\nd.COLUMN_INDEX_TYPE_ID,\r\n(SELECT VALUE FROM list_index_types WHERE ID = d.COLUMN_INDEX_TYPE_ID) AS COLUMN_INDEX_TYPE_LABEL,\r\nd.DESCRIPTION,\r\nd.MODIFY_UID,\r\n(SELECT USERNAME FROM users WHERE ID = d.MODIFY_UID) AS MODIFIED_BY,\r\nd.CREATE_UID,\r\n(SELECT USERNAME FROM users WHERE ID = d.CREATE_UID) AS CREATED_BY,\r\nd.MODIFY_DATE,\r\nd.CREATE_DATE\r\n\r\nfrom  table_details d left join tables t on (d.table_id = t.id)','view_table_details','2016-09-06 11:20:15',3),(7,'show tables','show tables','2016-09-30 14:37:16',2),(8,'show tables','show tables','2016-09-30 14:39:22',1),(9,'select * from  sql_console_saves','sql_console_saves','2016-09-30 14:39:53',3);
/*!40000 ALTER TABLE `sql_console_saves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sql_sintax`
--

DROP TABLE IF EXISTS `sql_sintax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sql_sintax` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DBMS_TYPE_ID` bigint(20) NOT NULL DEFAULT 0,
  `SINTAX_TYPE_ID` bigint(20) NOT NULL DEFAULT 0,
  `DEF_TPL` text NOT NULL,
  `DESCRIPTION` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `sql_sintax_DBMS_TYPE_ID_fk` (`DBMS_TYPE_ID`),
  KEY `sql_sintax_SINTAX_TYPE_ID_fk` (`SINTAX_TYPE_ID`),
  CONSTRAINT `sql_sintax_DBMS_TYPE_ID_fk` FOREIGN KEY (`DBMS_TYPE_ID`) REFERENCES `list_dbms_types` (`ID`),
  CONSTRAINT `sql_sintax_SINTAX_TYPE_ID_fk` FOREIGN KEY (`SINTAX_TYPE_ID`) REFERENCES `list_sql_sintax_types` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_sintax`
--

LOCK TABLES `sql_sintax` WRITE;
/*!40000 ALTER TABLE `sql_sintax` DISABLE KEYS */;
INSERT INTO `sql_sintax` VALUES (1,1,1,'CREATE TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} (\r\n    {section name=cols loop=$TABLE_OBJ->columns}\r\n        {$TABLE_OBJ->columns[cols]->getColumnDef()}\r\n    {/section}\r\n)ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE = utf8_bin;',''),(2,1,2,'ALTER TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} MODIFY COLUMN {$TABLE_OBJ->CURRENT_COLUMN->getColumnDef()}  AUTO_INCREMENT PRIMARY KEY',''),(3,1,3,'DROP TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME}',''),(4,1,4,'ALTER TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} ADD COLUMN {$TABLE_OBJ->CURRENT_COLUMN->getColumnDef()} AFTER {$TABLE_OBJ->ADD_COL_AFTER}',''),(5,1,5,'ALTER TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} RENAME {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->NEW_TABLE_NAME}',''),(6,1,6,'ALTER TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} DROP COLUMN {$TABLE_OBJ->CURRENT_COLUMN->getColumnName()}',''),(7,1,7,'ALTER TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} ADD {$TABLE_OBJ->CURRENT_FK->getFKDef()}',''),(8,1,8,'ALTER TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} DROP FOREIGN KEY {$TABLE_OBJ->CURRENT_FK->getFKName()}',''),(10,1,9,'CONSTRAINT {$FK_OBJ->FK_NAME} FOREIGN KEY\r\n    ({$FK_OBJ->COLUMN_NAME})\r\n    REFERENCES {$FK_OBJ->FK_SCHEMA_NAME}.{$FK_OBJ->FK_TABLE_NAME} ({$FK_OBJ->FK_COLUMN_NAME})\r\n{if $FK_OBJ->ON_DELETE_OPT != \\\"\\\"}\r\n    ON DELETE {$FK_OBJ->ON_DELETE_OPT}\r\n{/if}\r\n{if $FK_OBJ->ON_UPDATE_OPT != \\\"\\\"}\r\n    ON UPDATE {$FK_OBJ->ON_UPDATE_OPT}\r\n{/if}',''),(11,1,10,'ALTER TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} DROP PRIMARY KEY',''),(12,1,11,'ALTER TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} CHANGE COLUMN {$TABLE_OBJ->OLD_COLUMN_NAME} {$TABLE_OBJ->CURRENT_COLUMN->getColumnDef()}',''),(13,1,12,'ALTER TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} DROP INDEX {$TABLE_OBJ->CURRENT_IDX->getIndexName()}',''),(14,1,13,'ALTER TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} ADD {$TABLE_OBJ->CURRENT_IDX->getIdxDef()}',''),(15,1,14,'{$IDX_OBJ->INDEX_TYPE} {$IDX_OBJ->INDEX_NAME} (\r\n{foreach from=$IDX_OBJ->columns item=col name=cols }\r\n{$col}{if !$smarty.foreach.cols.last},{/if}\r\n{/foreach}\r\n)','');
/*!40000 ALTER TABLE `sql_sintax` ENABLE KEYS */;
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
  `COLUMN_TYPE_ID` bigint(20) NOT NULL DEFAULT 0,
  `UNSIGN` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `COLUMN_SIZE` varchar(255) DEFAULT NULL,
  `ACCEPT_NULL` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `COLUMN_DEFAULT_VALUE` varchar(255) NOT NULL DEFAULT '',
  `AUTOINCREMENT` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `ORD` smallint(5) unsigned NOT NULL DEFAULT 0,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `TABLE_ID` (`TABLE_ID`),
  KEY `MODIFY_UID` (`MODIFY_UID`),
  KEY `CREATE_UID` (`CREATE_UID`),
  KEY `table_details_ibfk_1` (`COLUMN_TYPE_ID`),
  CONSTRAINT `table_details_ibfk_1` FOREIGN KEY (`COLUMN_TYPE_ID`) REFERENCES `list_mysql_column_types` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `table_details_ibfk_2` FOREIGN KEY (`TABLE_ID`) REFERENCES `tables` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `table_details_ibfk_7` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `table_details_ibfk_8` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1309 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_details`
--

LOCK TABLES `table_details` WRITE;
/*!40000 ALTER TABLE `table_details` DISABLE KEYS */;
INSERT INTO `table_details` VALUES (72,279,'ID',5,0,'20',0,'',0,'',0,1,1,'2016-10-03 10:21:21','2016-10-03 10:21:21'),(73,279,'TABLE_ID',5,0,'20',0,'',0,'',1,1,1,'2016-10-03 10:22:16','2016-10-03 10:22:16'),(74,279,'INDEX_NAME',7,0,'255',0,'',0,'',2,1,1,'2016-10-03 10:22:46','2016-10-03 10:22:46'),(75,279,'DESCRIPTION',8,0,'0',1,'',0,'',5,1,1,'2016-10-03 10:30:22','2016-10-03 10:23:12'),(76,279,'INDEX_COLUMNS',7,0,'255',0,'ID',0,'',4,1,1,'2016-10-03 13:59:35','2016-10-03 10:27:53'),(77,279,'INDEX_TYPE_ID',5,0,'20',0,'',0,'',3,1,1,'2016-10-03 11:50:18','2016-10-03 10:30:22'),(79,280,'ID',5,0,'20',0,'',0,'',0,1,1,'2016-10-07 07:59:53','2016-10-07 07:59:53'),(80,280,'QUERY',8,0,'0',1,'',0,'',1,1,1,'2016-10-07 08:02:45','2016-10-07 08:02:45'),(81,280,'RUN_SCHEMA',5,0,'20',0,'',0,'',2,1,1,'2016-10-07 08:04:08','2016-10-07 08:04:08'),(82,281,'ID',5,0,'20',0,'',0,'',0,1,1,'2016-10-11 08:55:57','2016-10-11 08:55:57'),(83,281,'MODULE_ID',5,0,'20',0,'',0,'',1,1,1,'2016-10-11 08:56:40','2016-10-11 08:56:40'),(84,281,'QUERY_NAME',7,0,'255',0,'',0,'',2,1,1,'2019-10-18 20:48:12','2016-10-11 09:17:02'),(86,281,'DESCRIPTION',8,0,'0',1,'',0,'',4,1,1,'2016-11-07 09:37:42','2016-10-11 09:26:28'),(87,281,'QUERY_BODY',8,0,'0',0,'',0,'',3,1,1,'2016-11-07 09:37:42','2016-11-07 09:37:42'),(88,284,'ID',5,0,'20',0,'',0,'',0,1,1,'2017-02-21 12:13:35','2017-02-21 12:13:35'),(89,284,'NO',5,0,'10',0,'0',0,'',1,1,1,'2017-02-21 12:19:22','2017-02-21 12:17:48'),(90,284,'QUESTION',8,0,'255',0,'',0,'',3,1,1,'2017-02-23 08:24:02','2017-02-21 12:19:10'),(91,284,'ANSWER_1',8,0,'255',0,'',0,'',4,1,1,'2017-02-23 08:24:02','2017-02-21 12:20:05'),(92,284,'ANSWER_2',8,0,'255',0,'',0,'',7,1,1,'2017-02-23 08:24:02','2017-02-21 12:21:11'),(93,284,'ANSWER_3',8,0,'255',0,'',0,'',10,1,1,'2017-02-23 08:24:02','2017-02-21 12:21:30'),(94,284,'IMAGE_1',7,0,'255',0,'',0,'',6,1,1,'2017-02-23 08:24:02','2017-02-21 12:29:14'),(95,284,'IMAGE_2',7,0,'255',0,'',0,'',9,1,1,'2017-02-23 08:24:02','2017-02-21 12:32:13'),(96,284,'IMAGE_3',7,0,'255',0,'',0,'',12,1,1,'2017-02-23 08:24:02','2017-02-21 12:32:32'),(97,284,'CORRECT_1',5,0,'1',0,'',0,'',5,1,1,'2017-02-23 08:24:02','2017-02-21 13:13:14'),(98,284,'CORRECT_2',5,0,'1',0,'',0,'',8,1,1,'2017-02-23 08:24:02','2017-02-21 13:13:27'),(99,284,'CORRECT_3',5,0,'1',0,'',0,'',11,1,1,'2017-02-23 08:24:02','2017-02-21 13:13:43'),(100,287,'ID',5,0,'20',0,'',0,'',0,1,1,'2017-02-23 07:34:48','2017-02-23 07:34:48'),(101,287,'NAME',7,0,'255',0,'',0,'',2,1,1,'2017-02-23 07:38:11','2017-02-23 07:36:15'),(102,287,'CATEG_TYPE',5,0,'1',0,'',0,'',1,1,1,'2017-02-23 07:38:34','2017-02-23 07:38:11'),(103,284,'CATEG_ID',5,0,'20',0,'',0,'',2,1,1,'2017-02-23 08:24:02','2017-02-23 08:24:01'),(104,284,'ANSWER_4',8,0,'0',0,'',0,'',13,1,1,'2017-02-27 07:42:42','2017-02-27 07:42:42'),(105,284,'CORRECT_4',5,0,'1',0,'',0,'',14,1,1,'2017-02-27 07:43:29','2017-02-27 07:43:29'),(106,284,'IMAGE_4',7,0,'255',0,'',0,'',15,1,1,'2017-02-27 07:44:01','2017-02-27 07:44:01'),(107,292,'ID',5,0,'20',0,'',0,'',0,1,1,'2017-07-09 11:27:22','2017-07-09 11:27:22'),(108,292,'NAME',7,0,'255',0,'\\\'\\\'',0,'',1,1,1,'2017-07-09 11:29:41','2017-07-09 11:29:41'),(109,292,'BODY',8,0,'0',0,'',0,'',8,1,1,'2017-09-25 09:30:26','2017-07-09 11:30:46'),(110,292,'CATEG_ID',5,0,'20',0,'0',0,'',9,1,1,'2017-09-25 09:30:26','2017-07-09 11:34:15'),(111,292,'ARTICLE_DATE',9,0,'0',0,'',0,'aa',7,1,1,'2017-09-25 09:30:26','2017-07-09 12:01:58'),(112,294,'ID',5,0,'20',0,'',0,'',0,1,1,'2017-07-09 12:05:33','2017-07-09 12:05:33'),(113,294,'USERNAME',7,0,'255',0,'\\\'\\\'',0,'',1,1,1,'2017-07-09 12:06:21','2017-07-09 12:06:21'),(114,294,'PASSWORD',7,0,'255',0,'\\\'\\\'',0,'',2,1,1,'2017-07-09 12:06:57','2017-07-09 12:06:57'),(115,294,'EMAIL',7,0,'255',0,'\\\'\\\'',0,'',3,1,1,'2017-07-09 12:08:34','2017-07-09 12:08:34'),(116,294,'USER_TYPE',5,0,'20',0,'4',0,'',4,1,1,'2017-07-09 12:23:05','2017-07-09 12:17:51'),(117,294,'JOIN_DATE',9,0,'0',0,'',0,'',5,1,1,'2017-07-09 12:22:50','2017-07-09 12:22:50'),(118,292,'USER_ID',5,0,'20',0,'0',0,'',6,1,1,'2017-09-25 09:30:26','2017-08-06 11:09:24'),(122,292,'IMAGE',7,0,'255',0,'',0,'',5,1,1,'2017-09-25 09:30:26','2017-09-25 08:46:19'),(124,292,'ARTICLE_TAGS',8,0,'0',0,'',0,'',3,1,1,'2017-09-25 09:30:26','2017-09-25 09:30:26'),(125,300,'ID',5,0,'20',0,'',0,'',0,1,1,'2017-09-28 06:53:01','2017-09-28 06:53:01'),(126,300,'NAME',7,0,'255',0,'',0,'',1,1,1,'2017-09-28 06:54:10','2017-09-28 06:54:10'),(127,300,'DESCRIPTION',8,0,'0',0,'',0,'',4,1,1,'2020-04-05 08:50:33','2017-09-28 07:06:00'),(128,301,'ID',5,0,'20',0,'',0,'',0,1,1,'2017-10-02 11:58:05','2017-10-02 11:58:05'),(129,301,'PID',5,1,'20',0,'0',0,'',1,1,1,'2017-10-02 11:59:08','2017-10-02 11:59:08'),(130,301,'NAME',7,0,'255',0,'\\\'\\\'',0,'',2,1,1,'2017-10-02 12:01:06','2017-10-02 12:01:06'),(131,301,'DESCRIPTION',8,0,'0',0,'',0,'',3,1,1,'2017-10-02 12:02:17','2017-10-02 12:02:17'),(134,302,'ID',5,0,'20',0,'',0,'',0,1,1,'2017-10-02 12:34:22','2017-10-02 12:34:22'),(135,302,'SUBJECT',7,0,'255',0,'',0,'',1,1,1,'2017-10-02 12:36:28','2017-10-02 12:36:28'),(136,302,'TOPIC_DATE',9,0,'0',0,'',0,'',3,1,1,'2017-10-02 13:12:17','2017-10-02 12:48:24'),(137,302,'CAT_ID',5,0,'20',0,'0',0,'',4,1,1,'2017-10-02 13:12:17','2017-10-02 12:49:07'),(138,302,'USER_ID',5,0,'20',0,'0',0,'',5,1,1,'2017-10-02 13:12:17','2017-10-02 12:50:44'),(139,304,'ID',5,0,'20',0,'',0,'',0,1,1,'2017-10-02 13:00:41','2017-10-02 13:00:41'),(140,304,'POST_DATE',9,0,'0',0,'',0,'',1,1,1,'2017-10-02 13:01:57','2017-10-02 13:01:57'),(141,304,'TOPIC_ID',5,0,'20',0,'',0,'',2,1,1,'2017-10-02 13:02:32','2017-10-02 13:02:32'),(142,304,'USER_ID',5,0,'20',0,'',0,'',3,1,1,'2017-10-02 13:03:02','2017-10-02 13:03:02'),(143,304,'CONTENT',8,0,'0',0,'',0,'',7,1,1,'2017-10-02 13:03:36','2017-10-02 13:03:36'),(144,302,'DESCRIPTION',8,0,'0',0,'',0,'',2,1,1,'2017-10-02 13:12:18','2017-10-02 13:12:17'),(145,305,'ID',5,0,'20',0,'',0,'',0,1,1,'2017-10-11 08:23:19','2017-10-11 08:23:19'),(146,305,'NAME',7,0,'255',0,'',0,'',2,1,1,'2017-10-11 08:25:58','2017-10-11 08:24:54'),(147,305,'EMAIL',7,0,'255',0,'',0,'',3,1,1,'2017-10-11 08:25:58','2017-10-11 08:25:17'),(148,305,'SUBJECT',7,0,'255',0,'',0,'',1,1,1,'2017-10-11 08:25:58','2017-10-11 08:25:58'),(149,305,'MESSAGE',8,0,'0',0,'',0,'',4,1,1,'2017-10-11 08:27:01','2017-10-11 08:26:37'),(150,305,'DATA',9,0,'0',0,'',0,'',5,1,1,'2017-10-11 08:27:38','2017-10-11 08:27:38'),(151,307,'ID',5,0,'20',0,'',0,'',0,1,1,'2018-03-30 05:06:48','2018-03-30 05:06:48'),(152,308,'ID',5,0,'20',0,'',0,'',0,1,1,'2018-04-25 07:16:50','2018-04-25 07:16:50'),(153,308,'nume',7,0,'255',0,'adada',0,'dadsa',1,1,1,'2018-04-25 07:19:55','2018-04-25 07:19:55'),(155,312,'ID',5,0,'20',0,'',0,'',0,1,1,'2019-08-25 07:15:49','2019-08-25 07:15:49'),(156,312,'test',7,0,'23',1,'aa',0,'aaaa',2,1,1,'2019-08-25 07:37:15','2019-08-25 07:36:31'),(157,312,'test2',7,0,'23',0,'aa',0,'rrr',1,1,1,'2019-08-25 07:37:15','2019-08-25 07:37:15'),(173,313,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-19 08:01:37','2019-10-19 08:01:37'),(174,313,'NUME',7,0,'255',1,'',0,'',2,1,1,'2019-10-19 08:01:37','2019-10-19 08:01:37'),(220,224,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-19 08:12:44','2019-10-19 08:12:44'),(221,224,'DBMS_TYPE_ID',5,0,'20',0,'0',0,'',2,1,1,'2019-10-19 08:12:44','2019-10-19 08:12:44'),(222,224,'SINTAX_TYPE_ID',5,0,'20',0,'0',0,'',3,1,1,'2019-10-19 08:12:44','2019-10-19 08:12:44'),(223,224,'DEF_TPL',8,0,'',0,'',0,'',4,1,1,'2019-10-19 08:12:44','2019-10-19 08:12:44'),(224,224,'DESCRIPTION',8,0,'',0,'',0,'',5,1,1,'2019-10-19 08:12:44','2019-10-19 08:12:44'),(279,129,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-19 08:15:48','2019-10-19 08:15:48'),(280,129,'MODULE_ID',5,0,'20',0,'0',0,'',2,1,1,'2019-10-19 08:15:48','2019-10-19 08:15:48'),(281,129,'VAR_NAME',7,0,'255',0,'',0,'',3,1,1,'2019-10-19 08:15:48','2019-10-19 08:15:48'),(282,129,'VAR_VALUE',7,0,'255',0,'',0,'',4,1,1,'2019-10-19 08:15:48','2019-10-19 08:15:48'),(283,129,'VAR_TYPE',5,0,'20',0,'0',0,'',5,1,1,'2019-10-19 08:15:48','2019-10-19 08:15:48'),(284,129,'DESCRIPTION',7,0,'255',0,'',0,'',6,1,1,'2019-10-19 08:15:48','2019-10-19 08:15:48'),(285,129,'MODIFY_UID',5,0,'20',0,'1',0,'',7,1,1,'2019-10-19 08:15:48','2019-10-19 08:15:48'),(286,129,'CREATE_UID',5,0,'20',0,'1',0,'',8,1,1,'2019-10-19 08:15:48','2019-10-19 08:15:48'),(287,129,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',9,1,1,'2019-10-19 08:15:48','2019-10-19 08:15:48'),(288,129,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',10,1,1,'2019-10-19 08:15:48','2019-10-19 08:15:48'),(309,89,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-19 08:18:09','2019-10-19 08:18:09'),(310,89,'PERMISSION_NAME',5,0,'20',0,'1',0,'',2,1,1,'2019-10-19 08:18:09','2019-10-19 08:18:09'),(311,89,'DESCRIPTION',7,0,'255',0,'',0,'',3,1,1,'2019-10-19 08:18:09','2019-10-19 08:18:09'),(312,89,'PERMISSION_TYPE',5,0,'20',0,'1',0,'',4,1,1,'2019-10-19 08:18:09','2019-10-19 08:18:09'),(313,89,'OBJECT_TYPE',5,0,'20',0,'1',0,'',5,1,1,'2019-10-19 08:18:09','2019-10-19 08:18:09'),(314,89,'OBJECT_ID',5,0,'20',0,'0',0,'',6,1,1,'2019-10-19 08:18:09','2019-10-19 08:18:09'),(315,89,'MODIFY_UID',5,0,'20',0,'1',0,'',7,1,1,'2019-10-19 08:18:09','2019-10-19 08:18:09'),(316,89,'CREATE_UID',5,0,'20',0,'1',0,'',8,1,1,'2019-10-19 08:18:09','2019-10-19 08:18:09'),(317,89,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',9,1,1,'2019-10-19 08:18:09','2019-10-19 08:18:09'),(318,89,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',10,1,1,'2019-10-19 08:18:09','2019-10-19 08:18:09'),(324,88,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-19 08:18:22','2019-10-19 08:18:22'),(325,88,'ROLE_NAME',7,0,'255',0,'',0,'',2,1,1,'2019-10-19 08:18:22','2019-10-19 08:18:22'),(326,88,'DESCRIPTION',7,0,'255',0,'',0,'',3,1,1,'2019-10-19 08:18:22','2019-10-19 08:18:22'),(327,88,'MODIFY_UID',5,0,'20',0,'1',0,'',4,1,1,'2019-10-19 08:18:22','2019-10-19 08:18:22'),(328,88,'CREATE_UID',5,0,'20',0,'1',0,'',5,1,1,'2019-10-19 08:18:22','2019-10-19 08:18:22'),(329,88,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',6,1,1,'2019-10-19 08:18:22','2019-10-19 08:18:22'),(330,88,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',7,1,1,'2019-10-19 08:18:22','2019-10-19 08:18:22'),(331,91,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-19 08:18:45','2019-10-19 08:18:45'),(332,91,'ROLE_ID',5,0,'20',0,'0',0,'',2,1,1,'2019-10-19 08:18:45','2019-10-19 08:18:45'),(333,91,'PERMISSION_ID',5,0,'20',0,'0',0,'',3,1,1,'2019-10-19 08:18:45','2019-10-19 08:18:45'),(334,91,'MODIFY_UID',5,0,'20',0,'1',0,'',4,1,1,'2019-10-19 08:18:45','2019-10-19 08:18:45'),(335,91,'CREATE_UID',5,0,'20',0,'1',0,'',5,1,1,'2019-10-19 08:18:45','2019-10-19 08:18:45'),(336,91,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',6,1,1,'2019-10-19 08:18:45','2019-10-19 08:18:45'),(337,91,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',7,1,1,'2019-10-19 08:18:45','2019-10-19 08:18:45'),(341,202,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-19 08:23:07','2019-10-19 08:23:07'),(342,202,'MODULE_ID',5,0,'20',0,'0',0,'',2,1,1,'2019-10-19 08:23:07','2019-10-19 08:23:07'),(343,202,'VIEW_NAME',7,0,'255',0,'',0,'',3,1,1,'2019-10-19 08:23:07','2019-10-19 08:23:07'),(344,202,'CREATE_VIEW_QUERY',8,0,'',1,'',0,'',4,1,1,'2019-10-19 08:23:07','2019-10-19 08:23:07'),(345,202,'DESCRIPTION',7,0,'255',0,'',0,'',5,1,1,'2019-10-19 08:23:07','2019-10-19 08:23:07'),(346,202,'MODIFY_UID',5,0,'20',0,'1',0,'',6,1,1,'2019-10-19 08:23:07','2019-10-19 08:23:07'),(347,202,'CREATE_UID',5,0,'20',0,'1',0,'',7,1,1,'2019-10-19 08:23:07','2019-10-19 08:23:07'),(348,202,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',8,1,1,'2019-10-19 08:23:07','2019-10-19 08:23:07'),(349,202,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',9,1,1,'2019-10-19 08:23:07','2019-10-19 08:23:07'),(371,298,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-19 09:36:15','2019-10-19 09:36:15'),(372,298,'FILE_PATH',7,0,'255',1,'',0,'',2,1,1,'2019-10-19 09:36:15','2019-10-19 09:36:15'),(373,298,'NUME',7,0,'255',1,'',0,'',3,1,1,'2019-10-19 09:36:15','2019-10-19 09:36:15'),(520,198,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(521,198,'TABLE_ID',5,0,'20',0,'',0,'',2,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(522,198,'COLUMN_NAME',7,0,'255',0,'',0,'',3,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(523,198,'COLUMN_TYPE_ID',5,0,'20',0,'0',0,'',4,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(524,198,'UNSIGN',1,0,'3',0,'0',0,'',5,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(525,198,'COLUMN_SIZE',7,0,'255',1,'',0,'',6,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(526,198,'ACCEPT_NULL',1,0,'3',0,'0',0,'',7,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(527,198,'COLUMN_DEFAULT_VALUE',7,0,'255',0,'',0,'',8,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(528,198,'AUTOINCREMENT',1,0,'3',0,'0',0,'',9,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(529,198,'DESCRIPTION',7,0,'255',0,'',0,'',10,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(530,198,'ORD',2,0,'5',0,'0',0,'',11,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(531,198,'MODIFY_UID',5,0,'20',0,'1',0,'',12,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(532,198,'CREATE_UID',5,0,'20',0,'1',0,'',13,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(533,198,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',14,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(534,198,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',15,1,1,'2019-10-24 09:43:07','2019-10-24 09:43:07'),(596,275,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(597,275,'test_unsign',5,0,'2',0,'0',0,'',2,1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(598,275,'MUMUSA',5,0,'20',1,'',0,'',3,1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(599,275,'NUME',8,0,'',1,'',0,'',4,1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(600,275,'VIEW_ID2',5,0,'20',1,'',0,'',5,1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(601,275,'GOGU',5,0,'15',1,'',0,'',6,1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(602,275,'test',11,0,'10,0',1,'',0,'',7,1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(603,318,'ID',5,0,'20',0,'',0,'',0,1,1,'2019-10-28 08:30:57','2019-10-28 08:30:57'),(604,318,'upload_file',7,0,'255',0,'',0,'',1,1,1,'2019-10-28 08:31:45','2019-10-28 08:31:45'),(620,222,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-28 10:54:16','2019-10-28 10:54:16'),(621,222,'COLUMN_TYPE_ID',5,0,'20',0,'',0,'',2,1,1,'2019-10-28 10:54:16','2019-10-28 10:54:16'),(622,222,'DEF_TPL',8,0,'',0,'',0,'',3,1,1,'2019-10-28 10:54:16','2019-10-28 10:54:16'),(623,222,'DESCRIPTION',8,0,'',0,'',0,'',4,1,1,'2019-10-28 10:54:16','2019-10-28 10:54:16'),(644,319,'ID',5,0,'20',0,'',0,'',0,1,1,'2019-10-28 12:02:35','2019-10-28 12:02:35'),(645,319,'PERSONAL_ID',5,0,'20',0,'',0,'',2,1,1,'2019-10-29 06:44:35','2019-10-28 12:03:54'),(646,319,'SALBAZA',5,0,'10',0,'',0,'',4,1,1,'2019-10-30 06:33:38','2019-10-28 12:21:41'),(647,319,'SP_VECHIME',6,0,'2',0,'',0,'Procent',5,1,1,'2019-10-30 06:33:38','2019-10-28 13:06:03'),(665,315,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-10-29 06:43:53','2019-10-29 06:43:53'),(666,315,'CNP',5,0,'13',0,'0',0,'',3,1,1,'2019-10-31 06:46:40','2019-10-29 06:43:53'),(667,315,'NUME',7,0,'255',1,'',0,'',4,1,1,'2019-10-31 06:46:40','2019-10-29 06:43:53'),(668,315,'SUBUNIT_ID',5,0,'20',1,'',0,'',5,1,1,'2019-10-31 06:46:40','2019-10-29 06:43:53'),(669,315,'DATA_START_CIM',9,0,'',0,'CURRENT_TIMESTAMP',0,'',7,1,1,'2019-10-31 06:46:40','2019-10-29 06:43:53'),(670,315,'DATA_STOP_CIM',9,0,'',0,'0000-00-00 00:00:00',0,'',8,1,1,'2019-10-31 06:46:40','2019-10-29 06:43:53'),(671,315,'DATA_START_LICENTA',9,0,'',0,'0000-00-00 00:00:00',0,'',9,1,1,'2019-10-31 06:46:40','2019-10-29 06:43:53'),(672,315,'DATA_STOP_LICENTA',9,0,'',0,'0000-00-00 00:00:00',0,'',10,1,1,'2019-10-31 06:46:40','2019-10-29 06:43:53'),(680,319,'CATEG_PERS_ID',5,0,'20',0,'',0,'',1,1,1,'2019-10-29 06:44:35','2019-10-29 06:44:35'),(681,321,'ID',5,0,'20',0,'',0,'',0,1,1,'2019-10-29 06:57:24','2019-10-29 06:57:24'),(682,321,'FUNCTIE',7,0,'255',0,'',0,'LABEL',2,1,1,'2019-10-29 07:33:35','2019-10-29 07:02:16'),(683,321,'COEF_SAL',6,0,'7,5',0,'',0,'',1,1,1,'2019-10-29 07:33:35','2019-10-29 07:33:35'),(684,321,'DATA_START',10,0,'',0,'',0,'',3,1,1,'2019-10-29 08:01:04','2019-10-29 08:01:04'),(685,321,'DATA_END',10,0,'',0,'',0,'',8,1,1,'2019-10-29 08:01:51','2019-10-29 08:01:51'),(686,322,'ID',5,0,'20',0,'',0,'',0,1,1,'2019-10-29 08:02:42','2019-10-29 08:02:42'),(687,322,'LOC_MUNCA',7,0,'255',0,'',0,'',2,1,1,'2019-10-29 08:11:14','2019-10-29 08:06:26'),(688,322,'SUBUNIT_ID',5,0,'20',0,'',0,'',1,1,1,'2019-10-29 08:11:14','2019-10-29 08:11:14'),(689,322,'TIP_LOC_MUNCA_ID',5,0,'20',0,'',0,'',3,1,1,'2019-10-29 08:14:44','2019-10-29 08:14:44'),(690,322,'DATA_START',10,0,'',0,'',0,'',5,1,1,'2019-10-29 08:53:03','2019-10-29 08:16:38'),(691,322,'DATA_END',10,0,'',0,'',0,'',9,1,1,'2019-10-29 08:53:03','2019-10-29 08:17:00'),(692,322,'CODLM',7,0,'255',0,'',0,'',4,1,1,'2019-10-29 08:53:04','2019-10-29 08:53:03'),(693,319,'ORACLE_PERSON_ID',5,0,'',0,'',0,'',3,1,1,'2019-10-30 06:33:38','2019-10-30 06:33:38'),(694,315,'ORACLE_PERSON_ID',5,0,'20',0,'',0,'',6,1,1,'2019-10-31 06:46:40','2019-10-30 06:34:24'),(695,315,'FOTOGRAFIE',7,0,'255',0,'',0,'',2,1,1,'2019-10-31 06:46:40','2019-10-31 06:46:40'),(698,324,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-11-09 10:58:06','2019-11-09 10:58:06'),(699,324,'THEME_NAME',7,0,'255',1,'',0,'',2,1,1,'2019-11-09 10:58:06','2019-11-09 10:58:06'),(701,324,'CSS_FILE',7,0,'255',0,'',0,'',3,1,1,'2019-11-09 10:59:05','2019-11-09 10:59:05'),(842,331,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-11-10 18:59:55','2019-11-10 18:59:55'),(843,331,'MENU_ID',5,0,'20',0,'1',0,'',3,1,1,'2019-11-10 18:59:55','2019-11-10 18:59:55'),(844,331,'PID',5,0,'20',1,'',0,'',2,1,1,'2019-11-10 18:59:55','2019-11-10 18:59:55'),(845,331,'ACTION',7,0,'255',0,'',0,'',4,1,1,'2020-04-17 09:42:51','2019-11-10 19:54:52'),(846,331,'LABEL',7,0,'255',0,'',0,'',5,1,1,'2019-11-10 19:58:13','2019-11-10 19:58:13'),(848,2,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(849,2,'USER_ID',5,0,'20',0,'',0,'',2,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(850,2,'APP_NAME',7,0,'20',0,'',0,'',3,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(851,2,'APP_TITLE',7,0,'255',0,'',0,'',4,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(852,2,'APP_SCHEMA',7,0,'20',0,'',0,'',5,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(853,2,'BASE_DIR',7,0,'20',0,'',0,'',6,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(854,2,'APPLICATION_TYPE_ID',5,0,'20',1,'',0,'',7,1,1,'2020-04-22 20:26:46','2019-11-19 10:20:03'),(855,2,'APP_DATE',10,0,'',0,'0000-00-00',0,'',8,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(856,2,'DESCRIPTION',7,0,'255',0,'',0,'',9,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(857,2,'MODIFY_UID',5,0,'20',0,'1',0,'',10,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(858,2,'CREATE_UID',5,0,'20',0,'1',0,'',11,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(859,2,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',12,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(860,2,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',13,1,1,'2019-11-19 10:20:03','2019-11-19 10:20:03'),(901,87,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(902,87,'USERNAME',7,0,'255',0,'',0,'',2,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(903,87,'PASSWORD',7,0,'255',0,'',0,'',3,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(904,87,'FIRSTNAME',7,0,'255',0,'',0,'',4,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(905,87,'LASTNAME',7,0,'255',0,'',0,'',5,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(906,87,'EMAIL',7,0,'255',0,'',0,'',6,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(907,87,'USER_TYPE',5,0,'20',0,'1',0,'',7,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(908,87,'DESCRIPTION',7,0,'255',0,'',0,'',8,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(909,87,'PROFILE_ID',5,0,'20',0,'0',0,'',9,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(910,87,'MODIFY_UID',5,0,'20',0,'1',0,'',10,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(911,87,'CREATE_UID',5,0,'20',0,'1',0,'',11,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(912,87,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',12,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(913,87,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',13,1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(916,3,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(917,3,'APP_ID',5,0,'20',0,'',0,'',2,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(918,3,'SCRIPT_ID',5,0,'20',0,'2',0,'',3,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(919,3,'MODULE_NAME',7,0,'20',0,'',0,'',4,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(920,3,'MODULE_TITLE',7,0,'255',0,'',0,'',5,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(921,3,'MODULE_DATE',10,0,'',0,'0000-00-00',0,'',6,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(922,3,'DESCRIPTION',7,0,'255',0,'',0,'',7,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(923,3,'MODIFY_UID',5,0,'20',0,'1',0,'',8,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(924,3,'CREATE_UID',5,0,'20',0,'1',0,'',9,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(925,3,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',10,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(926,3,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',11,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(932,83,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(933,83,'MODULE_ID',5,0,'20',0,'',0,'',2,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(934,83,'SCRIPT_NAME',7,0,'255',1,'',0,'',3,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(935,83,'TABLE_ID',5,0,'20',0,'0',0,'',4,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(936,83,'FORM_QUERY',7,0,'255',0,'',0,'',5,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(937,83,'FORM_PHP_DIR',7,0,'255',1,'',0,'',6,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(938,83,'FORM_TPL_DIR',7,0,'255',1,'',0,'',7,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(939,83,'WEB_TYPE_ID',5,0,'2',0,'1',0,'',8,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(940,83,'SCRIPT_TYPE_ID',5,0,'2',0,'1',0,'',9,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(941,83,'DESCRIPTION',7,0,'255',0,'',0,'',12,1,1,'2020-04-26 09:04:41','2019-11-20 11:58:41'),(942,83,'MODIFY_UID',5,0,'20',0,'1',0,'',13,1,1,'2020-04-26 09:04:41','2019-11-20 11:58:41'),(943,83,'CREATE_UID',5,0,'20',0,'1',0,'',14,1,1,'2020-04-26 09:04:41','2019-11-20 11:58:41'),(944,83,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',15,1,1,'2020-04-26 09:04:41','2019-11-20 11:58:41'),(945,83,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',16,1,1,'2020-04-26 09:04:41','2019-11-20 11:58:41'),(947,83,'LAYOUT_ID',5,0,'20',0,'1',0,'',10,1,1,'2019-11-20 12:04:14','2019-11-20 12:04:14'),(948,99,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(949,99,'USER_ID',5,0,'20',1,'',0,'',2,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(950,99,'SCRIPT_ID',5,0,'20',0,'0',0,'',3,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(951,99,'PROFILE_NAME',7,0,'255',0,'',0,'',4,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(952,99,'THEME_ID',5,0,'10',0,'1',0,'',5,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(953,99,'MODIFY_UID',5,0,'20',0,'1',0,'',6,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(954,99,'CREATE_UID',5,0,'20',0,'1',0,'',7,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(955,99,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',8,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(956,99,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',9,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(963,197,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(964,197,'ORIGIN_ID',5,0,'20',0,'0',0,'',2,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(965,197,'MODULE_ID',5,0,'20',0,'',0,'',3,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(966,197,'SCHEMA_ID',5,0,'20',0,'0',0,'',4,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(967,197,'TABLE_NAME',7,0,'255',0,'',0,'',5,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(968,197,'TABLE_TYPE',5,0,'20',1,'',0,'',6,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(969,197,'DESCRIPTION',7,0,'255',0,'',0,'',7,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(970,197,'MODIFY_UID',5,0,'20',0,'1',0,'',8,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(971,197,'CREATE_UID',5,0,'20',0,'1',0,'',9,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(972,197,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',10,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(973,197,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',11,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(979,276,'ID',5,0,'20',0,'',1,'',1,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(980,276,'COLUMN_ID',5,0,'20',1,'',0,'',2,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(981,276,'FK_NAME',7,0,'255',1,'',0,'',3,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(982,276,'FK_TABLE_ID',5,0,'20',1,'',0,'',4,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(983,276,'FK_COLUMN_ID',5,0,'20',1,'',0,'',5,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(984,276,'ON_UPDATE',5,0,'20',1,'',0,'',6,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(985,276,'ON_DELETE',5,0,'20',1,'',0,'',7,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(986,276,'DESCRIPTION',8,0,'',1,'',0,'',8,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(987,276,'MODIFY_UID',5,0,'20',0,'1',0,'',9,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(988,276,'CREATE_UID',5,0,'20',0,'1',0,'',10,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(989,276,'MODIFY_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',11,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(990,276,'CREATE_DATE',9,0,'',0,'CURRENT_TIMESTAMP',0,'',12,1,1,'2019-11-20 12:51:18','2019-11-20 12:51:18'),(996,300,'APP_ID',5,0,'20',0,'1',0,'',3,1,1,'2020-04-05 08:50:33','2020-04-05 08:50:33'),(1021,341,'ID',5,0,'20',0,'',1,'',1,1,1,'2020-04-17 09:36:34','2020-04-17 09:36:34'),(1022,341,'QUERY_ID',5,0,'20',0,'NULL',0,'',2,1,1,'2020-04-17 09:37:29','2020-04-17 09:36:34'),(1023,341,'PARAMETER_NAME',7,0,'255',1,'NULL',0,'',3,1,1,'2020-04-17 09:36:34','2020-04-17 09:36:34'),(1024,341,'PARAMETER_VALUE',7,0,'255',1,'NULL',0,'',4,1,1,'2020-04-17 09:36:34','2020-04-17 09:36:34'),(1033,341,'PARAMETER_TYPE',5,0,'20',0,'1',0,'',5,1,1,'2020-04-20 07:50:30','2020-04-20 07:50:30'),(1043,346,'ID',5,0,'20',0,'',0,'',0,1,1,'2020-04-20 09:15:32','2020-04-20 09:15:32'),(1044,346,'LAYOUT_ID',5,0,'20',0,'',0,'',1,1,1,'2020-04-20 09:20:06','2020-04-20 09:20:06'),(1045,346,'VARIABLE_NAME',7,0,'255',0,'',0,'',8,1,1,'2020-04-20 09:21:19','2020-04-20 09:21:19'),(1046,346,'VARIABLE_CONTENT',8,0,'',0,'',0,'',9,1,1,'2020-04-20 09:22:11','2020-04-20 09:22:11'),(1077,350,'ID',5,0,'20',0,'',1,'',1,1,1,'2020-04-22 06:00:30','2020-04-22 06:00:30'),(1078,350,'TEMPLATE_NAME',7,0,'255',1,'NULL',0,'',2,1,1,'2020-04-22 06:00:30','2020-04-22 06:00:30'),(1079,350,'APP_ID',5,0,'20',1,'NULL',0,'',5,1,1,'2020-04-22 20:18:02','2020-04-22 06:00:30'),(1080,350,'ELEMENT_TYPE_ID',5,0,'20',0,'',0,'',4,1,1,'2020-04-22 20:18:02','2020-04-22 06:01:45'),(1082,347,'ID',5,0,'20',0,'',1,'',1,1,1,'2020-04-22 06:22:24','2020-04-22 06:22:24'),(1083,347,'GRID_NAME',7,0,'255',1,'NULL',0,'',2,1,1,'2020-04-22 06:22:24','2020-04-22 06:22:24'),(1084,347,'GRID_TYPE',5,0,'20',0,'1',0,'',4,1,1,'2020-04-22 11:20:41','2020-04-22 06:22:24'),(1085,347,'TABLE_ID',5,0,'20',0,'0',0,'',5,1,1,'2020-04-22 11:20:41','2020-04-22 06:22:24'),(1086,347,'QUERY_ID',5,0,'20',0,'0',0,'',6,1,1,'2020-04-22 11:20:41','2020-04-22 06:22:24'),(1087,347,'EDITABLE',5,0,'20',0,'0',0,'',7,1,1,'2020-04-22 11:20:41','2020-04-22 06:22:24'),(1088,347,'FILTERABLE',5,0,'20',0,'0',0,'',8,1,1,'2020-04-22 11:20:41','2020-04-22 06:22:24'),(1089,347,'PAGINABLE',5,0,'20',0,'0',0,'',9,1,1,'2020-04-22 11:20:41','2020-04-22 06:22:24'),(1090,347,'EXPORTABLE',5,0,'20',0,'0',0,'',11,1,1,'2020-04-28 13:53:08','2020-04-22 06:22:24'),(1091,347,'EDIT_FORM_ID',5,0,'20',1,'NULL',0,'',12,1,1,'2020-04-28 13:53:08','2020-04-22 06:22:24'),(1092,347,'ROWS_ON_PAGE',5,0,'20',0,'10',0,'',13,1,1,'2020-04-28 13:53:08','2020-04-22 06:22:24'),(1093,347,'ELEMENT_TEMPLATE_ID',5,0,'20',1,'NULL',0,'',14,1,1,'2020-04-28 13:53:08','2020-04-22 06:22:24'),(1102,347,'GRID_TITLE',7,0,'255',0,'',0,'',3,1,1,'2020-04-22 11:20:41','2020-04-22 11:20:41'),(1117,343,'ID',5,0,'20',0,'',1,'',1,1,1,'2020-04-22 14:03:27','2020-04-22 14:03:27'),(1118,343,'DISPLAY_OBJECT_ID',5,0,'255',1,'NULL',0,'',2,1,1,'2020-04-22 14:03:27','2020-04-22 14:03:27'),(1119,343,'DISPLAY_OBJECT_TYPE_ID',5,0,'20',1,'NULL',0,'',3,1,1,'2020-04-22 14:03:27','2020-04-22 14:03:27'),(1120,343,'ELEMENT_ID',5,0,'20',1,'NULL',0,'',4,1,1,'2020-04-22 14:03:27','2020-04-22 14:03:27'),(1121,343,'ELEMENT_TYPE_ID',5,0,'20',1,'NULL',0,'',5,1,1,'2020-04-22 14:03:27','2020-04-22 14:03:27'),(1122,343,'TEMPLATE_VARIABLE_NAME',7,0,'255',1,'NULL',0,'',6,1,1,'2020-04-22 16:59:20','2020-04-22 14:03:27'),(1123,343,'DESCRIPTION',8,0,'',1,'NULL',0,'',7,1,1,'2020-04-22 14:03:27','2020-04-22 14:03:27'),(1125,350,'DESCRIPTION',8,0,'',0,'',0,'',3,1,1,'2020-04-22 20:18:02','2020-04-22 20:18:02'),(1126,359,'ID',5,0,'20',0,'',0,'',0,1,1,'2020-04-23 07:21:18','2020-04-23 07:21:18'),(1127,359,'NAME',7,0,'255',0,'',0,'',1,1,1,'2020-04-23 09:00:39','2020-04-23 08:59:43'),(1128,359,'APP_ID',5,0,'20',0,'',0,'',6,1,1,'2020-04-23 09:09:24','2020-04-23 09:01:05'),(1129,359,'PHP_CLASS_NAME',7,0,'255',0,'',0,'',4,1,1,'2020-04-23 09:09:24','2020-04-23 09:02:16'),(1130,359,'TEMPLATE_ID',5,0,'20',0,'',0,'',5,1,1,'2020-04-23 09:09:24','2020-04-23 09:03:05'),(1131,359,'DESCRIPTION',8,0,'',0,'',0,'',3,1,1,'2020-04-23 09:09:24','2020-04-23 09:09:24'),(1132,360,'ID',5,0,'20',0,'',0,'',0,1,1,'2020-04-26 07:01:09','2020-04-26 07:01:09'),(1133,360,'FORM_NAME',7,0,'255',0,'',0,'',1,1,1,'2020-04-26 07:01:49','2020-04-26 07:01:49'),(1134,83,'TEMPLATE_ID',5,0,'20',0,'0',0,'',11,1,1,'2020-04-26 11:00:46','2020-04-26 09:04:41'),(1180,347,'SORTABLE',5,0,'20',0,'',0,'',10,1,1,'2020-04-28 13:53:09','2020-04-28 13:53:08'),(1210,351,'ID',5,0,'20',0,'',1,'',1,1,1,'2020-04-28 14:21:11','2020-04-28 14:21:11'),(1211,351,'GRID_ID',5,0,'20',1,'NULL',0,'',2,1,1,'2020-04-28 14:21:11','2020-04-28 14:21:11'),(1212,351,'COLUMN_ID',5,0,'20',1,'NULL',0,'',3,1,1,'2020-04-28 14:21:11','2020-04-28 14:21:11'),(1213,351,'ALT_COLUMN_TEXT',7,0,'255',1,'NULL',0,'',4,1,1,'2020-04-28 14:21:11','2020-04-28 14:21:11'),(1214,351,'LABEL',7,0,'255',1,'NULL',0,'',5,1,1,'2020-04-28 14:21:11','2020-04-28 14:21:11'),(1215,351,'ACTION',7,0,'255',1,'NULL',0,'',6,1,1,'2020-04-28 14:21:11','2020-04-28 14:21:11'),(1217,363,'ID',5,0,'20',0,'',1,'',1,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(1218,363,'GRID_ID',5,0,'20',1,'NULL',0,'',2,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(1219,363,'NAME',7,0,'255',1,'NULL',0,'',3,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(1220,363,'LABEL',7,0,'255',1,'NULL',0,'',4,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(1221,363,'ACTION',7,0,'255',1,'NULL',0,'',5,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(1222,363,'ACTION_SCRIPT',7,0,'255',1,'NULL',0,'',6,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(1223,363,'POPUP_PAGE',5,0,'2',1,'NULL',0,'',7,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(1224,363,'GRID_ACTION_TYPE_ID',5,0,'20',1,'NULL',0,'',8,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(1225,363,'DESCRIPTION',8,0,'',1,'NULL',0,'',9,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(1232,365,'ID',5,0,'20',0,'',0,'',0,1,1,'2020-04-28 18:47:49','2020-04-28 18:47:49'),(1233,365,'DB_TYPE',5,0,'20',0,'',0,'',2,1,1,'2020-04-28 18:57:00','2020-04-28 18:50:19'),(1234,365,'DB_NAME',7,0,'255',0,'',0,'',3,1,1,'2020-04-28 18:57:00','2020-04-28 18:51:42'),(1235,365,'DB_HOST',7,0,'255',0,'',0,'',4,1,1,'2020-04-28 18:57:00','2020-04-28 18:52:03'),(1236,365,'DB_PORT',5,0,'20',0,'',0,'',5,1,1,'2020-04-28 18:57:00','2020-04-28 18:52:33'),(1237,365,'DB_USER_NAME',7,0,'255',0,'',0,'',6,1,1,'2020-04-28 18:57:00','2020-04-28 18:52:56'),(1238,365,'DB_PASSWORD',7,0,'255',0,'',0,'',7,1,1,'2020-04-28 18:57:00','2020-04-28 18:53:56'),(1239,365,'NAME',7,0,'255',0,'',0,'',1,1,1,'2020-04-28 18:57:00','2020-04-28 18:57:00'),(1257,377,'ID',5,0,'20',0,'',1,'',1,2,2,'2020-05-01 06:26:19','2020-05-01 06:26:19'),(1258,377,'CATEGORY_ID',5,0,'20',1,'NULL',0,'',2,2,2,'2020-05-01 06:26:19','2020-05-01 06:26:19'),(1259,377,'PRODUCT_TITLE',7,0,'255',1,'NULL',0,'',3,2,2,'2020-05-01 06:26:19','2020-05-01 06:26:19'),(1260,377,'DESCRIPTION',8,0,'',1,'NULL',0,'',4,2,2,'2020-05-01 06:26:19','2020-05-01 06:26:19'),(1261,377,'PRICE',11,0,'20,0',0,'0',0,'',5,2,2,'2020-05-01 06:26:19','2020-05-01 06:26:19'),(1264,377,'STOCK',6,0,'20',0,'0',0,'',7,1,1,'2020-05-01 06:49:08','2020-05-01 06:27:31'),(1265,377,'CURRENCY_ID',5,0,'20',0,'',0,'',6,1,1,'2020-05-01 06:49:08','2020-05-01 06:49:08'),(1266,379,'ID',5,0,'20',0,'',0,'',0,1,1,'2020-05-01 06:50:25','2020-05-01 06:50:25'),(1267,379,'PRODUCT_ID',5,0,'20',0,'',0,'',1,1,1,'2020-05-01 06:50:44','2020-05-01 06:50:44'),(1268,379,'IMG_FILE_NAME',7,0,'255',0,'',0,'',3,1,1,'2020-05-01 16:24:12','2020-05-01 06:52:36'),(1269,80,'ID',5,0,'20',0,'',1,'',1,2,2,'2020-05-01 07:51:19','2020-05-01 07:51:19'),(1270,80,'PID',5,0,'20',1,'0',0,'',2,2,2,'2020-05-01 07:56:30','2020-05-01 07:51:19'),(1271,80,'NAME',7,0,'20',0,'\'\'',0,'',3,2,2,'2020-05-01 07:51:19','2020-05-01 07:51:19'),(1272,80,'TITLE',7,0,'255',0,'\'\'',0,'',4,2,2,'2020-05-01 07:51:19','2020-05-01 07:51:19'),(1273,80,'DESCRIPTION',7,0,'255',0,'\'\'',0,'',5,2,2,'2020-05-01 07:51:19','2020-05-01 07:51:19'),(1292,328,'ID',5,0,'20',0,'',1,'',1,2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(1293,328,'NAME',7,0,'255',1,'NULL',0,'',2,2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(1294,328,'MENU_TITLE',7,0,'255',1,'NULL',0,'',3,2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(1295,328,'MENU_TYPE',5,0,'20',0,'1',0,'',4,2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(1296,328,'ORIENTATION',5,0,'2',0,'1',0,'',5,2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(1297,328,'QUERY_ID',5,0,'20',1,'NULL',0,'',6,2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(1298,328,'TEMPLATE_ID',5,0,'20',0,'0',0,'',7,2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(1299,328,'DESCRIPTION',8,0,'',1,'NULL',0,'',8,2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(1307,379,'NAME',7,0,'255',0,'',0,'',2,1,1,'2020-05-01 16:24:12','2020-05-01 16:24:12'),(1308,379,'DESCRIPTION',8,0,'',0,'',0,'',4,1,1,'2020-05-01 16:24:41','2020-05-01 16:24:40');
/*!40000 ALTER TABLE `table_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_fks`
--

DROP TABLE IF EXISTS `table_fks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_fks` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `COLUMN_ID` bigint(20) DEFAULT NULL,
  `FK_NAME` varchar(255) DEFAULT NULL,
  `FK_TABLE_ID` bigint(20) DEFAULT NULL,
  `FK_COLUMN_ID` bigint(20) DEFAULT NULL,
  `ON_UPDATE` bigint(20) DEFAULT NULL,
  `ON_DELETE` bigint(20) DEFAULT NULL,
  `DESCRIPTION` text DEFAULT NULL,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `phpapps_columns_fks_COLUMN_ID_FK` (`COLUMN_ID`),
  KEY `phpapps_columns_fks_FK_TABLE_ID_FK` (`FK_TABLE_ID`),
  KEY `phpapps_columns_fks_FK_COLUMN_FK` (`FK_COLUMN_ID`),
  KEY `phpapps_columns_fks_ON_UPDATE_FK` (`ON_UPDATE`),
  KEY `phpapps_columns_fks_ON_DELETE_FK` (`ON_DELETE`),
  KEY `columns_fks_users_MODIFY_UID_FK` (`MODIFY_UID`),
  KEY `columns_fks_users_CREATE_UID_FK` (`CREATE_UID`),
  CONSTRAINT `columns_fks_users_CREATE_UID_FK` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `columns_fks_users_MODIFY_UID_FK` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `phpapps_columns_fks_COLUMN_ID_FK` FOREIGN KEY (`COLUMN_ID`) REFERENCES `table_details` (`ID`),
  CONSTRAINT `phpapps_columns_fks_FK_TABLE_ID_FK` FOREIGN KEY (`FK_TABLE_ID`) REFERENCES `tables` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_fks`
--

LOCK TABLES `table_fks` WRITE;
/*!40000 ALTER TABLE `table_fks` DISABLE KEYS */;
INSERT INTO `table_fks` VALUES (8,73,'phpapps_table_indexes_TABLE_ID_FK',197,0,0,0,'',1,1,'2016-10-03 10:26:55','2016-10-03 10:26:55'),(9,77,'phpapps_table_indexes_INDEX_TYPE_FK',200,0,0,0,'',1,1,'2016-10-03 10:30:41','2016-10-03 10:30:41'),(21,81,'phpapps_sql_console_history_RUN_SCHEMA_FK',199,0,0,0,'',1,1,'2016-10-07 08:07:32','2016-10-07 08:07:32'),(22,83,'phpapps_queries_MODULE_ID_FK',282,0,0,0,'',1,1,'2016-10-11 09:15:36','2016-10-11 09:15:36'),(23,102,'php_quiz_categories_CATEG_TYPE_FK',288,0,0,0,'',1,1,'2017-02-23 07:38:51','2017-02-23 07:38:51'),(24,103,'php_quiz_questions_CATEG_ID_FK',287,0,0,0,'',1,1,'2017-02-23 08:24:22','2017-02-23 08:24:22'),(25,110,'atsepa_articles_CATEG_ID_FK',293,0,0,0,'',1,1,'2017-07-09 11:34:35','2017-07-09 11:34:35'),(26,116,'atsepa_users_USERTIPE_FK',295,0,0,0,'',1,1,'2017-07-09 12:18:36','2017-07-09 12:18:36'),(28,118,'atsepa_articles_USER_ID_FK',294,0,0,0,'',1,1,'2017-08-06 11:17:33','2017-08-06 11:17:33'),(30,129,'atsepa_categories_PID_FK',301,0,0,0,'',1,1,'2017-10-02 11:59:49','2017-10-02 11:59:49'),(31,137,'atsepa_topics_CAT_ID_FK',301,0,0,0,'',1,1,'2017-10-02 12:49:30','2017-10-02 12:49:30'),(32,138,'atsepa_topics_USER_ID_FK',303,0,0,0,'',1,1,'2017-10-02 12:51:31','2017-10-02 12:51:31'),(33,141,'atsepa_posts_TOPIC_ID_FK',302,0,0,0,'',1,1,'2017-10-02 13:02:43','2017-10-02 13:02:43'),(65,523,'table_details_ibfk_1',201,NULL,NULL,NULL,NULL,1,1,'2019-10-24 09:43:08','2019-10-24 09:43:08'),(66,521,'table_details_ibfk_2',197,46,NULL,NULL,NULL,1,1,'2019-10-24 09:43:08','2019-10-24 09:43:08'),(67,531,'table_details_ibfk_7',87,NULL,NULL,NULL,NULL,1,1,'2019-10-24 09:43:08','2019-10-24 09:43:08'),(68,532,'table_details_ibfk_8',87,NULL,NULL,NULL,NULL,1,1,'2019-10-24 09:43:08','2019-10-24 09:43:08'),(83,601,'phpapps_test_cols_GOGU_FK',278,NULL,NULL,NULL,NULL,1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(84,596,'phpapps_test_cols_ID_FK',2,234,NULL,NULL,NULL,1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(86,621,'list_mysql_column_types_ID_fk',201,NULL,NULL,NULL,NULL,1,1,'2019-10-28 10:54:16','2019-10-28 10:54:16'),(87,645,'emanag_date_cim_PERSONAL_ID_FK',315,0,0,0,'',1,1,'2019-10-28 12:04:15','2019-10-28 12:04:15'),(91,668,'emanag_personal_SUBUNIT_ID_FK',316,NULL,NULL,NULL,NULL,1,1,'2019-10-29 06:43:53','2019-10-29 06:43:53'),(92,680,'emanag_date_cim_CATEG_PERS_ID_FK',320,0,0,2,'',1,1,'2019-10-29 06:45:04','2019-10-29 06:45:04'),(93,688,'emanag_loc_munca_SUBUNIT_ID_FK',316,0,0,0,'',1,1,'2019-10-29 08:11:46','2019-10-29 08:11:46'),(94,689,'emanag_loc_munca_TIP_LOC_MUNCA_ID_FK',323,0,0,0,'',1,1,'2019-10-29 08:15:08','2019-10-29 08:15:08'),(119,843,'phpapps_menu_items_MENU_ID_FK',328,830,NULL,NULL,NULL,1,1,'2019-11-10 18:59:55','2019-11-10 18:59:55'),(125,NULL,'form_details_ibfk_1',5,264,NULL,NULL,NULL,1,1,'2019-11-19 13:45:30','2019-11-19 13:45:30'),(126,NULL,'form_details_ibfk_1',5,264,NULL,NULL,NULL,1,1,'2019-11-19 13:45:48','2019-11-19 13:45:48'),(142,917,'modules_ibfk_1',2,848,NULL,NULL,NULL,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(143,923,'modules_ibfk_3',87,901,NULL,NULL,NULL,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(144,924,'modules_ibfk_4',87,901,NULL,NULL,NULL,1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(146,940,'phpapps_forms_SCRIPT_TYPE_ID_FK',82,NULL,NULL,NULL,NULL,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(147,939,'phpapps_forms_WEB_TYPE_ID_FK',334,NULL,NULL,NULL,NULL,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(148,933,'scripts_ibfk_1',3,916,NULL,NULL,NULL,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(149,935,'scripts_ibfk_2',197,46,NULL,NULL,NULL,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(150,942,'scripts_ibfk_3',87,901,NULL,NULL,NULL,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(151,943,'scripts_ibfk_4',87,901,NULL,NULL,NULL,1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(153,947,'phpapps_scripts_LAYOUT_ID_FK',333,0,0,0,'',1,1,'2019-11-20 12:05:10','2019-11-20 12:05:10'),(154,918,'phpapps_modules_SCRIPT_ID_FK',83,0,0,0,'',1,1,'2019-11-20 12:05:50','2019-11-20 12:05:50'),(155,952,'phpapps_user_profiles_THEME_ID_FK',324,698,NULL,NULL,NULL,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(156,949,'phpapps_user_profiles_USER_ID_FK',87,901,NULL,NULL,NULL,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(157,953,'user_profiles_ibfk_2',87,901,NULL,NULL,NULL,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(158,954,'user_profiles_ibfk_3',87,901,NULL,NULL,NULL,1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(162,950,'phpapps_user_profiles_SCRIPT_ID_FK',83,0,0,0,'',1,1,'2019-11-20 12:06:40','2019-11-20 12:06:40'),(163,964,'phpapps_tables_ORIGIN_ID_FK',197,963,NULL,NULL,NULL,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(164,965,'tables_ibfk_1',3,916,NULL,NULL,NULL,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(165,966,'tables_ibfk_2',199,NULL,NULL,NULL,NULL,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(166,968,'tables_ibfk_3',203,NULL,NULL,NULL,NULL,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(167,970,'tables_ibfk_4',87,901,NULL,NULL,NULL,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(168,971,'tables_ibfk_5',87,901,NULL,NULL,NULL,1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(171,988,'columns_fks_users_CREATE_UID_FK',87,901,NULL,NULL,NULL,1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(172,987,'columns_fks_users_MODIFY_UID_FK',87,901,NULL,NULL,NULL,1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(173,980,'phpapps_columns_fks_COLUMN_ID_FK',198,520,NULL,NULL,NULL,1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(174,982,'phpapps_columns_fks_FK_TABLE_ID_FK',197,963,NULL,NULL,NULL,1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(180,1022,'phpapps_query_parameters_QUERY_ID_FK',281,82,NULL,NULL,NULL,1,1,'2020-04-17 09:36:34','2020-04-17 09:36:34'),(186,1093,'phpapps_grids_ELEMENT_TEMPLATE_ID_FK',350,1077,NULL,NULL,NULL,1,1,'2020-04-22 06:22:24','2020-04-22 06:22:24'),(187,1084,'phpapps_grids_GRID_TYPE_FK',348,NULL,NULL,NULL,NULL,1,1,'2020-04-22 06:22:24','2020-04-22 06:22:24'),(196,1212,'phpapps_grid_columns_COLUMN_ID_FK',198,520,NULL,NULL,NULL,1,1,'2020-04-28 14:21:11','2020-04-28 14:21:11'),(197,1211,'phpapps_grid_columns_GRID_ID_FK',347,1082,NULL,NULL,NULL,1,1,'2020-04-28 14:21:11','2020-04-28 14:21:11'),(199,1224,'phpapps_grid_actions_GRID_ACTION_TYPE_ID_FK',364,NULL,NULL,NULL,NULL,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(200,1218,'phpapps_grid_actions_GRID_ID_FK',347,1082,NULL,NULL,NULL,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(201,1223,'phpapps_grid_actions_POPUP_PAGE_FK',349,NULL,NULL,NULL,NULL,1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(205,1295,'phpapps_menus_MENU_TYPE_FK',339,NULL,NULL,NULL,NULL,2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(206,1296,'phpapps_menus_ORIENTATION_FK',330,NULL,NULL,NULL,NULL,2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(207,1297,'phpapps_menus_QUERY_ID_FK',281,82,NULL,NULL,NULL,2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51');
/*!40000 ALTER TABLE `table_fks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `table_indexes`
--

DROP TABLE IF EXISTS `table_indexes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `table_indexes` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TABLE_ID` bigint(20) DEFAULT NULL,
  `INDEX_NAME` varchar(255) DEFAULT NULL,
  `INDEX_TYPE_ID` bigint(20) DEFAULT NULL,
  `INDEX_COLUMNS` varchar(255) NOT NULL DEFAULT 'ID',
  `DESCRIPTION` text DEFAULT NULL,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `phpapps_table_indexes_TABLE_ID_FK` (`TABLE_ID`),
  KEY `phpapps_table_indexes_INDEX_TYPE_FK` (`INDEX_TYPE_ID`),
  KEY `table_indexes_users_MODIFY_UID_FK` (`MODIFY_UID`),
  KEY `table_indexes_users_CREATE_UID_FK` (`CREATE_UID`),
  CONSTRAINT `phpapps_table_indexes_INDEX_TYPE_FK` FOREIGN KEY (`INDEX_TYPE_ID`) REFERENCES `list_index_types` (`ID`),
  CONSTRAINT `phpapps_table_indexes_TABLE_ID_FK` FOREIGN KEY (`TABLE_ID`) REFERENCES `tables` (`ID`),
  CONSTRAINT `table_indexes_users_CREATE_UID_FK` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `table_indexes_users_MODIFY_UID_FK` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=408 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_indexes`
--

LOCK TABLES `table_indexes` WRITE;
/*!40000 ALTER TABLE `table_indexes` DISABLE KEYS */;
INSERT INTO `table_indexes` VALUES (27,280,'phpapps_sql_console_history_RUN_SCHEMA_FK',3,'81','INDEX ADDED BY FK',1,1,'2016-10-07 08:07:32','2016-10-07 08:07:32'),(28,281,'phpapps_queries_MODULE_ID_FK',3,'83','INDEX ADDED BY FK',1,1,'2016-10-11 09:15:36','2016-10-11 09:15:36'),(30,287,'php_quiz_categories_CATEG_TYPE_FK',3,'102','INDEX ADDED BY FK',1,1,'2017-02-23 07:38:51','2017-02-23 07:38:51'),(31,284,'php_quiz_questions_CATEG_ID_FK',3,'103','INDEX ADDED BY FK',1,1,'2017-02-23 08:24:22','2017-02-23 08:24:22'),(32,292,'atsepa_articles_CATEG_ID_FK',3,'110','INDEX ADDED BY FK',1,1,'2017-07-09 11:34:34','2017-07-09 11:34:34'),(33,294,'atsepa_users_113_IDX',2,'113','',1,1,'2017-07-09 12:08:02','2017-07-09 12:08:02'),(34,294,'atsepa_users_USERTIPE_FK',3,'116','INDEX ADDED BY FK',1,1,'2017-07-09 12:18:36','2017-07-09 12:18:36'),(36,292,'atsepa_articles_USER_ID_FK',3,'118','INDEX ADDED BY FK',1,1,'2017-08-06 11:17:33','2017-08-06 11:17:33'),(38,301,'atsepa_categories_PID_FK',3,'129','INDEX ADDED BY FK',1,1,'2017-10-02 11:59:49','2017-10-02 11:59:49'),(39,301,'atsepa_categories_130_IDX',2,'130','',1,1,'2017-10-02 12:02:35','2017-10-02 12:02:35'),(40,302,'atsepa_topics_CAT_ID_FK',3,'137','INDEX ADDED BY FK',1,1,'2017-10-02 12:49:30','2017-10-02 12:49:30'),(41,302,'atsepa_topics_USER_ID_FK',3,'138','INDEX ADDED BY FK',1,1,'2017-10-02 12:51:31','2017-10-02 12:51:31'),(42,304,'atsepa_posts_TOPIC_ID_FK',3,'141','INDEX ADDED BY FK',1,1,'2017-10-02 13:02:43','2017-10-02 13:02:43'),(43,305,'atsepa_contact_146_IDX',3,'146','',1,1,'2017-10-11 08:28:22','2017-10-11 08:28:22'),(74,275,'phpapps_test_cols_562_IDX',3,'test_unsign','',1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(75,275,'phpapps_test_cols_564_IDX',4,'NUME','',1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(76,275,'phpapps_test_cols_566_567_IDX',2,'test,GOGU','',1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(77,275,'phpapps_test_cols_589_590_591_IDX',2,'MUMUSA,ID,test_unsign','',1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(78,275,'phpapps_test_cols_58_71_IDX',2,'VIEW_ID2,MUMUSA','',1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(79,275,'phpapps_test_cols_592_IDX',4,'NUME','',1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(80,275,'phpapps_test_cols_VIEW_ID2_FK',3,'VIEW_ID2','',1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(81,275,'PRIMARY',1,'ID','',1,1,'2019-10-25 10:37:26','2019-10-25 10:37:26'),(90,222,'list_mysql_column_types_ID_fk',3,'COLUMN_TYPE_ID','',1,1,'2019-10-28 10:54:16','2019-10-28 10:54:16'),(91,222,'PRIMARY',1,'ID','',1,1,'2019-10-28 10:54:16','2019-10-28 10:54:16'),(95,319,'emanag_date_cim_PERSONAL_ID_FK',3,'645','INDEX ADDED BY FK',1,1,'2019-10-28 12:04:15','2019-10-28 12:04:15'),(101,315,'emanag_personal_SUBUNIT_ID_FK',3,'SUBUNIT_ID','',1,1,'2019-10-29 06:43:53','2019-10-29 06:43:53'),(102,315,'PRIMARY',1,'ID','',1,1,'2019-10-29 06:43:53','2019-10-29 06:43:53'),(104,319,'emanag_date_cim_CATEG_PERS_ID_FK',3,'680','INDEX ADDED BY FK',1,1,'2019-10-29 06:45:04','2019-10-29 06:45:04'),(105,322,'emanag_loc_munca_SUBUNIT_ID_FK',3,'688','INDEX ADDED BY FK',1,1,'2019-10-29 08:11:45','2019-10-29 08:11:45'),(106,322,'emanag_loc_munca_TIP_LOC_MUNCA_ID_FK',3,'689','INDEX ADDED BY FK',1,1,'2019-10-29 08:15:08','2019-10-29 08:15:08'),(107,324,'PRIMARY',1,'ID','',1,1,'2019-11-09 10:58:06','2019-11-09 10:58:06'),(195,331,'phpapps_menu_items_MENU_ID_FK',3,'MENU_ID','',1,1,'2019-11-10 18:59:55','2019-11-10 18:59:55'),(197,331,'PRIMARY',1,'ID','',1,1,'2019-11-10 18:59:55','2019-11-10 18:59:55'),(209,278,'FORM_ID',3,'FORM_ID','',1,1,'2019-11-19 13:45:48','2019-11-19 13:45:48'),(210,278,'PRIMARY',1,'ID','',1,1,'2019-11-19 13:45:48','2019-11-19 13:45:48'),(226,87,'phpapps_users_PROFILE_ID_FK',3,'PROFILE_ID','',1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(227,87,'PRIMARY',1,'ID','',1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(228,87,'users_ibfk_2',3,'MODIFY_UID','',1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(229,87,'users_ibfk_3',3,'CREATE_UID','',1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(230,87,'users_password_idx',3,'PASSWORD','',1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(231,87,'users_username_idx',3,'USERNAME','',1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(232,87,'users_username_unique_idx',2,'USERNAME','',1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(233,87,'USER_TYPE',3,'USER_TYPE','',1,1,'2019-11-20 08:56:52','2019-11-20 08:56:52'),(241,3,'APP_ID',3,'APP_ID','',1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(242,3,'modules_ibfk_2',3,'SCRIPT_ID','',1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(243,3,'modules_ibfk_3',3,'MODIFY_UID','',1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(244,3,'modules_ibfk_4',3,'CREATE_UID','',1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(245,3,'PRIMARY',1,'ID','',1,1,'2019-11-20 08:57:41','2019-11-20 08:57:41'),(249,83,'forms_ibfk_2',3,'TABLE_ID','',1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(250,83,'forms_ibfk_3',3,'MODIFY_UID','',1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(251,83,'forms_ibfk_4',3,'CREATE_UID','',1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(252,83,'MODULE_ID',2,'SCRIPT_NAME,MODULE_ID','',1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(253,83,'phpapps_forms_SCRIPT_TYPE_ID_FK',3,'SCRIPT_TYPE_ID','',1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(254,83,'phpapps_forms_WEB_TYPE_ID_FK',3,'WEB_TYPE_ID','',1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(255,83,'PRIMARY',1,'ID','',1,1,'2019-11-20 11:58:41','2019-11-20 11:58:41'),(256,83,'phpapps_scripts_LAYOUT_ID_FK',3,'947','INDEX ADDED BY FK',1,1,'2019-11-20 12:05:10','2019-11-20 12:05:10'),(257,3,'phpapps_modules_SCRIPT_ID_FK',3,'918','INDEX ADDED BY FK',1,1,'2019-11-20 12:05:50','2019-11-20 12:05:50'),(258,99,'phpapps_user_profiles_THEME_ID_FK',3,'THEME_ID','',1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(259,99,'phpapps_user_profiles_USER_ID_FK',3,'USER_ID','',1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(260,99,'PRIMARY',1,'ID','',1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(261,99,'user_profiles_ibfk_1',3,'SCRIPT_ID','',1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(262,99,'user_profiles_ibfk_2',3,'MODIFY_UID','',1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(263,99,'user_profiles_ibfk_3',3,'CREATE_UID','',1,1,'2019-11-20 12:06:23','2019-11-20 12:06:23'),(265,99,'phpapps_user_profiles_SCRIPT_ID_FK',3,'950','INDEX ADDED BY FK',1,1,'2019-11-20 12:06:40','2019-11-20 12:06:40'),(266,197,'MODULE_ID',3,'MODULE_ID','',1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(267,197,'phpapps_tables_MODULE_ID_SCHEMA_ID_TABLE_NAME_UIDX',2,'SCHEMA_ID,TABLE_NAME,MODULE_ID','',1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(268,197,'phpapps_tables_ORIGIN_ID_FK',3,'ORIGIN_ID','',1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(269,197,'PRIMARY',1,'ID','',1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(270,197,'tables_ibfk_2',3,'SCHEMA_ID','',1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(271,197,'tables_ibfk_3',3,'TABLE_TYPE','',1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(272,197,'tables_ibfk_4',3,'MODIFY_UID','',1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(273,197,'tables_ibfk_5',3,'CREATE_UID','',1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(274,197,'tables_table_name_module_id_idx',2,'MODULE_ID,TABLE_NAME','',1,1,'2019-11-20 12:41:02','2019-11-20 12:41:02'),(282,276,'columns_fks_users_CREATE_UID_FK',3,'CREATE_UID','',1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(283,276,'columns_fks_users_MODIFY_UID_FK',3,'MODIFY_UID','',1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(284,276,'phpapps_columns_fks_COLUMN_ID_FK',3,'COLUMN_ID','',1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(285,276,'phpapps_columns_fks_FK_COLUMN_FK',3,'FK_COLUMN_ID','',1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(286,276,'phpapps_columns_fks_FK_TABLE_ID_FK',3,'FK_TABLE_ID','',1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(287,276,'phpapps_columns_fks_ON_DELETE_FK',3,'ON_DELETE','',1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(288,276,'phpapps_columns_fks_ON_UPDATE_FK',3,'ON_UPDATE','',1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(289,276,'PRIMARY',1,'ID','',1,1,'2019-11-20 12:51:19','2019-11-20 12:51:19'),(297,300,'phpapps_layouts_APP_ID_FK',3,'996','INDEX ADDED BY FK',1,1,'2020-04-05 08:50:52','2020-04-05 08:50:52'),(298,300,'phpapps_layouts_126_996_IDX',2,'126,996','',1,1,'2020-04-05 09:30:03','2020-04-05 09:30:03'),(313,341,'phpapps_query_parameters_QUERY_ID_FK',3,'QUERY_ID','',1,1,'2020-04-17 09:36:34','2020-04-17 09:36:34'),(314,341,'PRIMARY',1,'ID','',1,1,'2020-04-17 09:36:34','2020-04-17 09:36:34'),(320,341,'phpapps_query_parameters_PARAMETER_TYPE_FK',3,'1033','INDEX ADDED BY FK',1,1,'2020-04-20 07:51:06','2020-04-20 07:51:06'),(329,346,'phpapps_layout_variables_LAYOUT_ID_FK',3,'1044','INDEX ADDED BY FK',1,1,'2020-04-20 09:22:30','2020-04-20 09:22:30'),(330,346,'phpapps_layout_variables_1044_1045_IDX',2,'1044,1045','',1,1,'2020-04-20 09:23:06','2020-04-20 09:23:06'),(335,350,'PRIMARY',1,'ID','',1,1,'2020-04-22 06:00:30','2020-04-22 06:00:30'),(336,350,'phpapps_layout_elements_templates_ELEMENT_TYPE_ID_FK',3,'1080','INDEX ADDED BY FK',1,1,'2020-04-22 06:05:33','2020-04-22 06:05:33'),(338,347,'phpapps_grids_ELEMENT_TEMPLATE_ID_FK',3,'ELEMENT_TEMPLATE_ID','',1,1,'2020-04-22 06:22:24','2020-04-22 06:22:24'),(339,347,'phpapps_grids_GRID_TYPE_FK',3,'GRID_TYPE','',1,1,'2020-04-22 06:22:24','2020-04-22 06:22:24'),(340,347,'PRIMARY',1,'ID','',1,1,'2020-04-22 06:22:24','2020-04-22 06:22:24'),(345,343,'PRIMARY',1,'ID','',1,1,'2020-04-22 14:03:27','2020-04-22 14:03:27'),(346,350,'phpapps_templates_1078_1080_1079_IDX',2,'1078,1080,1079','',1,1,'2020-04-23 19:37:30','2020-04-23 19:37:30'),(347,350,'phpapps_templates_ELEMENT_TYPE_ID_FK',3,'1080','INDEX ADDED BY FK',1,1,'2020-04-25 11:15:38','2020-04-25 11:15:38'),(370,351,'phpapps_grid_columns_COLUMN_ID_FK',3,'COLUMN_ID','',1,1,'2020-04-28 14:21:11','2020-04-28 14:21:11'),(371,351,'phpapps_grid_columns_GRID_ID_FK',3,'GRID_ID','',1,1,'2020-04-28 14:21:11','2020-04-28 14:21:11'),(372,351,'PRIMARY',1,'ID','',1,1,'2020-04-28 14:21:11','2020-04-28 14:21:11'),(374,363,'phpapps_grid_actions_GRID_ACTION_TYPE_ID_FK',3,'GRID_ACTION_TYPE_ID','',1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(375,363,'phpapps_grid_actions_GRID_ID_FK',3,'GRID_ID','',1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(376,363,'phpapps_grid_actions_POPUP_PAGE_FK',3,'POPUP_PAGE','',1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(377,363,'PRIMARY',1,'ID','',1,1,'2020-04-28 14:24:36','2020-04-28 14:24:36'),(381,365,'phpapps_db_connections_DB_TYPE_FK',3,'1233','INDEX ADDED BY FK',1,1,'2020-04-28 18:55:22','2020-04-28 18:55:22'),(386,377,'eshop_products_CATEGORY_ID_FK',3,'CATEGORY_ID','',2,2,'2020-05-01 06:26:19','2020-05-01 06:26:19'),(387,377,'PRIMARY',1,'ID','',2,2,'2020-05-01 06:26:19','2020-05-01 06:26:19'),(389,379,'eshop_product_images_PRODUCT_ID_FK',3,'1267','INDEX ADDED BY FK',1,1,'2020-05-01 06:58:12','2020-05-01 06:58:12'),(390,377,'eshop_products_CURRENCY_ID_FK',3,'1265','INDEX ADDED BY FK',1,1,'2020-05-01 06:59:31','2020-05-01 06:59:31'),(391,80,'PID',3,'PID','',2,2,'2020-05-01 07:51:19','2020-05-01 07:51:19'),(392,80,'PRIMARY',1,'ID','',2,2,'2020-05-01 07:51:19','2020-05-01 07:51:19'),(401,328,'phpapps_menus_MENU_TYPE_FK',3,'MENU_TYPE','',2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(402,328,'phpapps_menus_ORIENTATION_FK',3,'ORIENTATION','',2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(403,328,'phpapps_menus_QUERY_ID_FK',3,'QUERY_ID','',2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51'),(404,328,'PRIMARY',1,'ID','',2,2,'2020-05-01 08:15:51','2020-05-01 08:15:51');
/*!40000 ALTER TABLE `table_indexes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ORIGIN_ID` bigint(20) NOT NULL DEFAULT 0,
  `MODULE_ID` bigint(20) NOT NULL,
  `SCHEMA_ID` bigint(20) NOT NULL DEFAULT 0,
  `TABLE_NAME` varchar(255) NOT NULL DEFAULT '',
  `TABLE_TYPE` bigint(20) DEFAULT NULL,
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `tables_table_name_module_id_idx` (`TABLE_NAME`,`MODULE_ID`),
  UNIQUE KEY `phpapps_tables_MODULE_ID_SCHEMA_ID_TABLE_NAME_UIDX` (`MODULE_ID`,`SCHEMA_ID`,`TABLE_NAME`),
  KEY `MODULE_ID` (`MODULE_ID`),
  KEY `tables_ibfk_2` (`SCHEMA_ID`),
  KEY `tables_ibfk_3` (`TABLE_TYPE`),
  KEY `tables_ibfk_4` (`MODIFY_UID`),
  KEY `tables_ibfk_5` (`CREATE_UID`),
  KEY `phpapps_tables_ORIGIN_ID_FK` (`ORIGIN_ID`),
  CONSTRAINT `phpapps_tables_ORIGIN_ID_FK` FOREIGN KEY (`ORIGIN_ID`) REFERENCES `tables` (`ID`),
  CONSTRAINT `tables_ibfk_1` FOREIGN KEY (`MODULE_ID`) REFERENCES `modules` (`ID`),
  CONSTRAINT `tables_ibfk_2` FOREIGN KEY (`SCHEMA_ID`) REFERENCES `list_databases` (`ID`),
  CONSTRAINT `tables_ibfk_3` FOREIGN KEY (`TABLE_TYPE`) REFERENCES `list_table_types` (`ID`),
  CONSTRAINT `tables_ibfk_4` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `tables_ibfk_5` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=380 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (0,0,14,3,'dual',4,'VIRTUAL TABLE FOR ORIGIN_ID',1,1,'2016-09-27 13:55:35','2016-09-27 13:51:17'),(2,0,1,3,'applications',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(3,0,1,3,'modules',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(5,0,1,3,'forms',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(35,0,1,3,'list_no_yes',1,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(80,0,10,7,'categories',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(82,0,1,3,'list_script_types',1,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(83,0,1,3,'scripts',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(87,0,7,3,'users',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(88,0,7,3,'roles',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(89,0,7,3,'permissions',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(90,0,7,3,'user_roles',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(91,0,7,3,'role_permissions',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(93,0,7,3,'list_permission_types',1,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(96,0,1,3,'list_object_types',1,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(98,0,7,3,'list_permission_names',1,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(99,0,7,3,'user_profiles',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(129,0,1,3,'module_vars',2,'',1,1,'2016-09-27 10:05:46','2016-08-29 06:13:16'),(197,0,14,3,'tables',2,'',1,1,'2016-09-30 04:58:59','2016-09-21 11:06:57'),(198,0,14,3,'table_details',2,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:07:06'),(199,0,14,3,'list_databases',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:07:20'),(200,0,14,3,'list_index_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:07:35'),(201,0,14,3,'list_mysql_column_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:07:50'),(202,0,14,3,'views',2,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:08:11'),(203,0,14,3,'list_table_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:59:49'),(204,0,7,3,'list_user_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 13:34:21'),(210,0,14,3,'list_empty',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 14:41:58'),(222,0,14,3,'mysql_column_defs',2,'',1,1,'2016-09-28 11:54:35','2016-09-24 05:08:53'),(223,0,14,3,'list_dbms_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-24 11:36:51'),(224,0,14,3,'sql_sintax',2,'',1,1,'2016-09-27 10:05:46','2016-09-26 05:58:41'),(225,0,14,3,'list_sql_sintax_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-26 06:27:44'),(227,0,14,3,'list_foreign_key_options',1,'',1,1,'2016-09-27 10:05:46','2016-09-27 07:04:44'),(275,0,14,3,'test_cols',2,'',1,1,'2016-09-29 11:25:02','2016-09-29 11:25:02'),(276,0,14,3,'table_fks',2,'',1,1,'2016-10-03 10:32:41','2016-09-30 04:55:41'),(277,35,14,3,'list_no_yes',1,'',1,1,'2016-09-30 06:03:16','2016-09-30 06:03:16'),(278,0,1,3,'form_details',2,'Forms Details',1,1,'2016-09-30 08:22:17','2016-09-30 08:22:17'),(279,0,14,3,'table_indexes',2,'',1,1,'2016-10-03 10:21:21','2016-10-03 10:21:21'),(280,0,14,3,'sql_console_history',3,'',1,1,'2016-10-07 07:59:53','2016-10-07 07:59:53'),(281,0,14,3,'queries',2,'',1,1,'2016-10-11 08:55:57','2016-10-11 08:55:57'),(282,3,14,3,'modules',2,'',1,1,'2016-10-11 09:14:08','2016-10-11 09:14:08'),(283,87,1,3,'users',2,'',1,1,'2017-02-20 13:15:29','2017-02-20 13:15:29'),(284,0,15,12,'questions',2,'',1,1,'2017-02-21 12:13:35','2017-02-21 12:13:35'),(285,35,15,3,'list_no_yes',1,'',1,1,'2017-02-21 13:33:02','2017-02-21 13:33:02'),(286,0,15,12,'list_da_nu',1,'',1,1,'2017-02-21 13:33:38','2017-02-21 13:33:38'),(287,0,15,12,'categories',2,'',1,1,'2017-02-23 07:34:48','2017-02-23 07:34:48'),(288,0,15,12,'list_category_type',1,'',1,1,'2017-02-23 07:36:58','2017-02-23 07:36:58'),(289,199,7,3,'list_databases',1,'',1,1,'2017-04-27 05:07:26','2017-04-27 05:07:26'),(292,0,19,17,'articles',2,'',1,1,'2017-07-09 11:27:22','2017-07-09 11:27:22'),(293,0,19,17,'list_article_categories',1,'',1,1,'2017-07-09 11:33:28','2017-07-09 11:33:28'),(294,0,19,17,'app_users',2,'',1,1,'2017-09-25 07:08:05','2017-07-09 12:05:33'),(295,0,19,17,'list_user_types',1,'',1,1,'2017-07-09 12:13:21','2017-07-09 12:13:21'),(297,295,20,17,'list_user_types',1,'',1,1,'2017-07-09 12:25:02','2017-07-09 12:25:02'),(298,0,18,3,'test_import',2,'',1,1,'2017-09-21 09:06:44','2017-09-21 09:06:44'),(299,294,20,17,'app_users',2,'',1,1,'2017-09-25 07:10:24','2017-09-25 07:10:24'),(300,0,21,3,'layouts',2,'',1,1,'2017-09-28 06:53:01','2017-09-28 06:53:01'),(301,0,17,17,'forum_categories',2,'',1,1,'2017-10-02 12:13:14','2017-10-02 11:58:05'),(302,0,17,17,'topics',2,'',1,1,'2017-10-02 12:34:22','2017-10-02 12:34:22'),(303,294,17,17,'app_users',2,'',1,1,'2017-10-02 12:51:13','2017-10-02 12:51:13'),(304,0,17,17,'posts',2,'',1,1,'2017-10-02 13:00:41','2017-10-02 13:00:41'),(305,0,20,17,'contact',2,'',1,1,'2017-10-11 08:23:18','2017-10-11 08:23:18'),(306,0,19,17,'da_nu',1,'',1,1,'2017-10-13 09:35:02','2017-10-13 09:35:02'),(307,0,14,3,'test1',2,'',1,1,'2018-03-30 05:06:47','2018-03-30 05:06:47'),(308,0,14,3,'test2',2,'asas',1,1,'2018-04-25 07:16:50','2018-04-25 07:16:50'),(310,308,1,3,'test2',2,'',1,1,'2019-05-09 10:28:46','2019-05-09 10:28:46'),(312,0,14,3,'errr',2,'eror test',1,1,'2019-08-25 07:30:01','2019-08-25 07:15:49'),(313,0,14,3,'test_3',2,'',1,1,'2019-09-27 08:26:28','2019-09-27 08:26:28'),(318,0,1,3,'test_upload',2,'',1,1,'2019-10-28 08:30:57','2019-10-28 08:30:57'),(324,0,21,3,'themes',2,'',1,1,'2019-11-09 10:56:46','2019-11-09 10:56:46'),(325,324,7,3,'themes',2,'',1,1,'2019-11-09 12:32:39','2019-11-09 12:32:39'),(326,83,7,3,'scripts',2,'',1,1,'2019-11-09 15:47:56','2019-11-09 15:47:56'),(328,0,21,3,'menus',2,'',1,1,'2019-11-10 11:27:47','2019-11-10 11:27:47'),(330,0,21,3,'list_menu_orientation',1,'',1,1,'2019-11-10 18:49:23','2019-11-10 18:49:23'),(331,0,21,3,'menu_items',2,'',1,1,'2019-11-10 18:54:07','2019-11-10 18:54:07'),(332,83,21,3,'scripts',2,'',1,1,'2019-11-10 18:56:19','2019-11-10 18:56:19'),(333,300,1,3,'layouts',2,'',1,1,'2019-11-19 10:22:13','2019-11-19 10:22:13'),(334,0,1,3,'list_web_script_type',1,'',1,1,'2019-11-20 08:08:45','2019-11-20 08:08:45'),(335,307,27,3,'test1',2,'',1,1,'2019-11-23 08:25:22','2019-11-23 08:25:22'),(336,310,27,3,'test2',2,'',1,1,'2019-11-23 12:26:52','2019-11-23 12:26:52'),(338,2,21,3,'applications',2,'',1,1,'2020-04-05 08:52:16','2020-04-05 08:52:16'),(339,0,21,3,'list_menu_types',1,'',1,1,'2020-04-11 12:53:29','2020-04-11 12:53:29'),(340,281,21,3,'queries',2,'',1,1,'2020-04-12 09:01:16','2020-04-12 09:01:16'),(341,0,14,3,'query_parameters',2,'',1,1,'2020-04-17 09:33:22','2020-04-17 09:33:22'),(343,0,21,3,'display_object_elements',2,'',1,1,'2020-04-22 12:16:37','2020-04-19 09:38:57'),(345,0,14,3,'list_query_parameter_type',1,'',1,1,'2020-04-20 07:48:10','2020-04-20 07:48:10'),(346,0,21,3,'layout_variables',2,'',1,1,'2020-04-20 09:15:32','2020-04-20 09:15:32'),(347,0,21,3,'grids',2,'',1,1,'2020-04-22 05:17:35','2020-04-22 05:17:35'),(348,0,21,3,'list_grid_types',1,'',1,1,'2020-04-22 05:18:30','2020-04-22 05:18:30'),(349,0,21,3,'list_true_false',1,'',1,1,'2020-04-22 05:38:41','2020-04-22 05:38:41'),(350,0,21,3,'templates',2,'',1,1,'2020-04-22 11:40:25','2020-04-22 05:58:21'),(351,0,21,3,'grid_columns',2,'',1,1,'2020-04-22 06:25:20','2020-04-22 06:25:20'),(352,197,21,3,'tables',2,'',1,1,'2020-04-22 06:51:00','2020-04-22 06:51:00'),(353,198,21,3,'table_details',2,'',1,1,'2020-04-22 06:51:12','2020-04-22 06:51:12'),(356,0,21,3,'list_display_objects_types',1,'',1,1,'2020-04-22 12:18:27','2020-04-22 12:18:27'),(357,0,21,3,'list_display_elements_types',1,'',1,1,'2020-04-22 13:58:30','2020-04-22 13:58:30'),(358,0,1,3,'list_application_types',1,'',1,1,'2020-04-22 20:22:01','2020-04-22 20:22:01'),(359,0,21,3,'custom_elements',2,'',1,1,'2020-04-23 07:21:18','2020-04-23 07:21:18'),(360,0,21,3,'forms',2,'',1,1,'2020-04-26 07:01:09','2020-04-26 07:01:09'),(361,0,21,3,'list_template_types',1,'',1,1,'2020-04-26 07:59:33','2020-04-26 07:59:33'),(362,350,1,3,'templates',2,'',1,1,'2020-04-26 09:08:09','2020-04-26 09:08:09'),(363,0,21,3,'grid_actions',2,'',1,1,'2020-04-26 15:55:16','2020-04-26 15:55:16'),(364,0,21,3,'list_grid_action_types',1,'',1,1,'2020-04-28 11:14:52','2020-04-28 11:14:52'),(365,0,14,3,'db_connections',2,'',1,1,'2020-04-28 18:48:11','2020-04-28 18:47:49'),(377,0,10,7,'products',2,'',1,1,'2020-05-01 06:16:23','2020-05-01 06:16:23'),(378,0,10,7,'list_currency',1,'',1,1,'2020-05-01 06:29:31','2020-05-01 06:29:31'),(379,0,10,7,'product_images',2,'',1,1,'2020-05-01 06:50:25','2020-05-01 06:50:25');
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `APP_ID` bigint(20) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_bin DEFAULT NULL,
  `ELEMENT_TYPE_ID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phpapps_templates_1078_1080_1079_IDX` (`TEMPLATE_NAME`,`APP_ID`,`ELEMENT_TYPE_ID`),
  KEY `phpapps_templates_ELEMENT_TYPE_ID_FK` (`ELEMENT_TYPE_ID`),
  CONSTRAINT `phpapps_templates_ELEMENT_TYPE_ID_FK` FOREIGN KEY (`ELEMENT_TYPE_ID`) REFERENCES `list_display_elements_types` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (1,'default',1,'',3),(2,'db_grid4',1,'',3),(20,'test_1',7,'',1),(33,'phpapps_default_custom_element_template',1,'',5),(34,'test_2',1,'',1),(36,'phpapps_default_grid_template',1,'',3),(37,'phpapps_default_menu_template',1,'',4),(38,'phpapps_main_navbar',1,'',4);
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test1`
--

DROP TABLE IF EXISTS `test1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test1` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test1`
--

LOCK TABLES `test1` WRITE;
/*!40000 ALTER TABLE `test1` DISABLE KEYS */;
/*!40000 ALTER TABLE `test1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test2`
--

DROP TABLE IF EXISTS `test2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test2` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `nume` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'adada',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test2`
--

LOCK TABLES `test2` WRITE;
/*!40000 ALTER TABLE `test2` DISABLE KEYS */;
INSERT INTO `test2` VALUES (1,'sss dd'),(2,'sss'),(3,'yyy'),(4,'yyy'),(5,'sss'),(6,'sss'),(7,'user_data/1/5dba82f31d099'),(8,'user_data/1/5dba82f34408b');
/*!40000 ALTER TABLE `test2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_3`
--

DROP TABLE IF EXISTS `test_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_3` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NUME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_3`
--

LOCK TABLES `test_3` WRITE;
/*!40000 ALTER TABLE `test_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_cols`
--

DROP TABLE IF EXISTS `test_cols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_cols` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `test_unsign` bigint(2) NOT NULL DEFAULT 0,
  `MUMUSA` bigint(20) DEFAULT NULL,
  `NUME` text DEFAULT NULL,
  `VIEW_ID2` bigint(20) DEFAULT NULL,
  `GOGU` bigint(15) DEFAULT NULL,
  `test` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phpapps_test_cols_58_71_IDX` (`MUMUSA`,`VIEW_ID2`),
  UNIQUE KEY `phpapps_test_cols_566_567_IDX` (`GOGU`,`test`),
  UNIQUE KEY `phpapps_test_cols_589_590_591_IDX` (`ID`,`test_unsign`,`MUMUSA`),
  KEY `phpapps_test_cols_VIEW_ID2_FK` (`VIEW_ID2`),
  KEY `phpapps_test_cols_562_IDX` (`test_unsign`),
  FULLTEXT KEY `phpapps_test_cols_564_IDX` (`NUME`),
  FULLTEXT KEY `phpapps_test_cols_592_IDX` (`NUME`),
  CONSTRAINT `phpapps_test_cols_GOGU_FK` FOREIGN KEY (`GOGU`) REFERENCES `form_details` (`ID`),
  CONSTRAINT `phpapps_test_cols_ID_FK` FOREIGN KEY (`ID`) REFERENCES `applications` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_cols`
--

LOCK TABLES `test_cols` WRITE;
/*!40000 ALTER TABLE `test_cols` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_cols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_def_roll`
--

DROP TABLE IF EXISTS `test_def_roll`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_def_roll` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `APP_ID` bigint(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_def_roll`
--

LOCK TABLES `test_def_roll` WRITE;
/*!40000 ALTER TABLE `test_def_roll` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_def_roll` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_import`
--

DROP TABLE IF EXISTS `test_import`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_import` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FILE_PATH` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NUME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_import`
--

LOCK TABLES `test_import` WRITE;
/*!40000 ALTER TABLE `test_import` DISABLE KEYS */;
INSERT INTO `test_import` VALUES (1,'',NULL),(2,'',NULL),(3,'','xls'),(4,'','xls'),(5,'','xls'),(6,'','xls'),(7,'','xls'),(8,'','xls'),(9,'user_data/IpGavril.txt','sss'),(10,'user_data/IMG_20141219_163526.jpg','poza'),(11,'user_data/IMG_20141219_163526.jpg','poza'),(12,'../user_data/IMG_20141219_163526.jpg','poza'),(13,'../user_data/AnexeCIM.doc','sss'),(14,'user_data/aaa.bat','sss'),(15,'user_data/IMG_20141219_163526.jpg','sss'),(16,'user_data/IMG_20141219_163526.jpg','sss'),(17,'user_data/putty.exe','sss'),(18,'user_data/CIM_01_03_2015_nedeterminata.doc','sss'),(19,'user_data/IMG_20141219_163526.jpg','sss'),(20,'user_data/IMG_20141219_163526.jpg','sss'),(21,'user_data/IMG_20141219_163526.jpg','asasa'),(22,'user_data/11195280_10153293546377094_555126213_n.jpg','asasa'),(23,'http://localhost:89/phpapps_dev/phpapps/user_data/11124051_10153293547207094_1420210538_n.jpg','adasda'),(24,'D:/linuxport/work/www\\phpapps_dev\\phpapps\\/user_data/11195513_10153309278852094_1373504183_n.jpg','dasas'),(25,'user_data/11124051_10153293547207094_1420210538_n.jpg','das');
/*!40000 ALTER TABLE `test_import` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_upload`
--

DROP TABLE IF EXISTS `test_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_upload` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `upload_file` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_upload`
--

LOCK TABLES `test_upload` WRITE;
/*!40000 ALTER TABLE `test_upload` DISABLE KEYS */;
INSERT INTO `test_upload` VALUES (1,'user_data/Ian2019.xls'),(2,'user_data/Statistica.gif'),(3,'user_data/1/5db6b739532df.xls'),(4,'user_data//marin_gheorghe.xls'),(5,'user_data/1/Statistica.gif'),(6,'user_data/1/Statistica.gif'),(7,'user_data/1/Statistica.gif'),(8,'user_data/1/Statistica.gif'),(9,'user_data/1/5db6b881a4267.png'),(10,'user_data/1/5db6b3a884b5e.xls'),(11,'user_data/1/5db6b7728d690.xls'),(12,'user_data/1/5db6b837648fb.xls'),(13,'user_data/1/5db6b8ca201d6.'),(14,'user_data/1/5db6b93e8690d'),(15,'user_data/1/5db93459567ff.gif');
/*!40000 ALTER TABLE `test_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `themes`
--

DROP TABLE IF EXISTS `themes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `themes` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `THEME_NAME` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CSS_FILE` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `themes`
--

LOCK TABLES `themes` WRITE;
/*!40000 ALTER TABLE `themes` DISABLE KEYS */;
INSERT INTO `themes` VALUES (1,'DARK','dark_style'),(2,'LIGHT','light_style');
/*!40000 ALTER TABLE `themes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profiles`
--

DROP TABLE IF EXISTS `user_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_profiles` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) DEFAULT NULL,
  `SCRIPT_ID` bigint(20) NOT NULL DEFAULT 0,
  `PROFILE_NAME` varchar(255) NOT NULL DEFAULT '',
  `THEME_ID` bigint(10) NOT NULL DEFAULT 1,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `user_profiles_ibfk_1` (`SCRIPT_ID`),
  KEY `user_profiles_ibfk_2` (`MODIFY_UID`),
  KEY `user_profiles_ibfk_3` (`CREATE_UID`),
  KEY `phpapps_user_profiles_THEME_ID_FK` (`THEME_ID`),
  KEY `phpapps_user_profiles_USER_ID_FK` (`USER_ID`),
  CONSTRAINT `phpapps_user_profiles_SCRIPT_ID_FK` FOREIGN KEY (`SCRIPT_ID`) REFERENCES `scripts` (`ID`),
  CONSTRAINT `phpapps_user_profiles_THEME_ID_FK` FOREIGN KEY (`THEME_ID`) REFERENCES `themes` (`ID`),
  CONSTRAINT `phpapps_user_profiles_USER_ID_FK` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`ID`),
  CONSTRAINT `user_profiles_ibfk_2` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `user_profiles_ibfk_3` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profiles`
--

LOCK TABLES `user_profiles` WRITE;
/*!40000 ALTER TABLE `user_profiles` DISABLE KEYS */;
INSERT INTO `user_profiles` VALUES (2,1,163,'user_home',2,1,1,'2020-03-28 08:09:25','2015-08-19 11:53:47'),(3,1,154,'prof_sql',1,1,1,'2019-11-20 09:17:20','2015-08-19 12:15:39'),(4,1,154,'profil de test',1,1,1,'2019-11-20 09:17:20','2019-11-09 15:48:58'),(5,1,154,'profil de test',1,1,1,'2019-11-20 09:17:20','2019-11-09 15:48:58');
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
  `UID` bigint(20) NOT NULL DEFAULT 0,
  `ROLE_ID` bigint(20) NOT NULL DEFAULT 0,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
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
  `USER_TYPE` bigint(20) NOT NULL DEFAULT 1,
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `PROFILE_ID` bigint(20) NOT NULL DEFAULT 0,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `users_username_unique_idx` (`USERNAME`),
  KEY `USER_TYPE` (`USER_TYPE`),
  KEY `users_username_idx` (`USERNAME`),
  KEY `users_password_idx` (`PASSWORD`),
  KEY `users_ibfk_2` (`MODIFY_UID`),
  KEY `users_ibfk_3` (`CREATE_UID`),
  KEY `phpapps_users_PROFILE_ID_FK` (`PROFILE_ID`),
  CONSTRAINT `phpapps_users_PROFILE_ID_FK` FOREIGN KEY (`PROFILE_ID`) REFERENCES `user_profiles` (`ID`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`USER_TYPE`) REFERENCES `list_user_types` (`ID`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `users_ibfk_3` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'victor','alcatraz','Gigi','Fanica','',1,'bb',2,1,1,'2019-11-10 07:27:01','2019-11-10 07:27:01'),(2,'laura','alcatraz','ss','','',1,'aa',2,1,1,'2020-04-21 09:05:05','2019-11-10 07:27:01'),(4,'ana','a','aa','aa','aa',1,'aa',2,1,1,'2019-11-10 07:27:01','2019-11-10 07:27:01');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_actions`
--

DROP TABLE IF EXISTS `view_actions`;
/*!50001 DROP VIEW IF EXISTS `view_actions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_actions` (
  `ID` tinyint NOT NULL,
  `ACTION_FILE` tinyint NOT NULL,
  `ACTION_TYPE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_applications`
--

DROP TABLE IF EXISTS `view_applications`;
/*!50001 DROP VIEW IF EXISTS `view_applications`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_applications` (
  `ID` tinyint NOT NULL,
  `USER_ID` tinyint NOT NULL,
  `APP_NAME` tinyint NOT NULL,
  `APP_TITLE` tinyint NOT NULL,
  `APP_SCHEMA` tinyint NOT NULL,
  `BASE_DIR` tinyint NOT NULL,
  `APP_DATE` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `MODIFY_UID` tinyint NOT NULL,
  `CREATE_UID` tinyint NOT NULL,
  `MODIFY_DATE` tinyint NOT NULL,
  `CREATE_DATE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_display_object_elements`
--

DROP TABLE IF EXISTS `view_display_object_elements`;
/*!50001 DROP VIEW IF EXISTS `view_display_object_elements`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_display_object_elements` (
  `ID` tinyint NOT NULL,
  `DISPLAY_OBJECT_ID` tinyint NOT NULL,
  `DISPLAY_OBJECT_NAME` tinyint NOT NULL,
  `DISPLAY_OBJECT_TYPE_ID` tinyint NOT NULL,
  `DISPLAY_OBJECT_TYPE` tinyint NOT NULL,
  `ELEMENT_ID` tinyint NOT NULL,
  `ELEMENT_NAME` tinyint NOT NULL,
  `ELEMENT_TYPE_ID` tinyint NOT NULL,
  `ELEMENT_TYPE` tinyint NOT NULL,
  `TEMPLATE_VARIABLE_NAME` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_forms`
--

DROP TABLE IF EXISTS `view_forms`;
/*!50001 DROP VIEW IF EXISTS `view_forms`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_forms` (
  `ID` tinyint NOT NULL,
  `FORM_NAME` tinyint NOT NULL,
  `MODULE_ID` tinyint NOT NULL,
  `MODULE_NAME` tinyint NOT NULL,
  `APP_ID` tinyint NOT NULL,
  `APP_NAME` tinyint NOT NULL,
  `TABLE_ID` tinyint NOT NULL,
  `TABLE_NAME` tinyint NOT NULL,
  `TABLE_SCHEMA` tinyint NOT NULL,
  `FORM_QUERY` tinyint NOT NULL,
  `FORM_PHP_DIR` tinyint NOT NULL,
  `FORM_TPL_DIR` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_grid_columns`
--

DROP TABLE IF EXISTS `view_grid_columns`;
/*!50001 DROP VIEW IF EXISTS `view_grid_columns`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_grid_columns` (
  `ID` tinyint NOT NULL,
  `GRID_ID` tinyint NOT NULL,
  `GRID_NAME` tinyint NOT NULL,
  `COLUMN_ID` tinyint NOT NULL,
  `COLUMN_NAME` tinyint NOT NULL,
  `TABLE_ID` tinyint NOT NULL,
  `ALT_COLUMN_TEXT` tinyint NOT NULL,
  `LABEL` tinyint NOT NULL,
  `ACTION` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_grids`
--

DROP TABLE IF EXISTS `view_grids`;
/*!50001 DROP VIEW IF EXISTS `view_grids`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_grids` (
  `ID` tinyint NOT NULL,
  `GRID_NAME` tinyint NOT NULL,
  `GRID_TITLE` tinyint NOT NULL,
  `GRID_TYPE_ID` tinyint NOT NULL,
  `GRID_TYPE` tinyint NOT NULL,
  `TABLE_ID` tinyint NOT NULL,
  `QUERY_ID` tinyint NOT NULL,
  `EDITABLE` tinyint NOT NULL,
  `FILTERABLE` tinyint NOT NULL,
  `PAGINABLE` tinyint NOT NULL,
  `SORTABLE` tinyint NOT NULL,
  `EXPORTABLE` tinyint NOT NULL,
  `EDIT_FORM_ID` tinyint NOT NULL,
  `ROWS_ON_PAGE` tinyint NOT NULL,
  `ELEMENT_TEMPLATE_ID` tinyint NOT NULL,
  `EDIT_FORM_FILE_NAME` tinyint NOT NULL,
  `TEMPLATE_ID` tinyint NOT NULL,
  `TEMPLATE_NAME` tinyint NOT NULL,
  `APP_NAME` tinyint NOT NULL,
  `TABLE_NAME` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_layouts`
--

DROP TABLE IF EXISTS `view_layouts`;
/*!50001 DROP VIEW IF EXISTS `view_layouts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_layouts` (
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `APP_ID` tinyint NOT NULL,
  `APP_NAME` tinyint NOT NULL,
  `description` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_menu_items`
--

DROP TABLE IF EXISTS `view_menu_items`;
/*!50001 DROP VIEW IF EXISTS `view_menu_items`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_menu_items` (
  `ID` tinyint NOT NULL,
  `PID` tinyint NOT NULL,
  `MENU_ID` tinyint NOT NULL,
  `ACTION` tinyint NOT NULL,
  `LABEL` tinyint NOT NULL,
  `PLABEL` tinyint NOT NULL,
  `PACTION` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_menus`
--

DROP TABLE IF EXISTS `view_menus`;
/*!50001 DROP VIEW IF EXISTS `view_menus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_menus` (
  `TEMPLATE_ID` tinyint NOT NULL,
  `TEMPLATE_NAME` tinyint NOT NULL,
  `APP_ID` tinyint NOT NULL,
  `APP_NAME` tinyint NOT NULL,
  `ID` tinyint NOT NULL,
  `NAME` tinyint NOT NULL,
  `MENU_TITLE` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `MENU_TYPE` tinyint NOT NULL,
  `LIST_MENU_TYPE_ID` tinyint NOT NULL,
  `ORIENTATION` tinyint NOT NULL,
  `LIST_MENU_ORIENTATION_ID` tinyint NOT NULL,
  `QUERY_ID` tinyint NOT NULL,
  `QUERY_NAME` tinyint NOT NULL,
  `QUERY_DESCRIPTION` tinyint NOT NULL,
  `QUERY_BODY` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_modules`
--

DROP TABLE IF EXISTS `view_modules`;
/*!50001 DROP VIEW IF EXISTS `view_modules`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_modules` (
  `ID` tinyint NOT NULL,
  `APP_ID` tinyint NOT NULL,
  `APP_NAME` tinyint NOT NULL,
  `APP_SCHEMA` tinyint NOT NULL,
  `MODULE_NAME` tinyint NOT NULL,
  `MODULE_TITLE` tinyint NOT NULL,
  `MODULE_DATE` tinyint NOT NULL,
  `MODULE_SCHEMA` tinyint NOT NULL,
  `SCHEMA_NAME` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `SCRIPT_ID` tinyint NOT NULL,
  `SCRIPT_NAME` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_posible_display_object_elements`
--

DROP TABLE IF EXISTS `view_posible_display_object_elements`;
/*!50001 DROP VIEW IF EXISTS `view_posible_display_object_elements`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_posible_display_object_elements` (
  `ID` tinyint NOT NULL,
  `ELEMENT_NAME` tinyint NOT NULL,
  `ELEMENT_TYPE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_role_permissions`
--

DROP TABLE IF EXISTS `view_role_permissions`;
/*!50001 DROP VIEW IF EXISTS `view_role_permissions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_role_permissions` (
  `ID` tinyint NOT NULL,
  `ROLE_ID` tinyint NOT NULL,
  `ROLE_NAME` tinyint NOT NULL,
  `PERMISSION_ID` tinyint NOT NULL,
  `PERMISSION_NAME` tinyint NOT NULL,
  `PERMISSION_NAME_ID` tinyint NOT NULL,
  `PERMISSION_DESC` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_scripts`
--

DROP TABLE IF EXISTS `view_scripts`;
/*!50001 DROP VIEW IF EXISTS `view_scripts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_scripts` (
  `ID` tinyint NOT NULL,
  `SCRIPT_NAME` tinyint NOT NULL,
  `APP_ID` tinyint NOT NULL,
  `APP_NAME` tinyint NOT NULL,
  `SCRIPT_TYPE_ID` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `MODULE_ID` tinyint NOT NULL,
  `MODULE_NAME` tinyint NOT NULL,
  `FILE_NAME` tinyint NOT NULL,
  `RUN_PATH` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_table_details`
--

DROP TABLE IF EXISTS `view_table_details`;
/*!50001 DROP VIEW IF EXISTS `view_table_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_table_details` (
  `ID` tinyint NOT NULL,
  `SCHEMA_ID` tinyint NOT NULL,
  `TABLE_SCHEMA` tinyint NOT NULL,
  `TABLE_ID` tinyint NOT NULL,
  `TABLE_NAME` tinyint NOT NULL,
  `COLUMN_NAME` tinyint NOT NULL,
  `COLUMN_TYPE_ID` tinyint NOT NULL,
  `COLUMN_TYPE_LABEl` tinyint NOT NULL,
  `UNSIGN` tinyint NOT NULL,
  `COLUMN_SIZE` tinyint NOT NULL,
  `ACCEPT_NULL` tinyint NOT NULL,
  `COLUMN_DEFAULT_VALUE` tinyint NOT NULL,
  `AUTOINCREMENT` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `ORD` tinyint NOT NULL,
  `MODIFY_UID` tinyint NOT NULL,
  `MODIFIED_BY` tinyint NOT NULL,
  `CREATE_UID` tinyint NOT NULL,
  `CREATED_BY` tinyint NOT NULL,
  `MODIFY_DATE` tinyint NOT NULL,
  `CREATE_DATE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_table_fks`
--

DROP TABLE IF EXISTS `view_table_fks`;
/*!50001 DROP VIEW IF EXISTS `view_table_fks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_table_fks` (
  `ID` tinyint NOT NULL,
  `COLUMN_ID` tinyint NOT NULL,
  `COLUMN_NAME` tinyint NOT NULL,
  `SCHEMA_ID` tinyint NOT NULL,
  `TABLE_SCHEMA` tinyint NOT NULL,
  `TABLE_ID` tinyint NOT NULL,
  `TABLE_NAME` tinyint NOT NULL,
  `FK_NAME` tinyint NOT NULL,
  `FK_SCHEMA_ID` tinyint NOT NULL,
  `FK_TABLE_SCHEMA` tinyint NOT NULL,
  `FK_TABLE_ID` tinyint NOT NULL,
  `FK_TABLE_NAME` tinyint NOT NULL,
  `FK_COLUMN_ID` tinyint NOT NULL,
  `FK_COLUMN_NAME` tinyint NOT NULL,
  `ON_UPDATE` tinyint NOT NULL,
  `ON_DELETE` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_table_indexes`
--

DROP TABLE IF EXISTS `view_table_indexes`;
/*!50001 DROP VIEW IF EXISTS `view_table_indexes`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_table_indexes` (
  `ID` tinyint NOT NULL,
  `SCHEMA_ID` tinyint NOT NULL,
  `TABLE_SCHEMA` tinyint NOT NULL,
  `TABLE_ID` tinyint NOT NULL,
  `TABLE_NAME` tinyint NOT NULL,
  `INDEX_NAME` tinyint NOT NULL,
  `INDEX_TYPE_ID` tinyint NOT NULL,
  `INDEX_TYPE` tinyint NOT NULL,
  `INDEX_COLUMNS` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `MODIFY_UID` tinyint NOT NULL,
  `CREATE_UID` tinyint NOT NULL,
  `MODIFY_DATE` tinyint NOT NULL,
  `CREATE_DATE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_tables`
--

DROP TABLE IF EXISTS `view_tables`;
/*!50001 DROP VIEW IF EXISTS `view_tables`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_tables` (
  `ID` tinyint NOT NULL,
  `ORIGIN_ID` tinyint NOT NULL,
  `ORIGIN_MODULE_ID` tinyint NOT NULL,
  `TABLE_TYPE` tinyint NOT NULL,
  `TABLE_TYPE_LABEL` tinyint NOT NULL,
  `TABLE_SCHEMA_ID` tinyint NOT NULL,
  `TABLE_SCHEMA` tinyint NOT NULL,
  `TABLE_NAME` tinyint NOT NULL,
  `APP_SCHEMA` tinyint NOT NULL,
  `APP_ID` tinyint NOT NULL,
  `APP_NAME` tinyint NOT NULL,
  `MODULE_ID` tinyint NOT NULL,
  `MODULE_NAME` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_templates`
--

DROP TABLE IF EXISTS `view_templates`;
/*!50001 DROP VIEW IF EXISTS `view_templates`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_templates` (
  `ID` tinyint NOT NULL,
  `TEMPLATE_NAME` tinyint NOT NULL,
  `APP_ID` tinyint NOT NULL,
  `APP_NAME` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `ELEMENT_TYPE_ID` tinyint NOT NULL,
  `ELEMENT_TYPE` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_user_profiles`
--

DROP TABLE IF EXISTS `view_user_profiles`;
/*!50001 DROP VIEW IF EXISTS `view_user_profiles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_profiles` (
  `ID` tinyint NOT NULL,
  `USER_ID` tinyint NOT NULL,
  `SCRIPT_ID` tinyint NOT NULL,
  `PROFILE_NAME` tinyint NOT NULL,
  `THEME_ID` tinyint NOT NULL,
  `MODIFY_UID` tinyint NOT NULL,
  `CREATE_UID` tinyint NOT NULL,
  `MODIFY_DATE` tinyint NOT NULL,
  `CREATE_DATE` tinyint NOT NULL,
  `THEME_NAME` tinyint NOT NULL,
  `CSS_FILE` tinyint NOT NULL,
  `SCRIPT_NAME` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_user_roles`
--

DROP TABLE IF EXISTS `view_user_roles`;
/*!50001 DROP VIEW IF EXISTS `view_user_roles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_user_roles` (
  `ID` tinyint NOT NULL,
  `UID` tinyint NOT NULL,
  `USERNAME` tinyint NOT NULL,
  `ROLE_ID` tinyint NOT NULL,
  `ROLE_NAME` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_users`
--

DROP TABLE IF EXISTS `view_users`;
/*!50001 DROP VIEW IF EXISTS `view_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_users` (
  `ID` tinyint NOT NULL,
  `USERNAME` tinyint NOT NULL,
  `PASSWORD` tinyint NOT NULL,
  `FIRSTNAME` tinyint NOT NULL,
  `LASTNAME` tinyint NOT NULL,
  `EMAIL` tinyint NOT NULL,
  `USER_TYPE` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `PROFILE_ID` tinyint NOT NULL,
  `PROFILE_NAME` tinyint NOT NULL,
  `SCRIPT_ID` tinyint NOT NULL,
  `SCRIPT_NAME` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` bigint(20) NOT NULL DEFAULT 0,
  `VIEW_NAME` varchar(255) NOT NULL DEFAULT '',
  `CREATE_VIEW_QUERY` text DEFAULT NULL,
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT 1,
  `CREATE_UID` bigint(20) NOT NULL DEFAULT 1,
  `MODIFY_DATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CREATE_DATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`ID`),
  UNIQUE KEY `views_view_name_module_id_idx` (`VIEW_NAME`,`MODULE_ID`),
  KEY `MODULE_ID` (`MODULE_ID`),
  KEY `views_ibfk_2` (`MODIFY_UID`),
  KEY `views_ibfk_3` (`CREATE_UID`),
  CONSTRAINT `views_ibfk_1` FOREIGN KEY (`MODULE_ID`) REFERENCES `modules` (`ID`),
  CONSTRAINT `views_ibfk_2` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `views_ibfk_3` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (1,14,'view_forms','','',1,1,'2020-04-18 07:31:35','2015-08-19 09:38:14'),(2,14,'view_modules','','',1,1,'2020-04-18 07:31:35','2015-08-19 09:38:14'),(3,14,'view_tables','','',1,1,'2020-04-18 07:31:35','2015-08-19 09:38:14'),(4,14,'view_permissions','','',1,1,'2020-04-18 07:31:35','2015-08-19 09:38:14'),(5,14,'view_user_roles','','',1,1,'2020-04-18 07:31:35','2015-08-19 09:38:14'),(6,21,'view_posible_display_object_elements','aa','',1,1,'2020-04-22 15:13:03','2020-04-20 09:54:26'),(7,21,'view_grids','SELECT * FROM phpapps.grids','',1,1,'2020-04-22 08:15:57','2020-04-22 08:15:57'),(8,21,'view_display_objects','aa','',1,1,'2020-04-22 15:15:09','2020-04-22 15:15:09');
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `view_actions`
--

/*!50001 DROP TABLE IF EXISTS `view_actions`*/;
/*!50001 DROP VIEW IF EXISTS `view_actions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_actions` AS select `view_forms`.`ID` AS `ID`,concat(`view_forms`.`FORM_NAME`,'_imp (',`view_forms`.`APP_NAME`,':',`view_forms`.`MODULE_NAME`,')') AS `ACTION_FILE`,'FORM' AS `ACTION_TYPE` from `view_forms` union all select `view_scripts`.`ID` AS `ID`,concat(`view_scripts`.`SCRIPT_NAME`,'_imp (',`view_scripts`.`APP_NAME`,':',`view_scripts`.`MODULE_NAME`,')') AS `ACTION_FILE`,'SCRIPT' AS `ACTION_TYPE` from `view_scripts` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_applications`
--

/*!50001 DROP TABLE IF EXISTS `view_applications`*/;
/*!50001 DROP VIEW IF EXISTS `view_applications`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_applications` AS select `app`.`ID` AS `ID`,`app`.`USER_ID` AS `USER_ID`,`app`.`APP_NAME` AS `APP_NAME`,`app`.`APP_TITLE` AS `APP_TITLE`,`app`.`APP_SCHEMA` AS `APP_SCHEMA`,`app`.`BASE_DIR` AS `BASE_DIR`,`app`.`APP_DATE` AS `APP_DATE`,`app`.`DESCRIPTION` AS `DESCRIPTION`,`app`.`MODIFY_UID` AS `MODIFY_UID`,`app`.`CREATE_UID` AS `CREATE_UID`,`app`.`MODIFY_DATE` AS `MODIFY_DATE`,`app`.`CREATE_DATE` AS `CREATE_DATE` from `applications` `app` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_display_object_elements`
--

/*!50001 DROP TABLE IF EXISTS `view_display_object_elements`*/;
/*!50001 DROP VIEW IF EXISTS `view_display_object_elements`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_display_object_elements` AS select `dsp`.`ID` AS `ID`,`dsp`.`DISPLAY_OBJECT_ID` AS `DISPLAY_OBJECT_ID`,case when `dsp`.`DISPLAY_OBJECT_TYPE_ID` = '1' then (select `l`.`NAME` from `layouts` `l` where `l`.`ID` = `dsp`.`DISPLAY_OBJECT_ID`) when `dsp`.`DISPLAY_OBJECT_TYPE_ID` = '2' then (select `s`.`SCRIPT_NAME` from `scripts` `s` where `s`.`ID` = `dsp`.`DISPLAY_OBJECT_ID`) else 'UNKNOWN OBJECT' end AS `DISPLAY_OBJECT_NAME`,`dsp`.`DISPLAY_OBJECT_TYPE_ID` AS `DISPLAY_OBJECT_TYPE_ID`,(select `ldo`.`VALUE` from `list_display_objects_types` `ldo` where `ldo`.`ID` = `dsp`.`DISPLAY_OBJECT_TYPE_ID`) AS `DISPLAY_OBJECT_TYPE`,`dsp`.`ELEMENT_ID` AS `ELEMENT_ID`,case when `dsp`.`ELEMENT_TYPE_ID` = '1' then (select `m`.`NAME` from `menus` `m` where `m`.`ID` = `dsp`.`ELEMENT_ID`) when `dsp`.`ELEMENT_TYPE_ID` = '2' then (select `ss`.`SCRIPT_NAME` from `scripts` `ss` where `ss`.`ID` = `dsp`.`ELEMENT_ID`) when `dsp`.`ELEMENT_TYPE_ID` = '3' then (select `lv`.`VARIABLE_NAME` from `layout_variables` `lv` where `lv`.`ID` = `dsp`.`ELEMENT_ID`) when `dsp`.`ELEMENT_TYPE_ID` = '4' then (select `g`.`GRID_NAME` from `grids` `g` where `g`.`ID` = `dsp`.`ELEMENT_ID`) when `dsp`.`ELEMENT_TYPE_ID` = '5' then (select `ce`.`NAME` from `custom_elements` `ce` where `ce`.`ID` = `dsp`.`ELEMENT_ID`) else 'UNKNOWN ELEMENT' end AS `ELEMENT_NAME`,`dsp`.`ELEMENT_TYPE_ID` AS `ELEMENT_TYPE_ID`,(select `lde`.`VALUE` from `list_display_elements_types` `lde` where `lde`.`ID` = `dsp`.`ELEMENT_TYPE_ID`) AS `ELEMENT_TYPE`,`dsp`.`TEMPLATE_VARIABLE_NAME` AS `TEMPLATE_VARIABLE_NAME`,`dsp`.`DESCRIPTION` AS `DESCRIPTION` from `display_object_elements` `dsp` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_forms`
--

/*!50001 DROP TABLE IF EXISTS `view_forms`*/;
/*!50001 DROP VIEW IF EXISTS `view_forms`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp852 */;
/*!50001 SET character_set_results     = cp852 */;
/*!50001 SET collation_connection      = cp852_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_forms` AS select `f`.`ID` AS `ID`,`f`.`SCRIPT_NAME` AS `FORM_NAME`,`f`.`MODULE_ID` AS `MODULE_ID`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`f`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`VALUE` AS `TABLE_SCHEMA`,`f`.`FORM_QUERY` AS `FORM_QUERY`,`f`.`FORM_PHP_DIR` AS `FORM_PHP_DIR`,`f`.`FORM_TPL_DIR` AS `FORM_TPL_DIR`,`f`.`DESCRIPTION` AS `DESCRIPTION` from ((((`scripts` `f` join `modules` `m`) join `applications` `a`) join `tables` `t`) join `list_databases` `d`) where `f`.`MODULE_ID` = `m`.`ID` and `m`.`APP_ID` = `a`.`ID` and `f`.`TABLE_ID` = `t`.`ID` and `t`.`SCHEMA_ID` = `d`.`ID` and `f`.`WEB_TYPE_ID` = '1' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_grid_columns`
--

/*!50001 DROP TABLE IF EXISTS `view_grid_columns`*/;
/*!50001 DROP VIEW IF EXISTS `view_grid_columns`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_grid_columns` AS select `gc`.`ID` AS `ID`,`gc`.`GRID_ID` AS `GRID_ID`,`g`.`GRID_NAME` AS `GRID_NAME`,`gc`.`COLUMN_ID` AS `COLUMN_ID`,`td`.`COLUMN_NAME` AS `COLUMN_NAME`,`td`.`TABLE_ID` AS `TABLE_ID`,`gc`.`ALT_COLUMN_TEXT` AS `ALT_COLUMN_TEXT`,`gc`.`LABEL` AS `LABEL`,`gc`.`ACTION` AS `ACTION` from ((`grid_columns` `gc` left join `grids` `g` on(`gc`.`GRID_ID` = `g`.`ID`)) left join `table_details` `td` on(`gc`.`COLUMN_ID` = `td`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_grids`
--

/*!50001 DROP TABLE IF EXISTS `view_grids`*/;
/*!50001 DROP VIEW IF EXISTS `view_grids`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_grids` AS select `g`.`ID` AS `ID`,`g`.`GRID_NAME` AS `GRID_NAME`,`g`.`GRID_TITLE` AS `GRID_TITLE`,`g`.`GRID_TYPE` AS `GRID_TYPE_ID`,(select `lgt`.`VALUE` from `list_grid_types` `lgt` where `lgt`.`ID` = `g`.`GRID_TYPE`) AS `GRID_TYPE`,`g`.`TABLE_ID` AS `TABLE_ID`,`g`.`QUERY_ID` AS `QUERY_ID`,`g`.`EDITABLE` AS `EDITABLE`,`g`.`FILTERABLE` AS `FILTERABLE`,`g`.`PAGINABLE` AS `PAGINABLE`,`g`.`SORTABLE` AS `SORTABLE`,`g`.`EXPORTABLE` AS `EXPORTABLE`,`g`.`EDIT_FORM_ID` AS `EDIT_FORM_ID`,`g`.`ROWS_ON_PAGE` AS `ROWS_ON_PAGE`,`g`.`ELEMENT_TEMPLATE_ID` AS `ELEMENT_TEMPLATE_ID`,`s`.`FORM_NAME` AS `EDIT_FORM_FILE_NAME`,`g`.`ELEMENT_TEMPLATE_ID` AS `TEMPLATE_ID`,`tp`.`TEMPLATE_NAME` AS `TEMPLATE_NAME`,`tp`.`APP_NAME` AS `APP_NAME`,concat(`t`.`TABLE_SCHEMA`,'.',`t`.`TABLE_NAME`) AS `TABLE_NAME` from (((`grids` `g` left join `view_forms` `s` on(`s`.`ID` = `g`.`EDIT_FORM_ID`)) left join `view_tables` `t` on(`g`.`TABLE_ID` = `t`.`ID`)) left join `view_templates` `tp` on(`tp`.`ID` = `g`.`ELEMENT_TEMPLATE_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_layouts`
--

/*!50001 DROP TABLE IF EXISTS `view_layouts`*/;
/*!50001 DROP VIEW IF EXISTS `view_layouts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_layouts` AS select `l`.`ID` AS `ID`,`l`.`NAME` AS `NAME`,`l`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`l`.`DESCRIPTION` AS `description` from (`layouts` `l` left join `applications` `a` on(`l`.`APP_ID` = `a`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_menu_items`
--

/*!50001 DROP TABLE IF EXISTS `view_menu_items`*/;
/*!50001 DROP VIEW IF EXISTS `view_menu_items`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_menu_items` AS select `p`.`ID` AS `ID`,`p`.`PID` AS `PID`,`p`.`MENU_ID` AS `MENU_ID`,`p`.`ACTION` AS `ACTION`,`p`.`LABEL` AS `LABEL`,(select `sub`.`LABEL` from `menu_items` `sub` where `sub`.`ID` = `p`.`PID`) AS `PLABEL`,(select `sub`.`ACTION` from `menu_items` `sub` where `sub`.`ID` = `p`.`PID`) AS `PACTION` from `menu_items` `p` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_menus`
--

/*!50001 DROP TABLE IF EXISTS `view_menus`*/;
/*!50001 DROP VIEW IF EXISTS `view_menus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_menus` AS select `m`.`TEMPLATE_ID` AS `TEMPLATE_ID`,`t`.`TEMPLATE_NAME` AS `TEMPLATE_NAME`,`t`.`APP_ID` AS `APP_ID`,`t`.`APP_NAME` AS `APP_NAME`,`m`.`ID` AS `ID`,`m`.`NAME` AS `NAME`,`m`.`MENU_TITLE` AS `MENU_TITLE`,`m`.`DESCRIPTION` AS `DESCRIPTION`,`lmt`.`VALUE` AS `MENU_TYPE`,`lmt`.`ID` AS `LIST_MENU_TYPE_ID`,`lmo`.`VALUE` AS `ORIENTATION`,`lmo`.`ID` AS `LIST_MENU_ORIENTATION_ID`,`m`.`QUERY_ID` AS `QUERY_ID`,`q`.`QUERY_NAME` AS `QUERY_NAME`,`q`.`DESCRIPTION` AS `QUERY_DESCRIPTION`,`q`.`QUERY_BODY` AS `QUERY_BODY` from ((((`menus` `m` join `list_menu_types` `lmt`) join `list_menu_orientation` `lmo`) join `queries` `q`) left join `view_templates` `t` on(`m`.`TEMPLATE_ID` = `t`.`ID`)) where `m`.`MENU_TYPE` = `lmt`.`ID` and `m`.`ORIENTATION` = `lmo`.`ID` and `m`.`QUERY_ID` = `q`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_modules`
--

/*!50001 DROP TABLE IF EXISTS `view_modules`*/;
/*!50001 DROP VIEW IF EXISTS `view_modules`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_modules` AS select `m`.`ID` AS `ID`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`a`.`APP_SCHEMA` AS `APP_SCHEMA`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`m`.`MODULE_TITLE` AS `MODULE_TITLE`,`m`.`MODULE_DATE` AS `MODULE_DATE`,`a`.`APP_SCHEMA` AS `MODULE_SCHEMA`,`d`.`VALUE` AS `SCHEMA_NAME`,`m`.`DESCRIPTION` AS `DESCRIPTION`,`m`.`SCRIPT_ID` AS `SCRIPT_ID`,`s`.`SCRIPT_NAME` AS `SCRIPT_NAME` from (((`modules` `m` join `applications` `a`) join `scripts` `s`) join `list_databases` `d`) where `m`.`APP_ID` = `a`.`ID` and `a`.`APP_SCHEMA` = `d`.`ID` and `m`.`SCRIPT_ID` = `s`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_posible_display_object_elements`
--

/*!50001 DROP TABLE IF EXISTS `view_posible_display_object_elements`*/;
/*!50001 DROP VIEW IF EXISTS `view_posible_display_object_elements`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_posible_display_object_elements` AS select `menus`.`ID` AS `ID`,concat(`menus`.`NAME`,'(menu)') AS `ELEMENT_NAME`,'1' AS `ELEMENT_TYPE` from `menus` union all select `layout_variables`.`ID` AS `ID`,concat(`layout_variables`.`VARIABLE_NAME`,'(layout variable)') AS `ELEMENT_NAME`,'3' AS `ELEMENT_TYPE` from `layout_variables` union all select `grids`.`ID` AS `ID`,concat(`grids`.`GRID_NAME`,'(grid)') AS `ELEMENT_NAME`,'4' AS `ELEMENT_TYPE` from `grids` union all select `custom_elements`.`ID` AS `ID`,concat(`custom_elements`.`NAME`,'(custom_element)') AS `ELEMENT_NAME`,'5' AS `ELEMENT_TYPE` from `custom_elements` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_role_permissions`
--

/*!50001 DROP TABLE IF EXISTS `view_role_permissions`*/;
/*!50001 DROP VIEW IF EXISTS `view_role_permissions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_role_permissions` AS select `rp`.`ID` AS `ID`,`rp`.`ROLE_ID` AS `ROLE_ID`,`r`.`ROLE_NAME` AS `ROLE_NAME`,`rp`.`PERMISSION_ID` AS `PERMISSION_ID`,(select `list_permission_names`.`VALUE` AS `VALUE` from `list_permission_names` where `list_permission_names`.`ID` = `p`.`PERMISSION_NAME`) AS `PERMISSION_NAME`,`p`.`PERMISSION_NAME` AS `PERMISSION_NAME_ID`,`p`.`DESCRIPTION` AS `PERMISSION_DESC` from ((`role_permissions` `rp` join `roles` `r`) join `permissions` `p`) where `rp`.`ROLE_ID` = `r`.`ID` and `rp`.`PERMISSION_ID` = `p`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_scripts`
--

/*!50001 DROP TABLE IF EXISTS `view_scripts`*/;
/*!50001 DROP VIEW IF EXISTS `view_scripts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_scripts` AS select `s`.`ID` AS `ID`,`s`.`SCRIPT_NAME` AS `SCRIPT_NAME`,`a`.`ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`s`.`SCRIPT_TYPE_ID` AS `SCRIPT_TYPE_ID`,`s`.`DESCRIPTION` AS `DESCRIPTION`,`m`.`ID` AS `MODULE_ID`,`m`.`MODULE_NAME` AS `MODULE_NAME`,concat(`s`.`SCRIPT_NAME`,'.php') AS `FILE_NAME`,concat('phpapps_dev/',`a`.`APP_NAME`,'/',`s`.`SCRIPT_NAME`,'.php') AS `RUN_PATH` from ((`scripts` `s` join `modules` `m`) join `applications` `a`) where `s`.`MODULE_ID` = `m`.`ID` and `m`.`APP_ID` = `a`.`ID` and `s`.`WEB_TYPE_ID` = '2' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_table_details`
--

/*!50001 DROP TABLE IF EXISTS `view_table_details`*/;
/*!50001 DROP VIEW IF EXISTS `view_table_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp852 */;
/*!50001 SET character_set_results     = cp852 */;
/*!50001 SET collation_connection      = cp852_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_table_details` AS select `d`.`ID` AS `ID`,`t`.`SCHEMA_ID` AS `SCHEMA_ID`,(select `list_databases`.`VALUE` from `list_databases` where `list_databases`.`ID` = `t`.`SCHEMA_ID`) AS `TABLE_SCHEMA`,`d`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`COLUMN_NAME` AS `COLUMN_NAME`,`d`.`COLUMN_TYPE_ID` AS `COLUMN_TYPE_ID`,(select `list_mysql_column_types`.`VALUE` from `list_mysql_column_types` where `list_mysql_column_types`.`ID` = `d`.`COLUMN_TYPE_ID`) AS `COLUMN_TYPE_LABEl`,`d`.`UNSIGN` AS `UNSIGN`,`d`.`COLUMN_SIZE` AS `COLUMN_SIZE`,`d`.`ACCEPT_NULL` AS `ACCEPT_NULL`,`d`.`COLUMN_DEFAULT_VALUE` AS `COLUMN_DEFAULT_VALUE`,`d`.`AUTOINCREMENT` AS `AUTOINCREMENT`,`d`.`DESCRIPTION` AS `DESCRIPTION`,`d`.`ORD` AS `ORD`,`d`.`MODIFY_UID` AS `MODIFY_UID`,(select `users`.`USERNAME` from `users` where `users`.`ID` = `d`.`MODIFY_UID`) AS `MODIFIED_BY`,`d`.`CREATE_UID` AS `CREATE_UID`,(select `users`.`USERNAME` from `users` where `users`.`ID` = `d`.`CREATE_UID`) AS `CREATED_BY`,`d`.`MODIFY_DATE` AS `MODIFY_DATE`,`d`.`CREATE_DATE` AS `CREATE_DATE` from (`table_details` `d` left join `tables` `t` on(`d`.`TABLE_ID` = `t`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_table_fks`
--

/*!50001 DROP TABLE IF EXISTS `view_table_fks`*/;
/*!50001 DROP VIEW IF EXISTS `view_table_fks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_table_fks` AS select `fk`.`ID` AS `ID`,`fk`.`COLUMN_ID` AS `COLUMN_ID`,`td`.`COLUMN_NAME` AS `COLUMN_NAME`,`t`.`SCHEMA_ID` AS `SCHEMA_ID`,(select `list_databases`.`VALUE` from `list_databases` where `list_databases`.`ID` = `t`.`SCHEMA_ID`) AS `TABLE_SCHEMA`,`td`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`fk`.`FK_NAME` AS `FK_NAME`,`tf`.`SCHEMA_ID` AS `FK_SCHEMA_ID`,(select `list_databases`.`VALUE` from `list_databases` where `list_databases`.`ID` = `tf`.`SCHEMA_ID`) AS `FK_TABLE_SCHEMA`,`fk`.`FK_TABLE_ID` AS `FK_TABLE_ID`,`tf`.`TABLE_NAME` AS `FK_TABLE_NAME`,`fk`.`FK_COLUMN_ID` AS `FK_COLUMN_ID`,`tdf`.`COLUMN_NAME` AS `FK_COLUMN_NAME`,(select `list_foreign_key_options`.`VALUE` from `list_foreign_key_options` where `list_foreign_key_options`.`ID` = `fk`.`ON_UPDATE`) AS `ON_UPDATE`,(select `list_foreign_key_options`.`VALUE` from `list_foreign_key_options` where `list_foreign_key_options`.`ID` = `fk`.`ON_DELETE`) AS `ON_DELETE`,`fk`.`DESCRIPTION` AS `DESCRIPTION` from ((((`table_fks` `fk` left join `table_details` `td` on(`fk`.`COLUMN_ID` = `td`.`ID`)) left join `tables` `t` on(`td`.`TABLE_ID` = `t`.`ID`)) left join `tables` `tf` on(`fk`.`FK_TABLE_ID` = `tf`.`ID`)) left join `table_details` `tdf` on(`fk`.`FK_COLUMN_ID` = `tdf`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_table_indexes`
--

/*!50001 DROP TABLE IF EXISTS `view_table_indexes`*/;
/*!50001 DROP VIEW IF EXISTS `view_table_indexes`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_table_indexes` AS select `ti`.`ID` AS `ID`,`t`.`SCHEMA_ID` AS `SCHEMA_ID`,(select `list_databases`.`VALUE` from `list_databases` where `list_databases`.`ID` = `t`.`SCHEMA_ID`) AS `TABLE_SCHEMA`,`ti`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`ti`.`INDEX_NAME` AS `INDEX_NAME`,`ti`.`INDEX_TYPE_ID` AS `INDEX_TYPE_ID`,(select `list_index_types`.`VALUE` from `list_index_types` where `list_index_types`.`ID` = `ti`.`INDEX_TYPE_ID`) AS `INDEX_TYPE`,`ti`.`INDEX_COLUMNS` AS `INDEX_COLUMNS`,`ti`.`DESCRIPTION` AS `DESCRIPTION`,`ti`.`MODIFY_UID` AS `MODIFY_UID`,`ti`.`CREATE_UID` AS `CREATE_UID`,`ti`.`MODIFY_DATE` AS `MODIFY_DATE`,`ti`.`CREATE_DATE` AS `CREATE_DATE` from (`table_indexes` `ti` left join `tables` `t` on(`ti`.`TABLE_ID` = `t`.`ID`)) where `t`.`ORIGIN_ID` = '0' */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_tables`
--

/*!50001 DROP TABLE IF EXISTS `view_tables`*/;
/*!50001 DROP VIEW IF EXISTS `view_tables`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_tables` AS select `t`.`ID` AS `ID`,`t`.`ORIGIN_ID` AS `ORIGIN_ID`,(select `ggg`.`MODULE_ID` from `tables` `ggg` where `ggg`.`ID` = `t`.`ORIGIN_ID`) AS `ORIGIN_MODULE_ID`,`t`.`TABLE_TYPE` AS `TABLE_TYPE`,`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where `list_databases`.`ID` = `t`.`SCHEMA_ID`) AS `TABLE_SCHEMA`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`VALUE` AS `APP_SCHEMA`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`t`.`MODULE_ID` AS `MODULE_ID`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`t`.`DESCRIPTION` AS `DESCRIPTION` from ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on(`t`.`TABLE_TYPE` = `ty`.`ID`)) where `t`.`MODULE_ID` = `m`.`ID` and `m`.`APP_ID` = `a`.`ID` and `a`.`APP_SCHEMA` = `d`.`ID` order by `t`.`ID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_templates`
--

/*!50001 DROP TABLE IF EXISTS `view_templates`*/;
/*!50001 DROP VIEW IF EXISTS `view_templates`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_templates` AS select `t`.`ID` AS `ID`,`t`.`TEMPLATE_NAME` AS `TEMPLATE_NAME`,`t`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`t`.`DESCRIPTION` AS `DESCRIPTION`,`t`.`ELEMENT_TYPE_ID` AS `ELEMENT_TYPE_ID`,(select `ldet`.`VALUE` from `list_template_types` `ldet` where `t`.`ELEMENT_TYPE_ID` = `ldet`.`ID`) AS `ELEMENT_TYPE` from (`templates` `t` left join `applications` `a` on(`a`.`ID` = `t`.`APP_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_profiles`
--

/*!50001 DROP TABLE IF EXISTS `view_user_profiles`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_profiles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_profiles` AS select `up`.`ID` AS `ID`,`up`.`USER_ID` AS `USER_ID`,`up`.`SCRIPT_ID` AS `SCRIPT_ID`,`up`.`PROFILE_NAME` AS `PROFILE_NAME`,`up`.`THEME_ID` AS `THEME_ID`,`up`.`MODIFY_UID` AS `MODIFY_UID`,`up`.`CREATE_UID` AS `CREATE_UID`,`up`.`MODIFY_DATE` AS `MODIFY_DATE`,`up`.`CREATE_DATE` AS `CREATE_DATE`,`t`.`THEME_NAME` AS `THEME_NAME`,`t`.`CSS_FILE` AS `CSS_FILE`,`s`.`SCRIPT_NAME` AS `SCRIPT_NAME` from ((`user_profiles` `up` left join `themes` `t` on(`up`.`THEME_ID` = `t`.`ID`)) left join `scripts` `s` on(`up`.`SCRIPT_ID` = `s`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_roles`
--

/*!50001 DROP TABLE IF EXISTS `view_user_roles`*/;
/*!50001 DROP VIEW IF EXISTS `view_user_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_roles` AS select 1 AS `ID`,1 AS `UID`,1 AS `USERNAME`,1 AS `ROLE_ID`,1 AS `ROLE_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_users`
--

/*!50001 DROP TABLE IF EXISTS `view_users`*/;
/*!50001 DROP VIEW IF EXISTS `view_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_users` AS select `u`.`ID` AS `ID`,`u`.`USERNAME` AS `USERNAME`,`u`.`PASSWORD` AS `PASSWORD`,`u`.`FIRSTNAME` AS `FIRSTNAME`,`u`.`LASTNAME` AS `LASTNAME`,`u`.`EMAIL` AS `EMAIL`,`u`.`USER_TYPE` AS `USER_TYPE`,`u`.`DESCRIPTION` AS `DESCRIPTION`,`u`.`PROFILE_ID` AS `PROFILE_ID`,`up`.`PROFILE_NAME` AS `PROFILE_NAME`,`up`.`SCRIPT_ID` AS `SCRIPT_ID`,`s`.`SCRIPT_NAME` AS `SCRIPT_NAME` from ((`users` `u` join `user_profiles` `up`) join `scripts` `s`) where `u`.`PROFILE_ID` = `up`.`ID` and `up`.`SCRIPT_ID` = `s`.`ID` */;
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

-- Dump completed on 2020-05-01 21:59:38
