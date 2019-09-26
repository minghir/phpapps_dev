<html>
<head>
{ldelim}include file="commun_header.tpl" {rdelim}
</head>
<body>
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

{/literal}{ldelim}/literal{rdelim} 

</body>
</html>