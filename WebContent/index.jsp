<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/assets/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
 
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">       
    
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/assets/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<!-- 	<script src="Effect.js"></script> -->
	
	

	
	
	
	
	
	
	
	
	
	

	<title>Comodo</title>
	
	
<!-- 	<script>
	 	$(document).ready(function(){
	 	 	$("#home").attr("class"," "); 
	 	 	$("#noti").attr("class","active"); 
	 	 	$("#sleep").attr("class"," "); 
	 	 	$("#free").attr("class"," "); 
	 	 	$("#qna").attr("class"," "); 
	 	 	$("#fac").attr("class"," ");  
		});
	</script> -->
</head>
<body>



<div class="wrapper">
<%@include file="/nav.jsp" %>
</div>

	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	  <!-- Indicators -->
	  <ol class="carousel-indicators">
	    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	  </ol>
	
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
	    <div class="item active">
	      <img src="https://twochairs.joins.com/_UI/_img/1305/11-01.jpg" alt="..."  style="width:100%; height: 500px;">
	      <div class="carousel-caption">
	        ...
	      </div>
	    </div>
	    <div class="item">
	      <img src="http://img.yonhapnews.co.kr/etc/inner/KR/2016/03/09/AKR20160309044800061_01_i.jpg" alt="..."  style="width:100%; height: 500px;">
	      <div class="carousel-caption">
	        ...
	      </div>
	    </div>
	    <div class="item">
	      <img src="http://www.sisapress.com/upload/journal/article/201608/thumb/156213-21866-sample.jpg" alt="..."  style="width:100%; height: 500px;">
	      <div class="carousel-caption">
	        ...
	      </div>
	    </div>    
	
	  </div>
	
	  <!-- Controls -->
	  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
	    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
	    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	  
	</div>
	 <div class="purchase">
	        <div class="container">
	            <div class="row">
	                <div class="col-md-9 animated fadeInLeft">
	                    <span><font><font>COMODO는 **기숙사 홈페이지 입니다.</font></font></span>
	                    <p><font><font>외출 외박 관련 문의 </font><font>자유 게시판과 시설관리 , QnA 게시판등을 이용할 수 있습니다.</font></font></p>
	                </div>            
	                <div class="col-md-3 btn-buy animated fadeInRight">
	                    <a href="/joinForm.mem" class="btn-u btn-u-lg"><i class="glyphicon glyphicon-chevron-down"></i><font><font>회원가입</font></font></a>
	                </div>
	            </div>
	        </div>
	    </div>   
  
<div class="container content">
        <!--Title Box-->        
        <div class="title-box">
            <div class="title-box-text">We <span class="color-green">Do</span> Awesome Design</div>
            <p>Creative freedom matters user experience, we minimize the gap between technology and its audience.</p>
        </div>
        <!-- End Promo Box&nbsp;-->    

        <!-- Promo Box -->    
        <div class="row">
            <div class="col-md-4">
                <div class="promo-box">
                    <i class="fa fa-bullhorn color-blue"></i>
                    <strong>Creative Freedom Experience</strong>
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium qui officia deserunt mollitia anim</p>                
                </div>        
            </div>

            <div class="col-md-4">
                <div class="promo-box">
                    <i class="fa fa-bolt color-orange"></i>
                    <strong>Dedicated Advanced Team</strong>
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium qui officia deserunt mollitia anim</p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="promo-box">        
                    <i class="fa fa-rocket color-sea"></i>
                    <strong>We Do Things With Love</strong>
                    <p>At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium qui officia deserunt mollitia anim</p>
                </div>
            </div>
        </div>
        <!-- End Promo Box -->

        <!-- Tag Box -->
        <div class="row tag-box tag-box-v5">
            <div class="col-md-12">
                <span>Accusamus et odio ducimus quiatfus</span>
            </div>
        </div>
        <!-- End Tag Box -->

    </div>    

</body>
</html>