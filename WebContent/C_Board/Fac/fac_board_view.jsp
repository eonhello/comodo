<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.board.fac.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//	BoardBean board = (BoardBean)request.getAttribute("boarddata");
//	String nowpage = (String)request.getAttribute("page");
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>시설 안내</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="./ckeditor/ckeditor.js"></script>
	
	<script language = "javascript">
	function viewLarge(a, b){
		document.getElementById(b).getElementsByTagName("img")[0].src = a.href;
		if(document.getElementById(b).style.display == ''){
			document.getElementById(b).style.display = 'none'; 
		}else{
		document.getElementById(b).style.display = '';
		}
	} //이미지 커지게 하는 함수
	function hide(c){
		document.getElementById(c).style.display = 'none'; 
	} //이미지 닫히게 하는 함수
	</script>
</head>

<body>
<%@include file="/nav.jsp" %>
<!-- 게시판 수정 -->
<div class="container">
<br><br>
<table class="table table-bordered table-condensed" cellpadding="0" cellspacing="0" align=center border=1>
	<tr align="center" valign="middle">
		<td colspan="5">시설 안내</td>
	</tr>
	
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목&nbsp;&nbsp;</div>
		</td>
		
		<td style="font-family:돋음; font-size:12">
		<%--board.getBOARD_SUBJECT()--%>
		${boarddata.fac_board_subject}		
		</td>
	</tr>
	
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
				<div align="center">이미지</div>
		</td>
		<td style="font-family:돋음; font-size:12">
		
		<%--if(!(board.getBOARD_FILE()==null)){ --%>		
		<%-- <a href="/Model2_Board11/board/file_down.jsp?file_name=<%=board.getBOARD_FILE()%>">
			<%=board.getBOARD_FILE()%></a> --%>	
		<%--} --%>
		
		
		<!-- 첨부 파일이 있으면 출력하는 부분 -->
				
		<!-- 작은 이미지 누르면 커짐 -->
		<div align="center" style="height:auto;">
		<c:if test="${boarddata.fac_board_re_level eq 0}">
			<a href="/C_Board/Fac/file_down.jsp?file_name=${boarddata.fac_board_filename}" onclick="viewLarge(this, 'bigimg'); return false;">
				<img src="boardUpload/${boarddata.fac_board_filename}" width = 400 height = 400 />
				<br>[크게 보기]<br>
				<c:if test="${!empty boarddata.fac_board_filename}">
				<a href="/C_Board/Fac/file_down.jsp?file_name=${boarddata.fac_board_filename}">
				[다운로드]</a>
			</c:if>		
			</a>
		</div>
		<!-- 지정한 위치에서 큰 이미지 나타남 -->
			<div id="bigimg" style="display:none; position:absolute; left:100px; top:50px; overflow:hidden; border:0px solid #ff6600;" align="center">
		<!-- 큰 이미지 누르면 다시 닫힘 -->
			<img src="" width="500" style="border:1px solid black;" onclick="hide('bigimg')"/>
		</c:if>
			</div>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td style="font-family:돋음; font-size:12">
			<div><pre>${boarddata.fac_board_content}</pre></div>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;"></td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	
	<tr align="center" valign="middle">
		<td colspan="5">
			<font size=2>
			<c:if test="${1==sessionScope.sessionPermission}">
				<a href="./BoardReplyView.bo?num=${boarddata.fac_board_num}&page=${page}">
			[답변]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${1==sessionScope.sessionPermission}">
				<a href="./BoardModify.bo?num=${boarddata.fac_board_num}&page=${page}">
			[수정]</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${1==sessionScope.sessionPermission}">
				<a href="./BoardDelete.bo?num=${boarddata.fac_board_num}&page=${page}">
			[삭제]</a>&nbsp;&nbsp;
			</c:if>
			<a href="./BoardList.bo?page=${page}">[목록]</a>&nbsp;&nbsp;			
			</font>
		</td>
	</tr>
</table>
</div>
<!-- 게시판 수정 -->
</body>
</html>