<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<div class="page-header">
				<h1>
					자유게시판 <small>리스트</small>
				</h1>
			</div>		
	
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
			<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<nav>
			  <ul class="pagination">
			  	<c:if test="${page <= 1 }">
				  	<li class="disabled">
				      <a href="#" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				</c:if>
				<c:if test="${page > 1 }">			
	 			    <li>
				      <a href="./FList.fr?page=${page-1}&keyword=${keyword}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
					<c:if test="${a == page }">
						<li class="active"><a href="#">${a}</a></li>
					</c:if>
					<c:if test="${a != page }">
						<li><a href="./FList.fr?page=${a}&keyword=${keyword}" 
							>${a}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${page >= maxpage }">
				    <li class="disabled">
				      <a href="#" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>				
				</c:if>
				<c:if test="${page < maxpage }">
				    <li>
				      <a href="./FList.fr?page=${page+1}&keyword=${keyword}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>					
				</c:if>
	

			  </ul>
			</nav>
			</td>
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
				<td colspan="5">
					<c:if test="${sessionScope.sessionHaknum != null }">
						<a href="/free/FWrite.fr" role="button" class="btn btn-success">글쓰기</a>
					</c:if> <c:if test="${sessionScope.sessionHaknum == null }">
						<a href="/Member/Login/LoginMain.jsp" role="button"
							class="btn btn-success">글쓰기</a>
					</c:if></td>
			</tr>




			<!-- 			<form name="serach" method="post" action="/free/FList.fr">
				<select name="keyField">
					<option value="0">검색항목</option>
					<option value="id">작성자</option>
					<option value="subject">제목</option> 
					<option value="content">내용</option>
				</select> 
				<input type="text" name="keyword" /> 
				<input type="submit" value="검색" class="btn btn-success" />
			</form> -->

		</table>

		<!-- 검색 부분 -->
		<div id="bbsfind">
			<script>
				function find_check() {
					if ($.trim($("#searchData").val()) == "") {
						alert("검색이름을 입력하세요!");
						$("#find_name").val("").focus();
						return false;
					}
				}
			</script>
			<form action="/free/FList.fr" onsubmit="return find_check()"
				class="form-inline">
				<table>
					<tr>
						<td><select name="keyField" class="form-control">
								<option value="0">검색항목</option>
								<option value="id">작성자</option>
								<option value="subject">제목</option>
								<option value="content">내용</option>
						</select></td>
						<td class="form-horizontal"><input name="keyword"
							id="searchData" size="18" class="form-control" /> <input
							type="submit" value="검색" class="btn btn-default" /></td>
					</tr>
				</table>
			</form>
		</div>

	</div>
</body>
</html>