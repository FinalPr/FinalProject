<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
           <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Admin</title>
        <link rel="stylesheet" href="/spring/resources/assets/css/styles.css?after"/>
        <link rel="shortcut icon" type="image/x-icon" href="/spring/resources/assets/img/favicon.ico">

		<!-- CSS here -->
     
            <link rel="stylesheet" href="/spring/resources/assets/css/main.css?after">
            
            <link href="https://font+s.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
 </head>
        

   <body>
    <!-- Preloader Start -->
		<%@ include file="../common/header.jsp"%>
		<%@ include file="../common/adminSide.jsp"%>
            <div id="layoutSidenav_content">
           
                <h1 align="center">게시글 목록</h1>
	
	<h3 align="center">
		총 게시글 수 : ${ pi.listCount }
		<c:if test="${ !empty sessionScope.loginUser}">
			<button onclick="location.href='binsertView.do';">글쓰기</button>
		</c:if>
	</h3>

	<table align="center" border="1" cellspacing="0" width="700" id="tb" class="AdminTable">
		<tr>
			<th>번호</th>
			<th width="300">제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
			<th>첨부파일</th>
		</tr>
		<c:forEach var="b" items="${ list }">
		<tr>
			<td align="center">${ b.bId }</td>
			<td align="left">
				<c:if test="${ !empty loginUser }">
					<c:url var="bdetail" value="Declarationl.do">
						<c:param name="bId" value="${ b.bId }"/>
						<c:param name="currentPage" value="${ pi.currentPage }"/>
					</c:url>
					<a href="${ bdetail }">${ b.bTitle }</a>
				</c:if>
				<c:if test="${ empty loginUser }">
					${ b.bTitle }
				</c:if>
			</td>
			
			<td align="center">${ b.bWriter }</td>
			<td align="center">${ b.bCreateDate }</td>
			<td align="center">${ b.bCount }</td>
			<td align="center">
				<c:if test="${ !empty b.originalFileName }">
					◎
				</c:if>
				<c:if test="${ empty b.originalFileName }">
					&nbsp;
				</c:if>
			</td>
		</tr>
		</c:forEach>
		
		<!-- 페이징 처리 -->
		<tr align="center" height="20" >
			<td colspan="6">
			
				<!-- [이전] -->
				<c:if test="${ pi.currentPage eq 1 }">
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage ne 1 }">
					<c:url var="before" value="Declarationl.do">
						<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="Declarationl.do">
							<c:param name="currentPage" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<!-- [다음] -->
				<c:if test="${ pi.currentPage eq pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage ne pi.maxPage }">
					<c:url var="after" value="Declarationl.do">
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }" >[다음]</a>
				</c:if>
			</td>
		</tr>
 </div>
	</table>

    <%@ include file="../common/footer.jsp"%>
   

</body>
</html>