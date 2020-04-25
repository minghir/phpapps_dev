<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of HrefActions
 *
 * @author goaga
 */
class HrefActions{
	var $act_script;
	var $label;
	var $action;
	var $fields = array();
	var $confirm_msg;
	var $popup = false;
	
	function getFieldHref($res,$flds){
            
                if( strpos($this->act_script,'?') === false ){
                    if($this->action == ''){
                        $href = $this->act_script ."?";
                    }else{
                        $href = $this->act_script ."?gact=".$this->action;
                    }
                }else{
                    if($this->action == ''){
                        $href = $this->act_script;
                    }else{
                        $href = $this->act_script ."&gact=".$this->action;
                    }
                }
                
                
		$flipped = array_flip($flds);
		for($i = 0; $i < count($this->fields); $i++){
			$gfield = $this->fields[$i];
			// ID-ul se afla intodeauna pe ultima pozitie
			$gfield_value = $this->fields[$i] == "ID" ? $res[count($res) - 1] :$res[$flipped[$this->fields[$i]]];
			$href .= ($i > 0 ) ?  "&gfield$i=$gfield&gfield_value$i=$gfield_value" : "&gfield=$gfield&gfield_value=$gfield_value";
		}
		
		if( $this->popup == true ){
			if($this->confirm_msg != ""){
				return "<a href=\"".$href."\" onclick=\"if(confirm('".$this->confirm_msg."')) window.open('".$href."','popup','width=800,height=0,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false\">".$this->label."</a>";
			}else{
				return "<a href=\"".$href."\" onclick=\"window.open('".$href."','popup','width=800,height=0,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false\">".$this->label."</a>";
			}
		}else{
			return "<a href=\"".$href."\">".$this->label."</a>";
		}
	}
	
	function getHref(){
		$href = strpos($this->act_script,'?') === false ? $this->act_script ."?gact=". $this->action : $this->act_script ."&gact=". $this->action;
	
		if( $this->popup == true ){
			if($this->confirm_msg != ""){
				return "<a href=\"".$href."\" onclick=\"if(confirm('".$this->confirm_msg."')) window.open('".$href."','popup','width=800,height=0,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false\">".$this->label."</a>";
			}else{
				return "<a href=\"".$href."\" onclick=\"window.open('".$href."','popup','width=800,height=0,scrollbars=no,resizable=no,toolbar=no,directories=no,location=no,menubar=no,status=no,left=0,top=0'); return false\">".$this->label."</a>";
			}
		}else{
			return "<a href=\"".$href."\">".$this->label."</a>";
		}
	}
};
?>
