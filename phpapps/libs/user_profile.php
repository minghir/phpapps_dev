<?php
namespace wabdo;
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class user_profile{
        public $globals;
        public $PROFILE_NAME;
        public $THEME_NAME = "DARK";
        public $THEME_CSS = "dark_style";
        private $ID;
                
        function __construct($glb){
            $this->globals = $glb;
            $this->ID = $this->globals->USER_PROFILE_ID;
            $this->load_profile();
            $this->setup();
        }
    
        function load_profile(){
            
            $sql2 = new DB_query("SELECT "
                    . "PROFILE_NAME, THEME_NAME, CSS_FILE, SCRIPT_NAME "
                    . "FROM phpapps.view_user_profiles WHERE ID =:ID",array(":ID"=>$this->ID));
            
            if($this->globals->con->query($sql2)==1){
                $res=$this->globals->con->fetch_array();
                $this->PROFILE_NAME = $res["PROFILE_NAME"];
                $this->THEME_NAME = $res["THEME_NAME"];
                $this->THEME_CSS = $res["CSS_FILE"];
            }
    }
        
        function setup(){
            $this->globals->sm->assign("THEME_CSS",$this->THEME_CSS.".css");
        }
}