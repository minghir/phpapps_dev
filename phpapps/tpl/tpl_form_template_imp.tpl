{ldelim}extends file=$display_obj->layout_file{rdelim}
{ldelim}block name=content{rdelim}
{ldelim}literal{rdelim}{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#{/literal}{$form_name}{literal}").submit();
}
  </script>
{/literal}{ldelim}/literal{rdelim}    
{ldelim}include file="{$tpl_form_template}" {rdelim}
{ldelim}literal{rdelim}{literal}
<div id="server-results"><!-- For server results --></div>    
<!--
<script>
$("#{/literal}{$form_name}{literal}").submit(function(event){
	event.preventDefault(); //prevent default action 
	//var post_url = $(this).attr("action"); //get form action url
        var post_url="{/literal}{$form_name}{literal}_imp.php"
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
{/literal}{ldelim}/literal{rdelim} 

{ldelim}/block{rdelim}