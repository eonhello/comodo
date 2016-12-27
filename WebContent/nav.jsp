<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>		


     <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Favicon -->
    <link rel="shortcut icon" href="favicon.ico">

    <!-- CSS Global Compulsory -->
    <link rel="stylesheet" href="/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/assets/css/style.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="/assets/plugins/line-icons/line-icons.css">
    <link rel="stylesheet" href="/assets/plugins/font-awesome/css/font-awesome.min.css">

    <!-- CSS Page Style -->    
    <link rel="stylesheet" href="/assets/css/pages/page_log_reg_v1.css">    

    <!-- CSS Theme -->    
    <link rel="stylesheet" href="/assets/css/themes/default.css" id="style_color">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="/assets/css/custom.css">

	
	<%--  <c:out value="${menu}"/>   --%>
	  
<div class="header">
        <!-- Topbar -->
        <div class="topbar">
            <div class="container">
                <!-- Topbar Navigation -->
                <ul class="loginbar pull-right">
                
					<c:if test="${empty sessionScope.sessionHaknum}">
						<li class="topbar-devider"></li>   
	                    <li><a href="/joinForm.mem">회원가입</a></li> 
	                    <li class="topbar-devider"></li>   
	                    <li><a href="/Member/Login/LoginMain.jsp">로그인</a></li>  					
					</c:if>         
					 
					<c:if test="${!empty sessionScope.sessionHaknum}">
	                    <li class="topbar-devider"></li>   
	                    <li><a href="/memModify.mem">회원정보</a></li>  
	                    <li class="topbar-devider"></li>   
	                    <li><a href="/Member/Login/Logout.jsp">로그아웃</a></li>  					
					</c:if>
                    
                    
                    
                </ul>
                <!-- End Topbar Navigation -->
            </div>
        </div>
        <!-- End Topbar -->
    
        <!-- Navbar -->
        <div class="navbar navbar-default" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="fa fa-bars"></span>
                    </button>
                    <a class="navbar-brand" href="/index.jsp">
                         <img id="logo-header" src="/assets/img/comodo.png" alt="Logo" style="width:23%; height:auto;">
                       
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-responsive-collapse">
                    <ul class="nav navbar-nav">
                    
                    <c:set var="menuUrl" value="${pageContext.request.requestURL}"/>     
 					<c:choose>
						<c:when test="${fn:contains(menuUrl,'Noti')}">
	                        
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/sleep/Sleep_List_Action.sl" >
	                                	외출/외박
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/free/FList.fr" >
	                                	자유게시판
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/qna/QnA_List.qa" >
	                                	QnA
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/BoardList.bo" >
	                                	시설관리
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
						</c:when> 
						<c:when test="${fn:contains(menuUrl,'Sleep')}">
	                        <!-- 공지사항 -->
	                       
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li class="active">
	                            <a href="/sleep/Sleep_List_Action.sl" >
	                                	외출/외박
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/free/FList.fr" >
	                                	자유게시판
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/qna/QnA_List.qa" >
	                                	QnA
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/BoardList.bo" >
	                                	시설관리
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
						</c:when>
						<c:when test="${fn:contains(menuUrl,'Free')}">
	                        <!-- 공지사항 -->
	                      
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/sleep/Sleep_List_Action.sl" >
	                                	외출/외박
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li class="active">
	                            <a href="/free/FList.fr" >
	                                	자유게시판
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/qna/QnA_List.qa" >
	                                	QnA
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/BoardList.bo" >
	                                	시설관리
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->	
						</c:when>
						<c:when test="${fn:contains(menuUrl,'QnA')}">
	                        <!-- 공지사항 -->
	                        
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/sleep/Sleep_List_Action.sl" >
	                                	외출/외박
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/free/FList.fr" >
	                                	자유게시판
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li class="active">
	                            <a href="/qna/QnA_List.qa" >
	                                	QnA
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/BoardList.bo" >
	                                	시설관리
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
						</c:when>
						<c:when test="${fn:contains(menuUrl,'Fac')}">
	                        <!-- 공지사항 -->
	                     
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/sleep/Sleep_List_Action.sl" >
	                                	외출/외박
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/free/FList.fr" >
	                                	자유게시판
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/qna/QnA_List.qa" >
	                                	QnA
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li class="active">
	                            <a href="/BoardList.bo" >
	                                	시설관리
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
						</c:when>												
		
						<c:otherwise>
	                        <!-- 공지사항 -->
	                        
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/sleep/Sleep_List_Action.sl" >
	                                	외출/외박
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/free/FList.fr" >
	                                	자유게시판
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/qna/QnA_List.qa" >
	                                	QnA
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
	                        <!-- 공지사항 -->
	                        <li>
	                            <a href="/BoardList.bo" >
	                                	시설관리
	                            </a>
	                        </li>
	                        <!-- End 공지사항 -->
						</c:otherwise>						  
					</c:choose>                  


                    </ul>
                </div><!--/navbar-collapse-->
            </div>    
        </div>            
        <!-- End Navbar -->
    </div>
    
    
    
 <!-- JS Global Compulsory -->			
<script type="text/javascript" src="/assets/plugins/jquery-1.10.2.min.js"></script>
<script type="text/javascript" src="/assets/plugins/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script type="text/javascript" src="/assets/plugins/back-to-top.js"></script>
<script type="text/javascript" src="/assets/plugins/flexslider/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="/assets/plugins/parallax-slider/js/modernizr.js"></script>
<script type="text/javascript" src="/assets/plugins/parallax-slider/js/jquery.cslider.js"></script>
<!-- JS Page Level -->           
<script type="text/javascript" src="/assets/js/app.js"></script>
<script type="text/javascript" src="/assets/js/pages/index.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
      	App.init();
        App.initSliders();
        Index.initParallaxSlider();        
    });
</script>
<!--[if lt IE 9]>
    <script src="assets/plugins/respond.js"></script>
<![endif]-->   
    