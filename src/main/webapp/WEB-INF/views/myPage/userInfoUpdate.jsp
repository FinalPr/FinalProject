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


<script type="text/javascript">
$(document).ready(function(){
	$("#email2").mouseover (function(){
		

		if($("#email").val().length < 5){
			$(".guide2").hide();
			$("#emailDuplicateCheck").val(0);
			return;
		}
		
		$.ajax({
			url:"emailCheck.do",
			
			data:{
				"email" : $("#email").val(),
				"email2" : $("#email2").val()
				},
			type:"post",
			
			success:function(data){
				console.log(data);
				if(data == "ok"){
					$(".error2").hide();
					$(".ok2").show();
					$("#emailDuplicateCheck").val(1);
					
				}else{
					$(".ok2").hide();
					$(".error2").show();
					$("#emailDuplicateCheck").val(0);
				
				}
			},
			error:function(jqxhr, textStatus,errorThrown){
				console.log("ajax 처리 실패");
				//에러 로그
				console.log(jqxhr);
				console.log(textStatus);
				console.log(errorThrown);
			}
		});
			
			
		});
	
	$("#btemail").click(function(){
		//alert("이메일 인증 시작!");
	
	
      var key;//인증키
      var bool = true;
      var num = 60 * 1; // 몇분을 설정할지의 대한 변수 선언
      var myVar;
      function time(){
          myVar = setInterval(alertFunc, 1000); 
      }
      time();
   
      function alertFunc() {
          var min = num / 60; 
          min = Math.floor(min);
           
          var sec = num - (60 * min);
          console.log(min)
          console.log(sec)
 		 
          var $input = $('.countdown').val(min + '분' + sec + '초');
          if(num == 0){
              clearInterval(myVar) // num 이 0초가 되었을대 clearInterval로 타이머 종료\
              $('#writechk').attr("disabled","disabled");
           
				
				$("#btemail").val("인증번호 재 발송!");
              alert("메일 전송에 실패하였습니다. 다시 전송해주시기 바랍니다.");
          }else{
        	
					
					
					 $('#writechk').attr("disabled",false);
				
          }
         
          num--;
      }


     


    
      if(bool){
		
			$.ajax({
				url:"emailmember/certifiedMail.do",
				type:"post",
  				dataType:"json",
				data:{
					"user_email1"  :   $("#email").val() ,
		    		 "user_email2"  :   $("#email2").val()
				},
				success: function(result){
			
					alert("인증번호 발송!");
					key=result;
					bool=false;
				},
				
				error:function(xhr, status, error){
					
		            	   alert("Error : " + status + " ==> " + error);
					
					
				}
			
			});
			$("#writechk").show();	//이메일 인증 입력란.				
			$(".btemail").val("인증번호 확인!"); //이메일 인증 버튼 -> 내용 변경
			$("#writechk").keyup(function(){
				if($("#writechk").val()>=6){
					var userContent = $("#writechk").val();
					//alert(userContent);

					if(userContent == key){
						alert("인증 성공!");
						$("#emailchk").val("Y");// 숨겨져있음 -> DB에 저장할거임 (Y/N)
						$("#btemail").val("인증완료!");
						
						  if(num != 0){
						      
						   
						      clearInterval(myVar);
						      starFlag = true;
			        	  }	
						$(".countdown").hide();
						$("#btemail").attr("disabled", true);//읽기전용으로 변환 
						$("#writechk").attr("disabled", true);
					}else {
						$("#emailchk").val("N");
						
						$("#btemail").val("인증번호 재 발송!");
						event.preventDefault();
					}
				}
			});//keyup
		}else {//Y
			alert("test1 => false");
			event.preventDefault();
		}
		
	});
	$("#emailchk").val("Y");
	


	 $('.btn-ajax-submit').on('click', function() {
		
         
         //formdata 생성
         var formData = new FormData(document.getElementById('add_userinfo_form'));
         
         formData.append("file", $('input[name=UserFile]')[0].files[0]);
         
         $.ajax({
             url : "fileupdate.do",
             type : 'POST',
             dataType : "json",
             enctype: 'multipart/form-data',
             processData: false,
             contentType: false,
             data : formData,
             success : function(data) {
            	  console.log('Ajax submit error');
             },
             error : function(data) {
                 console.log('Ajax submit error');
             }
            	 
           
         });//end ajax
       
     });
	
});
</script>
<script>
$(function (){
	$(".addressSearch").click(function(){
		$('#sample6_postcode').val('');
		$('#sample6_address').val('');
		$('#sample6_address2').val('');
	});
	
	$(".pull-right").click(function(){
		
		if($('.email').val().length==0){
  			 alert("이메일을입력하세요.");
  			return  $('.email').focus();
		}else if($('.email2').val().length==0){
 			 alert("도메인을 입력하세요.");
   			return  $('.email2').focus();
 		}else if($('#sample6_postcode').val().length==0){
			 alert("우편번호을 입력하세요.");
	   			return  $('#sample6_postcode').focus();
	 	}else  if($('#sample6_address').val().length==0){
			 alert("주소을 입력하세요.");
	   			return  $('#sample6_address').focus();
	 	}else  if($('#sample6_address2').val().length==0){
			 alert("주소상세을 입력하세요.");
	   			return  false;
	 	}else if($('#phone').val().length==0){
			 alert("전화번호를 입력하세요.");
	   			return  false;
	 	}else if($('#AboutMe').val().length==0){
			 alert("자기소개를 입력하세요.");
	   			return  $('#AboutMe').focus();
	 	}else if($("#emailchk").val()== ""){
		   	  
				//이메일 인증 수행안했는지  족건확인
				alert("이메일 인증이 수행되지 않았습니다!");
				event.preventDefault();
				return $('#email').focus();
			}else{
					 // 위에 조건 true일시 login서블릿 전송
	        $("#add_userinfo_form").submit();
	        alert("회원정보가 수정되었습니다.!");
	    }
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
								
											
												<c:choose>
											<c:when test="${userId !=null }">
											<input type="hidden" name="id" value="${ userInfo.email}">
											<div class="col-md-5">
												<div class="form-group">
													<label class="bmd-label-floating">이름 (닉네임)</label> <input
														type="text" name="username" id="userId" class="form-control"
														value="${  userInfo.nickname}" readonly />
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
													<a onclick=document.all.UserFile.click(); id="imgTest"><i class="fas fa-image" ></i></a>
												</div>
													<input type="file"   name="UserFile" id="UserFile" onchange="readURL(this);" style="display: none;">
											   
											    </div>
													


												 <button type="button" class="btn btn-primary btn-ajax-submit">업로드</button>
												<script type="text/javascript">
												function readURL(input) {
													if (input.files && input.files[0]) {
													var reader = new FileReader();
													reader.onload = function (e) {
													$('#imgInput').attr('src', e.target.result);
													}
													reader.readAsDataURL(input.files[0]);
													}
													}


</script>
											</div>
											
											<c:forTokens var="email" items="${ userInfo.email }"
											delims="@" varStatus="emailstatus">
												<div class="col-md-4">
													<div class="form-group">
													<c:if test="${emailstatus.index == 0 }">
													
														<label class="bmd-label-floating ">이메일</label> <input
															type="email" id="email" name="email" value="${email }"class="form-control email" readonly  /> 
													</c:if>	
													
													
													<c:if test="${emailstatus.index == 1 }">	
													<span class="emailCenter">@</span> 
															<input type="email"
															id="email2" name="email2" value="${email }" class="form-control email2"  readonly/>
															
												</c:if>			
													</div>
												
												</div>
												
												</c:forTokens>
												
									
											
												<div class="col-md-12">

													<div class="form-group">
														<input type="text" class="form-control address_from"
															id="sample6_postcode" value="${ addr }" name="postCode"
															placeholder="우편번호">
														<button type="button" class=" addressSearch"
															value="우편번호 찾기&nbsp;"
															onclick="sample6_execDaumPostcode()">주소검색</button>
													</div>

												</div>
										
											
												<div class="col-md-12">

													<div class="form-group">
														<input type="text" class="form-control address_from"
															id="sample6_address" value="${ addr }" name="roadAddress"
															placeholder="도로명주소" readonly />
													</div>
												</div>
										
											
												<div class="col-md-12">

													<div class="form-group">
														<input type="text" class="form-control address_from"
															id="sample6_address2" value="${ addr }"
															name="detailAddress" placeholder="상세주소" />
													</div>
												</div>
											
										
										<script>
     
                    function sample6_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function(data) {

                    var themeObj = {
                    bgColor: "#162525", //바탕 배경색
                    searchBgColor: "#162525", //검색창 배경색
                    contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
                    pageBgColor: "#162525", //페이지 배경색
                    textColor: "#FFFFFF", //기본 글자색
                    queryTextColor: "#FFFFFF", //검색창 글자색
                    //postcodeTextColor: "", //우편번호 글자색
                    //emphTextColor: "", //강조 글자색
                    outlineColor: "#444444" //테두리
                    };

                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var fullAddr = ''; // 최종 주소 변수
                            var extraAddr = ''; // 조합형 주소 변수

                            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                fullAddr = data.roadAddress;

                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                fullAddr = data.jibunAddress;
                            }

                            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                            if(data.userSelectedType === 'R'){
                                //법정동명이 있을 경우 추가한다.
                                if(data.bname !== ''){
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있을 경우 추가한다.
                                if(data.buildingName !== ''){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                            document.getElementById('sample6_address').value = fullAddr;

                                // 커서를 상세주소 필드로 이동한다.
                                document.getElementById('sample6_address2').focus();
                            }
                    }).open();
                  }
 </script>
									
									<div class="col-md-4">
										<div class="form-group">
											<label class="bmd-label-floating PhoneNumber">휴대폰 번호</label> <input
												type="text" name="phone" id="phone"value="${ loginUser.phone }"class="form-control PhoneText" />
										</div>
									</div>



									<div class="col-md-12">
										<div class="form-group">
											<label class="bmd-label-floating AboutMe">자기 소개</label>
											<div class="form-group">

												<textarea  name="self_introduction" id="AboutMe"class="form-control AboutMeText" rows="5"
													placeholder="나를 멋지게 소개해봐요.">${ loginUser.self_introduction }</textarea>
											</div>
										</div>
									</div>
						
																		<button type="button" class="btn btn-primary Withdrawal"
									onclick="location.href='WithdrawalPage.do';">탈퇴하기</button>
									
									<button type="submit" class="btn btn-primary pull-right"
									>수정하기</button>
									<div class="clearfix"></div>
							
											</c:when>
											
											<c:when test="${loginUser.email !=null }">
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
													<a onclick=document.all.UserFile.click(); id="imgTest"><i class="fas fa-image" ></i></a>
													
												</div>
													<input type="file"   name="UserFile" id="UserFile" onchange="readURL(this);" style="display: none;">
											   
											    </div>
													


												 <button type="button" class="btn btn-primary btn-ajax-submit">업로드</button>
												<script type="text/javascript">
												function readURL(input) {
													if (input.files && input.files[0]) {
													var reader = new FileReader();
													reader.onload = function (e) {
													$('#imgInput').attr('src', e.target.result);
													}
													reader.readAsDataURL(input.files[0]);
													}
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
															 <input
															type="button" name="btemail" class="btemailBtn"
															id="btemail" value="인증번호 발송!">
												</c:if>
												
												</div>
												
													</div>
												</c:forTokens>
													<span class="guide2 ok2">사용가능</span> <span
						class="guide2 error2">사용불가능</span> <input type="hidden"
						name="emailDuplicateCheck" id="emailDuplicateCheck" value="0">	
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<input type="text" name="writechk" class="form-control Certified"
												id="writechk" value=""> <span id="explainsp"
												class="bmd-label-floating CertifiedText">*메일로 보내드린 인증번호 6자리를
												입력해주세요.  </span> <input type="text" class="countdown"
												readonly> <input type="hidden" name="emailChk"
												class="emailchk" id="emailchk" value=""
												style="background: yellow;">
										</div>
									</div>			
											
										

									<c:if test="${ loginUser.address==null }">
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
									<c:if test="${ loginUser.address !=null }">
										<c:forTokens var="addr" items="${ loginUser.address }"
											delims="," varStatus="status">
											<c:if test="${ status.index == 0 }">
												<div class="col-md-12">

													<div class="form-group">
														<input type="text" class="form-control address_from"
															id="sample6_postcode" value="${ addr }" name="postCode"
															placeholder="우편번호">
														<button type="button" class=" addressSearch"
															value="우편번호 찾기&nbsp;"
															onclick="sample6_execDaumPostcode()">주소검색</button>
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
										<script>
     
                    function sample6_execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function(data) {

                    var themeObj = {
                    bgColor: "#162525", //바탕 배경색
                    searchBgColor: "#162525", //검색창 배경색
                    contentBgColor: "#162525", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
                    pageBgColor: "#162525", //페이지 배경색
                    textColor: "#FFFFFF", //기본 글자색
                    queryTextColor: "#FFFFFF", //검색창 글자색
                    //postcodeTextColor: "", //우편번호 글자색
                    //emphTextColor: "", //강조 글자색
                    outlineColor: "#444444" //테두리
                    };

                            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                            var fullAddr = ''; // 최종 주소 변수
                            var extraAddr = ''; // 조합형 주소 변수

                            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                fullAddr = data.roadAddress;

                            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                fullAddr = data.jibunAddress;
                            }

                            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                            if(data.userSelectedType === 'R'){
                                //법정동명이 있을 경우 추가한다.
                                if(data.bname !== ''){
                                    extraAddr += data.bname;
                                }
                                // 건물명이 있을 경우 추가한다.
                                if(data.buildingName !== ''){
                                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                }
                                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                            }

                            // 우편번호와 주소 정보를 해당 필드에 넣는다.
                            document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                            document.getElementById('sample6_address').value = fullAddr;

                                // 커서를 상세주소 필드로 이동한다.
                                document.getElementById('sample6_address2').focus();
                            }
                    }).open();
                  }
 </script>
									</c:if>
									<div class="col-md-4">
										<div class="form-group">
											<label class="bmd-label-floating PhoneNumber">휴대폰 번호</label> <input
												type="text" name="phone" id="phone"value="${ loginUser.phone }"class="form-control PhoneText" />
										</div>
									</div>



									<div class="col-md-12">
										<div class="form-group">
											<label class="bmd-label-floating AboutMe">자기 소개</label>
											<div class="form-group">

												<textarea  name="self_introduction" id="AboutMe"class="form-control AboutMeText" rows="5"
													placeholder="나를 멋지게 소개해봐요.">${ loginUser.self_introduction }</textarea>
											</div>
										</div>
									</div>
									<button type="button" class="btn btn-primary Withdrawal"
									onclick="location.href='WithdrawalPage.do';">탈퇴하기</button>
									
									<button type="submit" class="btn btn-primary pull-right"
									>수정하기</button>
									<div class="clearfix"></div>
									</c:when>
											</c:choose>
						
									
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