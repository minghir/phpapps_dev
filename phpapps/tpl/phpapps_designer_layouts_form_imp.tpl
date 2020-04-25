{extends file=$display_obj->layout}
{block name=content}<br><br>
<div class="container">	
    <h1>Layout: {$display_obj->NAME}</h1>   
 <ul class="nav nav-tabs" role="tablist">
    <li class="nav-item"><a class="nav-link active" data-toggle="tab" href='#tab1'>Details</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab2'>Elements</a></li>
	<li class="nav-item"><a class="nav-link" data-toggle="tab" href='#tab3'>Source code</a></li>
</ul>
	   <div class="tab-content container-fluid">    
            <div id="tab1" class="container-fluid tab-pane active"><p>{include file="gen_tpl/phpapps_designer_layouts_form.tpl" }</p></div>
            <div id="tab2" class="container-fluid tab-pane fade"><p>{$display_object_elements_grid}</p></div>
            <div id="tab3" class="container-fluid tab-pane fade"><p>{$LAYOUT_TEMPLATE_EDITOR}</p></div>
        </div>
</div>
{/block}