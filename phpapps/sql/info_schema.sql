/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  victor.minghir
 * Created: 23-Oct-2018
 */

select * from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'test_5' and table_schema = 'phpapps'
select *, (SELECT @rownum:=@rownum+1 AS rownum FROM (SELECT @rownum:=0) dummy ) as ID from  INFORMATION_SCHEMA.COLUMNS WHERE table_name = 'tables' and table_schema = 'phpapps'

