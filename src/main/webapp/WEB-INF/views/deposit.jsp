<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<p%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
		<!DOCTYPE html>
		<html lang="zxx">

		<head>
			<title>Game Warrior Template</title>
			<meta charset="UTF-8">
			<meta name="description" content="Game Warrior Template">
			<meta name="keywords" content="warrior, game, creative, html">
			<meta name="viewport" content="width=device-width, initial-scale=1.0">
			<!-- Favicon -->
			<link href="../static/img/favicon.ico" rel="shortcut icon" />

			<!-- Google Fonts -->
			<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i" rel="stylesheet">

			<!-- Stylesheets -->
			<link rel="stylesheet" href="css/bootstrap.min.css" />
			<link rel="stylesheet" href="css/font-awesome.min.css" />
			<link rel="stylesheet" href="css/owl.carousel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/animate.css" />
			<link rel="stylesheet" href="css/deposit.css">
			<link rel="stylesheet" href="css/error-container.css" />
			<link rel="stylesheet" href="css/empty.css">
			<link rel="stylesheet" href="css/responsive.css"/>
			
			
			<style>
			/* .depositBody {
				font-family: 'Arial', sans-serif;
				background-color: #f8f8f8;
				margin: 0;
				padding: 0;
				justify-content: center;
				align-items: center;
				height: 75vh;
			} */

			.uploadForm {
				padding-bottom: 20%;
			}

			table {
				width: 80%;
				border-collapse: collapse;
				margin: 40px 130px;
				box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
				background-color: #fff;
				border-radius: 8px;
				overflow: hidden;
			}

			th,
			td {
				padding: 15px;
				text-align: left;
				border-bottom: 1px solid #ddd;
			}

			th {
				background-color: #3498db;
				color: #fff;
			}

			tr:nth-child(even) {
				background-color: #f2f2f2;
			}

			tr:hover {
				background-color: #e0e0e0;
			}
		</style>
		</head>

		<body class="body">
			<!-- Page Preloder -->
			<div id="preloder">
				<div class="loader"></div>
			</div>
			<c:if test="${empty userId}">
			    <c:if test="${not pageContext.response.isCommitted()}">
			        <%
			            response.sendRedirect("login");
			        %>
			    </c:if>
			</c:if>
			
			<c:if test="${empty fetchUpiDetails}">
			    <c:if test="${not pageContext.response.isCommitted()}">
			        <%
			            response.sendRedirect("fetchUpiDetails");
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
			<c:if test="${not empty errorMessage}">
				<div class="errorContainer">${errorMessage}</div>
				<% session.removeAttribute("errorMessage"); %>
			</c:if>
			<c:if test="${not empty message}">
				<div class="errorContainer">${message}</div>
				<% session.removeAttribute("message"); %>
			</c:if>
			<!-- Hero section -->
			<div class="depositBody">
			<c:choose>
				<c:when test="${not empty upiDetails}">
					<table>
						<thead>
							<tr>
								<th>Mode</th>
								<th>Display Name</th>
								<th>Upi Detail</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${upiDetails}" var="upi">
								<tr>
									<td>
										<input type="radio" class="upi" name="upi" value="${upi.id}"
											onclick="showFileInput()">
									</td>
									<td>
										<img class="upi_image" src="${upi.img}" alt="Upi Logo" />
										${upi.displayName}
									</td>
									<td>${upi.upiId}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div>
						<form id="uploadForm" action="/upload" method="post" enctype="multipart/form-data">
							<input type="file" id="fileInput" name="file" required>
							<input type="hidden" id="selectedUpiId" name="selectedUpiId" value="">
							<br>
							<input type="submit" value="Upload Payment Screenshot" name="upload" id="upload"> <br> <br>
							<script>
								function showFileInput() {
									var fileInput = document.getElementById('fileInput');
									fileInput.style.display = 'block';

									var upload = document.getElementById('upload');
									upload.style.display = 'block';

									var selectedUpiId = document.querySelector('input[name="upi"]:checked').value;
									document.getElementById('selectedUpiId').value = selectedUpiId;
								}
							</script>
						</form>
					</div>
				</c:when>
				<c:otherwise>
				<img class="blankpage" src="https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg?w=740&t=st=1705560867~exp=1705561467~hmac=5dc60af5ded74c5bdc9f93cf0948faa6be2f2aea0070995a7a3867d8ffc515ed"
					alt="Not found or something went wrong" class="emptyBox" />
			</c:otherwise>
			</c:choose>
		</div>
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
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
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