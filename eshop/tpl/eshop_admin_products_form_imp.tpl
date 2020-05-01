{extends file=$display_obj->layout_file}
{block name=content}

{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#eshop_admin_products_form").submit();
}
  </script>
{/literal}    
{include file="gen_tpl/eshop_admin_products_form.tpl" }
{literal}
<div id="server-results"><!-- For server results --></div>    
<!--
<script>
$("#eshop_admin_products_form").submit(function(event){
	event.preventDefault(); //prevent default action 
	//var post_url = $(this).attr("action"); //get form action url
        var post_url="eshop_admin_products_form_imp.php"
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
{$ESHOP_PRODUCT_IMGS}
{/block}