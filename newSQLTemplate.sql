/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  victor.minghir
 * Created: Sep 23, 2016
 */

drop table sql_sintax;
create table sql_sintax(
    ID BIGINT(20) NOT NULL AUTO_INCREMENT,
    DBMS_TYPE_ID BIGINT(20) NOT NULL DEFAULT '0',
    SINTAX_TYPE_ID BIGINT(20) NOT NULL DEFAULT '0',
    DEF_TPL TEXT NOT NULL DEFAULT '',
    DESCRIPTION TEXT NOT NULL DEFAULT '',
    PRIMARY KEY (ID),
CONSTRAINT sql_sintax_DBMS_TYPE_ID_fk FOREIGN KEY (DBMS_TYPE_ID) REFERENCES list_dbms_types (ID),
CONSTRAINT sql_sintax_SINTAX_TYPE_ID_fk FOREIGN KEY (SINTAX_TYPE_ID) REFERENCES list_sql_sintax_types (ID)
)ENGINE=InnoDB;


CREATE TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} (
    {section name=cols loop=$TABLE_OBJ->columns}
        {$TABLE_OBJ->columns->getColumnDef()}
    {/section}
)ENGINE=InnoDB;


insert into tables (MODULE_ID,SCHEMA_ID,TABLE_NAME,TABLE_TYPE,DESCRIPTION)
values (14,3,'sql_sintax','2','')


insert into tables (MODULE_ID,SCHEMA_ID,TABLE_NAME,TABLE_TYPE,DESCRIPTION)
values (14,3,'list_dbms_types','1','')

insert into tables (MODULE_ID,SCHEMA_ID,TABLE_NAME,TABLE_TYPE,DESCRIPTION)
values (14,3,'list_sql_sintax_types','1','')


drop table mysql_column_defs;
create table mysql_column_defs (
ID BIGINT(20) NOT NULL AUTO_INCREMENT,
COLUMN_TYPE_ID BIGINT(20) NOT NULL,
DEF_TPL TEXT NOT NULL DEFAULT '',
DESCRIPTION TEXT NOT NULL DEFAULT '',
PRIMARY KEY (ID),
CONSTRAINT list_mysql_column_types_ID_fk FOREIGN KEY (COLUMN_TYPE_ID) REFERENCES list_mysql_column_types (ID)
) ENGINE=InnoDB;



CREATE TABLE {$TABLE_OBJ->TABLE_SCHEMA}.{$TABLE_OBJ->TABLE_NAME} (
    {section name=cols loop=$TABLE_OBJ->columns}
        {$TABLE_OBJ->columns->getColumnDef()},
    {/section}
    PRIMARY KEY (`ID`)
)ENGINE=InnoDB



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




create view phpapps.view_table_fks as
SELECT 
fk.ID,
fk.COLUMN_ID,
td.COLUMN_NAME,
t.SCHEMA_ID,
(SELECT VALUE FROM phpapps.list_databases WHERE ID = t.SCHEMA_ID) AS TABLE_SCHEMA,
td.TABLE_ID,
t.TABLE_NAME,
fk.FK_NAME,
tf.SCHEMA_ID AS FK_SCHEMA_ID,
(SELECT VALUE FROM phpapps.list_databases WHERE ID = tf.SCHEMA_ID) AS FK_TABLE_SCHEMA,
fk.FK_TABLE_ID,
tf.TABLE_NAME AS FK_TABLE_NAME,
fk.FK_COLUMN_ID,
tdf.COLUMN_NAME AS FK_COLUMN_NAME,
fk.ON_UPDATE,
fk.ON_DELETE,
fk.DESCRIPTION
FROM phpapps.table_fks fk left join phpapps.table_details td ON (fk.COLUMN_ID = td.ID)
left join phpapps.tables t ON (td.TABLE_ID = t.ID)
left join phpapps.tables tf ON (fk.FK_TABLE_ID = tf.ID)
left join phpapps.table_details tdf ON (fk.FK_COLUMN_ID = tdf.ID)