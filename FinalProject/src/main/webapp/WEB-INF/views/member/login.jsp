<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<link rel="stylesheet" href="/spring/resources/assets/css/main.css">
<!-- Jquery Plugins, main Jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>



<script>
	$(function() {
		$('.g-recaptcha')
				.submit(
						function() {
							var captcha = 1;
							$
									.ajax({
										url : 'VerifyRecaptcha',
										type : 'post',
										data : {
											recaptcha : $(
													"#g-recaptcha-response")
													.val()
										},
										success : function(data) {
											switch (data) {
											case 0:
												console.log("자동 가입 방지 봇 통과");
												captcha = 0;
												break;
											case 1:
												alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
												break;
											default:
												alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : "
														+ Number(data) + "]");
												break;
											}
										}
									});
							if (captcha != 0) {
								return false;
							}
						});

	});
	
	
</script>

<script type="text/javascript">
$(document).ready(function(){
	


	
	
	  //Id 쿠키 저장
        var userInputId = getCookie("userInputId");
        $("input[name='id']").val(userInputId); 
      //Pwd 쿠키 저장 
        var userInputPwd = getCookie("userInputPwd");
        $("input[name='password']").val(userInputPwd); 
        
        if($("input[name='id']").val() != "" && $("input[name='password']").val() != ""){ 
            $("#f-option").attr("checked", true); 
        }

        $("#f-option").change(function(){ 
            if($("#f-option").is(":checked")){                     
                var userInputId = $("input[name='id']").val();
                setCookie("userInputId", userInputId, 365);
                var userInputPwd = $("input[name='password']").val();
                setCookie("userInputPwd", userInputPwd, 365);
            }else{ 
                deleteCookie("userInputId");
                deleteCookie("userInputPwd");
//                 $("#f-option").attr("disabled", true);
                $('#id').val('');
                $('#password').val('');
            }
        });
         
      
        $("input[name='id']").keyup(function(){ 
            if($("#f-option").is(":checked")){ 
                var userInputId = $("input[name='id']").val();
                setCookie("userInputId", userInputId, 365);
            }
        });
        
      
        $("input[name='password']").keyup(function(){ 
            if($("#f-option").is(":checked")){ 
                var userInputPwd = $("input[name='password']").val();
                setCookie("userInputPwd", userInputPwd, 365);
            }
        });


	
	// 로그인 버튼 클릭시 id,pwd,리캡차 값이 없을 시 경고창 출력
	$("#btn_3").on("click",function(){
	 if($("#id").val().length==0){
   			 alert("이름을입력하세요.");
   			return  $('.id').focus();
   	 }else if($("#password").val().length==0){
			 alert("비밀번호를 입력하세요.");
   			return  $('#password').focus();
   	 }else if(grecaptcha.getResponse() == ""){
   		 alert("리캡챠를 체크해야 합니다.");
   		 return false;
   	 }else{
   		signUp()
       }
	   }); 
	
	function signUp(){
		
		$.ajax({
			url:"idCheck.do",
			data:{"id":$("#id").val(),
				"pwd":$("#password").val()},
			type:"post",
			success:function(data){
				console.log(data);
			
				if(data ==  "ok"){
					alert("오ㅇ!마켓에 온것을 환영합니다.");
					 $("#add_member_form").submit();
				}else if(data == "fail"){
					alert("아이디및 비밀번호가 틀립니다 다시입력해주세요.");
					return false;
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
		
		
	}
		
		
	   	
	
	
	
	// ID를 btn_3로 가지는 곳에서 키를 누를 경우
    $("#id").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) {
            //ID가 btn_3을 찾아 클릭해준다.
            //버튼 말고도 p태그나 다른 태그도 다 응용 가능 합니다.
            //대신 이벤트 발생을 위해서는 29번쨰 줄 코드처럼 이벤트를 걸어줘야 합니다.
            $("#btn_3").click();
            return false;
        }
    });

 // password를 btn_3로 가지는 곳에서 키를 누를 경우
    $("#password").keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) {
            //ID가 btn_3을 찾아 클릭해준다.
            //버튼 말고도 p태그나 다른 태그도 다 응용 가능 합니다.
            //대신 이벤트 발생을 위해서는 29번쨰 줄 코드처럼 이벤트를 걸어줘야 합니다.
            $("#btn_3").click();
            return false;
        }
    });

 // recaptcha를 btn_3로 가지는 곳에서 키를 누를 경우
    $(grecaptcha.getResponse()).keydown(function(key) {
        //키의 코드가 13번일 경우 (13번은 엔터키)
        if (key.keyCode == 13) {
            //ID가 btn_3을 찾아 클릭해준다.
            //버튼 말고도 p태그나 다른 태그도 다 응용 가능 합니다.
            //대신 이벤트 발생을 위해서는 29번쨰 줄 코드처럼 이벤트를 걸어줘야 합니다.
            $("#btn_3").click();
            return false;
        }
    });

 

  


});//END
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1); //어제날짜를 쿠키 소멸날짜로 설정
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
 </script>


</head>
<body>
	<!-- Preloader Start -->
	<%@ include file="../common/header.jsp"%>

	<!-- slider Area Start-->
	<div class="slider-area">
		<!-- Mobile Menu -->
		<div class="single-slider slider-height2 d-flex align-items-center"
			data-background="/spring/resources/assets/img/hero/category.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>로그인</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider Area End-->

	<!--================login_part Area =================-->
	<section class="login_part section_padding">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-6 col-md-6">
					<div class="login_part_text text-center">
						<div class="login_part_text_iner">
							<h2>새로 오셨나요?</h2>
							<p>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지금
								바로 가입하세요
								!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;당신이
								원하던 상품들이 기다립니다
								!&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</p>
							<a href="SignUp.do" class="btn_3">회원가입!</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="login_part_form">
						<div class="login_part_form_iner">
							<h3>
								Welcome Back ! <br /> 환영합니다!
							</h3>

							<form class="row contact_form" action="login.do"
								id="add_member_form" name="add_member_form" method="post" novalidate="novalidate">
								<div class="col-md-12 form-group p_star">
									<input type="text" class="form-control" id="id" name="id"
										value="" placeholder="Id" />
										<input type="hidden"
						name="idDuplicateCheck" id="idDuplicateCheck" value="0">
								</div>
								<div class="col-md-12 form-group p_star">
									<input type="password" class="form-control" id="password"
										name="password" value="" placeholder="Password" />
								<input type="hidden"
						name="pwdDuplicateCheck" id="pwdDuplicateCheck" value="0">
								</div>
								<div class="col-md-12 form-group">
									<div class="creat_account d-flex align-items-center">
										<input type="checkbox" id="f-option" name="f-option" /> <label
											for="f-option">기억해두기</label>
									</div>
									<a
										href="https://kauth.kakao.com/oauth/authorize?
									client_id=b9eab9e4eaa46a5905bf7f57621f16ae
									&redirect_uri=http://localhost:8233/spring/KaKaologin.do
									&response_type=code">
										<img src="/spring/resources/assets/img/kakaologo.png"
										class="kakaologo">
									</a> <input type="image"
										src="/spring/resources/assets/img/naverlogo.png"
										class="naverlogo"> <input type="image"
										src="/spring/resources/assets/img/googlelogo.png"
										class="googlelogo">
									<button type="button" value="submit" id="btn_3" class="btn_3">
										로그인</button>
									
									<a class="lost_pass" href="findId.do">아이디/비밀번호 찾기 !</a>
									<!-- <a class="lost_pass" href="findPwd.do">비밀번호를 잊어버리셨나요??</a> -->
									<button type="button" class="g_recaptchaBtn"  id="edit" value="true">
										<div class="g-recaptcha"
											data-sitekey="6LcNeOAZAAAAAG9uNAlkRpk1GtTWChLPEyYSaTvn"></div>
									</button>
								</div>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================login_part end =================-->


	<%@ include file="../common/footer.jsp"%>


	<!-- Header End -->







</body>

</html>