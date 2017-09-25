  
        {section name=vls loop=$values}
           
           
           
            <b><h1>aa {$values_fields[vls]["NAME"]}</h1></b>
            <font color="red"> {$values_labels[vls]["Content"]}</font>
           
            <!-- <b><h1>{$vals[vls][0]}</h1></b><br> -->
            <p>{$vals[vls][1]}</p>
           <hr>
           
           {/section}
{if $paginable == 1 }({if $mode_search == true }<font color="blue"><b>Found:</b>{/if}{$num_rows} recs/{$pages} pgs</font>){/if}&nbsp;
{if $pages > 1 }{section name=pgs loop=$pgs_hrefs} {$pgs_hrefs[pgs]} {/section}{/if}
