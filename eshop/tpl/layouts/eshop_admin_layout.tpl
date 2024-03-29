<!doctype html>
<html lang="en">
  <head>
     
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
      <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
      <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<!--
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  -->
  <!-- APP JavaScript -->
  <script src="{$smarty.const.CURRENT_APP_JS_DIR}remember_last_tab.js"></script>   
  <!-- <link rel="stylesheet" href="{$smarty.const.PHPAPPS_CSS_DIR}phpapps.css">-->
  <link rel="stylesheet" href="{$smarty.const.CURRENT_APP_CSS_DIR}{$display_obj->layout_theme}.css">
  
  <title>{$PAGE_TITLE}</title>
    </head>
    <body>
	 <header>	

	</header>	
	<main role="main" class="container-expand-lg">	
		
	<div>
            {block name=content}CONTENT BLOCK{/block}
	</div>
	</main>
	<footer class="footer">
      <div class="container">
		  {$CUSTOM_5}
       <!-- <span class="text-muted">Place sticky footer content here.{$PHPAPPS_LAYOUTS_BOOTSTRAP_LINKS}</span> -->
      </div>
    </footer>
		
    </body> 
</html>