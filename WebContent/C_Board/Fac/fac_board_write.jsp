<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				if($("#fac_board_name").val()==""){
					alert("이름을 입력하세요");
					$("#fac_board_name").focus();
					return false;
				}
				if($("#fac_board_email").val()==""){
					alert("메일주소를 입력하세요");
					$("#fac_board_email").focus();
					return false;
				}
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
			});			
		});	
	</script>
	
</head>
<body>
<%@include file="/nav.jsp" %>
<div class="container">
<form action="/BoardAddAction.bo" method="post" 
	enctype="multipart/form-data" name="boardform" class="form-horizontal" role="form">
<fieldset>
	<legend>시설 안내</legend>
<div class="form-group">
	<label for="name" class="col-xs-2 col-lg-2 control-label">작성자</label>
	<div class="col-xs-10 col-lg-10"> 
		<input name="FAC_BOARD_NAME" id="fac_board_name" type="text" class="form-control" placeholder="이름"> 
	</div>

</div>
<div class="form-group">   
            <label for="email" class="col-xs-2 col-lg-2 control-label">이메일</label>
            <div class="col-xs-10 col-lg-10">
                <input name="FAC_BOARD_EMAIL" id="fac_board_email" type="email" class="form-control" placeholder="이메일"> 
            </div>
</div>
<div class="form-group">   
            <label for="email" class="col-xs-2 col-lg-2 control-label">제목</label>
            <div class="col-xs-10 col-lg-10">
                <input name="FAC_BOARD_SUBJECT" id="fac_board_subject" type="text" class="form-control" placeholder="제목"> 
            </div>
</div>
<div class="form-group">   
            <label for="email" class="col-xs-2 col-lg-2 control-label">내용</label>
            <div class="col-xs-10 col-lg-10">
                <textarea name="FAC_BOARD_CONTENT" id="fac_board_content" rows="5" class="form-control"></textarea>
            </div>
</div>
<div class="form-group">   
            <label for="email" class="col-xs-2 col-lg-2 control-label">파일 첨부</label>
            <div class="col-xs-10 col-lg-10">
                <input name="FAC_BOARD_FILE" type="file"/>
            </div>
</div>
<br>
<div class="form-group">     
	<div class="col-xs-offset-2 col-xs-10 col-lg-offset-2 col-lg-10 "> 
        <input type="submit" class="btn btn-info" value="등록">&nbsp;&nbsp;
		<input type="button" class="btn btn-default" value="취소" onClick="history.go(-1)">
	</div>
</div>  
</fieldset>
</form>
</div>
</body>
</html>