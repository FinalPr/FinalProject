<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>

<link rel="stylesheet"
	href="/spring/resources/assets/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="/spring/resources/assets/css/owl.carousel.min.css" />
<link rel="stylesheet" href="/spring/resources/assets/css/flaticon.css" />
<link rel="stylesheet" href="/spring/resources/assets/css/slicknav.css" />
<link rel="stylesheet"
	href="/spring/resources/assets/css/animate.min.css" />
<link rel="stylesheet"
	href="/spring/resources/assets/css/magnific-popup.css" />
<link rel="stylesheet"
	href="/spring/resources/assets/css/themify-icons.css" />
<link rel="stylesheet" href="/spring/resources/assets/css/slick.css" />
<link rel="stylesheet"
	href="/spring/resources/assets/css/nice-select.css" />

<link rel="stylesheet"
	href="/spring/resources/assets/css/fontawesome-all.min.css" />
<link rel="stylesheet" href="/spring/resources/assets/css/IdPwdFind.css" />
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
            $(document).ready(function(){
           //아이디찾기버튼 클릭시 페이지 리로드
          $(".FindIdBtn").click(function(){
           location.reload();
          });
          $(".fa-chevron-left").click(function(){
           location.reload();
          });
     
          //아이디찾기 클릭시 Table 숨기처리
          $(".IdFindresult").hide();
          $(".IdTransfercompleteDiv").hide();
          $(".FindPwdSend").hide();
          $(".loginSend").hide();
          $(".FindPwdText").hide();
          $(".PwdCheck").hide();
          $(".FindPwd").hide();
          $("PwdFindresult").hide();
          $("PwdTransfercomplete").hide();
          $(".PwdFindresult").hide();
               $(".PwdTransfercomplete").hide();
           
           
                //비번찾기 클릭시 Table 숨김처리 및 배경색 변경
          $(".FindPwdBtn").click(function(){
           $(".FindId").hide();
               $(".FindTable").show();
               $(".FindPwdText").show();
               $(".FindPwd").show();
               $(".PwdCheck").show();
               $(".IdFindresult").hide();
               $(".IdCheck").hide();
               $(".nameText").hide();
               
               $(".IdTransfercompleteDiv").hide();
          $(".FindPwdSend").hide();
          $(".loginSend").hide();
           $(".FindIdBtn").css("background","white");
           $(".FindPwdBtn").css("background","darkgray");
          
          });
         
      });
       </script>

<script type="text/javascript">
$(document).ready(function(){

	$("#IdCheck").click(function(){
		//alert("이메일 인증 시작!");
	


	
     
      var bool = true;
		
      if(bool){
		
			$.ajax({
				url:"emailmember/IDFIND.do",
				type:"post",
  				dataType:"json",
				data:{
					"user_email1"  :   $("#FindIdText").val() ,
		    		 "user_email2"  :   $("#email2").val() ,
		    		 "User_name" : $("#nameText").val()
				},
				success: function(result){
			
					alert("아이디 발송 완료!");
					
					bool=false;
				},
				
				error:function(xhr, status, error){
					alert("Error : " + status + " ==> " + error);
					
				}
			
			});
	
			return location.href="login.do"
      }
	
     
	});
	
	 $("#PwdCheck").click(function(){
	  		//alert("이메일 인증 시작!");
	  	


	  	
	       
	        var bool = true;
	  		
	        if(bool){
	  		
	  			$.ajax({
	  				url:"emailmember/PWDFIND.do",
	  				type:"post",
	    				dataType:"json",
	  				data:{
	  					"user_email1"  :   $("#FindIdText").val() ,
	  		    		 "user_email2"  :   $("#email2").val() ,
	  		    		 "userid" : $("#FindPwdText").val()
	  				},
	  				success: function(result){
	  			
	  					alert("아이디 발송 완료!");
	  					
	  					bool=false;
	  				},
	  				
	  				error:function(xhr, status, error){
	  					alert("Error : " + status + " ==> " + error);
	  					
	  				}
	  			
	  			});
	  	
	  			return location.href="login.do"
	        }
	});
});
    </script>
</head>
<body>



	<!-- Main -->
	<!--아이디 찾기 및 비번찾기 -->
	<div class="IdPwdFindDiv">
		<div class="FindDiv">
			<!-- <a href="index.html">
            </a> -->
			<!-- <button type="reset">
            </button> -->
			<i class="fas fa-chevron-left"></i>
			<h3 class="FindId">아이디 찾기</h3>
			<h3 class="FindPwd">비밀번호 찾기</h3>
			<table class="FindTable">
				<tr>
					<th>
					<td>
						<button type="button" id="FindIdBtn" class="FindIdBtn">아이디찾기</button>
						<button type="button" id="FindPwdBtn" class="FindPwdBtn">비밀번호찾기</button>
						<input type="text" id="nameText" class="nameText"
						placeholder="이름입력"> 
						<input type="text" id="FindPwdText" class="FindPwdText"
						placeholder="아이디입력"> 
						<input type="text" id="FindIdText" class="FindIdText"
						placeholder="이메일입력"><span>@</span> <select name="email2"
						id="email2" class="email2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
					</select> 

						<button type="submit" id="IdCheck" class="IdCheck">아이디 찾기</button>
						<button type="submit" id=PwdCheck class="PwdCheck">비밀번호
							찾기</button>
					</td>

					</th>
				</tr>
			</table>

		</div>

	</div>


</body>
</html>