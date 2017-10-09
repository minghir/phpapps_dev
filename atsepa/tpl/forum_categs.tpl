{extends file=$display_obj->layout}
{block name=body}

    <div class="navbar navbar-inverse"> 
            <p class="navbar-text">Categorii</p>
    </div>
   {section name=categs loop=$categ_ids}
       <ul class="list-group"> 
            <li class="list-group-item active">{$categ_names[categs]}</li>
      
           {section name=scategs loop=$categ_subcategs_ids[categs]}
               <li class="list-group-item">&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="forum_topics.php?categ_id={$categ_subcategs_ids[categs][scategs]}">{$categ_subcategs_names[categs][scategs]}</a>
                    ( {$categ_subcategs_no_topics[categs][scategs]} topics | {$categ_subcategs_no_posts[categs][scategs]} postari )</li>
            {/section}
       </ul>    
    {/section}
{/block}
