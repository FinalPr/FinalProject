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
    
</head>
   <body>
    <!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>
	<script src="/spring/resources/assets/js/myPage.js?Asd"></script>
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
                    <div class="lately_sale">
                        <div class="lately_h3">판매내역   <a href="getMyList.do?value=판매내역">+더보기</a></div>
                        <table>
                            <thead>
                                <tr>
                                    <th>판매상품</th>
                                    <th>구매자</th>
                                    <th>결제금액</th>
                                    <th>판매상태</th>
                                    <th>판매일시</th>
                                </tr>
                            </thead>
                            <tbody id="sellListArea">
                              
                            </tbody>
                        </table>
                    </div>
                    <div class="lately_buy">
                        <div class="lately_h3">구매내역<a href="getMyList.do?value=구매내역">+더보기</a></div>
                        <table>
                            <thead>
                                <tr>
                                    <th>판매상품</th>
                                    <th>판매자</th>
                                    <th>결제금액</th>
                                    <th>판매상태</th>
                                    <th>판매일시</th>
                                </tr>
                            </thead>
                            <tbody id="buyListArea">
                               
                            </tbody>
                        </table>
                    </div>
                    <div class="lately_product">
                        <div class="lately_h3">최근찜한상품<a href="getMyList.do?value=찜목록">+더보기</a></div>
                        <div class="tab-content" id="nav-tabContent" style="margin-top: 20px;">
                            <!-- card one -->
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <nav id="zzim">
                                <div class="row">
                                    
                                           
                                </div>
                                </nav>
                            </div>
                		</div>
            	</div>
            	<div class="lately_product">
                        <div class="lately_h3">최근본상품<a href="getMyList.do?value=최근본상품">+더보기</a></div>
                        <div class="tab-content" id="nav-tabContent" style="margin-top: 20px;">
                            <!-- card one -->
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <nav id="look">
                                <div class="row">
                                    
                                           
                                </div>
                                </nav>
                            </div>
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