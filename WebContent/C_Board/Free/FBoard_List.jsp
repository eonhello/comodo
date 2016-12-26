<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="db.board.free.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<head>
<title>자유게시판</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../assets/bootstrap-3.3.2/css/bootstrap.min.css"
	rel="stylesheet">


<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="../assets/bootstrap-3.3.2/js/bootstrap.min.js"></script>
</head>

<body>

	<!-- 메뉴  -->
	<%@include file="/nav.jsp"%>

	<!-- 게시판 리스트 -->
	<div class="container" style="margin-top: 100px">
		<table align=center width=600 border="1" cellpadding="0"
			cellspacing="0" class="table table-bordered">
			<%
				//if(listcount > 0){
			%>

			<!-- 레코드가 있으면 -->
			<c:if test="${listcount > 0 }">

				<tr align="center" valign="middle">
					<td colspan="4">자유게시판</td>
					<td align=center><font size=2>글 개수 : ${listcount }</font></td>
				</tr>

				<tr align="center" valign="middle" bordercolor="#333333">
					<td style="font-family: Tahoma; font-size: 8pt;" width="8%"
						height="26">
						<div align="center">번호</div>
					</td>
					<td style="font-family: Tahoma; font-size: 8pt;" width="50%">
						<div align="center">제목</div>
					</td>
					<td style="font-family: Tahoma; font-size: 8pt;" width="14%">
						<div align="center">작성자</div>
					</td>
					<td style="font-family: Tahoma; font-size: 8pt;" width="17%">
						<div align="center">날짜</div>
					</td>
					<td style="font-family: Tahoma; font-size: 8pt;" width="11%">
						<div align="center">조회수</div>
					</td>
				</tr>


				<!-- 화면 출력 번호 -->
				<c:set var="num" value="${listcount-(page-1)*10}" />

				<c:forEach var="b" items="${boardlist}">

					<tr align="center" valign="middle" bordercolor="#333333"
						onmouseover="this.style.backgroundColor='F8F8F8'"
						onmouseout="this.style.backgroundColor=''">
						<td height="23" style="font-family: Tahoma; font-size: 10pt;">
							<!-- 번호 출력 부분 --> <c:out value="${num}" /> <c:set var="num"
								value="${num-1}" />
						</td>

						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="left">

								<!-- 답변글 제목앞에 여백 처리 부분 -->
								<c:if test="${b.board_re_lev != 0}"> 
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ▶				
			</c:if>
								<c:if test="${b.board_re_lev == 0}"> 
				&nbsp; ▶ <a
										href="./FDetail_action.fr?num=${b.board_num}&page=${page}">
										${b.board_subject} </a>
								</c:if>


							</div>
						</td>

						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="center">
								<%--bl.getBOARD_NAME() --%>
							</div> ${b.board_name}
						</td>
						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="center">
								<%--bl.getBOARD_DATE() --%>
							</div> ${b.board_date}
						</td>
						<td style="font-family: Tahoma; font-size: 10pt;">
							<div align="center">
								<%--bl.getBOARD_READCOUNT() --%>
							</div> ${b.board_readcount}
						</td>
					</tr>

				</c:forEach>
				<%-- </c:if> --%>
				<%
					//}// for end
				%>


				<tr align=center height=20>
					<td colspan=7 style="font-family: Tahoma; font-size: 10pt;"><c:if
							test="${page <= 1 }">
							<input type="button" value="이전" class="btn btn-default"></> &nbsp;
			</c:if> <!-- 뒤에 &keyword=${keyword} 붙여줘서 검색기능 페이징처리 완료 --> <c:if
							test="${page > 1 }">
							<a href="./FList.fr?page=${page-1}&keyword=${keyword}"
								role="button" class="btn btn-default">이전</a>&nbsp;
			</c:if> <c:forEach var="a" begin="${startpage}" end="${endpage}">
							<c:if test="${a == page }">
					[${a}]
				</c:if>
							<c:if test="${a != page }">
								<a href="./FList.fr?page=${a}&keyword=${keyword}">[${a}]</a>&nbsp;
				</c:if>
						</c:forEach> <c:if test="${page >= maxpage }">
							<input type="button" value="다음" class="btn btn-default"></> 
			</c:if> <c:if test="${page < maxpage }">
							<a href="./FList.fr?page=${page+1}&keyword=${keyword}"
								role="button" class="btn btn-default">다음</a>
						</c:if></td>
				</tr>

			</c:if>
			<%
				//    }else{
			%>

			<!-- 레코드가 없으면 -->
			<c:if test="${listcount == 0 }">
				<tr align="center" valign="middle">
					<td colspan="4">자유게시판</td>
					<td align=right><font size=2>등록된 글이 없습니다.</font></td>
				</tr>
			</c:if>

			<%
				//	}
			%>
			<tr align="right">
				<td colspan="5"><c:if
						test="${sessionScope.sessionHaknum != null }">
						<!-- 세션으로 받은 학번(즉,로그인을 안했을경우)이 없을 경우 글쓰기 버튼이 안보이도록 한다.  -->
						<a href="/free/FWrite.fr" role="button" class="btn btn-success">글쓰기</a>
					</c:if> <c:if test="${sessionScope.sessionHaknum == null }">
						<!-- 세션으로 받은 학번(즉,로그인을 안했을경우)이 없을 경우 글쓰기 버튼이 안보이도록 한다.  -->
						<a href="/Member/Login/LoginMain.jsp" role="button"
							class="btn btn-success">글쓰기</a>
					</c:if></td>
			</tr>
			<form name="serach" method="post" action="/free/FList.fr">
				<select name="keyField">
					<option value="0">검색항목</option>
					<option value="id">작성자</option>
					<option value="subject">제목</option> <
					<option value="content">내용</option>
				</select> <input type="text" name="keyword" /> <input type="submit"
					value="검색" class="btn btn-success" />
			</form>

		</table>
	</div>
</body>
</html>