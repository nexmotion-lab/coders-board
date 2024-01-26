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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <title>freeWrite</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="d-flex">
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>

    <%--main-content--%>
    <main class="flex-grow-1 p-4">
        <div class="d-flex justify-content-between">
            <div class="fs-3 fw-bold h3" style="color: #001F99">자유게시판</div>
            <input type="submit" class="btn btn-primary pt-0 pb-0" value="등록">
        </div>
        <div class="border-top border-bottom border-2 border-secondary mt-3" style="min-height: 75%">
            <div class="border-bottom border-2 pt-3 pb-3">
                <input class="text-secondary border-0 fw-bold p-2 w-100" style="background-color: #f1f1f1" placeholder="제목을 입력하세요"></input>
            </div>
            <div class="card-body">
                <form action="" method="POST">
                    <textarea name="text" id="editor"></textarea>

                </form>
            </div>
        </div>
    </main>
</div>

<script>
    ClassicEditor.create( document.querySelector( '#editor' ) );
</script>
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>