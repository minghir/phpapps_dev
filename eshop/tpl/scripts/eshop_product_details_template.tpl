{extends file=$display_obj->layout_file}
{block name=content}<br><br><hr>
    CATEGORY NAME: <a href="products.php?cat_id={$PRODUCT_ARRAY["CATEGORY_ID"]}">{$PRODUCT_ARRAY["CATEGORY"]}</a><br>
    PRODUCT NAME: {$PRODUCT_ARRAY["PRODUCT_TITLE"]}<br>
    DESCRIPTION: {$PRODUCT_ARRAY["DESCRIPTION"]}<br>
    PRICE:  {$PRODUCT_ARRAY["PRICE"]} {$PRODUCT_ARRAY["CURRENCY"]}<br>
    STOCK:  {$PRODUCT_ARRAY["STOCK"]} in stock<br>
     <a href="cart.php?gact=add&gfield=ID&gfield_value={$PRODUCT_ARRAY["ID"]}" class="btn btn-primary">adauga in cos</a>
    <ul>
    
        <li><img src="{$PRODUCT_IMAGES[0]}" width="100"></li>
    
    </ul>

    <div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    {foreach from=$PRODUCT_IMAGES key=k item=img name=imgs}
        <li><li data-target="#demo" data-slide-to="{$smarty.foreach.imgs.index}" {if $smarty.foreach.imgs.index == 0}class="active"{/if}></li></li>
    {/foreach}  
  </ul>

  <!-- The slideshow -->
  <div class="carousel-inner">
      {foreach from=$PRODUCT_IMAGES key=k item=img name=imgs}
            <div class="carousel-item {if $smarty.foreach.imgs.index == 0}active{/if}">
            <img src="{$img}" width="300" height="200" alt="Los Angeles">
            </div>
      {/foreach}
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
    
{$SCRIPT_CONTENT}{/block}
