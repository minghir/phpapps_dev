<br>    
        {section name=vls loop=$values}
        <div class="panel panel-default well">
            <div class="panel-headin"><h1>{$values_fields[vls]["NAME"]}</h1></b></div>
            {if $values_fields[vls]["IMAGE"] != "" }
            <div class="panel-body">
            <img src="{$values_fields[vls]["IMAGE"]}" height="200" >
            </div>
            {/if}
            <div class="panel-footer">
            <p>{htmlspecialchars_decode($values_labels[vls]["Content"])}</p>
            </div>
        </div>
           {/section}
{if $paginable == 1 }({if $mode_search == true }<font color="blue"><b>Found:</b>{/if}{$num_rows} recs/{$pages} pgs</font>){/if}&nbsp;
{if $pages > 1 }{section name=pgs loop=$pgs_hrefs} {$pgs_hrefs[pgs]} {/section}{/if}
