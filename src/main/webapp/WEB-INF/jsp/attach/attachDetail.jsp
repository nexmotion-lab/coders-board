<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <script src="/lib/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/js/free/freeDetails.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="/lib/admin/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <title>자유게시판 상세보기</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="d-flex">
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>

    <main class="flex-grow-1 p-4 pb-0">
        <div class="fs-3 fw-bold h3" style="color: #001F99">자료실</div>
        <div id="postDetail" class="border-top border-bottom border-2 border-secondary mt-3" style="min-height: 75%">
            <!-- 여기에 동적으로 채워질 내용 -->
        </div>
        <div class="p-2">
            <div class="fw-bold mt-2">이전글</div>
            <div class="fw-bold mt-3">다음글</div>
        </div>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
