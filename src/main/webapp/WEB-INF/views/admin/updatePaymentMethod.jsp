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
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

			<!-- Stylesheets -->
			<link rel="stylesheet" href="css/bootstrap.min.css" />
			<link rel="stylesheet" href="css/font-awesome.min.css" />
			<link rel="stylesheet" href="css/owl.carousel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/animate.css" />
			<link rel="stylesheet" href="css/login.css" />
			<link rel="stylesheet" href="css/admin-login.css">
			<link rel="stylesheet" href="css/deposit.css">
			<link rel="stylesheet" href="css/error-container.css"/>
			<!-- livechat style -->
			<link rel="stylesheet" href="css/responsive.css"/>
			<!-- Font Awesome kit -->
			<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link
      href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
			<style type="text/css">
				#upiUpdate {
					box-shadow: rgba(0, 0, 0, 0.24) 0px 3px 8px;
					padding: 12px;
					margin: 15px 0px;
					border-radius: 15px;
				}
				
				h3{
					text-align: center;
				}
			</style>
		</head>

		<body>
			<!-- Page Preloder -->
			<!-- <div id="preloder">
				<div class="loader"></div>
			</div> -->
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
				<div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6">
			<form action="updateUpi" method="post" id="upiUpdate">
				<h3>Add Upi Link for payment</h3>
                <div class="mb-3">
			        <label for="upiId" class="form-label">Enter UPI ID</label>
			        <input
			          type="text"
			          name="upiId" placeholder="Enter the UPI Id" 
			          id="upiId"
			          class="form-control"
			          required
			        />
			      </div>
			      <div class="mb-3">
			        <label for="img" class="form-label">Enter Image Link</label>
			        <input
			          type="text"
			          name="img"
			          id="img"
			          class="form-control"
			          placeholder="Enter the image link"
			          required
			        />
			      </div>
			      <div class="mb-3">
			        <label for="displayName" class="form-label">Enter Display Name</label>
			        <input
			          type="text"
			          name="displayName" placeholder="Enter the Display Name"
			          id="displayName"
			          class="form-control"
			          required
			        />
			      </div>
			      <div class="form-group d-flex justify-content-center">
                        <button type="submit" id="submit" class="btn btn-primary btn-lg">Submit</button>
                   </div>
				
				
				
				
			</form>
			</div>
        </div>
    </div>
    <h1 class="text-center text-white p2 bg-dark bg-gradient text-uppercase">Upi Details</h1>
<c:choose>
					<c:when test="${not empty upiDetails}">
						<div class="container">
						<table id="example" class="table table-striped table-responsive border-dark table-hover text-center">
							<thead class="table-dark table-active text-uppercase text-whites">
									<tr>
										<th>Action</th>
										<th>Display Name</th>
										<th>Upi Details</th>
									</tr>
								</thead>
								<c:forEach items="${upiDetails}" var="upi">
			
									<tbody>
										<tr>
											<td style="width: 10%;">
												<form action="deleteUpi" method="post">
													<input type="hidden" name="id" value="${upi.id}" />
													<button class="btn btn-primary" >Delete</button>
												</form>
											</td>
											<td>
												<div class="upiDisplay">
													<img class="upi_image" src="${upi.img}" alt="Upi Logo" />
													<p>${upi.displayName}</p>
												</div>
											</td>
											<td>${upi.upiId}</td>
										</tr>
									</tbody>
								</c:forEach>
							</table>
						</div>
					
					
						
					</c:when>
					<c:otherwise>
						<div class="center">
							<h2>Data Not Available</h2>
						<img id="box-image" src="https://img.freepik.com/free-vector/no-data-concept-illustration_114360-2506.jpg?w=740&t=st=1705560867~exp=1705561467~hmac=5dc60af5ded74c5bdc9f93cf0948faa6be2f2aea0070995a7a3867d8ffc515ed"
							alt="Not found or something went wrong" class="emptyBox" />
						</div>
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
			<script src="js/jquery-3.2.1.min.js"></script>
			<script src="js/bootstrap.min.js"></script>
			<script src="js/owl.carousel.min.js"></script>
			<script src="js/jquery.marquee.min.js"></script>
			<script src="js/main.js"></script>
			<script src="../js/updateGameWebsite.js"></script>
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		</body>

		</html>