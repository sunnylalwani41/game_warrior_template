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
    <link href="img/favicon.png" rel="shortcut icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i" rel="stylesheet">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <link rel="stylesheet" href="css/font-awesome.min.css"/>
    <link rel="stylesheet" href="css/owl.carousel.css"/>
    <link rel="stylesheet" href="css/style.css"/>
    <link rel="stylesheet" href="css/animate.css"/>
    <link rel="stylesheet" href="css/deposit.css">
	<link rel="stylesheet" href="css/error-container.css"/>
	<link rel="stylesheet" href="css/responsive.css"/>
	<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
			<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
	<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<c:if test="${empty userId}">
	<%
		response.sendRedirect("login");
	%>
</c:if>

<c:if test="${empty notification}">
	<%
		response.sendRedirect("notification");
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
													<a href="#"><i class="fa-solid fa-wallet" style="color: black"> : </i>${balance}</a>
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

							<div class="personaldetails">
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
<!-- Hero section -->
<section class="upi-section">
	<c:choose>
		<c:when test="${not empty notificationDetails}">
			<h1 class="text-center text-white p2 bg-dark bg-gradient text-uppercase">Pending Deposit Request</h1>
						<div class="container">
						<table id="example" class="table table-striped table-responsive border-dark table-hover text-capitalize">
							<thead class="table-dark table-active text-uppercase text-whites">
					<tr>
						<td>S.No.</td>
						<td>Subject</td>
						<td>Message</td>
						<td>Timestamp</td>
					</tr>
				</thead>
				<tbody>
					<%	
						int i=1;
					%>
					<c:forEach items="${notificationDetails}" var="notification">
						<tr>
							<td>
								<%= i++ %>
							</td>
							<td>
								${notification.subject}
							<td>
								${notification.message}
							</td>
							<td>
								${notification.timestamp}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
		</c:when>
		<c:otherwise>
			<img src="https://i.pinimg.com/originals/f3/8b/24/f38b24a996391f4a0d78819f028c7926.gif" alt="Not found or something went wrong" class="empty"/>
			<p>Notification Detail(s) not available!</p>
		</c:otherwise>
	</c:choose>
<%
	session.removeAttribute("notification");
%>
</section>
<!-- Hero section end -->

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
		</p>
	</div>
</footer>
<!-- Footer section end -->


<!--====== Javascripts & Jquery ======-->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.marquee.min.js"></script>
<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>
</html>