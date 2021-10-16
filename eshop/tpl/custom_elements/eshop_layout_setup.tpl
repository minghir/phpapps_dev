<form name="search_products" method="POST" action="products_search.php">
<div class="form-group row">
    <div class="input-group">
    <input type="text" class="form-control" placeholder="Cauta" name="eshop_search" value="{$eshop_search}">
    <div class="input-group-btn">
      <button class="btn btn-default" type="submit">
        <i class="fas fa-search"></i>
      </button>
    </div>
  </div>

    <div class="input-group">
        
       <a href="cart.php" class="nav-link" type="button"><small class="text-secondary">Cos ({$no_prods_in_cart})</small></a> 
      {if $CLIENT_ID != "" }
           <a href="eshop_client_address.php" class="nav-link" type="button" ><small class="text-secondary">Datele mele</small></a>
           <a href="client_logout.php" class="nav-link " type="button"><small class="text-secondary">Iesire</small></a> 
      {else}
       <a href="client_login.php" class="nav-link " type="button"><small class="text-secondary">Logare</small></a> 
      {/if}    
      </div>   
</div>
</form>  

