{$error_msg}
<hr><form name="emanag_lol_lol_vars_form" id="emanag_lol_lol_vars_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table border="1">
	
		 
				<tr><td align="right">NR_VENITURI :</td><td> <input type="text" id="NR_VENITURI" name="NR_VENITURI" value="{$NR_VENITURI}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">CASS :</td><td> <input type="text" id="CASS" name="CASS" value="{$CASS}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">IMPOZIT :</td><td> <input type="text" id="IMPOZIT" name="IMPOZIT" value="{$IMPOZIT}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">CIAS :</td><td> <input type="text" id="CIAS" name="CIAS" value="{$CIAS}"></td></tr>
																
			
		                
		                				 
				<tr><td align="right">ZILE_LUNA_MEDIE :</td><td> <input type="text" id="ZILE_LUNA_MEDIE" name="ZILE_LUNA_MEDIE" value="{$ZILE_LUNA_MEDIE}"></td></tr>
																
			
		                
		                				 
																<!-- <tr><td align="right">DATA_START :</td><td> <input type="text" class="tcal" name="DATA_START" value="{$DATA_START}"></td></tr> -->
		<tr><td align="right">DATA_START :</td><td> <input id="DATA_START" type="date" name="DATA_START" value="{$DATA_START}"></td></tr>
        		
			
		                
		                				 
																<!-- <tr><td align="right">DATA_END :</td><td> <input type="text" class="tcal" name="DATA_END" value="{$DATA_END}"></td></tr> -->
		<tr><td align="right">DATA_END :</td><td> <input id="DATA_END" type="date" name="DATA_END" value="{$DATA_END}"></td></tr>
        		
			
		                
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>