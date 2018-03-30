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
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="js/atooltip.jquery.js"></script>
<script type="text/javascript" src="js/jquery.jqtransform.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>

</head>


<body id="page1">
	<div class="body1">
		<div class="main">
			<!-- header -->
			<header>
				<h1>
					<a href="index.html" id="logo"></a>
				</h1>
				<div class="wrapper">
					<ul id="icons">
						<li><a href="Login.jsp" class="normaltip" title="User Login">User
								Login</a></li>
						<li><a href="Register.jsp" class="normaltip"
							title="Registration">Registration</a></li>
					</ul>
				</div>
				<nav>
					<ul id="menu">
						<li id="menu_active"><a href="index.jsp">Home</a></li>
						<li><a href="#">Income</a></li>
						<li><a href="#"> Expenses</a></li>
						<li><a href="#">Graph</a></li>
						<li><a href="#">Tools</a></li>
						<li><a href="#">Feedback</a></li>
						
					</ul>
				</nav>
				<div class="ic"></div>
			</header>
			<!-- / header -->
		</div>
	</div>
	<!-- content -->
	<div class="body2">
		<div class="main">
			<section id="content">
				<div class="wrapper">
					<article class="col1">
						<div id="slider">
							<img src="images/images11.jpg" alt=""
								title="<span> <a href='#'></a></span>">
							<img src="images/images5.jpg" alt=""
								title="<span> <a href='#'></a></span>">
							<img src="images/images6.jpg" alt=""
								title="<span> <a href='#'></a></span>">
							<img src="images/images4.jpg" alt=""
								title="<span> <a href='#'></a></span>">
							<img src="images/images2.jpg" alt=""
								title="<span> <a href='#'></a></span>">
						</div>
					</article>
					<article class="col2">
							<div class="pad3">
					<img src="images/images.jpg">
					</div>
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
	<script type="text/javascript">
		$(window).load(function() {
			$('#slider').nivoSlider({
				effect : 'sliceUpDown', //Specify sets like: 'fold,fade,sliceDown, sliceDownLeft, sliceUp, sliceUpLeft, sliceUpDown, sliceUpDownLeft'
				slices : 17,
				animSpeed : 500,
				pauseTime : 6000,
				startSlide : 0, //Set starting Slide (0 index)
				directionNav : false, //Next & Prev
				directionNavHide : false, //Only show on hover
				controlNav : true, //1,2,3...
				controlNavThumbs : false, //Use thumbnails for Control Nav
				controlNavThumbsFromRel : false, //Use image rel for thumbs
				controlNavThumbsSearch : '.jpg', //Replace this with...
				controlNavThumbsReplace : '_thumb.jpg', //...this in thumb Image src
				keyboardNav : true, //Use left & right arrows
				pauseOnHover : true, //Stop animation while hovering
				manualAdvance : false, //Force manual transitions
				captionOpacity : 1, //Universal caption opacity
				beforeChange : function() {
					$('.nivo-caption').animate({
						bottom : '-110'
					}, 400, 'easeInBack')
				},
				afterChange : function() {
					Cufon.refresh();
					$('.nivo-caption').animate({
						bottom : '-20'
					}, 400, 'easeOutBack')
				},
				slideshowEnd : function() {
				} //Triggers after all slides have been shown
			});
			Cufon.refresh();
		});
	</script>
</body>
</html>