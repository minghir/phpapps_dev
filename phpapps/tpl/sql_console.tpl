<html>
<head>
{include file="commun_header.tpl" }
<title>phpapps SQL Console:{$DATABASE}</title>
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
    
.container, .subContainer, .CodeMirror {
	border-top: 1px solid black;
	border-bottom: 1px solid black;
       
  width: 100%;
  height: 90;
  line-height: 1em;
  font-family: monospace;
 }

.CodeMirror-scroll {
   overflow-y: auto;
 } 

</style>
<script language="JavaScript">
        // Wait until the DOM has loaded before querying the document
	$(document).ready(function(){
        ////////////////// code miror                   
        var mime = 'text/x-mariadb';
	
	// get mime type
	if (window.location.href.indexOf('mime=') > -1) {
		mime = window.location.href.substr(window.location.href.indexOf('mime=') + 5);
	}
	
	window.editor = CodeMirror.fromTextArea(document.getElementById('query'), {
		mode: mime,
		indentWithTabs: true,
                tabSize: 10,
		smartIndent: true,
		lineNumbers: true,
		matchBrackets : true,
		autofocus: true,
        //        readOnly: true,
	});
        });
</script>
{/literal}
</head>
<body align="left">
    <table valign="top" width="100%">
    <form name="act" method="post">
    <tr><td>
    <input type="hidden" name="act" value="submited">
	
    <select name="db" onChange="this.form.submit();">
    {foreach $dbs as $value}   
    <option value="{$value}" {$dbs_sel[$value@key]}>{$value}</option>
    {/foreach}
    
    </select>
    <select name="queries" onChange="this.form.submit();">
                    <option value=" -- " > -- </option>
                    {section name=qry loop=$queries}
                    <option value="{$queries[qry]}" {$queries_sel[qry]}> {$desc_queries[qry]}</option>
                    {/section}
            </select>
            <input type="submit" name="act" value="Del">
            <input type="submit" name="act" value="Save">
            <input type="text" name="descr" value="{$descr}">
            <input type="submit" name="act" value="Query">
    </td></tr>
    <tr><td>
            <select name="history" onChange="this.form.submit();">
                    <option> history </option>
                {section name=hist loop=$hist_queries_id}
                    <option value="{$hist_queries_id[hist]}"> {$hist_queries_desc[hist]}</option>
                {/section}
            </select>
        </td></tr>
    <tr><td><table width="100%" border="1"><tr><td>
		<div class="textwrapper" width="100%">
		<textarea id="query"  name="query" >{$query}</textarea>
		</div>
		</td>
		</tr></table>
	</td></tr>
    </form>
    </table>
    <b>{if $rec_no == 0 } empty set {elseif $rec_no == 1} {$rec_no} row {elseif $rec_no == ""  OR  $rec_no < 0 } {else} {$rec_no} rows {/if}</b> |
    <a href="xls.php">xls</a> | <a href="dbf.php">dbf</a> | <a href="csv.php">csv</a>
    <table valign="top" align="left" border=0 cellpadding=0 cellspacing=0 bgcolor="#C0C0C0"><tr><td>
    <table valign="top" align="center" border=0 cellpadding=1 cellspacing=1>
    <tr bgcolor="#e8e8e8">
    {section name=fld loop=$fields}
    <td><b>{$fields[fld]}</b></td>
    {/section}
    </tr>
    {section name=row loop=$rows}
    {if $smarty.section.row.index % 2 == 0 }
    <tr bgcolor="#DDDDDD">{$rows[row]}</tr>
    {else}
    <tr bgcolor="white">{$rows[row]}</tr>
    {/if}
    {/section}
    </table>
    </td></tr></table>
    
    <div align="left">
    <font color="#520202" size=4>{$SQL_ERROR}</font>
    </div>
    
</body>
</html>
