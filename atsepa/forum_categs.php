<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class forum_categs extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
		$this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "forum_categs.tpl";        
        $this->app_id = $app_id;
        
        $sql = new DB_Query("SELECT 
                                a.PID,
                                a.ID,  
                                a.NAME
                            FROM  atsepa.forum_categories a 
                            WHERE PID = 0 AND ID <> 0
                            ORDER BY CONCAT(PID,ID)");
        
        $this->globals->con->query($sql);	
	while($res=$this->globals->con->fetch_array()){
            $categ_ids[] = $res["ID"];
            $categ_names[] = $res["NAME"];
            $categ_descs[] = $res["DESCRIPTION"];
            
            $sql2 =  new DB_Query("SELECT ID,PID,NAME,"
                    . "(SELECT COUNT(*) FROM atsepa.topics WHERE atsepa.topics.CAT_ID = atsepa.forum_categories.ID ) AS NO_TOPICS, "
                    . "(SELECT COUNT(*) FROM atsepa.posts LEFT JOIN atsepa.topics ON (atsepa.posts.TOPIC_ID = atsepa.topics.ID)  WHERE atsepa.topics.CAT_ID = atsepa.forum_categories.ID ) AS NO_POSTS "
                    . "from atsepa.forum_categories "
                    . "WHERE PID = :pid ",
                    array(":pid"=>$res["ID"]));
            
            $this->globals->con->query($sql2,"subcategs");	
            $subcategs_ids = array();
            $subcategs_names = array();
            $subcategs_no_topics = array();
            $subcategs_no_posts = array();
            while($res2=$this->globals->con->fetch_array("subcategs")){
                $subcategs_ids[] = $res2["ID"];
                $subcategs_names[] = $res2["NAME"];
                $subcategs_no_topics[] = $res2["NO_TOPICS"];
                $subcategs_no_posts[] = $res2["NO_POSTS"];
            }
            $categ_subcategs_names[] = $subcategs_names;
            $categ_subcategs_ids[] = $subcategs_ids;
            $categ_subcategs_no_topics[] = $subcategs_no_topics;
            $categ_subcategs_no_posts[] = $subcategs_no_posts;

        }
        //print_r($categ_names);
        $this->globals->sm->assign(array(
                "SCRIPT_CONTENT" => "forum_categs: Youre code here.",
                "categ_ids" => $categ_ids,
                "categ_names" => $categ_names,
                "categ_descs" => $categ_descs,
                "categ_subcategs_names" => $categ_subcategs_names,
                "categ_subcategs_ids" => $categ_subcategs_ids,
                "categ_subcategs_no_topics" => $categ_subcategs_no_topics,
                "categ_subcategs_no_posts" => $categ_subcategs_no_posts
        ));
        $this->globals->sm->assign("CURRENT_PAGE","forum");
        $this->displayTpl();
    }
}

new forum_categs($_GET["app_id"]);
?>