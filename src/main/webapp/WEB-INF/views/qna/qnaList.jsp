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
                    <h1 class="display-4  bg-succeed"><b>문의내역</b></h1>
                    
                    
                    <table class = "table  table-hover">
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
									<c:forEach var="qnalist" items="${list}">
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
										<c:url var="before" value="QnaList.do">
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
											<c:url var="pagination" value="QnaList.do">
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
										<c:url var="after" value="QnaList.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										</c:url>
										<li class="page-item"><a class="page-link"
											href="${ after }">Next</a></li>
									</c:if>
								</ul>
							</div>               
               
                <br>
                 <hr/>   
                 <br>
               
                      
                           
                       
                    
                </div>
            </div>
            
        </section>
    </main>
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>

    </body>
</html>