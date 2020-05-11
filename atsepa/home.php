<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "template.php");

class home extends template{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
                
        $this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "home.tpl";        
        $this->app_id = $app_id;
        $this->globals->sm->assign("CURRENT_PAGE","home");
        
        $articles_grid =  new DB_grid($this->globals->con, "table","atsepa.view_articles","articles_grid");
        $articles_grid->cols = (array("ARTICLE_DATE","NAME","CATEG_NAME","VISIBLE"));
        $articles_grid->labels = (array("Data","Title","Categorie","Vizibil"));
        $articles_grid->paginable = true;
        $articles_grid->editable = true;
        $articles_grid->filterable = false;
        $articles_grid->rows_on_pg = 20;
        $articles_grid->template = CURRENT_APP_TPL_DIR . "admin_articles_grid.tpl";
        $this->globals->sm->assign("SCRIPT_CONTENT",$articles_grid->get_grid_str());
        
        //$this->globals->sm->assign(array("SCRIPT_CONTENT" => "home: Youre code here."));
        
        $this->display_template();
    }
}

new home($_GET["app_id"]);
?>