<?php
class HrefActions{
	var $act_script;
	var $label;
	var $action;
	var $fields = array();
	var $confirm_msg;
	
	var $popup;// = false;
	
	function getHref($res,$flds){
		$href = strpos($this->act_script,'?') === false ? $this->act_script ."?gact=". $this->action : $this->act_script ."&gact=". $this->action;
		$flipped = array_flip($flds);
		for($i = 0; $i < count($this->fields); $i++){
			$gfield = $this->fields[$i];
			// ID-ul se afla intodeauna pe ultima pozitie
			$gfield_value = $this->fields[$i] == "ID" ? $res[count($res) - 1] :$res[$flipped[$this->fields[$i]]];
			$href .= ($i > 0 ) ?  "&gfield$i=$gfield&gfield_value$i=$gfield_value" : "&gfield=$gfield&gfield_value=$gfield_value";
		}
		
		if( $this->popup == true ){
			if($this->confirm_msg != ""){
				return "<a href=\"".$href."\" onclick=\"if(confirm('".$this->confirm_msg."')) window.open('".$href."','popup','width=0,height=0,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false\">".$this->label."</a>";
			}else{
				return "<a href=\"".$href."\" onclick=\"window.open('".$href."','popup','width=0,height=0,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false\">".$this->label."</a>";
			}
		}else{
			return "<a href=\"".$href."\">".$this->label."</a>";
		}
	}
};

class DB_grid
      {
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
	var $custom_actions =  array();
	
	var $where_rules = array(); // clauze where 
	
	var $order_fld = array("ID");
	var $order_rle = array("DESC");
		
	var $current_order_field;
	var $current_order_rule;
		
	var $order_rule;
	var $where_rule;

	var $num_rows = 0;

      function DB_grid($conn, $g_type, $str_sql, $grid_name = ""){
	  
            session_start();

            $this->sm = new Smarty;
            $this->sm->template_dir = LIBS_TPL_DIR;
            $this->sm->compile_dir = LIBS_TPL_DIR;
            $this->con = $conn;

             switch ($g_type)
             {
               case "table":
                    $this->grid_type = $g_type;
                    $this->table = $str_sql;
                    //$this->edit_form = "form_".$this->table.".php";
                    $this->db_grid_name = $grid_name == "" ? $str_sql : $grid_name;
               break;
               case "query":
                    $this->grid_type = $g_type;
                    $this->query = $str_sql;
                    $this->init_query = $str_sql;
                    //$this->edit_form = "query.php";
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
			$this->cols[] = "ID";
			$select_cols = implode(", ",$this->cols);
	
			for ($i = 0; $i < count($this->filter_fld); $i++){
				if($this->filter_val[$i] == "") {
					continue;
				}
				$filter_where_rls[] = " ".$this->filter_fld[$i]." ".$this->filter_rle[$i]." '".$this->filter_val[$i]."' ";
			}
		
			if(count($filter_where_rls) > 0){
				$this->where_rule = " WHERE " . implode(" AND ", $filter_where_rls);
			}else{
				$this->where_rule = "";
			}
			
			/*
			for ($i = 0; $i < count($this->order_fld); $i++){
				if($this->order_fld[$i] == ""){
					continue;
				}
				$order_rls[] = $this->order_fld[$i] ." ".$this->order_rle[$i];
			}
			
			if(count($order_rls) > 0){
				$this->order_rule = " ORDER BY " . implode(" , ", $order_rls);
			}else{
				$this->order_rule = "";
			}
			*/
			
			if($this->current_order_field != ""){
				$this->order_rule  = " ORDER BY " . $this->current_order_field . " " . $this->current_order_rule;
			}
					
			if($this->paginable){
				$this->set_num_rows();
				$limit =  ( $this->get_pg - 1 ) * $this->rows_on_pg;
			}
				
			if($this->paginable){
				$this->query = "SELECT $select_cols FROM ". $this->table ." ".$this->where_rule . $this->order_rule . " limit " .
					$limit ."," . $this->rows_on_pg ;
			}else{
				$this->query = "SELECT $select_cols FROM ". $this->table ." ".$this->where_rule . $this->order_rule;
			}		  
//echo $this->query;
        }

        function setup_query_query(){
		   $this->filterable = false;
		   
           $this->init_query = str_ireplace("FROM", ",ID FROM", $this->init_query);
		   
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
				$this->query = $this->init_query ." ". $this->order_rule . " limit " . $limit ."," . $this->rows_on_pg ;
			}else{
				$this->query = $this->init_query . " " . $this->order_rule;
			}		  
        }

        function setup_grid(){
			$fields = array();
			$vals = array();
			//echo "<br>".$this->query."<br>";
			$this->con->query($this->query, $this->db_grid_name);
			for($i = 0;$i <= $this->con->get_num_fields($this->db_grid_name) - 2; $i++){ // fara ultimul camp care este id
				$fields[] = $this->con->get_field_name($i,$this->db_grid_name);
			}
			
			$this->fields = $fields;
                
			while($res=$this->con->fetch_row($this->db_grid_name)){
				
				$vals[] = $res;
				if($this->grid_type == "table"){
                    $sp_char = (!strpos($this->edit_form,"?")) ? "?" : "&";
					$hrefs_edits[] = $this->edit_form.$sp_char."gact=editRec&gfield=ID&gfield_value=".$res[count($res)-1];
					$hrefs_dels[] = $this->edit_form.$sp_char."gact=deleteRec&gfield=ID&gfield_value=".$res[count($res)-1];
					
					// adaug custom actions
					$tmp_act = "";
					for( $i = 0; $i< count($this->custom_actions); $i++){// as $key=>$value){
						$tmp_act .= $this->custom_actions[$i]->getHref($res,$fields);
						if($i < (count($this->custom_actions) - 1) ){
							$tmp_act .= " | ";
						}
					}
					$hrefs_custom[] = $tmp_act;
				
				}else{
					$_GET[$this->db_grid_name] = "act=delete:ID=".$res[count($this->cols)];
					$get_str = $this->make_get_string();
					$hrefs_dels[] = $this->req_uri."?".$get_str;

					$_GET[$this->db_grid_name] = "act=edit:ID=".$res[count($this->cols)];
					$get_str = $this->make_get_string();
					$hrefs_edits[] = $this->req_uri."?".$get_str;
			
					$tmp_act = "";
					foreach($this->custom_actions as $key=>$value){
						$tmp_act .= $this->custom_actions[$key]->getHref($res,$fields) . " | ";
					}
					$hrefs_custom[] = $tmp_act;
				}
			}
			
			if($this->paginable){
				$pgs_hrefs = $this->get_pgs_hrefs();
			}	
			
			$this->sm->assign(array(
									  "fields" =>  $fields ,
									  "labels" => $this->labels,
									  "vals" => $vals,
									  
									  "editable" => $this->editable,
									  "paginable" => $this->paginable,
									  "filterable" => $this->filterable,
									  "exportable" => $this->exportable,
									  "sortable" => $this->sortable,
									  
									  "hrefs_dels" => $hrefs_dels,
									  "hrefs_edits" => $hrefs_edits,
									  "hrefs_dels" => $hrefs_dels,
									  
									  "edit_form" => $this->edit_form,
									  "pgs_hrefs" => $pgs_hrefs,
									  
									  "num_rows" => $this->num_rows,
									  "pages" => $this->last_page,
									  "filter_val" => $this->filter_val,
									  
									  
									  "mode_search" => $this->mode_search,
									  
									  "order_hrefs" => $this->get_ord_hrefs(),
									  "current_order_field" => $this->current_order_field,
									  "current_order_rule" => $this->current_order_rule,
									  
									  "href_export_xls" => $this->get_href_export_xls(),
									  "grid_title" => ($this->grid_title == "" ? $this->table : $this->grid_title),
									  "new_rec_action" => ((!strpos($this->edit_form,"?")) ? "?" : "&")."gact=newRec",
									  "hrefs_custom" => $hrefs_custom,
									  
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
                    $this->setup_query_query();
					$this->setup_grid();
				break;
				default:
                     $this->error = "WRONG grid type!";
				return $error;
            }
			 
			return $this->sm->fetch('db_grid.tpl');
        }

        function parse_http_get_vars(){
		
            $this->req_uri = $_SERVER["PHP_SELF"];
            if($_GET[$this->db_grid_name] != ""){
                $vars = explode(':',$_GET[$this->db_grid_name]);
				//print_r($vars);
				foreach($vars as $var){
					$tmp = explode("=",$var);
					$this->get_vars[$tmp[0]] = $tmp[1];
				}
            }
			
			$this->get_pg = $this->get_vars["pg"];

			
			$this->current_order_field = $this->get_vars["current_order_field"];
			$this->current_order_rule = $this->get_vars["current_order_rule"];
		
			/*
			$this->order_fld = array();
			$this->order_rle = array();
			
			if(count($this->get_vars) > 0){
				foreach($this->get_vars as $key=>$val){
					if($key == "order_fld"){
						if(!in_array($val,$this->order_fld)){
							$this->order_fld[] = $val;
						}
					}
					if($key == "order_rle"){
						if(!in_array($val,$this->order_rle)){
							$this->order_rle[] = $val;
						}
					}
				}				
			}
			*/
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
				$hrefs[] = $i == $this->get_pg ? '[' . $this->get_pg  . ']' : "<a href=\"".$url.$this->db_grid_name."=pg=$i$ord_href\">$i</a>";
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
				$sql = "SELECT COUNT(*) AS num_rows " . substr($this->init_query,strpos(strtoupper($this->init_query),"FROM"));
			}else{
				$sql = "SELECT COUNT(*) AS num_rows FROM ". $this->table . " " . $this->where_rule;
			}
			$this->con->query($sql);
			$this->con->next();
			$this->num_rows = $this->con->get_field("num_rows");
			
			$this->last_page = (int)(($this->num_rows / $this->rows_on_pg) +1 );
			$this->get_pg = $this->get_vars["pg"] == "" ? 1 : $this->get_vars["pg"];
			
			$this->get_pg =  $this->get_pg <= 0 ? 1 : $this->get_pg;
			$this->get_pg =  $this->get_pg > $this->last_page ? $this->last_page : $this->get_pg;
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
		
		function get_href_export_xls(){
			$get_str = $this->make_get_string();
//			$url = $_SERVER['SCRIPT_NAME'] . "?";
//			return $url.$this->db_grid_name."=gact=export_xls:current_order_field=".$this->current_order_field.":current_order_rule=".$this->current_order_rule;
			return $this->req_uri."?".$get_str.$this->db_grid_name."=gact=export_xls:current_order_field=".$this->current_order_field.":current_order_rule=".$this->current_order_rule;
			  
		}
		
		function export_xls(){
			$this->paginable = false;
			$this->filterable = false;
			$this->editable = false;
			if($this->grid_type == "query"){
				$this->setup_query_query();
			}else{
				$this->setup_table_query();
			}
			
			require_once './libs/PHPExcel.php';
			$objPHPExcel = new PHPExcel();
			$objPHPExcel->getProperties()->setCreator("DBGrid")
							 ->setLastModifiedBy("DBGrid")
							 ->setTitle("Office 2005 XLSX Document")
							 ->setSubject("Office 2005 XLSX Document")
							 ->setDescription("Document for Office 2005 XLSX, generated using PHP classes.")
							 ->setKeywords("office 2005 openxml php")
							 ->setCategory("Test result file");
							 
			$rec_no = $this->con->query(str_ireplace(",id FROM", "FROM", $this->query),"xls");
		
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
		
		function add_acction(HrefActions $act){
			$this->custom_actions[] = $act;
		}
      };
?>