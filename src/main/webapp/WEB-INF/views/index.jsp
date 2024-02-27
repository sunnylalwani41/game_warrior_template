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
			<link href="img/favicon.png" rel="shortcut icon" />
<!-- Google Fonts -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,400i,500,500i,700,700i" rel="stylesheet">
	
	<!-- Stylesheets -->
	<link rel="stylesheet" href="css/bootstrap.min.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/style.css"/>
	<link rel="stylesheet" href="css/animate.css"/>
	<link rel="stylesheet" href="css/login.css"/>
	<!-- livechat style -->
	<link rel="stylesheet" href="css/livechat.css"/>
	<link rel="stylesheet" href="css/responsive.css"/>
	<!-- Font Awesome kit -->
	<script src="https://kit.fontawesome.com/e99a9eb445.js" crossorigin="anonymous"></script>
</head>
		<body>
			<!-- Page Preloder -->
			<div id="preloder">
				<div class="loader"></div>
			</div>

			<!-- Header section -->
			<header class="header-section">
				<div class="container">
					<!-- logo -->
					<a class="site-logo" href="/">
						<img src="img/logo.png" alt="logo">
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
													<a href="fetchTransactions">
														<i class="fa-solid fa-book"></i>
														Transaction History
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
			<div class="livechat_float">
				<a href="https://telegram.im/@digitaladdworld" target="_blank" class="telegramim_button telegramim_shadow" style="font-size:26px;width:219px;background:#27A5E7;box-shadow:1px 1px 5px #27A5E7;color:#FFFFFF;border-radius:37px;" title="Digital Add World"><i></i> Chat with us</a>
			</div>

			<!-- Hero section -->
			<section class="hero-section">
				<div class="hero-slider owl-carousel">
					<div class="hs-item set-bg" data-setbg="img/maxresdefault.jpg">

						<div class="hs-text">
							<div class="container">
								<h2>The Best <span>Games</span> Out There</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec malesuada <br> lorem
									maximus mauris scelerisque, at rutrum nulla dictum. Ut ac ligula sapien.
									<br>Suspendisse cursus faucibus finibus.</p>
								<a href="#" class="site-btn">Read More</a>
							</div>
						</div>
						<c:if test="${not empty userId }">
							<div class="transaction">
								<div class="user-panel" id="deposit">
									<a href="fetchUpiDetails">
										<i class="fa-solid fa-file-arrow-down" style="color:green"></i>
										Deposit
									</a>
								</div>
								<div class="user-panel" id="withdraw">
									<a href="withdraw">
										<i class="fa-solid fa-file-arrow-up" style="color:red"></i>
										Withdraw
									</a>
								</div>
							</div>
							<div class="history">
								<div class="user-panel">
									<a href="fetchTransactions">
										<i class="fa-solid fa-book"></i>
										Transaction History
									</a>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</section>
			<!-- Hero section end -->
			
			<!-- Latest news section -->
			<div class="latest-news-section">
				<div class="ln-title">Latest News</div>
				<div class="news-ticker">
					<div class="news-ticker-contant">
						<div class="nt-item"><span class="new">new</span>Lorem ipsum dolor sit amet, consectetur
							adipiscing elit. </div>
						<div class="nt-item"><span class="strategy">strategy</span>Isum dolor sit amet, consectetur
							adipiscing elit. </div>
						<div class="nt-item"><span class="racing">racing</span>Isum dolor sit amet, consectetur
							adipiscing elit. </div>
					</div>
				</div>
			</div>
			<!-- Latest news section end -->


			<!-- Feature section -->
			<section class="feature-section spad">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-6 p-0">
							<div class="feature-item set-bg" data-setbg="img/aviator-1-1200x900.jpg">
								<span class="cata new">new</span>
								<div class="fi-content text-white">
									<h5><a href="#">Suspendisse ut justo tem por, rutrum</a></h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
									<a href="#" class="fi-comment">3 Comments</a>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 p-0">
							<div class="feature-item set-bg" data-setbg="img/Picture33-1.webp">
								<span class="cata strategy">strategy</span>
								<div class="fi-content text-white">
									<h5><a href="#">Justo tempor, rutrum erat id, molestie</a></h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
									<a href="#" class="fi-comment">3 Comments</a>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 p-0">
							<div class="feature-item set-bg" data-setbg="img/excitingcasinogames-feat.jpg">
								<span class="cata new">new</span>
								<div class="fi-content text-white">
									<h5><a href="#">Nullam lacinia ex eleifend orci porttitor</a></h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
									<a href="#" class="fi-comment">3 Comments</a>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 p-0">
							<div class="feature-item set-bg" data-setbg="img/iStock-1188019651_628b32aa563ca.jpg">
								<span class="cata racing">racing</span>
								<div class="fi-content text-white">
									<h5><a href="#">Lacinia ex eleifend orci suscipit</a></h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
									<a href="#" class="fi-comment">3 Comments</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Feature section end -->


			<!-- Recent game section  -->
			<section class="recent-game-section spad set-bg" data-setbg="img/recent-game-bg.png">
				<div class="container">
					<div class="section-title">
						<div class="cata new">new</div>
						<h2>Upcoming Games</h2>
					</div>
					<div class="row">
						<div class="col-lg-4 col-md-6">
							<div class="recent-game-item">
								<div class="rgi-thumb set-bg" data-setbg="img/recent-game/1.jpg">
									<div class="cata new">new</div>
								</div>
								<div class="rgi-content">
									<h5>Suspendisse ut justo tem por, rutrum</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum dolor sit amet,
										consectetur elit. </p>
									<a href="#" class="comment">3 Comments</a>
									<div class="rgi-extra">
										<div class="rgi-star"><img src="img/icons/star.png" alt=""></div>
										<div class="rgi-heart"><img src="img/icons/heart.png" alt=""></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="recent-game-item">
								<div class="rgi-thumb set-bg" data-setbg="img/recent-game/2.jpg">
									<div class="cata racing">racing</div>
								</div>
								<div class="rgi-content">
									<h5>Susce pulvinar metus nulla, vel facilisis sem </h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum dolor sit amet,
										consectetur elit. </p>
									<a href="#" class="comment">3 Comments</a>
									<div class="rgi-extra">
										<div class="rgi-star"><img src="img/icons/star.png" alt=""></div>
										<div class="rgi-heart"><img src="img/icons/heart.png" alt=""></div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="recent-game-item">
								<div class="rgi-thumb set-bg" data-setbg="img/recent-game/3.jpg">
									<div class="cata adventure">Adventure</div>
								</div>
								<div class="rgi-content">
									<h5>Suspendisse ut justo tem por, rutrum</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum dolor sit amet,
										consectetur elit. </p>
									<a href="#" class="comment">3 Comments</a>
									<div class="rgi-extra">
										<div class="rgi-star"><img src="img/icons/star.png" alt=""></div>
										<div class="rgi-heart"><img src="img/icons/heart.png" alt=""></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Recent game section end -->



			<!-- Tournaments section -->
			<section class="tournaments-section spad">
				<div class="container">
					<div class="tournament-title">Tournaments</div>
					<div class="row">
						<div class="col-md-6">
							<div class="tournament-item mb-4 mb-lg-0">
								<div class="ti-notic">Premium Tournament</div>
								<div class="ti-content">
									<div class="ti-thumb set-bg" data-setbg="img/tournament/1.jpg"></div>
									<div class="ti-text">
										<h4>World Of WarCraft</h4>
										<ul>
											<li><span>Tournament Beggins:</span> June 20, 2018</li>
											<li><span>Tounament Ends:</span> July 01, 2018</li>
											<li><span>Participants:</span> 10 teams</li>
											<li><span>Tournament Author:</span> Admin</li>
										</ul>
										<p><span>Prizes:</span> 1st place $2000, 2nd place: $1000, 3rd place: $500</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-md-6">
							<div class="tournament-item">
								<div class="ti-notic">Premium Tournament</div>
								<div class="ti-content">
									<div class="ti-thumb set-bg" data-setbg="img/tournament/2.jpg"></div>
									<div class="ti-text">
										<h4>DOOM</h4>
										<ul>
											<li><span>Tournament Beggins:</span> June 20, 2018</li>
											<li><span>Tounament Ends:</span> July 01, 2018</li>
											<li><span>Participants:</span> 10 teams</li>
											<li><span>Tournament Author:</span> Admin</li>
										</ul>
										<p><span>Prizes:</span> 1st place $2000, 2nd place: $1000, 3rd place: $500</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Tournaments section bg -->


			<!-- Review section -->
			<section class="review-section spad set-bg" data-setbg="img/review-bg.png">
				<div class="container">
					<div class="section-title">
						<div class="cata new">new</div>
						<h2>Recent Reviews</h2>
					</div>
					<div class="row">
						<div class="col-lg-3 col-md-6">
							<div class="review-item">
								<div class="review-cover set-bg" data-setbg="img/review/1.jpg">
									<div class="score yellow">9.3</div>
								</div>
								<div class="review-text">
									<h5>Assasin’’s Creed</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum dolor sit ame.</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="review-item">
								<div class="review-cover set-bg" data-setbg="img/review/2.jpg">
									<div class="score purple">9.5</div>
								</div>
								<div class="review-text">
									<h5>Doom</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum dolor sit ame.</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="review-item">
								<div class="review-cover set-bg" data-setbg="img/review/3.jpg">
									<div class="score green">9.1</div>
								</div>
								<div class="review-text">
									<h5>Overwatch</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum dolor sit ame.</p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="review-item">
								<div class="review-cover set-bg" data-setbg="img/review/4.jpg">
									<div class="score pink">9.7</div>
								</div>
								<div class="review-text">
									<h5>GTA</h5>
									<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum dolor sit ame.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Review section end -->


			<!-- Footer top section -->
			<section class="footer-top-section">
				<div class="container">
					<div class="footer-top-bg">
						<img src="img/footer-top-bg.png" alt="">
					</div>
					<div class="row">
						<div class="col-lg-4">
							<div class="footer-logo text-white">
								<img src="img/footer-logo.png" alt="">
								<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum dolor sit ame.</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="footer-widget mb-5 mb-md-0">
								<h4 class="fw-title">Latest Posts</h4>
								<div class="latest-blog">
									<div class="lb-item">
										<div class="lb-thumb set-bg" data-setbg="img/latest-blog/1.jpg"></div>
										<div class="lb-content">
											<div class="lb-date">June 21, 2018</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum </p>
											<a href="#" class="lb-author">By Admin</a>
										</div>
									</div>
									<div class="lb-item">
										<div class="lb-thumb set-bg" data-setbg="img/latest-blog/2.jpg"></div>
										<div class="lb-content">
											<div class="lb-date">June 21, 2018</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum </p>
											<a href="#" class="lb-author">By Admin</a>
										</div>
									</div>
									<div class="lb-item">
										<div class="lb-thumb set-bg" data-setbg="img/latest-blog/3.jpg"></div>
										<div class="lb-content">
											<div class="lb-date">June 21, 2018</div>
											<p>Lorem ipsum dolor sit amet, consectetur adipisc ing ipsum </p>
											<a href="#" class="lb-author">By Admin</a>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 col-md-6">
							<div class="footer-widget">
								<h4 class="fw-title">Top Comments</h4>
								<div class="top-comment">
									<div class="tc-item">
										<div class="tc-thumb set-bg" data-setbg="img/authors/1.jpg"></div>
										<div class="tc-content">
											<p><a href="#">James Smith</a> <span>on</span> Lorem ipsum dolor sit amet,
												co</p>
											<div class="tc-date">June 21, 2018</div>
										</div>
									</div>
									<div class="tc-item">
										<div class="tc-thumb set-bg" data-setbg="img/authors/2.jpg"></div>
										<div class="tc-content">
											<p><a href="#">James Smith</a> <span>on</span> Lorem ipsum dolor sit amet,
												co</p>
											<div class="tc-date">June 21, 2018</div>
										</div>
									</div>
									<div class="tc-item">
										<div class="tc-thumb set-bg" data-setbg="img/authors/3.jpg"></div>
										<div class="tc-content">
											<p><a href="#">James Smith</a> <span>on</span> Lorem ipsum dolor sit amet,
												co</p>
											<div class="tc-date">June 21, 2018</div>
										</div>
									</div>
									<div class="tc-item">
										<div class="tc-thumb set-bg" data-setbg="img/authors/4.jpg"></div>
										<div class="tc-content">
											<p><a href="#">James Smith</a> <span>on</span> Lorem ipsum dolor sit amet,
												co</p>
											<div class="tc-date">June 21, 2018</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Footer top section end -->


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


				<!--====== Javascripts & Jquery ======-->
	<script src="js/jquery-3.2.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.marquee.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/login.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
		(function() {var script=document.createElement("script");script.type="text/javascript";script.async =true;script.src="//telegram.im/widget-button/index.php?id=@digitaladdworld";document.getElementsByTagName("head")[0].appendChild(script);})();
	</script>

		</body>

		</html>