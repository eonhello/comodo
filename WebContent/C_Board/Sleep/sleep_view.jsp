<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="db.board.sleep.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//	BoardBean board = (BoardBean)request.getAttribute("boarddata");
//	String nowpage = (String)request.getAttribute("page");
%>

<html>
<head>
	<title>MVC 게시판</title>
</head>

<body>
<!-- 게시판 수정 -->
<table cellpadding="0" cellspacing="0" align=center border=1>
	<tr align="center" valign="middle">
		<td colspan="5">MVC 게시판</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%--board.getBOARD_SUBJECT()--%>
		${boarddata.s_subject}		
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td style="font-family:돋음; font-size:12">
			<table border=1 width=490 height=250 style="table-layout:fixed">
				<tr>
					<td valign=top style="font-family:돋음; font-size:12">
					<%-- <pre><%=board.getBOARD_CONTENT() %></pre> --%>
					<pre>${boarddata.s_content}</pre>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<a href="/GitTest/Sleep_Modify.sl?num=${boarddata.s_board_num}&page=${page}">
			[수정]</a>&nbsp;&nbsp;
			
			<a href="/GitTest/Sleep_Delete.sl?num=${boarddata.s_board_num}&page=${page}">
			[삭제]</a>&nbsp;&nbsp;
			
			<a href="/GitTest/Sleep_List_Action.sl?num=${boarddata.s_board_num}&page=${page}">
			[목록]</a>&nbsp;&nbsp;			
			</font>
		</td>
	</tr>
</table>
<!-- 게시판 수정 -->
</body>
</html>