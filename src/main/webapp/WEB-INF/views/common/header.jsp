<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>오ㅇ!마켓</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="/spring/resources/assets/img/favicon.ico">

<style>
	.submenu li{
		color:red;
	}
</style>

<!-- CSS here -->
			<!-- CSS here -->
            <link rel="stylesheet" href="/spring/resources/assets/css/bootstrap.min.css">
            <link rel="stylesheet" href="/spring/resources/assets/css/owl.carousel.min.css">
            <link rel="stylesheet" href="/spring/resources/assets/css/flaticon.css">
            <link rel="stylesheet" href="/spring/resources/assets/css/slicknav.css">
            <link rel="stylesheet" href="/spring/resources/assets/css/animate.min.css">
            <link rel="stylesheet" href="/spring/resources/assets/css/magnific-popup.css">
            <link rel="stylesheet" href="/spring/resources/assets/css/fontawesome-all.min.css">
            <link rel="stylesheet" href="/spring/resources/assets/css/themify-icons.css">
            <link rel="stylesheet" href="/spring/resources/assets/css/slick.css">
            <link rel="stylesheet" href="/spring/resources/assets/css/nice-select.css">
          <link rel="stylesheet" href="/spring/resources/assets/css/style.css?after"> 
       		<link rel="stylesheet" href="/spring/resources/assets/css/main.css">  
      		<link rel="stylesheet" href="/spring/resources/assets/css/style-minju.css?after122">
            <link rel="stylesheet" href="/spring/resources/assets/css/main-minju.css">
            <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
   	 <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
   	 <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
   	 <script src="/spring/resources/assets/js/headCategory.js"></script>

	<script type="text/javascript">
	

	</script>

</head>

<body>

	<!-- Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="/spring/resources/assets/img/oilogo.png" alt="">
				</div>
			</div>
		</div>
	</div>

</body>

<header>
	<div class="header-area">
		<div class="main-header ">
		<c:choose> 
		 
			<c:when test="${ sessionScope.loginUser != null }">
				<div class="header-top top-bg d-none d-lg-block main-ul-wrap">
					<ul class="main-header-ul">
					<li class="loginout">
					
						<c:out value="${ loginUser.username }님" /></li>
						
						<li><a href="logout.do">로그아웃 </a></li>
						<c:url var="Withdrawal" value="Withdrawal.do">
							<c:param name="id" value="${ loginUser.id }"/>
						</c:url>
			
						<li><a href="myPage.do">마이페이지 </a></li>
						<li><a href="pickList.do">찜하기 </a></li>
						<!-- <li><a href="cart.html">Cart</a></li> -->
						<!-- <li><a href="checkout.html">Checkout</a></li> -->
					</ul>
				</div>
			</c:when>
				<c:when test="${ userId  != null }">
				<div class="header-top top-bg d-none d-lg-block main-ul-wrap">
					<ul class="main-header-ul">
					<li class="loginout" id="nickname">
				<c:out value="${ userInfo.nickname }님" />
						</li>
						
						<li><a href="kakaologout.do">로그아웃 </a></li>
						<li><a href="myPage.do">마이페이지 </a></li>
						<li><a href="pickList.do">찜하기 </a></li>
						<!-- <li><a href="cart.html">Cart</a></li> -->
						<!-- <li><a href="checkout.html">Checkout</a></li> -->
					</ul>
				</div>
				
				</c:when>
				
				<c:otherwise>
				<div class="header-top top-bg d-none d-lg-block main-ul-wrap">
					<ul class="main-header-ul">
						<li><a href="login.do">로그인 </a></li>
						<!-- <li><a href="cart.html">Cart</a></li> -->
						<!-- <li><a href="checkout.html">Checkout</a></li> -->
					</ul>
				</div>

			</c:otherwise>
			</c:choose>
			
			<div class="header-bottom  header-sticky">
				<div class="container-fluid">
					<div class="row align-items-center">
						<!-- Logo -->
						<div class="col-xl-1 col-lg-1 col-md-1 col-sm-3">
							<div class="logo">
								<a href="home.do"><img
									src="/spring/resources/assets/img/oilogo.png" alt=""></a>
							</div>
						</div>
						<div class="col-xl-6 col-lg-8 col-md-7 col-sm-5">
							<!-- Main-menu -->
							<div class="main-menu f-right d-none d-lg-block" >
								<nav >
									<ul id="navigation" >
										
									</ul>
								</nav>
							</div>
						</div>
						<div class="col-xl-5 col-lg-3 col-md-3 col-sm-3 fix-card">
							<ul
								class="header-right f-right d-none d-lg-block d-flex justify-content-between">
								<li class="d-none d-xl-block">
									<div class="form-box f-right ">
										<input type="text" id="Search" name="Search" placeholder="상품 검색">
										<div class="search-icon">
											<i onclick="search1()" class="fas fa-search special-tag"></i>
										</div>
									</div>
								</li>
								<li class=" d-none d-xl-block">
									<div class="favorit-items">
										<i class="far fa-heart"></i>
									</div>
								</li>
								<li>
									<div class="shopping-card">
										<a href="cart.html"><i class="fas fa-shopping-cart"></i></a>
									</div>
								</li>
								<li>
									<!-- alarmToggle Btn -->
									<div class="alarmToggle">
										<i class="fas fa-bell"></i>
									</div>
								</li>
								<c:choose>
								
								<c:when test="${ !empty sessionScope.loginUser }">
									<li>
										<!-- chatListToggle Btn -->
										<div class="chatListToggle">
											<i class="fab fa-facebook-messenger"></i>
										</div>
									</li>
									<li class="d-none d-lg-block"><a href="logout.do"
										class="btn header-btn">Sign Out</a></li>
								</c:when>
						<c:when test="${ !empty userId   }">
									<li>
										<!-- chatListToggle Btn -->
										<div class="chatListToggle">
											<i class="fab fa-facebook-messenger"></i>
										</div>
									</li>
									<li class="d-none d-lg-block">
									<a href="kakaologout.do" class="btn header-btn">Sign Out</a></li>
								</c:when>
								
								<c:otherwise>
									<li>
										<!-- chatListToggle Btn -->
										<div class="chatListToggle">
											<i class="fab fa-facebook-messenger"></i>
										</div>
									</li>
									<li class="d-none d-lg-block"><a href="login.do"
										class="btn header-btn">Sign in</a></li>
								</c:otherwise>
								</c:choose>
							</ul>
						</div>
						<!-- Mobile Menu -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</header>

</body>
</html>