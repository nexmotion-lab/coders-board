<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
        <div class="card">
            <div class="card-header" style="display: flex; justify-content: space-between; align-items: center;">
                <h3 class="card-title mt-2">자유게시판</h3>
                <button type="submit" class="btn btn-primary" onclick="submitForm()">
                    <a href="/free" class="nav-link">등록</a>
                </button>
            </div>

            <div class="card-body">

                <form id="postForm" action="/free/insert" method="post">
                    <input type="text" id="postTitle" name="postTitle" style="width: 1140px; border: none;" class="p-3 mb-3 bg-secondary-subtle" placeholder="제목을 입력하세요" required><br>
                    <textarea id="postContent" name="postContent" rows="17" style="width: 1140px;" class="p-3" placeholder="내용을 입력하세요" required></textarea><br>
                </form>

            </div>

        </div>
    </main>
</div>

<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script>
    function submitForm() {
        // 입력된 데이터 가져오기
        var postTitle = $("#postTitle").val();
        var postContent = $("#postContent").val();

        // Ajax를 사용하여 서버에 데이터 전송
        $.ajax({
            type: "POST",
            url: "/free/insert",
            data: {
                postTitle: postTitle,
                postContent: postContent
            },
            success: function(response) {
                // 성공적으로 응답 받은 경우 처리
                console.log(response);
                // 페이지 새로고침 또는 필요한 동작 수행
            },
            error: function(error) {
                // 오류 발생 시 처리
                console.error(error);
            }
        });
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>