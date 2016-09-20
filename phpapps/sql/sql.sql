drop database phpapps;
create database phpapps;
use phpapps;

DROP TABLE `list_user_types`;
CREATE TABLE `list_user_types` (
ID bigint(20) NOT NULL auto_increment,
VALUE varchar(20) not null default '',
DESCRIPTION varchar(255) not null default '',
PRIMARY KEY  (`ID`)
) TYPE=InnoDB;

insert into list_user_types (value,description) values('admin','admin');
insert into list_user_types (value,description) values('operator','operator');

DROP TABLE `list_databases`;
CREATE TABLE `list_databases` (
ID bigint(20) NOT NULL auto_increment,
VALUE varchar(20) not null default '',
DESCRIPTION varchar(255) not null default '',
PRIMARY KEY  (`ID`)
) TYPE=InnoDB;

insert into list_databases (value,description) values('mysql','mysql');
insert into list_databases (value,description) values('test','test');
insert into list_databases (value,description) values('phpapps','phpapps');

DROP TABLE users;
CREATE TABLE `users` (
ID bigint(20) NOT NULL auto_increment,
USERNAME varchar(255) NOT NULL default '',
PASSWORD varchar(255) NOT NULL default '',
FIRSTNAME varchar(255) NOT NULL default '',
LASTNAME varchar(255) NOT NULL default '',
EMAIL varchar(255) NOT NULL default '',
USER_TYPE bigint NOT NULL default '1',
DESCRIPTION varchar(255) not null default '',
  PRIMARY KEY  (`ID`),
  FOREIGN KEY (USER_TYPE) REFERENCES list_user_types(ID),
  UNIQUE KEY `users_username_unique_idx` (`USERNAME`),
  KEY `users_username_idx` (`USERNAME`),
  KEY `users_password_idx` (`PASSWORD`)
) TYPE=InnoDB; 

insert into users (username,password,user_type) values('victor','marimar','1');
insert into users (username,password,user_type) values('cornelia','a','1');

DROP TABLE applications;
create table applications(
ID bigint not null auto_increment,
USER_ID bigint not null,
APP_NAME varchar(20) not null default '',
APP_TITLE varchar(255) not null default '',
APP_SCHEMA varchar (20) not null default '',
BASE_DIR varchar (20) not null default '',
APP_DATE date not null default '0000-00-00',
DESCRIPTION varchar (255) not null default '',
PRIMARY KEY(ID),
FOREIGN KEY (USER_ID) REFERENCES users(ID)
) TYPE=InnoDB;

insert into applications (user_id,app_name,app_title,app_schema,base_dir) values('1','phpapps','Admin PHP Applications','3','.');

DROP TABLE modules;
create table modules(
ID bigint not null auto_increment,
APP_ID bigint not null,
MODULE_NAME varchar (20) not null default '',
MODULE_TITLE varchar (255) not null default '',
MODULE_DATE date  not null default '0000-00-00',
MODULE_SCHEMA varchar (20) not null default '',
DESCRIPTION varchar (255) not null default '',
PRIMARY KEY(ID),
FOREIGN KEY (APP_ID) REFERENCES applications(ID)
) TYPE=InnoDB;

insert into modules (app_id,module_name,module_title,module_schema) values('1','phpapps_admin','PHPApps Admin Module','3');

DROP TABLE `tables`;
CREATE TABLE `tables` (
ID bigint(20) NOT NULL auto_increment,
MODULE_ID bigint not null,
TABLE_NAME varchar(20) not null default '',
CREATE_TABLE_QUERY text,
DESCRIPTION varchar(255) not null default '',
FOREIGN KEY (MODULE_ID) REFERENCES modules(ID),
PRIMARY KEY  (`ID`)
) TYPE=InnoDB;

insert into tables (module_id,table_name) values('1','users');
insert into tables (module_id,table_name) values('1','applications');
insert into tables (module_id,table_name) values('1','modules');
insert into tables (module_id,table_name) values('1','tables');
insert into tables (module_id,table_name) values('1','forms');
insert into tables (module_id,table_name) values('1','form_details');

drop table forms;
create table forms(
ID bigint not null auto_increment,
MODULE_ID bigint not null,
FORM_NAME varchar(255) not null default '',
FORM_TABLE varchar(255) not null default '',
FORM_QUERY varchar(255) not null default '',
FORM_PHP_DIR varchar(20) not null default '',
FORM_TPL_DIR varchar(20) not null default '',
DESCRIPTION varchar(255) not null default '',
PRIMARY KEY(ID),
FOREIGN KEY (MODULE_ID) REFERENCES modules(ID),
UNIQUE KEY (MODULE_ID,FORM_NAME)
) TYPE=InnoDB;

insert into forms values('1','1','phpapps_admin_applications_form','applications','','./','./','');
insert into forms values('2','1','phpapps_admin_modules_form','modules','','./','./','');

drop table form_details;
create table form_details(
ID bigint not null auto_increment,
FORM_ID bigint not null,
FIELD varchar(255) not null default '',
FIELD_TYPE varchar(255) not null default '',
HIDDEN  int(1) not null default '0',
LABEL varchar(255) not null default '',
MANDATORY int(1) not null default '0',
INPUT_TYPE varchar(255) not null default '',
REFERENCE_LIST varchar(255) not null default '',
REFERENCE_TABLE varchar(255) not null default '',
REFERENCE_FIELD varchar(255) not null default '',
PRIMARY KEY(ID),
FOREIGN KEY (FORM_ID) REFERENCES forms(ID) ON DELETE CASCADE
) TYPE=InnoDB;

