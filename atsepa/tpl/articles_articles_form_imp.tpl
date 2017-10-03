<html>
<head>
{include file="commun_header.tpl" }
{literal}
	  <script type="text/javascript" src="http://localhost:89/phpapps_dev/phpapps/3rd_party/JS/ckeditor/ckeditor.js"></script>
{/literal}
</head>
<body>
{include file="gen_tpl/articles_articles_form.tpl" }
<script type="text/javascript" >
                // Replace the <textarea id="editor1"> with a CKEditor
                // instance, using default configuration.
                CKEDITOR.replace( 'BODY' );
				
</script>	
</body>
</html>