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
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/animate.css"/>
	<link rel="stylesheet" href="css/login.css"/>
	<!-- livechat style -->
	<link rel="stylesheet" href="css/livechat.css"/>
	<!-- Font Awesome kit -->
	<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>
</head>
		<body>
			<!-- Page Preloder -->
			<div id="preloder">
				<div class="loader"></div>
			</div>
			<c:if test="${empty adminId}">
			    <c:if test="${not pageContext.response.isCommitted()}">
			        <%
			        	session.setAttribute("errorMessage", "Unauthorized!");
			            response.sendRedirect("admin-login");
			        %>
			    </c:if>
			</c:if>
			
			<c:if test="${empty requestScope.fetchGames}">
			    <c:if test="${not pageContext.response.isCommitted()}">
			        <%
			            response.sendRedirect("fetchGames");
			        %>
			    </c:if>
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
									<li><a href="adminDashboard">Dashboard</a></li>
									<li><a href="depositRequest">Deposit Request</a></li>
									<li><a href="createIdRequest">Create Id Request</a></li>
									<li><a href="updateGameWebsite">Update Game website</a></li>
									<li><a href="updatePaymentMethod">Payment method updation</a></li>
									<li><a href="adminLogout">Logout</a></li>
								</ul>
							</div>
						</div>
					</nav>
				</div>
			</header>
			<!-- Header section end -->

			<!-- Live chat -->
			<div class="livechat_float">
				<img alt="livechat" src="img/clogo.png">
			</div>
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
			<form action="updateGame" method="post">
				<input type="text" name="websiteName" placeholder="Enter the Website name" required/>
				<input type="text" name="website" placeholder="Enter the Website link" required/>
				<input type="text" name="logo" placeholder="Enter the Website logo" required/>
				<input type="number" name="minimumBet" placeholder="Enter the Minimum Bet" required/>
				<input type="number" name="minimumWithdrawal" placeholder="Enter the Minimum Withdrawal" required/>
				<input type="number" name="minimumMaintainingBalance" placeholder="Enter the Minimum Maintaining Balance" required/>
				<input type="number" name="maximumWithrawal" placeholder="Enter the Maximum Withrawal" required/>
				<div class="addGame-container"></div>
				<button onclick="addGame(event)">Add Game name</button>
				<input type="submit" value="Submit" />
			</form>
			
			<div class="container-createId">
					<c:forEach items="${games}" var="game">
						<div class="card-createId">
							<div><img src="${game.logo}" alt="${game.websiteName}"/></div>
							<div><p>${game.websiteName}</p><p>${game.website}</p></div>
							<div>
								<form action="deleteGame" method="post">
									<button>Delete Game</button>
									<input type="hidden" name="gameId" value="${game.id}">
								</form>
								<div class="arrow-createId"><i class="fa-solid fa-angle-down"></i></div>
							</div>
						</div>
						<div class="miniCard-createId">
							<p>Min Bet</p> <p><i class="fa-solid fa-coins"></i></p>
							<c:forEach items="${game.gameName}" var="gameVarient">
								<p>${gameVarient}</p><p>100</p>
							</c:forEach>
						</div>
					</c:forEach>
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
	<script src="../js/updateGameWebsite.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	</body>
</html>