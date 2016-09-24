{literal}
<script>
/*
 $(function() {
    $( "input[type=submit], a, button" )
      .button()
      .click(function( event ) {
        event.preventDefault();
      });
  });
*/
    function submitDetailsForm(op)
    {
		$("#pact").val(op);
		$("#phpapps_admin_lists").submit();
    }
/*
	$(function() {
		$( "#datepicker" ).datepicker();
		$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );
		$( "#datepicker" ).datepicker( "setDate", new Date(2008,9,03)  );
	});
*/
  </script>
{/literal}
{$error_msg}
<hr><form name="phpapps_admin_lists" id="phpapps_admin_lists" method="POST">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
				<tr><td align="right">TABLE_NAME :</td><td> <input type="text" name="TABLE_NAME" value="{$TABLE_NAME}"></td></tr>
																
			
		
				 
				<tr><td align="right">DESCRIPTION :</td><td> <input type="text" name="DESCRIPTION" value="{$DESCRIPTION}"></td></tr>
																
			
		
				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>