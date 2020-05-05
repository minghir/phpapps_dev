{extends file=$display_obj->layout_file}
{block name=content}
    <div>    
        <p><strong>{$display_obj->APP_LABEL}</strong> {$display_obj->APP_TITLE}</p>
        <p>{$SCRIPT_CONTENT}</p>
    </div>
{/block}
