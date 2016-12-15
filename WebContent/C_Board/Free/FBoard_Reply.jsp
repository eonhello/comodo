<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>답변</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>

<script type="text/javascript">
	function move(url) {
		location.href=url;
	}
	function boardReplyCheck() {
		var form = document.BoardReplyForm;
		return true;
	}
</script>
</head>

<body>
	<table summary="전체 테이블 구성">
 	<tr>
  		<td bgcolor=#dcdcdc height=25 align=center>답변달기</td>
 	</tr>
	</table><br>

	<table summary= "답변 테이블 구성">
	<form name="BoardReplyForm" method="post" action="Board_Reply_action.jsp" 
														onsubmit="return boardReplyCheck();" >
 	<tr>
		<td>
		<table border=0 width=100% align=center>
	    <tr>
			<td width=30% align="center">작성자</td>
			<td ><input type=text name=name size=5 maxlength=8 readonly></td>
			<td width=40% align="center">비밀 번호</td> 
			<td width=10% ><input type=password name="password" size=15 maxlength=15></td>
		</tr>
		<tr>
			<td width=20% align="center">내 용</td>
			<td><textarea name=content rows=5 cols=40> 
											|댓글|
		</textarea></td>
		</tr>
			<td colspan=2><hr size=2></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
			<input type="submit" value="답변 등록" class="btn" >&nbsp;
			</td>
		</tr> 
		</table>
		</td>
		</tr>
		</form> 
	</table>
</body>
</html>