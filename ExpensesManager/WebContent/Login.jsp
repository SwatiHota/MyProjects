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
	<div class="body2">
		<div class="main">
			<section id="content" style="padding: 0 0 70px 250px; width: 900px;" >
				<div class="wrapper" style="padding: 0;">
					
					<article class="col2" style="width: 600px;">
						<form id="form_1"  action="login.do" method="post" style="width: 600px; height: auto;">
							<div class="pad1">
								<h2>Login</h2>
								
								<div class="row">E-mail<br>
									<input type="text" name="email" class="input" placeholder="xyz@mail.com" style="height: 30px">
								</div>
								
								<div class="row">Password<br>
									<input type="password" name="pass" class="input" style="height: 30px">
								</div>
								
								<div class="row"><br>
									<%if(request.getAttribute("error") != null){ %>
									<font color="red"><%=request.getAttribute("error") %></font>
									<% } %>
								</div>
								
								<div style="clear: both;"></div>
								
								
								<div class="row"><br>
									
									<input type="submit" class="button" value="Login">
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