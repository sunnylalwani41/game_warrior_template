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
			<link rel="stylesheet" href="css/responsive.css"/>
			<!-- Font Awesome kit -->
			<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>


			<style>
				.mainBox {
					width: 80vw;
					padding: 20px;
					background-color: #e0e0e0;
					transition: height 6.5s ease;
					/* Smooth transition */
					overflow: hidden;
					overflow-x: auto;
					margin-top: 15px;
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
					document.querySelector("#button1>button").style.backgroundColor = 'red';
					document.querySelector("#button2>button").style.backgroundColor = 'blue';
				}

				// Function to show content for Button 2
				function showContent2() {
					document.getElementById('content1').style.display = 'none';
					document.getElementById('content2').style.display = 'flex';
					document.getElementById('content2').style.flexDirection = 'column';
					document.getElementById('content2').style.alignItems = 'center';
					document.querySelector("#button1 > button").style.backgroundColor = 'blue';
					document.querySelector("#button2 > button").style.backgroundColor = 'red';
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

			<!-- Live chat -->

			<div class="button-container">
				<div id="button1">
					<button class="btn btn-primary" onclick="showContent1()">My Id</button>
				</div>
				<div id="button2">
					<button class="btn btn-primary" onclick="showContent2()">Create Id for games</button>
				</div>
			</div>

			<section class=ids_data style="flex: 1; padding: 4%; justify-content: center;">
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
						<div class="container-createId">
				<table class="table table-responsive">
					<thead>
						<tr>
							<th>Website Name</th>
							<th>Username</th>
							<th>Password</th>
							<th>Status</th>
							<th>Links</th>
						</tr>
					</thead>
					<c:forEach items="${myIds}" var="id">
						<tbody>
							<c:choose>
								<c:when test="${id.status}">
							<tr>
								<td style="width: 10%;"><img id="logo_image" src="${id.logo}" alt="${id.websiteName}" /> ${id.websiteName }</td>
								<td>${id.username}</td>
								<td>${id.password}</td>
								<td>
									Active
								</td>
								<td><a href="${id.website}" target="_blank"><i class="fa-solid fa-arrow-up-right-from-square"></i></a></td>
							</tr>
							</c:when>
							<c:otherwise>
							<tr>
								<td style="width: 10%;"><img id="logo_image" src="${id.logo}" alt="${id.websiteName}" /> ${id.websiteName }</td>
								<td>null</td>
								<td>null</td>
								<td>	
									Pending
								</td>
								<td>
								<a href="${id.website}" target="_blank"><i
class="fa-solid fa-arrow-up-right-from-square"></i></a></td>
							</tr>
							</c:otherwise>
							</c:choose>
						</tbody>
					</c:forEach>
				</table>
			</div>
					
					
					
					
						
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
								mainBox.style.height = "auto";
								mainBox.style.justifyContent="center"/* Reset to auto height */
								dataBox.style.display = "none";
							}
						}

					</script>
			</section>

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
					</>
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