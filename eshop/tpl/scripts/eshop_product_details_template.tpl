{extends file=$display_obj->layout_file}
{block name=content}
    <hr>
    <h3> <a href="products.php?cat_id={$PRODUCT_ARRAY["CATEGORY_ID"]}">{$PRODUCT_ARRAY["CATEGORY"]}</a> \ {$PRODUCT_ARRAY["PRODUCT_TITLE"]}</h3>
    <hr>
    
    
    
    <div class="container-fluid">
    <div class="row">
        <div class="col-12 mt-3">
            <div class="card col-12" style="height:400;">
                <div class="card-horizontal">
                    <div class="img-square-wrapper">
                       <!-- <img class="" src="{$img}" alt="Card image cap" style="object-fit:contain; height: 650px; max-height: 28vh;"> -->
                                          <div class="container">  
                                          <div id="demo" class="carousel slide" data-ride="carousel" data-interval="false">

                                         <!-- Indicators -->
                                         {if count($PRODUCT_IMAGES) > 1}
                                         <ul class="carousel-indicators" >
                                           {foreach from=$PRODUCT_IMAGES item=imgs name=imgs}
                                           <li data-target="#demo" data-slide-to="0" {if $smarty.foreach.imgs.first}class="active"{/if}></li>
                                           {/foreach}
                                         </ul>
                                         {/if}

                                         <!-- The slideshow -->
                                         <div class="carousel-inner bg-white text-center" >
                                           {foreach from=$PRODUCT_IMAGES item=img name=imgs2}
                                           <div class="carousel-item {if $smarty.foreach.imgs2.first}active{/if}">
                                             <img src="{$img}" alt="Chicago"  style="object-fit:contain; height: 300px;">
                                           </div>
                                          {/foreach}
                                         </div>
                                         
                                         {if count($PRODUCT_IMAGES) > 1}
                                         <!-- Left and right controls -->
                                         <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                           <span class="carousel-control-prev-icon"></span>
                                         </a>
                                         <a class="carousel-control-next" href="#demo" data-slide="next">
                                           <span class="carousel-control-next-icon"></span>
                                         </a>
                                         {/if}

                                       </div>
                                       </div>
                    </div>
                    <div class="card-body">
                        <h4 class="card-title">{$PRODUCT_ARRAY["PRODUCT_TITLE"]}</h4>
                       <!-- <p class="card-text"> <a href="products.php?cat_id={$PRODUCT_ARRAY["CATEGORY_ID"]}">{$PRODUCT_ARRAY["CATEGORY"]}</a><br> -->
                        {$PRODUCT_ARRAY["DESCRIPTION"]}</p>
                    <p><h4>{$PRODUCT_ARRAY["PRICE"]} {$PRODUCT_ARRAY["CURRENCY"]}</h4></p>
                    <p>{$PRODUCT_ARRAY["STOCK"]} in stoc</p>
                    </div>
                </div>
                <div class="card-footer">
                    <small class="text-muted"><a href="cart.php?gact=add&gfield=ID&gfield_value={$PRODUCT_ARRAY["ID"]}" class="btn btn-primary">adauga in cos</a></small>
                </div>
            </div>
        </div>
    </div>
    </div>
    
    
    
   <!-- 
    
    
    
    
    
    
    
    
    
    
    
    <a href="products.php?cat_id={$PRODUCT_ARRAY["CATEGORY_ID"]}">{$PRODUCT_ARRAY["CATEGORY"]}</a><br>
    
    DESCRIPTION: {$PRODUCT_ARRAY["DESCRIPTION"]}<br>
    PRICE:  {$PRODUCT_ARRAY["PRICE"]} {$PRODUCT_ARRAY["CURRENCY"]}<br>
    STOCK:  {$PRODUCT_ARRAY["STOCK"]} in stock<br>
     <a href="cart.php?gact=add&gfield=ID&gfield_value={$PRODUCT_ARRAY["ID"]}" class="btn btn-primary">adauga in cos</a>
    <ul>
    
        <li><img src="{$PRODUCT_IMAGES[0]}" width="100"></li>
    
    </ul>

    <div id="demo" class="carousel slide" data-ride="carousel">

  
  <ul class="carousel-indicators">
    {foreach from=$PRODUCT_IMAGES key=k item=img name=imgs}
        <li><li data-target="#demo" data-slide-to="{$smarty.foreach.imgs.index}" {if $smarty.foreach.imgs.index == 0}class="active"{/if}></li></li>
    {/foreach}  
  </ul>

  
  <div class="carousel-inner">
      {foreach from=$PRODUCT_IMAGES key=k item=img name=imgs}
            <div class="carousel-item {if $smarty.foreach.imgs.index == 0}active{/if}">
            <img src="{$img}" width="300" height="200" alt="Los Angeles">
            </div>
      {/foreach}
  </div>

  
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>

</div>
   -->
 <hr>   
{$SCRIPT_CONTENT}{/block}

