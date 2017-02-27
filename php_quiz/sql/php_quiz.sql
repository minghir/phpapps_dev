-- MySQL dump 10.13  Distrib 5.6.26, for Win32 (x86)
--
-- Host: localhost    Database: php_quiz
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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `CATEG_TYPE` bigint(1) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `php_quiz_categories_CATEG_TYPE_FK` (`CATEG_TYPE`),
  CONSTRAINT `php_quiz_categories_CATEG_TYPE_FK` FOREIGN KEY (`CATEG_TYPE`) REFERENCES `list_category_type` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,1,'Marinarie'),(2,1,'Conducere / Manevra'),(3,1,'RND'),(4,2,'Manevra Agrement'),(5,2,'Marinarie Agrement'),(6,2,'Navigatie Agrement'),(7,2,'Colreg Agrement');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_category_type`
--

DROP TABLE IF EXISTS `list_category_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_category_type` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_category_type`
--

LOCK TABLES `list_category_type` WRITE;
/*!40000 ALTER TABLE `list_category_type` DISABLE KEYS */;
INSERT INTO `list_category_type` VALUES (1,'','D'),(2,'','C');
/*!40000 ALTER TABLE `list_category_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `list_da_nu`
--

DROP TABLE IF EXISTS `list_da_nu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `list_da_nu` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `DESCRIPTION` text,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `list_da_nu`
--

LOCK TABLES `list_da_nu` WRITE;
/*!40000 ALTER TABLE `list_da_nu` DISABLE KEYS */;
INSERT INTO `list_da_nu` VALUES (0,'','NU'),(1,'','DA');
/*!40000 ALTER TABLE `list_da_nu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `NO` bigint(10) NOT NULL DEFAULT '0',
  `CATEG_ID` bigint(20) DEFAULT NULL,
  `QUESTION` text COLLATE utf8_bin,
  `ANSWER_1` text COLLATE utf8_bin,
  `CORRECT_1` bigint(1) DEFAULT NULL,
  `IMAGE_1` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANSWER_2` text COLLATE utf8_bin,
  `CORRECT_2` bigint(1) DEFAULT NULL,
  `IMAGE_2` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANSWER_3` text COLLATE utf8_bin,
  `CORRECT_3` bigint(1) DEFAULT NULL,
  `IMAGE_3` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ANSWER_4` text COLLATE utf8_bin,
  `CORRECT_4` bigint(1) DEFAULT NULL,
  `IMAGE_4` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `php_quiz_questions_CATEG_ID_FK` (`CATEG_ID`),
  CONSTRAINT `php_quiz_questions_CATEG_ID_FK` FOREIGN KEY (`CATEG_ID`) REFERENCES `categories` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,7,'Căror nave li se aplică prevederile Colreg-1973?','a.	tuturor navelor care navigă în apele internaționale.',0,NULL,'b.	tuturor navelor care navigă în rade, strâmtori și marea liber.',0,NULL,'c.	tuturor navelor aflate în largul mării ori pe toate apele învecinate accesibile navelor maritime.',1,NULL,'',0,NULL),(2,2,7,'Tuturor navelor aflate în largul mării ori pe toate apele învecinate accesibile navelor maritime li se aplică prevederile:','a.	COLREG-1973.',1,NULL,'b.	R.N.D.-1994.',0,NULL,'c.	Codului IMDG.',0,NULL,NULL,NULL,NULL),(3,3,7,'Dispoziţiile Regulamentului scutesc nava, comandantul sau armatorul de consecinţele unei neglijenţe oarecare în ceea ce priveşte aplicarea Regulamentului sau în ceea ce priveşte luarea tuturor măsurilor cerute de o bună practică marinărească ?','a.	nu este precizat.',0,NULL,'b.	da.',0,NULL,'c.	nu.',1,NULL,NULL,NULL,NULL),(5,1,1,'Ambarcatiunile pot avea propulsie cu rame si vele?','a) da',1,NULL,'b) nu',0,NULL,'c)	ambarcatiunile nu au propulsie proprie',0,NULL,NULL,NULL,NULL),(6,2,1,'Arborada reprezinta:','a)	totalitatea pieselor confectionate din lemn sau metal si care se numesc:catarge, arbori,ghiu,bompres.',1,NULL,'b)	totalitatea manevrelor fixe si curente de la bord,folosite pentru fixarea arborilor,sustinerea si manevra vergilor si a velelor',0,NULL,'c)	un stalp vertical,asezat in planul diametral al navei si fixat de osatura de rezistenta a navei',0,NULL,'',0,NULL),(12,4,7,'Când sunt permise abateri de la prevederile Regulamentului?','a.	în apele naţionale, rade şi în toate apele învecinate accesibile navelor maritime.',0,NULL,'b.	când există pericol de navigaţie, riscul unei coliziuni,precum şi în toate împrejurările deosebite.',1,NULL,'c.	indiferent de situaţie nu este permisă abaterea de la prevederile Regulamentului.',0,NULL,'',0,NULL),(13,5,7,'Ce se înţelege prin expresia \\&quot;navă\\&quot;, conform Regulamentului ?','a.	orice construcţie sau aparat,de orice natură, capabil să plutească pe apă fără propulsie.',0,NULL,'b.	orice construcţie sau orice aparat, de orice natură ar fi, inclusiv construcţie fără pescaj şi hidro avioane, folosită sau susceptibilă de a fi folosită ca mijloc de transport pe apă.',1,NULL,'c.	orice corp plutitor cu orice mijloc de propulsie.',0,NULL,'',0,NULL);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-27 12:04:36
