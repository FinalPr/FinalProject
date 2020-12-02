<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<!doctype html>
<html class="no-js" lang="zxx">
<head>
             <link rel="stylesheet" href="/spring/resources/assets/css/style-minju.css">
            <link rel="stylesheet" href="/spring/resources/assets/css/main-minju.css">
     <script
            src="https://kit.fontawesome.com/c9096b9061.js"
            crossorigin="anonymous"
          ></script>
          <link rel="stylesheet" href="/spring/resources/assets/css/chat.css" />
        
          
     <script>
	var boardListCategory ="Main";
  	var login = "${loginUser.id}";
	</script>
</head>
   <body>
    <!-- headerInclude -->
	<%@ include file="./common/header.jsp"%>
  <script src="/spring/resources/assets/js/boardList.js"></script>
	<!-- main -->

      <main>

        <!-- slider Area Start -->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="slider-active">
                <div class="single-slider slider-height" data-background="/spring/resources/assets/img/hero/h1_hero.jpg">
                    <div class="container">
                        <div class="row d-flex align-items-center justify-content-between">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 d-none d-md-block">
                                <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                    <img src="/spring/resources/assets/img/hero/hero_man.png" alt="">
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-5 col-md-5 col-sm-8">
                                <div class="hero__caption">
                                    <span data-animation="fadeInRight" data-delay=".4s">오ㅇ!마켓</span>
                                    <h1 data-animation="fadeInRight" data-delay=".6s">오늘도 ㅇ!<br>마켓</h1>
                                    <p data-animation="fadeInRight" data-delay=".8s">오늘도 ㅇ! 마켓에서 안전한 거래하세요 !</p>
                                    <!-- Hero-btn -->
                                    <div class="hero__btn" data-animation="fadeInRight" data-delay="1s">
                                        <a href="industries.html" class="btn hero-btn">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="single-slider slider-height" data-background="assets/img/hero/h1_hero.jpg">
                    <div class="container">
                        <div class="row d-flex align-items-center justify-content-between">
                            <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 d-none d-md-block">
                                <div class="hero__img" data-animation="bounceIn" data-delay=".4s">
                                    <img src="/spring/resources/assets/img/hero/hero_man.png" alt="">
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-5 col-md-5 col-sm-8">
                                <div class="hero__caption">
                                    <span data-animation="fadeInRight" data-delay=".4s">오ㅇ!마켓</span>
                                    <h1 data-animation="fadeInRight" data-delay=".6s">오늘도<br>ㅇ!<br>마켓</h1>
                                    <p data-animation="fadeInRight" data-delay=".8s">오늘도 ㅇ! 마켓에서 안전한 거래하세요 !</p>
                                    <!-- Hero-btn -->
                                    <div class="hero__btn" data-animation="fadeInRight" data-delay="1s">
                                        <a href="industries.html" class="btn hero-btn">Shop Now</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!-- Latest Products Start -->
        <section class="latest-product-area padding-bottom">
            <div class="container">
                <div class="row product-btn d-flex justify-content-end align-items-end">
                    <!-- Section Tittle -->
                    <div class="col-xl-4 col-lg-5 col-md-5">
                        <div class="section-tittle mb-30">
                            <h2>Latest Products</h2>
                        </div>
                    </div>
                    <div class="col-xl-8 col-lg-7 col-md-7">
                        <div class="properties__button f-right">
                            <!--Nav Button  -->
                            <nav>                                                                                                
                                <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                    <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">All</a>
                                    <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">New</a>
                                    <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Featured</a>
                                    <a class="nav-item nav-link" id="nav-last-tab" data-toggle="tab" href="#nav-last" role="tab" aria-controls="nav-contact" aria-selected="false">Offer</a>
                                </div>
                            </nav>
                            <!--End Nav Button  -->
                            
                        </div>
                    </div>
                </div>
                <!-- Nav Card -->
             	<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						role="tabpanel" aria-labelledby="nav-home-tab">
						<div class="row"></div>
					</div>
				</div>
                <!-- End Nav Card -->
            </div>
        </section>
        <!-- Latest Products End -->

    </main>     

     
         
	<!-- footerInclude -->
    <%@ include file="./common/footer.jsp"%>
   

     	<!-- Header End -->
    


    

  
        
    </body>
    
    </html>