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
			<link rel="stylesheet" href="../css/bootstrap.min.css" />
			<link rel="stylesheet" href="../css/font-awesome.min.css" />
			<link rel="stylesheet" href="../css/owl.carousel.css" />
			<link rel="stylesheet" href="../css/style.css" />
			<link rel="stylesheet" href="../css/animate.css" />
			<link rel="stylesheet" href="../css/login.css" />
			<link rel="stylesheet" href="css/deposit.css">
			<link rel="stylesheet" href="css/error-container.css">
			<!-- livechat style -->
			<link rel="stylesheet" href="../css/livechat.css" />
			<!-- Font Awesome kit -->
			<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>
		</head>

		<body>
			<!-- Page Preloder -->
			<div id="preloder">
				<div class="loader"></div>
			</div>
			<c:if test="${empty adminId}">
				<% session.setAttribute("errorMessage", "Unauthorized!" ); response.sendRedirect("admin-login"); %>
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
			<c:if test="${not empty errorMessage}">
				<div class="errorContainer">${errorMessage}</div>
				<% session.removeAttribute("errorMessage"); %>
			</c:if>
			<c:if test="${not empty message}">
				<div class="errorContainer">${message}</div>
				<% session.removeAttribute("message"); %>
			</c:if>

			<c:choose>
				<c:when test="${not empty createIdRequests}">
					<c:forEach items="${createIdRequests}" var="idRequest">
						<table class="IdTable">
							<thead>
								<tr>
									<td>Website</td>
									<td>Website Name</td>
									<td>Require Username</td>
									<td>Generated username</td>
									<td>Generated password</td>
									<td>Deposit Amount</td>
									<td>Submit</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${idRequest.website}</td>
									<td>
										<div>
											<img style="height: 40px; width: 50px;" src="${idRequest.logo }" alt="${idRequest.websiteName }" />
											${idRequest.websiteName}
										</div>
									</td>
									<td>${idRequest.expectedUsername}</td>
									<form action="submitUsernameAndPassword" method="post">
										<td>
											<input type="text" placeholder="Enter the username" name="username" />
										</td>
										<td>
											<input type="text" placeholder="Enter the password" name="password" />
											<input type="hidden" value="${idRequest.id}" name="id" />
										</td>
										<td>
											${idRequest.amount}
										</td>
										<td>
											<input type="submit" value="Submit" />
										</td>
									</form>
								</tr>
							</tbody>
						</table>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<img class="blankpage"
						src="https://i.pinimg.com/originals/f3/8b/24/f38b24a996391f4a0d78819f028c7926.gif"
						alt="Not found or something went wrong" class="empty" />
					<p style="text-align: center;">Request(s) not found!</p>
				</c:otherwise>
			</c:choose>


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
			<script src="../js/jquery-3.2.1.min.js"></script>
			<script src="../js/bootstrap.min.js"></script>
			<script src="../js/owl.carousel.min.js"></script>
			<script src="../js/jquery.marquee.min.js"></script>
			<script src="../js/main.js"></script>
			<script src="../js/login.js"></script>
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
			<script type="text/javascript">
				(function () { var script = document.createElement("script"); script.type = "text/javascript"; script.async = true; script.src = "//telegram.im/widget-button/index.php?id=@digitaladdworld"; document.getElementsByTagName("head")[0].appendChild(script); })();
			</script>
		</body>

		</html>