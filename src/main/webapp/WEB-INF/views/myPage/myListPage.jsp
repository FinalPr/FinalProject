<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
 	<link rel="stylesheet" href="/spring/resources/assets/css/style-minju.css">
 	<link rel="stylesheet" href="/spring/resources/assets/css/main-minju.css">
 	<link rel="stylesheet" href="/spring/resources/assets/css/mypage-minju.css">
       <!-- Jquery Plugins, main Jquery -->
 	<script>
  	var login = "${loginUser.id}";
	</script>
    <style>
    .pagination *{
    margin : none;
   color : black
}
.pagination * :hover{
    margin : none;
   color : chartreuse
}
    </style>
</head>
   <body>
    <!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>
   <!-- Main -->
   <main>
        <section class="latest-product-area padding-bottom">
            <div class="container" style="display: flex;">
                <%@ include file="../common/myPageSide.jsp" %>
                <div class="mypage_rightwrap">
                    <ul class="right_ul">
                        <li>
                            <a href="getMyList.do?value=판매내역">
                                <img src="/spring/resources/assets/img/sale_icon.png" alt="판매내역">
                                <span class="mypage_txt">판매내역</span>
                            </a>
                        </li>
                        <li>
                          <a href="getMyList.do?value=구매내역">
                                <img src="/spring/resources/assets/img/buy_icon.png" alt="구매내역">
                                <span class="mypage_txt">구매내역</span>
                            </a>
                        </li>
                        <li>
                            <a href="getMyList.do?value=찜목록">
                                <img src="/spring/resources/assets/img/zzim_icon.png" alt="찜목록">
                                <span class="mypage_txt">찜하기</span>
                            </a>
                        </li>
                    </ul>
                    
            	<div class="lately_product">
                        <div class="lately_h3">${value}</div>
                        <div class="tab-content" id="nav-tabContent" style="margin-top: 20px;">
                            <!-- card one -->
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <nav id="look">
                                <div class="row">
                                   <c:forEach  items="${boardList}" var="board">
	                  
		                            <div class="col-xl-4 col-lg-4 col-md-6">
		                                <div class="single-product mb-60">
		                                    <div class="product-img">
		                                       <img src="/spring/resources/${board.category }/${board.no }/${board.renameFileName}" width="300" height="300" alt=""/>
		                                    </div>
		                                    <!-- 별점부분 -->
		                                    <div class="product-caption">
		                                        <!-- <div class="product-ratting">
		                                            <i class="far fa-star"></i>
		                                            <i class="far fa-star"></i>
		                                            <i class="far fa-star"></i>
		                                            <i class="far fa-star low-star"></i>
		                                            <i class="far fa-star low-star"></i>
		                                        </div> -->
		                                        <h2><a style="color:black;"  href="getBoardDetail.do?no=${board.no}&category=${board.category}">${board.title }</a></h2>
		                                        <div class="price">
		                                            <ul>
		                                                <li>가격 : ${board.price }</li>
		                                            </ul>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                 
	                        </c:forEach>                                        
                                </div>
                                </nav>
                            </div>
                		</div>
                		
                		<div class="text-center">
                 		<ul class="pagination justify-content-center ">
					                    <!-- [이전] -->
							<c:if test="${ pi.currentPage eq 1 }">
							<li class="page-item "><a class="page-link" href="#">Previous</a></li>
							</c:if>
							<c:if test="${ pi.currentPage ne 1 }">
								<c:url var="before" value="getMyList.do">
									<c:param name="curpage" value="${ pi.currentPage - 1 }"/>
								</c:url>
								<li class="page-item "><a class="page-link" href="${ before }">Previous</a></li>
							</c:if>
							
							<!-- 페이지 -->
							<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								<c:if test="${ p eq pi.currentPage }">
									<li class="page-item"><a  style="color : chartreuse;" class="page-link" href="#">${ p }</a></li>
								</c:if>
								
								<c:if test="${ p ne pi.currentPage }">
									<c:url var="pagination" value="blist.do">
										<c:param name="currentPage" value="${ p }"/>
									</c:url>
									         <li class="page-item"><a class="page-link" href="${ pagination }">${ p }</a></li>
								</c:if>
							</c:forEach>
							
							<!-- [다음] -->
							<c:if test="${ pi.currentPage eq pi.maxPage }">
								 <a class="page-link" href="#">Next</a>
							</c:if>
							<c:if test="${ pi.currentPage ne pi.maxPage }">
								<c:url var="after" value="blist.do">
									<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
								</c:url> 
								 <li class="page-item"><a class="page-link" href="${ after }">Next</a></li>
							</c:if>
               			 </ul>
            		</div>
            	</div>
    </main>
   
   
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>
   

     	<!-- Header End -->
    
 <!--   <script src="/FinalProject/assets/js/plugins.js"></script>
    <script src="/FinalProject/assets/js/main.js"></script>	 -->

    

  
        
    </body>
    
    </html>