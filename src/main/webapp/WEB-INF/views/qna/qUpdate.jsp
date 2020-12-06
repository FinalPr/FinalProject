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
            <form action="qupdate.do" name="frm" method="post" id="joinForm" enctype="multipart/form-data">
               <div class="container" style="display: flex;">
                <%@ include file="../common/qnaSide.jsp" %>
                <div id="qnaQury" class="mypage_rightwrap">
                   <h1>${qnalist.qnaId }번 글 수정하기</h1>
                   <br>
                   <hr>
                <div>
            </div>
            <input type="hidden" name="qnaId" value="${ qnalist.qnaId }">
			<input type="hidden" name="originalFileName" value="${ qnalist.originalFileName }">
			<input type="hidden" name="renameFileName" value="${ qnalist.renameFileName }">
        
                <hr>
                 <div>
                <span > 문의유형 </span>
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
                <span > 제목 </span>
                <span class="updetail"><input type="text" name="qnaTitle" value="${qnalist.qnaTitle }"> </span>
            </div>
              <hr>
             <div>
                <span> 작성자 </span>
               <span class="updetail"><input type="text" name="qnaWriter" value="${qnalist.qnaWriter  }" readonly="readonly"> </span>
            </div>
                <hr>
                <div>
                <span>내용 </span>
              <span class="updetail"><input type="text" name="qnaContent" value="${ qnalist.qnaContent  }"> </span>
                </div>
                <hr>
                <span>첨부파일</span>
                <span class="upFile"><input type="file" name="uploadFile">
					<c:if test="${ !empty qnalist.originalFileName }">
						<br>현재 업로드한 파일 : 
						<a href="${ contextPath }/resources/buploadFiles/${ qnalist.renameFileName }"	download="${qnalist.originalFileName }">${ qnalist.originalFileName }</a>
					</c:if></span>
                <br><br>
               
                <hr>
               <div class="qnalisk">
               <span class="uppagecss">
					<input type="submit" value="수정하기" class="qdetailModify">
					<a href="javascript:history.go(-1)">이전페이지로</a>
				</span>
               </div>
             
             
  
       
         </form>
        </section>
    </main>
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>

    </body>
</html>