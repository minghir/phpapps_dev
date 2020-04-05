{extends file=$display_obj->layout}
{block name=content}
{literal}
                <script>
			// Wait until the DOM has loaded before querying the document
			$(document).ready(function(){
				$('ul.tabs').each(function(){
					// For each set of tabs, we want to keep track of
					// which tab is active and its associated content
					var $active, $content, $links = $(this).find('a');

					// If the location.hash matches one of the links, use that as the active tab.
					// If no match is found, use the first link as the initial active tab.
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
	</div><br>
<div class="test_div">
	<ul class='tabs'>
        <li><a href='#tab1'>Layouts</a></li>
	<li><a href='#tab2'>Themes</a></li>
	<li><a href='#tab3'>Menus</a></li>
	</ul>
	
	<div id="tab1" class="adm_mod_div">{$layouts_grid}</div>
        <div id="tab2" class="adm_mod_div">aa</div>
	<div id="tab3" class="adm_mod_div">aa</div>
        </div>

{/block}