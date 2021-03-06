{extends file=$display_obj->layout_file}
{block name=content}
<div class="container-fluid">	
<h2>{$module->APP_NAME}:  {$module->MODULE_TITLE}</h2>
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href='#tab1'>Tables</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab2'>Lists</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab3'>Forms</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab4'>Scripts</a></li>
    </ul>
	
        <div class="tab-content container-fluid">    
            <div id="tab1" class="container-fluid tab-pane active"><p>{$tables_grid}</p></div>
            <div id="tab2" class="container-fluid tab-pane fade"><p>{$lists_grid}</p></div>
            <div id="tab3" class="container-fluid tab-pane fade"><p>{$forms_grid}</p></div>
            <div id="tab4" class="container-fluid tab-pane fade"><p>{$scripts_grid}</p></div>
        </div>
</div>
{/block}
