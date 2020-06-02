{extends file=$display_obj->layout_file}
{block name=content}
{literal}
    
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_admin_scripts_form").submit();
}
  </script>
{/literal}    

{literal}
<div id="server-results"><!-- For server results --></div>    
<!--
<script>
$("#phpapps_designer_templates_form").submit(function(event){
	event.preventDefault(); //prevent default action 
	//var post_url = $(this).attr("action"); //get form action url
        var post_url="phpapps_designer_templates_form_imp.php"
	var request_method = $(this).attr("method"); //get form GET/POST method
	var form_data = $(this).serialize(); //Encode form elements for submission
	
	$.ajax({
		url : post_url,
		type: request_method,
		data : form_data
	}).done(function(response){ //
		$("#server-results").html(response);
	});
});
</script>
-->
{/literal} 

<div class="container-fluid">	
<h2>{$module->APP_NAME}: {$module->MODULE_TITLE} </h2>
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href='#script_details'>Script details</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#script_elements'>Script elements</a></li>
        
    </ul>
	
        <div class="tab-content container-fluid">    
            <div id="script_details" class="container-fluid tab-pane active">{include file="generated_tpl/phpapps_admin_scripts_form_imp_generated.tpl" }</div>
            <div id="script_elements" class="container-fluid tab-pane fade">{$display_object_elements_grid}</div>
            
        </div>
</div>


{/block}