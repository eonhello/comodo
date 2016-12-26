<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="db.board.sleep.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%-- <%@ include file="../nav.html" %> --%>

<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<c:set var="num" value="${listcount-(page-1)*10}"/>
	
	<script>
	function confirm_select(B_Num){
		alert('B_Num = '+B_Num);
	
		//승인버튼 눌렀을때
		alert("데이터 요청!"); //서버로부터 데이터 요청 
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
	
		//승인버튼 눌렀을때
		alert("데이터 요청!"); //서버로부터 데이터 요청 
		$.ajax({ //ajax함수 안에 객체의 형태로 실행명령을 넣는다. 
			url : '/sleep/Sleep_Disapprove_Action.sl', 
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
	
	function cancel_select(B_Num){
		alert('B_Num = '+B_Num);
	
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
				alert(t);	
				location.reload();
			},
			error : function() {
				alert('연결실패 ㅠㅠ');
			}
		});
	}
	
	
	
	
	</script>
	

</head>
<body>
	<table>
	<tr>
		<td width="50" valign="top">
		</td>
		<td>
	<table border="1">
		<tr align="center">
			<td>신청 번호
			</td>
			<td>학번</td>
			<td>이름</td>
			<td>학과</td>
			<td>제목</td>
			<td>신청 구분</td>
			<td>내용(행선지)</td>
			<td>외박 시작일</td>
			<td>외박 종료일</td>
			<td>게시날짜</td>
			<td>승인 여부</td>
			<td>승인 일시</td>
			<td>취소 여부</td>
		</tr>
		
		<c:set var="n" value="0"/>
		<c:forEach var="b" items="${boardlist }">
		<tr align="center">
			<td><c:out value="${num}"/>				
			<c:set var="num" value="${num-1}"/><br>
				
			</td>
<%-- 			<td>${b.s_haknum }</td> --%>
			<td>${sessionScope.sessionHaknum }</td>
			<td>${b.s_name }</td>
			<td>${b.s_major }</td>
			<td>${b.s_subject }</td>
			<td>${b.s_sleep_type }</td>
			<td>${b.s_content }</td>
<%-- 			<td>${b.s_start_date }</td> --%>
			<td><fmt:formatDate value="${b.s_start_date}" type="date"/></td>
			<td><fmt:formatDate value="${b.s_end_date}" type="date"/></td>
			<td><fmt:formatDate value="${b.s_board_date}" type="both"/></td>
			<td><c:if test="${1==b.s_confirm }">승인됨</c:if>
				<c:if test="${2==b.s_confirm }">불허됨</c:if></td>
			<td>${b.s_confirm_date }</td>
			<td><c:if test="${1==b.s_cancel }">취소됨</c:if>
				<c:if test="${0==b.s_cancel }"></c:if></td>
			<td>
				<div id="n_select"><c:set var="n" value="${b.s_board_num}"/></div>
				<c:if test="${1==sessionScope.sessionPermission }">
				<input type="button" value="승인" class="confirm_btn" onclick="confirm_select('${b.s_board_num}')" style="display:inline">
				<input type="button" value="불허" class="disapprove_btn" onclick="disapprove_select('${b.s_board_num}')" style="display:inline">
				</c:if>
				<c:if test="${0==sessionScope.sessionPermission }">
				<input type="button" value="신청취소" class="cancel_btn" onclick="cancel_select('${b.s_board_num}')" style="display:inline">
				</c:if>
				
				
			</td>
		</tr>
		</c:forEach>
		
		<tr align=center height=20>
		<td colspan=7 style=font-family:Tahoma;font-size:10pt;>
		
			
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
	</td>
	</tr>
	</table>
	count = ${listcount }
	session = <%=session.getAttribute("sessionPermission") %>
	<%-- ${sessionScope.sessionHaknum} --%>
	
	<c:if test="${0==sessionScope.sessionPermission}">
	<a href="/sleep/Sleep_Write_Action.sl">
		<input type="button" value="신청하기">
	</a>
	</c:if>

	
</body>
</html>
