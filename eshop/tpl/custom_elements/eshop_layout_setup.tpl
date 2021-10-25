
    
    
    <form name="search_products" method="POST" action="products_search.php" class="form-inline my-2 my-lg-0">
        <div class="input-group">
    <input type="text" class="form-control" placeholder="Cauta" name="eshop_search" value="{$eshop_search}">
    <button class="btn btn-primary" type="submit">
        <i class="fas fa-search"></i>
      </button>
    </div>
    </form>  
    
  

    <div class="input-group">
        
       <a href="cart.php" class="nav-link" type="button"><small class="text-secondary text-dark">Cos ({$no_prods_in_cart})</small></a> 
      {if $CLIENT_ID != "" }
           <a href="eshop_client_address.php" class="nav-link" type="button" ><small class="text-secondary text-dark">Datele mele</small></a>
           <a href="client_logout.php" class="nav-link " type="button"><small class="text-secondary text-dark">Iesire</small></a> 
      {else}
       <a href="client_login.php" class="nav-link " type="button"><small class="text-secondary text-dark">Contul meu</small></a> 
      {/if}    
      
      </div>   
      



