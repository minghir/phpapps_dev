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
		$("#phpapps_users_permissions_form").submit();
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
<hr><form name="phpapps_users_permissions_form" id="phpapps_users_permissions_form" method="POST">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
																
			
				<tr><td align="right">PERMISSION_NAME  :</td><td>
			{$PERMISSION_NAME_sel}
		</td></tr>
        
				 
								<tr><td align="right">DESCRIPTION  :</td><td> <textarea id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea></td></tr>
        										
			
		
				 
																
			
				<tr><td align="right">PERMISSION_TYPE  :</td><td>
			{$PERMISSION_TYPE_sel}
		</td></tr>
        
				 
																
			
				<tr><td align="right">OBJECT_TYPE  :</td><td>
			{$OBJECT_TYPE_sel}
		</td></tr>
        
				 
										<input id="OBJECT_ID" type="hidden" name="OBJECT_ID" value="{$OBJECT_ID}">
        								
			
		
				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>