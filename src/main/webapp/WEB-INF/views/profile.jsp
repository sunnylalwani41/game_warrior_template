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
    <link rel="stylesheet" href="css/login.css"/>
    <link rel="stylesheet" href="css/profile.css">



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
<c:if test="${empty requestScope.name || empty requestScope.email}">
	<%
		response.sendRedirect("fetchProfile");
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
                <li><a href="contact">Contact</a></li>
            </ul>
        </nav>
    </div>
</header>
<!-- Header section end -->


<!-- Hero section -->
<section class="hero-section">
    <div class="hero-slider owl-carousel">
        <div class="hs-item set-bg" data-setbg="img/slider-1.jpg">
            <div class="box">
                <h2>Profile</h2>
                <div class="profile-info">
                    <p>Full Name :</p><p> ${requestScope.name }</p>
                    <p>Email :</p> <p> ${requestScope.email}</p>
                </div>
            </div>
        </div>
    </div>

    </div>
</section>
<!-- Hero section end -->

<!-- Footer section -->
<footer class="footer-section">
    <div class="container">
        <ul class="footer-menu">
            <li><a href="/">Home</a></li>
            <li><a href="review">Games</a></li>
            <li><a href="contact">Contact</a></li>
        </ul>
        <p class="copyright"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
        </p>
    </div>
</footer>
<!-- Footer section end -->


<!--====== Javascripts & Jquery ======-->
<script src="js/profile.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="js/jquery-3.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.marquee.min.js"></script>
<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>
</html>