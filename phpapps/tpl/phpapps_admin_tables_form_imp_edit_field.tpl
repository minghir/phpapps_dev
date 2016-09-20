<tr><td align="right" colspan="2">
<div id="itemRows">
<form>
{if count($nr_cols) == 0}
<div class="extraPersonTemplate" id="clone_0">
    <div  class="controls controls-row" >
				<input id="nr_col_0" type="hidden" name="nr_cols[]" value="0">
				name: <input id="col_name_0" type="text" size="4" value="ID" name="col_names[]">	
				type: {$select_column_types_0}
				size: <input id="col_size_0" name="col_sizes[]" type="text" size="2" value="20">
				default value: <input id="col_default_0" type="text" name="col_defaults[]" size="6" value="">
				fk: {$select_column_fks_0}
				index: {$select_column_indexes_0}
				<input id="button_rmv_0" type="button" name="but_rmv" onClick="rmvClone(this)" value="X" disabled>
    </div>
</div>
<div id="container"></div>
</div>
{else}
<div id="container">
{section name=cls loop=$nr_cols}
	<div  class="controls controls-row" id="clone_{$nr_cols[cls]}">
				<input id="nr_col_{$nr_cols[cls]}" type="hidden" name="nr_cols[]" value="{$nr_cols[cls]}">
				name: <input id="col_name_{$nr_cols[cls]}" type="text" size="4" value="{$col_names[cls]}" name="col_names[]"  >
				type: {$select_column_types[cls]}
				size: <input id="col_size_{$nr_cols[cls]}" name="col_sizes[]" type="text" size="2" value="{$col_sizes[cls]}">
				default value: <input id="col_default_0" type="text" name="col_defaults[]" size="6" value="{$col_defaults[cls]}" >
				fk: {$select_column_fks[cls]}
				index: {$select_column_indexes[cls]}
				<input id="button_rmv_{$nr_cols[cls]}" type="button" name="but_rmv" onClick="rmvClone(this)" value="X" {if $nr_cols[cls] == 0 }disabled{/if} >
				
    </div>
{/section}
</div>
{/if}
<input id="addRow" onClick="addClone()" type="button" value="Add column" />
</div>
</form>
</div>			

</td></tr>
	
{literal}	
<script type="text/javascript">

	function rmvClone(buton){
		 var id = $(buton).attr('id');
		 id = id.substr(id.lastIndexOf("_")+1, id.length);
		 $('#clone_'+id).slideUp('slow', function() { $(this).remove(); });
	}

	function addClone(){
        $('<div/>', {
				'id' : 'clone_' + ( $('.extraPerson').length + 1  ),
			   'class' : 'extraPerson', html: GetHtml()
		}).hide().appendTo('#container').slideDown('slow');
	}

	function GetHtml(){
		var len = $('.extraPerson').length + 1;
	   // var $html = $('.extraPersonTemplate').clone();
		var $html = $('#clone_0').clone();
		
		$html.find('#nr_col_0').prop('disabled', false );
		$html.find('#nr_col_0').attr( 'value', len );
		$html.find('#nr_col_0').attr('id', 'nr_col_' + len);
		
		$html.find('#col_name_0').prop('disabled', false );
		$html.find('#col_name_0').attr( 'value', '' );
		$html.find('#col_name_0').attr( 'placeholder', 'col name' );
		$html.find('#col_name_0').attr('id', 'col_name_' + len);
		
		$html.find('#col_type_0').prop( 'disabled', false );
		$html.find('#col_type_0').attr('id', 'col_type_' + len);
		
		$html.find('#col_size_0').prop('disabled', false );
		$html.find('#col_size_0').attr( 'value', '' );
		$html.find('#col_size_0').attr( 'placeholder', 'col size' );
		$html.find('#col_size_0').attr('id', 'col_size_' + len);
		
		$html.find('#col_default_0').prop('disabled', false );
		$html.find('#col_default_0').attr( 'value', '' );
		$html.find('#col_default_0').attr( 'placeholder', 'default value' );
		$html.find('#col_default_0').attr('id', 'col_default_' + len);
		
		$html.find('#col_idx_0').prop( 'disabled', false );
		//$html.find('#col_idx_0 option')[3].selected = true;//.prop('selected', true);
		//$('#selectBox option').eq(3).prop('selected', true);
		$html.find('#col_idx_0').attr('id', 'col_idx_' + len);
		
		
		$html.find('#col_fks_0').prop( 'disabled', false );
		$html.find('#col_fks_0').attr('id', 'col_fks_' + len);
		
		$html.find('#button_rmv_0').prop( 'disabled', false );
		$html.find('#button_rmv_0').attr('id', 'button_rmv_' + len);

		return $html.html();    
	}
 
</script>
{/literal}