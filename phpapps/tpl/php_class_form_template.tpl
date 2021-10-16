<?php
namespace wabdo;
// includes
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "alerts.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class {$form_name} extends template{ldelim}
        public $form_com_type = "html"; // html | ajax
	public $globals;
	public $form_schema;// = "{$form_schema}";
	public $form_table = "{$form_table}";
        
	public $template;// = "gen_tpl/{$form_name}.tpl";
        
        public $tpl = "{$form_name}";
	
        //get values
	public $gact;
	public $gfield;
	public $gfield_value;
	//post values
	public $pact;
        
        public $query;
        
        public $smarty;
        public $view_database_errors = true;
        
	{section name=ds loop=$fields}
        {if $input_types[ds] == "select_table_multiple" || $input_types[ds] == "select_list_multiple"}
        public ${$fields[ds]} = array();    
        {else}    
	public ${$fields[ds]};
        {/if}
	{/section}
	
	{section name=lis loop=$selected_schema_list}
	{if $selected_schema_list[lis] != "" }
	public ${$fields[lis]}_sel;
	{/if} 
	{/section}
		
	{section name=lis loop=$selected_schema_table}
	{if $selected_schema_table[lis] != "" }
	public ${$fields[lis]}_sel;
	{/if} 
	{/section}

        public $alerts;
	
	function __construct(){ldelim}
                parent::__construct();
		global $GLOBALS_OBJ;
		$this->globals = &$GLOBALS_OBJ;
                $this->form_schema = $this->globals->CURRENT_APP_DB;
                
                $this->alerts = new alerts();
                
                //$this->smarty = new Smarty;
                //$this->smarty->template_dir = CURRENT_APP_TPL_DIR . DIR_SEP . "gen_tpl" . DIR_SEP;
                //$this->smarty->compile_dir = SMARTY_COMPILE_DIR;
                $this->smarty = $this->globals->sm;
                
                {section name=lis loop=$selected_schema_list}
			{if $selected_schema_list[lis] != "" }
			$this->{$fields[lis]}_sel = new DB_select("{$fields[lis]}","{$selected_schema_list[lis]}");
                        {if $input_types[lis] == "select_list_multiple"}
                                    $this->{$fields[lis]}_sel->set_multiple(TRUE);
                         {/if}
			{/if} 
		{/section}
		
		{section name=lis loop=$selected_schema_table}
			{if $selected_schema_table[lis] != "" }
				$this->{$fields[lis]}_sel = new DB_select("{$fields[lis]}","{$selected_schema_table[lis]}");
                                {if $input_types[lis] == "select_table_multiple"}
                                    $this->{$fields[lis]}_sel->set_multiple(TRUE);
                                {/if}
			{/if} 
		{/section}
                
	{rdelim}
		
	function init(){ldelim}
		if($_SERVER['REQUEST_METHOD'] === 'POST') {ldelim}
			$this->parse_post_vars();
                        $this->post_actions();
		{rdelim} else {ldelim}
			$this->parse_get_vars();
                        $this->get_actions();
		{rdelim}
	{rdelim}
	
	function before_get_rec(){ldelim}
	{rdelim}
	
	function get_rec(){ldelim}
		$this->query = new DB_query( "SELECT 
			{section name=ds1 loop=$fields}
			{if $smarty.section.ds1.last }
			{$fields[ds1]}
			{else}
			{$fields[ds1]},
			{/if}
			{/section}	
				FROM ".$this->form_schema.".".$this->form_table." 
				WHERE ".$this->gfield." = :".$this->gfield." ",
				array((":".$this->gfield) => $this->gfield_value));
			$this->globals->con->query($this->query);
			$this->globals->con->next();
			{section name=ds loop=$fields}
                                {if $input_types[ds] == "select_table_multiple" || $input_types[ds] == "select_list_multiple"}
                                $this->{$fields[ds]} = explode(",",$this->globals->con->get_field("{$fields[ds]}"));    
                                {else}
                                $this->{$fields[ds]} = stripslashes($this->globals->con->get_field("{$fields[ds]}"));
                                {/if}
			{/section}
			
	{rdelim}
	
	function after_get_rec(){ldelim}
	{rdelim}
	
	function before_add_rec(){ldelim}
	{rdelim}
	
	function add_rec(){ldelim}
		$this->before_add_rec();
	
		$this->check_errors();
		$this->query = new DB_query("INSERT INTO ".$this->form_schema.".".$this->form_table." (
			{section name=ds1 loop=$fields}
			{if $fields[ds1] != "ID" }
				{if $smarty.section.ds1.last }
					{$fields[ds1]}
				{else}
					{$fields[ds1]},
				{/if}
			{/if}
			{/section} ) VALUES (
			{section name=ds1 loop=$fields}
			{if $fields[ds1] != "ID" }
				{if $smarty.section.ds1.last }
					:{$fields[ds1]}
				{else}
					:{$fields[ds1]},
				{/if}
			{/if}
			{/section}
			)",
			array(
				{section name=ds1 loop=$fields}
					{if $fields[ds1] != "ID" }
                                        {if $input_types[ds1] == "select_list_multiple" || $input_types[ds1] == "select_table_multiple" }
                                            ":{$fields[ds1]}" => implode(",",$this->{$fields[ds1]}),
                                        {else}    
                                            ":{$fields[ds1]}" => $this->{$fields[ds1]},
                                        {/if}
					{/if}
				{/section}
			)
			);

                if($this->alerts->get_no_errors() == 0) {ldelim}	
			if( $this->globals->con->query($this->query) == -1){ldelim}
                            if($this->view_database_errors){ldelim}
                                $this->alerts->add_alert("danger",$this->globals->con->get_error());
                            {rdelim}else{ldelim}
                                $this->alerts->add_alert("danger","Database error!!!");
                            {rdelim}   
                        {rdelim}else{ldelim}
                            $this->alerts->add_alert("success","Inregistrare adaugata cu succes");
                        {rdelim}
		{rdelim}
		
		$this->after_add_rec();
	{rdelim}
	
	function after_add_rec(){ldelim}
		//header("Location:win_close.html");
	{rdelim}
	
	function before_save_rec(){ldelim}
	{rdelim}
	
	function save_rec(){ldelim}
		$this->before_save_rec();
		
		$this->check_errors();
		
		$this->query = new DB_query("UPDATE ".$this->form_schema.".".$this->form_table." SET 
			{section name=ds1 loop=$fields}
			{if $smarty.section.ds1.last }
			{$fields[ds1]} = :{$fields[ds1]}
			{else}
			{$fields[ds1]} = :{$fields[ds1]},
			{/if}
			{/section}	
				WHERE ".$this->gfield." = :".$this->gfield,
			array(	
				{section name=ds1 loop=$fields}
                                        {if $input_types[ds1] == "select_list_multiple" || $input_types[ds1] == "select_table_multiple" }
                                            ":{$fields[ds1]}" => implode(",",$this->{$fields[ds1]}),
                                        {else}
                                            ":{$fields[ds1]}" => $this->{$fields[ds1]},
                                        {/if}
				{/section}
				":".$this->gfield => $this->gfield_value
			)	
			);
				
		if($this->alerts->get_no_errors() == 0) {ldelim}	
			if( $this->globals->con->query($this->query) == -1){ldelim}
                            if($this->view_database_errors){ldelim}
                                $this->alerts->add_alert("danger",$this->globals->con->get_error());
                            {rdelim}else{ldelim}
                                $this->alerts->add_alert("danger","Database error!!!");
                            {rdelim}   
                        {rdelim}else{ldelim}
                            $this->alerts->add_alert("success","Inregistrare salvata cu succes");
                        {rdelim}
		{rdelim}
		
		$this->after_save_rec();
	{rdelim}
	
	function after_save_rec(){ldelim}
	{rdelim}

	function before_delete_rec(){ldelim}
	{rdelim}
	
	function delete_rec(){ldelim}
		$this->before_delete_rec();
		
		$this->query = new DB_query("DELETE FROM ".$this->form_schema.".".$this->form_table."
				WHERE ".$this->gfield." = :".$this->gfield, array(":".$this->gfield=>$this->gfield_value) );
				
		if($this->alerts->get_no_errors() == 0) {ldelim}	
			if( $this->globals->con->query($this->query) == -1){ldelim}
                            if($this->view_database_errors){ldelim}
                                $this->alerts->add_alert("danger",$this->globals->con->get_error());
                            {rdelim}else{ldelim}
                                $this->alerts->add_alert("danger","Database error!!!");
                            {rdelim}   
                        {rdelim}else{ldelim}
                            $this->alerts->add_alert("success","Inregistrare stearsa cu succes");
                        {rdelim}
		{rdelim}
		
		$this->after_delete_rec();
	{rdelim}
	
	function after_delete_rec(){ldelim}
	{rdelim}
	
	function parse_get_vars(){ldelim}
		$this->gact = trim($_GET["gact"]);
		$this->gfield = trim($_GET["gfield"]);
		$this->gfield_value = trim($_GET["gfield_value"]);
        {rdelim}
        
        function get_actions(){ldelim}
			switch($this->gact){ldelim}
			case "editRec":
				$this->before_get_rec();
				$this->get_rec();
				$this->after_get_rec();
			break;
			case "deleteRec":
				//$this->deleteRec();
                                $this->alerts->add_alert("warning","Sigur stergeti inregistrarea?",true);
                                $this->before_get_rec();
				$this->get_rec();
				$this->after_get_rec();
			break;
			case "addRec":
                                //$this->addRec();
			break;
		{rdelim}
	{rdelim}
	
	function parse_post_vars(){ldelim}
		$this->pact = $_POST["pact"];
		$this->gact = $_POST["gact"];
		$this->gfield = $_POST["gfield"];
		$this->gfield_value = $_POST["gfield_value"];
		
		{section name=ds loop=$fields}
                        {if $input_types[ds] == "select_list_multiple" || $input_types[ds] == "select_table_multiple" }
                             $this->{$fields[ds]}  = $_POST["{$fields[ds]}"];
                        {else}
                            $this->{$fields[ds]}  = htmlspecialchars(addslashes(trim($_POST["{$fields[ds]}"])));
                        {/if}
                        {if $input_types[ds] == "file" }
                            $tmp_upload = new phpapps_upload("{$fields[ds]}");
                            $this->{$fields[ds]} = $tmp_upload->getFilePath();
                            unset($tmp_upload);
                        {/if}
		{/section}
        {rdelim}
	
        function before_post_actions(){ldelim}
        {rdelim}
        
        function post_actions(){ldelim}
                $this->before_post_actions();
		switch($this->pact){ldelim}
			case "addRec":
				$this->add_rec();
			break;
			case "saveRec":
				$this->save_rec();
			break;
			case "deleteRec":
				$this->delete_rec();
			break;
		{rdelim}
                $this->after_post_actions();
	{rdelim}
        
        function after_post_actions(){ldelim}
        {rdelim}
	
	function check_errors(){ldelim}
		{section name=md loop=$mandatories}
		if($this->{$mandatories[md]} == "") {ldelim}
                        $this->alerts->add_alert("danger", "Campul <strong>{$mandatories[md]}</strong> este obligatoriu!");
		{rdelim}
		{/section}
	{rdelim}
	
	function setup_display(){ldelim}
		{section name=lis loop=$selected_schema_list}
			{if $selected_schema_list[lis] != "" }
			//$this->{$fields[lis]}_sel = new DB_select("{$fields[lis]}","{$schema}.{$selected_schema_list[lis]}");
			$this->{$fields[lis]}_sel->selected_val = $this->{$fields[lis]};
			$this->{$fields[lis]}_sel->setup_select_options();
			{/if} 
		{/section}
		
		{section name=lis loop=$selected_schema_table}
			{if $selected_schema_table[lis] != "" }
				//$this->{$fields[lis]}_sel = new DB_select("{$fields[lis]}","{$schema}.{$selected_schema_table[lis]}");
				//$this->{$fields[lis]}_sel->db_query = new DB_query("SELECT ID AS VALUE, {$selected_schema_field[lis]} AS LABEL FROM {$selected_schema_table[lis]} ORDER BY {$selected_schema_field[lis]}");
                                
                                $this->{$fields[lis]}_sel->table = "{$selected_schema_table[lis]}";
                                $this->{$fields[lis]}_sel->value_col = "ID";
                                $this->{$fields[lis]}_sel->label_col = "{$selected_schema_field[lis]}";
                                
				$this->{$fields[lis]}_sel->selected_val = $this->{$fields[lis]};
				$this->{$fields[lis]}_sel->setup_select_options();
			{/if} 
		{/section}
        }
        
        function assign_vars_tpl(){
		$this->smarty->assign(array(
			{section name=ds loop=$fields}
				"{$fields[ds]}" => $this->{$fields[ds]},
			{/section}
			{section name=lis loop=$selected_schema_list}
			{if $selected_schema_list[lis] != "" }
				"{$fields[lis]}_sel" => $this->{$fields[lis]}_sel->get_select_str(),
			{/if} 
			{/section}
			{section name=lis loop=$selected_schema_table}
			{if $selected_schema_table[lis] != "" }
				"{$fields[lis]}_sel" => $this->{$fields[lis]}_sel->get_select_str(),
			{/if} 
			{/section}
			"pact" => $this->pact,
			"gact" => $this->gact,
			"gfield" => $this->gfield,
			"gfield_value" => $this->gfield_value,
			"message_block" => $this->alerts->get_message_str(),
		));
	{rdelim}
	
	function before_display(){ldelim}	
	{rdelim}
	
	function display(){ldelim}
        
                $this->setup_display();
                $this->before_display();
		$this->assign_vars_tpl();
                if($this->form_com_type == "ajax" && $this->pact != ""){ldelim}
                    $this->ajax_server_resp();
                {rdelim}else{ldelim}
                    //$this->smarty->display($this->template);
                    $this->display_template();
                {rdelim}
		$this->after_display();
	{rdelim}
	
	function after_display(){ldelim}	
	{rdelim}
	
	function get_html_str(){ldelim}	
                $this->setup_display();
                $this->before_display();
		$this->smarty->fetch($this->template);
                $this->after_display();
	{rdelim}
        
        function ajax_server_resp(){ldelim}
            
        {rdelim}    
            
        
{rdelim}
?>
