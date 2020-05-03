<?php
namespace wabdo;

class DB_select_option{
	public $value;
	public $label;
	public $selected = false;
	
	function __construct($val,$txt,$sel = false){
		$this->value = $val;
		$this->label = $txt;
		if($sel === true){
			$this->selected = "selected";
		}
		return $this;
	}
		
	function set_value($val){
		$this->value = $val;
	}
	
	function set_label($val){
		$this->label = $val;
	}
	
	function set_selected($sel){
		if($sel === true){
			$this->selected = "selected";
		}
	}
	
	function get_select_option_str(){
		return "<option value=\"".$this->value."\" ".$this->selected.">".$this->label."</option>";
	}
};

class DB_select{

	var $title;
	var $name;
	var $html_id;
	
	var $disabled = false;
	var $multiple = false;
	var $options = array();
	var $empty_option = true;
        var $empty_option_value;
	
	
	var $table;
	
	var $value_col;
	var $label_col;
	
	var $selected_val;
	var $order_rle = "ID";
	
	var $query;
	var $query_params = array();
        public $db_query;
	
        var $error;
	var $globals;
	private $sm;
	
	function __construct($sname,$stable){
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
		$this->name = $sname;
		$this->table = $stable;
		
		$this->sm = new Smarty;
                $this->sm->template_dir = DB_LIBS_TPL_DIR;
                $this->sm->compile_dir = SMARTY_COMPILE_DIR;
		
		$this->parse_post_vars();
		return $this;
	}
	
	function parse_post_vars(){
		if($_POST[$this->name] != ""){
			$this->selected_val = $_POST[$this->name];
		}
	}
	
	function setup_select_options(){
                $this->options = array();
                if($this->db_query == ""){
                    $this->db_query = new DB_query($this->query,$this->query_params);
                    	
                }
		if($this->db_query->sql() == ""){
                    
			$this->value_col = $this->value_col == "" ? "ID" : $this->value_col;
			$this->label_col = $this->label_col == "" ? "VALUE" : $this->label_col;
			$sql = "SELECT ".$this->value_col." AS VALUE, ".$this->label_col." AS LABEL 
			FROM ".$this->table ." ORDER BY :order_rle";
			$this->query_params[":order_rle"] = $this->order_rle;
                        
                        $this->db_query = new DB_query($sql,$this->query_params);
		}
                
		//print_r($this->db_query);
                //echo "<br>" . $this->db_query->prnt();
                
		$nrs = $this->globals->con->query($this->db_query, $this->name);
		while($res=$this->globals->con->fetch_row($this->name)){
			$this->options[] =  (array)(new DB_select_option( $res[0],$res[1],($this->selected_val == $res[0] ) ));
		}

		$this->sm->assign(array(
						"db_select_options" => $this->options,
						"db_select_name" => $this->name,
						"db_select_multiple" => $this->multiple,
						"empty_option" => $this->empty_option,
                                                "empty_option_value" => $this->empty_option_value,
						"disabled" => ($this->disabled ? "disabled" : ""),
						"html_id" => ( $this->html_id == "" ? $this->name : $this->html_id ),
		));

	}
	
        function set_query($sql){
            $this->db_query = $sql;
        }
        
        function set_empty_option($empt){
            $this->empty_option = $empt;
        }
        
        function set_empty_option_value($empt){
            $this->empty_option_value = $empt;
        }
        
	function get_select_str(){
		return $this->sm->fetch('db_select.tpl');
	}
        
        function set_multiple($bool_val){
            $this->multiple = $bool_val;
        }
};

   
?>