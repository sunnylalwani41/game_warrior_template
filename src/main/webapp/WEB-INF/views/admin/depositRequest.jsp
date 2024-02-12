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
			<link rel="stylesheet" href="css/admin-login.css">
			<link rel="stylesheet" href="css/deposit.css">
			<!-- livechat style -->
			<link rel="stylesheet" href="css/responsive.css"/>
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
			<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
			<!-- Font Awesome kit -->
			<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>
			<script src="https://code.jquery.com/jquery-3.7.0.js" crossorigin="anonymous"></script>
			<script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"
				crossorigin="anonymous"></script>
			<script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"
				crossorigin="anonymous"></script>
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
			<div>
				<c:if test="${not empty errorMessage}">
					<div class="errorContainer">${errorMessage}</div>
					<% session.removeAttribute("errorMessage"); %>
				</c:if>
				<c:if test="${not empty message}">
					<div class="errorContainer">${message}</div>
					<% session.removeAttribute("message"); %>
				</c:if>
			</div>

			<div class="drequest">
				<c:if test="${not empty depositRequests}">
					<fieldset>
						<table id="example" class="table table-striped" style="width:100%">
							<thead>
								<tr>
									<th>USER ID</th>
									<th>UPI ID</th>
									<th>Display Name</th>
									<th>Payment Screenshot</th>
									<th>Approve</th>
									<th>Reject</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${depositRequests}" var="pendingRequest">
									<c:if test="${not pendingRequest.status }">
										<tr>
											<td>${pendingRequest.userId }</td>
											<td>${pendingRequest.upiId }</td>
											<td>${pendingRequest.upiName}</td>
											<td><img class="image-container" src="${pendingRequest.path}"
													alt="${pendingRequest.userId }"></td>
											<td>
												<form action="approveTheDepositRequest" method="post">
													<input type="hidden" name="id" value="${pendingRequest.id }" />
													<input type=number name="amount" placeholder="Amount" require>
													<input type="submit" value="Approve">
												</form>
											</td>
											<td>
												<form action="rejectTheDepositRequest" method="post">
													<input type="hidden" name="id" value="${pendingRequest.id }" />
													<input type=text name="remark" placeholder="Reject Reason" require>
													<input type="submit" value="Reject">
												</form>
											</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</fieldset>
					<fieldset>
						<table id="example" class="table table-striped" style="width:100%">
							<thead>
								<tr>
									<th>USER ID</th>
									<th>UPI ID</th>
									<th>Display Name</th>
									<th>Payment Screenshot</th>
									<th>Remark</th>
									<th>Amount</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${depositRequests}" var="completeRequest">
									<c:if test="${completeRequest.status }">

										<tr>
											<td>${completeRequest.userId }</td>
											<td>${completeRequest.upiId }</td>
											<td>${completeRequest.upiName}</td>
											<td><img class="image-container" src="${completeRequest.path}"
													alt="${completeRequest.userId }"></td>
											<td>${completeRequest.remark}</td>
											<c:choose>
												<c:when test="${not empty completeRequest.amount }">
													<td>${completeRequest.amount}</td>
													<td>Approved</td>
												</c:when>
												<c:otherwise>
													<td>Null</td>
													<td>Rejected</td>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
					</fieldset>
				</c:if>
			</div>

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
			<script src="js/jquery-3.2.1.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/owl.carousel.min.js"></script>
			<script src="js/jquery.marquee.min.js"></script>
			<script src="js/main.js"></script>
			<script src="js/login.js"></script>
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		</body>

		</html>