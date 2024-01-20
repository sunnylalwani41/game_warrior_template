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
		        <%
		        	session.setAttribute("errorMessage", "Unauthorized!");
		            response.sendRedirect("admin-login");
		        %>
			</c:if>
			
			<!-- Header section -->
			<header class="header-section">
				<div class="container">
					<!-- logo -->
					<a class="site-logo" href="adminDashboard">
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
									<li><a href="fetchDepositRequest">Deposit Request</a></li>
									<li><a href="fetchCreateId">Create Id Request</a></li>
									<li><a href="fetchGames">Update Game website</a></li>
									<li><a href="fetchAllUpi">Payment method updation</a></li>
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
			<c:if test="${not empty depositRequests}">
				<fieldset>
					<legend>Pending Deposit Request</legend>
					<c:forEach items="${depositRequests}" var="pendingRequest">
						<c:if test="${not pendingRequest.status }">
							<p>${pendingRequest.userId }</p>
							<p>${pendingRequest.upiId }</p>
							<p>${pendingRequest.upiName}</p>
							<img src="${pendingRequest.path}" alt="${pendingRequest.userId }">
							<form action="approveTheDepositRequest" method="post">
								<input type="hidden" name="id" value="${pendingRequest.id }" />
								<input type=number name="amount" placeholder="Amount" require>
								<input type="submit" value="Approve">
							</form>
							<form action="rejectTheDepositRequest" method="post">
								<input type="hidden" name="id" value="${pendingRequest.id }" />
								<input type=text name="remark" placeholder="Reject Reason" require>
								<input type="submit" value="Reject">
							</form>
						</c:if>
					</c:forEach>
				</fieldset>
				<fieldset>
					<legend>Completed Deposit Request</legend>
					<c:forEach items="${depositRequests}" var="completeRequest">
						<c:if test="${completeRequest.status }">
							<p>${completeRequest.userId }</p>
							<p>${completeRequest.upiId }</p>
							<p>${completeRequest.upiName}</p>
							<img src="${completeRequest.path}" alt="${completeRequest.userId }">
							<p>${completeRequest.remark}</p>
							<c:choose>
								<c:when test="${not empty completeRequest.amount }">
									<p>${completeRequest.amount}</p>
									<p>Approved</p>
								</c:when>
								<c:otherwise>
									<p>Null</p>
									<p>Rejected</p>
								</c:otherwise>
							</c:choose>
						</c:if>
					</c:forEach>
				</fieldset>
			</c:if>
			
			

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