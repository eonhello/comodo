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
	      <img src="http://image.chosun.com/sitedata/image/201111/09/2011110900272_1.jpg" alt="..."  style="width:100%; height: 500px;">
	      <div class="carousel-caption">
	        ...
	      </div>
	    </div>
	    <div class="item">
	      <img src="http://i.huffpost.com/gadgets/slideshows/375064/slide_375064_4380686_free.jpg" alt="..."  style="width:100%; height: 500px;">
	      <div class="carousel-caption">
	        ...
	      </div>
	    </div>
	    <div class="item">
	      <img src="http://www.samasound.co.kr/data/file/recruit_en2/1846293908_kaqhy1uP_04EAB5ADEBA6BDED9884EB8C80EBAFB8EC88A0EAB480-2.jpg" alt="..."  style="width:100%; height: 500px;">
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
	                    <span><font><font>COMODO 생활관 홈페이지 입니다.</font></font></span>
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
            <div class="title-box-text">마음으로 하나가 되는 <span class="color-green">COMODO</span> 생활관</div>
            <p>Slow and steady win the game.</p>
        </div>
        <!-- End Promo Box&nbsp;-->    

        <!-- Promo Box -->    
        <div class="row">
            <div class="col-md-4">
                <div class="promo-box">
                    <i class="fa fa-bullhorn color-blue"></i>
                    <strong>2017학년도 <br>
                    	생활관 모집안내</strong>
                    <p>신청기간 : 2017.01.01 ~ 2017.01.02<br>
                    	신청자격 : 2017년도 COMODO 재학생 및 입학예정자<br>
                    	문의사항 : ☎ 02 - 730 - 5800
                    	</p>                
                </div>        
            </div>

            <div class="col-md-4">
                <div class="promo-box">
                    <i class="fa fa-bolt color-orange"></i>
                    <strong>경비실 택배 안내</strong>
                    <p>200812** 신재* 학생<br>
                    200817** 정호* 학생<br>
                    201014** 이태* 학생<br>
                    201016** 유래* 학생<br>
                    200378** 정* 학생<br></p>
                </div>
            </div>

            <div class="col-md-4">
                <div class="promo-box">        
                    <i class="fa fa-rocket color-sea"></i>
                    <strong>COMODO 연말파티 안내</strong>
                   <p>축제날짜 : 2017.12.31 PM 7:00시<br>
                    	축제장소 : 제 1기숙사 앞 주차장<br>
                    	초대가수 : 빅뱅(가수), 트와이스(가수), 박근혜(꼭두각시), 최순실(인형사) 등등
                    	</p>  
                </div>
            </div>
        </div>
        <!-- End Promo Box -->

        <!-- Tag Box -->
        <div class="row tag-box tag-box-v5">
            <div class="col-md-12">
                <span>구현예정</span>
            </div>
        </div>
        <!-- End Tag Box -->

    </div>    

</body>
</html>