{$error_msg}
<hr><form name="phpapps_database_mysql_column_defs_form" id="phpapps_database_mysql_column_defs_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
																
			
				<tr><td align="right">COLUMN_TYPE_ID  :</td><td>
			{$COLUMN_TYPE_ID_sel}
		</td></tr>
                        
		                				 
								<tr><td align="right">DEF_TPL  :</td><td> <textarea id="DEF_TPL" name="DEF_TPL">{$DEF_TPL}</textarea></td></tr>
        										
			
		                
		                				 
								<tr><td align="right">DESCRIPTION  :</td><td> <textarea id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea></td></tr>
        										
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>