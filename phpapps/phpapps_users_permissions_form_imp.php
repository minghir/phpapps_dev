<?php
require_once ("globals.php");
include ("gen_php/phpapps_users_permissions_form.php");
	class phpapps_users_permissions_form_impl  extends phpapps_users_permissions_form{
		function phpapps_users_permissions_form_impl(){
			global $GLOBALS_OBJ;
			$this->globals = $GLOBALS_OBJ;
			
			$this->template = "phpapps_users_permissions_form_imp.tpl";
			
			$this->init();
			print_r($_POST);
			echo "<h1>{".$this->OBJECT_TYPE."}</h1>";
			switch($this->OBJECT_TYPE){
				case 3:
					echo "ICIC";
					$sel_table = "phpapps.tables";
				break;
				default:
					$sel_table = "dual";
				break;
			}
			
			$object_id_sel = new DB_select("OBJECT_ID",$sel_table);
			$object_id_sel->value_col = "ID";
			$object_id_sel->label_col = "TABLE_NAME";
			$object_id_sel->selected_val = $this->OBJECT_ID;
			$object_id_sel->setup_select_options();
			$this->globals->sm->assign("FROM_IMP_CLASS",
							"<tr><td align=\"right\">OBJECT ID :</td><td>".
							$object_id_sel->get_select_str() .
							"</td></tr>"	
							);
			//$FROM_IMP_CLASS
			$this->display();
		}
	};
	
	$phpapps_users_permissions_form_Impl = new phpapps_users_permissions_form_impl();
?>