<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
 	
</head>
   <body>
    <!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>

   <!-- Main -->
  <main>

        <!-- slider Area Start-->
        <div class="slider-area ">
            <!-- Mobile Menu -->
            <div class="single-slider slider-height2 d-flex align-items-center" data-background="/spring/resources/assets/img/hero/category.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="hero-cap text-center">
                                <h2>Product</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- slider Area End-->

        <!-- Latest Products Start -->
        <section class="latest-product-area latest-padding">
            <div class="container">
                <div class="row product-btn d-flex justify-content-between">
                        <div class="properties__button">
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
                        <div class="select-this d-flex">
                            <div class="featured">
                                <span>Short by: </span>
                            </div>
                            <form action="#">
                                <div class="select-itms">
                                    <select name="select" id="select1">
                                        <option value="">Featured</option>
                                        <option value="">Featured A</option>
                                        <option value="">Featured B</option>
                                        <option value="">Featured C</option>
                                    </select>
                                </div>
                            </form>
                        </div>
                </div>
                <!-- Nav Card -->
               
                <div class="tab-content" id="nav-tabContent">
                    <!--상품목록 -->
                    <c:forEach begin="1" end="${board.size() / 4 }" items="boardList" var="list">
	                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
	                    	<c:forEach begin="1" end="4" items="${list}" var="baord">
	                        	<div class="row">
		                            <div class="col-xl-4 col-lg-4 col-md-6">
		                                <div class="single-product mb-60">
		                                    <div class="product-img">
		                                        <img src="/spring/resources/assets/img/categori/product6.png" alt="">
		                                        <div class="new-product">
		                                            <span>New</span>
		                                        </div>
		                                    </div>
		                                    <!-- 별점부분 -->
		                                    <div class="product-caption">
		                                        <div class="product-ratting">
		                                            <i class="far fa-star"></i>
		                                            <i class="far fa-star"></i>
		                                            <i class="far fa-star"></i>
		                                            <i class="far fa-star low-star"></i>
		                                            <i class="far fa-star low-star"></i>
		                                        </div>
		                                        <h4><a href="#">${bard.title }</a></h4>
		                                        <div class="price">
		                                            <ul>
		                                                <li>${board.price }</li>
		                                            </ul>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
	                        </c:forEach>
	                    </div>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Latest Products End -->

       
      
      

    </main>
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>

    </body>
</html>