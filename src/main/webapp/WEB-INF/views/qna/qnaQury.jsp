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
            <form action="qnainsert.do" name="frm" method="post" id="joinForm" enctype="multipart/form-data">
            <div class="container" style="display: flex;">
                <%@ include file="../common/qnaSide.jsp" %>
                <div id="qnaQury" class="mypage_rightwrap">
                   <h1>1:1 문의</h1>
                   <br>
                 
                   <hr>
                <div>
                   <span>서비스 <lable>(필수)</lable></span>
                <div id="check">
                   <input type="radio" name="reason" id="order" value="사기/결제">
                   <label for="order">사기/결제</label>
                   <input type="radio" name="reason" id="order" value="회원정보" checked="checked">
                   <label for="order">회원정보</label>
                   <input type="radio" name="reason" id="order"  value="광고">
                   <label for="order">광고</label>
                   <input type="radio" name="reason" id="order" value="기타">
                   <label for="order">기타</label>
                </div>
            </div>
                <hr>
                <div>
                <span> 제목(필수) </span>
                <input type="text" name="qnaTitle">
            </div>
              <hr>
             <div>
                <span> 작성자 </span>
                <input type="text"  name="qnaWriter" value="${ loginUser.id }" readonly>
            </div>
                <hr>
                <div>
                <span>내용 (필수)</span>
                <textarea id="content" class="" cols="60" rows="5" name="qnaContent" maxlength="1000"></textarea>
                </div>
                <hr>
                <span>첨부파일</span>
                <input type="file" name="uploadFile">
                <br><br>
                <p>* 5MB 미만의 파일 3개만 첨부가 가능합니다.(PGN,GIF,JPG만 가능)<br>
                </p>
                <hr>
                <button type="submit">접수하기</button>
           
                </div>
             
            </div>
       
         </form>
        </section>
    </main>
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>

    </body>
</html>