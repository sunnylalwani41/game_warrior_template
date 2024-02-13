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
			
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link
      href="https://getbootstrap.com/docs/5.3/assets/css/docs.css"
      rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

			<!-- Stylesheets -->
			<link rel="stylesheet" href="css/bootstrap.min.css" />
			<link rel="stylesheet" href="css/font-awesome.min.css" />
			<link rel="stylesheet" href="css/owl.carousel.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/animate.css" />
			<link rel="stylesheet" href="css/login.css" />
			<link rel="stylesheet" href="css/admin-login.css">
			<link rel="stylesheet" href="css/error-container.css">
			<!-- livechat style -->
			<link rel="stylesheet" href="css/responsive.css"/>
			<!-- Font Awesome kit -->
			<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>
		</head>

		<body>
			<!-- Page Preloder -->
			<div id="preloder">
				<div class="loader"></div>
			</div>
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
									<li><a href="adminLogout">Logout</a></li>
								</ul>
							</div>
						</div>
					</nav>
				</div>
			</header>
			<!-- Header section end -->

			<!-- Live chat -->
			<c:if test="${not empty errorMessage}">
				<div class="errorContainer">${errorMessage}</div>
				<% session.removeAttribute("errorMessage"); %>
			</c:if>
			<c:if test="${not empty message}">
				<div class="errorContainer">${message}</div>
				<% session.removeAttribute("message"); %>
			</c:if>

			<form action="updateGame" method="post" >
				<div class="mb-3">
        <label for="websiteName" class="form-label">Website name</label>
        <input
          type="text"
          name="websiteName"
          id="websiteName"
          placeholder="Enter the Website name"
          class="form-control"
          required
        />
      </div>
      <div class="mb-3">
        <label for="websiteLink" class="form-label">Enter Website Link</label>
        <input
          type="text"
          name="website"
          id="websiteLink"
          class="form-control"
          placeholder="Enter the Website link"
          required
        />
      </div>
      <div class="mb-3">
        <label for="webLogo" class="form-label">Enter Website Logo</label>
        <input
          type="text"
          name="logo"
          id="webLogo"
          class="form-control"
          placeholder="Enter the Website logo"
          required
        />
      </div>
      <div class="mb-3">
        <label for="minBet" class="form-label">Enter Minimum Bet</label>
        <input
          type="number"
          name="minimumBet"
          class="form-control"
          id="minBet"
          placeholder="Enter the Minimum Bet"
          required
        />
      </div>
      <div class="mb-3">
        <label for="minWithdraw" class="form-label"
          >Enter Minimum Withdraw</label
        >
        <input
          type="number"
          name="minimumWithdrawal"
          class="form-control"
          id="minWithdraw"
          placeholder="Enter the Minimum Withdrawal"
          required
        />
      </div>
      <div class="mb-3">
        <label for="minimumMaintainingBalance" class="form-label"
          >Enter Minimum Maintaining Balance</label
        >
        <input
          type="number"
          name="minimumMaintainingBalance"
          id="minimumMaintainingBalance"
          class="form-control"
          placeholder="Enter the Minimum Maintaining Balance"
          required
        />
      </div>
      <div class="mb-3">
        <label for="maximumWithdrawal" class="form-label"
          >Enter Maximum Withdraw</label
        >
        <input
          type="number"
          name="maximumWithdrawal"
          id="maximumWithdrawal"
          class="form-control"
          placeholder="Enter the Maximum Withrawal"
          required
        />
      </div>
        <div class="mb-3">
        <button id="addgame" class="btn btn-primary" onclick="addGame(event)">
          Add Game name
        </button>
        <div class="mb-3">
        <div id="updateinput" class="addGame-container"></div>
        </div>
				<input id="submit" type="submit" value="Submit" />
				<br> <br>
			</form>

			<div class="container-createId">
				<table class="table">
					<thead>
						<tr>
							<th>Website logo</th>
							<th>Website Name</th>
							<th>Website</th>
							<th>Action</th>
							<th>Minimum Bet</th>
							<th>Games Name</th>
						</tr>
					</thead>
					<c:forEach items="${games}" var="game">

						<tbody>
							<tr>
								<td style="width: 10%;"><img class="gamelogo" src="${game.logo}"
										alt="${game.websiteName}" /></td>
								<td>${game.websiteName}</td>
								<td>${game.website}</td>
								<td>
									<form action="deleteGame" method="post">
										<button>Delete Game</button>
										<input type="hidden" name="gameId" value="${game.id}">
									</form>
								</td>
								<td>${game.minimumBet}</td>
								<td>
									<c:forEach items="${game.gameName}" var="gameVarient">
										${gameVarient},
									</c:forEach>
								</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
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
			<script src="../js/updateGameWebsite.js"></script>
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		</body>

		</html>