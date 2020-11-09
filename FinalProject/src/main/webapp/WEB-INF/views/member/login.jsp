<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
     <link rel="stylesheet" href="/spring/resources/assets/css/main.css">
       <!-- Jquery Plugins, main Jquery -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://www.google.com/recaptcha/api.js"></script>
 <script>
$(function() {
$('.g-recaptcha').submit(function() {
		var captcha = 1;
		$.ajax({
            url: 'VerifyRecaptcha',
            type: 'post',
            data: {
                recaptcha: $("#g-recaptcha-response").val()
            },
            success: function(data) {
                switch (data) {
                    case 0:
                        console.log("자동 가입 방지 봇 통과");
                        captcha = 0;
                		break;
                    case 1:
                        alert("자동 가입 방지 봇을 확인 한뒤 진행 해 주세요.");
                        break;
                    default:
                        alert("자동 가입 방지 봇을 실행 하던 중 오류가 발생 했습니다. [Error bot Code : " + Number(data) + "]");
                   		break;
                }
            }
        });
		if(captcha != 0) {
			return false;
		} 
});
});
</script>
    
</head>
   <body>
    <!-- Preloader Start -->
	<%@ include file="../common/header.jsp"%>

   <!-- slider Area Start-->
    <div class="slider-area">
      <!-- Mobile Menu -->
      <div
        class="single-slider slider-height2 d-flex align-items-center"
        data-background="/spring/resources/assets/img/hero/category.jpg"
      >
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
                  	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;지금 바로 가입하세요 !&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                  	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;당신이 원하던 상품들이 기다립니다 !&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
                <a href="SignUp.do" class="btn_3">회원가입!</a>
              </div>
            </div>
          </div>
          <div class="col-lg-6 col-md-6">
            <div class="login_part_form">
              <div class="login_part_form_iner">
                <h3>
                  Welcome Back ! <br />
                  	환영합니다!
                </h3>
             
                <form
                  class="row contact_form"
                  action="login.do"
                  id="add_member_form"
                  method="post"
                  novalidate="novalidate"
                >
                  <div class="col-md-12 form-group p_star">
                    <input
                      type="text"
                      class="form-control"
                      id="name"
                      name="id"
                      value=""
                      placeholder="Id"
                    />
                  </div>
                  <div class="col-md-12 form-group p_star">
                    <input
                      type="password"
                      class="form-control"
                      id="password"
                      name="password"
                      value=""
                      placeholder="Password"
                    />
                  </div>
                  <div class="col-md-12 form-group">
                    <div class="creat_account d-flex align-items-center">
                      <input type="checkbox" id="f-option" name="selector" />
                      <label for="f-option">기억해두기</label>
                    </div>
                     <input type="image" src="/spring/resources/assets/img/kakaologo.png" class="kakaologo">
                    <input type="image" src="/spring/resources/assets/img/naverlogo.png" class="naverlogo">
                    <input type="image" src="/spring/resources/assets/img/googlelogo.png" class="googlelogo">
                    <button type="submit" value="submit" class="btn_3">
                    	  로그인
                    </button>
                    <a class="lost_pass" href="findId.do">아이디/비밀번호 찾기 !</a>
                    <!-- <a class="lost_pass" href="findPwd.do">비밀번호를 잊어버리셨나요??</a> -->
                    <button class="g_recaptchaBtn">
                  <div class="g-recaptcha" data-sitekey="6LcNeOAZAAAAAG9uNAlkRpk1GtTWChLPEyYSaTvn"></div>
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