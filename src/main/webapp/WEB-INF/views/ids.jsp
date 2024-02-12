<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<p%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
			<link rel="stylesheet" href="css/error-container.css" />
			<link rel="stylesheet" href="css/profile.css">
			<link rel="stylesheet" href="css/ids.css">
			<!-- livechat style -->
			<link rel="stylesheet" href="css/livechat.css" />
			<!-- Font Awesome kit -->
			<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>


			<style>
				.mainBox {
					width: 900px;
					padding: 20px;
					background-color: #e0e0e0;
					transition: height 6.5s ease;
					/* Smooth transition */
					overflow: hidden;
					position: relative;
				}

				.contain {
					display: flex;
					justify-content: space-between;
				}

				.contains {
					display: flex;
				}

				.arrow {
					bottom: 10px;
					right: 10px;
					cursor: pointer;
				}

				.dataBox {
					display: none;
					margin-top: 10px;
					padding: 10px;
					background-color: #f5f5f5;
					transition: height 6.5s ease;
					/* Smooth transition */
				}

				.contain-heading {
					width: 80%;
					margin: 0 auto;
					overflow: hidden;
					/* Clearfix to contain floated elements */
				}

				.left-align {
					float: left;
				}

				.right-align {
					float: right;
				}

				.contain-data {
					display: flex;
					justify-content: space-between;
					padding: 2% 10% 0% 10%;
					margin: 0 auto;
				}

				.left-paragraph,
				.right-paragraph {
					width: 48%;
				}

				.right-paragraph {
					text-align: right;
				}
			</style>

			<script>
				// Function to show content for Button 1
				function showContent1() {
					document.getElementById('content1').style.display = 'block';
					document.getElementById('content2').style.display = 'none';
				}

				// Function to show content for Button 2
				function showContent2() {
					document.getElementById('content1').style.display = 'none';
					document.getElementById('content2').style.display = 'block';
				}
			</script>


		</head>

		<body>
			<!-- Page Preloder -->
			<div id="preloder">
				<div class="loader"></div>
			</div>
			<c:if test="${empty userId}">
				<c:if test="${not pageContext.response.isCommitted()}">
					<% response.sendRedirect("login"); %>
				</c:if>
			</c:if>

			<c:if test="${empty idDetails}">
				<c:if test="${not pageContext.response.isCommitted()}">
					<% response.sendRedirect("fetchIdDetails"); %>
				</c:if>
			</c:if>
			<!-- Header section -->
			<header class="header-section" style="padding: 10px;">
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
											<div class="user-panel">
												<a href="login">Login</a> / <a href="registration">Register</a>
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

			<!-- Live chat -->

			<div class="button-container">
				<div id="button1">
					<button onclick="showContent1()">Button 1</button>
				</div>
				<div id="button2">
					<button onclick="showContent2()">Button 2</button>
				</div>
			</div>

			<section class=ids_data style="flex: 1; padding: 14%;">
				<div id="content1" class="content">
					<!-- Add more content as needed for Button 1 -->

					<c:if test="${not empty errorMessage}">
						<div class="errorContainer">${errorMessage}</div>
						<% session.removeAttribute("errorMessage"); %>
					</c:if>
					<c:if test="${not empty message}">
						<div class="errorContainer">${message}</div>
						<% session.removeAttribute("message"); %>
					</c:if>
					<div class="container-myId">
						<div class="table_heading">
							<p id="ha">Website Name</p>
							<p id="hb">Username</p>
							<p id="hc">Password</p>
							<p id="hc">Status</p>
							<p id="hc">Link</p>

						</div>
						<c:forEach items="${myIds}" var="id">
							<div class="card-myId">
								<c:choose>
									<c:when test="${id.status}">

										<hr style="border: 1px solid rgb(75, 31, 31);">

										<div class="table_data">

											<p><img id="logo_image" src="${id.logo}" alt="${id.websiteName}" />
												${id.websiteName }</p>
											<p>${id.username}</p>
											<p>${id.password}</p>
											<p>Active</p>
											<p><a href="${id.website}" target="_blank"><i
														class="fa-solid fa-arrow-up-right-from-square"></i></a></p>
										</div>
									</c:when>
									<c:otherwise>

										<hr style="border: 1px solid rgb(75, 31, 31);">

										<div class="table_data">

											<img id="logo_image" src="${id.logo}" alt="${id.websiteName}" />
											<p>null</p>
											<p>null</p>
											<p>Pending</p>
											<p><a href="${id.website}" target="_blank"><i
														class="fa-solid fa-arrow-up-right-from-square"></i></a></p>
										</div>
									</c:otherwise>
								</c:choose>
							</div>
						</c:forEach>
					</div>
				</div>
				<% int index=0; %>
				<div id="content2" class="content">
					<c:forEach items="${games}" var="game">
						<div class="mainBox" id="mainBox">
							<div class="contain">
								<div class="contains">
									<img style="height: 50px;" id="logo_image2" src="${game.logo }"
										alt="${game.websiteName}" />
									<div style="margin-left: 2%;">
										${game.websiteName} <br>
										${game.website}
									</div>
								</div>
								<div>
									<form action="fetchGame" method="post" id="create_button">
										<button style="border-radius: 10%;">Create ID</button>
										<input type="hidden" name="gameId" value="${game.id}">
										<div class="arrow" onclick="toggleBox(<%= index %>)"><i class="fa-solid fa-angle-down"></i>
										</div>
										<% index++;%>
									</form>
								</div>
							</div>
							<div class="dataBox" id="dataBox">
								<div>
									<div class="contain-heading">
										<h6 class="left-align">Min Bet</h6>
										<h6 class="right-align"><i class="fa-solid fa-coins"></i></h6>
									</div>
									<c:forEach items="${game.gameName}" var="gameVarient">
										<div class="contain-data">
											<p class="left-paragraph">${gameVarient}</p>
											<p class="right-paragraph">100</p>
										</div>
									</c:forEach>

								</div>
							</div>
						</div>
					</c:forEach>
				</div>

					<script>
						function toggleBox(index) {
							console.log(index);
							var mainBox = document.getElementsByClassName("mainBox")[index];
							var dataBox = document.getElementsByClassName("dataBox")[index];

							if (dataBox.style.display === "none" || dataBox.style.display === "") {
								// mainBox.style.height = "200px"; /* Adjust the height as needed */
								dataBox.style.display = "block";
							} else {
								mainBox.style.height = "auto"; /* Reset to auto height */
								dataBox.style.display = "none";
							}
						}

					</script>
			</section>

			<!-- Footer section -->
			<footer class="footer-section" style="padding: 10px;">
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