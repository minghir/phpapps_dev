<html>
<head>
{include file="commun_header.tpl" }
</head>
<body>
{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_database_table_fks_DDL_form").submit();
}
  </script>
{/literal}    
{include file="gen_tpl/phpapps_database_table_fks_DDL_form.tpl" }
{literal}
<div id="server-results"><!-- For server results --></div>    
<!--
<script>
$("#phpapps_database_table_fks_DDL_form").submit(function(event){
	event.preventDefault(); //prevent default action 
	//var post_url = $(this).attr("action"); //get form action url
        var post_url="phpapps_database_table_fks_DDL_form_imp.php"
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