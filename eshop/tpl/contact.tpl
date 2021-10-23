{extends file=$display_obj->layout_file}
{block name=content}

{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#contact").submit();
}
  </script>
{/literal}    

<div class="container">
<hr><form name="contact" id="contact" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{$pact}">
			<input type="hidden" name="gact" value="{$gact}">
			<input type="hidden" name="gfield" value="{$gfield}">
			<input type="hidden" name="gfield_value" value="{$gfield_value}">	
                    <input id="CLIENT_ID" type="hidden" name="CLIENT_ID" value="{$CLIENT_ID}">
                    <div class="form-group">                                                                    
                    <label >
                    Numele dvs.:
                    </label>
                        <input class="form-control" type="text" id="CLIENT_NAME" name="CLIENT_NAME" value="{$CLIENT_NAME}">
                    </div>   
                    <div class="form-group">
                    <label >
                     E-mail:
                    </label>
                        <input class="form-control" type="text" id="EMAIL" name="EMAIL" value="{$EMAIL}">
                    </div>
                    <div class="form-group">
                    <label >
                     Mesajul dvs.:
                    </label>
                        <textarea class="form-control" id="MESSAGE" name="MESSAGE">{$MESSAGE}</textarea>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary mb-2" name="pact" value="addRec">trimite</button>
                    </div>    
                </div>
                								                				                		                		                        		<div class="form-group">
                    
                
														                				                		                		        	{$FROM_IMP_CLASS}
               

                

		
               
	</form>
        <hr>
</div>
<div class="container">
        {$message_block}
</div>


{literal}
<div id="server-results"><!-- For server results --></div>    
<!--
<script>
$("#contact").submit(function(event){
	event.preventDefault(); //prevent default action 
	//var post_url = $(this).attr("action"); //get form action url
        var post_url="contact_imp.php"
	var request_method = $(this).attr("method"); //get form GET/POST method
	var form_data = $(this).serialize(); //Encode form elements for submission
	
	$.ajax({
		url : post_url,
		type: request_method,
		data : form_data
	}).done(function(response){ //
		$("#server-results").html(response);
	});
});
</script>
-->
{/literal}
{/block}