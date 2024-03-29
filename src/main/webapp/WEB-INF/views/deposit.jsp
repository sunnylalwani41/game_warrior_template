<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

		<!DOCTYPE html>
		<html lang="zxx">

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
			<!-- <link rel="stylesheet" href="css/bootstrap.min.css" />
			 --><link rel="stylesheet" href="css/font-awesome.min.css" />
			<link rel="stylesheet" href="css/owl.carousel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/animate.css" /> 
			<link rel="stylesheet" href="css/deposit.css">
			<link rel="stylesheet" href="css/error-container.css" />
			<link rel="stylesheet" href="css/empty.css">
			<link rel="stylesheet" href="css/responsive.css"/>
			<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>
			<link rel="stylesheet"
				href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.3.0/css/bootstrap.min.css">
			<link rel="stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
			<link rel="stylesheet" href="css/responsive.css"/>
		</head>

		<body class="body">
			<!-- Page Preloder -->
			<!-- <div id="preloder">
				<div class="loader"></div>
			</div> -->
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
													<a href="#"><i class="fa-solid fa-wallet" style="color: black"> : </i>${balance}</a>
												</li>
												<li>
													<a href="fetchUpiDetails">
														<i class="fa-solid fa-file-arrow-down" style="color:green"></i>
														Deposit
													</a>
												</li>
												<li>
													<a href="withdraw">
														<i class="fa-solid fa-file-arrow-up" style="color:red"></i>
														Withdraw
													</a>
									
												</li>
												<li>
													<a href="fetchWalletTransaction">
														<i class="fa-solid fa-book"></i>
														Transaction History
													</a>
												</li>
												<li>
													<a href="fetchPendingRequest">
													<i class="fa-regular fa-hourglass-half"></i>
													Pending Request
													</a>
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
													<a href="fetchUpiDetails">
														<i class="fa-solid fa-file-arrow-down" style="color:green"></i>
														Deposit
													</a>
												</li>
												<li>
													<a href="withdraw">
														<i class="fa-solid fa-file-arrow-up" style="color:red"></i>
														Withdraw
													</a>
									
												</li>
												<li>
													<a href="fetchWalletTransaction">
														<i class="fa-solid fa-book"></i>
														Transaction History
													</a>
												</li>
												<li>
													<a href="fetchPendingRequest">
													<i class="fa-regular fa-hourglass-half"></i>
													Pending Request
													</a>
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
			<% int index = 0; %>
			<c:choose>
				<c:when test="${not empty upiDetails}">
				<h1 class="text-center text-white p2 bg-dark bg-gradient text-uppercase">Upi Details</h1>
					<div class="container">
						<table id="example" class="table table-responsive table-striped border-dark table-hover text-center ">
							<thead class="table-dark text-uppercase text-whites">
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
									<td>
										<span class="upiID" onclick="copyTheUpi('<%= index %>')">
											${upi.upiId}
										</span>
										<i class="fa-regular fa-copy copyButton" onclick="copyTheUpi('<%= index %>')"></i>
										<i class="fa-solid fa-circle-check copyComplete" style="display: none;"></i>
										<% index++; %>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					</div>
					<div id="uploadModel">
						<div class="uploadDiv">
							<button id="uploadButton" class="btn btn-success ml-6"
	                            onclick="openImageInput()">
	                            <i class="fa-solid fa-camera">
	                            </i>
	                            | Upload Payment Screenshot
	                        </button>
						</div>
					</div>
					
					<div id="formModel">
						<div class="formDiv">
							<div class="col-12">
							
			                  <button class="btn btn-success ml-6" onclick="backAndShowFileInput()"><i class="fa-solid fa-arrow-left"></i> back</button>
						  </div>
							<form id="uploadForm" action="/upload" method="post" enctype="multipart/form-data" class="row g-3">
							  <div class="col-md-12">
							   <input type="file" id="fileInput" name="file" accept="image/*" style="display:none;" required>
							  </div>
							  <div class="col-md-12">
							    <div class="row justify-content-center">
							         <div class="col-auto">
							             <img id="uploadedImage" src="" alt="Uploaded Image">
							         </div>
							  	</div>
							  </div>
							  <div class="col-12">
							  	<label for="utr" class="form-label">UTR Number : </label>
								<input type="text" class="form-control" name="utr" id="utr" placeholder="Enter the utr number" required/>
							  </div>
							  
							  <div class="col-12">
							    <input type="hidden" id="selectedUpiId" name="selectedUpiId" value="" required>
							  </div>
							  
							  <div class="col-12">
				                   <button id="uploadButton" class="btn btn-success ml-6" type="submit">Submit</button>
							  </div>
							</form>
							<div class="loadingImage">
		                      	<img src="img/loading/loading in circle.gif" alt="loading"/>
		                    </div>
						</div>
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
			<script src="js/deposit.js"></script>
			<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
			<script src="js/jquery-3.2.1.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/owl.carousel.min.js"></script>
			<script src="js/jquery.marquee.min.js"></script>
			<script src="js/main.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

		</body>

		</html>