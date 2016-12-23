<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<% if(session.getAttribute("sessionHaknum")==null){%>
		<center>
		<br /><br /><br />
		<h1>Welcome!!</h1>
		<br /><br /><br />
		<!-- .mem 컨트롤러로 보내자 -->
		<form action="/Login.mem" method="post">
		session = <%=session.getAttribute("sessionHaknum") %><br /><br />
			ID = <input type="text" name="haknum"/><br /><br />
			PW = <input type="password" name="password"/><br /><br />
			<% //session.setAttribute("sessionId", true);%> 
			<input type="submit" value="Login"/>
			<input type="button" value="SignUp" onClick="window.location='signup.jsp'"/>
		</form>
		</center>
	<% } else {%>
		<center>
		<h2>Welcome back, <%= session.getAttribute("sessionHaknum") %><br><%= session.getAttribute("sessionName") %></h2>
		<input type="button" value="Logout" onClick="window.location='logout.jsp'"/>
		</center>
		<%} %>
</body>
</html>