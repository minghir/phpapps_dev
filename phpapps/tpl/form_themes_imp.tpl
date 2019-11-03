<html>
<head>
{include file="commun_header.tpl" }
</head>
<body>
{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#").submit();
}
  </script>
{/literal}    
{include file="gen_tpl/form_themes.tpl" }
{literal}
<div id="server-results"><!-- For server results --></div>    
<!--
<script>
$("#").submit(function(event){
	event.preventDefault(); //prevent default action 
	//var post_url = $(this).attr("action"); //get form action url
        var post_url="_imp.php"
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

</body>
</html>