<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="db.board.sleep.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>MVC 게시판</title>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
	<script type="text/javascript" src="calendar.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
	
	<script>
		$(document).ready(function(){
			$("form").submit(function(){
				if($("#s_board_password").val()==""){
					alert("비밀번호를 확인 하세요.");
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
	$(function(){
		$(".datepicker").datepicker({
			dateFormat: "yy-mm-dd"
		});
	});
	</script>
	
</head>
<body>

<form action="/GitTest/Sleep_Modify_Action.sl" method="post" name="boardform">
<input type="hidden" name="num" value="${boarddata.s_board_num}">
<input type="hidden" name=page value="${page}">
<table cellpadding="0" cellspacing="0" align=center border=1>
	<tr align="center" valign="middle">
		<td colspan="5">외박신청 게시판</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">글쓴이</div>
		</td>
		<td>
			<input name="S_BOARD_NAME" id="s_board_name" type="text" size="10" maxlength="10" 
				value=""  />
		</td>
	</tr>
	<!-- 학번 -->
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">학번</div>
		</td>
		<td>
			<input name="S_BOARD_HAKNUM" id="S_board_haknum" type="text" size="10" maxlength="10" 
				value=""   />
		</td>
	</tr>

	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">비밀번호</div>
		</td>
		<td>
			<input name="S_BOARD_PASSWORD" id="s_board_password" type="password" size="10" maxlength="10" 
				value=""/>
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
			시작날짜 : <input type="textfield" name="S_START_DATE" id="s_start_date" class="datepicker">
			종료날짜 : <input type="textfield" name="S_END_DATE" id="s_end_date" class="datepicker">
		</td>
	</tr>
	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">게시일</div>
		</td>
		<td>
			<input name="S_BOARD_DATE" id="s_board_date" type="text" size="50" maxlength="100" 
				value=""/>
		</td>
	</tr>

	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">승인여부</div>
		</td>
		<td>
			<!-- if문써서 승인, 거절 바꿔보기 -->
			<input name="S_CONFIRM" id="s_confirm" type="text" size="50" maxlength="100" 
				value="1"   />
		</td>
	</tr>
	<!-- 승인날짜 -->
	<tr>
		<td style="font-family:돋음; font-size:12">
			<div align="center">승인날짜</div>
		</td>
		<td>
			<input name="S_CONFIRM_DATE" id="s_confirm_date" type="text" size="50" maxlength="100" 
				value=""/>
		</td>
	</tr>

	<tr>
		<td style="font-family:돋음; font-size:12" height="16">
			<div align="center">취소여부</div>
		</td>
		<td>
			<!-- if문써서 취소, null 바꿔보기 -->
			<input name="S_CANCEL" id="s_cancel" type="text" size="50" maxlength="100" 
				value="1"   />
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

<p>Date : <input type="textfield" class="datepicker"></p>
</body>
</html>