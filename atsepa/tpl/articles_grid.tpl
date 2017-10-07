        <ul class="pagination">
                {if $pages > 1 }{section name=pgs loop=$pgs_hrefs} <li> {$pgs_hrefs[pgs]} </li>{/section}{/if}
        </ul>

        {section name=vls loop=$values}
        <div class="panel panel-default well">
            <div class="panel-headin">
            <h5>{$values_fields[vls]["CATEG_NAME"]}</h5>
            <h1>{$values_fields[vls]["NAME"]}</h1></b>
            </div>
            
            <div class="panel-body">
            {if $values_fields[vls]["IMAGE"] != "" }    
            <img src="{$values_fields[vls]["IMAGE"]}" height="200" >
            {/if}     
            </div>
            
            <div class="panel-footer">
                    <p>{htmlspecialchars_decode(stripslashes($values_labels[vls]["Content"]))}...<br>
                    <a href="article.php?ID={$values_labels[vls]["ID"]}"> <b>citeste</b></a> </p>
                <i>{$values_fields[vls]["ARTICLE_DATE"]}:{$values_fields[vls]["FIRST_NAME"]} {$values_fields[vls]["LAST_NAME"]} ( {$values_fields[vls]["USERNAME"]} )</i>
            </div>
        </div>
        {/section}
        
           <ul class="pagination">
                {if $pages > 1 }{section name=pgs loop=$pgs_hrefs} <li> {$pgs_hrefs[pgs]} </li>{/section}{/if}
           </ul>
    
