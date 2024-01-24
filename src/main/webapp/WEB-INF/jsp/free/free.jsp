<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="/lib/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/js/free/free.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <title>free</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="d-flex">
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>
    <%--main-content--%>
    <main class="flex-grow-1 p-4">
        <div class="card">
            <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
                <h3 class="card-title mt-2">자유게시판</h3>
                <button type="button" class="btn btn-primary">
                    <a href="/freeWrite" class="nav-link">작성</a>
                </button>
            </div>

            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th style="width: auto">NO</th>
                        <th style="width: auto">제목</th>
                        <th style="width: auto">작성자</th>
                        <th style="width: auto">등록일</th>
                        <th style="width: auto">첨부파일</th>
                        <th style="width: auto">조회수</th>
                    </tr>
                    </thead>
                    <tbody id="freeTable">
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

    <script src="/lib/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>
