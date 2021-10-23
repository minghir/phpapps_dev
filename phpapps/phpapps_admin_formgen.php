<?php
namespace wabdo;
require_once (PHPAPPS_LIBS_DIR . "template.php");

class phpapps_admin_formgen extends template{
	var $deploy_location;
	var $deploy_location_php;
	var $deploy_location_tpl;
	var $deploy_location_gen_php;
	var $deploy_location_gen_tpl;
	
	var $globals;
	var $post_act;

	var $app_id; //Id-ul aplicatiei
	var $app_name;
        var $app_title;
        var $app_label;
        
        var $module_id; //Id-ul modulului
	var $module_name;
        var $module_title;
        var $module_label;
        
        var $script_id; //Id-ul formei
	var $script_name;
        var $script_title;
        var $script_label;
        var $script_version;
	
	var $form_schema;
	var $form_table;
	var $form_table_id;
	var $form_schema_table;
	
	var $schema_lists = array();
        var $schema_lists_multiple = array();
	var $schema_tables = array();
        var $schema_tables_multiple = array();
	var $schema_fields = array();
	
	var $selected_schema_list = array(); //listele selectate pentru fiecare dintre campuri
        //var $selected_schema_list_multiple = array(); //listele selectate pentru fiecare dintre campuri
	var $selected_schema_table = array();//tabelele selectate pentru fiecare dintre campuri
        //var $selected_schema_table_multiple = array();//tabelele selectate pentru fiecare dintre campuri
	var $selected_schema_field = array();//campurile selectate pentru fiecare dintre  tabele
	
	var $hiddens = array();
	var $fields = array();
	var $fields_id = array();
	var $lists = array();
	var $labels = array();
        var $data_types = array();
	var $input_types = array();
        var $mandatories = array();
	
	var $table_lists = array();
	var $field_lists = array();
	var $post_fields = array();
        
        public $errors = array();
                
        function __construct() {
            return $this;
        }
        
	function editFormgen($script_id){
		if($script_id == null){
			return;
		}
		
		global $GLOBALS_OBJ;
		$this->globals = $GLOBALS_OBJ;
		$this->globals->con->select_db($this->globals->PHPAPPS_DB);
		
		$sql = new DB_query("SELECT 
								ID,
                                                                
								APP_ID, 
                                                                APP_NAME,
                                                                APP_TITLE,
                                                                APP_LABEL,
                                                                
								MODULE_ID,
								MODULE_NAME,
                                                                MODULE_TITLE,
                                                                MODULE_LABEL,
                                                                
								TABLE_NAME,
								TABLE_SCHEMA,
                                                                SCRIPT_TITLE,
                                                                SCRIPT_LABEL,
                                                                VERSION
							FROM view_forms 
							WHERE ID = :id",array(":id"=>$script_id));
echo	$sql->prnt();							
		if($this->globals->con->query($sql) == 1){
			$this->globals->con->next();

			
			$this->app_id = $this->globals->con->get_field("APP_ID");
			$this->app_name = $this->globals->con->get_field("APP_NAME");
                        $this->app_title = $this->globals->con->get_field("APP_TITLE");
                        $this->app_label = $this->globals->con->get_field("APP_LABEL");
                        
                        
                        $this->module_id = $this->globals->con->get_field("MODULE_ID");
			$this->module_name = $this->globals->con->get_field("MODULE_NAME");
                        $this->module_title = $this->globals->con->get_field("MODULE_TITLE");
                        $this->module_label = $this->globals->con->get_field("MODULE_LABEL");
			
                        
                        $this->script_id = $this->globals->con->get_field("ID");
                        $this->script_label = $this->globals->con->get_field("SCRIPT_LABEL");
                        $this->script_title = $this->globals->con->get_field("SCRIPT_TITLE");
                        $this->form_table = $this->globals->con->get_field("TABLE_NAME");
			$this->form_schema = $this->globals->con->get_field("TABLE_SCHEMA");
                        $this->script_version = $this->globals->con->get_field("VERSION");
                        
                        
			$this->deploy_location = GLOBALS_DIR .  $this->app_name; 
echo "<h1>".$this->deploy_location."</h1></br>";
			$this->deploy_location_php = $this->deploy_location . DIR_SEP ;
			$this->deploy_location_tpl = $this->deploy_location_php . DIR_SEP . "tpl" . DIR_SEP;
			$this->deploy_location_gen_php = $this->deploy_location . DIR_SEP . "generated_php" . DIR_SEP;
			$this->deploy_location_gen_tpl = $this->deploy_location_tpl . DIR_SEP . "generated_tpl" . DIR_SEP;
			
			$this->form_schema_table = $this->form_schema. "." . $this->form_table;
			
			$sql = new DB_query("SELECT
									fd.ID,
									fd.FORM_ID,
									f.SCRIPT_NAME,
									fd.FIELD,
									fd.FIELD_TYPE,
									fd.HIDDEN,
									fd.LABEL,
									fd.MANDATORY,
									fd.INPUT_TYPE,
									fd.REFERENCE_LIST,
									fd.REFERENCE_TABLE,
									fd.REFERENCE_FIELD
								FROM 	{$this->globals->PHPAPPS_DB}.form_details fd, 
										scripts f
								WHERE 	fd.FORM_ID = f.ID AND 
										FORM_ID = :form_id",array(":form_id"=>$this->script_id));
										
			$nr_res = $this->globals->con->query($sql);

			while($res=$this->globals->con->fetch_array()){
				$this->fields[] = $res["FIELD"];
				$this->fields_id[] = $res["ID"];
				$this->data_types[] = $res["FIELD_TYPE"];
				$this->hiddens[] = $res["HIDDEN"] == "1" ? $res["FIELD"] : "" ;
				$this->mandatories[] = $res["MANDATORY"] == "1" ? $res["FIELD"] : "" ;
				$this->labels[] = $res["LABEL"];
				$this->input_types[] = $res["INPUT_TYPE"];
				$this->selected_schema_list[] = $res["REFERENCE_LIST"];
				$this->selected_schema_table[] = $res["REFERENCE_TABLE"];
				$this->selected_schema_field[] = $res["REFERENCE_FIELD"];
				$this->script_name = $res["SCRIPT_NAME"];	
			}
		}
		$this->script_name == "" ? ( $this->module_name . "_" . $this->script_table . "_form" ) : $this->script_name;
		 
		$this->getListsTables();
		
		if(isset($_POST["act"])){
			$this->parseHttpPostVars();
			
			switch ($this->post_act){
				case "save":
					$this->saveForm();
				break;
				case "generate":
					$this->generateForm();
				break;
				case "preview":
					$this->previewForm();
				break;
                                case "reload_fields":
					$this->reloadTableFields();
				break;
			};
		}else{	
			//$this->getFields();
		}
		$this->display();
	}
	
	function newFormgen($mod_id,$tbl){
		global $GLOBALS_OBJ;
		$this->globals = $GLOBALS_OBJ;
		$this->globals->con->select_db($this->globals->PHPAPPS_DB);
				
		$sql = new DB_query("SELECT 
								APP_ID,
								APP_NAME,
								MODULE_ID,
								MODULE_NAME,
								ID AS TABLE_ID,
								TABLE_NAME,
								TABLE_SCHEMA
							FROM view_tables
							WHERE MODULE_ID = :mod_id AND TABLE_NAME = :tbl",
							array(":mod_id"=>$mod_id,":tbl"=>$tbl));

		if($this->globals->con->query($sql) == 1){
			$this->globals->con->next();
			
			$this->app_id = $this->globals->con->get_field("APP_ID");
			$this->module_id = $this->globals->con->get_field("MODULE_ID");
			$this->app_name = $this->globals->con->get_field("APP_NAME");
			$this->module_name = $this->globals->con->get_field("MODULE_NAME");
			$this->form_schema = $this->globals->con->get_field("TABLE_SCHEMA");
			$this->form_table = $this->globals->con->get_field("TABLE_NAME");
			$this->form_table_id = $this->globals->con->get_field("TABLE_ID");

			$this->deploy_location = GLOBALS_DIR . $this->app_name; 
			$this->deploy_location_php = $this->deploy_location . DIR_SEP ;
			$this->deploy_location_tpl = $this->deploy_location_php . DIR_SEP . "tpl" . DIR_SEP;
			$this->deploy_location_gen_php = $this->deploy_location . DIR_SEP . "generated_php" . DIR_SEP;
			$this->deploy_location_gen_tpl = $this->deploy_location_tpl . DIR_SEP . "generated_tpl" . DIR_SEP;
			$this->form_schema_table = $this->form_schema. "." . $this->form_table;

			}else{ /// pt start
				$this->app_name = "phpapps";
				$this->module_name = "phpapps_admin";
				$this->form_schema = "phpapps";
				$this->form_table = $tbl;// ?????

				$this->deploy_location = GLOBALS_DIR . $this->app_name;
				$this->deploy_location_php = $this->deploy_location . DIR_SEP ;
				$this->deploy_location_tpl = $this->deploy_location_php . DIR_SEP . "tpl" . DIR_SEP;
				$this->deploy_location_gen_php = $this->deploy_location . DIR_SEP . "generated_php" . DIR_SEP;
				$this->deploy_location_gen_tpl = $this->deploy_location_tpl . DIR_SEP . "generated_tpl" . DIR_SEP;
				
				$this->form_schema_table = $this->form_schema. "." . $this->form_table;
		}
		
		 $this->script_name = $this->module_name . "_" . $this->form_table . "_form";

		if(isset($_POST["act"])){
			$this->parseHttpPostVars();
			
			switch ($this->post_act){
				case "save":
					$this->saveForm();
				break;
				case "generate":
					$this->generateForm();
				break;
				case "preview":
					$this->previewForm();
				break;
                                case "reload_fields":
                                    echo "AICICICICICICIC";
					//$this->saveForm();
				break;
				case "select_table":
					$this->getFields();	
				break;
			};
		}else{	
			$this->getFields();	
		}
		$this->display();
	}
	
	function getFields(){
		$sql = new DB_query("DESC ".$this->form_schema_table);
		$this->globals->con->query($sql);
        
                //print_r($this->fields);
		while($res=$this->globals->con->fetch_array()){
                    if(is_array($this->fields)){
                        if ( in_array( $res["Field"],$this->fields)) {
                      //      echo $res["Field"] ."<br>";
                            continue;
                        }
                    }
                    
                    $this->fields[] = $res["Field"];
                    $this->data_types[] = $res["Type"];
                    $this->labels[] = $res["Field"];
		}
		$this->getListsTables();
	}
	
	function getListsTables(){
            
		if(!is_array($this->fields)){
			return;
		}
	
		$this->getListTables();
		$this->getDbTables();
		foreach($this->fields as $fld){	
			$this->field_schema_lists[] = $this->schema_lists; 
			$this->field_schema_tables[] = $this->schema_tables;
		}
		
		if(is_array($this->selected_schema_table)){
			foreach($this->selected_schema_table as $tbl_names){
				if($tbl_names != ""){
					$this->schema_fields[] = $this->getTableListFields($tbl_names);
				}else{
					$this->schema_fields[] = array();
				}
			}
		}
	}
	
	function getTableListFields( $table_name = "" ){
		$sql = new DB_query("DESC $table_name");
                //print_r($sql);
		$this->globals->con->query($sql);
		while($res=$this->globals->con->fetch_array()){
			$tmp_fields[] = $res["Field"];
		}
		return $tmp_fields;
	}
	
	function getListTables(){
		$this->globals->con->select_db($this->form_schema);
		//$sql = new DB_query("SHOW TABLES LIKE :tables",array(":tables"=>"list%"));
                $sql = new DB_query("SELECT CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS TABLE_NAME FROM {$this->globals->PHPAPPS_DB}.view_tables WHERE TABLE_TYPE_LABEL = :list_t ",
							array(":list_t"=>"list_table"));
                //print_r($sql);
		$this->globals->con->query($sql,"doi");
	
		while($ress=$this->globals->con->fetch_row("doi")){
			$this->schema_lists[] = $ress[0]; 
		}
	}
	
	function getDbTables(){
		$this->globals->con->select_db($this->form_schema);
		$sql = new DB_query("SELECT CONCAT(TABLE_SCHEMA,'.',TABLE_NAME) AS TABLE_NAME FROM {$this->globals->PHPAPPS_DB}.view_tables WHERE MODULE_ID = :module_id UNION ALL
							SELECT VIEW_NAME FROM {$this->globals->PHPAPPS_DB}.views WHERE MODULE_ID = :module_id",
							array(":module_id"=>$this->module_id));
                //print_r($sql);
		$this->globals->con->query($sql,"doi");
	
		while($ress=$this->globals->con->fetch_row("doi")){
			$this->schema_tables[] = $ress[0]; 
		}
	}
	
	function parseHttpPostVars(){
		$this->post_act = $_POST["act"];
		$this->script_name = $_POST["form_name"] == "" ? $this->script_name : $_POST["form_name"];
                $this->script_label = $_POST["script_label"];
                $this->script_title = $_POST["script_title"];
                
		$this->fields_id = $_POST["fields_id"];
		$this->fields = $_POST["fields"];
		$this->labels = $_POST["labels"];
		$this->data_types = $_POST["data_types"];
		$this->input_types = $_POST["input_types"];
		$this->hiddens = $_POST["hiddens"];
		$this->mandatories = $_POST["mandatories"];
		$this->selected_schema_list = $_POST["schema_lists"];
		$this->selected_schema_table = $_POST["table_lists"];
		$this->selected_schema_field = $_POST["field_lists"];
		$this->getListsTables();
	}
	
/* form_details
ID
FORM_ID
FIELD
FIELD_TYPE
HIDDEN
LABEL
MANDATORY
INPUT_TYPE
REFERENCE_LIST
REFERENCE_TABLE
REFERENCE_FIELD
*/
	
	function saveForm(){
            
            // echo "<h1>AICIC: </h1>" . $this->form_id ."<br>"; 
            //        print_r($this->fields_id);
            
		if($this->script_id == ""){
                   
		//print_r($_POST);
			$sql = new DB_query("INSERT INTO {$this->globals->PHPAPPS_DB}.scripts 
							(MODULE_ID, 
							
                                                        SCRIPT_NAME,
                                                        SCRIPT_TITLE,
                                                        SCRIPT_LABEL,
                                                        
							TABLE_ID, 
							FORM_PHP_DIR, 
							FORM_TPL_DIR,
                                                        WEB_TYPE_ID,
                                                        SCRIPT_TYPE_ID)
							
                                                        VALUES(
							:module_id, 
							:form_name,
                                                        :script_title,
                                                        :script_label,
                                                        
							:form_table_id,
							:deploy_location,
							:deploy_location,
                                                        :web_type_id,
                                                        :script_type_id)",
							array(
							":module_id"=>$this->module_id, 
							":form_name"=>$this->script_name,
                                                        ":script_title" => $this->script_title,
                                                        ":script_label" => $this->script_label,   
							":form_table_id"=>$this->form_table_id,
							":deploy_location"=>addslashes($this->deploy_location),
                                                        ":web_type_id"=>'1',
                                                        ":script_type_id"=>'1'					
							));
			$this->globals->con->query($sql);
			echo "ASAVE FORM <h1>" . $sql->prnt() ."</h1><BR>";	
			$sql = new DB_query("SELECT ID FROM {$this->globals->PHPAPPS_DB}.scripts
					WHERE SCRIPT_NAME = :form_name AND
                                        MODULE_ID = :module_id",
					array(":form_name"=>$this->script_name ,":module_id"=>$this->module_id));
			$this->globals->con->query($sql);	
			$this->globals->con->next();
			$this->script_id = $this->globals->con->get_field("ID");
			
			$this->fields_id = array();
			foreach($this->fields as $key => $fld){
			
				$sql = new DB_query("INSERT INTO {$this->globals->PHPAPPS_DB}.form_details 
					(	FORM_ID,
						FIELD,
						FIELD_TYPE,
						HIDDEN,
						LABEL,
						MANDATORY,
						INPUT_TYPE,
						REFERENCE_LIST,
						REFERENCE_TABLE,
						REFERENCE_FIELD) 
							VALUES 
					(	'".$this->script_id."',
						'".$fld."',
						'".$this->data_types[$key]."',
						'".( is_array($this->hiddens) && in_array($fld,$this->hiddens) ? "1" : "0")."',
						'".$this->labels[$key]."',
						'".( is_array($this->mandatories) && in_array($fld,$this->mandatories) ? "1" : "0")."',
						'".$this->input_types[$key]."',
						'".$this->selected_schema_list[$key]."',
						'".$this->selected_schema_table[$key]."',
						'".$this->selected_schema_field[$key]."')");
				$this->globals->con->query($sql);	
				
				$sql = new DB_query("SELECT ID FROM {$this->globals->PHPAPPS_DB}.form_details
									WHERE FORM_ID = :form_id AND 
											FIELD = :fld",
											array(":form_id"=>$this->script_id,":fld"=>$fld));
				$this->globals->con->query($sql);	
				$this->globals->con->next();
				$this->fields_id[$key] = $this->globals->con->get_field("ID");
			}
		}else{/*
			$sql =new DB_query( "UPDATE {$this->globals->PHPAPPS_DB}.forms SET
									MODULE_ID = '".$this->module_id."', 
									SCRIPT_NAME = '".$this->form_name."', 
									TABLE_ID = '".$this->form_table_id."', 
									FORM_PHP_DIR = '".addslashes($this->deploy_location)."', 
									FORM_TPL_DIR = '".addslashes($this->deploy_location)."'	
								WHERE ID = '".$this->form_id."'" );
                                                     
                 * 
                 */
                        $sql =new DB_query( "UPDATE {$this->globals->PHPAPPS_DB}.scripts SET
							SCRIPT_NAME = '".$this->script_name."' 
							WHERE ID = '".$this->script_id."'" );
				$this->globals->con->query($sql);
				
				foreach($this->fields as $key => $fld){
                                    if($this->fields_id[$key] == ""){
                                        //echo "fac insert dupa reload fields";
                                        $sql = new DB_query("INSERT INTO {$this->globals->PHPAPPS_DB}.form_details 
					(	FORM_ID,
						FIELD,
						FIELD_TYPE,
						HIDDEN,
						LABEL,
						MANDATORY,
						INPUT_TYPE,
						REFERENCE_LIST,
						REFERENCE_TABLE,
						REFERENCE_FIELD) 
							VALUES 
					(	'".$this->script_id."',
						'".$fld."',
						'".$this->data_types[$key]."',
						'".( is_array($this->hiddens) && in_array($fld,$this->hiddens) ? "1" : "0")."',
						'".$this->labels[$key]."',
						'".( is_array($this->mandatories) && in_array($fld,$this->mandatories) ? "1" : "0")."',
						'".$this->input_types[$key]."',
						'".$this->selected_schema_list[$key]."',
						'".$this->selected_schema_table[$key]."',
						'".$this->selected_schema_field[$key]."')");
                                        
                                    }else{
// aici insert pentru reload                                    
					$sql = new DB_query("UPDATE {$this->globals->PHPAPPS_DB}.form_details SET
						FIELD = '".$fld."',
						FIELD_TYPE = '".$this->data_types[$key]."',
						HIDDEN = '".( is_array($this->hiddens) && in_array($fld,$this->hiddens) ? "1" : "0")."',
						LABEL = '".$this->labels[$key]."',
						MANDATORY = '".( is_array($this->mandatories) && in_array($fld,$this->mandatories) ? "1" : "0")."',
						INPUT_TYPE = '".$this->input_types[$key]."',
						REFERENCE_LIST = '".$this->selected_schema_list[$key]."',
						REFERENCE_TABLE = '".$this->selected_schema_table[$key]."',
						REFERENCE_FIELD = '".$this->selected_schema_field[$key]."'
						WHERE FORM_ID = '".$this->script_id."' 
                                    				AND ID = '".$this->fields_id[$key]."'");
                                    }
        //echo $sql->sql() . "<br>";
					if( $this->globals->con->query($sql) != -1){
                                            $this->errors[] = $this->globals->con->get_error();
                                        }
                                       // echo $sql->query_str . "<br><br>";
				}
				
			}
            //reincarc forma            
            //$this->editFormgen($this->form_id);
	}
	
	function generateForm(){
                                   
		$this->generateFormPhp();
		$this->generateFormTpl();
		$this->generateImpClass();
		$this->generateImpTpl();
	}
	
	function generateImpTpl(){
		$tmp_arr = array_diff($this->fields,$this->hiddens);
		$visible_fields = is_array($this->hiddens) ? (array_values($tmp_arr)) : $this->fields;
		$visible_labels = is_array($this->hiddens) ? array_values(array_intersect_key($tmp_arr,$this->labels)):$this->labels;
		$visible_types = is_array($this->hiddens) ? array_values(array_intersect_key($this->input_types,$tmp_arr)):$this->input_types;
		$visible_schema_list = is_array($this->hiddens) ? array_values(array_intersect_key($this->selected_schema_list,$tmp_arr)):$this->selected_schema_list;
		$visible_schema_table = is_array($this->hiddens) ? array_values(array_intersect_key($this->selected_schema_table,$tmp_arr)):$this->selected_schema_table;	
		$visible_schema_field = is_array($this->hiddens) ? array_values(array_intersect_key($this->selected_schema_field,$tmp_arr)):$this->selected_schema_field;	
		$this->globals->sm->assign(array(
				"input_types" => $visible_types,
				"fields" => $visible_fields,
				"labels" => $visible_labels,
				
				"form_table" => $this->form_table,
				"form_name" => $this->script_name,
				"database" => $this->form_schema,
				"mandatories" => $this->mandatories,
				
				"selected_schema_list" => $visible_schema_list,
				"selected_schema_table" => $visible_schema_table,
				"selected_schema_field" => $visible_schema_field,
                                "tpl_form_template" => "generated_tpl/" .  $this->script_name . "_generated.tpl" 
				
				//"tpl_form_template" => "generated_tpl/" . ( $this->script_name == "" ? $this->form_table."_generated.tpl" : $this->script_name."_gen.tpl" )
                        //
		));
	
		$tpl_content = $this->globals->sm->fetch('tpl_form_template_imp.tpl');
		//$file_name = $this->script_name == "" ? $this->form_table."_imp.tpl" : $this->form_name."_imp.tpl";
                $file_name = $this->script_name .".tpl";
		
		//if(!file_exists($this->deploy_location_php . $file_name)) {	
		if(!file_exists(GLOBALS_DIR . $this->app_name . DIR_SEP ."tpl" . DIR_SEP . $file_name)) {	
			$fp = fopen($this->deploy_location_tpl . $file_name, 'w');
			fwrite($fp, $tpl_content);
			fclose($fp);
		}else{
		//echo "<br>tpl_imp - !!!EXISTA:".GLOBALS_DIR . $this->app_name . DIR_SEP ."tpl" . DIR_SEP . $file_name."<br>";
		}
	}
	
        /*
	function generateGridClass(){
		$this->globals->sm->assign(array(
			"form_name" => $this->form_name,
			"table" => $this->form_table,
			"schema" => $this->form_schema,
		));
		$php_content = $this->globals->sm->fetch('php_class_grid_template.tpl');
		$file_name = $this->form_name == "" ? "form_".$this->form_table."_grid.php" : $this->form_name."_grid.php";
		if(!file_exists(GLOBALS_DIR . $this->app_name . DIR_SEP . $file_name)){
			$fp = fopen($this->deploy_location_php . $file_name, 'w');
			fwrite($fp, $php_content);
			fclose($fp);
		}
	}
	*/
	function generateImpClass(){
		$this->globals->sm->assign(array(
			"form_name" => $this->script_name,
                        "script_id" => $this->script_id,
                        "SCRIPT_VERSION" => $this->script_version,
                        "APP_ID" => $this->app_id,
                        "APP_NAME" => $this->app_name,
                        "APP_TITLE" => $this->app_title,
                        "APP_LABEL" =>$this->app_label,
                        "MODULE_ID" => $this->module_id,
                        "MODULE_NAME" => $this->module_name,
                        "MODULE_TITLE" => $this->module_title,
                        "MODULE_LABEL" => $this->module_label,
                        "SCRIPT_TITLE" => $this->script_title,
                        "SCRIPT_LABEL" => $this->script_label,
		));
		$php_content = $this->globals->sm->fetch('php_class_form_template_imp.tpl');
		//$file_name = $this->form_name == "" ? "form_".$this->form_table."_imp.php" : $this->form_name."_imp.php";
                $file_name = $this->script_name . ".php";// == "" ? "form_".$this->form_table."_imp.php" : $this->form_name."_imp.php";
		if(!file_exists(GLOBALS_DIR . $this->app_name . DIR_SEP . $file_name)){
			$fp = fopen($this->deploy_location_php . $file_name, 'w');
			fwrite($fp, $php_content);
			fclose($fp);
		}
	}
	
	function generateFormPhp(){
		$tmp_arr = array_diff($this->fields,$this->hiddens);
		$visible_fields = is_array($this->hiddens) ? (array_values($tmp_arr)) : $this->fields;
                $visible_types = is_array($this->hiddens) ? array_values(array_intersect_key($this->input_types,$tmp_arr)):$this->input_types;
		$visible_schema_list = is_array($this->hiddens) ? array_values(array_intersect_key($this->selected_schema_list,$tmp_arr)):$this->selected_schema_list;
		$visible_schema_table = is_array($this->hiddens) ? array_values(array_intersect_key($this->selected_schema_table,$tmp_arr)):$this->selected_schema_table;	
		$visible_schema_field = is_array($this->hiddens) ? array_values(array_intersect_key($this->selected_schema_field,$tmp_arr)):$this->selected_schema_field;	
                
                $visible_labels = is_array($this->hiddens) ? array_values(array_intersect_key($this->labels,$tmp_arr)):$this->labels;
                //$visible_labels = array_diff($visible_labels,$this->hiddens);
		//print_r($visible_schema_list);
		echo "<br>";
		//print_r($visible_fields);
		$this->globals->sm->assign(array(
				"hiddens" => $this->hiddens,

				"fields" => $visible_fields,
                                "labels" => $visible_labels,
				"input_types" => $visible_types,
				"form_table" => $this->form_table,
				"form_schema" => $this->form_schema,
				"mandatories" => $this->mandatories,
				"form_name" => $this->script_name . "_generated",
				"deploy_location" => $this->deploy_location,
				
				"selected_schema_list" => $visible_schema_list,
				"selected_schema_table" => $visible_schema_table,
				"selected_schema_field" => $visible_schema_field,
			));
			
			$php_content = $this->globals->sm->fetch('php_class_form_template.tpl');
			
			 //$file_name = $this->form_name == "" ? "form_".$this->form_table.".php" : $this->form_name.".php";
                        $file_name = $this->script_name . "_generated.php";// == "" ? "form_".$this->form_table.".php" : $this->form_name.".php";
			echo  "<h1>$file_name</h1>";
			$fp = fopen($this->deploy_location_gen_php. $file_name, 'w');
//echo $this->deploy_location_php . $file_name . "<br>";
			fwrite($fp, $php_content);
			fclose($fp);
			//impl
	}
	function generateFormTpl(){
	
		$tmp_arr = array_diff($this->fields,$this->hiddens);
		$visible_fields = is_array($this->hiddens) ? (array_values($tmp_arr)) : $this->fields;
		$visible_labels = is_array($this->hiddens) ? array_values(array_intersect_key($this->labels,$tmp_arr)):$this->labels;
		$visible_types = is_array($this->hiddens) ? array_values(array_intersect_key($this->input_types,$tmp_arr)):$this->input_types;
		$visible_schema_list = is_array($this->hiddens) ? array_values(array_intersect_key($this->selected_schema_list,$tmp_arr)):$this->selected_schema_list;
		$visible_schema_table = is_array($this->hiddens) ? array_values(array_intersect_key($this->selected_schema_table,$tmp_arr)):$this->selected_schema_table;	
		$visible_schema_field = is_array($this->hiddens) ? array_values(array_intersect_key($this->selected_schema_field,$tmp_arr)):$this->selected_schema_field;	
		$this->globals->sm->assign(array(
				"input_types" => $visible_types,
				"fields" => $visible_fields,
				"labels" => $visible_labels,
				//"labels" => $this->labels,
				
				"table" => $this->form_table,
				"form_name" => $this->script_name,
				"database" => $this->form_schema,
				"mandatories" => $this->mandatories,
				
				"selected_schema_list" => $visible_schema_list,
				"selected_schema_table" => $visible_schema_table,
				"selected_schema_field" => $visible_schema_field,
	
		));
	
		$tpl_content = $this->globals->sm->fetch('tpl_form_template.tpl');
		$file_name = $this->script_name . "_generated.tpl";// == "" ? "form_".$this->form_table.".tpl" : $this->form_name.".tpl";
		$fp = fopen($this->deploy_location_gen_tpl . $file_name, 'w');
//echo "<br>".$this->deploy_location_gen_tpl . $file_name."<br>";
		fwrite($fp, $tpl_content);
		fclose($fp);
	}
	
	function previewForm(){
	}
	
        function reloadTableFields(){
            $this->getFields();	
        }
        
	function display(){
//                $this->load_elements();
                
		//$this->labels = count($this->labels) < 1 ? $this->fields : $this->labels;
		$this->globals->sm->assign(array(
				"form_name" => $this->script_name,
                                "script_title" => $this->script_title,
                                "script_label" => $this->script_label,
                                "script_version" => $this->script_version,
                    
				"deploy_location" => $this->deploy_location_php,
				
                                "fields" => $this->fields,
				"fields_id" => $this->fields_id,
                                "input_types" => $this->input_types,
				"data_types" => $this->data_types,
				"labels" => $this->labels,
				"hiddens" => $this->hiddens,
				"mandatories" => $this->mandatories,
				"schema_lists" => $this->field_schema_lists,
				"table_lists" => $this->field_schema_tables,
				"field_lists" => $this->schema_fields,
				
				"selected_schema_list" => $this->selected_schema_list,
				"selected_schema_table" => $this->selected_schema_table,
				"selected_schema_field" =>$this->selected_schema_field,
				
				"module_id" => $this->module_id,
				"form_table" => $this->form_table,
				"form_id" => $this->script_id,
                                "errors" => implode("<br>",$this->errors)
				
        ));
                
                $this->tpl = "phpapps_admin_formgen.tpl";
                $this->load_elements();
                $this->display_template();
		//$this->globals->sm->display("phpapps_admin_formgen.tpl");
                
               
	}
};
?>