<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
 	<link rel="stylesheet" href="/spring/resources/assets/css/style-minju.css">
 	<link rel="stylesheet" href="/spring/resources/assets/css/main-minju.css">
 	<link rel="stylesheet" href="/spring/resources/assets/css/mypage-minju.css">
       <!-- Jquery Plugins, main Jquery -->
 
    
</head>
   <body>
    <!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>

   <!-- Main -->
   <main>
        <section class="latest-product-area padding-bottom">
            <div class="container" style="display: flex;">
                <%@ include file="../common/myPageSide.jsp" %>
                <div class="mypage_rightwrap">
                    <ul class="right_ul">
                        <li>
                            <a href="userInfo-sell_list.html">
                                <img src="/spring/resources/assets/img/sale_icon.png" alt="판매내역">
                                <span class="mypage_txt">판매내역</span>
                            </a>
                        </li>
                        <li>
                            <a href="userInfo-buy_list.html">
                                <img src="/spring/resources/assets/img/buy_icon.png" alt="구매내역">
                                <span class="mypage_txt">구매내역</span>
                            </a>
                        </li>
                        <li>
                            <a href="userInfo-pick_list.html">
                                <img src="/spring/resources/assets/img/zzim_icon.png" alt="찜하기">
                                <span class="mypage_txt">찜하기</span>
                            </a>
                        </li>
                    </ul>
                    <div class="lately_sale">
                        <div class="lately_h3">판매내역<a href="sellList.do">+더보기</a></div>
                        <table>
                            <thead>
                                <tr>
                                    <th>판매일시</th>
                                    <th>결제방법</th>
                                    <th>결제금액</th>
                                    <th>판매상태</th>
                                    <th>배송상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2020-09-18</td>
                                    <td>계좌이체</td>
                                    <td>300,000</td>
                                    <td>판매완료</td>
                                    <td><a href="#"><i class="fas fa-truck"></i></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="lately_buy">
                        <div class="lately_h3">구매내역<a href="buyList.do">+더보기</a></div>
                        <table>
                            <thead>
                                <tr>
                                    <th>구매일시</th>
                                    <th>구매방법</th>
                                    <th>구매금액</th>
                                    <th>구매상태</th>
                                    <th>배송상태</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>2020-09-18</td>
                                    <td>계좌이체</td>
                                    <td>300,000</td>
                                    <td>거래중</td>
                                    <td><a href="#"><i class="fas fa-truck"></i></a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="lately_product">
                        <div class="lately_h3">최근본상품<a href="checkList.do">+더보기</a></div>
                        <div class="tab-content" id="nav-tabContent" style="margin-top: 20px;">
                            <!-- card one -->
                            <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                                <div class="row">
                                    <div class="col-xl-3 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product1.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product2.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="col-xl-3 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product3.png" alt="">
                                                <div class="new-product">
                                                    <span>New</span>
                                                </div>
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product4.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card two -->
                            <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product4.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product5.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product6.png" alt="">
                                                <div class="new-product">
                                                    <span>New</span>
                                                </div>
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product2.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product3.png" alt="">
                                                <div class="new-product">
                                                    <span>New</span>
                                                </div>
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product1.png" alt="">
                                                <div class="new-product">
                                                    <span>New</span>
                                                </div>
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Card three -->
                            <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product2.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product3.png" alt="">
                                                <div class="new-product">
                                                    <span>New</span>
                                                </div>
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product1.png" alt="">
                                                <div class="new-product">
                                                    <span>New</span>
                                                </div>
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product4.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product6.png" alt="">
                                                <div class="new-product">
                                                    <span>New</span>
                                                </div>
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product5.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- card foure -->
                            <div class="tab-pane fade" id="nav-last" role="tabpanel" aria-labelledby="nav-last-tab">
                                <div class="row">
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product1.png" alt="">
                                                <div class="new-product">
                                                    <span>New</span>
                                                </div>
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product2.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product3.png" alt="">
                                                <div class="new-product">
                                                    <span>New</span>
                                                </div>
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product4.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product5.png" alt="">
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 col-lg-4 col-md-6">
                                        <div class="single-product mb-60">
                                            <div class="product-img">
                                                <img src="/spring/resources/assets/img/categori/product6.png" alt="">
                                                <div class="new-product">
                                                    <span>New</span>
                                                </div>
                                            </div>
                                            <div class="product-caption">
                                                <div class="product-ratting">
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                    <i class="far fa-star low-star"></i>
                                                </div>
                                                <h4><a href="#">Green Dress with details</a></h4>
                                                <div class="price">
                                                    <ul>
                                                        <li>$40.00</li>
                                                        <li class="discount">$60.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
   
   
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>
   

     	<!-- Header End -->
    
 <!--   <script src="/FinalProject/assets/js/plugins.js"></script>
    <script src="/FinalProject/assets/js/main.js"></script>	 -->

    

  
        
    </body>
    
    </html>