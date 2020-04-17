<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_menu_items_form.php");
	class phpapps_designer_menu_items_form_impl  extends phpapps_designer_menu_items_form{
		function __construct(){
			parent::__construct();
			$this->template = "phpapps_designer_menu_items_form_imp.tpl";
                        
                        $this->MENU_ID = $_GET["menu_id"];
                        
			$this->init();
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
	
		function beforeAddRec(){
                    if($this->PID == ''){
                        $this->PID = '0';
                    }
                        
		}
		
		function afterAddRec(){
                    echo "ADDERDDDD";
                    echo $this->query->prnt();
                    print_r($this->errors);
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
                    if($this->PID == ''){
                        $this->PID = '0';
                    }
		}
		
		function afterSaveRec(){
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
		}
		
		function afterDeleteRec(){
		//	header("Location:win_close.html");
		}
		
		function beforeDisplay(){	
                    //echo "<h1>".$this->MENU_ID."</h1>";
                     $this->PID_sel->db_query = new DB_query("SELECT ID AS VALUE, LABEL FROM phpapps.menu_items WHERE MENU_ID = :menu_id ORDER BY ID",array(":menu_id"=>$this->MENU_ID));
                     $this->PID_sel->setup_select_options();
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_designer_menu_items_form_Impl = new phpapps_designer_menu_items_form_impl();
?>