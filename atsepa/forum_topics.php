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
        
        $sql = new DB_Query( "SELECT * FROM atsepa.view_forum_topics
                                WHERE CAT_ID = :cat_id",array(":cat_id" => $this->CAT_ID));
        $articles_grid =  new DB_grid($this->globals->con, "query",$sql,"topics_grid");
        //$articles_grid->cols = (array("ID","PID","PARENT_NAME","NAME","NO_TOPICS","NO_POSTS"));
        $articles_grid->paginable = false;
        $articles_grid->editable = false;
        $articles_grid->filterable = false;
        $articles_grid->template = CURRENT_APP_TPL_DIR . "forum_topics_grid.tpl";
        $this->globals->sm->assign("FORUM_TOPICS_GRID",$articles_grid->get_grid_str());
        $this->globals->sm->assign("categ_name",  _tbl("atsepa.forum_categories", "NAME", $this->CAT_ID, "ID"));
        $this->globals->sm->assign("CURRENT_PAGE","forum");
        $this->displayTpl();
         
    }
}

new forum_topics($_GET["app_id"]);
?>