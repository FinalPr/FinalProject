<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
	 <div class="mypage_leftwrap">
                    <div class="mypage_title">QnA</div>
                    <ul class="mypage_left">
                        <li class="mypage_h1"><a href="qnaQury.do">1:1문의</a></li>
                    </ul>
                    <ul class="mypage_left">
                    <c:url var="qlist" value="QnaList.do"/>
                        <li class="mypage_h1"><a href="${qlist}">문의내역</a></li>
                    </ul>
                    <ul class="mypage_left">
                        <li class="mypage_h1"><a href="qnaFAQ.do">FAQ</a></li>
                    </ul>
                    
                    
                </div>
	</header>
</body>
</html>