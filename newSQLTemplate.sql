/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  victor.minghir
 * Created: Sep 23, 2016
 */

create table dbms_ddf_sintax_tpl(
ID BIGINT(20) NOT NULL PRIMARY KEY,
NAME
)



insert into tables (MODULE_ID,SCHEMA_ID,TABLE_NAME,TABLE_TYPE,DESCRIPTION)
values (14,3,'mysql_column_defs','1','')


drop table mysql_column_defs;
create table mysql_column_defs (
ID BIGINT(20) NOT NULL AUTO_INCREMENT,
COLUMN_TYPE_ID BIGINT(20) NOT NULL,
DEF_TPL TEXT NOT NULL DEFAULT '',
DESCRIPTION TEXT NOT NULL DEFAULT '',
PRIMARY KEY (ID),
CONSTRAINT list_mysql_column_types_ID_fk FOREIGN KEY (COLUMN_TYPE_ID) REFERENCES list_mysql_column_types (ID)
) ENGINE=InnoDB;



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


update tables set table_type = '1' where table_name in ('list_user_types','list_databases', 'list_index_types','list_mysql_column_types','list_table_types','list_empty')


drop view view_tables;
 CREATE VIEW `view_tables` AS 
 select `t`.`ID` AS `ID`,`t`.`TABLE_TYPE` AS `TABLE_TYPE`,`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`VALUE` AS `APP_SCHEMA`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`t`.`MODULE_ID` AS `MODULE_ID`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`t`.`DESCRIPTION` AS `DESCRIPTION` from (((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`)) 