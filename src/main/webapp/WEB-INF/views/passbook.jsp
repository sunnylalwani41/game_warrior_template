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
    <link href="../static/img/favicon.ico" rel="shortcut icon"/>

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


    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

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

<c:if test="${empty passbookDetail}">
	<%
		response.sendRedirect("fetchTransactions");
	%>
</c:if>

<!-- Header section -->
<header class="header-section">
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
                <li><a href="categories">Blog</a></li>
                <li><a href="community">Forums</a></li>
                <li><a href="contact">Contact</a></li>
            </ul>
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
		<c:when test="${not empty transactionDetails}">
			<table>
			<caption>Transactions</caption>
				<thead>
					<tr>
						<td>Id</td>
						<td>Mobile</td>
						<td>Account Number</td>
						<td>IFSC</td>
						<td>Account Holder Name</td>
						<td>Amount</td>
						<td>Transaction Id</td>
						<td>Order Id</td>
						<td>Date and Time</td>
					</tr>
				</thead>
				<tbody>
					<% int i=1; %>
					<c:forEach items="${transactionDetails}" var="trans">
						<tr>
							<td>
								${trans.id }
							</td>
							<td>
								${trans.mobile }
							</td>
							<td>
								${trans.accountNumber}
							</td>
							<td>
								${trans.ifsc}
							</td>
							<td>
								${trans.accountHolderName}
							</td>
							<td>
								${trans.amount}
							</td>
							<td>
								${trans.transactionId}
							</td>
							<td>
								${trans.contactId}
							</td>
							<td>
								${trans.timestamp}
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<img src="https://i.pinimg.com/originals/f3/8b/24/f38b24a996391f4a0d78819f028c7926.gif" alt="Not found or something went wrong" class="empty"/>
			<p>Transaction detail(s) not found!.</p>
		</c:otherwise>
	</c:choose>
<%
	session.removeAttribute("passbookDetail");
%>
</section>
<!-- Hero section end -->

<!-- Footer section -->
<footer class="footer-section">
    <div class="container">
        <ul class="footer-menu">
            <li><a href="/">Home</a></li>
            <li><a href="review">Games</a></li>
            <li><a href="categories">Blog</a></li>
            <li><a href="community">Forums</a></li>
            <li><a href="contact">Contact</a></li>
        </ul>
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