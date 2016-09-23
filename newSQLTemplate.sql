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
values (14,3,'list_mysql_column_defs','1','')



create table list_mysql_column_defs (
ID BIGINT(NOT NULL PRIMARY KEY



update tables set table_type = '1' where table_name in ('list_user_types','list_databases', 'list_index_types','list_mysql_column_types','list_table_types','list_empty')


drop view view_tables;
 CREATE VIEW `view_tables` AS 
 select `t`.`ID` AS `ID`,`t`.`TABLE_TYPE` AS `TABLE_TYPE`,`t`.`SCHEMA_ID` AS `TABLE_SCHEMA_ID`,(select `list_databases`.`VALUE` AS `VALUE` from `list_databases` where (`list_databases`.`ID` = `t`.`SCHEMA_ID`)) AS `TABLE_SCHEMA`,`t`.`TABLE_NAME` AS `TABLE_NAME`,`d`.`VALUE` AS `APP_SCHEMA`,`m`.`APP_ID` AS `APP_ID`,`a`.`APP_NAME` AS `APP_NAME`,`t`.`MODULE_ID` AS `MODULE_ID`,`m`.`MODULE_NAME` AS `MODULE_NAME`,`t`.`DESCRIPTION` AS `DESCRIPTION` from (((`tables` `t` join `modules` `m`) join `applications` `a`) join `list_databases` `d`) where ((`t`.`MODULE_ID` = `m`.`ID`) and (`m`.`APP_ID` = `a`.`ID`) and (`a`.`APP_SCHEMA` = `d`.`ID`)) 