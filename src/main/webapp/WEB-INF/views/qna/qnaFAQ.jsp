<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
 	<link rel="stylesheet" href="/spring/resources/assets/css/style-minju.css">
 	<link rel="stylesheet" href="/spring/resources/assets/css/main-minju.css">
 	<link rel="stylesheet" href="/spring/resources/assets/css/mypage-minju.css">
 	 <link rel="stylesheet" href="/spring/resources/assets/css/qna.css">
</head>
   <body>
    <!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>

   <!-- Main -->
   <main>
        <section class="latest-product-area padding-bottom">
            <div class="container" style="display: flex;">
               <%@include file="../common/qnaSide.jsp" %>
            
                <div id="qnaList" class="mypage_rightwrap">
                    <h1 class="display-4  bg-succeed"><b>FAQ</b></h1>
                    
                    
                    <table class = "table  table-hover">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>분류</th>
                            <th>작성자</th>
                            <th>제목</th>
                            <th>첨부파일</th>
                            <th>작성일</th>
                            <th>조회수</th>
                        </tr>
                     </thead>
                        <tbody>
									<c:forEach var="qnalist" items="${Qnalist}">
										<tr>
											<td align="center">${qnalist.qnaId}</td>
											<td align="center">${qnalist.reason}</td>
											<td align="center">${qnalist.qnaWriter}</td>
										<td align="left">
				<c:if test="${ !empty loginUser }">
					<c:url var="qdetail" value="qdetail.do">
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
											<td align="center">${qnalist.qnaCount}</td>
										</tr>
									</c:forEach>
								</tbody>

                    </table> 
   
                    
                </div>
            </div>
            
        </section>
    </main>
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>

    </body>
</html>