<?php
namespace wabdo;
use Smarty;
	//require_once ("globals.php");
	class code_editor{
		private $file_path;
		private $file;
		private $file_type;
		private $file_content;
		private $globals;
		private $sm;
                
                public $code_editor_tpl;
		
		function __construct($file_name,$f_type = "php"){
			global $GLOBALS_OBJ;
                        
                        $this->file_type = $f_type;
			$this->globals = &$GLOBALS_OBJ;
                        $this->code_editor_tpl = "code_editor.tpl";
			
			$this->sm = new Smarty;
                        $this->sm->template_dir = PHPAPPS_LIBS_TPL_DIR;
			
			//echo PHPAPPS_LIBS_TPL_DIR . "<br>";
			//print_r( $this->sm->template_dir );
                        $this->sm->compile_dir = SMARTY_COMPILE_DIR;
			
			$this->file_path=$file_name;
                        
			
			if($_POST["pact"] == "save"){
				$this->file_content = trim($_POST["code"]);
				$this->file_path = $_POST["file_path"];
				$this->saveFile();
			}else{
				$this->init();
			}
			
		}
		
		function init(){
			
			$fp = fopen($this->file_path . $this->file,"r");
			if(!$fp) die("Can't open device" . $this->file);
			$file_content = "";
			while (!feof($fp)) {
				$this->file_content .= fread($fp, 8192);
			}
			fclose($fp);
		}
		
		function parsePostVars(){
		}
		
		function parseGetVars(){
		}
		
		function saveFile(){
			$this->backupFile();
		}
		
		function backupFile(){
		
			if (is_writable($this->file_path)) {

    //$this->file_path
			if (!$handle = fopen($this->file_path, 'w')) {
					 echo "Cannot open file ($filename)";
					 exit;
				}

			if (fwrite($handle, $this->file_content) === FALSE) {
				echo "Cannot write to file ($filename)";
				exit;
			}

			echo "Success, wrote ($somecontent) to file ($filename)";

			fclose($handle);

			} else {
				echo "The file $filename is not writable";
			}
		}
		
		
		function display(){
			$this->sm->assign(array(
								"file_content" => $this->file_content,
								"file_name" => $this->file_path,
								"file_path" => $this->file_path,
                                                                "file" => $this->file,
                                                                "file_type" => $this->file_type,
								"CODEMIRROR_DIR" => CODEMIRROR_DIR,
			));
			$this->sm->display($this->code_editor_tpl);
		}
		
		function get_str(){
			$this->sm->assign(array(
								"file_content" => $this->file_content,
								"file_name" => $this->file_path,
								"file_path" => $this->file_path,
                                                                "file" => $this->file,
								"CODEMIRROR_DIR" => CODEMIRROR_DIR,
			));
			return $this->sm->fetch($this->code_editor_tpl);
		}
	}	
?>