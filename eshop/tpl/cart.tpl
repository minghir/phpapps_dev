{extends file=$display_obj->layout_file}
{block name=content}
{if is_array($CART_ITEMS) > 0}
    <form name="cart" method="POST" action="cart.php">
    {foreach from=$CART_ITEMS key=k item=v}    
        Item:{$k} {$CART_PRODUCT_NAME[$k]} <input name="cart_items[{$k}]" type="text" size="2" value="{$v}">  {$CART_PRICE_NAME[$k]} {$CURRENCY} | {$CART_PRICE_NAME[$k] * $v} {$CURRENCY} <a href="cart.php?gact=del&gfield_del_value={$k}" color=red">X</a><br>
    {/foreach}    
    <br>
    <input name="pact" type="submit" value="actualizeaza cos"><input name="pact" type="submit" value="goleste cos">
    <br>
    TOTAL:{$TOTAL_CART_VALUE} {$CURRENCY}
    </form>
{else}
    <p>Nu aveti produse in cosul de cumparaturi </p>
{/if}
<p><a href="products.php">Click aici pentru a continua cumparaturile</a>    
     
{/block}
