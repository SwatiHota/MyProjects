<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Online Password Generator</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- Meta tag Keywords -->
<!-- css files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<!-- For Digital Clock -->
<style>
    	#txt	
        	{
 		font-size : 30px;
               		color : white;
               		text-align : right;
               		position: relative;
    				bottom: -129px;
    				right: 1102px;
        	}
  
    </style>


<script>
function display()
{
 alert(" YOUR HAVE REGISTERED SUCCESSFULLY");
}
	function startTime() 
  {
    var today = new Date();
    var h = today.getHours();
    var m = today.getMinutes();
    var s = today.getSeconds();
    h = set12(h);
    h = checkTime(h);
    m = checkTime(m);
    s = checkTime(s);
    document.getElementById('txt').innerHTML =
    h + ":" + m + ":" + s;
    var t = setTimeout(startTime, 500);
  }
function checkTime(i) {
    if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
    return i;
}

function set12(j)
	{
    	if(j>12)
        {
        	j=j-12;
        }
        return j;
    }

</script>
<!-- End of Digital Clock -->
</head>
<body onload="startTime()">
<!--header-->
<div class="header-w3l">
		<img src="images/logo.jpg" class="header-logo" alt="logo" />
		<div id="txt"></div>
		<h1>Department of Computer Science </h1>
	</div>
<!--header-->
	<div class="header-w3l">
		<h1>Online Password Generator </h1>
		
	</div>
<!--//header-->
<!--main-->
<div class="main-agileits">
	<h3 class="sub-head">Registration</h3>
		<div class="sub-main">	
			<form id="form1" name="form1" method="post" action="saveRegisterData.do" onSubmit="display();" >
				<input placeholder="User Name" name="uname" class="name" type="text" required="">
					<span class="icon1"><i class="fa fa-users" aria-hidden="true"></i></span>				
				<input placeholder="Phone Number" name="phoneno" class="number" type="text" required="">
					<span class="icon2"><i class="fa fa-phone" aria-hidden="true"></i></span>
				<input placeholder="URL" name="url" class="url" type="text" required="">
					<span class="icon3"><i class="fa fa-globe" aria-hidden="true"></i></span>
					<input placeholder="UID" name="uid" class="uid" type="text" required="">
					<span class="icon4"><i class="fa fa-user" aria-hidden="true"></i></span>
				<input  placeholder="Password" name="longtermpassword" class="pass" type="password" required="">
					<span class="icon5"><i class="fa fa-unlock" aria-hidden="true"></i></span>			
				<input type="submit" value="Submit">
			</form>
			
		</div>
	
		
		
		
		<div class="clear"></div>
</div>
<div class="divRight-home">

			<a class="sub-head" href="home.jsp">Home</a>
			</div>
<!--//main-->

<!--footer-->
<div class="footer-w3">
	
</div>
<!--//footer-->

</body>
</html>