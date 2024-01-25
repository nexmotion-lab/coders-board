<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 로그인</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Theme style -->
    <link rel="stylesheet" href="/css/admin/adminlte.min.css">
    <!-- SweetAlert2 -->
    <link href="/css/sweetalert2.css" rel="stylesheet" type="text/css">

    <script src="/lib/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/js/auth/login.js"></script>
</head>
<body class="login-page bg-secondary">
<div class="login-box">
    <div class="card">
        <div class="card-body">
            <form class="m-5" id="frm" method="post" action="/auth/proc">
                <div>
                    <!--justify-content-center-->
                    <img class="d-flex ml-auto mr-auto pb-3 w-50" src="${pageContext.request.contextPath}/img/syu_logo.png" alt="Logo">
                </div>
                <div class="input-group mb-2">
                    <input type="email" class="form-control" placeholder="이메일" name="username" id="username" />
                </div>
                <div class="input-group mb-2">
                    <input type="password" class="form-control" placeholder="비밀번호" name="password" id="password" /> </br>
                </div>
                <div>
                    <input type="button" class="btn btn-block text-white" name="login" id="login" value="로그인" style="background-color: #001F99">
                </div>
                <div class="m-3">
                    <a href="" class="d-flex justify-content-center font-weight-bold" style="color: #001F99; text-decoration: underline">회원가입하기</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
