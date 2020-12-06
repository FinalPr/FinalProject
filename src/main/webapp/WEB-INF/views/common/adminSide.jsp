<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<body class="sb-nav-fixed">
          <c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
            <!-- Navbar-->
          
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">관리자</div>
                            <a class="nav-link" href="tables.do">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                관리페이지
                            </a>
                            <div class="sb-sidenav-menu-heading">회원조정</div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                고객관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                 <c:url var="mlist" value="MemberLookup.do"/>
                                    <a class="nav-link" href="${ mlist }">회원조회</a>
								<c:url var="mdlist" value="MemberManagementjsp.do"/>
                                    <a class="nav-link" href="${ mdlist }">회원관리</a>
                                </nav>
                            </div>
                         
                           
                            <div class="sb-sidenav-menu-heading">서비스</div>
                         
         
              <c:url var="alist" value="Declarationl.do"/>
                            <a class="nav-link" href="${ alist }">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                 신고
                            </a>
             <c:url var="adminqna" value="AdminQnd.do"/>
                            <a class="nav-link" href="${ adminqna}">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                    고객센터
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small"></div>
                      Bootstrap
                    </div>
                </nav>
            </div>


</body>
</html>