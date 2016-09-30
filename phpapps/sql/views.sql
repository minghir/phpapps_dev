/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  victor.minghir
 * Created: Sep 30, 2016
 */

drop view phpapps.view_table_details;
create view phpapps.view_table_details as
select d.ID AS ID,
 t.SCHEMA_ID AS SCHEMA_ID,
(select phpapps.list_databases.VALUE from phpapps.list_databases where (phpapps.list_databases.ID = t.SCHEMA_ID)) AS TABLE_SCHEMA,
d.TABLE_ID AS TABLE_ID,
t.TABLE_NAME AS TABLE_NAME,
d.COLUMN_NAME AS COLUMN_NAME,
d.COLUMN_TYPE_ID AS COLUMN_TYPE_ID,
(select phpapps.list_mysql_column_types.VALUE from phpapps.list_mysql_column_types where (phpapps.list_mysql_column_types.ID = d.COLUMN_TYPE_ID)) AS COLUMN_TYPE_LABEl,
d.UNSIGN,
d.COLUMN_SIZE AS COLUMN_SIZE,
d.ACCEPT_NULL,
d.COLUMN_DEFAULT_VALUE AS COLUMN_DEFAULT_VALUE,
d.AUTOINCREMENT,
d.DESCRIPTION AS DESCRIPTION,
d.ORD AS ORD,
d.MODIFY_UID AS MODIFY_UID,
(select phpapps.users.USERNAME from phpapps.users where (phpapps.users.ID = d.MODIFY_UID)) AS MODIFIED_BY,
d.CREATE_UID AS CREATE_UID,
(select phpapps.users.USERNAME from phpapps.users where (phpapps.users.ID = d.CREATE_UID)) AS CREATED_BY,
d.MODIFY_DATE AS MODIFY_DATE,
d.CREATE_DATE AS CREATE_DATE from (phpapps.table_details d left join phpapps.tables t on((d.TABLE_ID = t.ID)))