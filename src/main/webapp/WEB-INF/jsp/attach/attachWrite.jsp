<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="/ckeditor5/build/ckeditor.js"></script>
    <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="/js/attach/attachWrite.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/attach/attachWrite.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <style>
        .ck-editor__editable { height: 400px; }
        .ck-content { font-size: 12px; }

    </style>
    <title>자료실</title>
</head>
<body>
<%--해더부분--%>
<%@ include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="tw-mt-[127px] tw-w-full tw-flex tw-flex-row tw-w-full tw-max-w-[80%] lg:tw-min-w-[1250px] tw-items-start tw-justify-between tw-mx-auto tw-gap-[30px] !tw-z-[99]" >
    <%@ include file="/WEB-INF/jsp/common/leftMenu.jsp" %>

    <%--main-content--%>
    <main class="flex-grow-1 p-4">
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">자료실 글 작성</h3>
            </div>
            <div class="card-body">
                <form id="postForm" action="/attach/insert" method="POST">
                    <input type="text" id="postTitle" name="postTitle" class="p-3 mb-3 bg-secondary-subtle" placeholder="제목을 입력하세요" required><br>
                    <textarea name="postContent" id="postContent"></textarea>
                    <p class="submit" style="text-align: right;">
                        <input type="submit" value="등록" class="btn btn-primary submit-button" onclick="submitForm()" >
                    </p>
                </form>
            </div>
            <%--            <div class="card-footer clearfix"></div>--%>
        </div>
    </main>
</div>
<script>
    ClassicEditor.create( document.querySelector( '#postContent' ) );
    function submitForm() {
        // 입력된 데이터 가져오기
        let postTitle = $("#postTitle").val();
        let postContent = $("#postContent").val();

        // Ajax를 사용하여 서버에 데이터 전송
        $.ajax({
            type: "POST",
            url: "/attach/insert",
            data: {
                postAuthor: "이세진",
                postTitle: postTitle,
                postContent: postContent
            },
            success: function(response) {
                // 성공적으로 응답 받은 경우 처리
                console.log(response);
                // 페이지 새로고침 또는 필요한 동작 수행
                // 리다이렉트 수행
                window.location.href = "/attach";
            },
            error: function(error) {
                // 오류 발생 시 처리
                console.error(error);
            }
        });
        // 리다이렉트 수행
        window.location.href = "/attach";
    }
</script>
<%@ include file="/WEB-INF/jsp/common/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>
