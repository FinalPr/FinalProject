<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<link rel="stylesheet"
	href="/spring/resources/assets/css/style-minju.css">
<link rel="stylesheet"
	href="/spring/resources/assets/css/main-minju.css">
<link rel="stylesheet"
	href="/spring/resources/assets/css/mypage-minju.css">
<link rel="stylesheet"
	href="/spring/resources/assets/css/UserInfoUpdate.css">


</head>
<body>
	<!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>

	<!-- Main -->
	<main>
		<!-- Latest Products Start -->
		<section class="latest-product-area latest-padding">
			<div class="main-panel">
				<div class="content">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-8">
								<div class="card">
									<div class="card-header card-header-primary">
										<h4 class="card-title">Profile</h4>
										<p class="card-category">회원 정보 수정</p>
									</div>
									<div class="card-body">
										<form>

											<div class="col-md-5">
												<div class="form-group">
													<label class="bmd-label-floating">이름
														(disabled)</label> <input type="text" class="form-control"
														disabled />
												</div>

											</div>
											<div class="ImgDiv">
												<img src="/spring/resources/assets/img/feature_1.png"
													class="myImg">
												<div class="IMGicon">
													<a><i class="fas fa-image"></i></a>

												</div>
											</div>

											<div class="col-md-3">
												<div class="form-group">
													<label class="bmd-label-floating">닉네임</label> <input
														type="text" class="form-control" />
												</div>
											</div>

											<div class="col-md-4">
												<div class="form-group">
													<label class="bmd-label-floating">이메일</label> <input
														type="email" class="form-control" />
												</div>
											</div>



											<div class="col-md-12">

												<div class="form-group">
													<label class="bmd-label-floating">주소</label> <input
														type="text" class="form-control" />
												</div>
											</div>


											<div class="col-md-4">
												<div class="form-group">
													<label class="bmd-label-floating">휴대폰
														번호</label> <input type="text" class="form-control" />
												</div>
											</div>



											<div class="col-md-12">
												<div class="form-group">
													<label>자기 소개</label>
													<div class="form-group">
														<label class="bmd-label-floating"> 나를 멋지게 소개해봐요.</label>
														<textarea class="form-control" rows="5"></textarea>
													</div>
												</div>
											</div>

											<c:url var="Withdrawal" value="Withdrawal.do">
												<c:param name="id" value="${ loginUser.id }" />
											</c:url>
											<button type="button" class="btn btn-primary Withdrawal"
												onclick="location.href='${ Withdrawal }';">탈퇴하기</button>
											
											<button type="submit" class="btn btn-primary pull-right">
												수정하기</button>
											<div class="clearfix"></div>
										</form>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</section>

	</main>


	<!-- footerInclude-->
	<%@ include file="../common/footer.jsp"%>


	<!-- Header End -->

	<!--   <script src="/FinalProject/assets/js/plugins.js"></script>
    <script src="/FinalProject/assets/js/main.js"></script>	 -->





</body>

</html>