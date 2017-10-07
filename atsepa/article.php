<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class article extends phpapps_display_abs{

    private $app_id;
    private $ARTICLE_ID;
    
    function __construct($app_id) {
        parent::__construct();
        $this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "article.tpl";        
        $this->app_id = $app_id;
        $this->ARTICLE_ID = $_GET["ID"];
        
        $sql = new DB_query("SELECT NAME,USERNAME,ARTICLE_DATE,IMAGE,FIRST_NAME,LAST_NAME,BODY "
                . "FROM atsepa.view_articles WHERE ID = :article_id",array(":article_id"=>$this->ARTICLE_ID));
        //print_r($sql);
        $this->globals->con->query($sql);
	$this->globals->con->next();
        $NAME = stripslashes($this->globals->con->get_field("NAME"));
        $IMAGE = stripslashes($this->globals->con->get_field("IMAGE"));
        $USERNAME = stripslashes($this->globals->con->get_field("USERNAME"));
        $ARTICLE_DATE = stripslashes($this->globals->con->get_field("ARTICLE_DATE"));
        $FIRST_NAME = stripslashes($this->globals->con->get_field("FIRST_NAME"));
        $LAST_NAME = stripslashes($this->globals->con->get_field("LAST_NAME"));
        $BODY = stripslashes($this->globals->con->get_field("BODY"));
        
        $this->globals->sm->assign(array("NAME" => $NAME,
                                        "IMAGE"=>$IMAGE,
                                        "BODY"=>$BODY,
                                        "ARTICLE_DATE"=>$ARTICLE_DATE,
                                        "FIRST_NAME" => $FIRST_NAME,
                                        "LAST_NAME" => $LAST_NAME,
                                        "USERNAME" => $USERNAME));
        $this->globals->sm->assign("CURRENT_PAGE","articles");
        $this->displayTpl();
    }
}

new article($_GET["app_id"]);
?>