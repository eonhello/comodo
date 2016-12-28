<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="db.board.sleep.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <%@ include file="../nav.html" %> --%>

<html>
<head>
<!--   <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/assets/bootstrap-3.3.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="/C_Board/css/layouts/pure_main.css" rel="stylesheet">
 
    
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="/assets/bootstrap-3.3.2/js/bootstrap.min.js"></script>  
  
  
	<c:set var="num" value="${listcount-(page-1)*10}"/>
	
	<script>
	function confirm_select(B_Num){
		//alert('B_Num = '+B_Num);
	
		//승인버튼 눌렀을때
		//alert("데이터 요청!"); //서버로부터 데이터 요청 
		$.ajax({ //ajax함수 안에 객체의 형태로 실행명령을 넣는다. 
			url : '/sleep/Sleep_Confirm_Action.sl', 
			type : 'post', 
			data : {"num": B_Num},
			success : function(t) {
				//alert('연결성공!'); //출력 되면 연결 성공을 알 수 있땅  
				//alert($(t).text());  // 경고 창에 JSP파일의 내용이 떠야 한다.
				//$("<h1></h1>").text($(t).text()).appendTo("body"); //<h1>태그 적용해서 출력!
				alert(t);	
				location.reload();
			},
			error : function() {
				alert('연결실패 ㅠㅠ');
			}
		});
	}
	
	function disapprove_select(B_Num){
		alert('B_Num = '+B_Num);
	
		//불허버튼 눌렀을때
		//alert("데이터 요청!"); //서버로부터 데이터 요청 
		$.ajax({ //ajax함수 안에 객체의 형태로 실행명령을 넣는다. 
			url : '/sleep/Sleep_Disapprove_Action.sl', 
			type : 'post', 
			data : {"num": B_Num},
			success : function(t) {
				//alert('연결성공!'); //출력 되면 연결 성공을 알 수 있땅  
				//alert($(t).text());  // 경고 창에 JSP파일의 내용이 떠야 한다.
				//$("<h1></h1>").text($(t).text()).appendTo("body"); //<h1>태그 적용해서 출력!
				//alert(t);	
				location.reload();
			},
			error : function() {
				alert('연결실패 ㅠㅠ');
			}
		});
	}
	
	function cancel_select(B_Num){
		//alert('B_Num = '+B_Num);
	
		//승인버튼 눌렀을때
		alert("데이터 요청!"); //서버로부터 데이터 요청 
		$.ajax({ //ajax함수 안에 객체의 형태로 실행명령을 넣는다. 
			url : '/sleep/Sleep_Cancel_Action.sl', 
			type : 'post', 
			data : {"num": B_Num},
			success : function(t) {
				//alert('연결성공!'); //출력 되면 연결 성공을 알 수 있땅  
				//alert($(t).text());  // 경고 창에 JSP파일의 내용이 떠야 한다.
				//$("<h1></h1>").text($(t).text()).appendTo("body"); //<h1>태그 적용해서 출력!
				//alert(t);	
				location.reload();
			},
			error : function() {
				alert('연결실패 ㅠㅠ');
			}
		});
	}
	
	
	
	
	</script>
	<link rel="stylesheet" type="text/css" href="/C_Board/Sleep/style.css">

</head>
<body>
<!-- 메뉴  -->
	<%@include file="/nav.jsp" %>
<div id="container" style="margin-top:80px">

	
	<table class="responstable" style="margin-left: auto; margin-right: auto;">
		<tr>
			<th width="5%">번호</th>
			<th width="11%">신청자 정보</th>
			<th width="30%">외박 정보</th>
			
			
			
			<th width="15%">승인 여부</th>
			<th>취소 여부</th>
			<th>승인 or 취소</th>
		</tr>
		
		<c:set var="n" value="0"/>
		<c:forEach var="b" items="${boardlist }">
		<tr align="center">
			<td><c:out value="${num}"/>				
			<c:set var="num" value="${num-1}"/><br>
				
			</td>
<%-- 			<td>${b.s_haknum }</td> --%>
			<td>학번 : ${b.haknum }<br>
			이름 : ${b.s_name }<br>
			${b.s_major }</td>
			<td>	<!-- 여기부터 외박정보 나누기 -->
				<div style="float:left;">${b.s_sleep_type }</div>
				<div style="float:right;">${b.s_content }</div><br><br>
				<div style="float:left;font: bold 1.2em/1.0em 나눔고딕코딩;">${b.s_subject }</div>
					
				<div style="float:right;font: bold 1.2em/1.0em 나눔고딕코딩;"><fmt:formatDate value="${b.s_start_date}" type="date"/> ~ 
				<fmt:formatDate value="${b.s_end_date}" type="date"/></div><br><br>
				<div style="float:left;">
				신청일 : 
					<fmt:formatDate value="${b.s_board_date}" type="both"/></div>
			</td>
			<td><c:if test="${1==b.s_confirm }"><div style="font: bold 1.2em/1.0em 나눔고딕코딩;">승인됨</div><br></c:if>
				<c:if test="${2==b.s_confirm }"><div style="font: bold 1.2em/1.0em 나눔고딕코딩;">불허됨</div><br></c:if>
			일시 : ${b.s_confirm_date }</td>
			<td width="10%"><c:if test="${1==b.s_cancel }"><div style="color:red;font: bold 1.2em/1.0em 나눔고딕코딩;">취소됨</div></c:if>
				<c:if test="${0==b.s_cancel }"></c:if></td>
			<td width="10%">
				<div id="n_select"><c:set var="n" value="${b.s_board_num}"/></div>
				<c:if test="${1==sessionScope.sessionPermission }">
				<input type="button" value="승인" class="secondary-button" onclick="confirm_select('${b.s_board_num}')">
				<input type="button" value="불허" class="secondary-button" onclick="disapprove_select('${b.s_board_num}')">
				</c:if>
				<c:if test="${0==sessionScope.sessionPermission }">
				<input type="button" value="신청취소" class="secondary-button" onclick="cancel_select('${b.s_board_num}')" style="display:inline">
				</c:if>
				
				
			</td>
		</tr>
		</c:forEach>
		
		<tr align=center height=20>
		<td colspan=14 style=font-family:Tahoma;font-size:10pt;>
		
			
			<c:if test="${page <= 1 }">
				[이전]&nbsp;
			</c:if>
			<c:if test="${page > 1 }">			
				 <a href="/sleep/Sleep_List_Action.sl?page=${page-1}">[이전]</a>&nbsp;
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
					<a href="/sleep/Sleep_List_Action.sl?page=${a}">[${a}]</a>&nbsp;
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
				<a href="/sleep/Sleep_List_Action.sl?page=${page+1}">[다음]</a>
			</c:if>
			
			
		</td>
	</tr>
	</table>	

	count = ${listcount }
	session = <%=session.getAttribute("sessionPermission") %>
	<%-- ${sessionScope.sessionHaknum} --%>
	
	<c:if test="${0==sessionScope.sessionPermission}">
	<a href="/sleep/Sleep_Write_Action.sl">
		<input type="button" class="secondary-button" style="font: bold 1.2em/1.0em 나눔고딕코딩;color:ff3300;" value="신청하기">
	</a>
	</c:if>

</div>
</body>
</html>
