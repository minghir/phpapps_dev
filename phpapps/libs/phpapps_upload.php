<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of phpapps_upload
 *
 * @author victor.minghir
 */



class phpapps_upload {

    public $post_var;
    public $file_name;
    public $file_path;
    public $file_type;
    public $file_extension;
    
        
    	function __construct($post_v){
            
           //ini_set('upload_max_filesize', '10M');
            global $GLOBALS_OBJ;
            $this->globals = &$GLOBALS_OBJ;

            $this->post_var = $post_v;
            $this->file_path = "user_data/";
            $this->file_name = basename($_FILES[$this->post_var]["name"]);
           
            $this->upload();
        }
        
        function upload(){
            return move_uploaded_file($_FILES[$this->post_var]["tmp_name"], $this->file_path . $this->file_name );
        }
        
        function getFilePath(){
            return $this->file_path . $this->file_name;
        }
}
