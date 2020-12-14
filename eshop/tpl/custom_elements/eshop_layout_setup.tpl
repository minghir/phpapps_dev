
<div class="container">
<form name="search_products" method="POST" action="products_search.php">
<div class="form-group row">
    
  
    <div class="input-group input-group-sm mb-3">
    <input type="text" class="form-control" placeholder="Cauta" name="eshop_search" value="{$eshop_search}">
    <div class="input-group-btn">
      <button class="btn btn-default" type="submit">
        <i class="fas fa-search"></i>
      </button>
    </div>
  </div>
    

<!--     <div class="col-xs-2">
      <input class="form-control input-sm" type="text" aria-describedby="inputGroup-sizing-sm" placeholder="Cauta" aria-label="Search" name="eshop_search" value="{$eshop_search}">
     </div> 
     <div class="col-xs-3">
      <input class="btn btn-outline-success form-control" type="submit" name="act" value="Cauta">
     </div
-->

    <div class="input-group input-group-sm mb-3">
        
       <a href="cart.php" class="nav-link my-2 my-sm-0" type="button"><small class="text-secondary">Cos ({$no_prods_in_cart})</small></a> 
      {if $CLIENT_ID != "" }
           <a href="eshop_client_address.php" class="nav-link my-2 my-sm-0" type="button"><small class="text-secondary">Contul meu</small></a>
           <a href="client_logout.php" class="nav-link my-2 my-sm-0" type="button"><small class="text-secondary">Iesire</small></a> 
      {else}
       <a href="client_login.php" class="nav-link my-2 my-sm-0" type="button"><small class="text-secondary">Logare</small></a> 
       <a href="signup.php" class="nav-link my-2 my-sm-0" type="button"><small class="text-secondary">Creaza cont</small></a> 
      {/if}    
        
      </div>   

    </div>
</form>      
</div>

