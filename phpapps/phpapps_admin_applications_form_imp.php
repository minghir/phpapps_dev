<?php
namespace wabdo;
require_once ("globals.php");

include ("gen_php/phpapps_admin_applications_form.php");
	class phpapps_admin_applications_form_impl  extends phpapps_admin_applications_form{
                 public $script_id = 288;
                        public $display_objects_type_id = '2';
                        public $display_objects_type = 'SCRIPT';
                        public $display_objects_id = 288;
                
                public function __construct() {
                    parent::__construct();
                    $this->tpl = "phpapps_admin_applications_form_imp.tpl";
			
			if ($_SERVER['REQUEST_METHOD'] === 'POST'){
				//if($_POST["BASE_DIR"] != ""){
                                    // cred ca trebuie la after rec
					//$this->create_dir_struct();
                                        $src =  GLOBALS_DIR .  "template_app";
                                        $dest = GLOBALS_DIR .  $_POST["APP_NAME"];
                                        
                                       // echo "<br><h1>SRC:$src</h1><br><br><br><h1>SRC:$dest</h1><br><br>";
                                        $this->recursive_copy($src,$dest );
                                        $this->gen_global_php($_POST["APP_NAME"]);
				//}
			}
			//$this->form_com_type = "ajax";
                        $this->USER_ID = $this->globals->USER_ID;
			$this->init();
                        $this->load_elements();
			$this->display();
                        print_r($this->errors);
		}
		
                function afterSaveRec(){
                   //echo  $this->ajax_server_resp();
                }
                
                
                
		function create_dir_struct(){
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"];
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "gen_php";
                        $structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "tpl";
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "tpl/gen_tpl";
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "css";
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "js";
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "imgs";
                        $structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "sql";
			$structures[] = $_POST["BASE_DIR"] . $_POST["APP_NAME"] . DIR_SEP . "users_data";
			foreach ($structures as $structure){
				if (!file_exists($structure)) {
					if (!mkdir($structure, 0777, true)) {
						die('Failed to create folders...');
						//echo $structure;
						//exit;
					}
				}
			}
		}
                
                function recursive_copy($src,$dst) {
                    $dir = opendir($src);
                    mkdir($dst);
                    while(( $file = readdir($dir)) ) {
                        if (( $file != '.' ) && ( $file != '..' )) {
                            if ( is_dir($src . '/' . $file) ) {
				$this->recursive_copy($src .'/'. $file, $dst .'/'. $file);
                            }else {
				copy($src .'/'. $file,$dst .'/'. $file);
                            }
                        }
                    }
                    closedir($dir);
                }
                
                function gen_global_php($APP_NAME){
                    $this->globals->sm->assign(array(
				"APP_NAME" => $APP_NAME,
				));
	
                    $tpl_content = $this->globals->sm->fetch('php_newapp_global_template.tpl');
                    
                    $fp = fopen( GLOBALS_DIR .  $APP_NAME . DIR_SEP . "globals.php", 'w');

                    fwrite($fp, $tpl_content);
                    fclose($fp);
                }
                
                function afterDeleteRec(){
                    print_r($this->errors);
                }
		
	};
        
	
	$phpapps_admin_applications_form_Impl = new phpapps_admin_applications_form_impl();
	//$phpapps_admin_applications_form_Impl->globals->con->print_log();
?>