package com.kh.spring.member.controller.email;

import java.util.Calendar;

public class DM {
   
   //회원가입시 인증번호발송
   public static String dmCertification(String authCode) {
      //날짜
      Calendar now = Calendar.getInstance();
      
      //HTML BLOCK 
      String sb="";
      
      sb="<!DOCTYPE html>";
      sb+="<html lang=\"ko\" style=\"font-size:16px;\">";
      sb+="<head>";
      sb+="<meta charset=\"UTF-8\">";
      sb+="<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1\">";
      sb+="<title>DMcertification</title>";
      sb+="<style>.dmtit span{float:left;display:inline-block;font-size:1.35rem;font-weight:700;color:#474747;letter-spacing:-0.05em;margin-left:1vw;}.dmtit:after{content:\"\";display:block;clear:both;}@media screen and (max-width:768px){.dmtit span{font-size:0.8rem}}</style>";
      sb+="</head>";
      sb+="<body style=\"font-size: 1rem;\">";      
      sb+="<div id=\"dmwrap\" style=\"width:100%;height:100%;margin:0 auto;\">";      
      sb+="<div class=\"marginwrap\" style=\"width:90%; margin: 0 auto;padding-top:5vh;\" >";
      sb+="<div class=\"dmtit\" style=\"margin:0 auto;padding-bottom:2vh;border-bottom:2px solid #24b7bf;\">";
      sb+="<span style=\"vertical-align:bottom;display:inline-block;\"><img style=\"display:block;\"></span>";
      sb+="<span><h1>인증번호 발송 안내</h1></span>";
      sb+="</div>";
      sb+="<div class=\"dm_contents\" style=\"margin-top:5vh;margin-bottom:12vh;\">";
      sb+="<p style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">";
      sb+=" 안녕하세요! <strong style=\"font-weight:700;color:#24b7bf;margin-right:0.5vw;\">관리자</strong>입니다.<br>";
      sb+="인증번호를 다음과 같이 알려드립니다.";
      sb+="</p>";
      sb+="<p class=\"con\" style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;margin:3vh 0;\">";
      sb+="인증번호 : <strong>"+authCode+"</strong><br>";
      sb+="발급시간 : "+now.get(Calendar.YEAR)+"년 "+(now.get(Calendar.MONTH) + 1)+"월 "+now.get(Calendar.DAY_OF_MONTH)+"일 "+now.get(Calendar.HOUR_OF_DAY)+":"+now.get(Calendar.MINUTE)+"";
      sb+="</p>";
      sb+="<p style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">감사합니다.</p>";
      sb+="</div>";
      sb+="</div>";
      sb+="<div class=\"dmfoot\">";
      sb+="<div class=\"dm_foot\" style=\"text-align:center;background-color:#f9f9f9;padding:2vh;\">";
      sb+="<p style=\"font-size:0.8rem;font-weight:300;letter-spacing:-0.05em;word-break:keep-all;line-height:1.2rem;color:#474747;\" > 주소 : 서울 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층    |      TEL : 02-1544-9970 |  fax : 02-1544-9970    |     개인정보관리책임자 : 관리자(zhfldk0824@gmail.com)  </p>";
      sb+="<p style=\"font-size:0.8rem;font-weight:300;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">by <a href=\"https://colorlib.com\" target=\"_blank\">Delight</a>";
      sb+="</div>";
      sb+="</div>";
      sb+="</body>";
      sb+="</html>";
      
      return sb;
   }
   //아이디찾기
   public static String dmUserIdInfo(String userid) {
      
      Calendar now = Calendar.getInstance();
      
      String sb="";
      
      sb="<!DOCTYPE html>";
      sb+="<html lang=\"ko\" style=\"font-size:16px;\">";
      sb+="<head>";
      sb+="<meta charset=\"UTF-8\">";
      sb+="<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1\">";
      sb+="<title>DMcertification</title>";
      sb+="<style>.dmtit span{float:left;display:inline-block;font-size:1.35rem;font-weight:700;color:#474747;letter-spacing:-0.05em;margin-left:1vw;}.dmtit:after{content:\"\";display:block;clear:both;}@media screen and (max-width:768px){.dmtit span{font-size:0.8rem}}</style>";      
      sb+="<style>.dmtit span{float:left;}.dmtit:after{content:\"\";display:block;clear:both;}</style>";
      sb+="</head>";
      sb+="<body style=\"font-size: 1rem;\">>";
      sb+="<div id=\"dmwrap\" style=\"width:100%;height:100%;margin:0 auto;\">";
      sb+="<div class=\"marginwrap\" style=\"width:90%; margin: 0 auto;padding-top:5vh;\" >";
      sb+="<div class=\"dmtit\" style=\"margin:0 auto;padding-bottom:2vh;border-bottom:2px solid #24b7bf;\">";
      sb+="<span style=\"vertical-align:bottom;display:inline-block;\"><img style=\"display:block;\"src=\"https://www.yddshop.co.kr:8080/img/dm_icon.png\" alt=\"#\" ></span>";
      sb+="<span><h1>계정정보 발송 안내</h1></span>";
      sb+="</div>";
      sb+="<div class=\"dm_contents\" style=\"margin-top:5vh;margin-bottom:12vh;\">";
      sb+="<p style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">";
      sb+=" 안녕하세요! <strong style=\"font-weight:700;color:#24b7bf;margin-right:0.5vw;\">관리자</strong>입니다.<br>";
      sb+="아이디를 다음과 같이 알려드립니다.";
      sb+="</p>";
      sb+="<p class=\"con\" style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;margin:3vh 0;\">";
      sb+="사용자ID : <strong>"+userid+"</strong><br>";
      
      sb+="발급시간 : "+now.get(Calendar.YEAR)+"년 "+(now.get(Calendar.MONTH) + 1)+"월 "+now.get(Calendar.DAY_OF_MONTH)+"일 "+now.get(Calendar.HOUR_OF_DAY)+":"+now.get(Calendar.MINUTE)+"";
      sb+="</p>";
      sb+="<p style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">감사합니다.</p>";
      sb+="</div>";
      sb+="</div>";
      sb+="<div class=\"dmfoot\">";
      sb+="<div class=\"dm_foot\" style=\"text-align:center;background-color:#f9f9f9;padding:2vh;\">";
      sb+="<p style=\"font-size:0.8rem;font-weight:300;letter-spacing:-0.05em;word-break:keep-all;line-height:1.2rem;color:#474747;\" > 주소 : 서울 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층    |      TEL : 02-1544-9970 |  fax : 02-1544-9970    |     개인정보관리책임자 : 관리자(zhfldk0824@gmail.com)  </p>";
      sb+="<p style=\"font-size:0.8rem;font-weight:300;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">by <a href=\"https://colorlib.com\" target=\"_blank\">Delight</a>";
      sb+="</div>";
      sb+="</div>";
      sb+="</body>";
      sb+="</html>";
      
      return sb;
   }
   
 //비밀번호
   public static String dmUserPwdInfo(String pwd) {
      
      Calendar now = Calendar.getInstance();
      
      String sb="";
      
      sb="<!DOCTYPE html>";
      sb+="<html lang=\"ko\" style=\"font-size:16px;\">";
      sb+="<head>";
      sb+="<meta charset=\"UTF-8\">";
      sb+="<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1\">";
      sb+="<title>DMcertification</title>";
      sb+="<style>.dmtit span{float:left;display:inline-block;font-size:1.35rem;font-weight:700;color:#474747;letter-spacing:-0.05em;margin-left:1vw;}.dmtit:after{content:\"\";display:block;clear:both;}@media screen and (max-width:768px){.dmtit span{font-size:0.8rem}}</style>";      
      sb+="<style>.dmtit span{float:left;}.dmtit:after{content:\"\";display:block;clear:both;}</style>";
      sb+="</head>";
      sb+="<body style=\"font-size: 1rem;\">>";
      sb+="<div id=\"dmwrap\" style=\"width:100%;height:100%;margin:0 auto;\">";
      sb+="<div class=\"marginwrap\" style=\"width:90%; margin: 0 auto;padding-top:5vh;\" >";
      sb+="<div class=\"dmtit\" style=\"margin:0 auto;padding-bottom:2vh;border-bottom:2px solid #24b7bf;\">";
      sb+="<span style=\"vertical-align:bottom;display:inline-block;\"><img style=\"display:block;\"src=\"https://www.yddshop.co.kr:8080/img/dm_icon.png\" alt=\"#\" ></span>";
      sb+="<span><h1>계정정보 발송 안내</h1></span>";
      sb+="</div>";
      sb+="<div class=\"dm_contents\" style=\"margin-top:5vh;margin-bottom:12vh;\">";
      sb+="<p style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">";
      sb+=" 안녕하세요! <strong style=\"font-weight:700;color:#24b7bf;margin-right:0.5vw;\">관리자</strong>입니다.<br>";
      sb+="임시비밀 번호 를 다음과 같이 알려드립니다.";
      sb+="</p>";
      sb+="<p class=\"con\" style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;margin:3vh 0;\">";
      sb+="임시비밀번호 : <strong>"+pwd+"</strong><br>";
      sb+="발급시간 : "+now.get(Calendar.YEAR)+"년 "+(now.get(Calendar.MONTH) + 1)+"월 "+now.get(Calendar.DAY_OF_MONTH)+"일 "+now.get(Calendar.HOUR_OF_DAY)+":"+now.get(Calendar.MINUTE)+"";
      sb+="</p>";
      sb+="<p style=\"font-size:1rem;font-weight:500;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">감사합니다.</p>";
      sb+="</div>";
      sb+="</div>";
      sb+="<div class=\"dmfoot\">";
      sb+="<div class=\"dm_foot\" style=\"text-align:center;background-color:#f9f9f9;padding:2vh;\">";
      sb+="<p style=\"font-size:0.8rem;font-weight:300;letter-spacing:-0.05em;word-break:keep-all;line-height:1.2rem;color:#474747;\" > 주소 : 서울 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층    |      TEL : 02-1544-9970  |  fax : 02-1544-9970    |     개인정보관리책임자 : 관리자(zhfldk0824@gmail.com)  </p>";
      sb+="<p style=\"font-size:0.8rem;font-weight:300;letter-spacing:-0.05em;line-height:1.2rem;color:#474747;\">by <a href=\"https://colorlib.com\" target=\"_blank\">Delight</a>";
      sb+="</div>";
      sb+="</div>";
      sb+="</body>";
      sb+="</html>";
      
      return sb;
   }
   
   
}