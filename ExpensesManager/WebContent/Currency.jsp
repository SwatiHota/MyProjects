<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript">
function rupeeConverter(){
document.converter.dollar.value = document.converter.rupee.value * 0.01499
document.converter.pound.value = document.converter.rupee.value * 0.01230
document.converter.yen.value = document.converter.rupee.value * 1.56171
document.converter.euro.value = document.converter.rupee.value * 0.01366
}

function euroConverter(){
document.converter.dollar.value = document.converter.euro.value *1.09688
document.converter.pound.value = document.converter.euro.value *0.89961
document.converter.yen.value = document.converter.euro.value * 114.24
document.converter.rupee.value = document.converter.euro.value *73.0061
}
function dollarConverter(){
document.converter.euro.value = document.converter.dollar.value *0.91128
document.converter.pound.value = document.converter.dollar.value *0.82008
document.converter.yen.value = document.converter.dollar.value * 104.12
document.converter.rupee.value = document.converter.dollar.value * 66.5580
}
function poundConverter(){
document.converter.dollar.value = document.converter.pound.value *1.21839
document.converter.euro.value = document.converter.pound.value * 1.11026
document.converter.yen.value = document.converter.pound.value * 126.87
document.converter.rupee.value = document.converter.pound.value *81.0936
}
function yenConverter(){
document.converter.dollar.value = document.converter.yen.value *0.00960
document.converter.pound.value = document.converter.yen.value * 0.00787
document.converter.euro.value = document.converter.yen.value *0.00875
document.converter.rupee.value = document.converter.yen.value *0.63870
}

</script>
</head>
<body>
<form name="converter">
<table border="0">
<tr>
<td>Rupee: </td><td><input type="text" name="rupee" onChange="rupeeConverter()" /></td>
</tr>
<tr>
<td>Euro: </td><td><input type="text" name="euro" onChange="euroConverter()" /></td>
</tr>
<tr>
<td>US Dollar: </td><td><input type="text" name="dollar" onChange="dollarConverter()" /></td>
</tr>
<tr>
<td>British Pound:</td><td><input type="text" name="pound" onChange="poundConverter()" /></td>
</tr>
<tr>
<td>Japanese Yen: </td><td><input type="text" name="yen" onChange="yenConverter()" /></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" value="Convert!" /></td>
</tr>
</table>
</form>
</body>
</html>

