<html>
<head>
{include file="commun_header.tpl" }
</head>


<body>
{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_admin_applications_form").submit();
}
  </script>
{/literal}    
{include file="gen_tpl/phpapps_admin_applications_form.tpl" }

<div id="server-results"><!-- For server results --></div>
</body>
</html>