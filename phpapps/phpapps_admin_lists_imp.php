<?php
require_once ("globals.php");
include ("gen_php/phpapps_admin_lists.php");
	class phpapps_admin_lists_impl  extends phpapps_admin_lists{
		function phpapps_admin_lists_impl(){
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
			$this->MODULE_ID = $_GET["module_id"];
			$this->template = "phpapps_admin_lists_imp.tpl";
			$this->init();
			$this->display();
		}
		
		function addRec(){
		
		
			$sql = new DB_query("SELECT ld.VALUE AS APP_SCHEMA, ld.ID AS SCHEMA_ID 
						FROM view_modules m, applications a, list_databases ld 
						WHERE m.APP_ID = a.ID AND a.APP_SCHEMA = ld.ID AND m.ID = :ID",array(":ID"=>$this->MODULE_ID));
			if( $this->globals->con->query($sql) == 1){
				$this->globals->con->next();
				$app_schema = $this->globals->con->get_field("APP_SCHEMA");
				$schema_id = $this->globals->con->get_field("SCHEMA_ID");
			}else{
				return;
			}
			
			$this->TABLE_NAME = "list_".$this->TABLE_NAME;
			$this->CREATE_TABLE_QUERY = "CREATE TABLE $app_schema.".$this->TABLE_NAME." ( 
					ID bigint(20) NOT NULL auto_increment, 
				    VALUE varchar(20) not null default '', 
					DESCRIPTION varchar(255) not null default '', 
					PRIMARY KEY (ID) ) ENGINE=InnoDB";
					
			$sql = new DB_query( $this->CREATE_TABLE_QUERY );
			if( $this->globals->con->query( $sql ) != -1 ){
				
			
			
			$sql = new DB_query("INSERT INTO phpapps.tables (
														MODULE_ID,
														TABLE_NAME,
														SCHEMA_ID,
														TABLE_TYPE,
														DESCRIPTION
								 ) VALUES (
														:MODULE_ID,
														:TABLE_NAME,
														:schema_id,
														:TABLE_TYPE,
														:DESCRIPTION
											)",
											array(
											":MODULE_ID" => $this->MODULE_ID,
											":TABLE_NAME" => $this->TABLE_NAME,
											":schema_id" => $schema_id,
											":TABLE_TYPE" => '1',
											":DESCRIPTION" => $this->DESCRIPTION,
											));
				//print_r($sqls);			
				if( $this->globals->con->query($sql) != -1 ){
				//	header("Location:win_close.html");
				}else{
					
					$this->errors[] = "SQL error!!!";
				}
			}else{
					echo $this->CREATE_TABLE_QUERY;
					$this->errors[] = "SQL error!!!";
					
			}
		}
		
		function deleteRec(){
			echo "AICI";
		
			$sql = new DB_query ( "SELECT t.TABLE_NAME, ld.VALUE AS TABLE_SCHEMA
					FROM phpapps.tables t, phpapps.view_modules m, phpapps.applications a, phpapps.list_databases ld
					WHERE t.MODULE_ID = m.ID AND
						  m.APP_ID = a.ID AND
						  a.APP_SCHEMA = ld.ID AND 
						  t.".$this->gfield." = :".$this->gfield, array(":".$this->gfield => $this->gfield_value));
			echo $sql->sql();
			$this->globals->con->query($sql);
			$this->globals->con->next();
			$this->TABLE_NAME = $this->globals->con->get_field("TABLE_NAME");
			$table_schema = $this->globals->con->get_field("TABLE_SCHEMA");
			
			
			$sql = new DB_query("DELETE FROM phpapps.tables 
					WHERE TABLE_NAME = :TABLE_NAME  AND MODULE_ID = :MODULE_ID",
					array(":TABLE_NAME" => $this->TABLE_NAME,
							":MODULE_ID" => $this->MODULE_ID));
			$this->globals->con->query($sql);				
			$sql = new DB_query ("DROP TABLE $table_schema.". $this->TABLE_NAME);
			$this->globals->con->query($sql);
			print_r($sqls);
			header("Location:win_close.html");
		}
	};

	$phpapps_admin_lists_Impl = new phpapps_admin_lists_impl();
?>