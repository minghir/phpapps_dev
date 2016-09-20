<html>
<head>
{include file="commun_header.tpl" }
{literal}
<script>
	  $(document).on('change','#OBJECT_TYPE',function(){
               //alert("PROBANDO");
			$("#pact").val("selOBJID");
			$("#phpapps_users_permissions_form").submit();
          });
</script>
{/literal}
</head>
<body>
{include file="gen_tpl/phpapps_users_permissions_form.tpl" }
</body>
</html>