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
		
<title>글 읽기</title>
<script type="text/javascript">
	function move(url) {
		location.href = url;
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
	<%@include file="/nav.jsp"%>

	<div class="container" style="margin-top: 100px">
			<div class="page-header">
				<h1>
					자유게시판 <small>상세보기</small>
				</h1>
			</div>	
		<table class="table table-bordered">
			<tr align="center" valign="middle" >
				<td colspan="6">자유게시판</td>
			</tr>


						<tr>
							<td align=center class="active" >작성자</td>
							<td align="center">${boarddata.board_name}</td>
							<td align=center class="active">작성일</td>
							<td align="center">${boarddata.board_date}</td>
							<td align=center class="active">조회수</td>
							<td align="center">${boarddata.board_readcount}</td>
						</tr>
						<tr>
							<td align=center class="active"> 제 목</td>
							<td colspan=6 align="center">
								${boarddata.board_subject}</td>
						</tr>
						<tr>
							<td colspan=6 align="center"><br><xmp>${boarddata.board_content}</xmp><br><br><br></td>
						</tr>
						<tr>
							<td colspan=6>
								<!-- 댓글 입력 폼 -->
								<c:if	test="${sessionScope.sessionHaknum != null }">
									<div style="padding:15px">
										<form  class="form-inline" name="reply" action="/free/FReply.fr" method="post">
											<input type="hidden" name="brdno" value="${boarddata.board_num}" />
											<div class="form-group" style="padding:15px;width: 100%;text-align: center;">
											    <label for="exampleInputName2">작성자:</label>
											    <input  class="form-control"  type="text" name="rewriter" size="20" maxlength="20"
												value="<%=session.getAttribute("sessionName")%>" readonly>
												&nbsp;&nbsp;<input type="submit" value="저장" class="btn btn-success" />
											</div>
											

											<br />
											<div style="text-align: center;">
											<textarea class="form-control" style="width:70%;"  name="rememo" rows="3" cols="60" maxlength="500"
												placeholder="댓글을 달아주세요."></textarea>
											</div>
										</form>
									</div>
								</c:if> 
									
								<c:forEach var="reply" items="${replydlist}">
									<div style="text-align: -webkit-center;">
										<hr size=1>										
										<p>${reply.rewriter} &nbsp;&nbsp; (${reply.redate}) </p>
											<pre>${reply.rememo}</pre>
							
									</div>
								</c:forEach>	
															
							</td>
						</tr>
				
			<tr>
				<td align=center colspan=6>
					<hr size=1>
					<div align="center">
						<c:if test="${sessionScope.sessionHaknum == boarddata.haknum}">
							<input class="btn btn-default" type="button" value="수정"
								onclick="move('/free/FModify.fr?num=${boarddata.board_num}&page=${page}');"> &nbsp;&nbsp; 
							<input class="btn btn-default" type="button" value="삭제"
								onclick="move('/free/FDelete.fr?num=${boarddata.board_num}&page=${page}');"> &nbsp;&nbsp; 
						</c:if>
						<input class="btn btn-default" type="button" value="목록"
							onclick="move('/free/FList.fr?page=${page}');"><br>
					</div>
				</td>
			</tr>
			
		</table>			
	</div>

</body>
</html>