{extends file=$display_obj->layout_file}
{block name=content}

{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_custom_forms_form").submit();
}
  </script>
{/literal}    
<ul class="nav nav-tabs" role="tablist">
    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href='#tab1'>Details</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab2'>Form elements</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab3'>Form actions</a></li>
</ul>
	   <div class="tab-content container-fluid">    
            <div id="tab1" class="container-fluid tab-pane active"><p>{include file="generated_tpl/phpapps_designer_custom_forms_form_generated.tpl" }</p></div>
            <div id="tab2" class="container-fluid tab-pane fade"><p>{$PHPAPPS_DESIGNER_FORM_ELEMENTS}</p></div>
            <div id="tab3" class="container-fluid tab-pane fade"><p>---</p></div>
        </div>
</div>




{literal}
<div id="server-results"><!-- For server results --></div>    
<!--
<script>
$("#phpapps_designer_custom_forms_form").submit(function(event){
	event.preventDefault(); //prevent default action 
	//var post_url = $(this).attr("action"); //get form action url
        var post_url="phpapps_designer_custom_forms_form_imp.php"
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

{/block}