<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<!-- 메뉴  -->
	<%@include file="/nav.jsp" %>
	

	<table summary="전체 테이블 구성">
	<tr>
		<td ><div align="center"><h3><b>${boarddata.board_subject}</b></h3></div></td>
	</tr>
	<tr>
		<td colspan=3>
		<table border="1" width="800" height="200" summary="목록 테이블 구성"> 
    <tr> 
		<td align=center bgcolor=#dddddd width=10%> 작성자 </td>
		<td bgcolor=#ffffe8 width=20% align="center">나다</td>
		<td align=center bgcolor=#dddddd width=10%> 작성일</td>
		<td bgcolor=#ffffe8 width=20% align="center">${boarddata.board_date}</td>
		<td align=center bgcolor=#dddddd> 조회수 </td>
		<td bgcolor=#ffffe8 align="center">${boarddata.board_readcount}</td> 
	</tr>
	<tr> 
		<td align=center bgcolor=#dddddd> 제 목</td>
		<td bgcolor=#ffffe8 colspan=6 align="center"> ${boarddata.board_subject} </td>
   </tr>
   <tr> 
		<td colspan=6 align="center"><br>${boarddata.board_content}<br></td>
   </tr>
	</table>
	
<!-- 댓글 입력 폼 -->
	<div style="border: 1px solid; width: 600px; padding: 5px">
    <form name="reply" action="/free/FReply.fr" method="post">
        <input type="hidden" name="brdno" value="${boarddata.board_num}"/>
        작성자: <input type="text" name="rewriter" size="20" maxlength="20"> <br/>
        <textarea name="rememo" rows="3" cols="60" maxlength="500" placeholder="댓글을 달아주세요."></textarea>
        <input type="submit" value="저장"/>
    </form>
	
	</div> 
			<c:forEach var="reply" items="${replydlist}" >
						<p>${reply.rewriter}</p>
						<p>${reply.redate}</p>
						<p>${reply.rememo}</p>
			</c:forEach>

		<tr>
		<td align=center colspan=2> 
		<hr size=1>
		<div align="center">
		<input type="button" value="수정"
		onclick="move('/free/FModify.fr?num=${boarddata.board_num}&page=${page}');"> |
		<input type="button" value="삭제"
		onclick="move('/free/FDelete.fr?num=${boarddata.board_num}&page=${page}');"> |
			<input type="button" value="목록"
		onclick="move('/free/FList.fr?page=${page}');"><br>
		</div>
		</td>
	</tr>
	</table>


</body>
</html>