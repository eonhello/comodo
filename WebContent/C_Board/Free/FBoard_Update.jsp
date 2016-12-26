<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>
</head>

<script>
function move(url) {
	location.href=url;
}

function boardUpdateCheck() {
	var form = document.BoardUpdateForm;
	return true;
}
</script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
<body>

	<!-- 메뉴  -->
	<%@include file="/nav.jsp" %>
	

	<table summary="글수정 전체 테이블">
<form action="/free/FModify_action.fr" method="post" name="modifyform">
<input type="hidden" name="BOARD_NUM" value="${boarddata.board_num}">
<input type="hidden" name=page value="${page}">
		
   		<colgroup>
   			<col width="20%">
   			<col width="80%">
   		</colgroup>
   	

		<table summary="테이블 구성" >
		<caption>글 수정하기</caption>	
    		<tr>
				<td>작성자</td>
				<td><input type=text name=name size=10 maxlength=8 readonly></td>
			</tr>
    		<tr>
     			<td>제 목</td>
     			<td><input type=text name=subject size=70 value="${boarddata.board_subject}"></td>
    		</tr>
    		<tr>
     			<td>내 용</td>
     			<td><textarea name=content rows ="10" cols="100">${boarddata.board_content}</textarea></td>
    		</tr>
    		<tr>
     			<td>비밀번호</td> 
     			<td><input type=password name=password size=15 maxlength=15></td>
    		</tr>
    		<tr>
     			<td colspan=2><hr size=1></td>
    		</tr>
    		<tr>
     			<td colspan="2"><div align="center">
     			<input type="submit" value="수정 완료">&nbsp;&nbsp;
				<input type=reset value="다시 수정"> 
         		<input type=button value="취소" onClick="history.go(-1)">
     			</td>
    		</tr> 
		</table>
	</form> 
</table>

</body>
</html>