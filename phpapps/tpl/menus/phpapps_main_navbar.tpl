{function name=menu level=0}
  {foreach $data as $entry}
    {if is_array($entry->menu_items)}
        {if $level == 0}
        <li class="nav-item dropdown">
            <a href="{$entry->ACTION}" class="nav-link dropdown-toggle" id="navbardrop" data-toggle="dropdown">{$entry->LABEL}</a>
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
<a class="navbar-brand" href="phpapps_admin_applications.php"><h1>{$menu_obj->title}</h1></a>
<div class="collapse navbar-collapse" id="navbardrop">
<ul class="navbar-nav mr-auto level{$level} ">
{menu data=$menu_obj->menu_items}
</ul>
<a href="logout.php" class="nav-link my-2 my-sm-0" type="button"><small class="text-secondary">Logout</small></a>
</div>
</nav>