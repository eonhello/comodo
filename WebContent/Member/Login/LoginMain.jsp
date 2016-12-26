<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>

		<script>
		$(document).ready(function(){
			 	var referrer =  document.referrer;
			 	//alert(referrer);
	           $('#referrer').val(document.referrer);
	       
		 });
				/* var referrer =  document.referrer;//이전페이지 url 받기 */
				/* window.location='logout.jsp?'+referrer; */

			 
		</script>
</head>
<body>
	<% if(session.getAttribute("sessionHaknum")==null){%>
		<center>
		<br /><br /><br />
		<div class="login">
		<h1>Welcome!!</h1>
		<br /><br /><br />
		<!-- .mem 컨트롤러로 보내자 -->
		<form action="/Login.mem" method="post">
		session = <%=session.getAttribute("sessionHaknum") %><br /><br />
			학번 = <input type="text" name="haknum" placeholder="Username"/><br /><br />
			PW = <input type="password" name="password" placeholder="Password"/><br /><br />
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
		</div>
</body>
</html>