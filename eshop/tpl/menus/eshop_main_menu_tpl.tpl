{function name=menu level=0}
  {foreach $data as $entry}
    {if is_array($menu_obj->menu_items) }
        {if $level == 0}
        <li class="nav-item dropdown">
            {if $entry->LABEL == "CONTACT"}
                <a class="nav-link text-dark" href="{$entry->ACTION}">{$entry->LABEL}</a>
            {else}    
                <a href="{$entry->ACTION}" class="nav-link dropdown-toggle text-dark" id="navbardrop" data-toggle="dropdown">{$entry->LABEL}</a>
            {/if}
        <div class="dropdown-menu">
        {else}
            {if $entry->LABEL == "DIVERSE"}
                <div class="dropdown-header">{$entry->LABEL}:</div>
            {else}
                <a class="dropdown-item d-flex" href="{$entry->ACTION}">{$entry->LABEL}</a>
            {/if}
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


<!-- <a class="navbar-brand" href="home.php"><h1>{$menu_obj->title}</h1></a>-->
<a class="navbar-brand" href="products.php"><img src="imgs/Diomax_logo_final_no_market_100.png" ></a>

<ul class="navbar-nav mr-auto level{$level} "> 
     {menu data=$menu_obj->menu_items} 
</ul>
