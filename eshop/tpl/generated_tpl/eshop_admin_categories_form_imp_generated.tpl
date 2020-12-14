<div class="container">
<hr><form name="eshop_admin_categories_form_imp" id="eshop_admin_categories_form_imp" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                								<input id="ID" type="hidden" name="ID" value="{$ID}">
                						                				                		                		                        												                				                				<div class="form-group">
                    <label >
                        Parinte  :
                    </label>
			{$PID_sel}
                </div>
                                		                        		<div class="form-group">
                    <label >
                        Nume :
                    </label>
                        <input class="form-control" type="text" id="NAME" name="NAME" value="{$NAME}">
                </div>
														                				                		                		                        		<div class="form-group">
                    <label >
                        Titlu :
                    </label>
                        <input class="form-control" type="text" id="TITLE" name="TITLE" value="{$TITLE}">
                </div>
														                				                		                		                        						<div class="form-group">
                    <label >
                        Descriere  :
                    </label>
                        <textarea class="form-control" id="DESCRIPTION" name="DESCRIPTION">{$DESCRIPTION}</textarea>
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
