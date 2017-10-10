<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class forum_posts extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "forum_posts.tpl";        
        $this->app_id = $app_id;
        
        $topic_id = $_GET["topic_id"];
        $sql = new DB_Query( "SELECT ID, POST_DATE, TOPIC_ID, USER_ID, CONTENT,"
                . "(SELECT USERNAME FROM atsepa.app_users WHERE atsepa.app_users.ID = atsepa.posts.USER_ID ) AS USERNAME, "
                
                . "(SELECT SUBJECT FROM atsepa.topics WHERE atsepa.topics.ID = :topic_id) AS SUBJECT "
                . "FROM atsepa.posts WHERE TOPIC_ID = :topic_id", array(":topic_id" => $topic_id));
        //print_r($sql);
        $this->globals->con->query($sql);	
	while($res=$this->globals->con->fetch_array()){
            $posts_ids[] = $res["ID"];
            $posts_date[] = $res["POST_DATE"];
            $posts_users[] = $res["USERNAME"];
            $posts_contents[] = $res["CONTENT"];
            $topic_name = $res["SUBJECT"];
            
            $categ_id = _tbl("atsepa.topics","CAT_ID",$res["TOPIC_ID"],"ID");
            $categ_name = _tbl("atsepa.forum_categories","NAME",$categ_id,"ID");
        }
        
        //{$categ_id}">{$categ_name}
        
        $this->globals->sm->assign(array(
                "posts_ids" => $posts_ids,
                "posts_date" => $posts_date,
                "posts_users" => $posts_users,
                "posts_contents" => $posts_contents,
                "topic_name" => $topic_name,
                "categ_id" => $categ_id,
                "categ_name" => $categ_name,
            ));
        
        $this->displayTpl();
    }
}

new forum_posts($_GET["app_id"]);
?>