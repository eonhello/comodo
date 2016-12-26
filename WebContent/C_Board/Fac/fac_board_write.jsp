<%@ page language="java" contentType="text/html; charset=utf-8"%>

<html>
<head>
	<title>MVC 게시판</title>
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

<form action="/GitTest_Fac/BoardAddAction.bo" method="post" 
	enctype="multipart/form-data" name="boardform">
<table cellpadding="0" cellspacing="0" align=center border=1>
	<tr align="center" valign="middle">
		<td colspan="5">시설 안내</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">이름</div>
		</td>
		<td>
			<input name="FAC_BOARD_NAME" id="fac_board_name" type="text" size="10" maxlength="10" 
				value=""/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">이메일주소</div>
		</td>
		<td>
			<input name="FAC_BOARD_EMAIL" id="fac_board_email" type="text" size="30" maxlength="30" 
				value=""/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="FAC_BOARD_SUBJECT" id="fac_board_subject" type="text" size="50" maxlength="100" 
				value=""/>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="FAC_BOARD_CONTENT" id="fac_board_content" cols="67" rows="15"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">파일 첨부</div>
		</td>
		<td>
			<input name="FAC_BOARD_FILE" type="file"/>
		</td>
	</tr>
	<tr bgcolor="cccccc">
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle">
		<td colspan="5">			
			<input type=submit value="등록">
			<input type=button value="취소" onClick="history.go(-1)">
		</td>
	</tr>
</table>
</form>

</body>
</html>