<?php

/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class user_profile{
        public $globals;
        public $USER_THEME_NAME = "DARK";
        public $THEME_CSS = "dark_style.css";
        private $user_id;
                
        function __construct($glb, $usr_id){
            GLOBAL $globals;
            $this->globals = $glb;
            $this->user_id = $usr_id;
            
            $this->setup();
        }
    
        function setup(){
            $this->globals->sm->assign("THEME_CSS",$this->THEME_CSS);
        }
}