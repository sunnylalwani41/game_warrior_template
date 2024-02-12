<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="zxx">
<head>
	<title>Game Warrior Template</title>
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
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/error-container.css"/>

	<link rel="stylesheet" href="./css/home.css">
    <link rel="stylesheet" href="./css/registration.css">
	<link rel="stylesheet" href="css/responsive.css"/>

</head>
<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	
	<c:if test="${not empty userId }">
		<%
			response.sendRedirect("/");
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
							<li><a href="review">Games</a></li>
							<li><a href="fetchIdDetails">Create Id and My Ids</a></li>
							<li><a href="contact">Contact</a></li>
							<div class="hideItem">
								<c:choose>
									<c:when test="${not empty userId}">
										<li>
											<a href="fetchProfile">
												<i class="fa-solid fa-user"></i>
												Profile
											</a>
										</li>
										<li>
											<i class="fa-solid fa-wallet"> : ${balance}</i>
										</li>
										<li>
											<a href="logout">
												<i class="fa-solid fa-arrow-right-from-bracket"></i>
												Logout
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li>
											<a href="login">Login</a>
										</li>
										<li>	
											<a href="registration">Register</a>
										</li>
									</c:otherwise>
									</c:choose>
								</div>
						</ul>
					</div>

					<div class="personaldetails" style="padding-right: 1px; padding-top: 5px; display: flex;">
						<ul>
							<c:choose>

								<c:when test="${not empty userId}">
									<li>
										<a href="fetchProfile">
											<i class="fa-solid fa-user"></i>
											Profile
										</a>
									</li>
									<li>
										<i class="fa-solid fa-wallet"> : ${balance}</i>
									</li>
									<li>
										<a href="logout">
											<i class="fa-solid fa-arrow-right-from-bracket"></i>
											Logout
										</a>
									</li>
								</c:when>
								<c:otherwise>
									<div class="user-panel" style="color: black;">
										<a href="login" style="color: black;">Login</a> / <a href="registration" style="color: black;">Register</a>
									</div>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>
	
	<!-- Header section end -->
	
	
	
	
	<div class="pageData">
        <img src="https://media.istockphoto.com/id/1334436084/photo/top-down-view-of-colorful-illuminated-gaming-accessories-laying-on-table.jpg?s=612x612&w=0&k=20&c=E9xnbAZoBS5LlUX0q-zxT_3m6gEZpyB2k51_U4LLMNs="
            alt="game image">
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
                <p class="register-head">Register</p>
                <form action="/sendAuthentication" method="post">
                    <input type="text" id="firstName" name="firstName" placeholder="First Name" required>
                    <br>
                    <input type="text" id="lastName" name="lastName" placeholder="Last Name" required>
                    <br>
                    <input type="email" id="email" name="email" placeholder="Email Address" required>
                    <br>
                    <input type="tel" id="mobile" name="mobile" placeholder="Mobile Number" maxlength="10" required>
                    <br>
                    <input type="password" id="password" name="password" placeholder="Set Password" required>
                    <br>
                    <button id="nextButton" type="submit">Register</button>
                </form>
                <p class="login-link"><a href="/login">Login</a></p>
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
	<!-- <script src="js/registration.js"></script> -->
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.marquee.min.js"></script>
	<script src="js/main.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    </body>
</html>