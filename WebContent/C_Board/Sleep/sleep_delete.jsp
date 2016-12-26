<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%
//	int num=Integer.parseInt(request.getParameter("num"));
//	String nowpage = request.getParameter("page");
%>
<html>
<head>
<title>MVC 게시판</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
<!-- 	<script>
		$(document).ready(function(){
			$("form").submit(function(){				
				if($("#board_pass").val()==""){
					alert("비밀번호를 입력 하세요?");
					$("#board_pass").focus();
					return false;
				}						
			});			
		});	
	</script>
-->
</head>
<body>
<form name="deleteForm" action="./Sleep_Delete_Action.sl?num=${param.num}" method="post">
<input type=hidden name=page value="${param.page}">

</form>
</body>
</html>