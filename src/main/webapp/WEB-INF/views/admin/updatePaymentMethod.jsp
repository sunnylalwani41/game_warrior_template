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
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

			<!-- Stylesheets -->
			<link rel="stylesheet" href="css/bootstrap.min.css" />
			<link rel="stylesheet" href="css/font-awesome.min.css" />
			<link rel="stylesheet" href="css/owl.carousel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/animate.css" />
			<link rel="stylesheet" href="css/login.css" />
			<link rel="stylesheet" href="css/admin-login.css">
			<link rel="stylesheet" href="css/deposit.css">
			<link rel="stylesheet" href="css/error-container.css"/>
			<!-- livechat style -->
			<link rel="stylesheet" href="css/livechat.css" />
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
			<form action="updateUpi" method="post" class="updatePaymentMethod">
				
				<label for="upiId">Enter UPI ID:</label>
				<input type="text" name="upiId" placeholder="Enter the upiId" required/> 
				<label for="img">Enter Image Link:</label>
				<input type="text" name="img" placeholder="Enter the Image link" required/> 
				<label for="displayName">Enter Display Name:</label>
				<input type="text" name="displayName" placeholder="Enter the Display Name" required/>
				<input id="submit" type="submit" value="Submit" />
			</form>

			<div class="deposit_entry" style="flex: 1; padding: 140px;">
				<c:choose>
					<c:when test="${not empty upiDetails}">
						<div class="table_heading">
							<p id="ha"></p>
							<p id="hb">Display Name</p>
							<p id="hc">Upi Details</p>
						</div>
						<hr style="border: 1px solid rgb(75, 31, 31);">
						<div>
							<c:forEach items="${upiDetails}" var="upi">
								<label class="data_entry">
									<form action="deleteUpi" method="post">
										<input type="hidden" name="id" value="${upi.id}" />
										<input class="deleteUpi" type="submit" value="Delete" />
									</form>
									<div style="display: flex;">
										<img class="upi_image" src="${upi.img}" alt="Upi Logo" />
										<p>${upi.displayName}</p>
									</div>
									<p>${upi.upiId}</p>
								</label>
							</c:forEach>
						</div>
					</c:when>
					<c:otherwise>
						<div class="center">
							<h2>Data Not Available</h2>
						<img id="box-image" src="https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg?w=740&t=st=1705560867~exp=1705561467~hmac=5dc60af5ded74c5bdc9f93cf0948faa6be2f2aea0070995a7a3867d8ffc515ed"
							alt="Not found or something went wrong" class="emptyBox" />
						</div>
					</c:otherwise>
				</c:choose>
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