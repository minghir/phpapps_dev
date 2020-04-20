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
                
                function prnt(){
                    $str_to_print = $this->query_str;
                    if(is_array($this->paramaters)){
                        if(count($this->paramaters) > 0){
                            foreach($this->paramaters as $key=>$value){
                                $str_to_print =  str_replace($key, "'$value'", $str_to_print);
                            }
                        }
                    }
                    return $str_to_print;
                }
	};
?>