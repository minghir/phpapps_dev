<?php //DB global vars  and functions

class Log
{    
    var $debug;
    var $log_type; // file, screen, syslog, none
    var $log_dir;
    var $txt = array();
    
    function __construct($log_type="file",$web_log_dir="./tmp", $debug=false){
	$this->log_type=$log_type;
	$this->log_dir=$web_log_dir;
	$this->debug=$debug;
	$this->init_log();

    }

    function init_log(){
	if($this->debug){
	    $this->txt[] = (date("Y-n-j H:i:s") ." Log session started <br>");
        }
	else return;
    }

    function do_log($message){
        if($this->debug){
	    $this->txt[]= (date("Y-n-j H:i:s") . " $message<br>");
	}
        else return;
    }

    function stop_log(){
        if($this->debug){
	    $this->txt[]= (date("Y-n-j H:i:s")." Log session end <br>");
        } else
    	    return;
    }

    function clear_log(){
	if(!$this->debug)
	    return;
//	session_start();
	$file_tmp=$this->log_dir.session_id().".html";
	$fd = @fopen($file_tmp,"w+");
	@fclose($fd);

    }

    function print_log(){
//print_r($this->txt);
	if(!$this->debug)
	    return;
	$file_tmp=$this->log_dir.".html";

	$fd = @fopen($file_tmp,"a+");
	@fwrite($fd,"<table>" . "<tr><td><b>".date("Y-n-j H:i:s")."</b></td></tr>\n");
	foreach($this->txt as $msg)
	    @fwrite($fd,"<tr><td>".$msg."</tr></td>\n");
	@fwrite($fd,"</table>\n");
	@fclose($fd);

	switch ($this->log_type){
            case "file":
            break;    
	    case "screen":
			echo "<br><br><a href=\"#Math.random()\" onClick=\"window.open('$file_tmp','1','toolbar=no,location=0,directories=no,status=no,menubar=0,scrollbars=yes,resizable=no,width=600,height=250,top=150,left=200')\">DB debug</a>";
	    break;

	    

	    case "syslog":

	    break;
	}

    }
}
?>
