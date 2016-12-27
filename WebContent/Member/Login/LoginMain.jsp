<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	




<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>

		<script>
		$(document).ready(function(){
			 	var referrer =  document.referrer;
			 	//alert(referrer);
			 	if(referrer == '/Login.mem' || referrer == 'null' || referrer == ''){
	           		$('#referrer').val(document.referrer);
			 	}else{
			 		$('#referrer').val('/index.jsp');
			 	}
		 });
				/* var referrer =  document.referrer;//이전페이지 url 받기 */
				/* window.location='logout.jsp?'+referrer; */

			 
		</script>
	<link rel="./style.css"/>
</head>
<body>
	<div class="wrapper">
	<%@include file="/nav.jsp" %>

	
	<div class="container content" style="margin-top:150px;">		
    	<div class="row">
            <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
				<c:if test="${empty sessionScope.sessionHaknum}">
	                <form  action="/Login.mem" method="post" class="reg-page">
						<input type="hidden" name="referrer" id="referrer" value="">	                
	                    <div class="reg-header">            
	                        <h2><font><font>로그인</font></font></h2>
	                    </div>
	
	                    <div class="input-group margin-bottom-20">
	                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
	                        <input type="text" name="haknum" placeholder="학번" class="form-control">
	                    </div>                    
	                    <div class="input-group margin-bottom-20">
	                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
	                        <input type="password"  name="password" placeholder="비밀번호" class="form-control">
	                    </div>                    
	
	                    <div class="row">
	<!--                         <div class="col-md-6">
	                            <label class="checkbox"><input type="checkbox"><font><font> 로그인 상태 유지</font></font></label>                        
	                        </div> -->
	                        <div class="col-md-12" style="text-align: -webkit-center;">
	                            <button class="btn-u pull-center" type="submit"><font><font>로그인</font></font></button>                        
	                        </div>
	                    </div>
	
	                   <!--  <hr>
	
	                    <h4><font><font>비밀번호를 잊어 버리셨습니까?</font></font></h4>
	                    <p><font><font>걱정, </font></font><a class="color-green" href="#"><font><font>여기를 클릭하지</font></font></a><font><font> 비밀번호를 재설정 할 수 있습니다.</font></font></p> -->
	                </form> 
				</c:if>  
				<c:if test="${!empty sessionScope.sessionHaknum}">	
						<!-- <a href="/Member/Login/Logout.jsp">로그아웃</a> -->				
						<div class="reg-header">            
	                        <h2><font><font>로그아웃</font></font></h2>
	                    </div>
						<c:set var="hakname" value="${sessionScope.sessionHaknum }" />
	                    <div class="input-group margin-bottom-20">
	                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
	                        <input type="text" name="haknum" value="${hakname}" class="form-control" readonly="readonly">
	                        
	                    </div>                    
    
	                    <div class="row">
	<!--                         <div class="col-md-6">
	                            <label class="checkbox"><input type="checkbox"><font><font> 로그인 상태 유지</font></font></label>                        
	                        </div> -->
	                        <div class="col-md-12" style="text-align: -webkit-center;">
	                            <input class="btn-u pull-center" type="button" onclick="location.href='/Member/Login/Logout.jsp'" value="로그아웃">                        
	                        </div>
	                    </div>				
				
				</c:if>			                        
            </div>
        </div><!--/row-->
    </div>

	</div>







<%-- 
	<% if(session.getAttribute("sessionHaknum")==null){%>
		<center>
		<br /><br /><br />
		<div class="login">
		<h1>Welcome!!</h1>
		<br /><br /><br />
		<!-- .mem 컨트롤러로 보내자 -->
		<form action="/Login.mem" method="post">
		session = <%=session.getAttribute("sessionHaknum") %><br /><br />
			학번 = <input type="text" name="haknum" placeholder="Username" required="required"/><br /><br />
			PW = <input type="password" name="password" placeholder="Password" required="required"/><br /><br />
			<% //session.setAttribute("sessionId", true);%> 
			<input type="hidden" name="referrer" id="referrer" value="">
			<input type="submit" value="Login" class="btn btn-primary btn-block btn-large"/>
			<input type="button" value="SignUp" onClick="window.location='signup.jsp'"/>
		</form>
		</center>
	<% } else {%>
		<center>
		<h2>Welcome back, <%= session.getAttribute("sessionHaknum") %><br><%= session.getAttribute("sessionName") %></h2>
		
		<input type="button" value="Logout" onClick="login()"/>
		</center>
	<%} %>
 --%>
</body>
</html>