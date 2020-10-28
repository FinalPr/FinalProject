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
            <form>
            <div class="container" style="display: flex;">
                <%@ include file="../common/qnaSide.jsp" %>
                <div id="qnaQury" class="mypage_rightwrap">
                   <h1>신고&문의</h1>
                   <br><br>
                   <table>
                       <tr>
                           <th><h3>신고</h3><p>사이트 오류,상품/판매자 신고 접수</p></th>
                           <th><h3>문의</h3><p>서비스 이용 문의</p></th>
                       </tr>
                   </table>
                   <hr>
                <div>
                   <span>서비스 <lable>(필수)</lable></span>
                <div id="check">
                   <input type="radio" name="choice" id="order">
                   <label for="order">주문/결제</label>
                   <input type="radio" name="choice" id="order">
                   <label for="order">주문/결제</label>
                   <input type="radio" name="choice" id="order">
                   <label for="order">주문/결제</label>
                   <input type="radio" name="choice" id="order">
                   <label for="order">주문/결제</label>
                   <input type="radio" name="choice" id="order">
                   <label for="order">주문/결제</label>
                   <input type="radio" name="choice" id="order">
                   <label for="order">주문/결제</label>
                </div>
            </div>
                <hr>
                <div>
                <span>신고사유</span> <input type="text">
            </div>
                <hr>
                <div>
                <span> 제목 </span>
                <input type="text">
            </div>
                <hr>
                <div>
                <span>내용</span>
                <textarea id="content" class="" cols="60" rows="5" maxlength="1000"></textarea>
                </div>
                <hr>
                <span>첨부파일</span>
                <input type="file">
                <br><br>
                <p>* 5MB 미만의 파일 3개만 첨부가 가능합니다.(PGN,GIF,JPG만 가능)<br>
                그 이상의 파일 첨부가 필요한 경우 그냥 닥쳐
                </p>
                <hr>
                <button type="submit">접수하기</button>
            </form>
                </div>
             
            </div>
        </div>
    </main>
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>

    </body>
</html>