 <ul class="pagination">
    {if $pages > 1 }{section name=pgs loop=$pgs_hrefs} <li> {$pgs_hrefs[pgs]} </li>{/section}{/if}
 </ul>
{section name=vls loop=$values}
    <div class="panel panel-default">
        <div class="panel-heading">
            <img src ="user_data/avatar_default.png" class="img-circle" width="20">
        {$values_fields[vls]["POST_DATE"]}: {$values_fields[vls]["USERNAME"]}
        </div>
        <div class="panel-body">
            {$values_fields[vls]["CONTENT"]}
        </div>
    </div>
{/section}    
<ul class="pagination">
    {if $pages > 1 }{section name=pgs loop=$pgs_hrefs} <li> {$pgs_hrefs[pgs]} </li>{/section}{/if}
</ul>   