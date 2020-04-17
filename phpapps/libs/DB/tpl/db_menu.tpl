
   

<div class="list-group {if $menu_obj->orientation == "HORIZONTAL"}list-group-horizontal{/if}">
  {if $menu_obj->title != ""}{$menu_obj->title}{/if}
  {foreach $menu_obj->menu_items as $item}
  <a href="{$item->ACTION}" class="list-group-item list-group-item-action">{$item->LABEL}</a>
  {/foreach}
</div> 

