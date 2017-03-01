<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class Questions extends phpapps_display_abs{

    private $app_id;
    public $where_categ;
    public $category_id;
    private $sql_array = array();
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "Questions.tpl";        
        $this->app_id = $app_id;
        
        
        $this->category_id = trim($_POST["catg_id"]);
        if($this->category_id != ""){
            $this->where_categ = " WHERE q.CATEG_ID = :ctg_id ";
            $this->sql_array[":ctg_id"] = $this->category_id;
        }else{
            $this->where_categ = "";
            $this->sql_array = array();
        }
        
        $this->displayTpl();
    }
    function setupDisplay(){
        $sql = new DB_query("SELECT q.ID,
                                    q.NO,
                                    q.CATEG_ID,
                                    (SELECT CONCAT('(<b>',t.VALUE,'</b>) ',c.NAME) 
                                    FROM php_quiz.categories c LEFT JOIN php_quiz.list_category_type t ON  (c.CATEG_TYPE = t.ID) WHERE c.ID = q.CATEG_ID) AS CTEG_NAME,
                                    q.QUESTION,
                                    q.ANSWER_1,
                                    q.CORRECT_1,
                                    q.IMAGE_1,
                                    q.ANSWER_2,
                                    q.CORRECT_2,
                                    q.IMAGE_2,
                                    q.ANSWER_3,
                                    q.CORRECT_3,
                                    q.IMAGE_3,
                                    q.ANSWER_4,
                                    q.CORRECT_4,
                                    q.IMAGE_4 
                            FROM php_quiz.questions q ".$this->where_categ." ORDER BY q.CATEG_ID ASC, q.NO DESC",$this->sql_array);
        
        $res_no = $this->globals->con->query($sql);
        //print_r($sql);
        while($res=$this->globals->con->fetch_object()){
            $questions[] = $res;
        }
        
        
        $this->globals->sm->assign(array(
           //"SCRIPT_CONTENT" => "MII",
            "category_id" => $this->category_id,
            "QUESTIONS" => $questions
        ));
    }
}

new Questions($_GET["app_id"]);
?>