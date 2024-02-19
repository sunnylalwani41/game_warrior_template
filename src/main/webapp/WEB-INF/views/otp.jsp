<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
    <html lang="zxx">
        <head>
            <title>Game Warrior Enter OTP</title>
            <meta charset="UTF-8">
            <meta name="description" content="Game Warrior Template">
            <meta name="keywords" content="warrior, game, creative, html">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <!-- Favicon -->   
            <link href="img/favicon.ico" rel="shortcut icon"/>
        
            <!-- Google Fonts -->
            <link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i" rel="stylesheet">
        
            <!-- Stylesheets -->
            <link rel="stylesheet" href="css/bootstrap.min.css"/>
            <link rel="stylesheet" href="css/font-awesome.min.css"/>
            <link rel="stylesheet" href="css/owl.carousel.css"/>
            <link rel="stylesheet" href="css/style.css"/>
            <link rel="stylesheet" href="css/animate.css"/>
            <link rel="stylesheet" href="css/login.css"/>
        	<link rel="stylesheet" href="css/error-container.css"/>
        	<link rel="stylesheet" href="css/responsive.css"/>
        	
	<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>
        </head>
<body>
    <div id="preloder">
		<div class="loader"></div>
	</div>
	
	<c:if test="${not empty userId }">
		<%
			response.sendRedirect("/");
		%>
	</c:if>
	<c:if test="${empty email}">
		<%
			session.setAttribute("errorMessage", "Invalid user!! You are not register.");
			response.sendRedirect("/registration");
		%>
	</c:if>
	
    <header class="header-section">
		<div class="container">
			<!-- logo -->
			<a class="site-logo" href="/">
				<img src="img/logo.png" alt="">
			</a>
			<!-- responsive -->
			<div class="nav-switch">
				<i class="fa fa-bars"></i>
			</div>
			<!-- site menu -->
			<nav class="main-menu">
				<ul>
					<li><a href="/">Home</a></li>
				</ul>
			</nav>
		</div>
	</header>
    	<!-- Hero section -->
	<section class="hero-section">
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg" data-setbg="img/slider-1.jpg">
				<c:if test="${not empty errorMessage}">
					<div class="errorContainer">${errorMessage}</div>
					<%
						session.removeAttribute("errorMessage");

					%>
				</c:if>
				<c:if test="${not empty message}">
					<div class="errorContainer">${message}</div>
					<%
						session.removeAttribute("message");

					%>
				</c:if>
				<div class="box">
                    <h2>Enter Your OTP</h2>
                    <p>You receive the OTP in your registered Email</p>
                    <form action="verifyOtp" method="post">
                      <div class="input-box">
                        <input type="text" name="otp" required>
                        <label>Enter Your OTP</label>
                      </div>
                      <p>
						<a href="resentOtp">Resent Otp</a>
					</p>
                      <input id="submit" type="submit" name="" value="Submit">
                    </form>
                  </div>
                  </div>
			</div>
			
		</div>
	</section>
	<footer class="footer-section">
		<div class="container">
			<ul class="footer-menu">
				<li><a href="/">Home</a></li>
				<li><a href="review">Games</a></li>
				<li><a href="contact">Contact</a></li>
			</ul>
			<a href="termsandcondition">
				<i class="fa-solid fa-file-invoice"></i>
				Terms and condition
			</a>
			<a href="notification">
				<i class="fa-solid fa-bell"></i>
				Notification
			</a>
			<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			</p>
		</div>
	</footer>
	<!--====== Javascripts & Jquery ======-->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.marquee.min.js"></script>
	<script src="js/main.js"></script>
    </body>
</body>
</html>