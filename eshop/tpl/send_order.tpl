{extends file=$display_obj->layout_file}
{block name=content}<br><br><br>

  {foreach from=$CART_ITEMS key=k item=v}    
        Item:{$k} {$CART_PRODUCT_NAME[$k]} {$v} bucati  {$CART_PRICE_NAME[$k]} {$CURRENCY} | {$CART_PRICE_NAME[$k] * $v} {$CURRENCY}<br>
  {/foreach}    
    TOTAL:{$TOTAL_CART_VALUE} {$CURRENCY}
    <hr>
    Date de livrare:<br>
    {$FIRST_NAME} {$LAST_NAME}<br>
    Judet {$COUNTY}, Bucuresti<br>
    Strada Almasul Mic, nr. 10, bl. B17, ap.36, et. 1, Sector 4<br>
    Telefon: 0721.655.467<br>
    <a href="http://localhost/phpapps_dev/eshop/eshop_client_address.php">modifica datele de livrare</a>
    <hr>
    <form method="POST" action="send_order.php">
       <input name="pact" type="submit" value="trimite comanda">
    </form>
{/block}