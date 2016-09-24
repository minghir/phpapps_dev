alter table products add column MODIFY_UID bigint(20) not null default '1';
alter table products add column CREATE_UID bigint(20) not null default '1';
alter table products add column MODIFY_DATE timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
alter table products add column `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP;
alter table products add CONSTRAINT products_ibfk_2 FOREIGN KEY (MODIFY_UID) REFERENCES phpapps.users(ID);
alter table products add CONSTRAINT products_ibfk_3 FOREIGN KEY (CREATE_UID) REFERENCES phpapps.users(ID);

DELIMITER ;;
CREATE TRIGGER `products_bi` BEFORE INSERT ON `products` FOR EACH ROW
BEGIN
    SET NEW.CREATE_UID = @USER_ID;
END;;
DELIMITER ;


select TABLE_NAME,COLUMN_NAME,CONSTRAINT_NAME,
REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME from INFORMATION_SCHEMA.KEY_COLUMN_USAGE
where TABLE_SCHEMA = "eshop" and TABLE_NAME = "products" 
and referenced_column_name is not NULL;




ALTER TABLE users CHANGE `MODIFY_UID` `MODIFY_UID` BIGINT(20) not null DEFAULT '1';
ALTER TABLE users CHANGE `CREATE_UID` `CREATE_UID` BIGINT(20) not null DEFAULT '1';


ALTER TABLE  users  CHANGE `MODIFY_DATE` `MODIFY_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
ALTER TABLE  users  CHANGE `CREATE_DATE` `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP;


alter table products add CONSTRAINT products_ibfk_1 FOREIGN KEY (SCRIPT_ID) REFERENCES scripts(ID);