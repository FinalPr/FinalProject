<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
 	<link rel="stylesheet" href="/spring/resources/assets/css/style-minju.css">
 	<link rel="stylesheet" href="/spring/resources/assets/css/main-minju.css">
 	<link rel="stylesheet" href="/spring/resources/assets/css/mypage-minju.css">
     <link rel="stylesheet" href="/spring/resources/assets/css/mypageList.css"/>
</head>
   <body>
    <!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>

   <!-- Main -->
     <section class="product_list section_padding">
       <!-- <div class="container" style="display: flex;">
     		<div class="mypage_leftwrap">
                    <div class="mypage_title">마이페이지</div>
                    <ul class="mypage_left">
                        <li class="mypage_h1">나의거래내역</li>
                        <li class="mypage_h2"><a href="#">판매내역</a></li>
                        <li class="mypage_h2"><a href="buyList.do">구매내역</a></li>
                    </ul>
                    <ul class="mypage_left">
                        <li class="mypage_h1">나의개인정보</li>
                        <li class="mypage_h2"><a href="userInfo-view.html">내 상점</a></li>
                        <li class="mypage_h2"><a href="userInfoUpdate.html">회원정보수정</a></li>
                    </ul>
                    <ul class="mypage_left">
                        <li class="mypage_h1"><a href="#">찜하기</a></li>
                    </ul>
                    <ul class="mypage_left">
                        <li class="mypage_h1"><a href="mytag.html">마이태그</a></li>
                    </ul>
                    <ul class="mypage_left">
                        <li class="mypage_h1"><a href="#">최근본상품</a></li>
                    </ul>
                </div> -->
      <div class="showTitleBox">
        <h1 class="showTitle">최근 본 내역</h1>
      </div>

       <%@ include file="../common/listCommon.jsp" %>

      <div class="totalBox">
        <div class="container">
          <div class="row" data-type="buy">
            <div class="col-md-8">
              <div class="product_list">
                <div class="row">
                  <div class="col-lg-6 col-sm-6">
                    <div class="single_product_item">
                      <img
                        src="/spring/resources/assets/img/categori/product6.png"
                        alt=""
                        class="img-fluid"
                      />
                      <h3>
                        <a href="single-product.html"
                          >도라에몽 청자켓 팝니다. (급처)</a
                        >
                      </h3>
                      <p>5,000,000원</p>
                      <p>거래중</p>
                    </div>
                  </div>
                  <div class="col-lg-6 col-sm-6">
                    <div class="single_product_item">
                      <img
                        src="/spring/resources/assets/img/categori/product2.png"
                        alt=""
                        class="img-fluid"
                      />
                      <h3>
                        <a href="single-product.html">투쿨 맨투맨 팝니다.</a>
                      </h3>
                      <div class="product-ratting">
                        <i class="far fa-star"></i>
                        <i class="far fa-star"></i>
                        <i class="far fa-star"></i>
                        <i class="far fa-star"></i>
                        <i class="far fa-star low-star"></i>
                      </div>
                      <p>7,000원</p>
                      <p>구매 완료</p>
                    </div>
                  </div>
                  <div class="col-lg-6 col-sm-6">
                    <div class="single_product_item">
                      <img
                        src="/spring/resources/assets/img/categori/product5.png"
                        alt=""
                        class="img-fluid"
                      />
                      <h3>
                        <a href="single-product.html"
                          >Foam filling cotton slow rebound pillows</a
                        >
                      </h3>
                      <p>From $5</p>
                    </div>
                  </div>
                  <div class="col-lg-6 col-sm-6">
                    <div class="single_product_item">
                      <img
                        src="/spring/resources/assets/img/categori/product6.png"
                        alt=""
                        class="img-fluid"
                      />
                      <h3>
                        <a href="single-product.html"
                          >Memory foam filling cotton Slow rebound pillows</a
                        >
                      </h3>
                      <p>From $5</p>
                    </div>
                  </div>
                  <div class="col-lg-6 col-sm-6">
                    <div class="single_product_item">
                      <img
                        src="/spring/resources/assets/img/categori/product1.png"
                        alt=""
                        class="img-fluid"
                      />
                      <h3>
                        <a href="single-product.html"
                          >Memory foam filling cotton Slow rebound pillows</a
                        >
                      </h3>
                      <p>From $5</p>
                    </div>
                  </div>
                  <div class="col-lg-6 col-sm-6">
                    <div class="single_product_item">
                      <img
                        src="/spring/resources/assets/img/categori/product4.png"
                        alt=""
                        class="img-fluid"
                      />
                      <h3>
                        <a href="single-product.html"
                          >Sleeping orthopedic sciatica Back Hip Joint Pain
                          relief</a
                        >
                      </h3>
                      <p>From $5</p>
                    </div>
                  </div>
                  <div class="col-lg-6 col-sm-6">
                    <div class="single_product_item">
                      <img
                        src="/spring/resources/assets/img/categori/product5.png"
                        alt=""
                        class="img-fluid"
                      />
                      <h3>
                        <a href="single-product.html"
                          >Memory foam filling cotton Slow rebound pillows</a
                        >
                      </h3>
                      <p>From $5</p>
                    </div>
                  </div>
                  <div class="col-lg-6 col-sm-6">
                    <div class="single_product_item">
                      <img
                        src="/spring/resources/assets/img/categori/product3.png"
                        alt=""
                        class="img-fluid"
                      />
                      <h3>
                        <a href="single-product.html"
                          >Sleeping orthopedic sciatica Back Hip Joint Pain
                          relief</a
                        >
                      </h3>
                      <p>From $5</p>
                    </div>
                  </div>
                  <div class="col-lg-6 col-sm-6">
                    <div class="single_product_item">
                      <img
                        src="/spring/resources/assets/img/categori/product2.png"
                        alt=""
                        class="img-fluid"
                      />
                      <h3>
                        <a href="single-product.html"
                          >Geometric striped flower home classy decor</a
                        >
                      </h3>
                      <p>From $5</p>
                    </div>
                  </div>
                  <div class="col-lg-6 col-sm-6">
                    <div class="single_product_item">
                      <img
                        src="/spring/resources/assets/img/categori/product1.png"
                        alt=""
                        class="img-fluid"
                      />
                      <h3>
                        <a href="single-product.html"
                          >Geometric striped flower home classy decor</a
                        >
                      </h3>
                      <p>From $5</p>
                    </div>
                  </div>
                </div>
                <div class="load_more_btn text-center">
                  <a href="#" class="btn_3">Load More</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    <!--   </div> -->
      <script>
        const showBtn = document.querySelector(".showBtn");
        const rows = document.querySelectorAll(".totalBox > .container > .row");
      </script>
    </section>
    <!-- product list part end-->

    <!-- client review part here -->
    <section class="client_review">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="client_review_slider owl-carousel">
              <div class="single_client_review">
                <div class="client_img">
                  <img src="/spring/resources/assets/img/client.png" alt="#" />
                </div>
                <p>
                  "Working in conjunction with humanitarian aid agencies, we
                  have supported programmes to help alleviate human suffering.
                </p>
                <h5>- Micky Mouse</h5>
              </div>
              <div class="single_client_review">
                <div class="client_img">
                  <img src="/spring/resources/assets/img/client_1.png" alt="#" />
                </div>
                <p>
                  "Working in conjunction with humanitarian aid agencies, we
                  have supported programmes to help alleviate human suffering.
                </p>
                <h5>- Micky Mouse</h5>
              </div>
              <div class="single_client_review">
                <div class="client_img">
                  <img src="/spring/resources/assets/img/client_2.png" alt="#" />
                </div>
                <p>
                  "Working in conjunction with humanitarian aid agencies, we
                  have supported programmes to help alleviate human suffering.
                </p>
                <h5>- Micky Mouse</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
   
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>
   

     	<!-- Header End -->
    
 <!--   <script src="/FinalProject/assets/js/plugins.js"></script>
    <script src="/FinalProject/assets/js/main.js"></script>	 -->
	
    

  
        
    </body>
    
    </html>