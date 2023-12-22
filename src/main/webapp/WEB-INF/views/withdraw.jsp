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
	<link href="img/favicon.ico" rel="shortcut icon"/>

	<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i" rel="stylesheet">

	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/animate.css"/>
	<link rel="stylesheet" href="css/login.css"/>
	<link rel="stylesheet" href="css/error-container.css"/>
	<link rel="stylesheet" href="css/bankingService.css"/>

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
	<section class="hero-section">
		<div class="hero-slider owl-carousel">
			<div class="hs-item set-bg" data-setbg="img/slider-1.jpg">
				<c:if test="${not empty errorMessage}">
					<div class="errorContainer">${errorMessage}</div>
					<%
						session.removeAttribute("errorMessage");
					%>
				</c:if>
				<div class="box">
                    <h2>Money Withdraw</h2>
                    <form action="transaction" method="post">
                      <div class="row">
                        <div class="col-md-6">
                          <div class="form-group row" style="margin-bottom: 5px;">
                            <label class="col-sm-12 col-form-label" style="padding-bottom: 0px;">Mobile</label>
                            <div class="col-sm-12">
                              <input type="tel" class="form-control" id="mobile" name="mobile" required />
                            </div>
                          </div>
                        </div>

                        <div class="col-md-6" >
                          <div class="form-group row" style="margin-bottom: 5px;">
                            <label class="col-sm-12 col-form-label" style="padding-bottom: 0px;">Account Number</label>
                            <div class="col-sm-12">
                              <input type="text" class="form-control" id="accountNumber" name="accountNumber" required />
                            </div>
                          </div>
                        </div>

                        <div class="col-md-6">
                          <div class="form-group row" style="margin-bottom: 5px;">
                            <label class="col-sm-12 col-form-label" style="padding-bottom: 0px;">IFSC Code</label>
                            <div class="col-sm-12">
                              <input type="text" class="form-control" id="ifsc" name="ifsc" required />
                            </div>
                          </div>
                        </div>

                        <div class="col-md-6">
                          <div class="form-group row" style="margin-bottom: 5px;">
                            <label class="col-sm-12 col-form-label" style="padding-bottom: 0px;">Account Holder Name</label>
                            <div class="col-sm-12">
                              <input type="text" class="form-control" name="accountHolderName" id="accountHolderName" required />
                            </div>
                          </div>
                        </div>

                        <div class="col-md-6">
                          <div class="form-group row" style="margin-bottom: 5px;">
                            <label class="col-sm-12 col-form-label" style="padding-bottom: 0px;">Amount</label>
                            <div class="col-sm-12">
                              <input type="number" class="form-control" name="amount" id="amount" required />
                            </div>
                          </div>
                        </div>
                        
                      </div>
                      <button type="submit" class="btn btn-info" style="float: right;">Submit <i class="mdi mdi-arrow-right-bold"></i></button>
                    </form>
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