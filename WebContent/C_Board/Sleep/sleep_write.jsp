<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="db.board.sleep.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

	<title>MVC 게시판</title>
<!-- 	<script src="http://code.jquery.com/jquery-latest.js"></script> -->
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script> 
	<script type="text/javascript" src="calendar.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
	
	<script>
		$(document).ready(function(){
			$("form").submit(function(){
				if($("#s_board_password").val()==""){
					alert("비밀번호를 입력 하세요.");
					$("#s_board_password").focus();
					return false;
				}
				if($("#s_board_subject").val()==""){
					alert("제목을 입력 하세요.");
					$("#s_board_subject").focus();
					return false;
				}
				if($("#s_board_content").val()==""){
					alert("내용을 입력 하세요.");
					$("#s_board_content").focus();
					return false;
				}	
				if($("#s_start_date").val()==""){
					alert("시작날짜를 확인해주세요.");
					$("#s_start_date").focus();
					return false;
				}
				if($("#s_end_date").val()==""){
					alert("종료날짜를 확인해주세요.");
					$("#s_end_date").focus();
					return false;
				}
							
			});	
		});	
	
		$(function() {
			$("#s_start_date").datepicker({
				dateFormat : "yy-mm-dd",
				minDate : 0,
				maxDate : 30
			});
			$("#s_end_date").datepicker({
				dateFormat : 'yy-mm-dd',
				changeMonth : true,
				changeYear : true,
				showButtonPanel : true,
				yearRange : 'c-1:c+10',
				minDate : '0d',
				beforeShow : function() {
					var startDate = $("#s_start_date").datepicker('getDate');
					//if a date was selected else do nothing
					if (startDate != null) {
						startDate.setMonth(startDate.getMonth());
						$(this).datepicker('option', 'minDate', startDate);
					}
				}
			});
		});
	</script>
	
</head>
<body>
<!-- 메뉴  -->
	<%@include file="/nav.jsp" %>
<div class="container" style="margin-top:100px">



<form action="/sleep/Sleep_Add_Action.sl" method="post" name="boardform">
<table cellpadding="0" cellspacing="0" align=center border=1>
	<tr align="center" valign="middle">
		<td colspan="5">외박신청 게시판</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">글쓴이</div>
		</td>
		<td>
			<input name="S_BOARD_NAME" id="board_name" type="text" size="10" maxlength="10" 
				value="${sessionScope.sessionName }"  readonly/>
		</td>
	</tr>
	<!-- 학번 -->
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">학번</div>
		</td>
		<td>
			<input name="S_BOARD_HAKNUM" id="S_board_haknum" type="text" size="10" maxlength="10" 
				value="${sessionScope.sessionHaknum }"  readonly/>
		</td>
	</tr>

	
	<!-- 학과 -->
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">학과</div>
		</td>
		<td>
			<!--<input name="S_BOARD_MAJOR" id="s_board_major" type="text" size="10" maxlength="10" 
				value=""/>-->
			<select name="S_BOARD_MAJOR" id="s_board_major">
				<option value="default" selected="true">선택하세요.</option>
				<option value="컴퓨터공학과">컴퓨터공학과</option>
				<option value="경영학과">경영학과</option>
				<option value="체육학과">체육학과</option>
				<option value="영어영문학과">영어영문학과</option>
				<option value="기계공학과">기계공학과</option>
			</select>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">제 목</div>
		</td>
		<td>
			<input name="S_BOARD_SUBJECT" id="s_board_subject" type="text" size="50" maxlength="100" 
				value=""/>
		</td>
	</tr>
	<!-- 외박 타입 -->
	<tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">외박타입</div>
		</td>
		<td>
			<!--<input name="BOARD_SUBJECT" id="board_subject" type="text" size="50" maxlength="100" 
				value=""/>-->
			<input type="radio" name="S_SLEEP_TYPE" value="일반 외박" checked="true">일반 외박 &nbsp;&nbsp;
			<input type="radio" name="S_SLEEP_TYPE" value="특별 외박">특별 외박 &nbsp;&nbsp;
			<input type="radio" name="S_SLEEP_TYPE" value="기타 외박">기타 외박 &nbsp;&nbsp;
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">내 용</div>
		</td>
		<td>
			<textarea name="S_BOARD_CONTENT" id="s_board_content" cols="67" rows="15"></textarea>
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">외박날짜</div>
		</td>
		<td>
			시작날짜 : <input type="textfield" name="S_START_DATE" id="s_start_date">
			종료날짜 : <input type="textfield" name="S_END_DATE" id="s_end_date">
		</td>
	</tr>

	<tr>
		<td colspan="2" style="height:1px;">
		</td>
	</tr>
	<tr><td colspan="2">&nbsp;</td></tr>
	<tr align="center" valign="middle" bgcolor="#FF00CC">
		<td colspan="5">			
			<input type=submit value="등록">
			<input type=reset value="취소">
		</td>
	</tr>
</table>
</form>
</div>
</body>
</html>