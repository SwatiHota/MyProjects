<!DOCTYPE html>
<html lang="en">
<head>
<title>Graph</title>
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
							<li><a href="Location.html">Income</a>
								<ul>
									<li><a href="AddTransaction.jsp">Add Income</a></li>
									<!--<li><a href="viewtransaction.do?type=Debit">View Debit</a></li>-->
									<li><a href="viewtransaction.do?type=Credit">View Income</a></li>
								</ul>
							</li>
							<li><a href="#"> Expenses</a>
								<ul>
									<li><a href="AddExpenses.jsp">Add Expenses</a></li>
									<li><a href="viewexpences.do?category=daily">View Expenses (Today)</a></li>
									<li><a href="ViewExpenses.jsp">View Expenses (Custom)</a></li>
									<!-- <li><a href="Property.html">View Expenses (Yearly)</a></li> -->
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
							<li><a href="feedback.do"> Feedback</a></li>
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
			<section id="content" style="padding: 0 0 10px 0;">
				<div class="wrapper" style="padding: 0;">
					
				<center>

					<img src="piechart" alt='Pie chart'/>
					</center>
				</div>

			</section>
		</div>
	</div>
	<!-- / content -->
	<div class="body4">
		<div class="main">
			<!-- footer -->```
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