<?php
require_once ("globals.php");
include ("gen_php/phpapps_designer_grid_columns_form.php");
	class phpapps_designer_grid_columns_form_impl  extends phpapps_designer_grid_columns_form{
            
                var $TABLE_ID;
            
		function __construct(){
			parent::__construct();
                        $this->layout = PHPAPPS_LAYOUTS_DIR . "default_form.tpl";
			$this->template = "phpapps_designer_grid_columns_form_imp.tpl";
			$this->init();
                        $this->GRID_ID = $_GET["grid_id"];
                        $this->TABLE_ID = $_GET["table_id"];
			$this->display();
		}
		
		function beforeGetRec(){
		}
		
		function afterGetRec(){
		}
                
                function beforePostActions(){
                }
	
		function beforeAddRec(){
		}
		
		function afterAddRec(){
                    //print_r($this->query);
                    echo $this->query->prnt();
			//header("Location:win_close.html");
		}
		
		function beforeSaveRec(){
		}
		
		function afterSaveRec(){
			//header("Location:win_close.html");
		}

		function beforeDeleteRec(){
		}
		
		function afterDeleteRec(){
		//	header("Location:win_close.html");
		}
		
                function afterPostActions(){
                }
                
		function beforeDisplay(){
                    switch(_tbl("phpapps.tables","TABLE_TYPE",$this->TABLE_ID)){
                        case '1':
                        break;    
                        case '2':
                            $this->COLUMN_ID_sel->set_query(new DB_query("SELECT ID AS VALUE, COLUMN_NAME AS LABEL "
                            . "     FROM phpapps.table_details WHERE TABLE_ID = (SELECT IF(ORIGIN_ID = 0,ID,ORIGIN_ID) FROM TABLES WHERE ID = :table_id) ",array(":table_id"=>$this->TABLE_ID)));
                            $this->COLUMN_ID_sel-> setup_select_options();
                        break;
                    }
		}
		
		function afterDisplay(){	
		}
		
	};
	
	$phpapps_designer_grid_columns_form_Impl = new phpapps_designer_grid_columns_form_impl();
?>