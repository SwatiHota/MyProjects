<!DOCTYPE html>
<html lang="en">
<head>
<title>Transaction</title>
<meta charset="utf-8">
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<script type="text/javascript" src="js/jquery-1.6.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Didact_Gothic_400.font.js"></script>
<script type="text/javascript" src="js/atooltip.jquery.js"></script>
<script type="text/javascript" src="js/jquery.jqtransform.js"></script>
<script type="text/javascript" src="js/script.js"></script>

<script class="jsbin" src="js/jquery.min.js"></script>
  <script>
function display()
{	
 alert(" YOUR INCOME SAVED SUCCESSFULLY");
}
</script>
</head>
<body id="page2">
	<div class="body1">
		<div class="main">
			<!--header -->
			<header>
				<h1>
					<a href="index.html" id="logo"></a>
				</h1>
				<div class="wrapper">
					<ul id="icons">
						<% if(session.getAttribute("userName")!=null){ %>
						<li><a href="#" class="normaltip" >Welcome : <%=session.getAttribute("userName") %></a></li>
						<li><a href="logout.do" class="normaltip" >Logout</a></li>
						<% } %>
					</ul>
				</div>
				<nav>
					<div id="nav_red">
						<ul>
							<li><a href="Home.jsp">Home</a> </li>
							<li><a href="#">Income</a>
								<ul>
									<li><a href="AddTransaction.jsp">Add Income</a></li>
									
									<li><a href="viewtransaction.do?type=Credit">View Income</a></li>
								</ul>
							</li>
							<li><a href="#"> Expenses</a>
								<ul>
									<li><a href="AddExpenses.jsp">Add Expenses</a></li>
									<li><a href="viewexpences.do?category=daily">View Expenses (Today)</a></li>
									<li><a href="ViewExpenses.jsp">View Expenses (Custom)</a></li>
								
								</ul>
							</li>
							
							<li><a href="graph.jsp">Graph</a></li>
							<li><a href="#">Tools</a>
								    <ul>
									<li><a onclick="window.open('cal.jsp','popUpWindow','height=582,width=482,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');" href="Home.jsp">
Calculator</a></li>
<li><a onclick="window.open('Currency.jsp','popUpWindow','height=300,width=300,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');" href="Home.jsp">
						Currency Converter</a></li> 
								</ul>
							</li>
							 <li><a href="feedback.jsp">Feedback</a></li>	 
						</ul>
						
						 
					</div>

				</nav>
				
			</header>
			<!-- / header -->
		</div>
	</div>
	<!-- content -->
	<div class="body2">
		<div class="main">
			<section id="content" style="padding: 0 0 70px 250px; width: 900px;" >
				<div class="wrapper" style="padding: 0;">
					
					<article class="col2" style="width: 600px;">
						<form id="form_1"  action="addtransaction.do" method="post" style="width: 600px; height: auto;">
							<div class="pad1">
								<h2>Add Income</h2>
								
								 <div class="row_select"> Type:<br>
								   
									<select name="type" style="height: 30px" >
										
										<option>Credit</option>
										
									</select>
								</div>
								<div class="row"> Amount:<br>
									<input type=text style="height: 30px" name="amount" class='number' maxlength=6 min=1 max=600000>
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
								</div>
								<div class="row_select">
									<div class="cols"> Description:<br> 
											<textarea name="descr" rows="4" cols="20" style="font-size: 150%;"></textarea>
									</div>
								</div>
								
								<div class="row"><br>
									<%if(request.getAttribute("error") != null){ %>
									<font color="red"><%=request.getAttribute("error") %></font>
									<% } %>
								</div>
								
								  <div style="clear: both;"></div>
								
								<div class="row">
									
									<input type="submit" class="button" value="Add" onClick="display();">
								</div>
								
								

							</div>
						</form>
					</article>
				</div>

			</section>
		</div>
	</div>
	<!-- / content -->
	<div class="body4">
		<div class="main">
			<!-- footer -->
			<footer>
				<span class="call">Call Center: <span>91-9573971302</span></span>
				<br> 
				<a rel="nofollow" href="" target="_blank">
					</a>
				<!-- {%FOOTER_LINK} -->
			</footer>
			<!-- / footer -->
		</div>
	</div>
	<script type="text/javascript">
		Cufon.now();
	</script>
	<script src="http://static.jsbin.com/js/render/edit.js"></script>
</body>
</html>