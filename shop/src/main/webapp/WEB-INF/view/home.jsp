<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<title>Shopping Cart</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.carousel-inner>.item>img, .carousel-inner>.item>a>img {
	width: 70%;
	margin: auto;
}
</style>

</head>
<body>
	<h2>
		<center>Welcome to Shopping Cart
	</h2>
	<hr>
	</center>
	<h3>

		<h3>
			<center>${msg}</center>
		</h3>
		<h3></h3>
		<h3>
			<center>${role}</center>
		</h3>
		<h3>
			<center>${error}</center>

			<center>${errormessage}</center>
		</h3>
		<center>${successmessage}</center>
		<h3>${loginmessage}</h3>

		<div class="row">
			<div class="container">
				<div class="col-lg-12" style="background-color: blue;"></div>
			</div>
			<div class="row">
				<div class="col-lg-12">


					<nav class="navbar navbar-inverse">
					<div class="container-fluid">
						<div class="navbar-header"></div>
						<ul class="nav navbar-nav">
							<li class="active"><a href="#">Home</a></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">Electronics <span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Mobile</a></li>
									<li><a href="#">Laptop</a></li>
									<li><a href="#">TV</a></li>
								</ul></li>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">Appliances <span
									class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Referigerator</a></li>
									<li><a href="#">Washing Machine</a></li>
									<li><a href="#">Air Conditioner</a></li>
								</ul>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">Men<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Footwear</a></li>
									<li><a href="#">T-shirt</a></li>
									<li><a href="#">Watches</a></li>
								</ul>
							<li class="dropdown"><a class="dropdown-toggle"
								data-toggle="dropdown" href="#">Women<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Jewellery</a></li>
									<li><a href="#">Footwear</a></li>
									<li><a href="#">Beauty product</a></li>

								</ul>
							<li class="active"><c:if test="${empty loginmessage}">
									<a href="login">Login</a>
								</c:if></li>
							<li><c:if test="${empty loginmessage}">
									<a href="register">Register</a>
								</c:if></li>

							<li><c:if test="${not empty loginmessage}">
									<a href="viewproducts">Product List</a>
								</c:if></li>
							<li><c:if test="${not empty loginmessage}">
									<a href="mycart">My Cart</a>
								</c:if></li>
							<li><c:if test="${not empty loginmessage}">
									<a href="logout">Logout</a>
								</c:if></li>
						</ul>
					</div>
					</nav>




					<div class="container">
						<br>
						<c:if test="${empty loginmessage}">
							<div id="myCarousel" class="carousel slide" data-ride="carousel">
								<!-- Indicators -->
								<ol class="carousel-indicators">
									<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
									<li data-target="#myCarousel" data-slide-to="1"></li>
									<li data-target="#myCarousel" data-slide-to="2"></li>
									<li data-target="#myCarousel" data-slide-to="3"></li>
								</ol>

								<!-- Wrapper for slides -->
								<div class="carousel-inner" role="listbox">
									<div class="item active">
										<a target="_blank"
											class="irc_mil i3597 isQNn16n93y4-zixyDjKkw5M" rel="noopener"
											jsaction="mousedown:irc.rl;keydown:irc.rlk" data-noload=""
											tabindex="0"
											href="/url?sa=i&amp;rct=j&amp;q=&amp;esrc=s&amp;source=images&amp;cd=&amp;cad=rja&amp;uact=8&amp;ved=0ahUKEwiOmoGI_JzTAhVJtY8KHVEQArEQjRwIBw&amp;url=https%3A%2F%2Fwww.commander.com.au%2Fmobiles%2Fmobile-phones&amp;bvm=bv.152180690,d.c2I&amp;psig=AFQjCNF1Zk4BPsDRi5GKiGymKjvMOfYq6g&amp;ust=1492019532742096"
											data-href="https://www.commander.com.au/mobiles/mobile-phones"
											data-ved="0ahUKEwiOmoGI_JzTAhVJtY8KHVEQArEQjRwIBw"><img
											class="irc_mi"
											src="https://www.commander.com.au/~/media/m2/commander/images/products/mobiles/cmdr15_product_banners_mobile_pc.ashx"
											onload="google.aft&amp;&amp;google.aft(this)" width="200"
											height="150" style="margin-top: 110px;"
											alt="Image result for images of mobile phones"></a>
									</div>

									<div class="item">
										<img class="irc_mi"
											src="http://lesmechantes.com/wp-content/uploads/2017/02/fashion-clothes-for-men-is-one-of-the-mesmerizing-fashion-apparel-for-Fashion-Clothes-you-4.jpg"
											onload="google.aft&amp;&amp;google.aft(this)" width="200"
											height="150" style="margin-top: 95px;"
											alt="Image result for images of clothes of men">
									</div>

									<div class="item">
										<img class="irc_mi"
											src="https://thepregnancymiracleblog.files.wordpress.com/2014/02/maternity_clothes.jpg"
											onload="google.aft&amp;&amp;google.aft(this)" width="200"
											height="150" style="margin-top: 88px;" alt="Related image">
									</div>

									<div class="item">
										<img class="irc_mi"
											src="http://g04.a.alicdn.com/kf/HTB1dSqDNFXXXXawXXXXq6xXFXXXM/KEZZI-Brand-Lovers-Watch-Separate-The-Second-Hand-Leather-Women-Man-Watches-30M-Waterpoof-Boy-Girls.jpg"
											onload="google.aft&amp;&amp;google.aft(this)" width="200"
											height="150" style="margin-top: 45px;"
											alt="Image result for images of watches of boy and girls">
									</div>
								</div>


								<!-- Left and right controls -->
								<a class="left carousel-control" href="#myCarousel"
									role="button" data-slide="prev"> <span
									class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
									<span class="sr-only">Previous</span>
								</a> <a class="right carousel-control" href="#myCarousel"
									role="button" data-slide="next"> <span
									class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
									<span class="sr-only">Next</span>
								</a>
							</div>
					</div>
					</c:if>


					<c:if test="${Isuserclickedlogin==true}">
						<jsp:include page="Login.jsp"></jsp:include>
						<c:if test="${not empty productlist}">
							<jsp:include page="Admin/product.jsp"></jsp:include>
						</c:if>
					</c:if>
					<c:if test="${isAdmin==true}">
						<jsp:include page="Admin/adminhome.jsp"></jsp:include>
					</c:if>
					<c:if test="${isAdmin==false}">
				
							<c:if test="${not empty productlist}">
							<jsp:include page="productlist.jsp"></jsp:include>
						</c:if>
					</c:if>

					<c:if test="${not empty errormessage}">
						<jsp:include page="Login.jsp"></jsp:include>

					</c:if>
					<c:if test="${Isuserclickedregister==true}">
						<jsp:include page="Registration.jsp"></jsp:include>
					</c:if>
					<c:if test="${isUserClickedaddtocart==true}">
					<jsp:include page="productlist.jsp"></jsp:include>
					</c:if>

				</div>
			</div>
		</div>
</body>
</html>
