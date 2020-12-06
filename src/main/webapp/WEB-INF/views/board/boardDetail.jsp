<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html class="no-js" lang="zxx">
<head>
   	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
		<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
		<link rel="stylesheet" href="/spring/resources/assets/css/productdetail.css">
    <style>
    	
    </style>
    <script type="text/javascript">
        	var commentLength;
        	var commentCount;
        	var writer ="${loginUser.id}";
        	
        	$(function(){
        		console.log("최초 시행");
        		getCommentList();
        	});
       
        
        	function insertComment(id){
        		console.log("댓글");
        		var arr=$('#'+id+"Btn").val().split(',');
        		var no = ${board.no};
        		var sub_no=0;
        		var towho="";
        		if(arr[1] != 0) {
        			sub_no= -1;
        			towho=arr[2];
        		}
        		var content = $('#'+id+"_content").val();
        		var ref_bno = $('#'+id+"_ref_bno").val();
        		var category = "${board.category}";	 
        		var writer = "";
        	   	
        		
        		
        		writer="test";
        		$.ajax({
        			url:"insertComment.do",
        			type:"post",
        			data:{"no":no,"content":content,"sub_no":sub_no,"towho":towho,"ref_bno":ref_bno,"category":category,"writer":writer},
        			success:function(result){
        				if(result =="succeed"){
        					alert("댓글 성공!");
        					$('#'+id+"_content").val("");
        					$('#answerComment').remove();
        					getCommentList();
        					
        				}else{
        					alert("댓글 실패!");
        				}
        			}
        		});
        		
        		
        	}
        	
        	function answerComment(e){
        		console.log("answerComment!");
        		
        		$('#answerComment').remove();
        		$(e).parents('table').after('<table id="answerComment" width=800 style="margin-top : 15px"><td><div class="form-group" >\
	        			<label><b>답글 쓰기</label>\
	        			<div>\
		        		</div>\
	        			<textarea class="form-control" id="answerComment_content" name="content" id="review-detail" rows="3" placeholder="댓글입력하세요" ></textarea>\
						<input type="hidden" id="answerComment_category" name="category" value="${board.category}">\
						<input type="hidden" id="answerComment_writer"name="towho" value="${comment.writer}">\
			  			 <input type="hidden" id="answerComment_ref_bno"  name="ref_no" value="${board.no}">\
			        <button id="answerCommentBtn" type="button" onclick="insertComment(\'answerComment\')" class="round-enroll-btn" value="'+ $(e).val() +'">등록</button>\
			        <button type="button" onclick="deleteAnswerComment(this)" class="round-enroll-btn" >취소</button> </td></table>');
        			
        	}
        	function deleteAnswerComment(e){
        		console.log("deleteAnswerComment");
        		$(e).parents('table').remove();
        	}
        	
        	function getCommentList(){
        		var no = ${board.no};
        		var category = "${board.category}";
        		var $table1;
        		var $table2;
        		var $tr;
        		var $td;
        		var $div1;
        		var $div2;
        		
        		$('.reply-origin').remove();
        		$('.reply-origin-reply').remove();
        		
        	
        		
        		
        		$.ajax({
        			url:"getCommentRenewal.do",
        			data:{no : no,category:category},
        			type:"post",
    	  			dataType:"json",
        			success:function(commentList){
        				commentLength = commentList.length;	
        				console.log("commentList : ajax!");
        				commentCount =0;
        				for(var i = 0 ;i < commentList.length ; i++){
        					
        					$div1 = $('<div class="reply-origin" style="margin-top:15px" >');
			        		$div2 = $('<div class="reply-origin-reply" style="margin-left : 40px; margin-top:15px">');
        					$table1 = $('<table id="reply" style="width:1000px">');
			        		$table2 = $('<table id="reply" style="width:1000px; height:50px;">');
			        		$tr = $('<tr>');
			        		$td = $('<td>');
        					$tr.append('<td rowspan="2"></td>');
        					$tr.append('<td class = "comment.writer">'+commentList[i].writer+'</td>');
        					$tr.append('<td>'+commentList[i].insert_date+'</td>');
        					$td.append('<button type="button" class="updateReview" onclick="answerComment(this)" value="'+commentList[i].no+","+-1+","+commentList[i].writer+'">답장</button>');
        					$td.append('<button type="button" class="updateReview" >수정</button>');
        					$td.append('<button type="button" class="updateReview"	style="display:none;" >수정완료</button> &nbsp;&nbsp;');
        					$td.append('<button type="button" class="deleteReview" onclick="deleteComment.do(this)" value="'+commentList[i].no+","+-1+","+commentList[i].writer+'">삭제</button>');
        					$td.append('<button type="button" class="UpdateFinish"	style="display:none;" >댓글 추가 완료</button>');
        					$tr.append($td);
        					
        					if(commentList[i].sub_no === 0 ){
        						commentCount++;
        						$table1.append($tr);
	        					$tr = $('<tr class="review-content">');
	        					$td = $('<td colspan="3">');
        						$td.text(commentList[i].content);
	        					$tr.append($td);
	        					$table1.append($tr);
	        					$div1.append($table1);
	        					$('#commentList').append($div1);
	        					
        					}else{
        						$table2.append($tr);
	        					$tr = $('<tr class="review-content">');
	        					$td = $('<td colspan="3">');
        						$td.text(commentList[i].towho +":"+commentList[i].content);
	        					$tr.append($td);
	        					$table2.append($tr);
	        					$div2.append($table2);
	        					$('#commentList').append($div2);
        					}
        					
        				}
        			}
        		});
        		
        	
        	}
        </script>
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
	            <h2>${board.title}</h2>
	        </div>
	        <div class="row">
	        	<div class="col-md-6">
	        		<div id="slider" class="owl-carousel product-slider">
	        		<c:forEach items="${imageList}" var="image">
						<div class="item">
						  	<img src="/spring/resources/${board.category }/${board.no }/${image}" />
						</div>
					</c:forEach>
					</div>
					<div id="thumb" class="owl-carousel product-thumb">
						<c:forEach items="${imageList}" var="image">
						<div class="item">
						  	<img src="/spring/resources/${board.category }/${board.no }/${image}" />
						</div>
					</c:forEach>
					</div>
	        	</div> 
	   
	        
	        	
	        	
	        	<div class="col-md-6">
	        		<div class="product-dtl">
        				<div class="product-info">
		        			<div class="product-name"><b>${board.title}</b></div>
		        			
		        			<div class="product-price-discount"><span>가격 : ${board.price}</span>
		        		</div>
	        			<i class="fas fa-user-alt">${board.writer}</i>      				
	        			<div class="product-count">
	        			
	        			
							<!-- <a href="#" class="round-black-btn">구매하기</a>
							<a href="#" class="round-black-btn">경매하기</a><br>
							<a href="#" class="round-black-btn">채팅하기</a>
							<a href="#" class="round-black-btn">장바구니</a> -->
							
							<c:if test="${ sessionScope.loginUser != null }">
							<c:choose>
								<c:when test="${ loginUser.id  } ==${board.writer}">
									<a href="#" class="round-black-btn">삭제하기</a>
								</c:when>
								<c:when test="${ loginUser.id  } !=${board.writer}">
									<a href="#" class="round-black-btn">구매하기</a>
								</c:when>
	        				</c:choose>
	        				</c:if>
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
				  		<form class="review-form" id="insertComment">
		        			<div class="form-group" id = "commentList" >
			        			<c:if test="${ sessionScope.loginUser != null }">
			        			<label><b>댓글 쓰기</label>
			        			
				        			
			        			<textarea class="form-control" id="insertComment_content"  name="content" id="review-detail" rows="3" placeholder="댓글입력하세요" ></textarea>
			        			 <input type="hidden" id="insertComment_ref_bno"  name="ref_no" value="${board.no}">
								<input type="hidden" id="insertComment_category"  name="category" value="${board.category}">
								<input type="hidden" id="insertComment_writer"  name="writer" value="${board.writer}">
								
					        <button type="button" id="insertCommentBtn" onclick="insertComment('insertComment')" class="round-enroll-btn" value="0,0" >등록하기</button>
					        </c:if>
					        <br>&nbsp;

							<h6 class="review-list"><label><b>댓글 목록1</label></h6>
				
				</div>

			      </form>
			        	</div>
				  	</div>
				</div>
			</div>
	 	
	 
	</div>
   
   
    <!-- footerInclude-->
      <!-- swiper js -->
        <script src="/spring/resources/assets/js/swiper.min.js"></script>
            <!-- swiper js -->
        <script src="/spring/resources/assets/js/mixitup.min.js"></script>
        <script src="/spring/resources/assets/js/jquery.counterup.min.js"></script>
        <script src="/spring/resources/assets/js/waypoints.min.js"></script>
	
	
		<script src="/spring/resources/assets/js/productdetail.js"></script>
		<script src="/spring/resources/assets/js/heartbutton.js"></script>
		<script src="/spring/resources/assets/js/reviewCreate.js"></script>
		
		<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="	sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 		
    <%@ include file="../common/footer.jsp"%>       
    </body>
    
    </html>