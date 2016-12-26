<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="./assets/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
		   
		
		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
		<script src="./assets/bootstrap-3.3.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자유게시판 글쓰기</title>


	<script>
		$(document).ready(function(){
			$("form").submit(function(){
				if($("#Fboad_title").val()==""){
					alert("제목을 입력 해주세요.");
					$("#Fboad_title").focus();
					return false;
				}
				if($("#Fboad_content").val()==""){
					alert("내용을 입력 해주세요.");
					$("#Fboad_content").focus();
					return false;
				}				
				if($("#Fboad_pass").val()==""){
					alert("비밀번호를 입력 해주세요.");
					$("#Fboad_pass").focus();
					return false;
				}
			});			
		});	
	</script>
</head>

<body>

	<div class="container" style="margin-top:50px">
	
	<c:if test="${sessionScope.sessionHaknum != null }">
	<table summary="글쓰기 전체 테이블" class="table table-bordered">
		<form name="BoardWriteForm" method="post" action="/free/FWrite_action.fr">
													
   		<colgroup>
   			<col width="20%">
   			<col width="80%">
   		</colgroup>
   	
		<div class="container" style="margin-top:50px">
		<table summary="테이블 구성" class="table table-bordered">
		<caption>게시판 글쓰기</caption>	
    		<tr>
				<td>작성자</td>
				<td><input type=text name=board_name size=10 maxlength=8 value="<%=session.getAttribute("sessionName") %>" readonly></td>
			</tr>
			<tr>
				<td>학번</td>
				<td><input type=text name=hak_num size=10 maxlength=8 value="<%=session.getAttribute("sessionHaknum") %>" readonly></td>
			</tr>
    		<tr>
     			<td>제 목</td>
     			<td><input type=text name=board_subject id=board_subject size=70></td>
    		</tr>
    		<tr>
     			<td>내 용</td>
     			<td><textarea name=board_content id=board_content rows ="10" cols="100"></textarea></td>
    		</tr>
    		<tr>
     			<td>비밀번호</td> 
     			<td><input type=password name=board_pass id=board_pass size=15 maxlength=15></td>
    		</tr>
    		<tr>
     			<td colspan=2><hr size=1></td>
    		</tr>
    		<tr>
     			<td colspan="2"><div align="center">
     			<input type="submit" value="등록" role="button" class="btn btn-success" >&nbsp;&nbsp;
         		<input type="button" value="뒤로" role="button" class="btn btn-warning" ></div>
     			</td>
    		</tr> 
		</table>
		</div>
	</form> 
</table>

	

</c:if>

<c:if test="${sessionScope.sessionHaknum == null }">
<%@ include file="/Member/Login/LoginMain.jsp" %>
</c:if>


	</div>
</body>
</html>