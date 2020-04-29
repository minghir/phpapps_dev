<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#phpapps_designer_themes_form").submit();
}
  </script>
 
{$error_msg}
<hr><form name="phpapps_designer_grids_form" id="phpapps_designer_grids_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	<table class="table-borderless">
	
		 
										<input id="ID" type="hidden" name="ID" value="{$ID}">
        								
			
		                
		                				 
				<tr><td align="right">GRID_NAME :</td><td> <input type="text" id="GRID_NAME" name="GRID_NAME" value="{$GRID_NAME}"></td></tr>
																
			
		                
		                				 
																
			
				<tr><td align="right">GRID_TYPE  :</td><td>
			{$GRID_TYPE_sel}
		</td></tr>
                        
		                				 
																
			
		                
				<tr><td align="right">TABLE_ID  :</td><td>
			{$TABLE_ID_sel}
		</td></tr>
                        				 
																
			
		                
				<tr><td align="right">QUERY_ID  :</td><td>
			{$QUERY_ID_sel}
		</td></tr>
                        				 
																
			
				<tr><td align="right">EDITABLE  :</td><td>
			{$EDITABLE_sel}
		</td></tr>
                        
		                				 
																
			
				<tr><td align="right">FILTERABLE  :</td><td>
			{$FILTERABLE_sel}
		</td></tr>
                        
		                				 
																
			
				<tr><td align="right">PAGINABLE  :</td><td>
			{$PAGINABLE_sel}
		</td></tr>
                        
		                				 
																
			
				<tr><td align="right">EXPORTABLE  :</td><td>
			{$EXPORTABLE_sel}
		</td></tr>
                        
		                				 
																
			
		                
				<tr><td align="right">EDIT_FORM_ID  :</td><td>
			{$EDIT_FORM_ID_sel}
		</td></tr>
                        				 
				<tr><td align="right">ROWS_ON_PAGE :</td><td> <input type="text" id="ROWS_ON_PAGE" name="ROWS_ON_PAGE" value="{$ROWS_ON_PAGE}"></td></tr>
																
			
		                
		                				 
																
			
		                
				<tr><td align="right">ELEMENT_TEMPLATE_ID  :</td><td>
			{$ELEMENT_TEMPLATE_ID_sel}
		</td></tr>
                        				 
				<tr><td align="right">GRID_TITLE :</td><td> <input type="text" id="GRID_TITLE" name="GRID_TITLE" value="{$GRID_TITLE}"></td></tr>
																
			
		                
		                				 
																
			
				<tr><td align="right">SORTABLE  :</td><td>
			{$SORTABLE_sel}
		</td></tr>
                        
		                				{$FROM_IMP_CLASS}
		{if $gact == "editRec"}
		<tr><td></td><td>
			<input type="submit" value="salveaza" onClick='submitDetailsForm("saveRec")'></td></tr>
		{else}
			<tr><td><input type="submit" value="adauga" onClick='submitDetailsForm("addRec")'></td><td></td></tr>
		{/if}
		
	</table>
	</form><hr>