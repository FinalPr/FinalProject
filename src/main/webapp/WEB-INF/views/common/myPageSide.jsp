<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
	<div class="mypage_leftwrap">
                    <div class="mypage_title">마이페이지</div>
                    <ul class="mypage_left">
                        <li class="mypage_h1">나의거래내역</li>
                        <li class="mypage_h2"><a href="getMyList.do?value=판매내역">판매내역</a></li>
                        <li class="mypage_h2"><a href="getMyList.do?value=구매내역">구매내역</a></li>
                    </ul>
                    <ul class="mypage_left">
                        <li class="mypage_h1">나의개인정보</li>
                        <li class="mypage_h2"><a href="myShop.do">내 상점</a></li>
                       <li class="mypage_h2"><a href="userInfoUpdate.do">회원정보수정</a></li>
                        <li class="mypage_h2"><a href="ChangePasswordPage.do">비밀번호 변경</a></li>
                    </ul>
                    <ul class="mypage_left">
                        <li class="mypage_h1"><a href="getMyList.do?value=찜목록">찜하기</a></li>
                    </ul>
                   <!--  <ul class="mypage_left">
                        <li class="mypage_h1"><a href="myTag.do">마이태그</a></li>
                    </ul> -->
                    <ul class="mypage_left">
                        <li class="mypage_h1"><a href="getMyList.do?value=최근본상품">최근본상품</a></li>
                    </ul>
                </div>
	</header>
</body>
</html>