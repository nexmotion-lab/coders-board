<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="/lib/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/js/auth/login.js"></script>
</head>
<body>
<form id="frm" method="post" action="/auth/proc">
    사용자 아이디 : <input type="text" name="username" id="username" /> </br>
    비밀번호 : <input type="password" name="password" id="password" /> </br>
    <input type="button" id="login" value="로그인"/>
</form>
</body>
</html>
