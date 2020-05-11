<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace wabdo;

/**
 * Description of query
 *
 * @author goaga
 */
/*
SELECT
    [ALL | DISTINCT | DISTINCTROW ]
    [HIGH_PRIORITY]
    [STRAIGHT_JOIN]
    [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]
    [SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]
    select_expr [, select_expr] ...
    [into_option]
    [FROM table_references
      [PARTITION partition_list]]
    [WHERE where_condition]
    [GROUP BY {col_name | expr | position}, ... [WITH ROLLUP]]
    [HAVING where_condition]
    [WINDOW window_name AS (window_spec)
        [, window_name AS (window_spec)] ...]
    [ORDER BY {col_name | expr | position}
      [ASC | DESC], ... [WITH ROLLUP]]
    [LIMIT {[offset,] row_count | row_count OFFSET offset}]
    [into_option]
    [FOR {UPDATE | SHARE}
        [OF tbl_name [, tbl_name] ...]
        [NOWAIT | SKIP LOCKED] 
      | LOCK IN SHARE MODE]
    [into_option]

into_option: {
    INTO OUTFILE 'file_name'
        [CHARACTER SET charset_name]
        export_options
  | INTO DUMPFILE 'file_name'
  | INTO var_name [, var_name] ...
}
*/
class col{
	//public $type //field subquery
	public $col;
	public $alias;
        
	function __construct($col,$alias){
		$this->col=$col;
		$this->alias = $alias;
	}
	
	public function str(){
            $alias_str = $this->alias != "" ? " AS '" . $this->alias  ."'" : "";
		if(is_object($this->col)){
			return "(" . $this->col->str() . ") $alias_str";
		}else{
			return $this->col ." $alias_str";
		}
	}
}

function col($col,$alias = ""){
    return new col($col,$alias);
}

class select{
	public $cols = array();

        function __construct($cols){
            if(is_array($cols)){
                $this->cols = $cols;
            }
	}

        public function str(){
            $tmp_str = "";
            if(is_array($this->cols)){
                    for($i=0;$i<count($this->cols)-1;$i++){
                        $tmp_str .= $this->cols[$i]->str() .",";
                    }
                    $tmp_str .= $this->cols[$i]->str();
            }
            return "SELECT " . $tmp_str;
        }
}

function sel($cols){
    return new select($cols);
}

class ref_table{
        public $ref_table;
	public $alias;
        
	function __construct($ref_table,$alias){
		$this->ref_table=$ref_table;
		$this->alias = $alias;
	}
	
	public function ref_table($col,$alias){
		$this->ref_table=$col;
                $this->alias=$alias;
	}
        
	public function str(){
                $alias_str = $this->alias != "" ? " AS '" . $this->alias  ."'" : "";
		if(is_object($this->ref_table)){
			return "(" . $this->ref_table->str() . ") " . $alias_str;
		}else{
			return $this->ref_table . $alias_str;
		}
	}
}

function table($ref_table,$alias = ""){
    return new ref_table($ref_table,$alias);
}

class from{
    public $ref_tables = array();
    
    function __construct($tables_ref) {
        $this->ref_tables = $tables_ref;
    }
    
    public function str(){
            $tmp_str = "";
            if(is_array($this->ref_tables)){
               for($i=0;$i<count($this->ref_tables)-1;$i++){
                        $tmp_str .= $this->ref_tables[$i]->str() .",";
                    }
                    $tmp_str .= $this->ref_tables[$i]->str();
            }
            return " FROM " . $tmp_str;
        }
}

class condition{
    public $left;
    public $right;
    public $oper;
    
    public function __construct($left,$oper,$right) {
        $this->left = $left;
        $this->right = $right;
        $this->oper = $oper;
       // echo "AM FCUT " .$this->left .$this->oper . $this->right;
    }
    
    public function str(){
        $left_str = "";
        
        if(is_object($this->left)){
            $left_str = $this->left->str();
        }else{
            $left_str = $this->left; 
        }
        
        $right_str = "";
        if(is_object($this->right)){
            $right_str = $this->right->str();
        }else{
            $right_str = $this->right; 
        }
        
        return " (" . $left_str . " " .$this->oper . " " . $right_str . ") ";
        
    }
}

function cond($left,$oper,$right){
    return new condition($left,$oper,$right);
}

class where{
    public $condition;
    
    function __construct($condition) {
        $this->condition = $condition;
    }
    
    public function str(){
            return " WHERE " . $this->condition->str();
        }
}

class query{
	public $select;
	public $from;
	public $where;
        //public $group;
	//public $having;
	//public $order;
        
        //public $update
        //public $insert
        //public $delete
        function __construct() {
            return $this;
        }
      
        function select($cols){
           $this->select = new select($cols);
           return $this;
        }

        function from($tables_ref){
            $this->from = new from($tables_ref);
            return $this;
        }
        
        function where($condition){
            $this->where = new where($condition);
            return $this;
        }
        
        function str(){
            $select_str = is_object($this->select) ? $this->select->str() : "";
            $from_str = is_object($this->from) ? $this->from->str() : "";
            $where_str = is_object($this->where) ? $this->where->str() : "";
            return $select_str . $from_str . $where_str;
        }
        
        function prnt_select($obj){
            
            foreach($obj->cols as $key=>$val){
               // echo "|" . get_class($val->col) ."|". "<br>";
                if(get_class($val->col) == "query"){
                    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;( SELECT<br>";
                    $this->prnt_select($val->col->select);
                    echo ")<br>";
                }else{
                    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;". $val->str() . ",<br>";
                }
            }
        }
        
        function prnt_from($obj){
            
            foreach($obj->ref_tables as $key=>$val){
               // echo "|" . get_class($val) ."|". "<br>";
                if(get_class($val->ref_table) == "query"){
                    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;SELECT<br>";
                    $this->prnt_select($val->ref_table->select);
                }else{
                    echo "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;". $val->str() . "<br>";
                }
            }
        }
        
        function prnt(){
            echo "<br><br>SELECT<br>";
            $this->prnt_select($this->select);
            echo "<br><br>FROM<br>";
            $this->prnt_from($this->from);
            return $str;
        }
}

///
/*
 * 
 *         $query = new query();
   //     $query->select(new col("1+1","sum"));
        $query->select(array(col("1+1" ,"sum")));
echo "<br>----------------------------<br>";
//var_dump($query); echo"<br>";
print_r(array("mimi"=>"fifi",$query=>"aa","lili"=>"gigig"));
echo "<br>----------------------------<br>";      



//echo "<h1>AICI query1: " . $query->str() . "</h1>";        
        
        $query2 = new query();
        //$query2->select($query,"subsel")->from("dual","");
        //$query2->select(array("id"=>"id_l","script_name"=>"scr","id",$query))->from("scripts","sc")->where("1","AND","1");
       echo "<h1>".
               $query2->select([col("mimi"),col($query,"aa"),col("lili","gigig")])->from([table("scripts","sc"),table("dual")])->str()
               . "</h1>";
       
       $query3 = new query();
       $query3->select([col("mimi"),col($query,"aa"),col("lili","gigig")])->from([table("scripts","sc"),table("dual"),table($query2)])->where(
               cond(cond("a","=","b"),"AND","1")
               )->str();
               
               echo "<br><h1>".
               $query3->str()
               . "</h1>";
               
$q4 = new query();               
$q4->select(array(col($query,"bbbb"),col("nume"),col("cnp"),col($query,"aaaa")));
$q4->from(array(table($query2)));
$q4->where(cond(cond("a","=","b"),"AND",cond("prenume","=","nume")));
echo "<br><h1>".$q4->str() ."</h1><br><hr>";

print_r($q4);
echo "<br><br>" . $q4->prnt();
        //$query2->select("1+1","subsel")->from("dual","");
        //$query2->from("dual","");
//echo "<br>----------------------------<br>";
//var_dump($query2); echo"<br>";
//var_dump(array("mimi"=>"fifi",$query => "aa","lili"=>"gigig"));
//echo "<br>----------------------------<br>";
//$query->from(new )
        
        //echo "<h1>AICI query2: " . $query2->str() . "</h1>";
        
 */