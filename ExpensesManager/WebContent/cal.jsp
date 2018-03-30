<!DOCTYPE html>
<html lang="en">
<head>
<title>Expense calculator</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>



<script>
$(function(){

	$(".val").click(function(e){
		e.preventDefault();
		var a = $(this).attr("href");
		$(".screen").append(a);
		$(".outcome").val($(".outcome").val() + a);
		
	});
	$(".equal").click(function(){
		$(".outcome").val(eval($(".outcome").val()));
		$(".screen").html(eval($(".outcome").val()));
	});
	$(".clear").click(function(){
		$(".outcome").val("");
		$(".screen").html("");
	});
	$(".min").click(function(){
		$(".cal").stop().animate({
			width: "0px", height: "0px", marginLeft: "700px", marginTop: "1000px"
		}, 500);
		setTimeout(function(){$(".cal").css("display", "none")}, 600);
	});
	$(".close").click(function(){
		$(".cal").css("display", "none");
	})
})

</script>


<style>

body{
	 
	color:#c0c0c0;
	font-family: "Helvetica Neue", Arial, sans-serif;
	font-weight: 300;
	font-size:100%;
	letter-spacing: 1.2px;
}
.wrap{
	 
	margin:10px auto 0;
}
.cal{
	width:480px;
	height:auto;
	padding:10px 0;
	 
	background:#232323;
	border:#000 1px solid;
	border-radius:7px;
	-webkit-border-radius:7px;
	-moz-border-radius:7px;
	box-shadow:rgba(0,0,0,0.4) 0px 2px 5px, inset rgba(255,255,255,0.9) 0px 1px 1px -1px;
	-webkit-box-shadow:rgba(0,0,0,0.4) 0px 2px 5px, inset rgba(255,255,255,0.9) 0px 1px 1px -1px;
	-moz-box-shadow:rgba(0,0,0,0.4) 0px 2px 5px, inset rgba(255,255,255,0.9) 0px 1px 1px -1px;
	background-image:-moz-linear-gradient(top, #333333, #1f1f1f);
		background-image:-webkit-linear-gradient(top, #333333, #1f1f1f);
			background-image:linear-gradient(top, #333333, #1f1f1f);
	overflow: hidden;
	text-align: center;
}
.screen{
	width:424px;
	height:93px;
	margin: 12px auto 30px;
	padding:15px 20px;
	color:#c0c0c0;
	text-align: right;
	font-size: 3em;
	letter-spacing: 3px;
	overflow:hidden;
	border:#000 1px solid;
	border-radius:7px;
	-webkit-border-radius:7px;
	-moz-border-radius:7px;
	box-shadow:inset rgba(0,0,0,1) 0px 1px 4px, inset rgba(225,225,225,0.3) 0px -2px 4px -2px;
	-webkit-box-shadow:inset rgba(0,0,0,1) 0px 1px 4px, inset rgba(225,225,225,0.3) 0px -2px 4px -2px;
	-moz-box-shadow:inset rgba(0,0,0,1) 0px 1px 4px, inset rgba(225,225,225,0.3) 0px -2px 4px -2px;
	background-image: -moz-linear-gradient(top, #3e3e3e 0%, #303030 100%);
		background-image: -webkit-linear-gradient(top, #3e3e3e 0%, #303030 100%);
			background-image: linear-gradient(top, #3e3e3e 0%, #303030 100%);
	-moz-box-sizing:border-box;
	-webkit-box-sizing:border-box;
	box-sizing:border-box;
}
.title{
	font-size: 1.2em;
}
.buttons{
	padding:0;
	width:423px;
	margin:auto;
	overflow: hidden;
	list-style: none;
}
.buttons li{
	display:inline;
	float:left;
	padding:0px;
	margin-right:13px;
	margin-bottom:10px;
}
.buttons li:nth-child(4n){
	margin-right:0;
}
.buttons a{
	display:block;
	width:95px;
	height:68px;
	padding:18px 0 12px;
	color:#c0c0c0;
	font-family: "Myriad Pro", Arial, sans-serif;
	font-size:1.6em;
	font-weight: 500;
	letter-spacing: -2px;
	background-color:#2f2f2f;
	border: #000 1px solid;
	border-radius:5px;
	-webkit-border-radius:5px;
	-moz-border-radius:5px;
	text-align: center;
	text-decoration: none;
	text-shadow:#000 0px -1px 0px;
	box-shadow: inset rgba(255,255,255,0.1) 0px 1px 0px, inset rgba(0,0,0,0.2) 0px -2px 2px;
	-webkit-box-shadow: inset rgba(255,255,255,0.1) 0px 1px 0px, inset rgba(0,0,0,0.2) 0px -2px 2px;
	-moz-box-shadow: inset rgba(255,255,255,0.1) 0px 1px 0px, inset rgba(0,0,0,0.2) 0px -2px 2px;
	background-image:-moz-linear-gradient(top, #363636 0%, #313234 40%, #2f2f2f 100%);
		background-image:-webkit-linear-gradient(top, #363636 0%, #313234 40%, #2f2f2f 100%);
			background-image:linear-gradient(top, #363636 0%, #313234 40%, #2f2f2f 100%);
	-moz-box-sizing:border-box;
	-webkit-box-sizing:border-box;
	box-sizing:border-box;
	cursor: pointer;
}
.buttons a:active{
	box-shadow: inset rgba(0,0,0,0.5) 0px 2px 8px;
	background-image:-moz-linear-gradient(top, #2f2f2f 0%, #363636 100%);
		background-image:-webkit-linear-gradient(top, #2f2f2f 0%, #363636 100%);
			background-image:linear-gradient(top, #2f2f2f 0%, #363636 100%);
}
.tall{height:151px !important;}
.wide{width:205px !important;}
.shift{margin-top:-78px;}


.ctrls{
	list-style: none;
	margin:5px 0 0 20px;
	padding:0;
	position: absolute;
}
.ctrls li{
	float:left;
	display:inline;
}
.ctrls li a{
	display: block;
	width:18px;
	height:18px;
	margin-right:10px;
	border-radius:100%;
	box-shadow:rgba(255,255,255,0.3) 0px 0px 1px, inset rgba(0,0,0,1) 0px 1px 2px 1px;
	background-image: -moz-radial-gradient( 9px -4px, #FFF 0px, #fff 2px, rgba(255,255,255,0) 4px), -moz-linear-gradient(bottom, rgba(255,255,255,0.5) 0%, rgba(255,255,255,0) 100%);
	background-image: -webkit-radial-gradient( 9px -4px, #FFF 0px, #fff 2px, rgba(255,255,255,0) 4px), -webkit-linear-gradient(bottom, rgba(255,255,255,0.5) 0%, rgba(255,255,255,0) 100%);
	background-image: radial-gradient( 9px -4px, #FFF 0px, #fff 2px, rgba(255,255,255,0) 4px), linear-gradient(bottom, rgba(255,255,255,0.5) 0%, rgba(255,255,255,0) 100%);
}
.close a{
	background-color:#f32c31;
	
}
.min a{background-color:#f7bf67;}
.max a{background-color:#89cb5a;}
.h1{
	text-align: center;
	color:#fff;
	font-weight: 400;
	font-size: 4em;
	line-height: 0;
	margin-top:80px;
	margin-bottom:-60px;
	text-shadow:#000 0px -1px 0px;
}
p{
	color:#fff;
	text-shadow: #999 0px -1px 0px;
	font-size:1.2em;
	line-height: 2em;
}
a{
	color:#953b3b;
}
</style>

<!--[if lt IE 9]>
			<script type="text/javascript" src="js/html5.js"></script>
			<style type="text/css">
				.bg{ behavior: url(js/PIE.htc); }
			</style>
		<![endif]-->
<!--[if lt IE 7]>
			<div style=' clear: both; text-align:center; position: relative;'>
				<a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/images/upgrade.jpg" border="0"  alt="" /></a>
			</div>
		<![endif]-->
		
		
		
		
		
		
</head>

<body id="page2">
 
	<!-- content -->
	<div class="body2">
		<div class="main">
			<section id="content">
				<div class="wrapper">
					<article class="col1">
						<div class="pad2" style="padding:0;">
							 
							 <div class="wrap">
<div class="cal">
	<ul class="ctrls">
		<li class="close"><a href="#"></a></li>
		<li class="min"><a href="#"></a></li>
		<li class="max"><a href="#"></a></li>
	</ul>
	<span class="title">Expense Manager Calculator</span>
	<div class="screen"></div>
	<input type="hidden" class="outcome" value="" />
	<ul class="buttons">
		<li><a class="clear">C</a></li>
		<li><a class="val" href="-">&plusmn;</a></li>
		<li><a class="val" href="/">&divide;</a></li>
		<li><a class="val" href="*">&times;</a></li>
		<li><a class="val" href="7">7</a></li>
		<li><a class="val" href="8">8</a></li>
		<li><a class="val" href="9">9</a></li>
		<li><a class="val" href="-">-</a></li>
		<li><a class="val" href="4">4</a></li>
		<li><a class="val" href="5">5</a></li>
		<li><a class="val" href="6">6</a></li>
		<li><a class="val" href="+">+</a></li>
		<li><a class="val" href="1">1</a></li>
		<li><a class="val" href="2">2</a></li>
		<li><a class="val" href="3">3</a></li>
		<li><a class="equal tall">=</a></li>
		<li><a class="val wide shift" href="0">0</a></li>
		<li><a class="val shift" href=".">.</a></li>
	</ul>
</div>




 
</div>
 
						</div>
					</article>
					 
				</div>

			</section>
		</div>
	</div>
	<!-- / content -->
	 
	 
</body>
</html>

<!-- <table>
				<tr>
					<td>Type</td>
					<td>
						<select>
							<option>Stationary</option>
							<option>Books</option>
							<option>Software</option>
							<option>Fees</option>
							<option>Housing</option>
							<option>Food</option>
							<option>Clothes</option>
							<option>Travel</option>
							<option>Medication</option>
							<option>Entertainment</option>
							<option>Utilities</option>
							<option>Others</option>
						</select>
					</td>
					
				</tr>
				
				<tr>
					<td>Type</td>
					<td>
						<input type="text" name="type"></input>
					</td>
					
				</tr>
				<tr>
					<td>Type</td>
					<td><textarea rows="7" cols="10"></textarea>
					
				</tr>
			</table> -->