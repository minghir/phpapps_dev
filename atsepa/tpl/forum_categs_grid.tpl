<ul class="list-group">    
   {section name=vls loop=$values}
       <!-- {$values_fields[vls]["PARENT_NAME"]} |  {$values_fields[vls.index_prev]["PARENT_NAME"]} | {$smarty.section.vls.index_prev} -->
       {if $values_fields[vls]["PARENT_NAME"] != $values_fields[vls.index_prev]["PARENT_NAME"]}
            <li class="list-group-item active">
                {$values_fields[vls]["PARENT_NAME"]} 
            </li>
       {/if}
           
               <li class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="forum_topics.php?categ_id={$values_fields[vls]["ID"]}">{$values_fields[vls]["NAME"]}</a>
                    ( {$values_fields[vls]["NO_TOPICS"]} topics | {$values_fields[vls]["NO_POSTS"]} postari )</li>
    {/section}
   </ul>