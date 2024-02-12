<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<!-- <p%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> -->
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

		<style>
			.depositBody {
				font-family: 'Arial', sans-serif;
				background-color: #f8f8f8;
				margin: 0;
				padding: 0;
				justify-content: center;
				align-items: center;
				height: 50vh;
			}
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
		<title>Stylish Table</title>
	</head>

	<body>

		<header class="header-section" style="padding: 10px;">
			<div class="container">
				<!-- logo -->
				<a class="site-logo" href="/">
					<img src="img/logo.png" alt="">
				</a>

				<div class="user-panel">
					<a href="profile">Profile</a>
				</div>
				<!-- responsive -->
				<div class="nav-switch">
					<i class="fa fa-bars"></i>
				</div>
				<!-- site menu -->
				<nav class="main-menu">
					<ul>
						<li><a href="/">Home</a></li>
						<li><a href="review">Games</a></li>
						<li><a href="contact">Contact</a></li>
					</ul>
				</nav>
			</div>
		</header>

		<c:if test="${not empty errorMessage}">
			<div class="errorContainer">${errorMessage}</div>
			<% session.removeAttribute("errorMessage"); %>
		</c:if>
		<c:if test="${not empty message}">
			<div class="errorContainer">${message}</div>
			<% session.removeAttribute("message"); %>
		</c:if>

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
			</c:choose>
		</div>
	</body>
	</html>