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