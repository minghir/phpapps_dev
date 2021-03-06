<html>
<head>
{include file="commun_header.tpl" }
</head>

   <meta charset="utf-8"/>
<link rel=stylesheet href="{$smarty.const.CODEMIRROR_DIR}/doc/docs.css">
<link rel="stylesheet" href="{$smarty.const.CODEMIRROR_DIR}/lib/codemirror.css">
<script src="{$smarty.const.CODEMIRROR_DIR}/lib/codemirror.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/addon/edit/matchbrackets.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/htmlmixed/htmlmixed.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/xml/xml.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/javascript/javascript.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/css/css.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/clike/clike.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/php/php.js"></script>
<script src="{$smarty.const.CODEMIRROR_DIR}/mode/sql/sql.js"></script>
{literal}
<style>
.CodeMirror {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
}
</style>



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
        ////////////////// code miror                   
        var mime = 'text/x-mariadb';
	
	// get mime type
	if (window.location.href.indexOf('mime=') > -1) {
		mime = window.location.href.substr(window.location.href.indexOf('mime=') + 5);
	}
	
	window.editor = CodeMirror.fromTextArea(document.getElementById('code'), {
		mode: mime,
		indentWithTabs: true,
                tabSize: 10,
		smartIndent: true,
		lineNumbers: true,
		matchBrackets : true,
		autofocus: true,
                readOnly: true,
	});
        //////////////////////////   gata code mirror                 
                            
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
<body onload="init();">
    <div>
{include file="gen_tpl/phpapps_database_tables_form.tpl" }
    </div>
<br>
        <ul class='tabs'>
	<li><a href='#tab1'>Columns</a></li>
	<li><a href='#tab2'>Foreign Keys</a></li>
	<li><a href='#tab3'>Indexes</a></li>
        <li><a href='#tab4'>Show Create Table</a></li>
        <li><a href='#tab5'>Options</a></li>
        
	</ul>
        
	<div id="tab1" class="adm_mod_div">{$table_details_grid}</div> 
        <div id="tab2" class="adm_mod_div">{$columns_fk_grid}</div>
        <div id="tab3" class="adm_mod_div">{$table_idx_grid}</div>
        <div id="tab4" ><textarea id="code" name="code">{$show_create_table}</textarea></div>
        <div id="tab5" >
            <h1><a href="phpapps_database_table_rescan_columns.php?gfield=ID&gfield_value={$table_id}">rescan columns</a> </h1>
        </div>
        


</body>
</html>