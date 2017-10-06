<html>
<head>
        <meta charset="utf-8">
        <title>Simple - Gridmanager Development</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        
        <link href="{$smarty.const._3RDPARTY_WEB_DIR}bootstrap-3.3.7-dist/css/bootstrap.css" rel="stylesheet">
            
        <script src="{$smarty.const.JQUERY_FILE}"></script>
        <script src="{$smarty.const.JQUERY_UI}"></script>  

        <script src="{$smarty.const._3RDPARTY_WEB_DIR}bootstrap-3.3.7-dist/js/bootstrap.js"></script>
        <script src="{$smarty.const._3RDPARTY_WEB_DIR}jQuery-gridmanager-master/dist/js/jquery.gridmanager.js"></script>
        <link href="{$smarty.const._3RDPARTY_WEB_DIR}jQuery-gridmanager-master/dist/css/jquery.gridmanager.css" rel="stylesheet">  


  <title>{block name=title}Default Page Title{/block}</title>
</head>
<body>
<div id="mycanvas">
    <div class="row">
        <div class="col-md-6"><p>Content</p></div>
        <div class="col-md-6"><p>Content</p></div>
    </div>
</div>

<script>
    $(document).ready(function(){ 
        var gm = jQuery("#mycanvas").gridmanager().data('gridmanager');

        $(".myexternalcontrol").on("click", function(e){
            // Example use of internal gridmanager function:
            gm.appendHTMLSelectedCols('<p>my content to append to all my selected cols</p>');
        });
    });
</script> 
</body>
</html>