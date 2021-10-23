{extends file=$display_obj->layout_file}
{block name=content}
<script src="{$smarty.const.PHPAPPS_JS_DIR}remember_last_tab.js"></script>
{literal}
<script>
function submitDetailsForm(op){
		$("#pact").val(op);
		$("#eshop_client_address").submit();
}
  </script>
{/literal}    
<div class="container">
<hr>
<ul class="nav nav-tabs" role="tablist">
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href='#products'>Date contact</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#categories'>Schimba parola</a></li>
</ul>
<div class="tab-content"><br>
    <div id="products" class="container-fluid tab-pane active">
        <form name="eshop_client_address" id="eshop_client_address" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="pact" id="pact" value="{$pact}">
	<input type="hidden" name="gact" value="{$gact}">
	<input type="hidden" name="gfield" value="{$gfield}">
	<input type="hidden" name="gfield_value" value="{$gfield_value}">	
        <input id="ID" type="hidden" name="ID" value="{$ID}">
                    
        <div class="form-group row">
            <div class="col-sm-4 text-right"><label class="text-right" >Nume: </label></div>
                <div class="col-sm-4"><input class="form-control"  type="text" id="FIRST_NAME" name="FIRST_NAME" value="{$FIRST_NAME}"></div>
            </div>
                       
                       <div class="form-group row">
                            <div class="col-sm-4 text-right">     
                                <label class="text-right" >Prenume: </label>
                            </div>
                            <div class="col-sm-4">
                                 <input  class="form-control" type="text" id="LAST_NAME" name="LAST_NAME" value="{$LAST_NAME}">
                            </div>
                       </div>
                        
                        <div class="form-group row">
                            <div class="col-sm-4 text-right">     
                                <label class="text-right" >Formula de adresare:</label>
                        </div>
                            <div class="col-sm-4">
                                {$TITLE_ID_sel}
                            </div>
                        </div>
                            
                        <div class="form-group row">
                            <div class="col-sm-4 text-right">     
                                <label class="text-right" >Judet:</label>
                             </div>
                            <div class="col-sm-4">    
                                {$COUNTY_ID_sel}
                            </div>
                        </div>
                            
                    <div class="form-group row">
                            <div class="col-sm-4 text-right">     
                                <label class="text-right" >Oras:</label>
                            </div>
                            <div class="col-sm-4">  
                                <input class="form-control" type="text" id="CITY" name="CITY" value="{$CITY}">
                            </div>
                    </div>
                            
                   <div class="form-group row">
                            <div class="col-sm-4 text-right"> 
                                <label>Cod postal:</label>
                            </div>
                            <div class="col-sm-4">  
                            <input class="form-control" type="text" id="POSTAL_CODE" name="POSTAL_CODE" value="{$POSTAL_CODE}">
                            </div>
                    </div>
                            
                    <div class="form-group row">
                        <div class="col-sm-4 text-right">  
                            <label >Adresa:</label> 
                        </div>
                        <div class="col-sm-4 text-right"> 
                        <textarea rows="5" style="height:100%;" class="form-control" id="ADDRESS_DETAILS" name="ADDRESS_DETAILS">{$ADDRESS_DETAILS}</textarea>
                        </div>
                    </div>
                   <div class="form-group row">
                        <div class="col-sm-4 text-right">  
                            <label>Observatii:</label>
                        </div>
                        <div class="col-sm-4 text-right"> 
                        <textarea rows="3" style="height:100%;" class="form-control" id="REMARKS" name="REMARKS">{$REMARKS}</textarea>
                        </div>
                   </div>
                     <div class="form-group row">
                        <div class="col-sm-4 text-right">  
                        <label >Telefon:</label>
                        </div>
                        <div class="col-sm-4 text-right"> 
                            <input class="form-control" type="text" id="PHONE" name="PHONE" value="{$PHONE}">
                        </div>
                     </div>
														                				                		                		        	{$FROM_IMP_CLASS}
                 <div class="form-group row">
                        <div class="col-sm-4 text-right"> 
                       <button type="submit" class="btn btn-primary mb-2" name="pact" value="saveRec">salveaza</button>
                        </div>
                 </div>
		<div class="container">
                    {$message_block}
                </div>
		
                </div>
	<!-- </form>-->
     
                 
     <div id="categories" class="container-fluid tab-pane fade">
          <!-- <form name="eshop_client_address" id="eshop_client_address" method="POST" enctype="multipart/form-data"> -->
           <div class="form-group row">
            <div class="col-sm-4 text-right"><label class="text-right" >Parola actuala: </label></div>
                <div class="col-sm-4"><input  class="form-control" type="password" id="ACTUAL_PASS" name="ACTUAL_PASS" ></div>
            </div>
                       
                       <div class="form-group row">
                            <div class="col-sm-4 text-right">     
                                <label class="text-right" >Parola noua: </label>
                            </div>
                            <div class="col-sm-4">
                                 <input  class="form-control" type="password" id="NEW_PASS" name="NEW_PASS" >
                            </div>
                       </div>
                            
                         <div class="form-group row">
                            <div class="col-sm-4 text-right">     
                                <label class="text-right" >Reintroduceti parola noua: </label>
                            </div>
                            <div class="col-sm-4">
                                 <input  class="form-control" type="password" id="NEW_PASS2" name="NEW_PASS2" >
                            </div>
                       </div>
                       <div class="form-group row">
                        <div class="col-sm-4 text-right"> 
                       <button type="submit" class="btn btn-primary mb-2" name="pact" value="changePass">schimba parola</button>
                        </div>
                 </div>     
          </form>
         <div class="container">
        {$message_pass_block}
        </div>
     </div>
      
        <hr> 
    </div>
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
{literal}
<div id="server-results"><!-- For server results --></div>    
<!--
<script>
$("#eshop_client_address").submit(function(event){
	event.preventDefault(); //prevent default action 
	//var post_url = $(this).attr("action"); //get form action url
        var post_url="eshop_client_address_imp.php"
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