<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class articles extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "articles.tpl";        
        $this->app_id = $app_id;
        
        $articles_grid =  new DB_grid($this->globals->con, "table","atsepa.articles","articles_grid");
        $articles_grid->cols = (array("NAME","BODY","CATEG_ID","USER_ID","ARTICLE_DATE","IMAGE"));
        $articles_grid->labels = (array("Title","Content","CATEG_ID","USER_ID","ARTICLE_DATE","IMAGE"));
        $articles_grid->paginable = true;
        $articles_grid->editable = false;
        $articles_grid->filterable = false;
        $articles_grid->rows_on_pg = 10;
        $articles_grid->template = CURRENT_APP_TPL_DIR . "articles_grid.tpl";
        $this->globals->sm->assign("SCRIPT_CONTENT",$articles_grid->get_grid_str());
        $this->displayTpl();
    }
}

new articles($_GET["app_id"]);
?>