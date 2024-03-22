<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

		<!DOCTYPE html>
		<html>

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
			<link rel="stylesheet" href="../css/bootstrap.min.css" />
			<link rel="stylesheet" href="../css/font-awesome.min.css" />
			<link rel="stylesheet" href="../css/owl.carousel.css" />
			<link rel="stylesheet" href="../css/style.css" />
			<link rel="stylesheet" href="../css/animate.css" />
			<link rel="stylesheet" href="../css/login.css" />
			<link rel="stylesheet" href="css/deposit.css">
			<link rel="stylesheet" href="css/error-container.css">
			<!-- livechat style -->
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
			<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
			<link rel="stylesheet" href="css/responsive.css"/>
			<!-- Font Awesome kit -->
			<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>
		</head>

		<body>
			<!-- Page Preloder -->
			<!-- <div id="preloder">
				<div class="loader"></div>
			</div> -->
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
									<li><a href="fetchAllWithdrawRequest">Withdraw Request</a></li>
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
					<table id="example" class="table table-striped table-responsive border-dark table-hover text-center text-capitalize">
							<thead class="table-dark table-active text-uppercase text-whites">
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
						<c:forEach items="${createIdRequests}" var="idRequest">
							<tbody>
								<tr>
									<td>${idRequest.website}</td>
									<td>
										<div>
											<img style="height: 40px; width: 50px;" src="${idRequest.logo }"
												alt="${idRequest.websiteName }" />
											${idRequest.websiteName}
										</div>
									</td>
									<td>${idRequest.expectedUsername}</td>
									<form action="submitUsernameAndPassword" method="post">
										<td>
											<input style="background-color: lightgreen;" type="text" placeholder="Enter the username" name="username" required/>
										</td>
										<td>
											<input style="background-color: lightgreen;" type="text" placeholder="Enter the password" name="password" required/>
											<input type="hidden" value="${idRequest.id}" name="id" />
										</td>
										<td>
											${idRequest.amount}
										</td>
										<td>
											<input style="background-color: red;" type="submit" value="Submit" />
										</td>
									</form>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</c:when>
				<c:otherwise>
					<img class="blankpage"
						src="https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg?w=740&t=st=1705560867~exp=1705561467~hmac=5dc60af5ded74c5bdc9f93cf0948faa6be2f2aea0070995a7a3867d8ffc515ed"
						alt="Not found or something went wrong" class="empty" />
					<p style="text-align: center;">Request(s) not found!</p>
				</c:otherwise>
			</c:choose>


			<!-- Footer section -->
			<footer class="footer-section">
				<div class="container">
					<ul class="footer-menu">
						<li><a href="adminDashboard">Dashboard</a></li>
						<li><a href="fetchDepositRequest">Deposit Request</a></li>
						<li><a href="fetchCreateId">Create Id Request</a></li>
						<li><a href="fetchGames">Update Game website</a></li>
						<li><a href="fetchAllUpi">Payment method updation</a></li>
						<li><a href="adminLogout">Logout</a></li>
					</ul>
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