


<div class="navbar-nav mr-auto">


<form name="search_products" method="POST" action="products_search.php">
     
      <input class="form-control mr-sm-2" type="search" placeholder="Cauta" aria-label="Search" name="eshop_search" value="{$eshop_search}">
      <input class="btn btn-outline-success my-2 my-sm-0" type="submit" name="act" value="Cauta">

</form>
      <li> <a href="client_login.php" class="nav-link my-2 my-sm-0" type="button"><small class="text-secondary">Login</small></a> </li>
      <li> <a href="client_logout.php" class="nav-link my-2 my-sm-0" type="button"><small class="text-secondary">Logout</small></a> </li>
       <li> <a href="cart.php" class="nav-link my-2 my-sm-0" type="button"><small class="text-secondary">Cos ({$no_prods_in_cart})</small></a> </li>

 </div>

