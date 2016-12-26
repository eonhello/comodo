<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그아웃 페이지</title>
</head>
<body>
	<% 
	
		session.invalidate();
		
	%>
	<script language="javascript">
	
	
	var referrer =  document.referrer; //이전페이지 url 받기
	location.href= referrer;
	

/* 	history.go(-1); */
	
	</script>		
</body>
</html>