<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="/assets/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
		   
		
		<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
		<script src="/assets/bootstrap-3.3.2/js/bootstrap.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
<title>글 삭제하기</title>
<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);

body {
	font-family: 'Nanum Gothic', sans-serif;
}
</style>

<script type="text/javascript">
	function move(url) {
		location.href = url;
	}
	function boardDeleteCheck() {
		var form = document.BoardDeleteForm;
		return true;
	}
</script>
</head>

<body>

	<!-- 메뉴  -->
	<%@include file="/nav.jsp"%>

	<div class="container" style="margin-top: 100px">

		<c:if test="${sessionScope.sessionHaknum != null }">
			<center>
				<br>
				<br>

<!-- 				<table width=50% cellspacing=0 cellpadding=3>
					<tr>
						<td bgcolor=#dcdcdc height=21 align=center>작성자의 비밀번호를 입력해
							주세요.</td>
					</tr>
				</table> -->


				<table width=70% cellspacing=0 cellpadding=2>
					<form name="FBoardDeleteForm" method="post"
						action="/free/FDeleteAction.fr?num=${param.num}"
						onsubmit="return FboardDeleteCheck();">
						<input type=hidden name=page value="${param.page}">
						<tr>
							<td align=center>
								<table align=center border=0 width=91%>
									<tr>
										<td align=center>정말 삭제하시겠습니까?</td>
									</tr>
									<tr>
										<td><hr size=1 color=#eeeeee></td>
									</tr>
									<tr>
										<td align=center><input type="submit" value="삭제완료">
											<input type=button value="취소" onClick="history.go(-1)">
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</form>
				</table>
			</center>
		</c:if>

		<c:if test="${sessionScope.sessionHaknum == null }">
			<%@ include file="/Member/Login/LoginMain.jsp"%>
		</c:if>
	</div>
</body>
</html>