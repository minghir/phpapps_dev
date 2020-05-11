<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class forum_categs extends template{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
	$this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "forum_categs.tpl";        
        $this->app_id = $app_id;
        
        $articles_grid =  new DB_grid($this->globals->con, "table","atsepa.view_forum_categories","articles_grid");
        $articles_grid->cols = (array("ID","PID","PARENT_NAME","NAME","NO_TOPICS","NO_POSTS"));
        $articles_grid->paginable = false;
        $articles_grid->editable = false;
        $articles_grid->filterable = false;
        $articles_grid->template = CURRENT_APP_TPL_DIR . "forum_categs_grid.tpl";
        $this->globals->sm->assign("FORUM_CATEGS_GRID",$articles_grid->get_grid_str());
        $this->globals->sm->assign("CURRENT_PAGE","forum");
        $this->display_template();
    }
}

new forum_categs($_GET["app_id"]);
?>