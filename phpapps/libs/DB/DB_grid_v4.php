<?php
require_once (PHPAPPS_LIBS_DIR . "HrefActions.php");

class DB_grid {
    
    var $grid_types = array("table","query");
    var $grid_type;
    var $grid_title;
    var $db_grid_name;
    var $init_query;
    var $query;

    var $table;
    var $error;
    var $mode_search = false;
    var $con;
    var $sm; //smarty
    var $editable = true;
    var $paginable = true;
    var $filterable = true;
    var $exportable = true;
    var $sortable = true;
    var $edit_form;
    var $get_pg = 1;
    var $last_page = 1;
    var $rows_on_pg = 25;
    var $req_uri;
    var $act;
    var $id;
    var $cols = array("*");
    var $labels = array();
    var $get_vars = array();
    var $fields = array();
    var $filter_fld = array();
    var $filter_val = array();
    var $filter_rle = array();
    var $row_actions =  array();
    var $grid_actions =  array();
    var $where_rules = array(); // clauze where 
    var $where_params = array(); // parametri din where
    var $order_fld = array("ID");
    var $order_rle = array("DESC");
    var $current_order_field;
    var $current_order_rule;
    var $order_rule;
    var $where_rule;

    var $num_rows = 0;
	
    public $template = 'db_grid3.tpl';

    function __construct($conn, $g_type, $str_sql, $grid_name = ""){
	  
            session_start();
            $this->sm = new Smarty;
            $this->sm->template_dir = DB_LIBS_TPL_DIR;
            $this->sm->compile_dir = SMARTY_COMPILE_DIR;
            $this->con = &$conn;
			
            $this->query = new DB_query("");

             switch ($g_type)
             {
               case "table":
                    $this->grid_type = $g_type;
                    $this->table = $str_sql;
                    $this->db_grid_name = $grid_name == "" ? $str_sql : $grid_name;
               break;
               case "query":
                    $this->grid_type = $g_type;
                    $this->query =  $str_sql;
                    $this->init_query = $str_sql->sql();
                    $this->db_grid_name = $grid_name == "" ? "str_sql" : $grid_name;
               break;
               default:
                     $this->error = "WRONG grid type!";
               return $error;
             }
			 //
			 $this->get_session_vars();
			 $this->parse_http_get_vars();
			 $this->parse_http_post_vars();
        }

    function setup_table_query(){
			
			$filter_where_rls = $this->where_rules; 
			$filter_where_params = $this->where_params; 
			$this->cols[] = "ID";
			$select_cols = implode(", ",$this->cols);
	
			for ($i = 0; $i < count($this->filter_fld); $i++){
				if($this->filter_val[$i] == "") {
					continue;
				}
//				$filter_where_rls[] = " ".$this->filter_fld[$i]." ".$this->filter_rle[$i]." '".$this->filter_val[$i]."' ";


				$filter_where_rls[] = " ".$this->filter_fld[$i]." ".$this->filter_rle[$i]." :".$this->filter_fld[$i]." "; 
				$filter_where_params[":".$this->filter_fld[$i]] = $this->filter_val[$i];
				//'".$this->filter_val[$i]."' ";
			}
			$this->where_params = $filter_where_params;
/*			
echo "<br>--------------<br><h1>";
print_r($filter_where_rls);	
echo"<br>";	
print_r($filter_where_params);
echo"</h1><br>----------------<br>";	
*/
			if(count($filter_where_rls) > 0){
				$this->where_rule = " WHERE " . implode(" AND ", $filter_where_rls);
			}else{
				$this->where_rule = "";
			}
//echo "<h1>".$this->where_rule."</h1>			";
			if($this->current_order_field != ""){
				$this->order_rule  = " ORDER BY " . $this->current_order_field . " " . $this->current_order_rule;
			}
					
			if($this->paginable){
				$this->set_num_rows();
				$limit =  ( $this->get_pg - 1 ) * $this->rows_on_pg;
			}
				
			if($this->paginable){
				$this->query->query_str = "SELECT $select_cols FROM ". $this->table ." ".$this->where_rule . $this->order_rule . " limit " .
					$limit ."," . $this->rows_on_pg ;
			}else{
				$this->query->query_str = "SELECT $select_cols FROM ". $this->table ." ".$this->where_rule . $this->order_rule;
			}
			$this->query->setParams($filter_where_params);	
                        
//print_r($this->query);
//echo $this->query->sql()."<br>";
        }

        function setup_query_query(){
		   $this->filterable = false;
		   /*
		   // $this->query =  $str_sql;
                   if(strpos($this->query->query_str,"FROM") !== FALSE ){
                       
                        if( strpos($this->query->query_str,"ID") === FALSE ){
                            $this->init_query = str_ireplace("FROM", ",ID FROM", $this->init_query);
                        }
                        
						
                        if($this->sortable){
			   if($this->current_order_field != ""){
				$this->order_rule  = " ORDER BY " . $this->current_order_field . " " . $this->current_order_rule;
                            }
			}
					
			if($this->paginable){
				$this->set_num_rows();
				$limit =  ( $this->get_pg - 1 ) * $this->rows_on_pg;
			}
				
			if($this->paginable){
				$this->query->query_str  = $this->init_query ." ". $this->order_rule . " limit " . $limit ."," . $this->rows_on_pg ;
			}else{
				print_r($this->init_query);
				$this->query  = $this->init_query;
			}
                   }
			*/
				$this->query  = $this->init_query;
        }

        function setup_grid(){
			$fields = array();
			$vals = array();
			
			if($this->editable === true){
				$ea = new HrefActions();
				$ea->act_script = $this->edit_form;
				$ea->label = "edit";
				$ea->popup = true;
				$ea->action = "editRec";
				$ea->fields = array("ID");
				$this->add_row_acction($ea);
						
				$da = new HrefActions();
				$da->act_script = $this->edit_form;
				$da->label = "delete";
				$ea->popup = true;
				$da->confirm_msg = "Sigur stergeti inregistrarea?";
				$da->action = "deleteRec";
				$da->fields = array("ID");
				$this->add_row_acction($da);
				
				$ga = new HrefActions();
				$ga->act_script = $this->edit_form;
				$ga->label = "new";
				$ga->popup = true;
				$ga->action = "newRec";
                                //$ga->action = "addRec";
				$this->add_grid_acction($ga);
				
			}
			
			if($this->exportable === true){
				$get_str = $this->make_get_string();
				$ga = new HrefActions();
				$ga->act_script = $this->req_uri."?".$get_str.$this->db_grid_name."=gact=export_xls";
				$ga->label = "xls";
				$this->add_grid_acction($ga);
			}
//echo "<h1>AICI:<br>".$this->query->query_str."</h1>";
//print_r($this->query);
			//$sql = new DB_query($this->query);
			
			$nr_res = $this->con->query($this->query, $this->db_grid_name);
			
                        if($this->grid_type == "query"){
                            for($i = 0;$i <= $this->con->get_num_fields($this->db_grid_name) - 1; $i++){ // fara ultimul camp care este id
								$fields[] = $this->con->get_field_name($i,$this->db_grid_name);
                            }
                            
                        }else{
                            for($i = 0;$i <= $this->con->get_num_fields($this->db_grid_name) - 2; $i++){ // fara ultimul camp care este id
								$fields[] = $this->con->get_field_name($i,$this->db_grid_name);
                            }
                        }
			//print_r($fields);
			$this->fields = $fields;
                        
			while($res=$this->con->fetch_row($this->db_grid_name)){
                        //while($res=$this->con->fetch_array($this->db_grid_name)){
				//print_r($res);
			//	$vals_key_fields[] = $res;
                            $values[] = $res;
                            
                            foreach($this->fields as $key=>$fld){
                                $values_fields_tmp[$fld] = $res[$key];
                                $values_labels_tmp[$this->labels[$key]] = $res[$key];
                            }
                            $values_fields[] = $values_fields_tmp;
                            $values_labels[] = $values_labels_tmp;
                                    
                            
				if($this->grid_type == "table"){
					// adaug custom actions
										
					$tmp_act = "";
					for( $i = 0; $i< count($this->row_actions); $i++){// as $key=>$value){
						$tmp_act .= $this->row_actions[$i]->getFieldHref($res,$fields);
						if($i < (count($this->row_actions) - 1) ){
							$tmp_act .= " | ";
						}
					}
					$row_href_actions[] = $tmp_act;
					
			
				}else{
					$tmp_act = "";
					foreach($this->row_actions as $key=>$value){
						$tmp_act .= $this->row_actions[$key]->getFieldHref($res,$fields) . " | ";
					}
					$row_href_actions[] = $tmp_act;
				}
			}
			
			if($this->paginable){
				$pgs_hrefs = $this->get_pgs_hrefs();
			}	
			
			$tmp_g_act = "";
			for( $i = 0; $i< count($this->grid_actions); $i++){// as $key=>$value){
				$tmp_g_act .= $this->grid_actions[$i]->getHref();
				if($i < (count($this->grid_actions) - 1) ){
					$tmp_g_act .= " | ";
				}
			}
			$grid_href_actions = $tmp_g_act;
			$this->sm->assign(array(
									  "fields" =>  $fields ,
									  "labels" => $this->labels,
									  "values" => $values,
                                                                          "values_fields" => $values_fields,
                                                                          "values_labels" => $values_labels,
									  "paginable" => $this->paginable,
									  "filterable" => $this->filterable,
									  "exportable" => $this->exportable,
									  "sortable" => $this->sortable,
									  
									  "edit_form" => $this->edit_form,
									  "pgs_hrefs" => $pgs_hrefs,
									  
									  "num_rows" => $this->num_rows,
									  "pages" => $this->last_page,
									  "filter_val" => $this->filter_val,
									  
									  "mode_search" => $this->mode_search,
									  
									  "order_hrefs" => $this->get_ord_hrefs(),
									  "current_order_field" => $this->current_order_field,
									  "current_order_rule" => $this->current_order_rule,
									  
									  "grid_title" => ($this->grid_title == "" ? $this->table : $this->grid_title),
									  "new_rec_action" => ((!strpos($this->edit_form,"?")) ? "?" : "&")."gact=newRec",
									  "row_href_actions" => $row_href_actions,
									  "grid_href_actions" => $grid_href_actions,
									  
									  ));
			 $this->set_session_vars();
        }

        function get_grid_str(){
			if($this->get_vars["gact"] == "export_xls"){
				$this->export_xls();
				return;
			}
		    switch ($this->grid_type)
            {
				case "table":
                    $this->setup_table_query();
					$this->setup_grid();
				break;
				case "query":
                    //$this->setup_query_query();
					$this->setup_grid();
				break;
				default:
                     $this->error = "WRONG grid type!";
				return $error;
            }
			 
			return $this->sm->fetch($this->template);
        }

        function parse_http_get_vars(){
		
            $this->req_uri = $_SERVER["PHP_SELF"];
            if($_GET[$this->db_grid_name] != ""){
                $vars = explode(':',$_GET[$this->db_grid_name]);

				foreach($vars as $var){
					$tmp = explode("=",$var);
					$this->get_vars[$tmp[0]] = $tmp[1];
				}
            }
			
			$this->get_pg = $this->get_vars["pg"];

			$this->current_order_field = $this->get_vars["current_order_field"];
			$this->current_order_rule = $this->get_vars["current_order_rule"];
       }
		
		function parse_http_post_vars(){
			
			$tmp_vals = $_POST["filter_val"];
			$tmp_rles = $_POST["filter_rle"];
			if($_POST["pact"] == "Go"){
				if(count($_POST["filter_fld"]) > 0){
					foreach ( $_POST["filter_fld"] as $key => $fld){
						$this->filter_fld[$key] = $fld;
						$this->filter_val[$key] = $tmp_vals[$key]; 
						$this->filter_rle[$key] = $tmp_rles[$key];
					}
					$this->mode_search = true;
				}
			}
			if($_POST["pact"] == "X"){
				$this->filter_fld = array();
				$this->filter_val = array(); 
				$this->filter_rle = array();	
				$this->mode_search = false;
			}
		}

        function make_get_string(){
			  if(!is_array($_GET) ) return "";
			  foreach($_GET as $key=>$val){
				if($key == $this->db_grid_name) continue;
				$get_string .= "$key=$val&";
			  }
//echo "GET_STRING:" . $get_string ."<br><br>";
//echo "REQ_URI:" . $this->req_uri . "<br><br>";

			  return $get_string;
        }
		
		function get_pgs_hrefs(){
//		$get_str = $this->make_get_string();
//		return $this->req_uri."?".$get_str.$this->db_grid_name."=gact=export_xls:current_order_field=".$this->current_order_field.":current_order_rule=".$this->current_order_rule;
		
			//$url = $_SERVER['SCRIPT_NAME'] . "?";
			$url = $this->req_uri."?".$this->make_get_string();
//echo $url;
			$ord_href = ":current_order_field=".$this->current_order_field.":current_order_rule=".$this->current_order_rule;
			$hrefs[] = "<a href=\"".$url.$this->db_grid_name."=pg=1$ord_href\"><|</a>";
			$hrefs[] = "<a href=\"".$url.$this->db_grid_name."=pg=". ( $this->get_pg - 5 <= 0 ? 1 : $this->get_pg - 5 ) ."$ord_href\"><</a>";
			
			for($i = $this->get_pg - 2 ; $i<= $this->get_pg + 2 ; $i++){
				if($i <= 0 || $i > $this->last_page ) continue;
				$hrefs[] = $i == $this->get_pg ? '<a href=>[' . $this->get_pg  . ']</a>' : "<a href=\"".$url.$this->db_grid_name."=pg=$i$ord_href\">$i</a>";
			}
			
			$hrefs[] = "<a href=\"".$url.$this->db_grid_name."=pg=". ($this->get_pg + 5 > $this->last_page ? $this->last_page : $this->get_pg + 5) ."$ord_href\">></a>";
			$hrefs[] = "<a href=\"".$url.$this->db_grid_name."=pg=".$this->last_page."$ord_href\">|></a>";
			return $hrefs;
		}
		
		function get_ord_hrefs(){
			$ord_hrefs = array();
			//$url = $_SERVER['SCRIPT_NAME'] . "?";
			$url = $this->req_uri."?".$this->make_get_string();
			//$tmp = array_flip($this->order_fld);
			foreach($this->fields as $key=>$val){
				$ord_hrefs[] = $url.$this->db_grid_name."=pg=".$this->get_pg;//.":order_fld=$val:order_rle=".$this->order_rle[$tmp[$val]];
			}
			return $ord_hrefs;
		}
		
		function set_num_rows(){
			if($this->grid_type == "query"){
				$sql = "SELECT COUNT(*) AS num_rows " . substr($this->query->query_str,strpos(strtoupper($this->query->query_str),"FROM"));
                                $this->con->query(new DB_query($sql,$this->query->getParams()));
			}else{
				$sql = "SELECT COUNT(*) AS num_rows FROM ". $this->table . " " . $this->where_rule;
                                $this->con->query(new DB_query($sql,$this->where_params));
			}

			$this->con->next();
			$this->num_rows = $this->con->get_field("num_rows");
//$this->num_rows = $this->con->get_field(0);
//echo "AAAAAAAA{$sql}_________|||" . $this->con->get_field("num_rows") ." ||||-----------------AAAAAAAAAA";
//$this->con->print_log();
			$this->last_page = ($this->num_rows / $this->rows_on_pg);
			$this->last_page = $this->last_page <= 0 ? 0 : ceil($this->last_page);
			$this->get_pg = $this->get_vars["pg"] == "" ? 1 : $this->get_vars["pg"];
			$this->get_pg =  $this->get_pg <= 0 ? 1 : $this->get_pg;
			$this->get_pg =  $this->get_pg > $this->last_page  && $this->get_pg != 1 ? $this->last_page : $this->get_pg;
		}
		
		function set_session_vars(){
			$_SESSION[$this->db_grid_name . "_" . get_pg] = $this->get_pg;
			$_SESSION[$this->db_grid_name . "_" . filter_fld] = $this->filter_fld;
			$_SESSION[$this->db_grid_name . "_" . filter_val] = $this->filter_val;
			$_SESSION[$this->db_grid_name . "_" . filter_rle] = $this->filter_rle;
			$_SESSION[$this->db_grid_name . "_" . mode_search] = $this->mode_search;
			//$_SESSION[$this->db_grid_name . "_" . order_fld] = $this->order_fld;
			//$_SESSION[$this->db_grid_name . "_" . order_rle] = $this->order_rle;
			$_SESSION[$this->db_grid_name . "_" . current_order_field] = $this->current_order_field;
			$_SESSION[$this->db_grid_name . "_" . current_order_rule] = $this->current_order_rule;
			$_SESSION[$this->db_grid_name . "_" . current_where_rules] = $this->where_rules;
			//print_r($_SESSION);
		}
		
		function get_session_vars(){
			
			$this->get_pg = $_SESSION[$this->db_grid_name . "_" . get_pg];
			$this->filter_fld = $_SESSION[$this->db_grid_name . "_" . filter_fld];
			$this->filter_val = $_SESSION[$this->db_grid_name . "_" . filter_val];
			$this->filter_rle = $_SESSION[$this->db_grid_name . "_" . filter_rle];
			$this->mode_search = $_SESSION[$this->db_grid_name . "_" . mode_search];
			//$this->order_fld = $_SESSION[$this->db_grid_name . "_" . order_fld];
			//$this->order_rle = $_SESSION[$this->db_grid_name . "_" . order_rle];
			$this->current_order_field = $_SESSION[$this->db_grid_name . "_" . current_order_field];
			$this->current_order_rule = $_SESSION[$this->db_grid_name . "_" . current_order_rule];
			$this->where_rules = $_SESSION[$this->db_grid_name . "_" . current_where_rules];
		}

		/*		
		function get_href_export_xls(){
			$get_str = $this->make_get_string();
			return $this->req_uri."?".$get_str.$this->db_grid_name."=gact=export_xls:current_order_field=".$this->current_order_field.":current_order_rule=".$this->current_order_rule;
		}
		*/
		
		function export_xls(){
			$this->paginable = false;
			$this->filterable = false;
			$this->editable = false;
			if($this->grid_type == "query"){
				$this->setup_query_query();
			}else{
				$this->setup_table_query();
			}
			
			require_once PHPEXCEL_LIBS_DIR . 'PHPExcel.php';
			$objPHPExcel = new PHPExcel();
			$objPHPExcel->getProperties()->setCreator("DBGrid")
							 ->setLastModifiedBy("DBGrid")
							 ->setTitle("Office 2005 XLSX Document")
							 ->setSubject("Office 2005 XLSX Document")
							 ->setDescription("Document for Office 2005 XLSX, generated using PHP classes.")
							 ->setKeywords("office 2005 openxml php")
							 ->setCategory("Test result file");
							 
			$rec_no = $this->con->query(new DB_query(str_ireplace(",id FROM", "FROM", $this->query->sql()),$this->where_params),"xls");
			$col = 0;
			for($i = 0;$i <= $this->con->get_num_fields("xls") - 1; $i++){
			//for($i = 0;$i <= count($this->cols) - 1; $i++){
				$xls_label = $this->labels[$i] == "" ? $this->con->get_field_name($i,"xls") : $this->labels[$i];
				   $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, 1, $xls_label);//$this->con->get_field_name($i,"xls"));
				   $col++;
			}
			$row = 2;
			while($res=$this->con->fetch_row("xls")){
			   $col = 0;
			   foreach($res as $rez){
				   $objPHPExcel->getActiveSheet()->setCellValueByColumnAndRow($col, $row, $rez);
				   $col++;
			   }
			   $row++;
			}

			$objPHPExcel->getActiveSheet()->setTitle('Foaie 1');
			$objPHPExcel->setActiveSheetIndex(0);
			// Redirect output to a client�s web browser (Excel5)
			
			header('Content-Type: application/vnd.ms-excel');
			header('Content-Disposition: attachment;filename="01simple.xls"');
			header('Cache-Control: max-age=0');
			$objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel5');
			$objWriter->save('php://output');
			
			exit;
		}
		
		function add_row_acction(HrefActions $act){
			$this->row_actions[] = $act;
		}
		
		function add_grid_acction(HrefActions $act){
			$this->grid_actions[] = $act;
		}
		
      };
?>