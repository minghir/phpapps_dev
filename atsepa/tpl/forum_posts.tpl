{extends file=$display_obj->layout}
{block name=body}
<div class="navbar navbar-inverse"> 
        <ul class="nav navbar-nav">
            <li><a href="forum_categs.php">Categorii &gt; </a> </li>
            <li><a href="forum_topics.php?categ_id={$categ_id}">{$categ_name} &gt;</a> </li>
        </ul>
        <p class="navbar-text">{$topic_name}</p>
    </div>

{section name=posts loop=$posts_ids}

    <div class="panel panel-default">
        <div class="panel-heading">
            <img src ="user_data/avatar_default.png" class="img-circle" width="20">
        #{$smarty.section.posts.index + 1} {$posts_date[posts]}: {$posts_users[posts]}
        </div>
        <div class="panel-body">
            {$posts_contents[posts]}
        </div>
        
    </div>

{/section}    

{/block}