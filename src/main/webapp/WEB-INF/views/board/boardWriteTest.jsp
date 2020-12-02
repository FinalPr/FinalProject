<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="zxx">
<head>
 <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
 <link rel="stylesheet" href="/spring/resources/assets/css/boardWrite.css?after122" />
  <script src="/spring/resources/assets/js/boardWrite.js?a2rr222"></script>
   
</head>
   <body>
    <!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>

   <!-- Main -->
   <main>
      <form action="insertBoard.do" id="insertBoard.do" method="post" enctype="multipart/form-data">
    <div class ="boardWriterWrap">
        <div class="bordhead">
        <p style="font-size: 50px; ">상품 글쓰기</p>
        <input class="top" type="text" name="title" placeholder="상품명을 입력하세요." style="width:800px; margin-top: 20px;">
        
        <div midle style="width: 800px; border:1px solid gray; margin-top:20px">
        <p>판매 가격*</p>
        <input type="number" name="price" placeholder="가격을 입력해주세요"><span> 원</span>
        <br>
        <p>상품 카테고리</p>
        <input type="text" name="category" id="cateResult" placeholder="대분류 > 중분류 > 소분류" style="width:500px" readonly>
        <button type="button" id="categoryBtn" >카테고리 선택</button>
        
        <p>상품 상태</p>
        <fieldset>
            <input type ="radio" name="state" value="미개봉"><label>미개봉</label>
            <input type ="radio" name="state" value="거의 새 것"><label>거의 새 것</label>
            <input type ="radio" name="state" value="사용감 있음"><label> 사용감 있음</label>
        </fieldset>                                 
        </div>
        </div>
        
        
         <!-- ---------파일 업로드 !!----------------------- -->
        <div class="drop">
       <!--   <input multiple="multiple" id="multiUpload"  type="file" name="file"> -->
            <div class="slideshow-container">
             <div id ="slideContain">
                <div class="mySlides fade" draggable="true" ondragstart="dragStart_(event)" ondrag="drag_(event)" >
                  <div class="numbertext">0</div>
                  
                  <div class="text">Caption</div>
                </div>
                
               
                
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
                <br>
                <div style="text-align:center" id="slideSelector">
                   
                  <!--    <span class="dot" onclick="currentSlide(1)"></span>  -->
                   
                 </div>
            </div>
            
               <img draggable="false" ondrop="drop_(event)" ondragover="dragOver_(event)" droppable="true" class="trash" alt="" height="300" width="200" src="/spring/resources/assets/img/trash5.png">
        <script>
       
		</script>


            
                
        </div>

        <div style="margin-top: 30px;">
        <textarea name="content" cols="103" rows="20" style="margin-left:10px;" placeholder="내용을 적어라!"></textarea>
        </div>
             <div class="black_bg"></div>
             
        <!-- ---------모달부분 !!----------------------- -->
		<div class="modal_wrap">
		    <div class="modal_close"><a href="#">close</a></div>
		    <div class="category">
		        <h1> 카테고리 선택</h1>
		        <p>상품의 카테고리를 선택해 주세요.</p>
		        <div class="division" id="firstcate" ></div>
		        <div class="division" id="secondcate"><p class="def">중분류</p></div>
		        <div class="division" id="thirdcate"><p class="def">소분류</p></div>
		        <button id="cateBtn" type="button" onclick="checkcateBtn()" disabled>확인</button>
		    </div>
		</div>
        <div style="margin-left:200px">
        <button type="button" onclick="insertBoard()" style="font-size: 40px;">등록</button>
        <button type="button" style="font-size: 40px;">취소</button>
        </div>  
           
    </div>
   

       
   
</form>



    </main>
   
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>
     	<!-- Header End -->

    

  
        
    </body>
    
    </html>