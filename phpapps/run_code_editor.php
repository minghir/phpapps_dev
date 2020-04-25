<?php
	require_once ("globals.php");
	require_once ("libs/code_editor.php");
	class run_code_editor{
		
		private $globals;
		private $file_path;
                private $php_file_path;
                private $tpl_file_path;
		
		function __construct(){
		
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
			
			
			switch($_GET["gact"]){
				case "editImpPhp":
					$sql = new DB_query("SELECT FORM_NAME,APP_NAME FROM phpapps.view_forms WHERE ID  = :id ",array(":id"=>$_GET["gfield_value"]));
					$this->globals->con->query($sql);
					$this->globals->con->next();
					$this->file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP .$this->globals->con->get_field("FORM_NAME") . "_imp.php";
                                        $this->php_file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP .$this->globals->con->get_field("FORM_NAME") . "_imp.php";
                                        
                                        $sql = new DB_query("SELECT FORM_NAME,APP_NAME FROM phpapps.view_forms WHERE ID = :id ",array(":id"=>$_GET["gfield_value"]));
					$this->globals->con->query($sql);
					$this->globals->con->next();
					$this->tpl_file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP ."tpl" . DIR_SEP . $this->globals->con->get_field("FORM_NAME") . "_imp.tpl";
				break;
				case "editImpTpl":
					$sql = new DB_query("SELECT FORM_NAME,APP_NAME FROM phpapps.view_forms WHERE ID = :id ",array(":id"=>$_GET["gfield_value"]));
					$this->globals->con->query($sql);
					$this->globals->con->next();
					$this->file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP ."tpl" . DIR_SEP . $this->globals->con->get_field("FORM_NAME") . "_imp.tpl";
				break;
				
				case "editScriptPhp":
					$sql = new DB_query("SELECT SCRIPT_NAME,APP_NAME FROM phpapps.view_scripts WHERE ID = :id ",array(":id"=>$_GET["gfield_value"]));
					$this->globals->con->query($sql);
					$this->globals->con->next();
					$this->file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP .$this->globals->con->get_field("SCRIPT_NAME") . ".php";
                                        $this->php_file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP .$this->globals->con->get_field("SCRIPT_NAME") . ".php";
                                        
                                        $sql = new DB_query("SELECT SCRIPT_NAME,APP_NAME FROM phpapps.view_scripts WHERE ID = :id ",array(":id"=>$_GET["gfield_value"]));
					$this->globals->con->query($sql);
					$this->globals->con->next();
					$this->tpl_file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP ."tpl" . DIR_SEP . $this->globals->con->get_field("SCRIPT_NAME") . ".tpl";
				break;
				case "editScriptTpl":
					$sql = new DB_query("SELECT SCRIPT_NAME,APP_NAME FROM phpapps.view_scripts WHERE ID = :id ",array(":id"=>$_GET["gfield_value"]));
					$this->globals->con->query($sql);
					$this->globals->con->next();
					$this->file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME") . DIR_SEP ."tpl" . DIR_SEP . $this->globals->con->get_field("SCRIPT_NAME") . ".tpl";
				break;
                                case "editLayoutTpl":
                                         $sql = new DB_query("select NAME,APP_NAME from view_layouts where ID = :layout_id",
                                                array(":layout_id"=> $_GET["gfield_value"] ));
                                        if( $this->globals->con->query($sql,"layout_sql") != 1){
                                            return;
                                        }
                                        $this->globals->con->next("layout_sql");
                                        $this->file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME","layout_sql") .  DIR_SEP .'tpl' . DIR_SEP . 'layouts' . DIR_SEP . $this->globals->con->get_field("NAME","layout_sql") . '.tpl';
				break;
                                case "editTpl":
                                        $sql = new DB_query("select TEMPLATE_NAME,APP_NAME,ELEMENT_TYPE from view_templates where ID = :layout_id",
                                                array(":layout_id"=> $_GET["gfield_value"] ));
                                   
                                        if( $this->globals->con->query($sql,"layout_sql") != 1){
                                            return;
                                        }
                                        $this->globals->con->next("layout_sql");
                                         switch($this->globals->con->get_field("ELEMENT_TYPE","layout_sql")){
                                                case 'MENU':
                                                    $path_to = 'menus';
                                                break;
                                                case 'GRID':
                                                    $path_to = 'grids';
                                                break;
                                                 case 'CUSTOM_ELEMENT':
                                                    $path_to = 'custom_elements';
                                                break;
                                        }
                                        $this->file_path = GLOBALS_DIR . $this->globals->con->get_field("APP_NAME","layout_sql") .  DIR_SEP .'tpl' . DIR_SEP . $path_to . DIR_SEP . $this->globals->con->get_field("TEMPLATE_NAME","layout_sql") . '.tpl';
                                break;
			}
			$ce = new code_editor($this->file_path);
			$ce->display();
                        //echo $ce->get_str();
                        
                        //$ce_php = new code_editor($this->php_file_path);
			//$ce->display();
                        //echo $ce_php->get_str();
                        
                        //$ce_tpl = new code_editor($this->tpl_file_path);
			//$ce->display();
                        //echo $ce_tpl->get_str();
		}
	}	

	$ce = new run_code_editor();
	
?>