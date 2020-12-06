<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
 	<link rel="stylesheet" href="/spring/resources/assets/css/style-minju.css">
 	<link rel="stylesheet" href="/spring/resources/assets/css/main-minju.css">
 	<link rel="stylesheet" href="/spring/resources/assets/css/mypage-minju.css">
 	 <link rel="stylesheet" href="/spring/resources/assets/css/qna.css">
 	 <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
 	 
 	 <script type="text/javascript">
 	$(document).ready(function(){
 	   $("#qupView").click(function(){
 		  var result = confirm("수정하시겠습니까?");
 		 if(result){
 		     location.href="qupView.do";
 		 }else{
 		    return false;
 		 }
 	   });
 	   $("#qdelete").click(function(){
 		  var result = confirm("삭제하시겠습니까?");
 		 if(result){
 		     location.href="qdelete.do";
 		 }else{
 		    return false;
 		 }
 	   });
 	});


 	 
 	 </script>
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
                   <h1>${qnalist.qnaId }번 글 상세보기</h1>
                   <br>
                   <hr>
             
        
                <hr>
                 <div>
                <span > 문의유형 </span>
                <span class="Alldetail">${ qnalist.reason}</span>
            </div>
              <hr>
                <div>
                <span > 제목 </span>
                <span class="Alldetail">${ qnalist.qnaTitle}</span>
            </div>
              <hr>
             <div>
                <span> 작성자 </span>
               <span class="Alldetail">${qnalist.qnaWriter }</span>
            </div>
                <hr>
                <div>
                <span>내용 </span>
              <span class="Alldetail">${ qnalist.qnaContent }</span>
                </div>
                <hr>
                <div>
                <span>관리자 처리내용 </span>
              <span class="Alldetail">${ qnalist.areply }</span>
                </div>
                <hr>
                <span>첨부파일</span>
                <span class="derailFile"><c:if test="${ !empty qnalist.originalFileName }">
					<a class="FileDownload" href="${contextPath }/resources/buploadFiles/${qnalist.renameFileName}" download="${ qnalist.originalFileName }">${qnalist.originalFileName }</a>
				</c:if> </span>
                <br><br>
               
                <hr>
               <div class="qnalisk">
               	<span >
				<c:url var="qupview" value="qupView.do">
					<c:param name="qnaId" value="${qnalist.qnaId }"/>
				</c:url>
				<c:url var="qdelete" value="qdelete.do">
					<c:param name="qnaId" value="${ qnalist.qnaId }"/>
				</c:url>
				<c:url var="qlist" value="QnaList.do">
					<c:param name="currentPage" value="${ currentPage }"/>
				</c:url>
				
				<c:if test="${ loginUser.id eq qnalist.qnaWriter }">
					<a class="qUpcss" href="${ qupview }" id="qupView">수정하기</a>&nbsp;
					<a href="${ qdelete }" id="qdelete">삭제하기</a>&nbsp;
				</c:if>
				<a href="${ qlist }">목록으로</a>
				</span>
               </div>
           
                </div>
             
            </div>
       
         </form>
        </section>
    </main>
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>

    </body>
</html>