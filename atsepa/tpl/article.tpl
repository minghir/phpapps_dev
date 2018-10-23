{extends file=$display_obj->layout}
{block name=body}

  <div class="panel panel-default well">
            <div class="panel-headin">
            <h1>{$NAME}</h1></b>
            </div>
            
            <div class="panel-body">
            {if $IMAGE != "" }    
            <img src="{$IMAGE}" height="200" >
            {/if}     
            </div>
     
            <div class="panel-footer">
                    <p align="justify">{htmlspecialchars_decode(stripslashes($BODY))}<br> <br><br>
                <i>{$ARTICLE_DATE}:{$FIRST_NAME} {$LAST_NAME} ( {$USERNAME} )</i>
            </div>
        </div>

{/block}
