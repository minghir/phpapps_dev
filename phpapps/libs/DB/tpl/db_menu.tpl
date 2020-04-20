
{function name=menu level=0}
  <ul class="level{$level}">
  {foreach $data as $entry}
    {if is_array($entry->menu_items)}
        <li ><a href="{$entry->ACTION}" class="list-group-item list-group-item-action">{$entry->LABEL}</a></li>
      {menu data=$entry->menu_items level=$level+1}
    {else}
      <li>{$entry}</li>
    {/if}
  {/foreach}
  </ul>
{/function}

<div class="list-group {if $menu_obj->orientation == "HORIZONTAL"}list-group-horizontal{/if}">
{* run the array through the function *}
{menu data=$menu_obj->menu_items}
</div> 
