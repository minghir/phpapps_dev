{function name=menu level=0}
  {foreach $data as $entry}
    {if is_array($entry->menu_items)}
        {if $level == 0}
        <li>
            <a href="{$entry->ACTION}" class="nav-link" id="navbardrop" >{$entry->LABEL}</a>
        <div >
        {else}
            <a  href="{$entry->ACTION}">{$entry->LABEL}</a>
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

    <input class="navbar-brand" type="search" >

<!-- <a href="logout.php" class="nav-link my-2 my-sm-0" type="button"><small class="text-secondary">Logout</small></a> -->
</div>
</nav>