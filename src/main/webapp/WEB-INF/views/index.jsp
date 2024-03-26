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
			<!-- <div id="preloder">
				<div class="loader"></div>
			</div> -->

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
			<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100 img-fluid" src="img/maxresdefault.jpg" alt="First slide">
  <div class="carousel-caption d-none d-md-block">
    <h2 class="display-4">The Best <span>Games</span> Out There</h2>
    <p class="lead">Be the best gamer with us and have the best experience of playing with us</p>
								<a href="#" class="btn btn-primary btn-lg">Read More</a>
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
							<div class="transaction">
								<div class="user-panel">
									<a href="fetchWalletTransaction">
										<i class="fa-solid fa-book"></i>
										Transaction History
									</a>
								</div>
								<div class="user-panel" id="withdraw">
									<a href="fetchPendingRequest">
										<i class="fa-regular fa-hourglass-half"></i>
										Pending Request
									</a>
								</div>
							</div>
						</c:if>
  </div>    
  </div>
    <div class="carousel-item">
      <img class="d-block w-100 img-fluid" src="img/slider-1.jpg" alt="First slide">
  <div class="carousel-caption d-none d-md-block">
    <h2 class="display-4">The Best <span>Games</span> Out There</h2>
     <p class="lead">Be the best gamer with us and have the best experience of playing with us</p>
								<a href="#" class="btn btn-primary btn-lg">Read More</a>
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
							<div class="transaction">
								<div class="user-panel">
									<a href="fetchWalletTransaction">
										<i class="fa-solid fa-book"></i>
										Transaction History
									</a>
								</div>
								<div class="user-panel" id="withdraw">
									<a href="fetchPendingRequest">
										<i class="fa-regular fa-hourglass-half"></i>
										Pending Request
									</a>
								</div>
							</div>
						</c:if>
								
  </div>
    </div>
    <div class="carousel-item">
     <img class="d-block w-100 img-fluid" src="img/slider-2.jpg" alt="...">
  <div class="carousel-caption d-none d-md-block">
   <h2 class="display-4">The Best <span>Games</span> Out There</h2>
     <p class="lead">Be the best gamer with us and have the best experience of playing with us</p>
     <p class="lead">Kindly play with your own risk</p>>
								<a href="#" class="btn btn-primary btn-lg">Read More</a>
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
							<div class="transaction">
								<div class="user-panel">
									<a href="fetchWalletTransaction">
										<i class="fa-solid fa-book"></i>
										Transaction History
									</a>
								</div>
								<div class="user-panel" id="withdraw">
									<a href="fetchPendingRequest">
										<i class="fa-regular fa-hourglass-half"></i>
										Pending Request
									</a>
								</div>
							</div>
						</c:if>
								
								
  </div>
    </div>
    <div class="carousel-item">
     <img class="d-block w-100 img-fluid" src="img/slider-3.jpg" alt="...">
  <div class="carousel-caption d-none d-md-block">
   <h2 class="display-4">The Best <span>Games</span> Out There</h2>
    <p class="lead">Be the best gamer with us and have the best experience of playing with us</p>
     <p class="lead">Kindly play with your own risk</p>
								<a href="#" class="btn btn-primary btn-lg">Read More</a>
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
							<div class="transaction">
								<div class="user-panel">
									<a href="fetchWalletTransaction">
										<i class="fa-solid fa-book"></i>
										Transaction History
									</a>
								</div>
								<div class="user-panel" id="withdraw">
									<a href="fetchPendingRequest">
										<i class="fa-regular fa-hourglass-half"></i>
										Pending Request
									</a>
								</div>
							</div>
						</c:if>
								
								
  </div>
    </div>
    <div class="carousel-item">
     <img class="d-block w-100 img-fluid" src="img/slider-4.jpg" alt="...">
  <div class="carousel-caption d-none d-md-block">
   <h2 class="display-4">The Best <span>Games</span> Out There</h2>
   <p class="lead">Be the best gamer with us and have the best experience of playing with us</p>
     <p class="lead">Kindly play with your own risk</p>>
								<a href="#" class="btn btn-primary btn-lg">Read More</a>
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
							<div class="transaction">
								<div class="user-panel">
									<a href="fetchWalletTransaction">
										<i class="fa-solid fa-book"></i>
										Transaction History
									</a>
								</div>
								<div class="user-panel" id="withdraw">
									<a href="fetchPendingRequest">
										<i class="fa-regular fa-hourglass-half"></i>
										Pending Request
									</a>
								</div>
							</div>
						</c:if>
								
  </div>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
			
			</section>
			<!-- Hero section end -->
			
			<!-- Latest news section -->
			<div class="latest-news-section">
				<div class="ln-title">Latest News</div>
				<div class="news-ticker">
					<div class="news-ticker-contant">
						<div class="nt-item"><span class="new">new</span>First Winner </div>
						<div class="nt-item"><span class="strategy">strategy</span>Second Winner </div>
						<div class="nt-item"><span class="racing">racing</span>Third Winner</div>
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
									<h5><a href="#">Welcome to the avitator game</a></h5>
									<p>where your adventure begins! Immerse yourself in a fantastical world filled with mystical creatures, ancient ruins, and epic quests waiting to be conquered.</p>
									<a href="#" class="fi-comment">3 Comments</a>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 p-0">
							<div class="feature-item set-bg" data-setbg="img/Picture33-1.webp">
								<span class="cata strategy">strategy</span>
								<div class="fi-content text-white">
									<h5><a href="#">Welcome to the thrilling world of our Casino Game! </a></h5>
									<p>Get ready to experience the glitz and glamour of Las Vegas right from the comfort of your own home.</p>
									<a href="#" class="fi-comment">3 Comments</a>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 p-0">
							<div class="feature-item set-bg" data-setbg="img/excitingcasinogames-feat.jpg">
								<span class="cata new">new</span>
								<div class="fi-content text-white">
									<h5><a href="#">Try your luck at the slot machines, where the reels are spinning and the jackpots</a></h5>
									<p>From traditional fruit machines to themed video slots, there's no shortage of excitement and big wins to be had. </p>
									<a href="#" class="fi-comment">3 Comments</a>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6 p-0">
							<div class="feature-item set-bg" data-setbg="img/iStock-1188019651_628b32aa563ca.jpg">
								<span class="cata racing">racing</span>
								<div class="fi-content text-white">
									<h5><a href="#">If table games are more your style, take a seat at one of our virtual tables and test your skills</a></h5>
									<p>Whether you prefer blackjack, poker, roulette, or baccarat, you'll find all the classic casino favorites right here./p>
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
									<h5>Feeling lucky? Take a spin on the roulette wheel</h5>
									<p>place your bets on red or black, odd or even, or your lucky number. With every spin, the anticipation builds as you wait to see where the ball will land.</p>
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
									<h5>And for those looking for the ultimate thrill, step into our live casino </h5>
									<p>Experience the excitement of a land-based casino without ever having to leave your home.</p>
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
									<h5>Interact with real dealers in real-time.</h5>
									<p>With stunning graphics, immersive sound effects, and seamless gameplay, our Casino Game delivers the ultimate gaming experience.</p>
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
									<p>Take a break from the hustle and bustle of everyday life and immerse yourself in the electrifying atmosphere</p>
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
									<p>Featuring state-of-the-art graphics and animations, our games transport you to a world of luxury and sophistication.</p>
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
									<p> Join one of our thrilling tournaments and compete against players from around the world for your chance </p>
								</div>
							</div>
						</div>
						<div class="col-lg-3 col-md-6">
							<div class="review-item">
								<div class="review-cover set-bg" data-setbg="img/review/4.jpg">
									<div class="score pink">9.7</div>
								</div>
								<div class="review-text">
									<h5>Gambling</h5>
									<p>From scratch cards to bingo, there's always something new and exciting to try your hand at.</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- Review section end -->
			
			<section class="spad">
				<div class="container">
					<div class="section-title">
						<h2>Game API</h2>
					</div>
					<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
					<center>
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                          <img class="d-block w-40" src="img/Gaming Api/1.png" alt="...">
                           </div>
                         <div class="carousel-item">
                         <img class="d-block w-40" src="img/Gaming Api/2.png" alt="...">
                         </div>
                          <div class="carousel-item"> 
                          <img class="d-block w-40" src="img/Gaming Api/3.jpg" alt="...">
                          </div>
                          <div class="carousel-item">
                          <img class="d-block w-40" src="img/Gaming Api/4.png" alt="...">
                          </div>
                          <div class="carousel-item">
                          <img class="d-block w-40" src="img/Gaming Api/5.png" alt="...">
                          </div>
                          <div class="carousel-item">
                          <img class="d-block w-40" src="img/Gaming Api/6.png" alt="...">
                          </div>
                          <div class="carousel-item">
                          <img class="d-block w-40" src="img/Gaming Api/7.png" alt="...">
                          </div>
                          <div class="carousel-item">
                          <img class="d-block w-40" src="img/Gaming Api/8.png" alt="...">
                          </div>
                          </div>
                          </center>
                         </div>
                         
				</div>
			</section>
			
			<section class="spad">
				<div class="container">
					<div class="section-title">
						<h2>Game(s)</h2>
					</div>
					<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
					<center>
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                          <img class="d-block w-50" src="img/game/1.jpg" alt="...">
                           </div>
                         <div class="carousel-item">
                         <img class="d-block w-50" src="img/game/1.jpg" alt="...">
                         </div>
                          <div class="carousel-item">
                          <img class="d-block w-50" src="img/game/1.jpg" alt="...">
                          </div>
                          </div>
                          </center>
                         </div>
 
				</div>
			</section>
			<section class="spad">
				<div class="container">
					<div class="section-title">
						<h2>Licence(s)</h2>
					</div>
					<div id="carouselExampleSlidesOnly" class="carousel slide" data-ride="carousel">
					<center>
                        <div class="carousel-inner">
                          <div class="carousel-item active">
                          <img class="d-block w-50" src="img/licence/1.png" alt="...">
                           </div>
                         <div class="carousel-item">
                         <img class="d-block w-40" src="img/licence/2.jpg" alt="...">
                         </div>
                          <div class="carousel-item">
                          <img class="d-block w-40" src="img/licence/3.png" alt="...">
                          </div>
                          </div>
                          </center>
                         </div>
                         </div>
			</section>

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
					<div class="payment-symbol">
						<div>
							<img src="img/payment/1.png" alt="" />
						</div>
						<div>
							<img src="img/payment/2.png" alt="" />
						</div>
						<div>
							<img src="img/payment/3.png" alt="" />
						</div>
						<div>
							<img src="img/payment/4.png" alt="" />
						</div>
						<div>
							<img src="img/payment/5.png" alt="" />
						</div>
						<div>
							<img src="img/payment/6.png" alt="" />
						</div>
						<div>
							<img src="img/payment/7.png" alt="" />
						</div>
						<div>
							<img src="img/payment/8.png" alt="" />
						</div>
						<div>
							<img src="img/payment/9.png" alt="" />
						</div>
					</div>
					<ul class="footer-menu">
						<li>
							<a href="termsandcondition">
								<i class="fa-solid fa-file-invoice"></i>
								Terms and condition
							</a>
						</li>
						<li>
							<a href="notification">
								<i class="fa-solid fa-bell"></i>
								Notification
							</a>
						</li>
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
	<script src="js/login.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
		(function() {var script=document.createElement("script");script.type="text/javascript";script.async =true;script.src="//telegram.im/widget-button/index.php?id=@digitaladdworld";document.getElementsByTagName("head")[0].appendChild(script);})();
	</script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js" integrity="sha512-v2CJ7UaYy4JwqLDIrZUI/4hqeoQieOmAZNXBeQyjo21dadnwR+8ZaIJVT8EE2iyI61OV8e6M8PP2/4hpQINQ/g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
		

		</body>

		</html>