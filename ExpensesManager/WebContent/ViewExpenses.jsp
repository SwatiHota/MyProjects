<!DOCTYPE html>
<%@page import="com.expence.dto.DTO"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
<head>
<title> Expenses</title>
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

		
<script src="js/mootools-core.js" type="text/javascript"></script>
<script src="js/mootools-more.js" type="text/javascript"></script>
<script src="js/Locale.en-US.DatePicker.js" type="text/javascript"></script>
<script src="js/Picker.js" type="text/javascript"></script>
<script src="js/Picker.Attach.js" type="text/javascript"></script>
<script src="js/Picker.Date.js" type="text/javascript"></script>

<link href="css/datepicker_bootstrap.css" rel="stylesheet">
<script>

window.addEvent('domready', function(){
new Picker.Date($$('#datepicker'), {
timePicker: false,
positionOffset: {x: 5, y: 0},
pickerClass: 'datepicker_bootstrap',
useFadeInOut: !Browser.ie
});
});

window.addEvent('domready', function(){
new Picker.Date($$('#datepicker1'), {
timePicker: false,
positionOffset: {x: 5, y: 0},
pickerClass: 'datepicker_bootstrap',
useFadeInOut: !Browser.ie
});
});

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
									  <li><a onclick="window.open('cal.jsp','popUpWindow','height=582,width=482,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');" href="#">
Calculator</a></li>
<li><a onclick="window.open('Currency.jsp','popUpWindow','height=300,width=300,left=100,top=100,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no, status=yes');" href="#">
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
			<section id="content" style="padding: 0 0 0px 0px; width: 900px;" >
				<div class="wrapper" style="padding: 0;">
					
					<article class="col2" style="width: 900px;">
							<div class="pad1">
								<% if(request.getAttribute("alltransactiondetails")==null){ %>
								<h2>View Expenses</h2>
								
								<% if(request.getAttribute("daily")==null) {%>
									<form action="search.do" method="post">
									<table>
										<tr>
											<td bordercolor="red"><font color="white">Select date </font></td>
											<td><font color="white">From : </font><input name="from" type="text" id="datepicker" class="msg"></td>
											<td><font color="white">To : </font><input name="to" type="text" id="datepicker1" class="msg"></td>
											<td><input type="submit" value="View" class="button"></input></td>
										</tr>
									</table>
									</form>
								<% } %>
								
								<div style="float: left; width: 70%;">
									
									<table>
									<tr>
										<td width="15%;"><b>Type</b></td>
										<td width="15%;"><b>Date</b></td>
										<td width="15%;"><b>Description</b></td>
										<td width="15%;"><b>Amount</b></td>
										
									</tr>
									
									<% if(request.getAttribute("details")!=null){ 
									
										ArrayList details = (ArrayList) request.getAttribute("details");
										for(Object o : details){
											DTO dto = (DTO) o;
									%>
									
									<tr>
										<td><p><%=dto.getType() %></p></td>
										<td><p><%=dto.getDate() %></p></td>
										<td><p><%=dto.getDesc() %></p></td>
										<td><p><%=dto.getAmt() %></p></td>
									</tr>			
									<% } } %>					
								</table>
									
								</div>
								<% } else {  %>
								
								<h2>View Income</h2>
								<div style="float: left; width: 70%;">
									
									<table>
									<tr>
										<td width="15%;"><b>Type</b></td>
										<td width="15%;"><b>Date</b></td>
										<td width="15%;"><b>Description</b></td>
										<td width="15%;"><b>Amount</b></td>
										
									</tr>
									
									<% if(request.getAttribute("alltransactiondetails")!=null){ 
									
										ArrayList details = (ArrayList) request.getAttribute("alltransactiondetails");
										for(Object o : details){
											DTO dto = (DTO) o;
									%>
									
									<tr>
										<td><p><%=dto.getType() %></p></td>
										<td><p><%=dto.getDate() %></p></td>
										<td><p><%=dto.getDesc() %></p></td>
										<td><p><%=dto.getAmt() %></p></td>
									</tr>			
									<% } } %>					
								</table>
									
								</div>
								<% } %>
								<div style="float: right;; width: 25%;">
									<table>
									<tr>
										 
										<td width="15%;"><b>Total Income</b></td>
										<td width="15%;"><b>Balance</b></td>
										
									</tr>
									<% if(request.getAttribute("details")!=null){ 
									
										ArrayList details = (ArrayList) request.getAttribute("details");
										if(!details.isEmpty()){
										for(int i=0;i<1;i++){
											
											DTO dto = (DTO)details.get(i);
									%>
									<tr>
										 
										<td><p><%=dto.getTotIncome() %></p></td>
										<td><p><%=dto.getBalance() %></p></td>
									</tr>			
									<% } } } %>	
								</table>
				
									
								</div>
								
							</div>
					</article>
				</div>
<div style="min-height: 300px;"></div>
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