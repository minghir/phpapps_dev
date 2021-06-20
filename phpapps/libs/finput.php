<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace wabdo;
require_once (PHPAPPS_LIBS_DIR . "form_element.php");
/**
 * Description of finput
 *
 * @author goaga
 */
// phpapps.list_form_input_types
//	1	button
//	2	checkbox
//	3	color
//	4	date
//	5	datetime-local
//	6	email
//	7	file
//	8	hidden
//	9	image
//	10	month
//	11	number
//	12	password
//	13	radio
//	14	range
//	15	reset
//	16	search
//	17	submit
//	18	tel
//	19	text
//	20	time
//	21	url
//	22	week

class finput extends form_element{
    
    private $input_types = array("--",
                                "button",
                                "checkbox",
                                "color",
                                "date",
                                "datetime-local",
                                "email",
                                "file",
                                "hidden",
                                "image",
                                "month",
                                "number",
                                "password",
                                "radio",
                                "range",
                                "reset",
                                "search",
                                "submit",
                                "tel",
                                "text",
                                "time");
    public $input_type_id;
    public $input_type;
    
    function __construct($el_id,$in_type_id) {
        parent::__construct($el_id,2);
        
        $this->input_type = $this->input_types[$in_type_id];
    }
}
