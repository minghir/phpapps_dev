<html>
<head>
{include file="commun_header.tpl" }
{literal}
<script>
  $(function() {
    $( "input[type=submit], a, button" )
      .button()
      .click(function( event ) {
        event.preventDefault();
      });
  });
  </script>
  
  <script language ="javascript" type = "text/javascript" >
    function submitDetailsForm(op)
    {
		$("#act").val(op);
		$("#form_gen").submit();
    }
  </script>
<script type="text/javascript">
<!--

function check_all_hidden() {
	var checkboxes = new Array(); 
	checkboxes = document["form_gen"].getElementsByTagName('input');
    for (var i=0; i<checkboxes.length; i++)  {
		if (checkboxes[i].type == 'checkbox' && checkboxes[i].name == 'hiddens[]' )   {
			checkboxes[i].checked = true;
		}
	}
}
//-->
</script>
{/literal}
</head>
<body>
<form name="form_gen" method="POST" id="form_gen" enctype="multipart/form-data">

Form name:<b>{$deploy_location}</b><input type="text" name="form_name" id="form_name" value="{$form_name}" size=80><br>
<!-- Form dir:<input type="text" name="deploy_location" value="{$deploy_location}"> -->


<input type="hidden" name="pact" id="pact" value="form_gen">
<input type="hidden" name="act" id="act">

<input type="submit" value="save" onClick='submitDetailsForm("save")'> | 
<input type="submit" value="generate" onClick='submitDetailsForm("generate")'> | 
<input type="submit" value="preview" onClick='submitDetailsForm("preview")'>
<input type="hidden" name="form_id" value="{$form_id}">
<input type="hidden" name="module_id" value="{$module_id}">
<input type="hidden" name="form_table" value="{$form_table}">


<table border="1"><tr>
           <td>Field</td>
           <td>Type</td>
           <td><a href="#" onclick="check_all_hidden()">Hidde all</a></td>
           <td>Label</td>
		   <td>Mandatory</td>
           <td>Input type</td>
		   <td>Lists</td>
		   <td>Tables</td>
		   <td>Fields</td>
		   
      </tr>
      {section name=ds loop=$fields}
      <tr>
          <input type="hidden" name="fields[]" value="{$fields[ds]}">
		  <input type="hidden" name="fields_id[]" value="{$fields_id[ds]}">
		  <input type="hidden" name="data_types[]" value="{$data_types[ds]}">
           <td>{$fields_id[ds]}:{$fields[ds]}</td>
           <td>{$data_types[ds]}</td>
<!--           <td><input type="checkbox" name="{$fields[ds]}_hidden"></td> -->
			   {if is_array($hiddens) && in_array($fields[ds],$hiddens)}
               <td><input type="checkbox" name="hiddens[]" value="{$fields[ds]}" checked></td>
			   {else}
			   <td><input type="checkbox" name="hiddens[]" value="{$fields[ds]}"</td>
			   {/if}
<!--           <td><input type="text" name="{$fields[ds]}_label" value="{$fields[ds]}"></td> -->
           <td><input type="text" name="labels[]" value="{$labels[ds]}"></td>
			   {if is_array($mandatories) && in_array($fields[ds],$mandatories)}
               <td><input type="checkbox" name="mandatories[]" value="{$fields[ds]}" checked></td>
			   {else}
			   <td><input type="checkbox" name="mandatories[]" value="{$fields[ds]}"</td>
			   {/if}
           <td>
               <select name="input_types[]">
			   {if $input_types[ds] == "text" }
			   <option value="text" selected>text</option>
			   {else}
			   <option value="text" selected>text</option>
			   {/if}
			   {if $input_types[ds] == "checkbox" }
               <option value="checkbox" selected>checkbox</option>
			   {else}
			   <option value="checkbox">checkbox</option>
			   {/if}
			   {if $input_types[ds] == "textarea" }
               <option value="textarea" selected>textarea</option>
			   {else}
			   <option value="textarea">textarea</option>
			   {/if}
			   {if $input_types[ds] == "date" }
               <option value="date" selected>date</option>
			   {else}
			   <option value="date">date</option>
			   {/if}
			   {if $input_types[ds] == "file" }
               <option value="date" selected>file</option>
			   {else}
			   <option value="date">file</option>
			   {/if}
			   {if $input_types[ds] == "select" }
               <option value="select" selected>select</option>
			   {else}
			   <option value="select">select</option>
			   {/if}
			   {if $input_types[ds] == "mselect" }
               <option value="mselect" selected>select multiple</option>
			   {else}
			   <option value="mselect">select multiple</option>
			   {/if}
			   {if $input_types[ds] == "hidden" }
               <option value="hidden" selected>hidden</option>
			   {else}
			   <option value="hidden">hidden</option>
			   {/if}
			   {if $input_types[ds] == "select_list" }
               <option value="select_list" selected>select list</option>
			   {else}
			   <option value="select_list">select list</option>
			   {/if}
			   {if $input_types[ds] == "select_table" }
               <option value="select_table" selected>select table</option>
			   {else}
			   <option value="select_table">select table</option>
			   {/if}
			   {if $input_types[ds] == "label_field" }
               <option value="label_field" selected>label field</option>
			   {else}
			   <option value="label_field">label field</option>
			   {/if}
               </select>
           </td>
		   <td>
			<select name="schema_lists[]" > <!-- disabled="disabled" -->
			<option value=""> -- </option>
			{section name=ls loop=$schema_lists[ds]}
			{if $schema_lists[ds][ls] == $selected_schema_list[ds]}
			<option value="{$schema_lists[ds][ls]}" selected>{$schema_lists[ds][ls]} </option>
			{else}
			<option value="{$schema_lists[ds][ls]}" {$lists_sel[ds][ls]}>{$schema_lists[ds][ls]} </option>
			{/if}
			{/section}
			</select>
		   </td>
		   <td>
			<!-- <select name="table_lists[]" onChange="this.form.submit();"> <!-- disabled="disabled" -->
			<select name="table_lists[]" onChange='submitDetailsForm("select_table_list")'>
			<option value=""> -- </option>
			{section name=tbs loop=$table_lists[ds]}
			{if $table_lists[ds][tbs] == $selected_schema_table[ds]}
			<option value="{$table_lists[ds][tbs]}" selected>{$table_lists[ds][tbs]} </option>
			{else}
			<option value="{$table_lists[ds][tbs]}" {$table_lists_sel[ds][tbs]}>{$table_lists[ds][tbs]} </option>
			{/if}
			{/section}
			</select>
		   </td>
		   <td>
			<select name="field_lists[]" > <!-- disabled="disabled" -->
			<option value=""> -- </option>
			{section name=fls loop=$field_lists[ds]}
			{if $field_lists[ds][fls] == $selected_schema_field[ds]}
			<option value="{$field_lists[ds][fls]}" selected>{$field_lists[ds][fls]} </option>
			{else}
			<option value="{$field_lists[ds][fls]}" {$field_lists_sel[ds][fls]}>{$field_lists[ds][fls]} </option>
			{/if}
			{/section}
			</select>
		   </td>
      </tr>
      {/section}
</table>
</form>


</body>
</html>