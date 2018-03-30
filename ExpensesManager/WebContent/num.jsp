<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<!--
Created using jsbin.com
Source can be edited via http://jsbin.com/utikec/1/edit
-->
<head>
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<meta charset=utf-8 />
<title>JS Bin</title>
<!--[if IE]>
<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<style>
article, aside, figure, footer, header, hgroup,
menu, nav, section { display: block; }
</style>

<style id="jsbin-css">

</style>
</head>
<body>
<input type=text class='number' maxlength=3 min=1 max=500>
<script>
function number(e) {
var theEvent = e || window.event;
var key = theEvent.keyCode || theEvent.which;
key = String.fromCharCode( key );
var regex = /[0-9]|\./;
if( !regex.test(key) ) {
theEvent.returnValue = false;
if(theEvent.preventDefault) theEvent.preventDefault();
}
}

$(document).ready(function(){
$("input[type=text]").filter(".number,.NUMBER").on({
"focus":function(e){
$(e.target).data('oldValue',$(e.target).val());
},
"keypress":function(e){
e.target.oldvalue = e.target.value;
number(e);
},
"change":function(e){
var t = e.target;
var min = $(t).attr("min");
var max = $(t).attr("max");
var val = parseInt($(t).val(),10);
if( val<min || max<val)
{
alert("Error!");
$(t).val($(t).data('oldValue'));
}

}
});
});
</script>
<script src="http://static.jsbin.com/js/render/edit.js"></script>

</body>
</html>
