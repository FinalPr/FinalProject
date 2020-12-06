<%@page import="com.kh.spring.member.model.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Admin</title>
<link rel="stylesheet"
	href="/spring/resources/assets/css/styles.css" />
<link rel="shortcut icon" type="image/x-icon"
	href="/spring/resources/assets/img/favicon.ico">

<!-- CSS here -->

<link rel="stylesheet"
	href="/spring/resources/assets/css/main.css?after">

<link
	href="https://font+s.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
	
	
</head>


<body>
	<!-- Preloader Start -->
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/adminSide.jsp"%>


	<div id="layoutSidenav_content">
<main>
		 <form action="adminqnaupdate.do" method="post"  enctype="multipart/form-data">
			<input type="hidden" name="qnaId" value="${ qnalist.qnaId }">
			<input type="hidden" name="reason" value="${ qnalist.reason }">
			<input type="hidden" name="qnaTitle" value="${ qnalist.qnaTitle }">
			<input type="hidden" name="qnaContent" value="${ qnalist.qnaContent }">

			<div class="container-fluid">
				<h1 class="mt-4">관리자 페이지</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="home.do">홈</a></li>
					<li class="breadcrumb-item active">회원정보</li>
				</ol>
			
				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i> 회원 정보 테이블

					</div>
			
					<div class="card-body">
						<div class="table-responsive">
							  <div id="qnaQury" class="mypage_rightwrap">
                   <h1>${qnalist.qnaId }번 글 상세보기</h1>
                   <br>
                   <hr>
           	
              
          <div>
                <span > 문의유형 </span>
                <span class="Alldetail">${ qnalist.reason}</span>
            </div>
              <hr>
                <div>
                <span > 제목 </span>
                <span class="Alldetail">${ qnalist.qnaTitle}</span>
            </div>
              <hr>
             <div>
                <span> 작성자 </span>
               <span class="Alldetail">${qnalist.qnaWriter }</span>
            </div>
                <hr>
                <div>
                <span>내용 </span>
              <span class="Alldetail">${ qnalist.qnaContent }</span>
                </div>
                <hr>
                <div>
               
                <span>관리자 처리내용 </span>
              <span class="Alldetail"><textarea name="areply"cols="105" rows="3" class="rContent"id="rContent"></textarea> 	<button type="submit"class="rSubmit" id="rSubmit">등록하기</button></span>
                
                </div>
                <hr>
                <div style="    height: 50px;">
                <span>첨부파일</span>
                <span class="Alldetail"><c:if test="${ !empty qnalist.originalFileName }">
					<a class="FileDownload" href="${contextPath }/resources/buploadFiles/${qnalist.renameFileName}" download="${ qnalist.originalFileName }">${qnalist.originalFileName }</a>
				</c:if> </span>
							
				</div>
				</div>
				</div>
				</div>
				</div>
				
				</div>
</form>
</main>



	

		<%@ include file="../common/footer.jsp"%>
</body>
</html>