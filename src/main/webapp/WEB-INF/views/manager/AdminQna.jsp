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
	href="/spring/resources/assets/css/styles.css?after" />
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
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
											 <th>NO</th>
				                            <th>분류</th>
				                            <th>작성자</th>
				                            <th>제목</th>
				                            <th>첨부파일</th>
				                            <th>작성일</th>
				                            <th>결과</th>
									</tr>
								</thead>
								
						  <tbody>
									<c:forEach var="qnalist" items="${qnalist}">
										<tr>
											<td align="center">${qnalist.qnaId}</td>
											<td align="center">${qnalist.reason}</td>
											<td align="center">${qnalist.qnaWriter}</td>
										<td align="left">
				<c:if test="${ !empty loginUser }">
					<c:url var="qdetail" value="adminqnadetail.do">
						<c:param name="qnaId" value="${ qnalist.qnaId }"/>
						<c:param name="currentPage" value="${ pi.currentPage }"/>
					</c:url>
					<a href="${ qdetail }">${qnalist.qnaTitle}</a>
				</c:if>
				<c:if test="${ empty loginUser }">
					${ qnalist.qnaTitle }
				</c:if>
			</td>
											<td align="center">
				<c:if test="${ !empty qnalist.originalFileName }">
					◎
				</c:if>
				<c:if test="${ empty qnalist.originalFileName }">
					&nbsp;
				</c:if>
			</td>
											<td align="center">${qnalist.qnaCreateDate}</td>
											<td align="center">${qnalist.qStatus}</td>
										</tr>
									</c:forEach>
								</tbody>

                    </table> 
							<div class="text-center">
								<ul class="pagination justify-content-center ">
									<!-- [이전] -->
									<c:if test="${ pi.currentPage eq 1 }">
										<li class="page-item "><a class="page-link" href="#">Previous</a></li>
									</c:if>
									<c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="AdminQnd.do">
											<c:param name="curpage" value="${ pi.currentPage - 1 }" />
										</c:url>
										<li class="page-item "><a class="page-link"
											href="${ before }">Previous</a></li>
									</c:if>

									<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li class="page-item"><a style="color: chartreuse;"
												class="page-link" href="#">${ p }</a></li>
										</c:if>

										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="AdminQnd.do">
												<c:param name="currentPage" value="${ p }" />
											</c:url>
											<li class="page-item"><a class="page-link"
												href="${ pagination }">${ p }</a></li>
										</c:if>
									</c:forEach>

									<!-- [다음] -->
									<c:if test="${ pi.currentPage eq pi.maxPage }">
										<a class="page-link" href="#">Next</a>
									</c:if>
									<c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="AdminQnd.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										</c:url>
										<li class="page-item"><a class="page-link"
											href="${ after }">Next</a></li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>


		<%@ include file="../common/footer.jsp"%>
</body>
</html>