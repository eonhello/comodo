<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>		
	
	<%--  <c:out value="${menu}"/>   --%>
	  
	<!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/index.jsp">COMODO</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
          
     		<c:set var="menuUrl" value="${pageContext.request.requestURL}"/>       
			 <%-- <c:out value="${menuUrl }"/>  --%>


			<c:choose>
				<c:when test="${fn:contains(menuUrl,'Noti')}">
					<li id="noti" class="active" ><a href="#about">공지사항</a></li>
					<li id="sleep"><a href="/sleep/Sleep_List_Action.sl">외출/외박</a></li>
					<li id="free" ><a href="/free/FList.fr">자유게시판</a></li>
					<li id="qna"><a href="/qna/QnA_List.qa">QnA</a></li>
					<li id="fac" ><a href="#contact">시설관리</a></li>	
				</c:when>
				<c:when test="${fn:contains(menuUrl,'Sleep')}">
					<li id="noti"><a href="#about">공지사항</a></li>
					<li id="sleep" class="active"><a href="/sleep/Sleep_List_Action.sl">외출/외박</a></li>
					<li id="free" ><a href="/free/FList.fr">자유게시판</a></li>
					<li id="qna"><a href="/qna/QnA_List.qa">QnA</a></li>
					<li id="fac" ><a href="#contact">시설관리</a></li>	
				</c:when>
				<c:when test="${fn:contains(menuUrl,'Free')}">
					<li id="noti"><a href="#about">공지사항</a></li>
					<li id="sleep"><a href="/sleep/Sleep_List_Action.sl">외출/외박</a></li>
					<li id="free"  class="active"  ><a href="/free/FList.fr">자유게시판</a></li>
					<li id="qna"><a href="/qna/QnA_List.qa">QnA</a></li>
					<li id="fac" ><a href="#contact">시설관리</a></li>	
				</c:when>
				<c:when test="${fn:contains(menuUrl,'QnA')}">
					<li id="noti"><a href="#about">공지사항</a></li>
					<li id="sleep"><a href="/sleep/Sleep_List_Action.sl">외출/외박</a></li>
					<li id="free" ><a href="/free/FList.fr">자유게시판</a></li>
					<li id="qna" class="active"><a href="/qna/QnA_List.qa">QnA</a></li>
					<li id="fac" ><a href="#contact">시설관리</a></li>	
				</c:when>
				<c:when test="${fn:contains(menuUrl,'Fac')}">
					<li id="noti"><a href="#about">공지사항</a></li>
					<li id="sleep"><a href="/sleep/Sleep_List_Action.sl">외출/외박</a></li>
					<li id="free" ><a href="/free/FList.fr">자유게시판</a></li>
					<li id="qna"><a href="/qna/QnA_List.qa">QnA</a></li>
					<li id="fac" class="active"  ><a href="#contact">시설관리</a></li>	
				</c:when>												

				<c:otherwise>
          		    <li id="noti"><a href="#about">공지사항</a></li>
        			<li id="sleep"><a href="/sleep/Sleep_List_Action.sl">외출/외박</a></li>
        			<li id="free" ><a href="/free/FList.fr">자유게시판</a></li>
        			<li id="qna"><a href="/qna/QnA_List.qa">QnA</a></li>
        			<li id="fac" ><a href="#contact">시설관리</a></li>	
				</c:otherwise>
			</c:choose>


			
          	<%-- <c:if test="${!fn:contains(menuUrl,'QnA') && !fn:contains(menuUrl,'Free')}" >
          		    <li id="noti"><a href="#about">공지사항</a></li>
        			<li id="sleep"><a href="#contact">외출/외박</a></li>
        			<li id="free" ><a href="#contact">자유게시판</a></li>
        			<li id="qna"><a href="/qna/QnA_List.qa">QnA</a></li>
        			<li id="fac" ><a href="#contact">시설관리</a></li>	
          	</c:if>

          	<c:if test="${fn:contains(menuUrl,'Noti')}" >
          		    <li id="noti" class="active" ><a href="#about">공지사항</a></li>
        			<li id="sleep"><a href="#contact">외출/외박</a></li>
        			<li id="free" ><a href="#contact">자유게시판</a></li>
        			<li id="qna"><a href="/qna/QnA_List.qa">QnA</a></li>
        			<li id="fac" ><a href="#contact">시설관리</a></li>	
          	</c:if>
          	<c:if test="${fn:contains(menuUrl,'Sleep')}" >
          		    <li id="noti"><a href="#about">공지사항</a></li>
        			<li id="sleep"  class="active"><a href="#contact">외출/외박</a></li>
        			<li id="free" ><a href="#contact">자유게시판</a></li>
        			<li id="qna" ><a href="/qna/QnA_List.qa">QnA</a></li>
        			<li id="fac" ><a href="#contact">시설관리</a></li>	
          	</c:if>          				
          	<c:if test="${fn:contains(menuUrl,'Free')}" >
          		    <li id="noti"><a href="#about">공지사항</a></li>
        			<li id="sleep"><a href="#contact">외출/외박</a></li>
        			<li id="free" class="active" ><a href="#contact">자유게시판</a></li>
        			<li id="qna" ><a href="/qna/QnA_List.qa">QnA</a></li>
        			<li id="fac" ><a href="#contact">시설관리</a></li>	
          	</c:if>
          	<c:if test="${fn:contains(menuUrl,'QnA')}" >
          		    <li id="noti"><a href="#about">공지사항</a></li>
        			<li id="sleep"><a href="#contact">외출/외박</a></li>
        			<li id="free" ><a href="#contact">자유게시판</a></li>
        			<li id="qna" class="active" ><a href="/qna/QnA_List.qa">QnA</a></li>
        			<li id="fac" ><a href="#contact">시설관리</a></li>	
          	</c:if>          	
           	<c:if test="${fn:contains(menuUrl,'Fac')}" >
          		    <li id="noti"><a href="#about">공지사항</a></li>
        			<li id="sleep"><a href="#contact">외출/외박</a></li>
        			<li id="free" ><a href="#contact">자유게시판</a></li>
        			<li id="qna" ><a href="/qna/QnA_List.qa">QnA</a></li>
        			<li id="fac" class="active" ><a href="#contact">시설관리</a></li>	
          	</c:if>         --%>   	
          	

				<%-- <%@include file="./sub_nav.jsp" %> --%>

         		
            <!-- <li id="home" class="active"><a href="/qna/QnA_List.qa?manu=home">Home</a></li> -->
             
            <!-- <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li> -->
          </ul>
          <ul class="nav navbar-nav navbar-right">
                     
             <c:if test="${empty sessionScope.sessionHaknum}">
            	<li class="active"><a href="/Member/Login/LoginMain.jsp">로그인<span class="sr-only">(current)</span></a></li>
          	</c:if>          
            <c:if test="${!empty sessionScope.sessionHaknum}">
            	<li class="active"><a href="/memModify.mem">회원정보<span class="sr-only">(current)</span></a></li>
            	<li class="active"><a href="/Member/Login/Logout.jsp">로그아웃<span class="sr-only">(current)</span></a></li>
          	</c:if>
         	
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
