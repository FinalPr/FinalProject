<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<link rel="stylesheet"
	href="/spring/resources/assets/css/Withdrawal.css?after">

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>



<!-- ajax 적용 -->

<script>
$(function(){

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


	$(".Withdrawal").click(function(){
		var reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		var pwd1=$("#pwd").val();
	        var pwd2=$("#pwd_check").val();
		
	if($('#pwd').val().length==0){
  			 alert("비밀번호를 입력하세요.");
  			return  $('#pwd').focus();
  	 }else if(false === reg.test(pwd1)){
			alert("사용불가능 비밀번호입니다.");
			return false;
		}else if(pwd2== ""){
			alert("비밀번호확인를 입력안하셨습니다.다시 입력해주세요");
			return false;
		}else if(pwd2 == $("#checkPwd").val()){
			alert("동일한  비밀번호를입력하세요.");
			return false;
		}else if(pwd1 != pwd2){   
            	alert("동일한 비밀번호확인를 다시 해주세요 ");
            	return false;
            }else{
  		userDelete()
  	 }
	});
	function userDelete(){
		
		$.ajax({
			url:"pwdCheck.do",
			data:{"id":$("#id").val(),
				"pwd":$("#pwd").val()},
			type:"post",
			success:function(data){
				console.log(data);
			
				if(data ==  "ok"){
					var result = confirm("진짜로 회원탈퇴를 진행하시겠습니까?");
					if(result){
						
						$("#Withdrawal").submit();
					    alert("회원이 탈퇴되었습니다.");
					}else{
						location.href='myPage.do';
					    
					}
				}else if(data == "fail"){
					alert("존재하지 않는 비밀번호입니다. 다시입력해주세요.");
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
	
});
</script>






</head>
<body>
	<!-- HeaderInclude -->
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
							<h2>회원탈퇴</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Main -->
	<div id="wrap">



		<!-- 입력한 값을 전송하기 위해 form 태그를 사용한다 -->
		<!-- 값(파라미터) 전송은 POST 방식, 전송할 페이지는 JoinPro.jsp -->
		<form action="Withdrawal.do" name="frm" method="post" id="Withdrawal">
			<table>

	
				<tr >
					<td id="title">* 비밀번호</td>
					<td>
					<input type="hidden" id="id" name="id" value="${ loginUser.id}">
					<input type="password" name="password" class="password"
						id="pwd" maxlength="15"  required> <span id="pwCheckF"
						class="guide1 ok1">사용가능</span> <span class="guide1 error1">사용불가능</span>
						<input type="hidden" name="pwdDuplicateCheck"
						id="pwdDuplicateCheck" value="0"></td>
				</tr>
				<tr>
					<td id="title">* 비밀번호확인</td>
					<td><input type="password"  name="pwd_check"  id="pwd_check"
						maxlength="15"></input>
						<div id="checkPwd">동일한 암호를 입력하세요.</div>
						<div id="checkPwdOK">암호가 확인되었습니다.</div></td>
				</tr>






			</table>
			<div class="form-group">
				<div class="col-sm-12  text-center">
				
											<button type="button" class="btn btn-primary Withdrawal">탈퇴하기</button>
					<input type="reset" value="취소" class="btn btn-warning"
						onclick="location.href='myPage.do'">
				</div>
			</div>
		</form>
	</div>


	<!-- footerInclude-->
	<%@ include file="../common/footer.jsp"%>

</body>
</html>