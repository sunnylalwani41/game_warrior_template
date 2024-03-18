<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>Khelo Exchanges</title>
	<meta charset="UTF-8">
	<meta name="description" content="Game Warrior Template">
	<meta name="keywords" content="warrior, game, creative, html">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Favicon -->   
	<link href="img/favicon.png" rel="shortcut icon" />

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>

	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/error-container.css"/>

	<link rel="stylesheet" href="./css/home.css">
    <link rel="stylesheet" href="./css/registration.css">
	<link rel="stylesheet" href="css/responsive.css"/>
	
	<link rel="stylesheet" href="css/error-container.css"/>
	<link rel="stylesheet" href="css/admin-login.css"/>
	<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>
</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	
	<c:if test="${not empty adminId}">
		<%
			response.sendRedirect("adminDashboard");
		%>
	</c:if>
	<!-- Header section -->
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
						<div class="details" style="display: flex; justify-content: space-between;">
							<div class="homedetails" style="float:none;">
								<ul>
									<li><a href="/">Home</a></li>
								</ul>
							</div>
						</div>
					</nav>
				</div>
			</header>
		
	<!-- Header section end -->
	
	<div class="pageData">
        <!-- <img src="https://media.istockphoto.com/id/1334436084/photo/top-down-view-of-colorful-illuminated-gaming-accessories-laying-on-table.jpg?s=612x612&w=0&k=20&c=E9xnbAZoBS5LlUX0q-zxT_3m6gEZpyB2k51_U4LLMNs="
            alt="game image"> -->
        <div class="text-overlay1">
        	<c:if test="${not empty errorMessage}">
				<div class="errorContainerSeconnd">${errorMessage}</div>
				<%
					session.removeAttribute("errorMessage");
					session.invalidate();
				%>
			</c:if>
			<c:if test="${not empty message}">
				<div class="errorContainerSeconnd">${message}</div>
				<%
					session.removeAttribute("message");
					session.invalidate();
				%>
			</c:if>
            <div class="register-box">
                <p class="register-head">Admin Login</p>
                <form action="verifyAdmin" method="post">
                    <input type="text" id="email" name="adminEmail" placeholder="Email Address" required>
                    <br>
                    <input type="password" id="password" name = "adminPassword" placeholder="Password" required>
                    <div class="error-message" id="password-error"></div>
                    <br>
                    <button id="nextButton" type="submit">Login</button>
                </form>
                <p class="lostAdminPassword" style="color:white;">Forget password?</p>
            </div>
        </div>
        
        </div>
    </div>
    
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
	<script src="../js/admin-login.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.marquee.min.js"></script>
	<script src="js/main.js"></script>
    </body>
</html>

