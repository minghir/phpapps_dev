{extends file=$display_obj->layout_file}
{block name=content}

{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#contact").submit();
}
  </script>
{/literal}    
<div class="container">{include file="generated_tpl/contact_generated.tpl" }</div>
{literal}
<div id="server-results"><!-- For server results --></div>    
<!--
<script>
$("#contact").submit(function(event){
	event.preventDefault(); //prevent default action 
	//var post_url = $(this).attr("action"); //get form action url
        var post_url="contact_imp.php"
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
BBBBBBBBBBBBBBBBBBBBBBBBB

{$ESHOP_MAIN_MENU}



BBBBBBBBBBBBBBBBBBBBBBBBB
x
x
x
x
x
{/block}