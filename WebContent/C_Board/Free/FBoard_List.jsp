<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
 
<style type="text/css">
@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);
body {
    font-family: 'Nanum Gothic', sans-serif;
}
 
</style>

<script type="text/javascript">
	function move(url){
		location.href=url;
	}

</script>

</head>
 
<body>
    <table class="bbs" width="800" height="200" border="2" bgcolor="FFFFFF">
        <colgroup>
            <col width="50" />
            <col width="450" />
            <col width="100" />
            <col width="100" />
        </colgroup>
        <thead>
            <tr>
                <th>번 호</th>
                <th>제 목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조 회</th>
            </tr>
        </thead>
        <tbody>
            <tr>
				<td align="center">3</td>
				<td><a href = "FBoard_View.jsp">글글글</a></td>
				<td align="center">작성자3</td>
				<td align="center">2016/12/15</td>
				<td align="center">232</td>
			</tr>
            <tr>
				<td align="center">2</td>
				<td><a href = "FBoard_View.jsp">글글글</a></td>
				<td align="center">작성자2</td>
				<td align="center">2016/12/15</td>
				<td align="center">2552</td>
			</tr>
            <tr>
				<td align="center">1</td>
				<td><a href = "FBoard_View.jsp">글글글</a></td>
				<td align="center">작성자1</td>
				<td align="center">2016/12/15</td>
				<td align="center">22</td>
			</tr>
        </tbody>
        <tfoot>
        	<tr>
        		<td align = "center" colspan="5">1</td>
  			</tr>      		 
        </tfoot>
    </table>
    	<input type="button" value="처음으로" onclick="move('FBoard_List.jsp');"/>
   		<input type="button" value="글쓰기" onclick="move('FBoard_Write.jsp');"/>
</body>
</html>