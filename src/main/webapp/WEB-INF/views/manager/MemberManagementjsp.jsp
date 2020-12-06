<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html class="no-js" lang="zxx">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Admin</title>
<link rel="stylesheet"
	href="/spring/resources/assets/css/styles.css" />
<link rel="shortcut icon" type="image/x-icon"
	href="/spring/resources/assets/img/favicon.ico">
<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>
<!-- CSS here -->

<link rel="stylesheet"
	href="/spring/resources/assets/css/main.css?after">

<link
	href="https://font+s.googleapis.com/css2?family=Black+Han+Sans&family=Do+Hyeon&family=Jua&family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css"
	rel="stylesheet" crossorigin="anonymous" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js"
	crossorigin="anonymous"></script>
<script type="text/javascript">
		$(function(){
			var chkObj = document.getElementsByName("RowCheck");
			var rowCnt = chkObj.length;
			
			$("input[name='allCheck']").click(function(){
				var chk_listArr = $("input[name='RowCheck']");
				for (var i=0; i<chk_listArr.length; i++){
					chk_listArr[i].checked = this.checked;
				}
			});
			$("input[name='RowCheck']").click(function(){
				if($("input[name='RowCheck']:checked").length == rowCnt){
					$("input[name='allCheck']")[0].checked = true;
				}
				else{
					$("input[name='allCheck']")[0].checked = false;
				}
			});
		});
		function deleteValue(){
			var url = "MemberDelete.do";    // Controller로 보내고자 하는 URL
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
				var chk = confirm("정말 삭제하시겠습니까?");				 
				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("삭제 성공");
	                        location.href="tables.do"; //list 로 페이지 새로고침
	                    }
	                    else{
	                        alert("삭제 실패");
	                    }
	                }
				});
			}
		}
		function memberrestore(){
			var url = "memberrestore.do";    // Controller로 보내고자 하는 URL
			var valueArr = new Array();
		    var list = $("input[name='RowCheck']");
		    for(var i = 0; i < list.length; i++){
		        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
		            valueArr.push(list[i].value);
		        }
		    }
		    if (valueArr.length == 0){
		    	alert("선택된 글이 없습니다.");
		    }
		    else{
				var chk = confirm("회원을 복구처리하시겠습니까?");				 
				$.ajax({
				    url : url,                    // 전송 URL
				    type : 'POST',                // POST 방식
				    traditional : true,
				    data : {
				    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
				    },
	                success: function(jdata){
	                    if(jdata = 1) {
	                        alert("복구 성공");
	                        location.href="tables.do"; //list 로 페이지 새로고침
	                    }
	                    else{
	                        alert("복구 실패");
	                    }
	                }
				});
			}
		}
	</script>

</head>


<body>
	<!-- Preloader Start -->
	<%@ include file="../common/header.jsp"%>
	<%@ include file="../common/adminSide.jsp"%>



	<div id="layoutSidenav_content">
		<main>
	
			<div class="container-fluid">
				<h1 class="mt-4">관리자 페이지</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item"><a href="home.do">홈</a></li>
					<li class="breadcrumb-item active">회원관리</li>
				</ol>

				<div class="card mb-4">
					<div class="card-header">
						<i class="fas fa-table mr-1"></i> 회원 관리 테이블

					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<thead>
									<tr>
										<th><input id="allCheck" type="checkbox" name="allCheck"/></th>
										<th>아이디</th>
										<th>이름</th>
										<th>이메일</th>
										<th>핸드폰</th>
										<th>집주소</th>
										<th>가입날짜</th>
										<th>가입여부</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach var="list" items="${Membersecessionlist}">
										<tr>
											<td align="center"><input name="RowCheck" type="checkbox" value="${list.id}"/></td>
											<td align="center">${list.id}</td>
											<td align="center">${list.username}</td>
											<td align="center">${list.email}</td>
											<td align="center">${list.phone}</td>
											<td align="center">${list.address}</td>
											<td align="center">${list.enrollDate}</td>
											<td align="center">${list.mStatus}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						<ul class="pagination1 justify-content-center1">
						
						
						<li class="page-item1"><a  class="page-link"  onclick="deleteValue();">추방</a></li>
						<li class="page-item1"><a  class="page-link"  onclick="memberrestore();">회원복구</a></li>
					
						</ul>
							<div class="text-center">
								<ul class="pagination justify-content-center ">
									<!-- [이전] -->
									<c:if test="${ pi.currentPage eq 1 }">
										<li class="page-item "><a class="page-link" href="#">Previous</a></li>
									</c:if>
									<c:if test="${ pi.currentPage ne 1 }">
										<c:url var="before" value="MemberManagementjsp.do">
											<c:param name="curpage" value="${ pi.currentPage - 1 }" />
										</c:url>
										<li class="page-item "><a class="page-link"
											href="${ before }">Previous</a></li>
									</c:if>

									<!-- 페이지 -->
									<c:forEach var="p" begin="${ pi.startPage }"
										end="${ pi.endPage }">
										<c:if test="${ p eq pi.currentPage }">
											<li class="page-item"><a style="color: chartreuse;"
												class="page-link" href="#">${ p }</a></li>
										</c:if>

										<c:if test="${ p ne pi.currentPage }">
											<c:url var="pagination" value="MemberManagementjsp.do">
												<c:param name="currentPage" value="${ p }" />
											</c:url>
											<li class="page-item"><a class="page-link"
												href="${ pagination }">${ p }</a></li>
										</c:if>
									</c:forEach>

									<!-- [다음] -->
									<c:if test="${ pi.currentPage eq pi.maxPage }">
										<a class="page-link" href="#">Next</a>
									</c:if>
									<c:if test="${ pi.currentPage ne pi.maxPage }">
										<c:url var="after" value="MemberManagementjsp.do">
											<c:param name="currentPage" value="${ pi.currentPage + 1 }" />
										</c:url>
										<li class="page-item"><a class="page-link"
											href="${ after }">Next</a></li>
									</c:if>
								</ul>
							</div>
					
						
						</div>
					</div>

				</div>
			</div>
		</main>


		<%@ include file="../common/footer.jsp"%>
</body>
</html>