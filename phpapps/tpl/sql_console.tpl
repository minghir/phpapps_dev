<html>
<head>
{include file="commun_header.tpl" }
<title>SQL:{$DATABASE}</title>
{literal}
<script language="JavaScript">
<!--
function clearDescr(){
      //document.act.descr.value = "";
}
function resTextarea(arg){

	if(arg == 'up'){
		if(document.act.query.rows > 13)
			document.act.query.rows -= 10;
		else
		   document.act.query.rows = 3;
	}else{
		if(document.act.query.rows >= 43)
		   return
		 else
		document.act.query.rows += 10;
		
	}	
}
-->
</script>
{/literal}
</head>
<body align="left">
    <table valign="top">
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
    <tr><td><table><tr><td>
		<div class="textwrapper">
		<textarea name="query" cols="170" rows="3" onChange="clearDescr()">{$query}</textarea>
		</div>
		</td>
		<td valign="top">
		<img src="imgs/arrow-up-double.png" onClick="resTextarea('up');"><br><img src="imgs/arrow-down-double.png" onClick="resTextarea('down');"></td>
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
