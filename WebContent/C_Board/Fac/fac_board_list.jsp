<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="db.board.fac.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
//	List boardList=(List)request.getAttribute("boardlist");
//	int listcount=((Integer)request.getAttribute("listcount")).intValue();
//	int nowpage=((Integer)request.getAttribute("page")).intValue();
//	int maxpage=((Integer)request.getAttribute("maxpage")).intValue();
//	int startpage=((Integer)request.getAttribute("startpage")).intValue();
//	int endpage=((Integer)request.getAttribute("endpage")).intValue();

//	int number = listcount-(nowpage-1)*10;
%>

<html>
<head>
	<meta charset="UTF-8">
	<title>시설 안내</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<!-- 메뉴  -->
	<%@include file="/nav.jsp" %>
<!-- 게시판 리스트 -->

<div class="container">
<br><br>
<table class="table table-bordered table-hover table-condensed" align=center width=800 border="1" cellpadding="0" cellspacing="0">
<%
//if(listcount > 0){
%>

<!-- 레코드가 있으면 -->
<c:if test="${listcount > 0 }">

	<tr align="center" valign="middle">
		<td colspan="4">시설 안내</td>
		<td align=right colspan="2">
			<font size=2>글 개수 : ${listcount }</font>
		</td>
	</tr>
	
	<tr class="info" align="center" valign="middle" bordercolor="#333333">
		<td style="font-family:Tahoma;font-size:8pt;font-weight:bold;" width="5%" height="26">
			<div align="center">번호</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;font-weight:bold;" width="13%">
			<div align="center">이미지</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;font-weight:bold;" width="50%">
			<div align="center">제목</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;font-weight:bold;" width="10%">
			<div align="center">작성자</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;font-weight:bold;" width="13%">
			<div align="center">날짜</div>
		</td>
		<td style="font-family:Tahoma;font-size:8pt;font-weight:bold;" width="8%">
			<div align="center">조회수</div>
		</td>
	</tr>
	
	<%//int number = listcount-(nowpage-1)*10;
//		for(int i=0;i<boardList.size();i++){
//			BoardBean bl=(BoardBean)boardList.get(i);
	%>	 
	 
	<!-- 화면 출력 번호 -->		
	<c:set var="num" value="${listcount-(page-1)*10}"/> 	
	
	<c:forEach var="b" items="${boardlist}">	
	
	<tr align="center" valign="middle" bordercolor="#333333"
		onmouseover="this.style.backgroundColor='F8F8F8'"
		onmouseout="this.style.backgroundColor=''">
		<td height="23" style="font-family:Tahoma;font-size:10pt;">
			<!-- 번호 출력 부분 -->
			<c:out value="${num}"/>				
			<c:set var="num" value="${num-1}"/>					
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"></div>
			 <c:if test="${b.fac_board_re_level eq 0}"> 
				<img src="boardUpload/${b.fac_board_filename}" class="img-rounded" width=80 height=80>	
			 </c:if> 		
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="left">
			<%--if(bl.getBOARD_RE_LEV()!=0){ // 답글    --%>
				<%--for(int a=0;a<=bl.getBOARD_RE_LEV()*2;a++){ --%>
				<!-- &nbsp; -->
				<%--} --%>
				<!-- ▶ -->
			<%--}else{  // 원문 --%>
				<!-- ▶ -->
			<%--} --%>
			
			<!-- 답변글 제목앞에 여백 처리 부분 -->
		    <c:if test="${b.fac_board_re_level != 0}"> 
		    	<c:forEach var="i" begin="${1}" end="${b.fac_board_re_level}">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:forEach> ▶			
			</c:if>   
			<c:if test="${b.fac_board_re_level == 0}"> 
				&nbsp; ▶ 
			</c:if> 			
			
			
			<a href="./BoardDetailAction.bo?num=${b.fac_board_num}&page=${page}">
				<%--bl.getBOARD_SUBJECT()--%>
				${b.fac_board_subject}
			</a>
			</div>
		</td>
		
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%--bl.getBOARD_NAME() --%></div>
					${b.fac_board_name}
		</td>
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%--bl.getBOARD_DATE() --%></div>
					${b.fac_board_regdate}
		</td>	
		<td style="font-family:Tahoma;font-size:10pt;">
			<div align="center"><%--bl.getBOARD_READCOUNT() --%></div>
					${b.fac_board_readcount}
		</td>
	</tr>
	
	</c:forEach>
	<%-- </c:if> --%>
	<%//}// for end %>
	
	
	<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
			<%--if(nowpage<=1){ --%>
					<!-- [이전]&nbsp; -->			
			<%--}else{ --%>			
			<%-- <a href="./BoardList.bo?page=<%=nowpage-1 %>">[이전]</a>&nbsp; --%>			
			<%--} --%>
			
			<c:if test="${page <= 1 }">
					[이전]&nbsp;
			</c:if>
			<c:if test="${page > 1 }">	
				 <a href="./BoardList.bo?page=${page-1}">[이전]</a>&nbsp;
			</c:if>
			
			
			
			<%--for(int a=startpage; a<=endpage; a++){
				if(a==nowpage){ // 현재 페이지 --%>
				<%-- [<%=a %>] --%>
				<%--}else{ --%>
				<%-- <a href="./BoardList.bo?page=<%=a %>">[<%=a %>]</a>&nbsp; --%>
				<%--} --%>
			<%--} --%>
			
			<c:forEach var="a" begin="${startpage}" end="${endpage}">
				<c:if test="${a == page }">
					[${a}]
				</c:if>
				<c:if test="${a != page }">
					<a href="./BoardList.bo?page=${a}">[${a}]</a>&nbsp;
				</c:if>
			</c:forEach>
			


			<%--if(nowpage>=maxpage){ --%>
				<!-- [다음] -->
			<%--}else{ --%>
			<%-- <a href="./BoardList.bo?page=<%=nowpage+1 %>">[다음]</a> --%>
			<%--} --%>
			
			<c:if test="${page >= maxpage }">
				[다음] 
			</c:if>
			<c:if test="${page < maxpage }">
				<a href="./BoardList.bo?page=${page+1}">[다음]</a>
			</c:if>
			
			
		</td>
	</tr>
	
	</c:if>
	<%
//    }else{
	%>
	
	<!-- 레코드가 없으면 -->
	<c:if test="${listcount == 0 }">
	<tr align="center" valign="middle">
		<td colspan="4">시설 안내</td>
		<td align=right>
			<font size=2>등록된 글이 없습니다.</font>
		</td>
	</tr>
	</c:if>
	
	<%
//	}
	%>
	
	<tr align="right">
		<td colspan="6">
	   		<c:if test="${sessionScope.sessionHaknum}">
				<a href="./BoardWrite.bo">[글쓰기]</a>
			</c:if>
		</td>
	</tr>
</table>
</div>

</body>
</html>