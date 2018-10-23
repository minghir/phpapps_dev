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


drop view view_table_indexes;
create view view_table_indexes as select 
 ti.ID,
t.SCHEMA_ID,
(select value from phpapps.list_databases where id = t.schema_id) as 'TABLE_SCHEMA',
 ti.TABLE_ID,
 t.TABLE_NAME,
 ti.INDEX_NAME,
 ti.INDEX_TYPE_ID,
(select value from phpapps.list_index_types where id = ti.INDEX_TYPE_ID) as INDEX_TYPE,
 ti.INDEX_COLUMNS,
(select GROUP_CONCAT(COLUMN_NAME SEPARATOR ',') FROM phpapps.table_details td WHERE ti.INDEX_COLUMNS REGEXP concat(',?',td.ID,',?' ) GROUP BY td.TABLE_ID ) as 'INDEX_COLUMNS_LABELS',
 ti.DESCRIPTION,
 ti.MODIFY_UID,
 ti.CREATE_UID,
 ti.MODIFY_DATE,
 ti.CREATE_DATE
 from table_indexes ti left join tables t on (ti.table_id = t.id)


drop view view_table_fks;
CREATE VIEW view_table_fks AS select fk.ID AS ID,
fk.COLUMN_ID AS COLUMN_ID,
td.COLUMN_NAME AS COLUMN_NAME,
t.SCHEMA_ID AS SCHEMA_ID,
(select list_databases.VALUE from list_databases where (list_databases.ID = t.SCHEMA_ID)) AS TABLE_SCHEMA,
td.TABLE_ID AS TABLE_ID,
t.TABLE_NAME AS TABLE_NAME,
fk.FK_NAME AS FK_NAME,
tf.SCHEMA_ID AS FK_SCHEMA_ID,
(select list_databases.VALUE from list_databases where (list_databases.ID = tf.SCHEMA_ID)) AS FK_TABLE_SCHEMA,
fk.FK_TABLE_ID AS FK_TABLE_ID,
tf.TABLE_NAME AS FK_TABLE_NAME,
fk.FK_COLUMN_ID AS FK_COLUMN_ID,
tdf.COLUMN_NAME AS FK_COLUMN_NAME,
(SELECT VALUE FROM phpapps.list_foreign_key_options WHERE ID = fk.ON_UPDATE) AS ON_UPDATE,
(SELECT VALUE FROM phpapps.list_foreign_key_options WHERE ID = fk.ON_DELETE) AS ON_DELETE,
fk.DESCRIPTION AS DESCRIPTION 
from ((((table_fks fk left join table_details td on((fk.COLUMN_ID = td.ID))) left join tables t on((td.TABLE_ID = t.ID))) left join tables tf on((fk.FK_TABLE_ID = tf.ID))) left join table_details tdf on((fk.FK_COLUMN_ID = tdf.ID))) 

create view view_views AS
SELECT 
ID,	MODULE_ID,	VIEW_NAME,	CREATE_VIEW_QUERY,	DESCRIPTION
