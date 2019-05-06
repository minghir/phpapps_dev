{extends file=$display_obj->layout}

{block name=body}{$SCRIPT_CONTENT}


<button id="demo5" class="btn btn-primary" >iFrame content</button>
<button id="demo4" class="btn btn-primary">Ajax content</button>

<script>

$('#demo4').click(function(){
	var p = new Popelt({
		contentType: 'ajax',
		loadUrl: 'http://localhost/phpapps_dev/phpapps/phpapps_admin_applications_form_imp.php?gact=editRec&gfield=ID&gfield_value=1',
		focus: true
	});
	//p.addCloseButton();
	p.show();
});
$('#demo5').click(function(){
	var p = new Popelt({
		contentType: 'iframe',
		loadUrl: 'http://localhost/phpapps_dev/phpapps/phpapps_admin_applications_form_imp.php?gact=editRec&gfield=ID&gfield_value=1',
		iframeWidth: '100%',
	    iframeHeight: '300px'
	});
	//p.addCloseButton();
	p.show();
});

</script>





{/block}