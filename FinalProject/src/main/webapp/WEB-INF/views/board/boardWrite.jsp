<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
 <link rel="stylesheet" href="/spring/resources/assets/css/board-write.css" />
 
    
    
</head>
   <body>
    <!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>

   <!-- Main -->
   <main>
      <!-- slider Area Start-->
      <div class="slider-area">
        <!-- Mobile Menu -->
        <div
          class="single-slider slider-height2 d-flex align-items-center"
          data-background="/srping/resources/assets/img/hero/category.jpg"
          style="background-image: url('assets/img/hero/category.jpg')"
        >
          <div class="container">
            <div class="row">
              <div class="col-xl-12">
                <div class="hero-cap text-center">
                  <h2>게시글 등록</h2>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- slider Area End-->

      <!-- Latest Products Start -->
      <section
        class="latest-product-area latest-padding"
        style="text-align: center"
      >
        <section class="sectionBox">
          <form class="passwordUpdate" action="insertBoard.do" method="post">
            <ul class="writeBox">
              <li class="wImg">
                <a>상품이미지</a>
                <div class="wrap">
                  <div class="wrap2">
                    <input
                      type="file"
                      class="wImgFile"
                      accept="image/*"
                      name="wImage"
                      id=""
                    />
                  </div>
                </div>
              </li>
              <li class="wTitle">
                <a>제목</a>
                <div class="wrap">
                  <input type="text" name="title" id="" />
                </div>
              </li>
              <li class="wCate">
                <a>카테고리</a>
                <div class="wrap">
                  <div class="wCate__option">
                    <div class="option__1">
                      <ul>
                        <li><button type="button">남성의류</button></li>
                        <li><button type="button">여성의류</button></li>
                        <li><button type="button">전자기기</button></li>
                        <li><button type="button">생활용품</button></li>
                        <li><button type="button">남성의류</button></li>
                        <li><button type="button">여성의류</button></li>
                        <li><button type="button">전자기기</button></li>
                        <li><button type="button">생활용품</button></li>
                        <li><button type="button">남성의류</button></li>
                        <li><button type="button">여성의류</button></li>
                        <li><button type="button">전자기기</button></li>
                        <li><button type="button">생활용품</button></li>
                      </ul>
                    </div>
                    <div class="option__2">
                      <ul>
                        <li><button type="button">남성의류</button></li>
                        <li><button type="button">여성의류</button></li>
                        <li><button type="button">전자기기</button></li>
                        <li><button type="button">생활용품</button></li>
                        <li><button type="button">남성의류</button></li>
                        <li><button type="button">여성의류</button></li>
                        <li><button type="button">전자기기</button></li>
                        <li><button type="button">생활용품</button></li>
                        <li><button type="button">남성의류</button></li>
                        <li><button type="button">여성의류</button></li>
                        <li><button type="button">전자기기</button></li>
                        <li><button type="button">생활용품</button></li>
                      </ul>
                    </div>
                    <div class="option__3">
                      <ul>
                        <!-- 데이터베이스에서 list를 불러옴 -->
                        <li><button type="button">남성의류</button></li>
                        <li><button type="button">여성의류</button></li>
                        <li><button type="button">전자기기</button></li>
                        <li><button type="button">생활용품</button></li>
                        <li><button type="button">남성의류</button></li>
                        <li><button type="button">여성의류</button></li>
                        <li><button type="button">전자기기</button></li>
                        <li><button type="button">생활용품</button></li>
                        <li><button type="button">남성의류</button></li>
                        <li><button type="button">여성의류</button></li>
                        <li><button type="button">전자기기</button></li>
                        <li><button type="button">생활용품</button></li>
                      </ul>
                    </div>
                  </div>
                </div>
              </li>
              <li class="wStatus">
                <a>상태</a>
                <div class="wrap">
                  <input type="radio" name="status" id="used" />
                  <label for="used">중고상품</label>
                  <input type="radio" name="status" id="new" />
                  <label for="new">새상품</label>
                </div>
              </li>
              <li class="wPrice">
                <a>가격</a>
                <div class="wrap">
                  <div class="inputs">
                    <div class="inputs__price">
                      <input type="text" name="price" id="" class="input" />
                      <div class="output"><div class="out">원</div></div>
                    </div>
                    <div class="inputs__status">
                      <input type="checkbox" name="" id="include" />
                      <label for="include">배송비포함</label>
                      <input type="checkbox" name="" id="nego" />
                      <label for="nego">가격협의 가능</label>
                    </div>
                  </div>
                </div>
              </li>
              <li class="wEx">
                <a>설명</a>
                <div class="wrap">
                  <textarea name="content" id="" cols="30" rows="10"></textarea>
                </div>
              </li>
            </ul>
            <button type="submit">등록하기</button>
          </form>
        </section>
      </section>
      
      <form action="insertBoard.do" method="post">
      	<span>title</span> <input type="text" name="title">
      	<span>content</span> <input type="text" name="content">
      	<button type="submit">등록</button>
      </form>

      <!-- Gallery Start-->

      <!-- Gallery End-->
    </main>
   
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>
   

     	<!-- Header End -->d
    
 <!--   <script src="/FinalProject/assets/js/plugins.js"></script>
    <script src="/FinalProject/assets/js/main.js"></script>	 -->

    

  
        
    </body>
    
    </html>