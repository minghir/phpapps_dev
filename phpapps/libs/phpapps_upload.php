<?php
namespace wabdo;
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

    public $default_data_dir = "user_data/";
    public $post_var;
    public $file_name;
    public $new_unique_file_name;
    public $file_path;
    public $file_type;
    public $file_extension;
    
    
        
    	function __construct($post_v){
            
           //ini_set('upload_max_filesize', '10M');
            global $GLOBALS_OBJ;
            $this->globals = &$GLOBALS_OBJ;

            $this->post_var = $post_v;
            $this->file_path = $this->default_data_dir . $this->globals->USER_ID . "/";
            if(!is_dir($this->file_path)){
                mkdir($this->file_path);
            }
            
            $this->file_name = basename($_FILES[$this->post_var]["name"]);
            
            print_r($_FILES);
            
            $this->file_extension = pathinfo($this->file_name, PATHINFO_EXTENSION) != "" ? ( "." . pathinfo($this->file_name, PATHINFO_EXTENSION) ) : "";
            $this->new_unique_file_name = uniqid() . $this->file_extension;
            
            //echo "<br><h1>|" . $this->file_path . "/" . $this->new_unique_file_name ."|</h1><br>"; 
            
            $this->upload();
        }
        
        function upload(){
            //print_r($_FILES);
            
            return move_uploaded_file($_FILES[$this->post_var]["tmp_name"], $this->file_path . $this->new_unique_file_name );
        }
        
        function getFilePath(){
            
            return $this->file_path . $this->new_unique_file_name;
        }
}
