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
		
<title>글 수정</title>
</head>

<script>
	function move(url) {
		location.href = url;
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
	<%@include file="/nav.jsp"%>

	<div class="container" style="margin-top: 100px">

		<c:if test="${sessionScope.sessionHaknum != null }">
			<table summary="글수정 전체 테이블">
				<form action="/free/FModify_action.fr" method="post"
					name="modifyform">
					<input type="hidden" name="BOARD_NUM"
						value="${boarddata.board_num}"> <input type="hidden"
						name=page value="${page}">

					<colgroup>
						<col width="20%">
						<col width="80%">
					</colgroup>


					<table summary="테이블 구성">
						<caption>글 수정하기</caption>
						<tr>
							<td>작성자</td>
							<td><input type=text name=name size=10 maxlength=8
								value="${boarddata.board_name}" readonly></td>
						</tr>
						<tr>
							<td>제 목</td>
							<td><input type=text name=subject size=70
								value="${boarddata.board_subject}"></td>
						</tr>
						<tr>
							<td>내 용</td>
							<td><textarea name=content rows="10" cols="100">${boarddata.board_content}</textarea></td>
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
									<input type="submit" value="수정 완료">&nbsp;&nbsp; <input
										type=reset value="다시 수정"> <input type=button
										value="취소" onClick="history.go(-1)"></td>
						</tr>
					</table>
				</form>
			</table>
		</c:if>

		<c:if test="${sessionScope.sessionHaknum == null }">
			<%@ include file="/Member/Login/LoginMain.jsp"%>
		</c:if>
	</div>
</body>
</html>