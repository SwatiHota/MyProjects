<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Online Password Generator</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- Meta tag Keywords -->
<!-- css files -->
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all"/>
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
	<h2 class="sub-head">Invalid User </h2>
		<div class="sub-main">	
          <p class="sub-head">Login Failure.... </p>
            <p class="sub-head">(Invalid User Name / URL /OTP) </p>
         <a class="sub-head" href="GetUsername.jsp" target="_self">Try Again</a>
          </div>
		<div class="clear"></div>
</div>
<div class="divRight-home3">
		<a class="sub-head" href="home.jsp">Home</a>
			</div>
<!--//main-->

<!--footer-->
<div class="footer-w3">
	
</div>
<!--//footer-->
</body>
</html>