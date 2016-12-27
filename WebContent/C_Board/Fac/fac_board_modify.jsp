<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="db.board.fac.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//	BoardBean board = (BoardBean)request.getAttribute("boarddata");
//  String nowpage = (String)request.getAttribute("page");
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
<div class="container">
<form action="/GitTest_Fac/BoardModifyAction.bo" method="post" name="modifyform" class="form-horizontal" role="form">
<input type="hidden" name="FAC_BOARD_NUM" value="${boarddata.fac_board_num}">
<input type="hidden" name=page value="${page}">

<fieldset>
	<legend>시설 안내</legend>
<div class="form-group">   
            <label for="email" class="col-xs-2 col-lg-2 control-label">제목</label>
            <div class="col-xs-10 col-lg-10">
                <input name="FAC_BOARD_SUBJECT" id="fac_board_subject" type="text" class="form-control" placeholder="제목" value="${boarddata.fac_board_subject}"> 
            </div>
</div>
<div class="form-group">   
            <label for="email" class="col-xs-2 col-lg-2 control-label">내용</label>
            <div class="col-xs-10 col-lg-10">
                <textarea name="FAC_BOARD_CONTENT" id="fac_board_content" rows="5" class="form-control">${boarddata.fac_board_content}</textarea>
            </div>
</div>
<c:if test="${!empty boarddata.fac_board_filename}">
<div class="form-group">   
            <label for="email" class="col-xs-2 col-lg-2 control-label">파일 첨부</label>
            <div class="col-xs-10 col-lg-10">
		&nbsp;&nbsp;${boarddata.fac_board_filename}
            </div>
</div>
</c:if>
<div class="form-group">     
	<div class="col-xs-offset-2 col-xs-10 col-lg-offset-2 col-lg-10 "> 
        <input type="submit" class="btn btn-info" value="등록">&nbsp;&nbsp;
		<input type="button" class="btn btn-default" value="취소" onClick="history.go(-1)">
	</div>
</div>   
</fieldset>
</form>
</div>
<!-- 게시판 수정 -->
</body>
</html>