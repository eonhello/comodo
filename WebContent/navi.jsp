<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="A layout example that shows off a responsive email layout.">
    <title>Email &ndash; Layout Examples &ndash; Pure</title>

    <link rel="stylesheet" href="https://unpkg.com/purecss@0.6.1/build/pure-min.css" integrity="sha384-" crossorigin="anonymous">



        <!--[if lte IE 8]>
            <link rel="stylesheet" href="css/layouts/email-old-ie.css">
        <![endif]-->
        <!--[if gt IE 8]><!-->
            <link rel="stylesheet" href="<c:url value='/C_Board/css/layouts/pure_main.css' />">
        <!--<![endif]-->
</head>
<body>






<div id="layout" class="content pure-g">
    <div id="nav" class="pure-u">
        <a href="#" class="nav-menu-button">Menu</a>

        <div class="nav-inner">
            <button class="primary-button pure-button">로그인</button>
            <button class="primary-button pure-button">회원가입</button>

            <div class="pure-menu">
                <ul class="pure-menu-list">
                    <li class="pure-menu-item"><a href="#" class="pure-menu-link">
                      공지사항</a></li>
                    <li class="pure-menu-item"><a href="#" class="pure-menu-link">질의응답</a></li>
                    <li class="pure-menu-item"><a href="#" class="pure-menu-link">자유게시판</a></li>
                    <li class="pure-menu-item"><a href="/sleep/Sleep_List_Action.sl" class="pure-menu-link">외박신청</a></li>
                    <li class="pure-menu-item"><a href="#" class="pure-menu-link">시설현황</a></li>
                    <li class="pure-menu-heading">Labels</li>
                    <li class="pure-menu-item"><a href="#" class="pure-menu-link"><span class="email-label-personal"></span>Personal</a></li>
                    <li class="pure-menu-item"><a href="#" class="pure-menu-link"><span class="email-label-work"></span>Work</a></li>
                    <li class="pure-menu-item"><a href="#" class="pure-menu-link"><span class="email-label-travel"></span>Travel</a></li>
                </ul>
            </div>
        </div>
    </div>



  </div>

</div>

</body>
</html>