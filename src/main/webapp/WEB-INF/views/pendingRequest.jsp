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
			<link rel="stylesheet" href="css/deposit.css">
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
			<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
			

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
					document.getElementById('content3').style.display = 'none';
					document.querySelector("#button1>button").style.backgroundColor = 'white';
					document.querySelector("#button2>button").style.backgroundColor = 'black';
					document.querySelector("#button2>button").style.color= 'white';
					document.querySelector("#button3>button").style.backgroundColor = 'black';
					document.querySelector("#button3>button").style.color= 'white';
					document.querySelector("#button1>button").style.color = 'black';
				}

				// Function to show content for Button 2
				function showContent2() {
					document.getElementById('content1').style.display = 'none';
					document.getElementById('content3').style.display = 'none';
					document.getElementById('content2').style.display = 'flex';
					document.getElementById('content2').style.flexDirection = 'column';
					document.getElementById('content2').style.alignItems = 'center';
					document.querySelector("#button1 > button").style.backgroundColor = 'black';
					document.querySelector("#button3 > button").style.backgroundColor = 'black';
					document.querySelector("#button2 > button").style.backgroundColor = 'white';
					document.querySelector("#button2>button").style.color= 'black';
					document.querySelector("#button1>button").style.color = 'white';
					document.querySelector("#button3>button").style.color = 'white';
				}
				
				let showContent3 =() =>{
					document.getElementById('content1').style.display = 'none';
					document.getElementById('content2').style.display = 'none';
					document.getElementById('content3').style.display = 'flex';
					document.getElementById('content3').style.flexDirection = 'column';
					document.getElementById('content3').style.alignItems = 'center';
					document.querySelector("#button1 > button").style.backgroundColor = 'black';
					document.querySelector("#button2 > button").style.backgroundColor = 'black';
					document.querySelector("#button3 > button").style.backgroundColor = 'white';
					document.querySelector("#button3>button").style.color= 'black';
					document.querySelector("#button1>button").style.color = 'white';
					document.querySelector("#button2>button").style.color = 'white';
				}
			</script>


		</head>

		<body>
			<!-- Page Preloder -->
			<!-- <div id="preloder">
				<div class="loader"></div>
			</div> -->
			<c:if test="${empty userId}">
				<c:if test="${not pageContext.response.isCommitted()}">
					<% response.sendRedirect("login"); %>
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
					<button class="btn btn-primary" onclick="showContent1()">Pending Id Request</button>
				</div>
				<div id="button2">
					<button class="btn btn-primary" onclick="showContent2()">Pending Deposit Request</button>
				</div>
				<div id="button3">
					<button class="btn btn-primary" onclick="showContent3()">Pending Withdraw Request</button>
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
				<h1 class="text-center text-white p2 bg-dark bg-gradient text-uppercase">Pending Create Id Request</h1>
					<div class="container">
					<table id="example" class="table table-striped table-responsive border-dark table-hover text-center">
						<thead class="table-dark table-active text-uppercase text-whites">
							<th>Website Name</th>
							<th>Username</th>
							<th>Password</th>
							<th>Status</th>
							<th>Links</th>
						</tr>
					</thead>
					<c:forEach items="${pendingMyIds}" var="id">
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
								<a href="${id.website}" target="_blank"><i class="fa-solid fa-arrow-up-right-from-square"></i></a></td>
							</tr>
							</c:otherwise>
							</c:choose>
						</tbody>
					</c:forEach>
				</table>
				</div>
			</div>					
					</div>
				</div>
				<% int index=0; %>
				<div id="content2" class="content">
					<c:forEach items="${pendingDepositRequests}" var="depositRequest">
						<h1 class="text-center text-white p2 bg-dark bg-gradient text-uppercase">Pending Deposit Request</h1>
						<div class="container">
						<table id="example" class="table table-striped table-responsive border-dark table-hover text-center">
							<thead class="table-dark table-active text-uppercase text-whites">
								<tr>
									<th>Transaction ID</th>
									<th>UPI ID</th>
									<th>Display Name</th>
									<th>UTR Number </th>
									<th>Payment Screenshot</th>
									<th>Amount</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not depositRequest.status }">
									<tr>
										<td>${depositRequest.id }</td>
										<td>${depositRequest.upiId }</td>
										<td>${depositRequest.upiName}</td>
										<c:choose>
											<c:when test="${not empty depositRequest.utr }">
												<td>
													<span class="upiID" onclick="copyTheUpi('<%= index %>')">
														${depositRequest.utr}
													</span>
													<i class="fa-regular fa-copy copyButton" onclick="copyTheUpi('<%= index %>')"></i>
													<i class="fa-solid fa-circle-check copyComplete" style="display: none;"></i>
													<% index++; %>
												</td>
											</c:when>
											<c:otherwise>
												<td>Not Available</td>
											</c:otherwise>
										</c:choose>
										<td>
											<div style="display: flex; flex-direction:column;">
												<a href="${depositRequest.path}" target="_blank" style="margin-bottom:7px">
													<img class="image-container" src="${depositRequest.path}"
														alt="${depositRequest.userId }">
												</a>
												<a href="${depositRequest.path}" target="_blank">
													<button class="btn btn-success">Click to view</button>
												</a>
											</div>
										</td>
										<td>
											---
										</td>
										<td>
											Pending
										</td>
									</tr>
								</c:if>
							</tbody>
						</table>
						</div>
					</c:forEach>
				</div>
				<div id="content3" class="content">
					<h1 class="text-center text-white p2 bg-dark bg-gradient text-uppercase">Pending Withdraw Request</h1>
					<div class="container">
					<table id="example" class="table table-striped table-responsive border-dark table-hover text-center">
						<thead class="table-dark table-active text-uppercase text-whites">
							<tr>
								<th>Transaction ID</th>
								<th>Bank Name</th>
								<th>Account Number</th>
								<th>IFSC</th>
								<th>Account Holder Name</th>
								<th>Amount</th>
								<th>Timestamp</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${pendingWithdrawRequests}" var="withdrawRequest">
							<c:if test="${withdrawRequest.status eq 'PENDING'}">
								<tr>
									<td>${withdrawRequest.id}</td>
									<td>${withdrawRequest.bankName}</td>
									<td>${withdrawRequest.accountNumber}</td>
									<td>${withdrawRequest.ifsc}</td>
									<td>${withdrawRequest.accountHolderName}</td>
									<td>${withdrawRequest.amount}</td>
									<td>${withdrawRequest.timestamp}</td>
									<td>Pending</td>
								</tr>
							</c:if>
						</c:forEach>
						</tbody>
					</table>
					</div>
					</div>
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
			<script src="js/depositRequest.js"></script>
			<script src="js/jquery-3.2.1.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/owl.carousel.min.js"></script>
			<script src="js/jquery.marquee.min.js"></script>
			<script src="js/main.js"></script>
			<script src="js/login.js"></script>
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

		</body>

		</html>