<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class Questions extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->tpl = "Questions.tpl";        
        $this->app_id = $app_id;
        
        //$sql = new DB_query($q)
        
        $this->displayTpl();
    }
    function setupDisplay(){
        $sql = new DB_query("SELECT q.NO,
                                    q.CATEG_ID,
                                    (SELECT c.NAME FROM php_quiz.categories c WHERE c.ID = q.CATEG_ID) AS CTEG_NAME,
                                    q.QUESTION,
                                    q.ANSWER_1,
                                    q.CORRECT_1,
                                    q.IMAGE_1,
                                    q.ANSWER_2,
                                    q.CORRECT_2,
                                    q.IMAGE_2,
                                    q.ANSWER_3,
                                    q.CORRECT_3,
                                    q.IMAGE_3 
                            FROM php_quiz.questions q ORDER BY q.CATEG_ID, q.NO");
        
        $res_no = $this->globals->con->query($sql);
        
        while($res=$this->globals->con->fetch_object()){
            $questions[] = $res;
        }
        
        
        $this->globals->sm->assign(array(
           //"SCRIPT_CONTENT" => "MII",
            "QUESTIONS" => $questions
        ));
    }
}

new Questions($_GET["app_id"]);
?>