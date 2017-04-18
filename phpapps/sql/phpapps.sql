-- MySQL dump 10.16  Distrib 10.1.21-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: localhost
-- ------------------------------------------------------
-- Server version	10.1.21-MariaDB

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES (1,1,'phpapps','Admin PHP Applications','3','.','2016-03-12','Admin PHP Applications',1,1,'2016-09-24 08:42:20','0000-00-00 00:00:00'),(7,1,'eshop_template','E-Shop Template','7','..','0000-00-00','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,1,'php_quiz','PHP Quiz','12','.','2017-02-22','aa',1,1,'2017-02-21 11:06:36','2017-02-21 11:06:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form_details`
--

LOCK TABLES `form_details` WRITE;
/*!40000 ALTER TABLE `form_details` DISABLE KEYS */;
INSERT INTO `form_details` VALUES (58,47,'ID','bigint(20)',1,'ID',0,'text','','',''),(59,47,'USER_ID','bigint(20)',0,'User',1,'select_table','','phpapps.users','USERNAME'),(60,47,'APP_NAME','varchar(20)',0,'Application name',1,'text','','',''),(61,47,'APP_TITLE','varchar(255)',0,'Application title',0,'text','','',''),(62,47,'APP_SCHEMA','varchar(20)',0,'Application database',0,'select_list','phpapps.list_databases','',''),(63,47,'BASE_DIR','varchar(20)',0,'Application Directory',0,'text','','',''),(64,47,'APP_DATE','date',0,'APP_DATE',0,'date','','',''),(65,47,'DESCRIPTION','varchar(255)',0,'Description',0,'textarea','','',''),(77,54,'ID','bigint(20)',1,'ID',0,'text','','',''),(78,54,'PID','bigint(20)',0,'PID',1,'select_table','','categories','NAME'),(79,54,'NAME','varchar(20)',0,'NAME',0,'text','','',''),(80,54,'TITLE','varchar(255)',0,'TITLE',0,'text','','',''),(81,54,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'text','','',''),(129,60,'ID','bigint(20)',1,'ID',0,'text','','',''),(130,60,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'hidden','','',''),(131,60,'SCRIPT_TYPE','bigint(20)',0,'SCRIPT_TYPE',0,'select_list','list_script_types','',''),(132,60,'SCRIPT_NAME','varchar(255)',0,'SCRIPT_NAME',1,'text','','',''),(133,60,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(159,65,'ID','bigint(20)',1,'ID',0,'text','','',''),(160,65,'APP_ID','bigint(20)',0,'APP_ID',1,'hidden','','',''),(161,65,'SCRIPT_ID','bigint(20)',0,'START SCRIPT',1,'select_table','','phpapps.scripts','SCRIPT_NAME'),(162,65,'MODULE_NAME','varchar(20)',0,'MODULE NAME',1,'text','','',''),(163,65,'MODULE_TITLE','varchar(255)',0,'MODULE TITLE',0,'text','','',''),(164,65,'MODULE_DATE','date',0,'MODULE_DATE',0,'hidden','','',''),(165,65,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(166,66,'ID','bigint(20)',1,'ID',0,'text','','',''),(167,66,'ROLE_NAME','varchar(255)',0,'ROLE_NAME',1,'text','','',''),(168,66,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(175,69,'ID','bigint(20)',1,'ID',0,'text','','',''),(176,69,'UID','bigint(20)',0,'UID',1,'hidden','','',''),(177,69,'ROLE_ID','bigint(20)',0,'ROLE_ID',1,'select_table','','roles','ROLE_NAME'),(188,72,'ID','bigint(20)',1,'ID',0,'text','','',''),(189,72,'PERMISSION_NAME','varchar(255)',0,'PERMISSION_NAME',1,'select_list','list_permission_names','',''),(190,72,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(191,72,'PERMISSION_TYPE','bigint(20)',0,'PERMISSION_TYPE',1,'select_list','list_permission_types','',''),(192,72,'OBJECT_TYPE','bigint(20)',0,'OBJECT_TYPE',1,'select_list','list_object_types','',''),(193,72,'OBJECT_ID','bigint(20)',0,'OBJECT_ID',1,'hidden','','',''),(209,76,'ID','bigint(20)',1,'ID',0,'text','','',''),(210,76,'ROLE_ID','bigint(20)',0,'ROLE_ID',1,'select_table','','roles','ROLE_NAME'),(211,76,'PERMISSION_ID','bigint(20)',0,'PERMISSION_ID',1,'select_table','','view_permissions','DESCRIPTION'),(246,84,'ID','bigint(20)',1,'ID',0,'text','','',''),(247,84,'USERNAME','varchar(255)',0,'USERNAME',1,'text','','',''),(248,84,'PASSWORD','varchar(255)',0,'PASSWORD',0,'text','','',''),(249,84,'FIRSTNAME','varchar(255)',0,'FIRSTNAME',0,'text','','',''),(250,84,'LASTNAME','varchar(255)',0,'LASTNAME',0,'text','','',''),(251,84,'EMAIL','varchar(255)',0,'EMAIL',0,'text','','',''),(252,84,'USER_TYPE','bigint(20)',0,'USER_TYPE',0,'select_list','list_user_types','',''),(253,84,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(254,84,'PROFILE_ID','bigint(20)',0,'PROFILE_ID',0,'select_table','','user_profiles','PROFILE_NAME'),(255,84,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(256,84,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(257,84,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(258,84,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(259,85,'ID','bigint(20)',1,'ID',0,'text','','',''),(260,85,'SCRIPT_ID','bigint(20)',0,'SCRIPT_ID',0,'select_table','','scripts','SCRIPT_NAME'),(261,85,'PROFILE_NAME','varchar(255)',0,'PROFILE_NAME',1,'text','','',''),(262,85,'THEME','bigint(10)',0,'THEME',0,'text','','',''),(263,85,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(264,85,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(265,85,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(266,85,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(366,95,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(367,95,'MODULE_ID','bigint(20)',0,'MODULE',0,'select_table','','modules','MODULE_NAME'),(368,95,'FORM_NAME','varchar(255)',0,'FORM_NAME',0,'text','','',''),(369,95,'TABLE_ID','bigint(20)',0,'TABLE',0,'select_table','','tables','TABLE_NAME'),(370,95,'FORM_QUERY','varchar(255)',0,'FORM_QUERY',0,'text','','',''),(371,95,'FORM_PHP_DIR','varchar(20)',0,'FORM_PHP_DIR',0,'text','','',''),(372,95,'FORM_TPL_DIR','varchar(20)',0,'FORM_TPL_DIR',0,'text','','',''),(373,95,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'text','','',''),(374,95,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(375,95,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(376,95,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(377,95,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(378,84,'ID','bigint(20)',1,'ID',0,'text','','',''),(379,84,'USERNAME','varchar(255)',0,'USERNAME',1,'text','','',''),(380,84,'PASSWORD','varchar(255)',0,'PASSWORD',0,'text','','',''),(381,84,'FIRSTNAME','varchar(255)',0,'FIRSTNAME',0,'text','','',''),(382,84,'LASTNAME','varchar(255)',0,'LASTNAME',0,'text','','',''),(383,84,'EMAIL','varchar(255)',0,'EMAIL',0,'text','','',''),(384,84,'USER_TYPE','bigint(20)',0,'USER_TYPE',1,'select_list','list_user_types','',''),(385,84,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(386,84,'PROFILE_ID','bigint(20)',0,'PROFILE_ID',0,'text','','',''),(387,84,'MODIFY_UID','bigint(20)',0,'MODIFY_UID',0,'text','','',''),(388,84,'CREATE_UID','bigint(20)',0,'CREATE_UID',0,'text','','',''),(389,84,'MODIFY_DATE','timestamp',0,'MODIFY_DATE',0,'text','','',''),(390,84,'CREATE_DATE','timestamp',0,'CREATE_DATE',0,'text','','',''),(407,100,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(408,100,'VALUE','varchar(20)',0,'VALUE',1,'text','','',''),(409,100,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(410,101,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(411,101,'COLUMN_TYPE_ID','bigint(20)',0,'COLUMN_TYPE_ID',0,'select_list','list_mysql_column_types','',''),(412,101,'DEF_TPL','varchar(255)',0,'DEF_TPL',0,'textarea','','',''),(413,101,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(419,103,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(420,103,'DBMS_TYPE_ID','bigint(20)',0,'DBMS_TYPE_ID',1,'select_list','list_dbms_types','',''),(421,103,'SINTAX_TYPE_ID','bigint(20)',0,'SINTAX_TYPE_ID',1,'select_list','list_sql_sintax_types','',''),(422,103,'DEF_TPL','text',0,'DEF_TPL',0,'textarea','','',''),(423,103,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(435,105,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(436,105,'ORIGIN_ID','bigint(20)',0,'ORIGIN_ID',0,'hidden','','',''),(437,105,'MODULE_ID','bigint(20)',0,'MODULE_ID',0,'hidden','','',''),(438,105,'SCHEMA_ID','bigint(20)',0,'SCHEMA_ID',0,'hidden','','',''),(439,105,'TABLE_NAME','varchar(255)',0,'LIST_NAME',0,'text','','',''),(440,105,'TABLE_TYPE','bigint(20)',0,'TABLE_TYPE',0,'hidden','','',''),(441,105,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(442,105,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(443,105,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(444,105,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(445,105,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(457,107,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(458,107,'ORIGIN_ID','bigint(20)',0,'ORIGIN_ID',0,'hidden','','',''),(459,107,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'hidden','','',''),(460,107,'SCHEMA_ID','bigint(20)',0,'SCHEMA_ID',1,'hidden','','',''),(461,107,'TABLE_NAME','varchar(255)',0,'TABLE_NAME',1,'text','','',''),(462,107,'TABLE_TYPE','bigint(20)',0,'TABLE_TYPE',1,'select_list','list_table_types','',''),(463,107,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(464,107,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(465,107,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(466,107,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(467,107,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(546,114,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(547,114,'TABLE_ID','bigint(20)',0,'TABLE_ID',1,'select_table','','tables','TABLE_NAME'),(548,114,'COLUMN_NAME','varchar(255)',0,'COLUMN_NAME',1,'text','','',''),(549,114,'COLUMN_TYPE_ID','bigint(20)',0,'COLUMN_TYPE_ID',1,'select_list','list_mysql_column_types','',''),(550,114,'UNSIGN','tinyint(3) unsigned',0,'UNSIGN',1,'select_list','list_no_yes','',''),(551,114,'COLUMN_SIZE','bigint(20)',0,'COLUMN_SIZE',0,'text','','',''),(552,114,'ACCEPT_NULL','tinyint(3) unsigned',0,'ACCEPT_NULL',1,'select_list','list_no_yes','',''),(553,114,'COLUMN_DEFAULT_VALUE','varchar(255)',0,'COLUMN_DEFAULT_VALUE',0,'text','','',''),(554,114,'AUTOINCREMENT','tinyint(3) unsigned',0,'AUTOINCREMENT',1,'select_list','list_no_yes','',''),(555,114,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(556,114,'ORD','smallint(5) unsigned',0,'ORD',0,'text','','',''),(557,114,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(558,114,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(559,114,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(560,114,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(561,115,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(562,115,'TABLE_ID','bigint(20)',0,'TABLE_ID',0,'hidden','','',''),(563,115,'COLUMN_NAME','varchar(255)',0,'COLUMN_NAME',1,'text','','',''),(564,115,'COLUMN_TYPE_ID','bigint(20)',0,'COLUMN_TYPE_ID',1,'select_list','list_mysql_column_types','',''),(565,115,'UNSIGN','tinyint(3) unsigned',0,'UNSIGN',1,'select_list','list_no_yes','',''),(566,115,'COLUMN_SIZE','bigint(20)',0,'COLUMN_SIZE',0,'text','','',''),(567,115,'ACCEPT_NULL','tinyint(3) unsigned',0,'ACCEPT_NULL',1,'select_list','list_no_yes','',''),(568,115,'COLUMN_DEFAULT_VALUE','varchar(255)',0,'COLUMN_DEFAULT_VALUE',0,'text','','',''),(569,115,'AUTOINCREMENT','tinyint(3) unsigned',0,'AUTOINCREMENT',1,'select_list','list_no_yes','',''),(570,115,'DESCRIPTION','varchar(255)',0,'DESCRIPTION',0,'textarea','','',''),(571,115,'ORD','smallint(5) unsigned',1,'ORD',0,'text','','',''),(572,115,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(573,115,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(574,115,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(575,115,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(588,117,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(589,117,'COLUMN_ID','bigint(20)',0,'COLUMN_ID',1,'select_table','','table_details','COLUMN_NAME'),(590,117,'FK_NAME','varchar(255)',0,'FK_NAME',1,'hidden','','',''),(591,117,'FK_TABLE_ID','bigint(20)',0,'FK_TABLE_ID',1,'select_table','','tables','TABLE_NAME'),(592,117,'FK_COLUMN_ID','bigint(20)',0,'FK_COLUMN_ID',0,'hidden','','',''),(593,117,'ON_UPDATE','bigint(20)',0,'ON_UPDATE',0,'select_list','list_foreign_key_options','',''),(594,117,'ON_DELETE','bigint(20)',0,'ON_DELETE',0,'select_list','list_foreign_key_options','',''),(595,117,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(596,117,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(597,117,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(598,117,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(599,117,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(600,118,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(601,118,'TABLE_ID','bigint(20)',0,'TABLE_ID',1,'select_table','','tables','TABLE_NAME'),(602,118,'INDEX_NAME','varchar(255)',0,'INDEX_NAME',1,'text','','',''),(603,118,'INDEX_TYPE','bigint(20)',0,'INDEX_TYPE',1,'select_list','list_index_types','',''),(604,118,'INDEX_COLUMNS','varchar(255)',0,'INDEX_COLUMNS',1,'select_table','','table_details','COLUMN_NAME'),(605,118,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(606,118,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(607,118,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(608,118,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(609,118,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(610,119,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(611,119,'TABLE_ID','bigint(20)',0,'TABLE_ID',1,'hidden','','',''),(612,119,'INDEX_NAME','varchar(255)',0,'INDEX_NAME',1,'hidden','','',''),(613,119,'INDEX_TYPE_ID','bigint(20)',0,'INDEX_TYPE_ID',1,'select_list','list_index_types','',''),(614,119,'INDEX_COLUMNS','varchar(255)',0,'INDEX_COLUMNS',1,'select_table_multiple','','table_details','COLUMN_NAME'),(615,119,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(616,119,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(617,119,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(618,119,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(619,119,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(620,120,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(621,120,'ORIGIN_ID','bigint(20)',0,'ORIGIN_ID',0,'hidden','','',''),(622,120,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'hidden','','',''),(623,120,'SCHEMA_ID','bigint(20)',0,'SCHEMA_ID',1,'hidden','','',''),(624,120,'TABLE_NAME','varchar(255)',0,'TABLE_NAME',1,'select_table','','tables','TABLE_NAME'),(625,120,'TABLE_TYPE','bigint(20)',0,'TABLE_TYPE',1,'hidden','','',''),(626,120,'DESCRIPTION','varchar(255)',1,'DESCRIPTION',0,'text','','',''),(627,120,'MODIFY_UID','bigint(20)',1,'MODIFY_UID',0,'text','','',''),(628,120,'CREATE_UID','bigint(20)',1,'CREATE_UID',0,'text','','',''),(629,120,'MODIFY_DATE','timestamp',1,'MODIFY_DATE',0,'text','','',''),(630,120,'CREATE_DATE','timestamp',1,'CREATE_DATE',0,'text','','',''),(631,121,'ID','bigint(20)',0,'ID',0,'hidden','','',''),(632,121,'MODULE_ID','bigint(20)',0,'MODULE_ID',1,'hidden','','',''),(633,121,'QUERY','text',0,'QUERY',1,'textarea','','',''),(634,121,'DESCRIPTION','text',0,'DESCRIPTION',0,'textarea','','',''),(663,125,'ID','bigint(20)',1,'ID',0,'text','','',''),(664,125,'NO','bigint(10)',0,'NO',1,'text','','',''),(665,125,'CATEG_ID','bigint(20)',0,'CATEG_ID',1,'select_table','','php_quiz.categories','NAME'),(666,125,'QUESTION','text',0,'QUESTION',1,'textarea','','',''),(667,125,'ANSWER_1','text',0,'ANSWER_1',0,'textarea','','',''),(668,125,'CORRECT_1','bigint(1)',0,'CORRECT_1',0,'select_list','php_quiz.list_da_nu','',''),(669,125,'IMAGE_1','varchar(255)',1,'IMAGE_1',0,'text','','',''),(670,125,'ANSWER_2','text',0,'ANSWER_2',0,'textarea','','',''),(671,125,'CORRECT_2','bigint(1)',0,'CORRECT_2',0,'select_list','php_quiz.list_da_nu','',''),(672,125,'IMAGE_2','varchar(255)',1,'IMAGE_2',0,'text','','',''),(673,125,'ANSWER_3','text',0,'ANSWER_3',0,'textarea','','',''),(674,125,'CORRECT_3','bigint(1)',0,'CORRECT_3',0,'select_list','php_quiz.list_da_nu','',''),(675,125,'IMAGE_3','varchar(255)',1,'IMAGE_3',0,'text','','',''),(676,125,'ANSWER_4','text',0,'ANSWER_4',0,'textarea','','',''),(677,125,'CORRECT_4','bigint(1)',0,'CORRECT_4',0,'select_list','php_quiz.list_da_nu','',''),(678,125,'IMAGE_4','varchar(255)',1,'IMAGE_4',0,'text','','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forms`
--

LOCK TABLES `forms` WRITE;
/*!40000 ALTER TABLE `forms` DISABLE KEYS */;
INSERT INTO `forms` VALUES (47,1,'phpapps_admin_applications_form',2,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(54,10,'eshop_admin_categories_form',80,'','..\\eshop_template','..\\eshop_template','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(60,1,'phpapps_admin_scripts_form',83,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(65,1,'phpapps_admin_modules_form',3,'','.\\phpapps','.\\phpapps','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(66,7,'phpapps_users_roles_form',88,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(69,7,'phpapps_users_user_roles_form',90,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(72,7,'phpapps_users_permissions_form',89,'','.','.','',1,1,'2016-09-21 11:49:58','0000-00-00 00:00:00'),(76,7,'phpapps_users_role_permissions_form',91,'','.','.','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(84,7,'phpapps_users_users_form',87,'','D:\\linuxport\\Apache2','D:\\linuxport\\Apache2','',1,1,'2015-08-19 09:47:14','2015-08-19 09:47:14'),(85,7,'phpapps_users_user_profiles_form',99,'','D:\\linuxport\\Apache2','D:\\linuxport\\Apache2','',1,1,'2015-08-19 11:48:51','2015-08-19 11:48:51'),(95,1,'phpapps_admin_forms_form',5,'','D:\\\\linuxport\\\\work\\','D:\\\\linuxport\\\\work\\','',1,1,'2016-09-21 11:37:03','2016-09-21 11:37:03'),(100,14,'phpapps_database_list_form',210,'','D:\\\\linuxport\\\\work\\','D:\\\\linuxport\\\\work\\','',1,1,'2016-09-21 14:57:13','2016-09-21 14:57:13'),(101,14,'phpapps_database_mysql_column_defs_form',222,'','/var/www/html/phpapp','/var/www/html/phpapp','',1,1,'2016-09-24 05:10:00','2016-09-24 05:10:00'),(103,14,'phpapps_database_sql_sintax_form',224,'','D:/linuxport/work/ww','D:/linuxport/work/ww','',1,1,'2016-09-26 06:31:40','2016-09-26 06:31:40'),(105,14,'phpapps_database_lists_form',197,'','D:/linuxport/work/ww','D:/linuxport/work/ww','',1,1,'2016-09-27 09:52:59','2016-09-27 09:52:59'),(107,14,'phpapps_database_tables_form',197,'','D:/linuxport/work/ww','D:/linuxport/work/ww','',1,1,'2016-09-28 08:58:39','2016-09-28 08:58:39'),(114,14,'phpapps_database_table_details_form',198,'','D:/linuxport/work/ww','D:/linuxport/work/ww','',1,1,'2016-09-30 08:29:05','2016-09-30 08:29:05'),(115,14,'phpapps_database_table_details_DDL_form',198,'','D:/linuxport/work/ww','D:/linuxport/work/ww','',1,1,'2016-09-30 08:33:22','2016-09-30 08:33:22'),(117,14,'phpapps_database_table_fks_DDL_form',276,'','D:/linuxport/work/ww','D:/linuxport/work/ww','',1,1,'2016-10-06 06:26:04','2016-10-03 07:46:58'),(118,14,'phpapps_database_table_indexes_form',279,'','D:/linuxport/work/ww','D:/linuxport/work/ww','',1,1,'2016-10-03 10:53:46','2016-10-03 10:53:46'),(119,14,'phpapps_database_table_indexes_DDL_form',279,'','D:/linuxport/work/ww','D:/linuxport/work/ww','',1,1,'2016-10-03 12:02:10','2016-10-03 12:02:10'),(120,14,'phpapps_database_add_table_form',197,'','D:/linuxport/work/ww','D:/linuxport/work/ww','',1,1,'2016-10-11 09:04:57','2016-10-11 09:04:57'),(121,14,'phpapps_database_queries_form',281,'','D:/linuxport/work/ww','D:/linuxport/work/ww','',1,1,'2016-10-11 09:28:54','2016-10-11 09:28:54'),(125,15,'php_quiz_questions_questions_form',284,'','D:/linuxport/work/ww','D:/linuxport/work/ww','',1,1,'2017-02-27 08:06:39','2017-02-27 08:06:39');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_databases`
--

LOCK TABLES `list_databases` WRITE;
/*!40000 ALTER TABLE `list_databases` DISABLE KEYS */;
INSERT INTO `list_databases` VALUES (1,'mysql','mysql'),(2,'test','test'),(3,'phpapps','phpapps'),(7,'eshop',''),(10,'information_schema',''),(11,'performance_schema',''),(12,'php_quiz','');
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
  `DESCRIPTION` text,
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_mysql_column_types`
--

LOCK TABLES `list_mysql_column_types` WRITE;
/*!40000 ALTER TABLE `list_mysql_column_types` DISABLE KEYS */;
INSERT INTO `list_mysql_column_types` VALUES (1,'TINYINT','Signed: -128 <-> 127<br>\r\nUnsigned: 0 <-> 255'),(2,'SMALLINT','Signed: -32768 <-> 32767<br>\r\nUnsigned: -32768 <-> 32767'),(3,'MEDIUMINT','Signed: -8388608 <-> 8388607<br>\r\nUnsigned: 0 <-> 16777215'),(4,'INTEGER','Signed : -2147483648 <-> 2147483647<br>\r\nUnsigned: 0 <-> 4294967295'),(5,'BIGINT','Signed: -9223372036854775808 <-> 9223372036854775807<br>\r\nUnsigned: 0 <-> 18446744073709551615'),(6,'NUMERIC',''),(7,'VARCHAR',''),(8,'TEXT',''),(9,'TIMESTAMP','');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES (1,1,2,'phpapps_admin','PHPApps Admin Module','0000-00-00','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(7,1,3,'phpapps_users','PHPApps Admin Users','0000-00-00','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(8,1,2,'phpapps_lang','PHPApps Admin Languages','0000-00-00','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(10,7,2,'eshop_admin','E-Shop Admin Module','0000-00-00','',1,1,'0000-00-00 00:00:00','0000-00-00 00:00:00'),(14,1,28,'phpapps_database','PHPApps Admin Database','2016-09-21','',1,1,'2016-09-21 13:58:04','2016-09-21 07:01:06'),(15,8,33,'questions','Questions','2017-02-21','',1,1,'2017-04-18 07:08:28','2017-02-21 12:12:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mysql_column_defs`
--

LOCK TABLES `mysql_column_defs` WRITE;
/*!40000 ALTER TABLE `mysql_column_defs` DISABLE KEYS */;
INSERT INTO `mysql_column_defs` VALUES (1,5,'{$COLUMN_OBJ->COLUMN_NAME} BIGINT{if $COLUMN_OBJ->COLUMN_SIZE != \\\"\\\"}({$COLUMN_OBJ->COLUMN_SIZE}){/if} {if ! $COLUMN_OBJ->ACCEPT_NULL }NOT NULL{/if} {if $COLUMN_OBJ->DEFAULT_VAL!= \\\"\\\" } DEFAULT \\\'{if $COLUMN_OBJ->DEFAULT_VAL != \\\"EMPTY\\\"}{$COLUMN_OBJ->DEFAULT_VAL}{/if}\\\'{/if}',''),(2,7,'{$COLUMN_OBJ->COLUMN_NAME} VARCHAR ({$COLUMN_OBJ->COLUMN_SIZE}) {if $COLUMN_OBJ->ACCEPT_NULL === FALSE }NOT NULL{/if} {if $COLUMN_OBJ->DEFAULT_VAL!= \\\"\\\" } DEFAULT \\\'{if $COLUMN_OBJ->DEFAULT_VAL != \\\"EMPTY\\\"}{$COLUMN_OBJ->DEFAULT_VAL}{/if}\\\' {/if}',''),(3,8,'{$COLUMN_OBJ->COLUMN_NAME} TEXT {if $COLUMN_OBJ->ACCEPT_NULL === FALSE }NOT NULL{/if} {if $COLUMN_OBJ->DEFAULT_VAL!= \\\"\\\" } DEFAULT \\\'{if $COLUMN_OBJ->DEFAULT_VAL != \\\"EMPTY\\\"}{$COLUMN_OBJ->DEFAULT_VAL}{/if}\\\' {/if}','');
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
-- Table structure for table `queries`
--

DROP TABLE IF EXISTS `queries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queries` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` bigint(20) DEFAULT NULL,
  `QUERY_NAME` text,
  `QUERY_BODY` text,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`),
  KEY `phpapps_queries_MODULE_ID_FK` (`MODULE_ID`),
  CONSTRAINT `phpapps_queries_MODULE_ID_FK` FOREIGN KEY (`MODULE_ID`) REFERENCES `modules` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `queries`
--

LOCK TABLES `queries` WRITE;
/*!40000 ALTER TABLE `queries` DISABLE KEYS */;
/*!40000 ALTER TABLE `queries` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scripts`
--

LOCK TABLES `scripts` WRITE;
/*!40000 ALTER TABLE `scripts` DISABLE KEYS */;
INSERT INTO `scripts` VALUES (2,1,1,'phpapps_admin_module','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(3,7,1,'phpapps_users_module','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(4,7,1,'phpapps_users_generate_permissions','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(5,7,1,'phpapps_users_manage_user_roles','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(6,14,1,'sql_console','',1,1,'2016-09-30 10:21:39','2015-08-19 09:31:32'),(7,1,2,'index','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(8,7,1,'phpapps_users_manage_roles_permissions','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(10,1,2,'login','',1,1,'2015-08-19 09:31:31','2015-08-19 09:31:32'),(11,7,1,'user_home','',1,1,'2015-08-19 11:49:50','2015-08-19 11:49:50'),(12,1,1,'phpapps_admin_applications','',1,1,'2015-08-19 12:32:57','2015-08-19 12:32:57'),(19,1,1,'phpinfo','',1,1,'2016-08-30 12:51:15','2016-08-30 12:51:15'),(28,14,1,'phpapps_database_module','',1,1,'2016-09-21 13:57:52','2016-09-21 13:57:52'),(29,14,1,'phpapps_database_browse_list','',1,1,'2016-09-21 14:45:45','2016-09-21 14:45:45'),(30,14,1,'test_column_def','',1,1,'2016-09-24 05:46:29','2016-09-24 05:46:29'),(32,14,1,'phpapps_database_browse_tables','',1,1,'2016-09-30 08:37:55','2016-09-30 08:37:55'),(33,15,2,'Questions','',1,1,'2017-04-15 08:52:40','2017-02-24 10:13:40'),(34,15,2,'quiz_test','',1,1,'2017-03-01 06:24:26','2017-03-01 06:24:26');
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
  `QUERY` text,
  `RUN_SCHEMA` bigint(20) DEFAULT NULL,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `sql_console_history_users_MODIFY_UID_FK` (`MODIFY_UID`),
  KEY `sql_console_history_users_CREATE_UID_FK` (`CREATE_UID`),
  KEY `phpapps_sql_console_history_RUN_SCHEMA_FK` (`RUN_SCHEMA`),
  CONSTRAINT `phpapps_sql_console_history_RUN_SCHEMA_FK` FOREIGN KEY (`RUN_SCHEMA`) REFERENCES `list_databases` (`ID`),
  CONSTRAINT `sql_console_history_users_CREATE_UID_FK` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `sql_console_history_users_MODIFY_UID_FK` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sql_console_history`
--

LOCK TABLES `sql_console_history` WRITE;
/*!40000 ALTER TABLE `sql_console_history` DISABLE KEYS */;
INSERT INTO `sql_console_history` VALUES (1,'show tables',3,1,1,'2016-10-07 09:21:16','2016-10-07 09:21:16'),(2,'select * from  applications',3,1,1,'2016-10-07 09:21:33','2016-10-07 09:21:33'),(3,'select * from  sql_console_history',3,1,1,'2016-10-07 09:21:47','2016-10-07 09:21:47'),(4,'select * from  sql_console_history',3,1,1,'2016-10-07 09:49:11','2016-10-07 09:49:11'),(5,'select * from  sql_console_history',3,1,1,'2016-10-07 09:49:31','2016-10-07 09:49:31'),(6,'select * from  sql_console_history',3,1,1,'2016-10-07 09:49:52','2016-10-07 09:49:52'),(7,'select * from  sql_console_history',3,1,1,'2016-10-07 09:50:07','2016-10-07 09:50:07'),(8,'select * from  sql_console_history',3,1,1,'2016-10-07 09:50:23','2016-10-07 09:50:23'),(9,'select * from  sql_console_history',3,1,1,'2016-10-07 09:50:47','2016-10-07 09:50:47'),(10,'select * from  sql_console_history',3,1,1,'2016-10-07 09:50:53','2016-10-07 09:50:53'),(11,'select * from  sql_console_history',3,1,1,'2016-10-07 09:51:01','2016-10-07 09:51:01'),(12,'select * from  sql_console_history',3,1,1,'2016-10-07 09:51:11','2016-10-07 09:51:11'),(13,'select * from  sql_console_history',3,1,1,'2016-10-07 09:51:36','2016-10-07 09:51:36'),(14,'select * from  sql_console_history',3,1,1,'2016-10-07 09:53:53','2016-10-07 09:53:53'),(15,'select * from  sql_console_history',3,1,1,'2016-10-07 10:08:47','2016-10-07 10:08:47'),(16,'select * from  sql_console_history',3,1,1,'2016-10-07 10:24:33','2016-10-07 10:24:33'),(17,'select * from  sql_console_history',3,1,1,'2016-10-07 10:24:53','2016-10-07 10:24:53'),(18,'select * from  sql_console_history',3,1,1,'2016-10-07 10:25:21','2016-10-07 10:25:21'),(19,'select * from  sql_console_history',3,1,1,'2016-10-07 10:25:21','2016-10-07 10:25:21'),(20,'select * from  sql_console_history',3,1,1,'2016-10-07 10:25:23','2016-10-07 10:25:23'),(21,'select * from  sql_console_history',3,1,1,'2016-10-07 10:25:47','2016-10-07 10:25:47'),(22,'select * from  sql_console_history',3,1,1,'2016-10-07 10:25:52','2016-10-07 10:25:52'),(23,'select \r\n ti.ID,\r\nt.SCHEMA_ID,\r\n(select value from phpapps.list_databases where id = t.schema_id) as \'TABLE_SCHEMA\',\r\n ti.TABLE_ID,\r\n t.TABLE_NAME,\r\n ti.INDEX_NAME,\r\n ti.INDEX_TYPE_ID,\r\n(select value from phpapps.list_index_types where id = ti.INDEX_TYPE_ID) as INDEX_TYPE,\r\n ti.INDEX_COLUMNS,\r\n(select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE td.ID IN (ti.INDEX_COLUMNS) GROUP BY td.TABLE_ID ) as \'INDEX_COLUMNS_LABELS\',\r\n ti.DESCRIPTION,\r\n ti.MODIFY_UID,\r\n ti.CREATE_UID,\r\n ti.MODIFY_DATE,\r\n ti.CREATE_DATE\r\n from table_indexes ti left join tables t on (ti.table_id = t.id)',3,1,1,'2016-10-07 10:26:58','2016-10-07 10:26:58'),(24,'select \r\n ti.ID,\r\nt.SCHEMA_ID,\r\n(select value from phpapps.list_databases where id = t.schema_id) as \'TABLE_SCHEMA\',\r\n ti.TABLE_ID,\r\n t.TABLE_NAME,\r\n ti.INDEX_NAME,\r\n ti.INDEX_TYPE_ID,\r\n(select value from phpapps.list_index_types where id = ti.INDEX_TYPE_ID) as INDEX_TYPE,\r\n ti.INDEX_COLUMNS,\r\n(select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE td.ID IN (ti.INDEX_COLUMNS) GROUP BY td.TABLE_ID ) as \'INDEX_COLUMNS_LABELS\',\r\n ti.DESCRIPTION,\r\n ti.MODIFY_UID,\r\n ti.CREATE_UID,\r\n ti.MODIFY_DATE,\r\n ti.CREATE_DATE\r\n from table_indexes ti left join tables t on (ti.table_id = t.id)',3,1,1,'2016-10-07 10:27:17','2016-10-07 10:27:17'),(25,'show tables',7,1,1,'2016-10-07 10:45:18','2016-10-07 10:45:18'),(26,'select \r\n ti.ID,\r\nt.SCHEMA_ID,\r\n(select value from phpapps.list_databases where id = t.schema_id) as \'TABLE_SCHEMA\',\r\n ti.TABLE_ID,\r\n t.TABLE_NAME,\r\n ti.INDEX_NAME,\r\n ti.INDEX_TYPE_ID,\r\n(select value from phpapps.list_index_types where id = ti.INDEX_TYPE_ID) as INDEX_TYPE,\r\n ti.INDEX_COLUMNS,\r\n(select GROUP_CONCAT(COLUMN_NAME SEPARATOR \',\') FROM phpapps.table_details td WHERE td.ID IN (ti.INDEX_COLUMNS) GROUP BY td.TABLE_ID ) as \'INDEX_COLUMNS_LABELS\',\r\n ti.DESCRIPTION,\r\n ti.MODIFY_UID,\r\n ti.CREATE_UID,\r\n ti.MODIFY_DATE,\r\n ti.CREATE_DATE\r\n from table_indexes ti left join tables t on (ti.table_id = t.id)',NULL,1,1,'2016-10-07 10:50:57','2016-10-07 10:50:57'),(46,'select * from sql_console_history',3,1,1,'2016-10-10 13:42:55','2016-10-10 13:42:55'),(47,'show tables',7,1,1,'2016-10-10 13:43:13','2016-10-10 13:43:13'),(48,'show tables',3,1,1,'2016-10-10 13:43:56','2016-10-10 13:43:56'),(49,'select * from  sql_console_history',3,1,1,'2016-10-10 13:44:06','2016-10-10 13:44:06'),(50,'select * from  sql_console_saves',3,1,1,'2016-10-10 13:44:20','2016-10-10 13:44:20'),(51,'show tables',1,1,1,'2016-10-10 13:50:37','2016-10-10 13:50:37'),(52,'desc tables',3,1,1,'2016-10-11 08:57:59','2016-10-11 08:57:59'),(53,'select * from tables',3,1,1,'2016-10-11 09:14:39','2016-10-11 09:14:39'),(54,'show tables',3,1,1,'2016-11-07 09:25:48','2016-11-07 09:25:48'),(55,'select * from queries',3,1,1,'2016-11-07 09:26:06','2016-11-07 09:26:06'),(56,'select * from  views',3,1,1,'2016-11-07 09:33:11','2016-11-07 09:33:11'),(57,'select * from  queries',3,1,1,'2016-11-07 09:34:09','2016-11-07 09:34:09'),(58,'select * from  queries',3,1,1,'2016-11-07 09:34:30','2016-11-07 09:34:30'),(59,'SELECT TABLE_NAME FROM phpapps.tables WHERE MODULE_ID = 1 UNION ALL SELECT VIEW_NAME FROM phpapps.views WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:01:47','2017-02-21 10:01:47'),(60,'SELECT SCHEMA_NAME, TABLE_NAME FROM phpapps.tables WHERE MODULE_ID = 1 UNION ALL SELECT SCHEMA_NAME, VIEW_NAME FROM phpapps.views WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:02:22','2017-02-21 10:02:22'),(61,'SELECT SCHEMA_NAME, TABLE_NAME FROM phpapps.tables WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:02:32','2017-02-21 10:02:32'),(62,'SELECT  TABLE_NAME,* FROM phpapps.tables WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:02:39','2017-02-21 10:02:39'),(63,'SELECT  *,TABLE_NAME FROM phpapps.tables WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:02:47','2017-02-21 10:02:47'),(64,'SELECT  *,TABLE_NAME FROM phpapps.view_tables WHERE MODULE_ID = 1',3,1,1,'2017-02-21 10:03:10','2017-02-21 10:03:10'),(65,'show tables',3,1,1,'2017-02-21 10:04:36','2017-02-21 10:04:36'),(66,'select * from views',3,1,1,'2017-02-21 10:04:50','2017-02-21 10:04:50'),(67,'select * from view_tables',3,1,1,'2017-02-21 10:10:22','2017-02-21 10:10:22'),(68,'SELECT ID AS VALUE, USERNAME AS LABEL FROM phpapps.users ORDER BY USERNAME',3,1,1,'2017-02-21 10:46:42','2017-02-21 10:46:42'),(69,'show tables',3,1,1,'2017-02-21 11:01:10','2017-02-21 11:01:10'),(70,'select * from view_tables',3,1,1,'2017-02-21 11:01:27','2017-02-21 11:01:27'),(71,'SELECT COLUMN_NAME AS ID,COLUMN_NAME AS VALUE FROM phpapps.view_table_details WHERE TABLE_ID = 284 ORDER BY ORD',3,1,1,'2017-02-21 12:16:28','2017-02-21 12:16:28'),(72,'SELECT * FROM phpapps.view_table_details WHERE TABLE_ID = 284 ORDER BY ORD',3,1,1,'2017-02-21 12:16:58','2017-02-21 12:16:58'),(73,'SELECT * FROM phpapps.view_table_details',3,1,1,'2017-02-22 07:02:02','2017-02-22 07:02:02'),(74,'SELECT * FROM phpapps.view_tables',3,1,1,'2017-02-22 07:02:15','2017-02-22 07:02:15'),(75,'SELECT TABLE_SCHEMA FROM phpapps.view_tables WHERE TABLE_NAME = \'list_da_nu\' AND ORIGIN_ID = \'0\'',3,1,1,'2017-02-22 07:09:02','2017-02-22 07:09:02'),(76,'SELECT TABLE_SCHEMA FROM phpapps.view_tables WHERE TABLE_NAME = \'list_da_nu\' AND ORIGIN_ID = \'0\'',3,1,1,'2017-02-24 11:15:09','2017-02-24 11:15:09'),(77,'show tables',12,1,1,'2017-02-24 11:15:20','2017-02-24 11:15:20'),(78,'select q.NO,q.CATEG_ID,(SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION,q.ANSWER_1,q.CORRECT_1,q.IMAGE_1,q.ANSWER_2,q.CORRECT_2,q.IMAGE_2,q.ANSWER_3,\r\nq.CORRECT_3,q.IMAGE_3 from questions',12,1,1,'2017-02-24 11:34:27','2017-02-24 11:34:27'),(79,'select q.NO,q.CATEG_ID,(SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION,q.ANSWER_1,q.CORRECT_1,q.IMAGE_1,q.ANSWER_2,q.CORRECT_2,q.IMAGE_2,q.ANSWER_3,\r\nq.CORRECT_3,q.IMAGE_3 from questions q',12,1,1,'2017-02-24 11:34:36','2017-02-24 11:34:36'),(80,'SELECT q.NO, q.CATEG_ID, (SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION, q.ANSWER_1, q.CORRECT_1, q.IMAGE_1, q.ANSWER_2, q.CORRECT_2, q.IMAGE_2, q.ANSWER_3, q.CORRECT_3, q.IMAGE_3 FROM questions q ORDER BY q.CATEG_ID, q.NO',12,1,1,'2017-02-24 11:54:19','2017-02-24 11:54:19'),(81,'SELECT q.NO, q.CATEG_ID, (SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION, q.ANSWER_1, q.CORRECT_1, q.IMAGE_1, q.ANSWER_2, q.CORRECT_2, q.IMAGE_2, q.ANSWER_3, q.CORRECT_3, q.IMAGE_3 FROM questions q ORDER BY q.CATEG_ID, q.NO',12,1,1,'2017-02-24 11:54:22','2017-02-24 11:54:22'),(82,'SELECT q.NO, q.CATEG_ID, (SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION, q.ANSWER_1, q.CORRECT_1, q.IMAGE_1, q.ANSWER_2, q.CORRECT_2, q.IMAGE_2, q.ANSWER_3, q.CORRECT_3, q.IMAGE_3 FROM questions q ORDER BY q.CATEG_ID, q.NO',12,1,1,'2017-02-24 11:54:23','2017-02-24 11:54:23'),(83,'SELECT q.NO, q.CATEG_ID, (SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION, q.ANSWER_1, q.CORRECT_1, q.IMAGE_1, q.ANSWER_2, q.CORRECT_2, q.IMAGE_2, q.ANSWER_3, q.CORRECT_3, q.IMAGE_3 FROM questions q ORDER BY q.CATEG_ID, q.NO',12,1,1,'2017-02-24 11:54:24','2017-02-24 11:54:24'),(84,'SELECT q.NO, q.CATEG_ID, (SELECT c.NAME FROM categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME, q.QUESTION, q.ANSWER_1, q.CORRECT_1, q.IMAGE_1, q.ANSWER_2, q.CORRECT_2, q.IMAGE_2, q.ANSWER_3, q.CORRECT_3, q.IMAGE_3 FROM questions q ORDER BY q.CATEG_ID, q.NO',12,1,1,'2017-02-24 11:54:25','2017-02-24 11:54:25'),(85,'show tables',12,1,1,'2017-02-28 14:23:51','2017-02-28 14:23:51'),(86,'select * from questions limit 2 order by rand()',12,1,1,'2017-02-28 14:24:45','2017-02-28 14:24:45'),(87,'select * from questions  order by rand() limit 2',12,1,1,'2017-02-28 14:25:08','2017-02-28 14:25:08'),(88,'select * from questions  order by rand() limit 2',12,1,1,'2017-02-28 14:25:12','2017-02-28 14:25:12'),(89,'select * from questions  order by rand() limit 2',12,1,1,'2017-02-28 14:25:14','2017-02-28 14:25:14'),(90,'select * from questions  order by rand() limit 2',12,1,1,'2017-02-28 14:25:16','2017-02-28 14:25:16'),(91,'select * from questions  order by rand() limit 2',12,1,1,'2017-02-28 14:25:18','2017-02-28 14:25:18'),(92,'show tables;',1,1,1,'2017-04-14 06:25:31','2017-04-14 06:25:31'),(93,'show tables',3,1,1,'2017-04-14 06:25:46','2017-04-14 06:25:46'),(94,'select * from view_scripts',3,1,1,'2017-04-14 06:26:03','2017-04-14 06:26:03'),(95,'select * from scripts',3,1,1,'2017-04-14 06:26:45','2017-04-14 06:26:45'),(96,'show tables',3,1,1,'2017-04-14 06:27:03','2017-04-14 06:27:03'),(97,'show tables',3,1,1,'2017-04-14 06:29:51','2017-04-14 06:29:51'),(98,'select * from view_scripts',1,1,1,'2017-04-18 07:15:02','2017-04-18 07:15:02'),(99,'select * from view_scripts',3,1,1,'2017-04-18 07:15:11','2017-04-18 07:15:11'),(100,'select * from view_modules',3,1,1,'2017-04-18 07:16:01','2017-04-18 07:16:01');
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
  `DATABASE_ID` bigint(20) NOT NULL DEFAULT '3',
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
  `DBMS_TYPE_ID` bigint(20) NOT NULL DEFAULT '0',
  `SINTAX_TYPE_ID` bigint(20) NOT NULL DEFAULT '0',
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
  `COLUMN_TYPE_ID` bigint(20) NOT NULL DEFAULT '0',
  `UNSIGN` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `COLUMN_SIZE` bigint(20) DEFAULT NULL,
  `ACCEPT_NULL` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `COLUMN_DEFAULT_VALUE` varchar(255) NOT NULL DEFAULT '',
  `AUTOINCREMENT` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DESCRIPTION` varchar(255) NOT NULL DEFAULT '',
  `ORD` smallint(5) unsigned NOT NULL DEFAULT '0',
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `TABLE_ID` (`TABLE_ID`),
  KEY `MODIFY_UID` (`MODIFY_UID`),
  KEY `CREATE_UID` (`CREATE_UID`),
  KEY `table_details_ibfk_1` (`COLUMN_TYPE_ID`),
  CONSTRAINT `table_details_ibfk_1` FOREIGN KEY (`COLUMN_TYPE_ID`) REFERENCES `list_mysql_column_types` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `table_details_ibfk_2` FOREIGN KEY (`TABLE_ID`) REFERENCES `tables` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `table_details_ibfk_7` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `table_details_ibfk_8` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_details`
--

LOCK TABLES `table_details` WRITE;
/*!40000 ALTER TABLE `table_details` DISABLE KEYS */;
INSERT INTO `table_details` VALUES (46,197,'ID',5,0,20,0,'',0,'',0,1,1,'2016-09-30 09:57:52','2016-09-30 09:57:52'),(47,197,'ORIGIN_ID',5,0,20,0,'',0,'',1,1,1,'2016-09-30 10:07:20','2016-09-30 09:58:20'),(48,197,'MODULE_ID',5,0,20,0,'',0,'',2,1,1,'2016-09-30 10:07:20','2016-09-30 09:58:42'),(49,197,'SCHEMA_ID',5,0,20,0,'',0,'',3,1,1,'2016-09-30 10:07:20','2016-09-30 09:59:10'),(50,197,'TABLE_NAME',7,0,255,0,'',0,'',4,1,1,'2016-09-30 10:07:20','2016-09-30 09:59:48'),(51,197,'TABLE_TYPE',5,0,20,0,'',0,'',5,1,1,'2016-09-30 10:07:20','2016-09-30 10:01:21'),(52,197,'DESCRIPTION',7,0,255,0,'',0,'',6,1,1,'2016-09-30 10:07:20','2016-09-30 10:02:22'),(53,197,'MODIFY_UID',5,0,20,0,'1',0,'',7,1,1,'2016-09-30 10:07:20','2016-09-30 10:02:55'),(54,197,'CREATE_UID',5,0,20,0,'1',0,'',8,1,1,'2016-09-30 10:07:20','2016-09-30 10:03:14'),(55,197,'MODIFY_DATE',9,0,0,0,'CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP',0,'',9,1,1,'2016-09-30 10:07:20','2016-09-30 10:05:44'),(56,197,'CREATE_DATE',9,0,0,0,'CURRENT_TIMESTAMP',0,'',10,1,1,'2016-09-30 10:07:20','2016-09-30 10:06:41'),(57,275,'ID',5,0,20,0,'',1,'',0,1,1,'2016-10-03 07:09:49','2016-10-03 07:09:49'),(58,275,'MUMUSA',5,0,20,1,'',0,'',1,1,1,'2016-10-03 07:10:31','2016-10-03 07:10:31'),(59,275,'NUME',8,0,0,1,'',0,'',2,1,1,'2016-10-03 07:12:09','2016-10-03 07:11:24'),(60,276,'ID',5,0,20,1,'',1,'',0,1,1,'2016-10-03 07:29:38','2016-10-03 07:29:38'),(61,276,'COLUMN_ID',5,0,20,1,'',0,'',1,1,1,'2016-10-03 07:29:53','2016-10-03 07:29:53'),(62,276,'FK_NAME',7,0,255,1,'',0,'',2,1,1,'2016-10-03 07:30:28','2016-10-03 07:30:28'),(63,276,'FK_COLUMN_ID',5,0,20,1,'',0,'',3,1,1,'2016-10-03 07:31:08','2016-10-03 07:31:08'),(64,276,'ON_UPDATE',5,0,20,1,'',0,'',4,1,1,'2016-10-03 07:31:31','2016-10-03 07:31:31'),(65,276,'ON_DELETE',5,0,20,1,'',0,'',5,1,1,'2016-10-03 07:31:46','2016-10-03 07:31:46'),(66,276,'DESCRIPTION',8,0,0,1,'',0,'',6,1,1,'2016-10-03 07:32:07','2016-10-03 07:32:07'),(67,276,'MODIFY_UID',5,0,20,0,'1',0,'',7,1,1,'2016-10-03 07:32:28','2016-10-03 07:32:28'),(68,276,'CREATE_UID',5,0,20,0,'1',0,'',8,1,1,'2016-10-03 07:32:40','2016-10-03 07:32:40'),(69,276,'MODIFY_DATE',9,0,0,0,'CURRENT_TIMESTAMP',0,'',9,1,1,'2016-10-03 07:33:21','2016-10-03 07:33:21'),(70,276,'CREATE_DATE',9,0,0,0,'CURRENT_TIMESTAMP',0,'',9,1,1,'2016-10-03 07:33:34','2016-10-03 07:33:34'),(71,275,'VIEW_ID2',5,0,20,0,'',0,'',3,1,1,'2016-10-03 09:58:19','2016-10-03 09:25:13'),(72,279,'ID',5,0,20,0,'',0,'',0,1,1,'2016-10-03 10:21:21','2016-10-03 10:21:21'),(73,279,'TABLE_ID',5,0,20,0,'',0,'',1,1,1,'2016-10-03 10:22:16','2016-10-03 10:22:16'),(74,279,'INDEX_NAME',7,0,255,0,'',0,'',2,1,1,'2016-10-03 10:22:46','2016-10-03 10:22:46'),(75,279,'DESCRIPTION',8,0,0,1,'',0,'',5,1,1,'2016-10-03 10:30:22','2016-10-03 10:23:12'),(76,279,'INDEX_COLUMNS',7,0,255,0,'ID',0,'',4,1,1,'2016-10-03 13:59:35','2016-10-03 10:27:53'),(77,279,'INDEX_TYPE_ID',5,0,20,0,'',0,'',3,1,1,'2016-10-03 11:50:18','2016-10-03 10:30:22'),(78,275,'GOGU',5,1,15,1,'',0,'',4,1,1,'2016-10-06 09:17:30','2016-10-06 09:13:04'),(79,280,'ID',5,0,20,0,'',0,'',0,1,1,'2016-10-07 07:59:53','2016-10-07 07:59:53'),(80,280,'QUERY',8,0,0,1,'',0,'',1,1,1,'2016-10-07 08:02:45','2016-10-07 08:02:45'),(81,280,'RUN_SCHEMA',5,0,20,0,'',0,'',2,1,1,'2016-10-07 08:04:08','2016-10-07 08:04:08'),(82,281,'ID',5,0,20,0,'',0,'',0,1,1,'2016-10-11 08:55:57','2016-10-11 08:55:57'),(83,281,'MODULE_ID',5,0,20,0,'',0,'',1,1,1,'2016-10-11 08:56:40','2016-10-11 08:56:40'),(84,281,'QUERY_NAME',8,0,0,0,'',0,'',2,1,1,'2016-11-07 09:37:00','2016-10-11 09:17:02'),(86,281,'DESCRIPTION',8,0,0,1,'',0,'',4,1,1,'2016-11-07 09:37:42','2016-10-11 09:26:28'),(87,281,'QUERY_BODY',8,0,0,0,'',0,'',3,1,1,'2016-11-07 09:37:42','2016-11-07 09:37:42'),(88,284,'ID',5,0,20,0,'',0,'',0,1,1,'2017-02-21 12:13:35','2017-02-21 12:13:35'),(89,284,'NO',5,0,10,0,'0',0,'',1,1,1,'2017-02-21 12:19:22','2017-02-21 12:17:48'),(90,284,'QUESTION',8,0,255,0,'',0,'',3,1,1,'2017-02-23 08:24:02','2017-02-21 12:19:10'),(91,284,'ANSWER_1',8,0,255,0,'',0,'',4,1,1,'2017-02-23 08:24:02','2017-02-21 12:20:05'),(92,284,'ANSWER_2',8,0,255,0,'',0,'',7,1,1,'2017-02-23 08:24:02','2017-02-21 12:21:11'),(93,284,'ANSWER_3',8,0,255,0,'',0,'',10,1,1,'2017-02-23 08:24:02','2017-02-21 12:21:30'),(94,284,'IMAGE_1',7,0,255,0,'',0,'',6,1,1,'2017-02-23 08:24:02','2017-02-21 12:29:14'),(95,284,'IMAGE_2',7,0,255,0,'',0,'',9,1,1,'2017-02-23 08:24:02','2017-02-21 12:32:13'),(96,284,'IMAGE_3',7,0,255,0,'',0,'',12,1,1,'2017-02-23 08:24:02','2017-02-21 12:32:32'),(97,284,'CORRECT_1',5,0,1,0,'',0,'',5,1,1,'2017-02-23 08:24:02','2017-02-21 13:13:14'),(98,284,'CORRECT_2',5,0,1,0,'',0,'',8,1,1,'2017-02-23 08:24:02','2017-02-21 13:13:27'),(99,284,'CORRECT_3',5,0,1,0,'',0,'',11,1,1,'2017-02-23 08:24:02','2017-02-21 13:13:43'),(100,287,'ID',5,0,20,0,'',0,'',0,1,1,'2017-02-23 07:34:48','2017-02-23 07:34:48'),(101,287,'NAME',7,0,255,0,'',0,'',2,1,1,'2017-02-23 07:38:11','2017-02-23 07:36:15'),(102,287,'CATEG_TYPE',5,0,1,0,'',0,'',1,1,1,'2017-02-23 07:38:34','2017-02-23 07:38:11'),(103,284,'CATEG_ID',5,0,20,0,'',0,'',2,1,1,'2017-02-23 08:24:02','2017-02-23 08:24:01'),(104,284,'ANSWER_4',8,0,0,0,'',0,'',13,1,1,'2017-02-27 07:42:42','2017-02-27 07:42:42'),(105,284,'CORRECT_4',5,0,1,0,'',0,'',14,1,1,'2017-02-27 07:43:29','2017-02-27 07:43:29'),(106,284,'IMAGE_4',7,0,255,0,'',0,'',15,1,1,'2017-02-27 07:44:01','2017-02-27 07:44:01');
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
  `DESCRIPTION` text,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_fks`
--

LOCK TABLES `table_fks` WRITE;
/*!40000 ALTER TABLE `table_fks` DISABLE KEYS */;
INSERT INTO `table_fks` VALUES (8,73,'phpapps_table_indexes_TABLE_ID_FK',197,0,0,0,'',1,1,'2016-10-03 10:26:55','2016-10-03 10:26:55'),(9,77,'phpapps_table_indexes_INDEX_TYPE_FK',200,0,0,0,'',1,1,'2016-10-03 10:30:41','2016-10-03 10:30:41'),(17,71,'phpapps_test_cols_VIEW_ID2_FK',202,0,0,0,'',1,1,'2016-10-06 06:02:25','2016-10-06 06:02:25'),(19,78,'phpapps_test_cols_GOGU_FK',197,0,0,0,'',1,1,'2016-10-06 09:15:02','2016-10-06 09:15:02'),(21,81,'phpapps_sql_console_history_RUN_SCHEMA_FK',199,0,0,0,'',1,1,'2016-10-07 08:07:32','2016-10-07 08:07:32'),(22,83,'phpapps_queries_MODULE_ID_FK',282,0,0,0,'',1,1,'2016-10-11 09:15:36','2016-10-11 09:15:36'),(23,102,'php_quiz_categories_CATEG_TYPE_FK',288,0,0,0,'',1,1,'2017-02-23 07:38:51','2017-02-23 07:38:51'),(24,103,'php_quiz_questions_CATEG_ID_FK',287,0,0,0,'',1,1,'2017-02-23 08:24:22','2017-02-23 08:24:22');
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
  `DESCRIPTION` text,
  `MODIFY_UID` bigint(20) NOT NULL DEFAULT '1',
  `CREATE_UID` bigint(20) NOT NULL DEFAULT '1',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `phpapps_table_indexes_TABLE_ID_FK` (`TABLE_ID`),
  KEY `phpapps_table_indexes_INDEX_TYPE_FK` (`INDEX_TYPE_ID`),
  KEY `table_indexes_users_MODIFY_UID_FK` (`MODIFY_UID`),
  KEY `table_indexes_users_CREATE_UID_FK` (`CREATE_UID`),
  CONSTRAINT `phpapps_table_indexes_INDEX_TYPE_FK` FOREIGN KEY (`INDEX_TYPE_ID`) REFERENCES `list_index_types` (`ID`),
  CONSTRAINT `phpapps_table_indexes_TABLE_ID_FK` FOREIGN KEY (`TABLE_ID`) REFERENCES `tables` (`ID`),
  CONSTRAINT `table_indexes_users_CREATE_UID_FK` FOREIGN KEY (`CREATE_UID`) REFERENCES `users` (`ID`),
  CONSTRAINT `table_indexes_users_MODIFY_UID_FK` FOREIGN KEY (`MODIFY_UID`) REFERENCES `users` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `table_indexes`
--

LOCK TABLES `table_indexes` WRITE;
/*!40000 ALTER TABLE `table_indexes` DISABLE KEYS */;
INSERT INTO `table_indexes` VALUES (16,275,'phpapps_test_cols_VIEW_ID2_FK',3,'71','INDEX ADDED BY FK',1,1,'2016-10-06 06:02:25','2016-10-06 06:02:25'),(17,275,'phpapps_test_cols_MUMUSA_FK',3,'58','INDEX ADDED BY FK',1,1,'2016-10-06 06:27:27','2016-10-06 06:27:27'),(19,275,'phpapps_test_cols_58_71_IDX',2,'58,71','',1,1,'2016-10-06 08:20:16','2016-10-06 08:20:16'),(21,275,'phpapps_test_cols_59_IDX',4,'59','',1,1,'2016-10-06 09:03:26','2016-10-06 09:03:26'),(24,275,'phpapps_test_cols_GOGU_FK',3,'78','INDEX ADDED BY FK',1,1,'2016-10-06 09:21:48','2016-10-06 09:21:48'),(27,280,'phpapps_sql_console_history_RUN_SCHEMA_FK',3,'81','INDEX ADDED BY FK',1,1,'2016-10-07 08:07:32','2016-10-07 08:07:32'),(28,281,'phpapps_queries_MODULE_ID_FK',3,'83','INDEX ADDED BY FK',1,1,'2016-10-11 09:15:36','2016-10-11 09:15:36'),(30,287,'php_quiz_categories_CATEG_TYPE_FK',3,'102','INDEX ADDED BY FK',1,1,'2017-02-23 07:38:51','2017-02-23 07:38:51'),(31,284,'php_quiz_questions_CATEG_ID_FK',3,'103','INDEX ADDED BY FK',1,1,'2017-02-23 08:24:22','2017-02-23 08:24:22');
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
  `ORIGIN_ID` bigint(20) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (0,0,14,3,'dual',4,'VIRTUAL TABLE FOR ORIGIN_ID',1,1,'2016-09-27 13:55:35','2016-09-27 13:51:17'),(2,0,1,3,'applications',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(3,0,1,3,'modules',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(5,0,1,3,'forms',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(35,0,1,3,'list_no_yes',1,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(80,0,10,7,'categories',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(82,0,1,3,'list_script_types',1,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(83,0,1,3,'scripts',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(87,0,7,3,'users',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(88,0,7,3,'roles',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(89,0,7,3,'permissions',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(90,0,7,3,'user_roles',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(91,0,7,3,'role_permissions',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(93,0,7,3,'list_permission_types',1,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(96,0,1,3,'list_object_types',1,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(98,0,7,3,'list_permission_names',1,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(99,0,7,3,'user_profiles',2,'',1,1,'2016-09-27 10:05:46','0000-00-00 00:00:00'),(129,0,1,3,'module_vars',2,'',1,1,'2016-09-27 10:05:46','2016-08-29 06:13:16'),(197,0,14,3,'tables',2,'',1,1,'2016-09-30 04:58:59','2016-09-21 11:06:57'),(198,0,14,3,'table_details',2,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:07:06'),(199,0,14,3,'list_databases',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:07:20'),(200,0,14,3,'list_index_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:07:35'),(201,0,14,3,'list_mysql_column_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:07:50'),(202,0,14,3,'views',2,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:08:11'),(203,0,14,3,'list_table_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 11:59:49'),(204,0,7,3,'list_user_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 13:34:21'),(210,0,14,3,'list_empty',1,'',1,1,'2016-09-27 10:05:46','2016-09-21 14:41:58'),(222,0,14,3,'mysql_column_defs',2,'',1,1,'2016-09-28 11:54:35','2016-09-24 05:08:53'),(223,0,14,3,'list_dbms_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-24 11:36:51'),(224,0,14,3,'sql_sintax',2,'',1,1,'2016-09-27 10:05:46','2016-09-26 05:58:41'),(225,0,14,3,'list_sql_sintax_types',1,'',1,1,'2016-09-27 10:05:46','2016-09-26 06:27:44'),(227,0,14,3,'list_foreign_key_options',1,'',1,1,'2016-09-27 10:05:46','2016-09-27 07:04:44'),(275,0,14,3,'test_cols',2,'',1,1,'2016-09-29 11:25:02','2016-09-29 11:25:02'),(276,0,14,3,'table_fks',2,'',1,1,'2016-10-03 10:32:41','2016-09-30 04:55:41'),(277,35,14,3,'list_no_yes',1,'',1,1,'2016-09-30 06:03:16','2016-09-30 06:03:16'),(278,0,1,3,'form_details',2,'Forms Details',1,1,'2016-09-30 08:22:17','2016-09-30 08:22:17'),(279,0,14,3,'table_indexes',2,'',1,1,'2016-10-03 10:21:21','2016-10-03 10:21:21'),(280,0,14,3,'sql_console_history',3,'',1,1,'2016-10-07 07:59:53','2016-10-07 07:59:53'),(281,0,14,3,'queries',2,'',1,1,'2016-10-11 08:55:57','2016-10-11 08:55:57'),(282,3,14,3,'modules',2,'',1,1,'2016-10-11 09:14:08','2016-10-11 09:14:08'),(283,87,1,3,'users',2,'',1,1,'2017-02-20 13:15:29','2017-02-20 13:15:29'),(284,0,15,12,'questions',2,'',1,1,'2017-02-21 12:13:35','2017-02-21 12:13:35'),(285,35,15,3,'list_no_yes',1,'',1,1,'2017-02-21 13:33:02','2017-02-21 13:33:02'),(286,0,15,12,'list_da_nu',1,'',1,1,'2017-02-21 13:33:38','2017-02-21 13:33:38'),(287,0,15,12,'categories',2,'',1,1,'2017-02-23 07:34:48','2017-02-23 07:34:48'),(288,0,15,12,'list_category_type',1,'',1,1,'2017-02-23 07:36:58','2017-02-23 07:36:58');
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_cols`
--

DROP TABLE IF EXISTS `test_cols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_cols` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `MUMUSA` bigint(20) DEFAULT NULL,
  `NUME` text,
  `VIEW_ID2` bigint(20) DEFAULT NULL,
  `GOGU` bigint(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `phpapps_test_cols_58_71_IDX` (`MUMUSA`,`VIEW_ID2`),
  KEY `phpapps_test_cols_VIEW_ID2_FK` (`VIEW_ID2`),
  FULLTEXT KEY `phpapps_test_cols_59_IDX` (`NUME`),
  CONSTRAINT `phpapps_test_cols_VIEW_ID2_FK` FOREIGN KEY (`VIEW_ID2`) REFERENCES `views` (`ID`)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
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
-- Temporary table structure for view `view_permissions`
--

DROP TABLE IF EXISTS `view_permissions`;
/*!50001 DROP VIEW IF EXISTS `view_permissions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_permissions` (
  `ID` tinyint NOT NULL,
  `PERMISSION_NAME` tinyint NOT NULL,
  `PERMISSION_NAME_ID` tinyint NOT NULL,
  `DESCRIPTION` tinyint NOT NULL,
  `PERMISSION_TYPE` tinyint NOT NULL,
  `PERMISSION_TYPE_ID` tinyint NOT NULL,
  `OBJECT_TYPE` tinyint NOT NULL,
  `OBJECT_TYPE_ID` tinyint NOT NULL,
  `OBJECT_NAME` tinyint NOT NULL,
  `OBJECT_ID` tinyint NOT NULL
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
  `MODULE_ID` tinyint NOT NULL,
  `MODULE_NAME` tinyint NOT NULL
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
  `INDEX_COLUMNS_LABELS` tinyint NOT NULL,
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

/*!50001 DROP TABLE IF EXISTS `view_forms`*/;
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
/*!50001 VIEW `view_modules` AS select `m`.`ID` AS `ID`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`a`.`APP_SCHEMA` AS `APP_SCHEMA`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`m`.`MODULE_TITLE` AS `MODULE_TITLE`,`m`.`MODULE_DATE` AS `MODULE_DATE`,`a`.`APP_SCHEMA` AS `MODULE_SCHEMA`,`d`.`VALUE` AS `SCHEMA_NAME`,`m`.`DESCRIPTION` AS `DESCRIPTION`,`m`.`SCRIPT_ID` AS `SCRIPT_ID`,`s`.`SCRIPT_NAME` AS `SCRIPT_NAME` from (((`modules` `m` join `applications` `a`) join `scripts` `s`) join `list_databases` `d`) where ((`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`) and (`m`.`SCRIPT_ID` = `s`.`ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_permissions`
--

/*!50001 DROP TABLE IF EXISTS `view_permissions`*/;
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
/*!50001 VIEW `view_role_permissions` AS select `rp`.`ID` AS `ID`,`rp`.`ROLE_ID` AS `ROLE_ID`,`r`.`ROLE_NAME` AS `ROLE_NAME`,`rp`.`PERMISSION_ID` AS `PERMISSION_ID`,(select `list_permission_names`.`VALUE` AS `VALUE` from `list_permission_names` where (`list_permission_names`.`ID` = `p`.`PERMISSION_NAME`)) AS `PERMISSION_NAME`,`p`.`PERMISSION_NAME` AS `PERMISSION_NAME_ID`,`p`.`DESCRIPTION` AS `PERMISSION_DESC` from ((`role_permissions` `rp` join `roles` `r`) join `permissions` `p`) where ((`rp`.`ROLE_ID` = `r`.`ID`) and (`rp`.`PERMISSION_ID` = `p`.`ID`)) */;
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

/*!50001 DROP TABLE IF EXISTS `view_table_details`*/;
/*!50001 DROP VIEW IF EXISTS `view_table_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp850 */;
/*!50001 SET character_set_results     = cp850 */;
/*!50001 SET collation_connection      = cp850_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_table_details` AS select `d`.`ID` AS `ID`,`t`.`SCHEMA_ID` AS `SCHEMA_ID`,(select `list_databases`.`VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,`d`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`COLUMN_NAME` AS `COLUMN_NAME`,`d`.`COLUMN_TYPE_ID` AS `COLUMN_TYPE_ID`,(select `list_mysql_column_types`.`VALUE` from `list_mysql_column_types` where (`list_mysql_column_types`.`ID` = `d`.`COLUMN_TYPE_ID`)) AS `COLUMN_TYPE_LABEl`,`d`.`UNSIGN` AS `UNSIGN`,`d`.`COLUMN_SIZE` AS `COLUMN_SIZE`,`d`.`ACCEPT_NULL` AS `ACCEPT_NULL`,`d`.`COLUMN_DEFAULT_VALUE` AS `COLUMN_DEFAULT_VALUE`,`d`.`AUTOINCREMENT` AS `AUTOINCREMENT`,`d`.`DESCRIPTION` AS `DESCRIPTION`,`d`.`ORD` AS `ORD`,`d`.`MODIFY_UID` AS `MODIFY_UID`,(select `users`.`USERNAME` from `users` where (`users`.`ID` = `d`.`MODIFY_UID`)) AS `MODIFIED_BY`,`d`.`CREATE_UID` AS `CREATE_UID`,(select `users`.`USERNAME` from `users` where (`users`.`ID` = `d`.`CREATE_UID`)) AS `CREATED_BY`,`d`.`MODIFY_DATE` AS `MODIFY_DATE`,`d`.`CREATE_DATE` AS `CREATE_DATE` from (`table_details` `d` left join `tables` `t` on((`d`.`TABLE_ID` = `t`.`ID`))) */;
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
/*!50001 VIEW `view_table_fks` AS select `fk`.`ID` AS `ID`,`fk`.`COLUMN_ID` AS `COLUMN_ID`,`td`.`COLUMN_NAME` AS `COLUMN_NAME`,`t`.`SCHEMA_ID` AS `SCHEMA_ID`,(select `list_databases`.`VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,`td`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`fk`.`FK_NAME` AS `FK_NAME`,`tf`.`SCHEMA_ID` AS `FK_SCHEMA_ID`,(select `list_databases`.`VALUE` from `list_databases` where (`list_databases`.`ID` = `tf`.`SCHEMA_ID`)) AS `FK_TABLE_SCHEMA`,`fk`.`FK_TABLE_ID` AS `FK_TABLE_ID`,`tf`.`TABLE_NAME` AS `FK_TABLE_NAME`,`fk`.`FK_COLUMN_ID` AS `FK_COLUMN_ID`,`tdf`.`COLUMN_NAME` AS `FK_COLUMN_NAME`,(select `list_foreign_key_options`.`VALUE` from `list_foreign_key_options` where (`list_foreign_key_options`.`ID` = `fk`.`ON_UPDATE`)) AS `ON_UPDATE`,(select `list_foreign_key_options`.`VALUE` from `list_foreign_key_options` where (`list_foreign_key_options`.`ID` = `fk`.`ON_DELETE`)) AS `ON_DELETE`,`fk`.`DESCRIPTION` AS `DESCRIPTION` from ((((`table_fks` `fk` left join `table_details` `td` on((`fk`.`COLUMN_ID` = `td`.`ID`))) left join `tables` `t` on((`td`.`TABLE_ID` = `t`.`ID`))) left join `tables` `tf` on((`fk`.`FK_TABLE_ID` = `tf`.`ID`))) left join `table_details` `tdf` on((`fk`.`FK_COLUMN_ID` = `tdf`.`ID`))) */;
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
/*!50001 VIEW `view_table_indexes` AS select `ti`.`ID` AS `ID`,`t`.`SCHEMA_ID` AS `SCHEMA_ID`,(select `list_databases`.`VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,`ti`.`TABLE_ID` AS `TABLE_ID`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`ti`.`INDEX_NAME` AS `INDEX_NAME`,`ti`.`INDEX_TYPE_ID` AS `INDEX_TYPE_ID`,(select `list_index_types`.`VALUE` from `list_index_types` where (`list_index_types`.`ID` = `ti`.`INDEX_TYPE_ID`)) AS `INDEX_TYPE`,`ti`.`INDEX_COLUMNS` AS `INDEX_COLUMNS`,(select group_concat(`td`.`COLUMN_NAME` separator ',') from `table_details` `td` where (`ti`.`INDEX_COLUMNS` regexp convert(concat(',?',`td`.`ID`,',?') using latin1)) group by `td`.`TABLE_ID`) AS `INDEX_COLUMNS_LABELS`,`ti`.`DESCRIPTION` AS `DESCRIPTION`,`ti`.`MODIFY_UID` AS `MODIFY_UID`,`ti`.`CREATE_UID` AS `CREATE_UID`,`ti`.`MODIFY_DATE` AS `MODIFY_DATE`,`ti`.`CREATE_DATE` AS `CREATE_DATE` from (`table_indexes` `ti` left join `tables` `t` on((`ti`.`TABLE_ID` = `t`.`ID`))) */;
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
/*!50001 VIEW `view_tables` AS select `t`.`ID` AS `ID`,`t`.`ORIGIN_ID` AS `ORIGIN_ID`,`t`.`TABLE_TYPE` AS `TABLE_TYPE`,`ty`.`VALUE` AS `TABLE_TYPE_LABEL`,`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`VALUE` AS `APP_SCHEMA`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`t`.`MODULE_ID` AS `MODULE_ID`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`t`.`DESCRIPTION` AS `DESCRIPTION` from ((((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) join `list_table_types` `ty` on((`t`.`TABLE_TYPE` = `ty`.`ID`))) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`)) */;
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

-- Dump completed on 2017-04-18 11:01:45
