<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <footer>

       <!-- Footer Start-->
       <div class="footer-area footer-padding">
           <div class="container">
               <div class="row d-flex justify-content-between">
                   <div class="col-xl-3 col-lg-3 col-md-5 col-sm-6">
                      <div class="single-footer-caption mb-50">
                        <div class="single-footer-caption mb-30">
                             <!-- logo -->
                            <div class="footer-logo">
                                <a href="home.do"><img src="/spring/resources/assets/img/oilogo_ft.png" alt=""></a>
                            </div>
                            <div class="footer-tittle">
                                <div class="footer-pera">
                                    <p></p>
                               </div>
                            </div>
                        </div>
                      </div>
                   </div>
                   <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>오ㅇ!마켓</h4>
                               <ul>
                                    <li><a href="Aboutus.do">회사소개</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-3 col-lg-3 col-md-4 col-sm-7">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>고객센터</h4>
                               <ul>
                                    <li><a href="qnaQury.do">1:1문의</a></li>
                                      <c:url var="qlist" value="QnaList.do"/>
                                    <li><a href="${qlist}">1:1 문의사항</a></li>
                                    <li><a href="qnaFAQ.do">FAQ</a></li>
                               </ul>
                           </div>
                       </div>
                   </div>
                   <div class="col-xl-3 col-lg-3 col-md-5 col-sm-7">
                       <div class="single-footer-caption mb-50">
                           <div class="footer-tittle">
                               <h4>취급방침</h4>
                               <ul>
                                <li><a href="TermsofUse.do">이용약관</a></li>
                                <li><a href="PrivacyStatement.do">개인정보취급방침</a></li>
                            </ul>
                           </div>
                       </div>
                   </div>
               </div>




        
  

  








               <!-- Footer bottom -->
               <div class="row">
                <div class="col-xl-7 col-lg-7 col-md-7">
                    <div class="footer-copy-right">
                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
  Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="ti-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>                   </div>
                </div>
                 <div class="col-xl-5 col-lg-5 col-md-5">
                    <div class="footer-copy-right f-right">
                        <!-- social -->
                        <div class="footer-social">
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-behance"></i></a>
                            <a href="#"><i class="fas fa-globe"></i></a>
                        </div>
                    </div>
                </div>
            </div>
           </div>
       </div>
       <!-- Footer End-->

   </footer>

 	<!-- Header End -->
    
     <script src="/spring/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>

    <!-- Jquery, Popper, Bootstrap -->
    <script src="/spring/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
    <script src="/spring/resources/assets/js/popper.min.js"></script>
    <script src="/spring/resources/assets/js/bootstrap.min.js"></script>
    <!-- Jquery Mobile Menu -->
    <script src="/spring/resources/assets/js/jquery.slicknav.min.js"></script>

    <!-- Jquery Slick , Owl-Carousel Plugins -->
    <script src="/spring/resources/assets/js/owl.carousel.min.js"></script>
    <script src="/spring/resources/assets/js/slick.min.js"></script>

    <!-- One Page, Animated-HeadLin -->
    <script src="/spring/resources/assets/js/wow.min.js"></script>
    <script src="/spring/resources/assets/js/jquery.magnific-popup.js"></script>

    <!-- Scrollup, nice-select, sticky -->
    <script src="/spring/resources/assets/js/jquery.scrollUp.min.js"></script>
    <script src="/spring/resources/assets/js/jquery.nice-select.min.js"></script>
    <script src="/spring/resources/assets/js/jquery.sticky.js"></script>

    <!-- contact js -->
    <script src="/spring/resources/assets/js/contact.js"></script>
    <script src="/spring/resources/assets/js/jquery.form.js"></script>
    <script src="/spring/resources/assets/js/jquery.validate.min.js"></script>
    <script src="/spring/resources/assets/js/mail-script.js"></script>
    <script src="/spring/resources/assets/js/jquery.ajaxchimp.min.js"></script>

    <!-- Jquery Plugins, main Jquery -->
    <script src="/spring/resources/assets/js/plugins.js"></script>
    <script src="/spring/resources/assets/js/main.js"></script>	


</body>
</html>