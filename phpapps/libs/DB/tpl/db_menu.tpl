<div class="vertical-menu">
    <h1>{$name}</h1>
    {foreach from=$rows item=app}
        <a href="#" class="main">{$app.APP_TITLE}</a>
		{foreach from=$modules[$app.ID] item=mod}
			<a href="{$mod.SCRIPT_PATH}.php?module_id={$mod.ID}" title="{$mod.DESCRIPTION}" {if $mod.ID == 1 }class="active"{/if} >{$mod.MODULE_TITLE}</a>
		{/foreach}
    {/foreach}
</div>
