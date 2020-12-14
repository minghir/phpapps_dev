<div class="container">
<hr><form name="{$form_name}" id="{$form_name}" method="POST" enctype="multipart/form-data">
			<input type="hidden" name="pact" id="pact" value="{ldelim}$pact{rdelim}">
			<input type="hidden" name="gact" value="{ldelim}$gact{rdelim}">
			<input type="hidden" name="gfield" value="{ldelim}$gfield{rdelim}">
			<input type="hidden" name="gfield_value" value="{ldelim}$gfield_value{rdelim}">	
	{section name=fl loop=$fields}
                {if $input_types[fl] == "text" }
		<div class="form-group">
                    <label >
                        {$labels[fl]} :
                    </label>
                        <input class="form-control" type="text" id="{$fields[fl]}" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}">
                </div>
		{/if}
		{if $input_types[fl] ==  "checkbox" }
		<div class="form-group">
                    <label >
                        {$labels[fl]} :
                    </label>
                        <input class="form-control" type="checkbox" id="{$fields[fl]}" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}">
                </div>
                {/if}
		{if $input_types[fl] == "textarea" }
		<div class="form-group">
                    <label >
                        {$labels[fl]}  :
                    </label>
                        <textarea class="form-control" id="{$fields[fl]}" name="{$fields[fl]}">{literal}{${/literal}{$fields[fl]}}</textarea>
                </div>
                {/if}
		{if $input_types[fl] == "hidden" }
		<input id="{$fields[fl]}" type="hidden" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}">
                {/if}
		{if $input_types[fl] == "select" }
		<div class="form-group">
                    <label >
                        {$labels[fl]}  :
                    </label>
			<select class="form-control" id="{$fields[fl]}" name="{$fields[fl]}">
				<option value="{literal}{${/literal}{$fields[fl]}}">{literal}{${/literal}{$fields[fl]}}</option>
			</select>
                </div>
                {/if}
		{if $input_types[fl] == "mselect" }
		<div class="form-group">
                    <label >
                        {$labels[fl]}  :
                    </label>
			<select class="form-control" id="{$fields[fl]}" multiple="multiple" name="{$fields[fl]}[]">
				<option value="{literal}{${/literal}{$fields[fl]}}">{literal}{${/literal}{$fields[fl]}}</option>
			</select>
                </div>
                {/if}
		{if $input_types[fl] ==  "date" }
		<!-- <div class="form-group"><label >{$labels[fl]} :<td> <input type="text" class="tcal" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}"></div> -->
		<div class="form-group">
                    <label >
                        {$labels[fl]} :
                    </label>
                        <input class="form-control" id="{$fields[fl]}" type="date" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}">
                </div>
                {/if}
                {if $input_types[fl] ==  "password" }
		<!-- <div class="form-group"><label >{$labels[fl]} :<td> <input type="text" class="tcal" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}"></div> -->
		<div class="form-group">
                    <label >
                        {$labels[fl]} :
                    </label>
                        <input class="form-control" id="{$fields[fl]}" type="password" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}">
                </div>
                {/if}
		{if $input_types[fl] ==  "label_field" }
		<!-- <div class="form-group"><label >{$labels[fl]} :<td> <input type="text" class="tcal" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}"></div> -->
		<div class="form-group">
                    <label >
                        {$labels[fl]} :
                    </label>
                        {literal}{${/literal}{$fields[fl]}} <input id="{$fields[fl]}" type="hidden" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}">
                </div>
                {/if}
		{if $input_types[fl] == "select_list" }
		<div class="form-group">
                    <label >
                        {$labels[fl]}  :
                    </label>
			{ldelim}${$fields[fl]}_sel{rdelim}
                </div>
                {/if}
                {if $input_types[fl] == "select_list_multiple" }
		<div class="form-group">
                    <label >
                        {$labels[fl]}  :
                    </label>
			{ldelim}${$fields[fl]}_sel{rdelim}
                </div>
                {/if}
		{if $input_types[fl] == "select_table" }
		<div class="form-group">
                    <label >
                        {$labels[fl]}  :
                    </label>
			{ldelim}${$fields[fl]}_sel{rdelim}
                </div>
                {/if}
                {if $input_types[fl] == "select_table_multiple" }
		<div class="form-group">
                    <label >
                        {$labels[fl]}  :
                    </label>
			{ldelim}${$fields[fl]}_sel{rdelim}
                </div>
                {/if}
		{if $input_types[fl] == "file" }
		<div class="form-group">
                    <label >
                        {$labels[fl]} :
                    </label>
                        <input type="file" id="{$fields[fl]}" name="{$fields[fl]}" value="{literal}{${/literal}{$fields[fl]}}"><a href="{literal}{${/literal}{$fields[fl]}}">{literal}{${/literal}{$fields[fl]}}</a>
                </div>
		{/if}
        {/section}
	{ldelim}$FROM_IMP_CLASS{rdelim}
                <div class="form-group">
	{literal}{if $gact == "editRec"}
                       <button type="submit" class="btn btn-primary mb-2" name="pact" value="saveRec">save</button>
		{elseif $gact == "deleteRec"}
                        <button type="submit" class="btn btn-primary mb-2" name="pact" value="deleteRec">delete</button>
                {else}
                        <button type="submit" class="btn btn-primary mb-2" name="pact" value="addRec">add</button>
		{/if}
                        <button class="btn btn-primary mb-2 hBack" name="pact" value="back">back</button>
		{/literal}
                </div>
	</form>
        <hr>
</div>
<div class="container">
        {ldelim}$message_block{rdelim}
</div>
{literal}
    <script>
$(".hBack").on("click", function(e){
    if (window.opener && window.opener !== window) {
        window.close();
    }
    e.preventDefault();
    window.history.back();
});
</script>
{/literal}