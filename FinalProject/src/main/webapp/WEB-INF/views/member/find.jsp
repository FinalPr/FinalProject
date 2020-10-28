<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
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
            $(".IdCheck").click(function(){
                $(".FindId").hide();
                $(".FindTable").hide();
                $(".IdFindresult").show();
                $(".IdTransfercompleteDiv").show();
           $(".FindPwdSend").show();
           $(".loginSend").show();
           
           
            });
            //아이디찾은 후 비번찾기로 변경제이쿼리
            $(".FindPwdSend").click(function(){
                $(".FindId").hide();
                $(".FindTable").show();
                $(".FindPwdText").show();
                $(".FindPwd").show();
                $(".PwdCheck").show();
                $(".IdFindresult").hide();
                $(".IdCheck").hide();
                $(".IdTransfercompleteDiv").hide();
                
               
           $(".FindPwdSend").hide();
           $(".loginSend").hide();
           $(".FindIdBtn").css("background","white");
            $(".FindPwdBtn").css("background","darkgray");
           
            });
                 //비번찾기 클릭시 Table 숨김처리 및 배경색 변경
           $(".FindPwdBtn").click(function(){
            $(".FindId").hide();
                $(".FindTable").show();
                $(".FindPwdText").show();
                $(".FindPwd").show();
                $(".PwdCheck").show();
                $(".IdFindresult").hide();
                $(".IdCheck").hide();
                $(".IdTransfercompleteDiv").hide();
           $(".FindPwdSend").hide();
           $(".loginSend").hide();
            $(".FindIdBtn").css("background","white");
            $(".FindPwdBtn").css("background","darkgray");
           
           });
           $(".PwdCheck").click(function(){
                $(".FindPwd").hide();
                $(".FindIdBtn").hide();
                $(".FindPwdBtn").hide();
                $(".FindPwdText").hide();
                $(".FindIdText").hide();
                $(".PwdCheck").hide();
                $(".PwdFindresult").show();
                $(".PwdTransfercompleteDiv").show();
                $(".PwdTransfercomplete").show();
                $(".loginSend").show();
                $(".loginSend").show();
              
           });
       });
        </script>
</head>
   <body>
    <!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>

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
                                <button type="button" id="FindPwdBtn"class="FindPwdBtn">비밀번호찾기</button>  
                                <input type="text" id="FindPwdText" class="FindPwdText" placeholder="아이디입력"> 
                                <input type="text" id="FindIdText"class="FindIdText" placeholder="이메일입력">

                                <button type="submit" id=PwdCheck class="PwdCheck">비밀번호 찾기</button>
                                <button type="submit" id="IdCheck"class="IdCheck">아이디 찾기</button>
                        </td>
                       
                    </th>
                </tr>
            </table>
            <h3 class="IdFindresult">아이디 찾기 결과</h3>
            <h3 class="PwdFindresult">비밀번호 찾기 결과</h3>
            <div class="IdTransfercompleteDiv">
                <p class="IdTransfercomplete"> 회원님의 이메일주소로 <br>
                  아이디를 발송해드렸습니다.
                </p>
                <p class="PwdTransfercomplete"> 회원님의 이메일주소로 <br>
                  임시비밀번호를 발송해드렸습니다.
                </p>
                
            </div>
            <div class="PwdTransfercompleteDiv">
                <p class="PwdTransfercomplete"> 회원님의 이메일주소로 <br>
                  임시비밀번호를 발송해드렸습니다.
                </p>
                
            </div>
            <button type="button" id="FindPwdSend" class="FindPwdSend">비밀번호가 기억나지 않으세요?</button>
            <a href="login.do" class="loginSend"><p class="loginText">로그인</p></a>
        </div>
        
            
        
        
    </div>
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>

    </body>
</html>