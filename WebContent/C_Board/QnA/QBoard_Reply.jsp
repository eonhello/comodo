<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="db.board.qna.*" %>
<%
//	BoardBean board=(BoardBean)request.getAttribute("boarddata");
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
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script>
		$(document).ready(function(){
			$("form").submit(function(){
				if($("#board_name").val()==""){
					alert("이름을 입력 하세요?");
					$("#board_name").focus();
					return false;
				}				
				if($("#board_subject").val()==""){
					alert("제목을 입력 하세요?");
					$("#board_subject").focus();
					return false;
				}
				if($("#board_content").val()==""){
					alert("내용을 입력 하세요?");
					$("#board_content").focus();
					return false;
				}
				if($("#board_pass").val()==""){
					alert("비밀번호를 입력 하세요?");
					$("#board_pass").focus();
					return false;
				}
			});			
		});	
	</script>
</head>
<body>
	<%@include file="/nav.jsp" %>


<form action="/qna/QnA_ReplyAction.qa" enctype="multipart/form-data" method="post" name="boardform">
<input type="hidden" name="BOARD_NUM" value="${boarddata.q_board_num}">
<input type="hidden" name="BOARD_RE_REF" value="${boarddata.q_re_ref}">
<input type="hidden" name="BOARD_RE_LEV" value="${boarddata.q_re_lev}">
<input type="hidden" name="BOARD_RE_SEQ" value="${boarddata.q_re_seq}">
<input type="hidden" name="page" value="${page}">
<div class="container" style="margin-top:100px">
	<c:if test="${sessionScope.sessionHaknum != null }">
			<div class="page-header">
				<h1>
					QnA게시판 <small>답변달기</small>
				</h1>
			</div>	




	<table align="center"  border="1" cellpadding="0" cellspacing="0" class="table table-bordered">
		<tr align="center" valign="middle">
			<td colspan="5">QnA 게시판</td>
		</tr>
		<tr>
				<td style="font-family:돋음; font-size:12" height="16" class="active">
					<div align="center">작성자</div>
				</td>
				<td><input class="form-control" style="width: 50%;"  type=text name=board_name size=10 maxlength=8 value="<%=session.getAttribute("sessionName") %>" readonly></td>
		</tr>
		<tr>
				<td style="font-family:돋음; font-size:12" height="16" class="active">
					<div align="center">학번</div>
				</td>
				<td><input class="form-control" style="width: 50%;"  type=text name="BOARD_HAKNUM" size=10 maxlength=8 value="<%=session.getAttribute("sessionHaknum") %>" readonly></td>
		</tr>
		<tr>
			<td style="font-family:돋음; font-size:12" height="16"  class="active">
				<div align="center">제 목</div>
			</td>
			<td>
				<input name="BOARD_SUBJECT" id="board_subject" type="text" size="50" 
					maxlength="100" value="Re: ${boarddata.q_subject}"/>
			</td>
		</tr>
		<tr>
			<td style="font-family:돋음; font-size:12"  class="active">
				<div align="center">내 용</div>
			</td>
			<td>
				<textarea name="BOARD_CONTENT" id="board_content" cols="67" rows="15"></textarea>
			</td>
		</tr>
		
		<tr>
			<td style="font-family:돋음; font-size:12"  class="active">
				<div align="center">파일 첨부</div>
			</td>
			<td>
				<input name="BOARD_FILE" type="file" class="btn btn-default"/>
			</td>
		</tr>		
		
		
		<!-- <tr>
			<td style="font-family:돋음; font-size:12">
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
			    <input type=submit value="등록" class="btn btn-default">
				<input type=button value="취소" onClick="history.go(-1)" class="btn btn-default">		    
			</td>
		</tr>
	</table>

	</c:if>
	<c:if test="${sessionScope.sessionHaknum == null }">
	<%@ include file="/Member/Login/LoginMain.jsp" %>
	</c:if>		
	
</div>
</form>

</body>
</html>