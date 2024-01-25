<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <title>삼육대학교 컴퓨터학과 게시판</title>
</head>
<body>
    <%--해더부분--%>
    <%@ include file="/WEB-INF/jsp/common/header.jsp" %>

    <div class="d-flex">
        <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>
    
        <%--main-content--%>
        <main class="flex-grow-1 p-4">
            <img src="${pageContext.request.contextPath}/img/suya.png" alt="SUYA" style="max-width: 100%; height: auto; display: block; margin: 250px auto;">
        </main>
    </div>

    <%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

    <script src="/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
