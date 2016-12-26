<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.member.BoardDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
	<c:choose>
		<c:when test="${result == '0' }">
	      
		<script>
		${sessionScope.sessionHaknum}
			alert("환영함! LoginPro의 result = "+ ${result});
<%-- 			<% session.setAttribute("sessionHaknum", request.getAttribute("sessionHaknum")); --%>
// 				session.setAttribute("sessionName", request.getAttribute("sessionName"));
// 				session.setAttribute("sessionPermission", request.getAttribute("sessionPermission"));
<%-- 			%> --%>
			location.href="/sleep/Sleep_List_Action.sl";
		</script>
		</c:when>
	
		<c:when test="${result == '2' }">
		
		<script>
			alert("비번이 다르다");
			history.go(-1);
		</script>
		</c:when>
		
		<c:when test="${result == '1' }">
		<script>
			alert("그런 ID가 없습니다.");
			history.go(-1);
		</script>
		</c:when>
		
		<c:otherwise>
		<script>
        alert("사람이 없습니다 ㅜㅜ");
        </script>
    </c:otherwise>

	</c:choose>
<html>
<head>
</head>
<body>
로그인 PRO!
${result }
</body>
</html>