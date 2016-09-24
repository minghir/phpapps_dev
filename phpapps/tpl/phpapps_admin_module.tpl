<html>
<head>
{include file="commun_header.tpl" }
{literal}
<style>
			* {padding:0; margin:0;}

			html {
				background:url(/img/tiles/wood.png) 0 0 repeat;
				padding:15px 15px 0;
				font-family:sans-serif;
				font-size:14px;
			}

			p, h3 { 
				margin-bottom:15px;
			}

			.tabs li {
				list-style:none;
				display:inline;
			}

			.tabs a {
				padding:5px 10px;
				display:inline-block;
				background:#666;
				color:#fff;
				text-decoration:none;
			}

			.tabs a.active {
				background:#fff;
				color:#000;
			}

		</style>
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
</head>
<body><br>
	
	
	
	<div class="test_div">
	<font style="font-size: 120%;"><a href="phpapps_admin_applications.php">{$module->APP_TITLE}</a> / {$module->MODULE_TITLE} </h1></font><br>
	( <a href="phpapps_admin_modules_form_imp.php?gact=editRec&gfield=ID&gfield_value={$module->ID}">{$module->MODULE_NAME}</a> / {$module->MODULE_DATE} ) 
	</div><br>
	<ul class='tabs'>
	<li><a href='#tab1'>Tables</a></li>
	<li><a href='#tab2'>Lists</a></li>
	<li><a href='#tab3'>Forms</a></li>
	<li><a href='#tab4'>Scripts</a></li>
	</ul>
	
	<div id="tab1" class="adm_mod_div"  >{$tables_grid}</div>
	<br>
	<div id="tab2" class="test_div"  style="width: 90%;">{$lists_grid}</div>
	<br>
	<div id="tab3" class="test_div"  style="width: 90%;">{$forms_grid}</div>
	<br>
	<div id="tab4" class="test_div"  style="width: 90%;">{$scripts_grid}</div>
	

</body>
</html>