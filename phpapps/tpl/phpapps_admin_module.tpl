{extends file=$display_obj->layout_file}
{block name=content}
{literal}    
		<script>
			// Wait until the DOM has loaded before querying the document
			$(document).ready(function(){
				$('ul.tabs').each(function(){
                                        var $dataStore = window.sessionStorage;
                                         
					// For each set of tabs, we want to keep track of
					// which tab is active and its associated content
					var $active, $content, $links = $(this).find('a');

					// If the location.hash matches one of the links, use that as the active tab.
					// If no match is found, use the first link as the initial active tab.
                                        //$active = JSON.parse($dataStore.getItem("active_tab"));
                                        
                                        
                                        $active = $($links.filter('[href="'+location.hash+'"]')[0] || $links[0]);
                                        $active.addClass('active');
                                        
					$content = $($active[0].hash);

					// Hide the remaining content
					$links.not($active).each(function () {
						$(this.hash).hide();
					});

					// Bind the click event handler
					$(this).on('click', 'a', function(e){
						// Make the old tab inactive.
						$active.removeClass('active');
						$content.hide();

						// Update the variables with the new link and content
						$active = $(this);
						$content = $(this.hash);

						// Make the tab active.
						$active.addClass('active');
						$content.show();
                                                
                                                $dataStore.setItem("active_tab",JSON.stringify($active));
						// Prevent the anchor's default click action
						e.preventDefault();
					});
				});
			});
		</script>
{/literal}
	<div class="test_div">
	<font style="font-size: 120%;"><a href="phpapps_admin_applications.php">{$module->APP_TITLE}</a> / {$module->MODULE_TITLE} </h1></font><br>
	( <a href="phpapps_admin_modules_form_imp.php?gact=editRec&gfield=ID&gfield_value={$module->ID}">{$module->MODULE_NAME}</a> / {$module->MODULE_DATE} ) 
        </div>
        
        <div class='test_div' id="tabs">
	<ul class='tabs'>
	<li><a href="#tabs-1">Tables</a></li>
	<li><a href="#tabs-2">Lists</a></li>
	<li><a href="#tabs-3">Forms</a></li>
	<li><a href="#tabs-4">Scripts</a></li>
	</ul>
	
	<div id="tabs-1" class="adm_mod_div">{$tables_grid}</div>
	<div id="tabs-2" class="adm_mod_div">{$lists_grid}</div>
	<div id="tabs-3" class="adm_mod_div">{$forms_grid}</div>
	<div id="tabs-4" class="adm_mod_div">{$scripts_grid}</div>
        </div>
        
       
        
</div>
        
{/block}