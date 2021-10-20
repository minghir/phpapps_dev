{extends file=$display_obj->layout_file}
{block name=content}
   {if $message_block == '' }
  <hr>
  {foreach from=$CART_ITEMS key=k item=v}    
        <div class="m-4" >
    <div class="card" style="max-width: 540px;">
        <div class="row g-0">
            <div class="col-sm-3" style="background: white;">
                <img src="{$IMGS[$k]}" class="card-img-top h-100"   alt="...">
            </div>
            <div class="col-sm-7">
                <div class="card-body">
                    <h5 class="card-title">{$CART_PRODUCT_NAME[$k]}</h5>
                    <p class="card-text">{$CART_PRICE_NAME[$k]} {$CURRENCY} {$v} buc | <b> {$CART_PRICE_NAME[$k] * $v} {$CURRENCY} </b></p> 
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
    Date de livrare:<br>
    {$CLIENT_NAME}<br>
    {$COUNTY}, {$CITY} (cod postal:{$POSTAL_CODE})<br>
    {$ADDRESS_DETAILS}<br>
    Telefon: {$PHONE}<br>
    <a class="btn btn-primary stretched-link" href="eshop_client_address.php">modifica datele de livrare</a>
    <hr>
    <form method="POST" action="send_order.php">
       <input name="pact" type="submit" value="trimite comanda" class="btn btn-primary">
    </form>
    <hr>
    {else}
        <hr>
    {$message_block}
        <hr>
    {/if}
{/block}