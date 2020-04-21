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

<nav class="navbar navbar-expand-lg bg-dark navbar-dark">
{* run the array through the function *}
<a class="navbar-brand" href="phpapps_admin_applications.php">{$menu_obj->title}</a>
 <ul class="navbar-nav level{$level} ">
{menu data=$menu_obj->menu_items}
 </ul>
</nav>
