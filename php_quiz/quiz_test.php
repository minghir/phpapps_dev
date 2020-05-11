<?php
require_once ("globals.php");
$GLOBALS_OBJ->ath->public_script();
require_once (PHPAPPS_LIBS_DIR . "template.php");

/*
 * Pentru categoria D
- 8 intrebari din Marinarie 1
- 8 intrebari din Conducere / Manevra 2
- 10 intrebari din RND 3
Pentru categoria C
- 6 intrebari din Manevra Agrement 4
- 6 intrebari din Marinarie Agrement 5
- 4 intrebari din Navigatie Agrement 6
- 10 intrebari din Colreg Agrement 7
 */


class quiz_test extends template{

    private $app_id;
    private $questions = array();
    private $corect_answers;
    private $CHECK = false;
    private $CATEGORY_TEST;
    
    function __construct($app_id) {
        parent::__construct();
        
        $this->tpl = "quiz_test.tpl";        
        $this->app_id = $app_id;
        $this->corect_answers = 0;
        if($_SERVER['REQUEST_METHOD'] === 'POST'){
            //print_r($_POST);
            $this->CHECK = true;
            $this->questions =  $_SESSION["questions_ses"];
            $answer = $_POST["answer"];
            //print_r($answer);
            
            for($i = 0;$i<count($this->questions);$i++){
                $this->questions[$i]->user_answer = $answer[$this->questions[$i]->ID];
                
                switch($this->questions[$i]->user_answer){
                    case 1: 
                         if( $this->questions[$i]->CORRECT_1 == 1){
                             $this->corect_answers++;
                        } 
                    break;
                    case 2: 
                        if( $this->questions[$i]->CORRECT_2 == '1'){
                             $this->corect_answers++;
                        } 
                    break;
                    case 3: 
                        if( $this->questions[$i]->CORRECT_3 == '1'){
                             $this->corect_answers++;
                        }
                    break;
                    case 4:
                        if( $this->questions[$i]->CORRECT_4 == '1'){
                             $this->corect_answers++;
                        }
                    break;
              }
            }
        //print_r($this->questions[0]);    
        }else{
            if($_GET["cat"] == "C"){
                $this->CATEGORY_TEST = "C";
            }else{
                $this->CATEGORY_TEST = "D";
            }
            $this->setupQueryDisplay();
        }
      
        $this->display_template();
    }
    
    function setupQueryDisplay(){
        $sql_D = new DB_query("
                        SELECT a.* FROM (
                            SELECT q.ID,
                                    q.NO,
                                    q.CATEG_ID,
                                    (SELECT CONCAT('(<b>',t.VALUE,'</b>) ',c.NAME) 
                                    FROM php_quiz.categories c LEFT JOIN php_quiz.list_category_type t ON  (c.CATEG_TYPE = t.ID) WHERE c.ID = q.CATEG_ID) AS CTEG_NAME,
                                    q.QUESTION,
                                    q.ANSWER_1,
                                    q.CORRECT_1,
                                    q.ANSWER_2,
                                    q.CORRECT_2,
                                    q.ANSWER_3,
                                    q.CORRECT_3,
                                    q.ANSWER_4,
                                    q.CORRECT_4
                            FROM php_quiz.questions q WHERE q.CATEG_ID = '1' ORDER BY RAND() DESC LIMIT 8  ) a
                            UNION ALL
                        SELECT b.* FROM (    
                            SELECT q.ID,
                                    q.NO,
                                    q.CATEG_ID,
                                    (SELECT CONCAT('(<b>',t.VALUE,'</b>) ',c.NAME) 
                                    FROM php_quiz.categories c LEFT JOIN php_quiz.list_category_type t ON  (c.CATEG_TYPE = t.ID) WHERE c.ID = q.CATEG_ID) AS CTEG_NAME,
                                    q.QUESTION,
                                    q.ANSWER_1,
                                    q.CORRECT_1,
                                    q.ANSWER_2,
                                    q.CORRECT_2,
                                    q.ANSWER_3,
                                    q.CORRECT_3,
                                    q.ANSWER_4,
                                    q.CORRECT_4
                            FROM php_quiz.questions q WHERE q.CATEG_ID = '2' ORDER BY RAND() DESC LIMIT 8 ) b
                            UNION ALL
                            SELECT c.* FROM (  
                            SELECT q.ID,
                                    q.NO,
                                    q.CATEG_ID,
                                    (SELECT CONCAT('(<b>',t.VALUE,'</b>) ',c.NAME) 
                                    FROM php_quiz.categories c LEFT JOIN php_quiz.list_category_type t ON  (c.CATEG_TYPE = t.ID) WHERE c.ID = q.CATEG_ID) AS CTEG_NAME,
                                    q.QUESTION,
                                    q.ANSWER_1,
                                    q.CORRECT_1,
                                    q.ANSWER_2,
                                    q.CORRECT_2,
                                    q.ANSWER_3,
                                    q.CORRECT_3,
                                    q.ANSWER_4,
                                    q.CORRECT_4
                            FROM php_quiz.questions q WHERE q.CATEG_ID = '3' ORDER BY RAND() DESC LIMIT 10 ) c
                            ",$this->sql_array);
        
                $sql_C = new DB_query("
                        SELECT a.* FROM (
                            SELECT q.ID,
                                    q.NO,
                                    q.CATEG_ID,
                                    (SELECT CONCAT('(<b>',t.VALUE,'</b>) ',c.NAME) 
                                    FROM php_quiz.categories c LEFT JOIN php_quiz.list_category_type t ON  (c.CATEG_TYPE = t.ID) WHERE c.ID = q.CATEG_ID) AS CTEG_NAME,
                                    q.QUESTION,
                                    q.ANSWER_1,
                                    q.CORRECT_1,
                                    q.ANSWER_2,
                                    q.CORRECT_2,
                                    q.ANSWER_3,
                                    q.CORRECT_3,
                                    q.ANSWER_4,
                                    q.CORRECT_4
                            FROM php_quiz.questions q WHERE q.CATEG_ID = '4' ORDER BY RAND() DESC LIMIT 6  ) a
                            UNION ALL
                        SELECT b.* FROM (    
                            SELECT q.ID,
                                    q.NO,
                                    q.CATEG_ID,
                                    (SELECT CONCAT('(<b>',t.VALUE,'</b>) ',c.NAME) 
                                    FROM php_quiz.categories c LEFT JOIN php_quiz.list_category_type t ON  (c.CATEG_TYPE = t.ID) WHERE c.ID = q.CATEG_ID) AS CTEG_NAME,
                                    q.QUESTION,
                                    q.ANSWER_1,
                                    q.CORRECT_1,
                                    q.ANSWER_2,
                                    q.CORRECT_2,
                                    q.ANSWER_3,
                                    q.CORRECT_3,
                                    q.ANSWER_4,
                                    q.CORRECT_4
                            FROM php_quiz.questions q WHERE q.CATEG_ID = '5' ORDER BY RAND() DESC LIMIT 6 ) b
                            UNION ALL
                            SELECT c.* FROM (  
                            SELECT q.ID,
                                    q.NO,
                                    q.CATEG_ID,
                                    (SELECT CONCAT('(<b>',t.VALUE,'</b>) ',c.NAME) 
                                    FROM php_quiz.categories c LEFT JOIN php_quiz.list_category_type t ON  (c.CATEG_TYPE = t.ID) WHERE c.ID = q.CATEG_ID) AS CTEG_NAME,
                                    q.QUESTION,
                                    q.ANSWER_1,
                                    q.CORRECT_1,
                                    q.ANSWER_2,
                                    q.CORRECT_2,
                                    q.ANSWER_3,
                                    q.CORRECT_3,
                                    q.ANSWER_4,
                                    q.CORRECT_4
                            FROM php_quiz.questions q WHERE q.CATEG_ID = '6' ORDER BY RAND() DESC LIMIT 4 ) c
                            UNION ALL
                            SELECT d.* FROM (  
                            SELECT q.ID,
                                    q.NO,
                                    q.CATEG_ID,
                                    (SELECT CONCAT('(<b>',t.VALUE,'</b>) ',c.NAME) 
                                    FROM php_quiz.categories c LEFT JOIN php_quiz.list_category_type t ON  (c.CATEG_TYPE = t.ID) WHERE c.ID = q.CATEG_ID) AS CTEG_NAME,
                                    q.QUESTION,
                                    q.ANSWER_1,
                                    q.CORRECT_1,
                                    q.ANSWER_2,
                                    q.CORRECT_2,
                                    q.ANSWER_3,
                                    q.CORRECT_3,
                                    q.ANSWER_4,
                                    q.CORRECT_4
                            FROM php_quiz.questions q WHERE q.CATEG_ID = '7' ORDER BY RAND() DESC LIMIT 10 ) d
                            ",$this->sql_array);
    //echo $sql_C->sql();
        if($this->CATEGORY_TEST == "C"){
            $res_no = $this->globals->con->query($sql_C);
        }else{
            $res_no = $this->globals->con->query($sql_D);
        }
        while($res=$this->globals->con->fetch_object()){
            $this->questions[] = $res;
        }
        $_SESSION["questions_ses"] = $this->questions;
    }    
     
    function setup_display(){
        $this->globals->sm->assign(array(
            "category_id" => $this->category_id,
            "QUESTIONS" => $this->questions,
            "CORRECT_ANS" => $this->corect_answers,
            "CHECK" => $this->CHECK,
        ));
    }
}
new quiz_test($_GET["app_id"]);
?>