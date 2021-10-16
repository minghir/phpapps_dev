<?php
namespace wabdo;
use Smarty;

require_once ("globals.php");
require_once (PHPAPPS_LIBS_DIR . "custom_element.php");

class eshop_layout_setup extends custom_element{
    public $globals;

    public $ID = 42;
    public $CUSTOM_ELEMENT_NAME  = "eshop_layout_setup";
    public $APP_ID  = 7;
    public $APP_NAME = "eshop";
    
    public $smarty;
    
    function __construct() {
        global $GLOBALS_OBJ;
        $this->globals = &$GLOBALS_OBJ;
        
        $this->tpl = "eshop_layout_setup";        
        
        $this->smarty = new Smarty;
        $this->smarty->template_dir = CURRENT_APP_TPL_DIR ."custom_elements" . DIR_SEP;
        $this->smarty->compile_dir = SMARTY_COMPILE_DIR;
        
        if(isset($_SESSION["_CLIENT_ID"])){
            $this->smarty->assign(array(
                                    "eshop_search"=>$_SESSION["_eshop_search"],
                                    "CLIENT_ID" => $_SESSION["_CLIENT_ID"] ));
        }
        
         $this->smarty->assign(array("no_prods_in_cart"=> ( is_array($_SESSION["_CLIENT_CART"]) ? count($_SESSION["_CLIENT_CART"]): 0 ) ) );
    }
    
   
    
    function get_custom_element_str(){
        return parent::get_custom_element_str();
    }
}
?>