<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<!DOCTYPE html>
		<html>

		<head>
			<title>Game Warrior Template</title>
			<meta charset="UTF-8">
			<meta name="description" content="Game Warrior Template">
			<meta name="keywords" content="warrior, game, creative, html">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<!-- Favicon -->
			<link href="img/favicon.ico" rel="shortcut icon" />
			<!-- Google Fonts -->
			<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i" rel="stylesheet">

			<!-- Stylesheets -->
			<link rel="stylesheet" href="css/bootstrap.min.css" />
			<link rel="stylesheet" href="css/font-awesome.min.css" />
			<link rel="stylesheet" href="css/owl.carousel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/animate.css" />
			<link rel="stylesheet" href="css/login.css" />
			<link rel="stylesheet" href="css/ids.css" />
			<!-- livechat style -->
			<link rel="stylesheet" href="css/livechat.css" />
			<link rel="stylesheet" href="css/responsive.css"/>
			<!-- Font Awesome kit -->
			<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>

			<!--[if lt IE 9]>
	  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
		</head>

		<body>
			<!-- Page Preloder -->
			<div id="preloder">
				<div class="loader"></div>
			</div>
			<c:if test="${empty userId}">
				<% session.setAttribute("errorMessage", "Invalid User! please login" ); response.sendRedirect("login");
					%>
			</c:if>
			<c:if test="${empty requestScope.game}">
				<% response.sendRedirect("ids"); %>
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
			
			<div id="create_container">
				<!-- Header section end -->
				<img id="logo_image" src="${requestScope.game.logo }" alt="${requestScope.game.websiteName}" />
				<p>${requestScope.game.websiteName}</p>
				<p style="margin-top: -1.5%;">${requestScope.game.website}</p>
			</div>
			<div>
				<div>
					<p class="text1"></p>
					<p class="text2">Min Withdrawal</p>
				</div>
				<div>
					<p class="text1">Min refill</p>
					<p class="text2">${requestScope.game.minimumWithdrawal}</p>
				</div>
				<div>
					<p class="text1">${requestScope.game.minimumBet}</p>
					<p class="text2">Max Withdrawal</p>
				</div>
				<div>
					<p class="text1">Min Maintaining Bal</p>
					<p class="text2">${requestScope.game.maximumWithrawal}</p>
				</div>
				<div>
					<p class="text1">${requestScope.game.minimumMaintainingBalance}</p>
				</div>
			</div>

			<form action="processCreateId" method="post">
				<p class="text1">Proposal Username *</p>
				<input style="margin-top: -20%; width: 40%;" type="text" placeholder="Enter Username" name="username" class="text1" require /> <br> <br>
				<p class="text1">Coins* (Minimum deposit amount is ${requestScope.game.minimumBet} coins)</p>
				<input style="margin-top: -20%; width: 40%;"  type="number" placeholder="Deposit Money" value="${requestScope.game.minimumBet}" class="text1" name="amount"
					require />
				<input type="hidden" name="gameId" value="${requestScope.game.id}" /> <br> <br>
				<input class="text3" type="submit" value="Continue to Pay">
			</form>
			</div>
			<!-- Footer section -->
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
			
			<!-- Footer section end -->


			<!--====== Javascripts & Jquery ======-->
			<script src="js/jquery-3.2.1.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/owl.carousel.min.js"></script>
			<script src="js/jquery.marquee.min.js"></script>
			<script src="js/main.js"></script>
			<script src="js/login.js"></script>
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

		</body>

		</html>