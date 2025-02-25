<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/login.css">
</head>
<body>
<div class="container">
    <div class="loginbox">
        <div class="logo" style="text-align: center">
            <img src="images/GetSetGOnotext.png">
        </div>
        <c:choose>
            <c:when test="${findId == null || findId == ''}">
                 <h2 style="text-align: center"> 가입된 아이디가 없습니다. </h2>
                <a href="joinForm" class="btn" style="display: flex;  width: 320px;
         justify-content: center;  align-items: center;text-decoration: none;" size=40>회원가입하러 가기</a>
                <a href="findId" class="btn" style="display: flex;  width: 320px;
         justify-content: center;  align-items: center;text-decoration: none;" size=40>이전으로</a>
            </c:when>
            <c:otherwise>
                <h2 style="font-weight: bold; text-align: center">귀하의 아이디는</h2>
                <input type="text" value="${findId}" size="44" style="height: 40px;
                        outline: none;border: 1px solid #cccccc; margin-bottom: 5px;" name="name" readonly/><br><br>
                <a href="loginForm" class="btn" style="display: flex;  width: 320px;
         justify-content: center;  align-items: center;text-decoration: none;" size=40>로그인하러 가기</a>
            </c:otherwise>
        </c:choose>
    </div>
  </div>
 </body>
</html>
