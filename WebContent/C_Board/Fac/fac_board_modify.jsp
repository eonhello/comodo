<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="db.board.fac.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//	BoardBean board = (BoardBean)request.getAttribute("boarddata");
//  String nowpage = (String)request.getAttribute("page");
%>

<html>
<head>
	<title>시설 안내</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script>
		$(document).ready(function(){
			$("form").submit(function(){				
				if($("#fac_board_subject").val()==""){
					alert("제목을 입력하세요");
					$("#fac_board_subject").focus();
					return false;
				}
				if($("#fac_board_content").val()==""){
					alert("내용을 입력하세요");
					$("#fac_board_content").focus();
					return false;
				}
			/* 	if($("#board_pass").val()==""){
					alert("비밀번호를 입력하세요");
					$("#board_pass").focus();
					return false;
				} */
			});			
		});	
	</script>
</head>

<body>
<!-- 게시판 수정 -->
<form action="/GitTest_Fac/BoardModifyAction.bo" method="post" name="modifyform">
<input type="hidden" name="FAC_BOARD_NUM" value="${boarddata.fac_board_num}">
<input type="hidden" name=page value="${page}">
<table cellpadding="0" cellspacing="0" align=center border=1>
	<tr align="center" valign="middle">
		<td colspan="5">시설 안내</td>
	</tr>
	<tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="FAC_BOARD_SUBJECT" id="fac_board_subject" size="50" maxlength="100" 
				value="${boarddata.fac_board_subject}">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="FAC_BOARD_CONTENT" id="fac_board_content" cols="67" rows="15">${boarddata.fac_board_content}</textarea>
		</td>
	</tr>
	<%-- <%if(!(board.getBOARD_FILE()==null)){ %>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">파일 첨부</div>
		</td>
		<td>
			&nbsp;&nbsp;<%=board.getBOARD_FILE() %>
		</td>
	</tr>
	<%} %> --%>
	
	<c:if test="${!empty boarddata.fac_board_filename}">
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">파일 첨부</div>
		</td>
		<td>
			&nbsp;&nbsp;${boarddata.fac_board_filename}
		</td>
	</tr>
	</c:if>
	
	
<!--  <tr>
		<td height="16" style="font-family:돋음; font-size:12">
			<div align="center">비밀번호</div>
		</td>
		<td>
			<input name="BOARD_PASS" id="board_pass" type="password">
		</td>
	</tr> -->
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<input type=submit value="수정">
			<input type=button value="취소" onClick="history.go(-1)">
			</font>
		</td>
	</tr>
</table>
</form>
<!-- 게시판 수정 -->
</body>
</html>