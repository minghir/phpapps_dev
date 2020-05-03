<div class="container">
<hr><form name="test_app_test3_form" id="test_app_test3_form" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
	                		<div class="form-group">
                    <label >
                        ID :
                    </label>
                        <input class="form-control" type="text" id="ID" name="ID" value="{$ID}">
                </div>
																		                		                		                        				<div class="form-group">
                    <label >
                        COL1 :
                    </label>
                        <input class="form-control" type="checkbox" id="COL1" name="COL1" value="{$COL1}">
                </div>
                														                		                		                        		<div class="form-group">
                    <label >
                        COL2 :
                    </label>
                        <input class="form-control" type="text" id="COL2" name="COL2" value="{$COL2}">
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
