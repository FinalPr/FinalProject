<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<link rel="stylesheet"
	href="/spring/resources/assets/css/SignUp.css?after">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script charset="UTF-8" type="text/javascript"
	src="http://t1.daumcdn.net/postcode/api/core/200421/1587459050284/200421.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<!-- <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> -->
<script type="text/javascript" src="httpRequest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>


<!-- ajax 적용 -->
<script>
		
	
		$(function(){
			
			$("#UserId").keyup(function(){
				var Userid = $("#UserId").val();
				 var idReg = /^[a-z]+[a-z0-9]{5,19}$/g;
				var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				if(Userid.length < 5||Userid.length > 15||!idReg.test(Userid)|| hangulcheck.test(Userid) || !Userid.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi) ){
					$(".guide").hide();
					$(".error").show();
					$("#idDuplicateCheck").val(0);
					return;
				}
				$.ajax({
					url:"idCheck.do",
					data:{"id":$("#UserId").val()},
					type:"post",
					success:function(data){
						console.log(data);
						if(data == "ok"){
							$(".error").hide();
							$(".ok").show();
							$("#idDuplicateCheck").val(1);
						}else{
							$(".ok").hide();
							$(".error").show();
							$("#idDuplicateCheck").val(0);
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
			
			
	
		}); 
	</script>






<script>
$(function(){
	
		$("#emailTitl").mouseleave (function(){
			
		
	
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
	
		
		
$("#email2").click(function(){
	

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


	$("#checkPwd").show();
	$("#checkPwdOK").hide();

	$('#pwd').keyup(function(){
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
        var pwd1=$("#pwd").val();
        var pwd2=$("#pwd_check").val();
        
        if(false === reg.test(pwd1)) {
    		$(".guide1").hide();
    		$(".error1").show();
    		$("#pwdDuplicateCheck").val(0);
    		
    	}else{
    		$(".error1").hide();
    		$(".ok1").show();
    		$("#pwdDuplicateCheck").val(1);
    		
    	}
        if(pwd1 != "" || pwd2 != ""){
            if(pwd1 == pwd2){   
                $("#checkPwdOK").show();
                $("#checkPwd").hide();
                
            }else{
                $("#checkPwdOK").hide();
                $("#checkPwd").show();
                return;
            }    
        }
        
        
	});
	
		
	
	$('#pwd_check').keyup(function(){
		
		
        var pwd1=$("#pwd").val();
        var pwd2=$("#pwd_check").val();
        if(pwd1 != "" || pwd2 != ""){
            if(pwd1 == pwd2){   
                $("#checkPwdOK").show();
                $("#checkPwd").hide();
                return;
            }else{
                $("#checkPwdOK").hide();
                $("#checkPwd").show();
                return;
            }    
        }

	});

});
</script>
<script type="text/javascript">
$(document).ready(function(){

	$("#btemail").click(function(){
		//alert("이메일 인증 시작!");
	
	
      var key;//인증키
      var bool = true;
      var num = 60 * 1; // 몇분을 설정할지의 대한 변수 선언
      var myVar;
    


     


    
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
			$(".writechk").show();	//이메일 인증 입력란.				
			$(".btemail").val("인증번호 확인!"); //이메일 인증 버튼 -> 내용 변경
			$(".writechk").keyup(function(){
				if($(".writechk").val()>=6){
					var userContent = $(".writechk").val();
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
						$(".writechk").attr("disabled", true);
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
		
	});//jquery
	
	$("#nextBtn").click(function(){

		var pw = $(".password").val();
		var id = $("#UserId").val();
		
		var reg = /^(?=.*?[a-z])(?=.*?[0-9])/;
		var pwreg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		 
	       if($("#agree_service_check0").is(":checked") == false){
	    	 //이용약관체크 체크 조건확인
	           alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다.");
	           return;
	       }else if($("#agree_service_check1").is(":checked") == false){
	    	 //이용약관체크 체크 조건확인2
	           alert("모든 약관에 동의 하셔야 다음 단계로 진행 가능합니다..");
	           return;
	       }else if(id.length < 5 || id.length > 15){
	    	   alert("5자리 ~ 15자리 이내로 입력해주세요.");
	    	   
	    	   return $('#UserId').focus();
	    	  }else if(false === reg.test(id)) {
	    		alert('숫자/소문자를 모두 포함해야 합니다.');
	   	}else if(/(\w)\1\1\1/.test(id)){
	   	 alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
	   	 return $('#UserId').focus();
	   	 }else if(id.search(/\s/) != -1){
	   	 alert("아이디는 공백 없이 입력해주세요.");
	   	 return $('#UserId').focus();
	   	 }else if(hangulcheck.test(id)){
	   	 alert("아이디에 한글을 사용 할 수 없습니다."); 
	   	 return $('#UserId').focus();
	   	 }else if(pw.length < 8 || pw.length > 20){
	    	   alert("비밀번호는 8자리 ~ 20자리 이내로 입력해주세요.");
	    	   return $('.password').focus();
	    }else if(false === pwreg.test(pw)) {
	    		alert('숫자/대문자/소문자를 모두 포함해야 합니다.');
	    		  return $('.password').focus();
	   	}else if(/(\w)\1\1\1/.test(pw)){
	   	 alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
	   	 return  $('.password').focus();
	   	 }else if(pw.search(id) > -1){
		        alert("비밀번호에 아이디가 포함되었습니다.");
		        return  $('.password').focus();
		    }else if(pw.search(/\s/) != -1){
	   	 alert("비밀번호는 공백 없이 입력해주세요.");
	   	 return  $('.password').focus();
	   	 }else if(hangulcheck.test(pw)){
	   	 alert("비밀번호에 한글을 사용 할 수 없습니다."); 
	   	 return  $('.password').focus();
	   	 }else if($('.UserName').val().length==0){
	   			 alert("이름을입력하세요.");
	   			return  $('.UserName').focus();
	   	 }else if($('#email').val().length==0){
   			 alert("이메일을입력하세요.");
	   			return  $('#email').focus();
	   	 }else if($('#sample6_postcode').val().length==0 && $('#sample6_address').val().length==0 && $('#sample6_address2').val().length==0){
   			 alert("주소및주소상세를 입력하세요.");
	   			return  $('#sample6_postcode').focus();
	   	 }else  if($("#emailchk").val()== ""){
	   	  
				//이메일 인증 수행안했는지  족건확인
				alert("이메일 인증이 수행되지 않았습니다!");
				event.preventDefault();
				return $('#email').focus();
			}else{
					 // 위에 조건 true일시 login서블릿 전송
	           $("#joinForm").submit();
	           alert("오ㅇ!마켓에 오신것을  환영합니다!!!");
	       }
	   }); 
	
});//END

    </script>





</head>
<body>
	<!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>

	<!-- Main -->
	<div id="wrap">
		<br> <br> <b><font size="6" color="gray">회원가입</font></b> <br>
		<br> <br>
		<input type="hidden" name="originalFileName" value="${ loginUser.originalFileName }">
		<input type="hidden" name="renameFileName" value="${ loginUser.renameFileName }">

		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form action="minsert.do" name="frm" method="post" id="joinForm">
			<table>
				<tr>
					<td id="title">* 아이디</td>
					<td><input type="text" name="id" id="UserId" class="UserId"
						maxlength="20" required> <span class="guide ok">사용가능</span>
						<span class="guide error">사용불가능</span> <input type="hidden"
						name="idDuplicateCheck" id="idDuplicateCheck" value="0"></td>
				</tr>

				<tr>
					<td id="title">* 비밀번호</td>
					<td><input type="password" name="password" class="password"
						id="pwd" maxlength="15" required> <span id="pwCheckF"
						class="guide1 ok1">사용가능</span> <span class="guide1 error1">사용불가능</span>
						<input type="hidden" name="pwdDuplicateCheck"
						id="pwdDuplicateCheck" value="0"></td>
				</tr>
				<tr>
					<td id="title">* 비밀번호확인</td>
					<td><input type="password" name="pwd_check" id="pwd_check"
						maxlength="15"></input>
						<div id="checkPwd">동일한 암호를 입력하세요.</div>
						<div id="checkPwdOK">암호가 확인되었습니다.</div></td>
				</tr>



				<tr>
					<td id="title">* 이름(닉네임)</td>
					<td><input type="text" name="username" class="UserName"
						maxlength="40" required></td>
				</tr>

				<tr class="GrederTr">
					<td id="title">성별</td>
					<td class="gender"><input type="radio" name="gender" value="M"
						checked><span>남</span> <input type="radio" name="gender"
						value="F" checked><span>여</span></td>
				</tr>

				<tr>
					<td id="title">생일</td>
					<td><input type="text" name="birthyy" class="birthyy"
						maxlength="4" placeholder="년(4자)" size="6"> <select
						name="birthmm" class="birthmm">
							<option value="월">월</option>
							<option value="01">1</option>
							<option value="02">2</option>
							<option value="03">3</option>
							<option value="04">4</option>
							<option value="05">5</option>
							<option value="06">6</option>
							<option value="07">7</option>
							<option value="08">8</option>
							<option value="09">9</option>
							<option value="10">10</option>
							<option value="11">11</option>
							<option value="12">12</option>
					</select> <input type="text" name="birthdd" class="birthdd" maxlength="2"
						placeholder="일" size="4"></td>
				</tr>

				<tr>
					<td id="title1">* 이메일</td>

					<td id="emailTitl"><input type="text" name="email" id="email" class="email"
						maxlength="30"> <span>@</span> <select name="email2"
						id="email2" class="email2">
							<option>naver.com</option>
							<option>daum.net</option>
							<option>gmail.com</option>
							<option>nate.com</option>
					</select> <input type="button" name="btemail" class="btemail" id="btemail"
						value="인증번호 발송!"> <span class="guide2 ok2">사용가능</span> <span
						class="guide2 error2">사용불가능</span> <input type="hidden"
						name="emailDuplicateCheck" id="emailDuplicateCheck" value="0">
					</td>

				</tr>


				<tr>
					<td id="emailcheck1">* 이메일 인증</td>

					<td><input type="text" name="writechk" class="writechk"
						id="writechk" value=""> <!-- span --> <span id="explainsp"
						class="explainsp">*메일로 보내드린 인증번호 6자리를 입력해주세요.</span> <!-- 이메일 인증시 Y/N -->
						<input type="text" class="countdown"> <input type="hidden"
						name="emailChk" class="emailchk" id="emailchk" value=""
						style="background: yellow;"></td>

				</tr>
				<tr>
					<td id="title">휴대전화</td>
					<td><input type="text" name="phone" class="phone" /></td>
				</tr>
				<tr>
					<td id="title">* 우편번호</td>
					<td><input type="text" class="Zipcode" id="sample6_postcode"
						name="postCode" placeholder="우편번호">
						<button type="button" class="addressSearch" value="우편번호 찾기&nbsp;"
							onclick="sample6_execDaumPostcode()">주소검색</button></td>
				</tr>
				<tr>
					<td id="title">* 주소</td>
					<td><input type="text" class="address" id="sample6_address"
						name="roadAddress" placeholder="도로명주소" readonly /></td>
				</tr>
				<tr>
					<td id="title">* 상세</td>
					<td><input type="text" class="Detail" id="sample6_address2"
						name="detailAddress" placeholder="상세주소" /></td>
				</tr>
				<tr>
					<td id="aboutme">* 자기소개</td>
					<td><textarea class="form-control" name="self_introduction"  id="self_introduction" rows="5" placeholder="나를 멋지게 소개해봐요."></textarea></td>
				</tr>
				
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
			</table>

			<br>

			<table class="AgreementTable">
				<tr>
					<th class="left">
						<h6 class="AGREEMENTCHECK">AGREEMENT CHECK</h6>
					<td class="agreeArea">
						<p>
							제1조(목적) 이 약관은 (주)메이크엠 (전자상거래 사업자)가 운영하는 오ㅇ!마켓 (이하 “몰”이라 한다)에서
							제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리?의무 및 책임사항을
							규정함을 목적으로 합니다. ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이
							약관을 준용합니다」 <br> <br> 제2조(정의) ①“몰” 이란 (주)메이크엠 (전자상거래
							사업자)가 재화 또는 용역(이하 “재화등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여
							재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
							②“이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다. ③
							‘회원’이라 함은 “몰”에 개인정보를 제공하여 회원등록을 한 자로서, “몰”의 정보를 지속적으로 제공받으며, “몰”이
							제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다. ④ ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이
							제공하는 서비스를 이용하는 자를 말합니다. ⑤ ‘적립금’이란 “몰”의 이용촉진을 위하여 회원이 상품을 구매하거나
							이벤트/프로모션등에 참여한 경우, 회사가 정한 기준에 따라 회원에게 임의로 부여하는 포인트입니다. ⑥ ‘예치금’이란
							주문취소 등의 결제대금환불, 초과입금 차액 환불 등으로 발생하는 금액을 고객의 요청에 따라 “몰”에 예치하여 현금대신
							사용가능 한 결제수단으로 이자가 발생하지 않는 금원을 말합니다. <br> <br> 제3조 (약관등의
							명시와 설명 및 개정) ① “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을
							처리할 수 있는 곳의 주소를 포함), 전화번호?모사전송번호?전자우편주소, 사업자등록번호, 통신판매업신고번호,
							개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 00 사이버몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의
							내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다. ② “몰은 이용자가 약관에 동의하기에 앞서 약관에
							정하여져 있는 내용 중 청약철회?배송책임?환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면
							또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다. ③ “몰”은 전자상거래등에서의소비자보호에관한법률,
							약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등
							관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. ④ “몰”이 약관을 개정할 경우에는 적용일자 및
							개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다. 다만,
							이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우
							"몰“은 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다. ⑤ “몰”이 약관을 개정할
							경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의
							약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에
							의한 개정약관의 공지기간내에 ‘몰“에 송신하여 ”몰“의 동의를 받은 경우에는 개정약관 조항이 적용됩니다. ⑥ 이
							약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의소비자보호에관한법률, 약관의규제등에관한법률,
							공정거래위원회가 정하는 전자상거래등에서의소비자보호지침 및 관계법령 또는 상관례에 따릅니다. <br> <br>
							제4조(서비스의 제공 및 변경) ① “몰”은 다음과 같은 업무를 수행합니다. 1. 재화 또는 용역에 대한 정보 제공
							및 구매계약의 체결 2. 구매계약이 체결된 재화 또는 용역의 배송 3. 기타 “몰”이 정하는 업무 ②“몰”은 재화
							또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을
							변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의
							내용을 게시한 곳에 즉시 공지합니다. ③“몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는
							기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다. ④전항의
							경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는
							경우에는 그러하지 아니합니다. <br> <br> 제5조(서비스의 중단) ① “몰”은 컴퓨터 등
							정보통신설비의 보수점검?교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수
							있습니다. ②“몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에
							대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다. ③사업종목의 전환,
							사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로
							이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지
							아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로
							이용자에게 지급합니다. <br> <br> 제6조(회원가입) ① 이용자는 “몰”이 정한 가입 양식에
							따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다. ② “몰”은 제1항과 같이
							회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다. 1. 가입신청자가 이 약관
							제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실후 3년이
							경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다. 2. 등록 내용에 허위, 기재누락, 오기가 있는
							경우 3. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우 ③ 회원가입계약의
							성립시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다. ④ 회원은 제15조제1항에 의한 등록사항에 변경이 있는
							경우, 즉시 전자우편 기타 방법으로 “몰”에 대하여 그 변경사항을 알려야 합니다. <br> <br>
							제7조(회원 탈퇴 및 자격 상실 등) ① 회원은 “몰”에 언제든지 탈퇴를 요청할 수 있으며 “몰”은 즉시 회원탈퇴를
							처리합니다. ② 회원이 다음 각호의 사유에 해당하는 경우, “몰”은 회원자격을 제한 및 정지시킬 수 있습니다. 1.
							가입 신청시에 허위 내용을 등록한 경우 2. “몰”을 이용하여 구입한 재화등의 대금, 기타 “몰”이용에 관련하여
							회원이 부담하는 채무를 기일에 지급하지 않는 경우 3. 다른 사람의 “몰” 이용을 방해하거나 그 정보를 도용하는 등
							전자상거래 질서를 위협하는 경우 4. “몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는
							경우 ③ “몰”이 회원 자격을 제한?정지 시킨후, 동일한 행위가 2회이상 반복되거나 30일이내에 그 사유가 시정되지
							아니하는 경우 “몰”은 회원자격을 상실시킬 수 있습니다. ④ “몰”이 회원자격을 상실시키는 경우에는 회원등록을
							말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소전에 최소한 30일 이상의 기간을 정하여 소명할 기회를
							부여합니다. <br> <br> 제8조(회원에 대한 통지) ① “몰”이 회원에 대한 통지를 하는
							경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다. ② “몰”은 불특정다수 회원에 대한
							통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와
							관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다. <br> <br>
							제9조(구매신청) “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “몰”은 이용자가
							구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. 단, 회원인 경우 제2호 내지 제4호의 적용을
							제외할 수 있습니다. 1. 재화등의 검색 및 선택 2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의
							입력 3. 약관내용, 청약철회권이 제한되는 서비스, 배송료?설치비 등의 비용부담과 관련한 내용에 대한 확인 4. 이
							약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭) 5. 재화등의 구매신청 및 이에 관한
							확인 또는 “몰”의 확인에 대한 동의 6. 결제방법의 선택 <br> <br> 제10조 (계약의
							성립) ① “몰”은 제9조와 같은 구매신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만,
							미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수
							있다는 내용을 고지하여야 합니다. 1. 신청 내용에 허위, 기재누락, 오기가 있는 경우 2. 미성년자가 담배, 주류등
							청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우 3. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히
							지장이 있다고 판단하는 경우 ② “몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이
							성립한 것으로 봅니다. ③ “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의
							정정 취소등에 관한 정보등을 포함하여야 합니다. <br> <br> 제11조(지급방법) “몰”에서
							구매한 재화 또는 용역에 대한 대금지급방법은 다음 각호의 방법중 가용한 방법으로 할 수 있습니다. 단, “몰”은
							이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다. 1. 폰뱅킹,
							인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체 2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제 3.
							온라인무통장입금 4. 전자화폐에 의한 결제 5. 수령시 대금지급 6. 마일리지 등 “몰”이 지급한 포인트에 의한 결제
							7. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제 8. 기타 전자적 지급 방법에 의한 대금 지급 등
							<br> <br> 제12조(수신확인통지?구매신청 변경 및 취소) ① “몰”은 이용자의 구매신청이
							있는 경우 이용자에게 수신확인통지를 합니다. ② 수신확인통지를 받은 이용자는 의사표시의 불일치등이 있는 경우에는
							수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송전에 이용자의 요청이 있는 경우에는
							지체없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에
							따릅니다. <br> <br> 제13조(재화등의 공급) ① “몰”은 이용자와 재화등의 공급시기에
							관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장
							등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의
							전부 또는 일부를 받은 날부터 2영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화등의 공급 절차 및 진행
							사항을 확인할 수 있도록 적절한 조치를 합니다. ②“몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용
							부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를
							배상하여야 합니다. 다만 “몰”이 고의?과실이 없음을 입증한 경우에는 그러하지 아니합니다. <br> <br>
							제14조(환급) “몰”은 이용자가 구매신청한 재화등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체없이
							그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 2영업일 이내에 환급하거나
							환급에 필요한 조치를 취합니다. <br> <br> 제15조(청약철회 등) ①“몰”과 재화등의 구매에
							관한 계약을 체결한 이용자는 수신확인의 통지를 받은 날부터 7일 이내에는 청약의 철회를 할 수 있습니다. ② 이용자는
							재화등을 배송받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다. 1. 이용자에게 책임
							있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는
							청약철회를 할 수 있습니다) 2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우 3.
							시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우 4. 같은 성능을 지닌 재화등으로
							복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우 ③ 제2항제2호 내지 제4호의 경우에 “몰”이 사전에
							청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지
							않았다면 이용자의 청약철회등이 제한되지 않습니다. ④ 이용자는 제1항 및 제2항의 규정에 불구하고 재화등의 내용이
							표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화등을 공급받은 날부터 3월이내, 그 사실을 안 날
							또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다. <br> <br>
							제16조(청약철회 등의 효과) ① “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은
							재화등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한 때에는 그 지연기간에 대하여
							공정거래위원회가 정하여 고시하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다. ② “몰”은 위 대금을 환급함에
							있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화등의 대금을 지급한 때에는 지체없이 당해 결제수단을
							제공한 사업자로 하여금 재화등의 대금의 청구를 정지 또는 취소하도록 요청합니다. ③ 청약철회등의 경우 공급받은
							재화등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회등을 이유로 위약금 또는 손해배상을
							청구하지 않습니다. 다만 재화등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회등을 하는 경우
							재화등의 반환에 필요한 비용은 “몰”이 부담합니다. ④ 이용자가 재화등을 제공받을때 발송비를 부담한 경우에 “몰”은
							청약철회시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다. <br> <br>
							제17조(개인정보보호) ①“몰”은 이용자의 정보수집시 구매계약 이행에 필요한 최소한의 정보를 수집합니다. 다음 사항을
							필수사항으로 하며 그 외 사항은 선택사항으로 합니다. 1. 성명 2. 주소 3. 전화번호 4. 희망ID(회원의 경우)
							5. 비밀번호(회원의 경우) 6. 전자우편주소(또는 이동전화번호) ② “몰”이 이용자의 개인식별이 가능한 개인정보를
							수집하는 때에는 반드시 당해 이용자의 동의를 받습니다. ③제공된 개인정보는 당해 이용자의 동의없이 목적외의 이용이나
							제3자에게 제공할 수 없으며, 이에 대한 모든 책임은 몰 이 집니다. 다만, 다음의 경우에는 예외로 합니다. 1.
							배송업무상 배송업체에게 배송에 필요한 최소한의 이용자의 정보(성명, 주소, 전화번호)를 알려주는 경우 2. 통계작성,
							학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는 형태로 제공하는 경우 3. 재화등의
							거래에 따른 대금정산을 위하여 필요한 경우 4. 도용방지를 위하여 본인확인에 필요한 경우 5. 법률의 규정 또는
							법률에 의하여 필요한 불가피한 사유가 있는 경우 ④“몰”이 제2항과 제3항에 의해 이용자의 동의를 받아야 하는
							경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에
							대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 정보통신망이용촉진등에관한법률 제22조제2항이
							규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다. ⑤이용자는 언제든지
							“몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체없이 필요한
							조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를
							이용하지 않습니다. ⑥ “몰”은 개인정보 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 신용카드, 은행계좌 등을
							포함한 이용자의 개인정보의 분실, 도난, 유출, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다. ⑦
							“몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해
							개인정보를 지체없이 파기합니다. <br> <br> 제18조(“몰“의 의무) ① “몰”은 법령과 이
							약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로
							재화?용역을 제공하는데 최선을 다하여야 합니다. ② “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록
							이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다. ③ “몰”이 상품이나 용역에 대하여
							「표시?광고의공정화에관한법률」 제3조 소정의 부당한 표시?광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할
							책임을 집니다. ④ “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다. <br>
							<br> 제19조(회원의 ID 및 비밀번호에 대한 의무) ① 제17조의 경우를 제외한 ID와 비밀번호에 관한
							관리책임은 회원에게 있습니다. ② 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다. ③ 회원이
							자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의
							안내가 있는 경우에는 그에 따라야 합니다. <br> <br> 제20조(이용자의 의무) 이용자는 다음
							행위를 하여서는 안됩니다. 1. 신청 또는 변경시 허위 내용의 등록 2. 타인의 정보 도용 3. “몰”에 게시된
							정보의 변경 4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시 5. “몰” 기타
							제3자의 저작권 등 지적재산권에 대한 침해 6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위 7.
							외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위 <br>
							<br> 제21조(연결“몰”과 피연결“몰” 간의 관계) ① 상위 “몰”과 하위 “몰”이 하이퍼 링크(예:
							하이퍼 링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹
							사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다. ②연결“몰”은 피연결“몰”이 독자적으로 제공하는
							재화등에 의하여 이용자와 행하는 거래에 대해서 보증책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는
							시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증책임을 지지 않습니다. <br> <br>
							제22조(저작권의 귀속 및 이용제한) ① “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.
							② 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙없이 복제,
							송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다. ③
							“몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다. <br>
							<br> 제23조(분쟁해결) ① “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를
							보상처리하기 위하여 피해보상처리기구를 설치?운영합니다. ② “몰”은 이용자로부터 제출되는 불만사항 및 의견은
							우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해
							드립니다. ③“몰”과 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회
							또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다. <br> <br>
							제24조(재판권 및 준거법) ①“몰”과 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에
							의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는
							거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다. ②“몰”과 이용자간에 제기된
							전자상거래 소송에는 한국법을 적용합니다. <br> <br> 제25조 (적립금제도 및 운용) ①
							적립금 지급의 기준 및 적립비율은 회사의 정책상 언제든지 변경할 수 있으며, 변경된 내용은 “몰”을 통해 고지함으로써
							그 효력이 발생합니다. ② 적립금은 제 2조⑤항과 같이 회사에서 임의로 지급해드리는 포인트이기 때문에 현금으로
							반환되지 않습니다. 주문 취소한 금액을 “몰”에 예치하시길 원하시는 경우 환불수단을 “예치금”해주시기 바랍니다. ③
							적립금은 주문금액의 할인금액으로 사용이 가능하며, 신용카드, 무통장, 에스크로, 휴대폰결제수단과 함께 사용이
							가능합니다. 단, 예치금 및 쿠폰 사용시 적립금 동시사용은 불가합니다. ④ 적립금으로 전액 결제 시 구매적립금은
							지급하지 않습니다. ⑤ 적립금 사용의 기준은 “몰”의 사이트 하단 ‘이용안내>기타안내’에 자세히 안내되어 있습니다.
							(교환/반품 배송비로 대체 불가합니다) ⑥ 적립금은 타인에게 양도가 불가하며, 동일한 회원이 여러개의 아이디(ID)를
							보유하더라도 합산할 수 없습니다. <br> <br> 제 26조 (적립금 사용기간 및 소멸) 회원님께
							부여된 적립금은 부여 받은 날로부터 1년 이내에 사용해야 하며, 다음의 경우 적립금이 소멸됩니다. ① 적립금을 부여
							받은 날로부터 1년간 사용하지 않은 경우 자동소멸. ② 회원을 탈퇴한 경우 ③ 적립금 사용가능 조건이 및 소멸에 대한
							내용이 변경되어 미리 공지된 경우 ④ 적립금을 이용하여 부당이득을 취하거나, 악의적인 상거래가 발생될 경우 “몰”은
							해당 적립금의 지급을 중지 또는 회원탈퇴, 기존 적립금 환수 등의 조치를 취할 수 있습니다. ⑤ 주문취소 후,
							적립금으로 환불 받은 금액은 사용기한 제한이 없는 예치금으로 언제든지 전환신청이 가능하며, 만약 시스템에 의해
							자동소멸 되더라도 고객센터에 문의하시면 확인 후, 적립금환불 받은 금액만큼 예치금으로 전환(복구)시켜 드립니다. <br>
							<br> 제27조 (예치금제도 및 운용) ① ‘예치금’은 상품주문/결제 시 현금과 동일하게 사용이
							가능합니다. (예치금은 고객의 현금을 임시 저장하는 수단) ② 고객이 예치금을 사용할 경우 사용기간이나 금액 제한
							없이 사용가능 합니다. (교환/반품의 택배비로 대체가능) ③ 기존에 환불금액을 ‘적립금’으로 환불 받았던 고객은
							예치금으로 전환 지급을 요청할 수 있습니다. ④ 본래, 현금성거래인 무통장결제만 예치금처리가 가능하나, 고객의
							편의를위해 카드결제, 휴대폰결제도 요청하는경우 예치금으로 처리해드리고있습니다. (고객의 요청에의한 예치금처리후
							복원불가능함) ⑤ 주문취소 시 결제에 사용한 예치금은 자동으로 반환(복구)됩니다. ⑥ 예치금은 타인에게 양도가
							불가하며, 동일한 회원이 여러 개의 아이디(ID)를 보유하더라도 합산할 수 없습니다. ⑦ 다음의 경우 예치금이
							소멸됩니다. 1. 회원을 탈퇴한 경우 2. 예치금을 이용하여 부당 이득을 취하거나, 악의적인 상거래가 발생할 경우
						</p>

					</td>
					<td class="AGREEMENTLEFTCHECK">
						<p>
							<span class="Consentcheck">이용약관에 동의하시겠습니까?</span> <input
								type="checkbox" id="agree_service_check0" value="true"
								class="ConsentcheckBox"> <label class="Consent">동의함</label>
						</p>
					</td>
					</th>
					<th class="rigth">
					<td class="PrivacycheckTd">
						<h6 class="PRIVACYCHECKTITLE">PRIVACYCHECK</h6>
					</td>

					<td class="PrivacyContents">
						<p>
							■ 수집하는 개인정보 항목 및 수집방법 <br> 가. 수집하는 개인정보의 항목 o 회사는 회원가입, 상담,
							서비스 신청 등을 위해 아래와 같은 개인정보를 수집하고 있습니다. - 회원가입시 : 이름 , 생년월일 , 성별 ,
							로그인ID , 비밀번호 , 자택 전화번호 , 휴대전화번호 , 이메일 , 14세미만 가입자의 경우 법정대리인의 정보 -
							서비스 신청시 : 주소, 결제 정보 o 서비스 이용 과정이나 사업 처리 과정에서 서비스이용기록, 접속로그, 쿠키,
							접속 IP, 결제 기록, 불량이용 기록이 생성되어 수집될 수 있습니다. 나. 수집방법 - 홈페이지, 서면양식,
							게시판, 이메일, 이벤트 응모, 배송요청, 전화, 팩스, 생성 정보 수집 툴을 통한 수집 <br> <br>
							■ 개인정보의 수집 및 이용목적 회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다. o 서비스 제공에 관한 계약
							이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송 ,
							금융거래 본인 인증 및 금융 서비스 o 회원 관리 회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 불량회원의
							부정 이용 방지와 비인가 사용 방지 , 가입 의사 확인 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정
							대리인 동의여부 확인, 불만처리 등 민원처리 , 고지사항 전달 o 마케팅 및 광고에 활용 이벤트 등 광고성 정보 전달
							, 접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계 <br> <br> ■ 개인정보의 보유 및
							이용기간 고객의 개인정보는 회원탈퇴 등 수집 및 이용목적이 달성되거나 동의철회 요청이 있는 경우 지체없이 파기됩니다.
							단,「전자상거래 등에서의 소비자보호에 관한 법률」 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무
							관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 그 기간동안 보유합니다. 가. 「전자상거래
							등에서의 소비자보호에 관한 법률」 제6조 - 계약 또는 청약 철회 등에 관한 기록 : 5년 - 대금결재 및 재화 등의
							공급에 관한 기록 : 5년 - 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 나. 「통신비밀보호법」 제15조의2
							- 방문(로그)에 관한 기록: 3개월 다. 기타 관련 법령 등 <br> <br> ※ 동의를 거부할
							수 있으나 거부시 회원 가입이 불가능합니다.
						</p>
					</td>
					<td class="PrivacycheckRigthCheck">
						<p>
							<span class="Privacycheck">개인정보 수집 및 이용에 동의하십니까?</span> <input
								type="checkbox" id="agree_service_check1" value="true"
								class="PrivacycheckBox"> <label class="Privacy">동의함</label>
						</p>
					</td>
					</th>
				</tr>

			</table>


			<br>

			<div class="form-group">
				<div class="col-sm-12  text-center">
					<input type="button" value="회원가입" id="nextBtn"
						onclick="check_onclick();" class="btn btn-success"> <input
						type="reset" value="취소" class="btn btn-warning"
						onclick="location.href='login.do'">
				</div>
			</div>
		</form>


	</div>
	</div>

	</div>
	<!-- footerInclude-->
	<%@ include file="../common/footer.jsp"%>

</body>
</html>