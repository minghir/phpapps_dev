{extends file=$display_obj->layout_file}
{block name=content}
    <div class="container-fluid">	
<h2>{$module->APP_NAME}: {$module->MODULE_TITLE} </h2>
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href='#tab1'>Layouts</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab2'>Menus</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab3'>Grids</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab4'>Custom Elements</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab5'>Custom Forms</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab6'>Templates</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab7'>Themes</a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab8'><small>Tables</small></a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab9'><small>Lists</small></a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab10'><small>Forms</small></a></li>
        <li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab11'><small>Scripts</small></a></li>
    </ul>
	
        <div class="tab-content container-fluid">    
            <div id="tab1" class="container-fluid tab-pane active"><p>{$layouts_grid}</p></div>
            <div id="tab2" class="container-fluid tab-pane fade"><p>{$menus_grid}</p></div>
            <div id="tab3" class="container-fluid tab-pane fade"><p>{$grids_grid}</p></div>
            <div id="tab4" class="container-fluid tab-pane fade"><p>{$custom_elements_grid}</p></div>
            <div id="tab5" class="container-fluid tab-pane fade"><p>{$custom_forms_grid}</p></div>
            <div id="tab6" class="container-fluid tab-pane fade"><p>{$templates_grid}</p></div>
            <div id="tab7" class="container-fluid tab-pane fade"><p>{$themes_grid}</p></div>
            <div id="tab8" class="container-fluid tab-pane fade"><p>{$tables_grid}</p></div>
            <div id="tab9" class="container-fluid tab-pane fade"><p>{$lists_grid}</p></div>
            <div id="tab10" class="container-fluid tab-pane fade"><p>{$forms_grid}</p></div>
            <div id="tab11" class="container-fluid tab-pane fade"><p>{$scripts_grid}</p></div>
        </div>
</div>
{/block}