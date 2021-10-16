<div class="container">
<hr><form name="eshop_client_address" id="eshop_client_address" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                								<input id="ID" type="hidden" name="ID" value="{$ID}">
                						                				                		                		                        		<div class="form-group">
                    <label >
                        Nume: :
                    </label>
                        <input class="form-control" type="text" id="FIRST_NAME" name="FIRST_NAME" value="{$FIRST_NAME}">
                </div>
														                				                		                		                        		<div class="form-group">
                    <label >
                        Prenume: :
                    </label>
                        <input class="form-control" type="text" id="LAST_NAME" name="LAST_NAME" value="{$LAST_NAME}">
                </div>
														                				                		                		                        												                						<div class="form-group">
                    <label >
                        Titlu  :
                    </label>
			{$TITLE_ID_sel}
                </div>
                                		                		                        												                						<div class="form-group">
                    <label >
                        Judet:  :
                    </label>
			{$COUNTY_ID_sel}
                </div>
                                		                		                        		<div class="form-group">
                    <label >
                        Oras: :
                    </label>
                        <input class="form-control" type="text" id="CITY" name="CITY" value="{$CITY}">
                </div>
														                				                		                		                        		<div class="form-group">
                    <label >
                        Cod postal: :
                    </label>
                        <input class="form-control" type="text" id="POSTAL_CODE" name="POSTAL_CODE" value="{$POSTAL_CODE}">
                </div>
														                				                		                		                        						<div class="form-group">
                    <label >
                        Adresa:  :
                    </label>
                        <textarea class="form-control" id="ADDRESS_DETAILS" name="ADDRESS_DETAILS">{$ADDRESS_DETAILS}</textarea>
                </div>
                								                				                		                		                        						<div class="form-group">
                    <label >
                        Observatii:  :
                    </label>
                        <textarea class="form-control" id="REMARKS" name="REMARKS">{$REMARKS}</textarea>
                </div>
                								                				                		                		                        		<div class="form-group">
                    <label >
                        Mobil: :
                    </label>
                        <input class="form-control" type="text" id="PHONE" name="PHONE" value="{$PHONE}">
                </div>
														                				                		                		        	{$FROM_IMP_CLASS}
                <div class="form-group">
	{if $gact == "editRec"}
                       <button type="submit" class="btn btn-primary mb-2" name="pact" value="saveRec">save</button>
		{elseif $gact == "deleteRec"}
                        <button type="submit" class="btn btn-primary mb-2" name="pact" value="deleteRec">delete</button>
                {else}
                        <button type="submit" class="btn btn-primary mb-2" name="pact" value="addRec">add</button>
		{/if}
                        <button class="btn btn-primary mb-2 hBack" name="pact" value="back">back</button>
		
                </div>
	</form>
        <hr>
</div>
<div class="container">
        {$message_block}
</div>

    <script>
$(".hBack").on("click", function(e){
    if (window.opener && window.opener !== window) {
        window.close();
    }
    e.preventDefault();
    window.history.back();
});
</script>
