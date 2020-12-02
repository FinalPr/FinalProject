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
                        <tr>
                            <th>NO</th>
                            <th>분류</th>
                            <th>제목</th>
                            <th>작성일</th>
                            <th>결과</th>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>사기</td>
                            <td>아 사기 먹었어요 !!</td>
                            <td>2020-09-09</td>
                            <td>미처리</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>사기</td>
                            <td>아 사기 먹었어요 !!</td>
                            <td>2020-09-09</td>
                            <td>미처리</td>
                        </tr>
                        


                    </table> 
                                    
               
                <br>
                 <hr/>   
                 <br>
                 <div class="text-center">
                 <ul class="pagination justify-content-center ">
                    <li class="page-item "><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item "><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                </ul>
            </div>
                      
                           
                       
                    
                </div>
            </div>
        </div>
    </main>
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>

    </body>
</html>