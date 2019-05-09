{extends file=$display_obj->layout}
{block name=body}{$SCRIPT_CONTENT}

<a href="phpapps_admin_applications_form_imp.php?gact=editRec&gfield=ID&gfield_value=1" class="dmos_sajax">comment #1</a><br>


    <iframe id="thedialog" style="display:none;" width="390"></iframe>

<button id="dmo_iframe" class="btn floatr" >Demo</button>

<script type="text/javascript">
$('#dmo_iframe').click(function(){
	var p = new Popelt({
		contentType: 'iframe',
		loadUrl: "//www.youtube.com/embed/tRVC4BKWaP8",
		iframeWidth: '100%',
	    iframeHeight: '300px'
	});
	p.addCloseButton();
	p.show();
});
</script>



<div class="demo-block">
<h3>AJAX Content</h3>
<button id="dmo_ajax" class="btn floatr" />Demo</button>
Retrieving AJAX content.<br />
Also, the <strong>focus</strong> attribute focuses on the first input element inside content.
</div>
<script type="text/javascript">
$('#dmo_ajax').click(function(){
	var p = new Popelt({
		contentType: 'ajax',
		loadUrl: 'phpapps_admin_applications_form_imp.php?gact=editRec&gfield=ID&gfield_value=1',
		focus: true
	});
	//p.addCloseButton();
	p.show();
});
</script>


{/block}