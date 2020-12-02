<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %> --%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>

</head>
<body>
	<!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>
	<script src="/spring/resources/assets/js/boardList.js?after1aa"></script>
<style>

#heart:hover {
	color: red;
}
a{
	color:black;
}
a:hover {
	color:#36d000;
}

</style>

	<script>
	var boardListCategory ="${category}";
  	var login = "${loginUser.id}";
	</script>

	<!-- Main -->
	<main>

		<!-- slider Area Start-->
		<div class="slider-area ">
			<!-- Mobile Menu -->
			<div class="single-slider slider-height2 d-flex align-items-center"
				data-background="/spring/resources/assets/img/hero/category.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>${category}</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- slider Area End-->

		<!-- Latest Products Start -->
		<section class="latest-product-area latest-padding">
			<div class="container">
				<div class="row product-btn d-flex justify-content-between">
					<div class="properties__button">
						<!--Nav Button  -->
						<nav>
							<div class="nav nav-tabs" id="nav-tab" role="tablist">

								<input type="search" id="searchTitleinList" placeholder="리스트 내 검색">
								<button type="button" onclick="more(true)" >검색</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="search" id="searchPrice1" placeholder="최소 가격" style="width: 120px">~
								<input type="search" id="searchPrice2" placeholder="최대 가격" style="width: 120px">
								<button type="button" onclick="more(true)">검색</button>

							</div>
						</nav>
						<!--End Nav Button  -->
					</div>
					<div class="select-this d-flex">
						<div class="featured">
								<span>Short by: </span>
						</div>

						<div class="select-itms" style="margin-bottom: 0">
							<select name="select" id="searchSort" onchange="more(true)">
								<option value="최신순">최신순</option>
								<option value="낮은가격순">낮은 가격순</option>
								<option value="높은가격순">높은 가격순</option>
							<!-- 	<option value="댓글순">댓글순</option> -->
							</select>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="select-itms">
							<select name="select" id="searchCount" onchange="more(true)">
								<option value="18">18개</option>
								<option value="36">36개</option>
								<option value="54">54개</option>
								<option value="72">72개</option>
							</select>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${sessionScope.loginUser != null}">
						<div class="featured">
							<span style="margin-right: 20px; border: 1px solid black"><a
								href="boardWrite.do" style="color: black">상품 등록</a></span>
						</div>
						</c:if>
					</div>
				</div>
				<!-- Nav Card -->

				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="row"></div>
					</div>
				</div>
			</div>
		</section>
		<!-- Latest Products End -->

		<center>
			<button id="moreBtn" type="button" class="More" onclick="more()"
				style="margin-top: 250px; visibility: hidden;">
				<h1>More!</h1>
			</button>
		</center>

	</main>
	<!-- footerInclude-->
	<%@ include file="../common/footer.jsp"%>

</body>
</html>