<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class quiz_test extends phpapps_display_abs{

    private $app_id;
    private $questions = array();
    private $corect_answers;
    
    function __construct($app_id) {
        parent::__construct();
        
        $this->tpl = "quiz_test.tpl";        
        $this->app_id = $app_id;
        $this->corect_answers = 0;
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            //print_r($_POST);
            $this->questions =  $_SESSION["questions_ses"];
            $answer = $_POST["answer"];
            //print_r($answer);
            
            for($i = 0;$i<count($this->questions);$i++){
                $this->questions[$i]->user_answer = $answer[$this->questions[$i]->ID];
                
                switch($this->questions[$i]->user_answer){
                    case 1: 
                         if( $this->questions[$i]->ANSWER_1 == '1'){
                             $this->corect_answers++;
                        } 
                    break;
                    case 2: 
                        if( $this->questions[$i]->ANSWER_2 == '1'){
                             $this->corect_answers++;
                        } 
                    break;
                    case 3: 
                        if( $this->questions[$i]->ANSWER_3 == '1'){
                             $this->corect_answers++;
                        }
                    break;
                    case 4:
                        if( $this->questions[$i]->ANSWER_4 == '1'){
                             $this->corect_answers++;
                        }
                    break;
              }
            }
        }else{
            $this->setupQueryDisplay();
        }
      
        $this->displayTpl();
    }
    
    function setupQueryDisplay(){
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
        while($res=$this->globals->con->fetch_object()){
            $this->questions[] = $res;
        }
        $_SESSION["questions_ses"] = $this->questions;
    }    
     
    function setupDisplay(){
        $this->globals->sm->assign(array(
            "category_id" => $this->category_id,
            "QUESTIONS" => $this->questions,
            "CORRECT_ANS" => $this->corect_answers,
        ));
    }
}

new quiz_test($_GET["app_id"]);
?>