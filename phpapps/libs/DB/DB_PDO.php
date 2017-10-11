<?php


require_once(DB_LIBS_DIR . 'DB_log.php');
require_once(DB_LIBS_DIR . 'DB_query.php');
require_once(DB_LIBS_DIR . 'DB_list.php');
require_once(DB_LIBS_DIR . 'DB_table.php');
require_once(DB_LIBS_DIR . 'PDO_mysql.php');

require_once(DB_LIBS_DIR . 'DB_query.php');
require_once(DB_LIBS_DIR . 'DB_grid_v4.php');
require_once(DB_LIBS_DIR . 'DB_select.php');
require_once(DB_LIBS_DIR . 'DB_column_def.php');
require_once(DB_LIBS_DIR . 'DB_table_def.php');
require_once(DB_LIBS_DIR . 'DB_FK_def.php');
require_once(DB_LIBS_DIR . 'DB_index_def.php');




    class DB
    {
	var $drivers = array("PDO","DB");
	var $known_types = array("mysql","pgsql"); // known types
	var $types; // vector types for connections
	var $type; // curent type
	var $Log; // log object
	var $con; // connections array
	var $default_type = "";
	var $config_path;
	var $driver;
	
	function __construct($cfg_fis){
	    $this->config_path=$cfg_fis;
	    $this->set_log("","",false);
	}
	
	function connect($type){
	    if(!is_array($type)) 
		$type = array($type);
	    $this->types=$type;
	    if(count($type) > 1 ){
		$cons=array();
		foreach($type as $types){
		    $this->type=$types;
		    if(!in_array($types,$this->known_types)){
		        $this->Log->do_log("Unknown database type: " . $this->type);
		        $this->Log->print_log();
			return false;
		    }
		    $cons[$types] = new $types($this->get_con_string($types), $this->Log);
		    $this->default_type=$type[0];
		}
		$this->con=$cons;
	    }else{
			$this->type = $type[0];
			if(in_array($this->type,$this->known_types)){
				$this->con[$this->type] = new $this->type($this->get_con_string($this->type), $this->Log); 
				$this->default_type=$this->type;
			}else{
				$this->Log->do_log("Unknown database type: " . $this->type);
				$this->Log->print_log();
				return false;
			}
	    }
	    return true;
	}
	
	function reconnect($type=""){
	    if($type != ""){
		return $this->con[$type]->reconnect();
	    }else{
		foreach($this->types as $type){
		    $test[]=$this->con[$type]->reconnect();
		}
		return $test;
	    }
	}
	
	function set_server($type = ""){
	    if($type=="") 
		$this->default_type = $this->types[0];
	    elseif(!in_array($type,$this->types)){
		$this->Log->do_log("Unknown database type: " . $type);
		$this->default_type = $this->types[0];
	    }else{
		$this->default_type = $type;
		$this->Log->do_log("Set OK  database type: " . $type);
	    }
	    return $this->default_type;
	}
	
	function select_db($database){ // open database
	    if(!$this->con[$this->default_type]->select_db($database)){
		$this->Log->do_log("Nu am putut selecta  baza de date $database");
		return false;
	    }else {
		$this->Log->do_log("Database (". $this->type ."): $database is now open and ready");
		return true;
	    }
	}
	
	function get_db_name(){ // get db name
	    return $this->con[$this->default_type]->get_db_name();
	}
	
	function close(){ // close connection
	    $this->con[$this->default_type]->close_db();
	}
	
	function close_all(){ // close all connections
	    foreach($this->types as $types)
		$this->con[$types]->close_db();
	}
	
	function is_connected(){ // check if is connected
	    return $this->con[$this->default_type]->is_connected();
	}
	
	function get_error($res_id = "default"){ // get error
	    return $this->con[$this->default_type]->get_error($res_id);
	}
	
	function all_connected(){ // check all if are connected
	    foreach($this->types as $types){
			if(!$this->con[$types]->is_connected()){
				return false;
			}
			else continue;
	    }	
	    return true;
	}
	
	function get_con_string($type){ // get connection array
	    include($this->config_path);
	    return ${"con_$type"};
	}
	
	function query($sql, $res_id = "default"){
	    return $this->con[$this->default_type]->query($sql,$res_id);
	}
	
	function begin(){
	    return $this->con[$this->default_type]->begin();
	}
	
	function commit(){
	    return $this->con[$this->default_type]->commit();
	}
	
	function rollback(){
	    return $this->con[$this->default_type]->rollback();
	}
	
	function end(){
	    return $this->commit();
	}
	
	function abort(){
	    return $this->rollback();
	}
	
	function exec($sql,$res_id="default"){
	    return $this->con[$this->default_type]->exec($sql,$res_id);
	}
	
	function alter($sql,$res_id="default"){
	    return $this->con[$this->default_type]->exec($sql,$res_id);
	}
	
	function next($res_id = "default"){
	    return $this->con[$this->default_type]->next($res_id);
	}
	
	function get_field($field, $res_id = "default" ){
	    return $this->con[$this->default_type]->get_field($field, $res_id);
	}
	
	function get_field_name($field,$res_id="default"){
	    return $this->con[$this->default_type]->get_field_name($field,$res_id);
	}
	
	function get_num_fields($res_id="default"){
	    return $this->con[$this->default_type]->get_num_fields($res_id);
	}
	
	function get_field_num($field,$res_id="default"){
	    return $this->con[$this->default_type]->get_field_num($field,$res_id);
	}
	
	function first($res_id="default"){
	    return $this->con[$this->default_type]->first($res_id);
	}
	
	function last($res_id="default"){
	    return $this->con[$this->default_type]->last($res_id);
	}
	
	function prev($res_id="default"){
	    return $this->con[$this->default_type]->prev($res_id);
	}
	
	function move_to($row_id,$res_id="default"){
	    return $this->con[$this->default_type]->move_to($row_id,$res_id);
	}
	
	function current_row($res_id="default"){
	    return $this->con[$this->default_type]->current_row($res_id);
	}
	
	function get_con_var($var){
	    return $this->con[$this->default_type]->get_conn_str($var);
	}
	
	function set_con_var($var,$val=""){
	    return $this->con[$this->default_type]->set_conn_str($var,$val);
        }
	
	function record_count($res_id="default"){
	    return $this->con[$this->default_type]->record_count($res_id);
	}
	
	function column_count($res_id="default"){
	    return $this->con[$this->default_type]->column_count($res_id);
	}
	
	function fetch_object($res_id="default"){
	    return $this->con[$this->default_type]->fetch_object($res_id);
	}
	
	function fetch_array($res_id="default"){
	    return $this->con[$this->default_type]->fetch_array($res_id);
	}
	
	function fetch_row($res_id="default")
	{
	    return $this->con[$this->default_type]->fetch_row($res_id);
	}
	
	function num_rows($res_id="default")
        {
	    return $this->con[$this->default_type]->num_rows($res_id);
        }
	
	function check_con()
        {
	    return $this->con[$this->default_type]->check_con();
        }
	
	function get_last_sql($res_id="default"){
	    return $this->con[$this->default_type]->SQL[$res_id];
	}
	
	function last_insert_id($res_id="default"){
	    return $this->con[$this->default_type]->insert_id($res_id);
	}
	
	function set_log($log_type="file",$log_dir="tmp/DB.log",$debug=false){ 
	    $this->Log = new  Log($log_type,$log_dir,$debug);
	}
	
	function print_log(){
	    $this->Log->print_log();
	}
	
	function clear_log(){
	    $this->Log->clear_log();
	}
    }
?>