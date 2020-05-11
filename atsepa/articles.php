<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class articles extends template{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "articles.tpl";        
        $this->app_id = $app_id;
        
        $articles_grid =  new DB_grid($this->globals->con, "table","atsepa.view_articles","articles_grid");
        $articles_grid->cols = (array("NAME","INTRO","CATEG_NAME","USERNAME","ARTICLE_DATE","IMAGE","FIRST_NAME","LAST_NAME","ID"));
        $articles_grid->labels = (array("Title","Content","CATEG_NAME","USERNAME","ARTICLE_DATE","IMAGE","FIRST_NAME","LAST_NAME","ID"));
        $articles_grid->paginable = true;
        $articles_grid->editable = false;
        $articles_grid->filterable = false;
        $articles_grid->rows_on_pg = 5;
        $articles_grid->template = CURRENT_APP_TPL_DIR . "articles_grid.tpl";
        $this->globals->sm->assign("SCRIPT_CONTENT",$articles_grid->get_grid_str());
        $this->globals->sm->assign("CURRENT_PAGE","articles");
        $this->display_template();
    }
}

new articles($_GET["app_id"]);
?>