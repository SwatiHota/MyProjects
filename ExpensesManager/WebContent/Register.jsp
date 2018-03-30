<!DOCTYPE html>
<html lang="en">
<head>
<title>Expense Manager</title>
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
			<div style=' clear: both; text-align:center; position: relative;'>
				<a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/images/upgrade.jpg" border="0"  alt="" /></a>
			</div>
		<!--  [endif]-->

 <!--  <%if(request.getAttribute("successMsg")!=null){ %>
<script type="text/javascript">
alert("<%=request.getAttribute("successMsg") %><% } %>");
 <script>
function display()
{
 alert(" YOU RGISTERED SUCCESSFULLY");
}
</script>-->
</head>
<body id="page2">
	<div class="body1">
		<div class="main">
			<!--header -->
			<header>
				<h1>
					<a href="index.jsp" id="logo"></a>
				</h1>
				<div class="wrapper">
					<ul id="icons">

					</ul>
				</div>
				<nav>
					<div id="nav_red">
						<ul><br>
							<li><a href="index.jsp">Home</a> </li>
							
							 
						</ul>
					</div>

				</nav>
				
			</header>
			<!-- / header -->
		</div>
	</div>
	<!-- content -->
	<jsp:useBean id="bean" class="com.expence.dto.DTO" scope="request"></jsp:useBean>
	<div class="body2">
		<div class="main">
			<section id="content" style="padding: 0 0 75px 250px; width: 900px;" >
				<div class="wrapper" style="padding: 0;">
					
					<article class="col2" style="width: 600px;">
						<form id="form_1"  action="register.do" method="post" style="width: 600px; height: auto;">
							<div class="pad2">
								<h2>User registration</h2>
								
								<div class="row_select"> Name:<br>
									<input type="text" name="name" value="${bean.name }" class="input" placeholder="First Name" style="height: 30px">
								</div>
								
								<div class="row">E-mail<br>
									<input type="text" name="email" value="${bean.email }" class="input" placeholder="xyz@mail.com" style="height: 30px">
								</div>
								
								<div class="row">Password<br>
									<input type="password" name="pass" value="${bean.pass }" class="input"  style="height: 30px">
								</div>
								
								<div class="row">Mobile<br>
									<input type="text" name="mob" value="${bean.mob }" class="input" placeholder="10-digit number" style="height: 30px">
								</div>
								
								<div class="row">City<br>
									<input type="text" name="city" value="${bean.city }" class="input" placeholder="City Name" style="height: 30px">
								</div>
								
								<div class="row"><br>
									<%if(request.getAttribute("error") != null){ %>
									<font color="red"><%=request.getAttribute("error") %></font>
									<% } %>
								</div>
								
								<div style="clear: both;"></div>
								
								
								<div class="row"><br>
									
									
									<input type="submit" class="button" value="Register">
									 
							
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
</body>
</html>