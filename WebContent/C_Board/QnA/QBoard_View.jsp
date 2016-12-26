<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="db.board.qna.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//	BoardBean board = (BoardBean)request.getAttribute("boarddata");
//	String nowpage = (String)request.getAttribute("page");
%>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../assets/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
       
    
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="../assets/bootstrap-3.3.2/js/bootstrap.min.js"></script>


	<title>MVC 게시판</title>
</head>

<body>
	<%@include file="/nav.jsp" %>

<!-- 게시판 수정 -->
<div class="container" style="margin-top:100px">
	<table cellpadding="0" cellspacing="0" align=center border=1 class="table table-bordered">
		<tr align="center" valign="middle">
			<td colspan="5">QnA 게시판</td>
		</tr>
		
		<tr>
			<td style="font-family:돋음; font-size:12; width:15%" >
				<div align="center">제 목&nbsp;&nbsp;</div>
			</td>
			
			<td style="font-family:돋음; font-size:12">
			<%--board.getBOARD_SUBJECT()--%>
			${boarddata.q_subject}		
			</td>
		</tr>
		
		<!-- <tr bgcolor="cccccc">
			<td colspan="2" style="height:1px;">
			</td>
		</tr> -->
		
		<tr>
			<td style="font-family:돋음; font-size:12">
				<div align="center">내 용</div>
			</td>
			<td style="font-family:돋음; font-size:12">
				
						<%-- <pre><%=board.getBOARD_CONTENT() %></pre> --%>
						<pre>${boarddata.q_content}</pre>

			</td>
		</tr>
		<tr>
			<td style="font-family:돋음; font-size:12">
				<div align="center">첨부파일</div>
			</td>
			<td style="font-family:돋음; font-size:12">
			
			<%--if(!(board.getBOARD_FILE()==null)){ --%>		
			<%-- <a href="/Model2_Board11/board/file_down.jsp?file_name=<%=board.getBOARD_FILE()%>">
				<%=board.getBOARD_FILE()%></a> --%>	
			<%--} --%>
			
			
			<!-- 첨부 파일이 있으면 출력하는 부분 -->		
			<c:if test="${!empty boarddata.q_file}">
				<a href="../C_Board/QnA/file_down.jsp?file_name=${boarddata.q_file}">
					${boarddata.q_file}</a>
			</c:if>		
			
			</td>
		</tr>
		
		<tr bgcolor="cccccc">
			<td colspan="2" style="height:1px;"></td>
		</tr>
		<tr><td colspan="2">&nbsp;</td></tr>
	
		<tr align="center" valign="middle">
			<td colspan="5">
				<font size=2>
	
				<c:if test="${boarddata.q_re_lev < 1}">
		  			<a href="./QnA_ReplyView.qa?num=${boarddata.q_board_num}&page=${page}" role="button" class="btn btn-default" >
					답변</a>&nbsp;&nbsp;
				</c:if>
				<c:if test="${boarddata.q_re_lev >= 1}">
		  			<a href="./QnA_ReplyView.qa?num=${boarddata.q_board_num}&page=${page}" role="button" class="btn btn-default" disabled="disabled">
					답변</a>&nbsp;&nbsp;
				</c:if>
				
				<a href="./QnA_Modify.qa?num=${boarddata.q_board_num}&page=${page}" role="button" class="btn btn-default">
				수정</a>&nbsp;&nbsp; 
				
				<a href="./QnA_Delete.qa?num=${boarddata.q_board_num}&page=${page}" role="button" class="btn btn-default">
				삭제</a>&nbsp;&nbsp;
				
				<a href="./QnA_List.qa?page=${page}" role="button" class="btn btn-default">목록</a>&nbsp;&nbsp;			
				</font>
			</td>
		</tr>
	</table>
</div>
<!-- 게시판 수정 -->
</body>
</html>