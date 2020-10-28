<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
       <!-- Jquery Plugins, main Jquery -->
 	<!-- product detail by hyoojeong -->
		
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"><div class="pd-wrap">
		<link rel="stylesheet" href="/spring/resources/assets/css/productdetail.css">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
</head>
   <body>
    <!-- HeaderInclude -->
	<%@ include file="../common/header.jsp"%>

   <!-- Main -->
    <!-- slider Area Start-->
    <div class="slider-area ">
        <!-- Mobile Menu -->
        <div class="single-slider slider-height2 d-flex align-items-center" data-background="/spring/resources/assets/img/hero/category.jpg">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="hero-cap text-center">
                            <h2>product Details</h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- slider Area End-->

  <!--================Single Product Area =================-->
  
  
  <div class="container">
	        <div class="heading-section">
	            <h2>상품 상세</h2>
	        </div>
	        <div class="row">
	        	<div class="col-md-6">
	        		<div id="slider" class="owl-carousel product-slider">
	        		<c:forEach items="${imageList}" var="image">
						<div class="item">
						  	<img src="/spring/resources/assets/img/${image}" />
						</div>
					</c:forEach>
					</div>
					<div id="thumb" class="owl-carousel product-thumb">
						<c:forEach items="${imageList}" var="image">
						<div class="item">
						  	<img src="/spring/resources/assets/img/${image}" />
						</div>
						</c:forEach>
					</div>
	        	</div>
	        	
	        	
	        	<div class="col-md-6">
	        		<div class="product-dtl">
        				<div class="product-info">
		        			<div class="product-name"><b>${board.title}</b></div>
		        			
		        			<div class="product-price-discount"><span>${board.price}</span>
		        		</div>
	        			<i class="fas fa-user-alt">${board.writer}</i>      				
	        			<div class="product-count">
	        			
	        			
							<a href="#" class="round-black-btn">구매하기</a>
							<a href="#" class="round-black-btn">경매하기</a><br>
							<a href="#" class="round-black-btn">채팅하기</a>
							<a href="#" class="round-black-btn">장바구니</a>
	        			</div>
	        			
	        		</div>
	        	</div>
	        </div>
	 </div>
	 
	 <div class="product-info-tabs">
		        <ul class="nav nav-tabs" id="myTab" role="tablist">
				  	<li class="nav-item">
				    	<a class="nav-link active" id="description-tab" data-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">상품 내용</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab" aria-controls="review" aria-selected="false">댓글 보기</a>
				  	</li>
				</ul>
				<div class="tab-content" id="myTabContent">
				  	<div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
				  	${board.content}
				  		
				  	</div>
				  	<div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
				  		<form class="review-form">
		        			<div class="form-group">
			        			<label><b>댓글 쓰기</label>
			        			<div>
				        		</div>		
			        			<textarea class="form-control" name="comment" id="review-detail" rows="3" placeholder="댓글입력하세요" ></textarea>
			        			<input type="hidden" name="no" >
								<input type="hidden" name="category">
					        <button type="submit" class="round-enroll-btn" >등록하기</button>
					        
					        <br>&nbsp;

							<h6 class="review-list"><label><b>댓글 목록</label></h6>
							
				<c:forEach items="${commentList}" var="comment">
					
					<c:choose><!-- 댓글 -->
					  <c:when test="{comment.sub_no eq 0}">
				        	<div id="reply-origin">
				        		<table id="reply" style="width:1000px">
				  					<tr>
						  			<td rowspan="2"> </td>
									<td>${comment.writer }</td>
									<td>${comment.insert_date}</td>
									<td align="center">
									<button type="button" class="updateReview">댓글달기</button>
		 							<button type="button" class="updateReview">수정하기</button>				
									<button type="button" class="updateReview"	style="display:none;" >수정완료</button> &nbsp;&nbsp;
									<button type="button" class="deleteReview">삭제하기</button>						 
									<button type="button" class="UpdateFinish"	style="display:none;" >댓글 추가 완료</button> 
									
							
									</td>
									</tr>
									<tr class="review-content">
										<td colspan="3" >
												${comment.content }
											</td>
										</tr>
									</table>
							</div>
						</c:when>
					
						<c:otherwise><!-- 대댓글 -->
							<div id="reply-origin-reply" style="margin-left : 40px">
					        		<table id="reply" style="width:1000px; height:50px;">
				  					<tr>
							  			<td rowspan="2"> </td>
										<td>${comment.writer }</td>
										<td>${comment.insert_date}</td>
										<td align="center">
										<button type="button" class="updateReview">댓글달기</button>
			 							<button type="button" class="updateReview">수정하기</button>				
										<button type="button" class="updateReview"	style="display:none;" >수정완료</button> &nbsp;&nbsp;
										<button type="button" class="deleteReview">삭제하기</button>						 
										<button type="button" class="UpdateFinish"	style="display:none;" >댓글 추가 완료</button> 
									
										
										</td>
									</tr>
									<tr class="review-content">
										<td colspan="3">
										${comment.content }
										</td>
									</tr>
									</table>
							</div>
						</c:otherwise>
					</c:choose>
			    </c:forEach>   		
		
				</div>

			      </form>
			        	</div>
				  	</div>
				</div>
			</div>
	 
	 
	</div>
   
   
    <!-- footerInclude-->
    <%@ include file="../common/footer.jsp"%>       
    </body>
    
    </html>