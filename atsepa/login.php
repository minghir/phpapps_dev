<?php
require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "phpapps_display_abs.php");

class login extends phpapps_display_abs{

    private $app_id;
    
    function __construct($app_id) {
        parent::__construct();
        echo "mimi";
        $this->layout = CURRENT_APP_LAYOUTS_DIR . "atsepa.lay";
        $this->tpl = "login.tpl";        
        $this->app_id = $app_id;
		
		if(count($_POST) > 0 ){
	
   if($_POST["user"] != "" && $_POST["pass"] != ""){
       echo "lili";
     $sql = new DB_Query("SELECT ID, 
					USERNAME
					FROM 
					atsepa.app_users 
					WHERE username = :USER AND 
					password = :PASS",
					array(":USER" => trim($_POST['user']),":PASS"=>trim($_POST['pass'])));
	print_r($sql);	
     if($this->globals->con->query($sql)==1){
	 
        $res=$this->globals->con->fetch_array();
        session_start();
        $_SESSION["_USER_ID"] = $res["ID"];
        $_SESSION["_USER_NAME"] = $res["USERNAME"];
			
        //header("Location:articles.php");
         $this->globals->sm->assign("ERROR","CORECTe!!!");
    }else{
            $this->globals->sm->assign("ERROR","USER si/sau PAROLA gresite!!!");
    }
//	$globals->sm->assign("ERROR","USER si/sau PAROLA gresite!!!");
  }

}else{
    //$globals->sm->assign("ERROR","Introduceti USER si PAROLA!!!");
     $this->globals->sm->assign("ERROR","CORECTe!!!");
}


        
        $this->globals->sm->assign(array("SCRIPT_CONTENT" => "login: Youre code here.",
                                        "CURRENT_PAGE"=>"login"));
        
        $this->displayTpl();
    }
}

new login($_GET["app_id"]);
?>