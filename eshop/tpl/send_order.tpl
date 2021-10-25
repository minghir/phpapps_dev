{extends file=$display_obj->layout_file}
{block name=content}
  <hr>
  {foreach from=$CART_ITEMS key=k item=v}    
        <div class="m-4" >
    <div class="card" style="max-width: 540px;">
        <div class="row">
            <!--
            <div class="col-sm-3" style="background: white;">
                <img src="{$IMGS[$k]}" class="card-img-top h-100"  alt="...">
            </div>
            -->
            <div class="col-sm-7">
                <div class="card-body">
                    <h5 class="card-title">{$CART_PRODUCT_NAME[$k]}: {$v} buc</h5>
                    <p class="card-text">{$CART_PRICE_NAME[$k]} {$CURRENCY} / buc | <b> {$CART_PRICE_NAME[$k] * $v} {$CURRENCY} </b></p> 
                </div>
            </div>
        </div>
    </div>
</div>    
  {/foreach}    
   <p> 
        Cost produse: {$TOTAL_CART_VALUE} {$CURRENCY}<br>
        <!-- Cost livrare si procesare: 10 {$CURRENCY}<br> -->
        <b>TOTAL: {$TOTAL_CART_VALUE} {$CURRENCY}</b>
    </p>        
    <hr>
   
    <form method="POST" action="send_order.php">
        
            <div class="form-group row">
                <div class="col-sm-3 text-right"><label class="text-right" ><b>Datele dvs. de livrare:</b></label></div>
            </div>
            <div class="form-group row">
            <div class="col-sm-3 text-right"><label class="text-right" >Numele dvs.: </label></div>
                <div class="col-sm-3"><input class="form-control"  type="text" id="NAME" name="NAME" value="{$NAME}"></div>
            </div>
            <div class="form-group row">
            <div class="col-sm-3 text-right"><label class="text-right" >Numarul de telefon: </label></div>
                <div class="col-sm-3"><input class="form-control"  type="text" id="PHONE" name="PHONE" value="{$PHONE}"></div>
            </div>
            <div class="form-group row">
            <div class="col-sm-3 text-right"><label class="text-right" >Adresa de E-mail: </label></div>
                <div class="col-sm-3"><input class="form-control"  type="text" id="EMAIL" name="EMAIL" value="{$EMAIL}"></div>
            </div>
            <div class="form-group row">
                <div class="col-sm-3 text-right">  
                      <label >Adresa de livrare:</label> 
                        </div>
                        <div class="col-sm-4 text-right"> 
                        <textarea rows="5" style="height:100%;" class="form-control" id="ADDRESS_DETAILS" name="ADDRESS_DETAILS">{$ADDRESS_DETAILS}</textarea>
                        </div>
                    </div>

 <!--           
        Date de livrare:<br>
    Nume si prenume:<input type="text" name="CLIENT_NAME" value="{$CLIENT_NAME}"><br>
    Adresa:<textarea>
    {$COUNTY}, {$CITY} (cod postal:{$POSTAL_CODE})
    {$ADDRESS_DETAILS}
    </textarea><br>
    Telefon: <input type="text" name="$PHONE" value="{$PHONE}"><br>
    <a class="btn btn-primary stretched-link" href="eshop_client_address.php">modifica datele de livrare</a>
    </div>
-->    
    <hr>
    
       <input name="pact" type="submit" value="trimite comanda" class="btn btn-primary">
    </form>
    
    {if $message_block != ''}
    <hr>
    {$message_block}
    {/if}
    <hr>

{/block}