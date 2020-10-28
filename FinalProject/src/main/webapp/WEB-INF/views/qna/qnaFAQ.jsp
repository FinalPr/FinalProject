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
              	<%@ include file="../common/qnaSide.jsp" %>
                <div id="qnaFAQ" class="mypage_rightwrap">
                    <h1>FAQ</h1>
                    <br>
                    <table id="header">
                        <tr>
                            <th>분류1</th>
                            <th>분류1</th>
                            <th>분류1</th>
                        </tr>
                    </table>
            
                    <table  class = "table  table-hover">
                        <tr><td>Q</td><td>~을 확인하고 싶어요</td><td>▽</td></tr>
                        <tr><td>Q</td><td>하하하하하하하</td><td>▽</td></tr>
                        <tr><td>Q</td><td>~가 안되요 !!</td><td>▽</td></tr>
                        <tr><td>Q</td><td>크크크크크크크크</td><td>▽</td></tr>
                        <tr><td>Q</td><td>뭐야 이건</td><td>▽</td></tr>
                        <tr><td>Q</td><td>뭐긴뭐야</td><td>▽</td></tr>
                    </table>
                    <br>
                    <div id="FAQpaging" class="text-center">
                        <ul class="pagination">
                          
                           <li class="page-item"><a class="page-link" href="#">1</a></li>
                           <li class="page-item"><a class="page-link" href="#">2</a></li>
                           <li class="page-item "><a class="page-link" href="#">3</a></li>
                           <li class="page-item"><a class="page-link" href="#">4</a></li>
                           <li class="page-item"><a class="page-link" href="#">5</a></li>
                           
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