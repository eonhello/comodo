<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//	int num=Integer.parseInt(request.getParameter("num"));
//	String nowpage = request.getParameter("page");
%>
<html>
<head>
<title>MVC 게시판</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script>
		$(document).ready(function(){
			$("form").submit(function(){				
				if($("#board_pass").val()==""){
					alert("비밀번호를 입력 하세요?");
					$("#board_pass").focus();
					return false;
				}						
			});			
		});	
	</script>

</head>
<body>
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
					<form name="deleteForm" action="./QnA_DeleteAction.qa?num=${param.num}" method="post">
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
										<td align=center><input type="submit" value="삭제완료" class="btn btn-success">
											<input type=button value="취소" class="btn btn-warning" onClick="history.go(-1)">
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

