<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<!-- <link rel="stylesheet" -->
<!-- 	href="/spring/resources/assets/css/style-minju.css"> -->
<link rel="stylesheet"
	href="/spring/resources/assets/css/main-minju.css?asd">
<link rel="stylesheet"
	href="/spring/resources/assets/css/mypage-minju.css?asd">
<link rel="stylesheet"
	href="/spring/resources/assets/css/UserInfoUpdate.css?asd">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript"
	src="http://t1.daumcdn.net/postcode/api/core/200421/1587459050284/200421.js"></script>
<!-- <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="httpRequest.js"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<style>
.userScope{
    margin-left: -17px;
    font-size: 18px;
}
.scope{
       color: orange;
    font-size: 19px;
    width: 107px;
    margin-left: 99px;
    display: block;
    margin-top: -27px;
}
</style>
<script type="text/javascript">
$(function (){
	
	
	$(".pull-right").click(function(){
		
		location.href="userInfoUpdate.do";
	});
	

	
});
</script>

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
									
									
										<form action="userUpdate.do" id="add_userinfo_form"
											name="add_userinfo_form" method="post"
											novalidate="novalidate" enctype="multipart/form-data">
									<div class="card-body">
								
											
												
										
													


											
										
											<input type="hidden" name="id" value="${ loginUser.id}">
												<div class="col-md-5">
												<div class="form-group">
													<label class="bmd-label-floating">이름 (닉네임)</label> <input
														type="text" name="username" id="userId" class="form-control"
														value="${  loginUser.username}" readonly />
												</div>

											</div>
											<div class="ImgDiv">
											<input type="hidden" name="originalFileName" value="${ loginUser.originalFileName }">
											<input type="hidden" name="renameFileName" value="${ loginUser.renameFileName }">
												<div id='preview' class="previewCss">
											        <!-- 미리보기 공간 -->
											    <div id="thumbnails">
</div>




												<img src="/spring/resources/buploadFiles/${ loginUser.renameFileName }"
													class="myImg" id="imgInput" >
												<div class="IMGicon">
												
													
												</div>
												
											   
											    </div>
										
										<span class="userScope">사용자 평점 : </span>
										<div class="scope"id="scope"></div>
						<script>

		var num= "${memberlist.star}";
		var count = Math.floor(num);
		for(var i =0;i<count;i++){
	        $('#scope').append(' <i class="fas fa-star"></i>');
	      }
		if(num -count != 0){//소수점 있는지 확인
			  $('#scope').append(' <i class="fas fa-star-half"></i>');
		}
	
		

</script>

								
										</div>
											
											<c:forTokens var="email" items="${ loginUser.email }"
											delims="@" varStatus="emailstatus">
												<div class="col-md-4">
													<div class="form-group">
													<c:if test="${emailstatus.index == 0 }">
													
														<label class="bmd-label-floating">이메일</label> <input
															type="email" id="email" name="email" value="${email }"class="form-control email"  /> 
													</c:if>	
													
													
													<c:if test="${emailstatus.index == 1 }">	
													<span class="emailCenter">@</span> 
															<input type="email"
															id="email2" name="email2" value="${email }" class="form-control email2"  />
															 
															
												</c:if>
												
												</div>
												
													</div>
												</c:forTokens>
													
									</div>
									<div class="col-md-4">
										
									</div>			
											
										

									<c:if test="${ loginUser.address== null}">
										<div class="col-md-12 kakaoaddress">

											<div class="form-group">
												<input type="text" class="form-control address_from"
													id="sample6_postcode" name="postCode" placeholder="우편번호">
												<button type="button" class=" addressSearch"
													value="우편번호 찾기&nbsp;" onclick="sample6_execDaumPostcode()">주소검색</button>
											</div>

										</div>
										<div class="col-md-12">

											<div class="form-group">
												<input type="text" class="form-control address_from"
													id="sample6_address" name="roadAddress" placeholder="도로명주소"
													readonly />
											</div>
										</div>
										<div class="col-md-12">

											<div class="form-group">
												<input type="text" class="form-control address_from"
													id="sample6_address2" name="detailAddress"
													placeholder="상세주소" />
											</div>
										</div>
									</c:if>
									<c:if test="${ loginUser.address== memberlist.address }">
										<c:forTokens var="addr" items="${ loginUser.address }"
											delims="," varStatus="status">
											<c:if test="${ status.index == 0 }">
												<div class="col-md-12">

													<div class="form-group">
														<input type="text" class="form-control address_from"
															id="sample6_postcode" value="${ addr }" name="postCode"
															placeholder="우편번호">
														
													</div>

												</div>
											</c:if>
											<c:if test="${ status.index == 1 }">
												<div class="col-md-12">

													<div class="form-group">
														<input type="text" class="form-control address_from"
															id="sample6_address" value="${ addr }" name="roadAddress"
															placeholder="도로명주소" readonly />
													</div>
												</div>
											</c:if>
											<c:if test="${ status.index == 2 }">
												<div class="col-md-12">

													<div class="form-group">
														<input type="text" class="form-control address_from"
															id="sample6_address2" value="${ addr }"
															name="detailAddress" placeholder="상세주소" />
													</div>
												</div>
											</c:if>
										</c:forTokens>
		
									</c:if>
									<c:if test="${ loginUser.phone== memberlist.phone }">
									<div class="col-md-4">
										<div class="form-group">
											<label class="bmd-label-floating PhoneNumber">휴대폰 번호</label> <input
												type="text" name="phone" id="phone"value="${ loginUser.phone }"class="form-control PhoneText" />
										</div>
									</div>
									</c:if>


									<div class="col-md-12">
										<div class="form-group">
											<label class="bmd-label-floating AboutMe">자기 소개</label>
											<div class="form-group">

												<textarea  name="self_introduction" id="AboutMe"class="form-control AboutMeText" rows="5"
													placeholder="나를 멋지게 소개해봐요.">${ loginUser.self_introduction }</textarea>
											</div>
										</div>
									</div>
									
									<c:if test="${ loginUser.id == memberlist.id }">
									<button type="button" class="btn btn-primary pull-right"
									>수정하기</button>
									<div class="clearfix"></div>
									</c:if>
									
									
						
									
								</form>

			
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