{function name=menu level=0}
  {foreach $data as $entry}
    {if is_array($menu_obj->menu_items) }
        {if $level == 0}
        <li class="nav-item dropdown">
            {if $entry->LABEL == "CONTACT"}
                <a class="nav-link" href="{$entry->ACTION}">{$entry->LABEL}</a>
            {else}    
                <a href="{$entry->ACTION}" class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">{$entry->LABEL}</a>
            {/if}
        <div class="dropdown-menu">
        {else}
            <a class="dropdown-item" href="{$entry->ACTION}">{$entry->LABEL}</a>
        {/if}
      {menu data=$entry->menu_items level=$level+1}
       {if $level == 0}
            </div>
            </li>
        {/if}
    {else}
      <li>{$entry}</li>
    {/if}
  {/foreach}
{/function}

<nav class="navbar navbar-expand-lg fixed-top bg-dark navbar-dark">
<a class="navbar-brand" href="home.php"><h1>{$menu_obj->title}</h1></a>
<div class="collapse navbar-collapse" id="navbardrop">
<ul class="navbar-nav mr-auto level{$level} ">
    {menu data=$menu_obj->menu_items}<br>
</ul>
<form name="search_products" method="POST" action="products_search.php">
<ul class="navbar-nav mr-auto level{$level}">
     <input class="nav-link my-2 my-sm-0" type="search" name="eshop_search"><input class="my-2 my-sm-0" type="submit" value="cauta">
</ul>
</form>
 <a href="client_logout.php" class="nav-link my-2 my-sm-0" type="button"><small class="text-secondary">Logout</small></a> 
</div>
</nav>