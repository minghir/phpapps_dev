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
                                (SELECT NAME from atsepa.forum_categories b WHERE b.ID = a.PID) as P_NAME, 
                                a.NAME
                            FROM  atsepa.forum_categories a 
                            WHERE PID <> 0 
                            ORDER BY CONCAT(PID,ID)");
        
        $this->globals->con->query($sql);	
	while($res=$this->globals->con->fetch_array()){
            
            $categ_names[$res["PID"]][$res["ID"]] = $res["NAME"];
            $categ_descs[$res["PID"]][$res["ID"]] = $res["DESCRIPTION"];
            
        }
        //print_r($categ_names);
        $this->globals->sm->assign(array(
                "SCRIPT_CONTENT" => "forum_categs: Youre code here.",
                "categ_names" => $categ_names,
                "categ_descs" => $categ_descs,
        ));
        
        $this->displayTpl();
    }
}

new forum_categs($_GET["app_id"]);
?>