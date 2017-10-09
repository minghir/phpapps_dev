<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class forum_topics extends phpapps_display_abs{

    private $app_id;
    private $CAT_ID;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "forum_topics.tpl";        
        $this->app_id = $app_id;
        $this->CAT_ID = $_GET["categ_id"];
        
         $sql = new DB_Query( "SELECT "
                 . "ID, "
                 . "SUBJECT, "
                 . "DESCRIPTION, "
                 . "TOPIC_DATE, "
                 . "(SELECT NAME FROM atsepa.forum_categories WHERE atsepa.forum_categories.ID = atsepa.topics.CAT_ID) AS CAT_NAME " 
                 . "FROM atsepa.topics "
                 . "WHERE atsepa.topics.CAT_ID = :cat_id",array(":cat_id"=>$this->CAT_ID));

        $this->globals->con->query($sql);	
	while($res=$this->globals->con->fetch_array()){
            $topic_ids[] = $res["ID"];
            $topic_subjects[] = $res["SUBJECT"];
            $cat_name = $res["CAT_NAME"];
        }
        
        $this->globals->sm->assign(array(
            "topic_ids" => $topic_ids,
            "topic_subjects" => $topic_subjects,
            "categ_name" => $cat_name,
            ));
        $this->globals->sm->assign("CURRENT_PAGE","forum");
        $this->displayTpl();
    }
}

new forum_topics($_GET["app_id"]);
?>