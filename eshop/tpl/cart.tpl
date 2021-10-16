{extends file=$display_obj->layout_file}
{block name=content}
     <hr>
{if is_array($CART_ITEMS) > 0}
    <form name="cart" method="POST" action="cart.php">
    {foreach from=$CART_ITEMS key=k item=v}    
    <div class="m-4" >
    <div class="card" style="max-width: 540px;">
        <div class="row g-0">
            <div class="col-sm-3" style="background: white;">
                <img src="{$IMGS[$k]}" class="card-img-top embed-responsive-item"   alt="...">
            </div>
            <div class="col-sm-7">
                <div class="card-body">
                    <h5 class="card-title">{$CART_PRODUCT_NAME[$k]}</h5>
                    <p class="card-text">{$CART_PRICE_NAME[$k]} {$CURRENCY} <input name="cart_items[{$k}]" type="text" size="2" value="{$v}"> buc | <b> {$CART_PRICE_NAME[$k] * $v} {$CURRENCY} </b></p> 
                    <input name="pact" type="submit" value="actualizeaza" class="btn btn-primary"> <a href="cart.php?gact=del&gfield_del_value={$k}" class="btn btn-primary stretched-link">sterge</a>
                </div>
            </div>
        </div>
    </div>
</div>    
{/foreach}                 
<hr>
  <input name="pact" type="submit" value="goleste cos" class="btn btn-primary">
   </form>
  <hr>
<p> 
        Cost produse: {$TOTAL_CART_VALUE} {$CURRENCY}<br>
        <!-- Cost livrare si procesare: 10 {$CURRENCY}<br> -->
        <b>TOTAL: {$TOTAL_CART_VALUE} {$CURRENCY}</b>
    </p>        
        
{else}
    <p><h3>Nu aveti produse in cosul de cumparaturi!</h3></p>
{/if}
<hr>
<p><a href="products.php" class="btn btn-primary stretched-link">continua cumparaturile</a> {if is_array($CART_ITEMS) > 0}  <a href="send_order.php" class="btn btn-primary stretched-link">trimite comanda</a> {/if}</p>  
<hr>
{/block}
