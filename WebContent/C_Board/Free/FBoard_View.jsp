<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 읽기</title>
<script type="text/javascript">
	function move(url) {
		location.href=url;
	}
	function boardViewCheck() {
		var form = document.BoardViewForm;
		return true;
	}
</script>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>
</head>

<body>
	<form name="BoardViewForm" method="post">
	<table summary="전체 테이블 구성">
	<tr>
		<td ><div align="center"><h3><b>FBoard_View</b></h3></div></td>
	</tr>
	<tr>
		<td colspan=3>
		<table border="1" width="800" height="200" summary="목록 테이블 구성"> 
    <tr> 
		<td align=center bgcolor=#dddddd width=10%> 작성자</td>
		<td bgcolor=#ffffe8 width=20%>나다</td>
		<td align=center bgcolor=#dddddd width=10%> 작성일</td>
		<td bgcolor=#ffffe8 width=20%>2015/11/23</td>
		<td align=center bgcolor=#dddddd> 조회수 </td>
		<td bgcolor=#ffffe8 >23</td> 
	</tr>
	<tr> 
		<td align=center bgcolor=#dddddd> 제 목</td>
		<td bgcolor=#ffffe8 colspan=6> 게시판 제목이 들어간다. </td>
   </tr>
   <tr> 
		<td colspan=6><br>ㅎㅇㅎㅇㅎㅇㅎㅇ<br></td>
   </tr>
	</table>
	</td>
 	</tr>
 	<jsp:include page="FBoard_Reply.jsp" flush="false" />
	<tr>
		<td align=center colspan=2> 
		<hr size=1>
		<div align="center">
		<input type="button" value="수정" onclick="move('FBoard_Update.jsp');"> |
		<input type="button" value="삭제" onclick="move('FBoard_Delete.jsp');"><br>
		</div>
		</td>
	</tr>
	</table>
</form>

</body>
<br>
<br>
 	<jsp:include page="FBoard_List.jsp" flush="false" />
</html>