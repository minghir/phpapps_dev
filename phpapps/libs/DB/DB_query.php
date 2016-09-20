<?php
	class DB_query{
		public $query_str;
		public $paramaters = array();
		
		function __construct($q,$p = array()){
			$this->query_str = $q;
			$this->paramaters = $p;
		}
		
		function query(){
			return $this->query_str;
		}
		
		function sql(){
			return $this->query_str;
		}
		
		function setParams($p = array()){
			$this->paramaters = $p;
		}
		
		function checkParams(){
				if(empty($this->paramaters)){
					return false;
				}else{
					return true;
				}
		}
		
		function getParams(){
			return $this->paramaters;
		}
	};
?>