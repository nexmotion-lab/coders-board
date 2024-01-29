<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="/ckeditor5/build/ckeditor.js"></script>
    <script src="/lib/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="/js/auth/freeWrite.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <link rel="stylesheet" href="/lib/admin/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <link href="/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .ck-editor__editable { height: 400px; }
        .ck-content { font-size: 12px; }

    </style>
    <title>자유게시판</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="tw-mt-[127px] tw-w-full tw-flex tw-flex-row tw-w-full tw-max-w-[80%] lg:tw-min-w-[1250px] tw-items-start tw-justify-between tw-mx-auto tw-gap-[30px] !tw-z-[99]" >
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>

    <%--main-content--%>
    <main class="flex-grow-1 p-4">
        <div class="card">
            <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
                <h3 class="card-title">자유게시판</h3>
            </div>

            <div class="card-body">

                <form action="WriteServlet" method="post">
                    <input type="text" id="title" name="title" style="width: 1140px; border: none;" class="p-3 mb-3 bg-secondary-subtle" placeholder="제목을 입력하세요" required><br>
                    <textarea id="content" name="content" rows="17" style="width: 1140px;" class="p-3" placeholder="내용을 입력하세요" required></textarea><br>
                    <p class="submit" style="text-align: right;">
                        <input type="submit" value="등록" class="btn btn-primary submit-button" onclick="submitForm()" >
                    </p>
                </form>

            </div>
        </div>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>