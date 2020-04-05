{extends file=$display_obj->layout_file}
{block name=content}
{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#diomax_admin_links_form").submit();
}
  </script>
{/literal}    
{include file="gen_tpl/diomax_admin_links_form.tpl" }
{literal}
<div id="server-results"><!-- For server results --></div>    
<!--
<script>
$("#diomax_admin_links_form").submit(function(event){
	event.preventDefault(); //prevent default action 
	//var post_url = $(this).attr("action"); //get form action url
        var post_url="diomax_admin_links_form_imp.php"
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