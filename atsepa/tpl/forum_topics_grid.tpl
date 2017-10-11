
    {section name=vls loop=$values}
        {if $values_fields[vls]["NO_POSTS"] == 0}
            <li class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;{$values_fields[vls]["SUBJECT"]} ({$values_fields[vls]["NO_POSTS"]} postari)</li>
         {else}   
        <li class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;<a href="forum_posts.php?topic_id={$values_fields[vls]["ID"]}">{$values_fields[vls]["SUBJECT"]}</a> ({$values_fields[vls]["NO_POSTS"]} postari)</li>
        {/if}
    {/section}
    